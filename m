From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 07 Jun 2018 09:30:19 -0700 (PDT)
Subject: [PATCH 3/3] riscv: fix __user annotation for __copy_user()
In-Reply-To: <6a0ab99d-6e4d-eb80-bc4d-854d154ae827@wdc.com>
Message-ID: <mhng-497a442f-c0da-4f88-9b48-827c4f164ed1@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 04 Jun 2018 12:28:47 PDT (-0700), atish.patra at wdc.com wrote:
> On 6/4/18 12:09 PM, Luc Van Oostenryck wrote:
>> On Mon, Jun 04, 2018 at 11:46:50AM -0700, Atish Patra wrote:
>>> On 6/1/18 8:22 AM, Luc Van Oostenryck wrote:
>>>> __copy_user() is a function, written in assembly, used to copy
>>>> memory between kernel & user space. As such its to & from args
>>>> may both take a user pointer or a kernel pointer.
>>>>
>>>> However the prototype for this function declare these two args
>>>> as 'void __user *', which is no more & no less correct than
>>>> declaring them as 'void *'. In fact theer is no possible correct
>>>
>>> /s/theer/there
>>>
>>>> annotation for such a function.
>>>>
>>>> The problem is worked around here by declaring these args as
>>>> unsigned long and casting them to the right type in each of
>>>> two callers raw_copy_{to,from}_user() as some kind of cast would
>>>> be needed anyway.
>>>>
>>>> Note: another solution, maybe cleaner but slightly more complex,
>>>>         would be to declare two version of __copy_user,
>>>>         either in the asm file or via an alias, each having already
>>>>         the correct typing for raw_copy_{to,from}_user().
>>>>
>>>
>>> I feel that would be a better solution as it is implemented similarly
>>> in ARM as well.
>>>
>>> I am unable to understand how "unsigned long" is better than "void*".
>>> x86 implementation has both arguments as void*. Can you please clarify ?
>>
>> "better" is quite relative and it must be understood that sparse
>> allow to cast pointers o fany kinds to and from unsigned long
>> without any warnings (while doing a cast between different address
>> space will emit a warning unless you use '__force').
>>
>
> Got it.
>> As I tried to explain here above, the fact that this function is
>> declared as taking 2 __user pointers requires to use of casts
>> (ugly casts with __force) to get over the __user. By declaring
>> them as taking unsigned long, you still have to use casts but, IMO,
>> it's cleaner
>>
>
> Thanks for the detailed explanation.
>
>> Note: they're generic pointers/addresses anyway, they can't be
>>        dereferenced anyway so unsigned is as good as a plain void*
>>        or a void __user*
>> Note: using unsigned long here, fundamentally to bypass the __user,
>>        is the same as casting a const pointer back to a plain pointer
>>        via an intermediate cast to unsigned long. People can argue
>>        that's kinda cheating, and they would be right of course, but
>>        using __force or declaring twice the function with two different
>>        names and prototype is also a form of cheating.
>> Note: if this would be my code, I would choose the solution with
>>        two declarations.
>
> I prefer that as well.

I haven't compiled this, but I think it should work.  It's on the fix-sparse 
branch of kernel.org/palmer/linux.git .

commit 88ffc46f92c16db0fa37edb79038d37ced0a8b41
gpg: Signature made Thu 07 Jun 2018 09:29:02 AM PDT
gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
gpg:                issuer "palmer at dabbelt.com"
gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]
Author: Palmer Dabbelt <palmer@sifive.com>
Date:   Thu Jun 7 09:20:57 2018 -0700

    RISC-V: Split the definition of __copy_user
    
    We use a single __copy_user assembly function to copy memory both from
    and to userspace.  While this works, it triggers sparse errors because
    we're implicitly casting between the kernel and user address spaces by
    calling __copy_user.
    
    This patch splits the C declaration into a pair of functions,
    __asm_copy_{to,from}_user, that have sane semantics WRT __user.  This
    split tricks sparse into treating these function calls as safe.  The
    assembly implementation then just aliases these two symbols to
    __copy_user, which I renamed to __asm_copy_tofrom_user.  The result is
    an spare-safe implementation that pays to performance or code size
    penalty.
    
    Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 14b0b22fb578..0dbbbab05dac 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -392,19 +392,21 @@ do {								\
 })
 
 
-extern unsigned long __must_check __copy_user(void __user *to,
+extern unsigned long __must_check __asm_copy_from_user_user(void *to,
 	const void __user *from, unsigned long n);
+extern unsigned long __must_check __asm_copy_to_user_user(void __user *to,
+	const void *from, unsigned long n);
 
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	return __copy_user(to, from, n);
+	return __asm_copy_from_user(to, from, n);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	return __copy_user(to, from, n);
+	return __asm_copy_to_user(to, from, n);
 }
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 58fb2877c865..bd51e47ebd44 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -13,7 +13,15 @@ _epc:
 	.previous
 	.endm
 
-ENTRY(__copy_user)
+/* __asm_copy_to_user and __asm_copy_from_user are actually the same function,
+ * they're just provided as two different symbols to C code so sparse doesn't
+ * yell about casting between two different address spaces. */
+.global __asm_copy_to_user
+.set __asm_copy_to_user,__asm_copy_tofrom_user
+.global __asm_copy_from_user
+.set __asm_copy_from_user,__asm_copy_tofrom_user
+
+ENTRY(__asm_copy_tofrom_user)
 
 	/* Enable access to user memory */
 	li t6, SR_SUM
