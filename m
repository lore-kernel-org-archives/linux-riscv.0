From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 6 Sep 2018 06:24:20 -0700
Subject: [PATCH] y2038: Remove newstat family from default syscall set
In-Reply-To: <mhng-a047b20f-8546-4762-bcf0-f884be595b92@palmer-si-x1c4>
References: <mhng-a047b20f-8546-4762-bcf0-f884be595b92@palmer-si-x1c4>
Message-ID: <53e2e8eb-cd8e-1430-6935-1c039848e67b@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 09/06/2018 02:45 AM, Palmer Dabbelt wrote:
> On Sat, 01 Sep 2018 10:43:53 PDT (-0700), linux at roeck-us.net wrote:
>> Hi Arnd,
>>
>> On Fri, Apr 13, 2018 at 11:50:12AM +0200, Arnd Bergmann wrote:
>>> We have four generations of stat() syscalls:
>>> - the oldstat syscalls that are only used on the older architectures
>>> - the newstat family that is used on all 64-bit architectures but
>>> ? lacked support for large files on 32-bit architectures.
>>> - the stat64 family that is used mostly on 32-bit architectures to
>>> ? replace newstat
>>> - statx() to replace all of the above, adding 64-bit timestamps among
>>> ? other things.
>>>
>>> We already compile stat64 only on those architectures that need it,
>>> but newstat is always built, including on those that don't reference
>>> it. This adds a new __ARCH_WANT_NEW_STAT symbol along the lines of
>>> __ARCH_WANT_OLD_STAT and __ARCH_WANT_STAT64 to control compilation of
>>> newstat. All architectures that need it use an explict define, the
>>> others now get a little bit smaller, and future architecture (including
>>> 64-bit targets) won't ever see it.
>>>
>>
>> This patch causes my riscv boot tests to crash in -next
> 
> Ah, thanks for running these!
> 
>> sbin/init: error while loading shared libraries: libc.so.6: cannot stat shared object: Error 38
>> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
>>
>> The following change fixes the problem for me, but of course I have no idea
>> if it is correct. Copying RISC-V maintainers for input.
>>
>> Guenter
>>
>> ---
>> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
>> index 0caea01d5cca..eff7aa9aa163 100644
>> --- a/arch/riscv/include/asm/unistd.h
>> +++ b/arch/riscv/include/asm/unistd.h
>> @@ -16,6 +16,7 @@
>> ? * be included multiple times.? See uapi/asm/syscalls.h for more info.
>> ? */
>>
>> +#define __ARCH_WANT_NEW_STAT
>> ?#define __ARCH_WANT_SYS_CLONE
>> ?#include <uapi/asm/unistd.h>
>> ?#include <uapi/asm/syscalls.h>
> 
> I'm afraid I'm not sure what the right thing to do here is either, but from the patch description it does seem like we should have this guarded by an "#ifdef CONFIG_32BIT" so we can keep it out of our 32-bit ABI (which isn't in glibc yet, so isn't stable) in favor of statx() (or maybe stat64()?).? The one problem here is that I can't find "newstat" anywhere in glibc to verify it's actually supposed to be part of our 64-bit ABI, though I can find a bunch of references to "statx" that seem to indicate it's meant to be present.
> 
> That said, assuming you don't have anything wacky going on in userspace if this breaks the ABI then it breaks the ABI, so however newstat got into a binary we still need to keep it around.? Poking around my Fedora glibc image I see
> 

userspace is a root file system built with buildroot (modified to support riscv64),
using glibc 2.26. Nothing wacky, sorry.

Guenter
