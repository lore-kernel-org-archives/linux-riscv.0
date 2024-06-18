Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B0C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THjk8Bcfs6jfLgTBuk87+ljAIK7E0AOvVLSh6D1e9kI=; b=3EhzuAEppBX7ex
	kc8z+5v+6aA0shZe7RHjZAfmB/0h9e3+7wsa6flBrQguEmJRVo/M7ueCM2uueaaY8XGnK/2urrnTZ
	JleLVBhzk5OQ8S2MAqTfPLskmafPgvEZNb9XyJO3xuYLsJrFy5L9TJM8hDZ1fLreFXKNyjJG0zbNY
	MDtgdMVfZFf+L1CE6sMUT7xboW3/Gwj2ZUoemCeTjzmFB5mSJRcN5dyoyZskMjpsQLVCZbkn7vlXd
	3pOmsz4bnnbUO0so8aqlKWWEutln3+boAyHt1qu3U34ExOYZGo3n4MA7EJpKwFBazLwhYXCVlZ4T7
	EUJKM0loRCpjqrCsPEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTlf-0000000E2Fy-2HzH;
	Tue, 18 Jun 2024 08:00:39 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTlc-0000000E2F9-1VVW
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 08:00:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64594C0003;
	Tue, 18 Jun 2024 08:00:32 +0000 (UTC)
Message-ID: <e803ce2a-d76a-46da-92a4-11edf1e8ca7a@ghiti.fr>
Date: Tue, 18 Jun 2024 10:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, jesse@rivosinc.com
Cc: cyy@cyyself.name, Evan Green <evan@rivosinc.com>, aou@eecs.berkeley.edu,
 ajones@ventanamicro.com, andy.chiu@sifive.com, cleger@rivosinc.com,
 Conor Dooley <conor.dooley@microchip.com>, costa.shul@redhat.com,
 corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 samitolvanen@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <mhng-16df84df-80ef-44a9-8f04-18d81b914b24@palmer-ri-x1c9>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-16df84df-80ef-44a9-8f04-18d81b914b24@palmer-ri-x1c9>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_010036_727566_7D46CF3F 
X-CRM114-Status: GOOD (  39.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03/06/2024 20:05, Palmer Dabbelt wrote:
> On Mon, 03 Jun 2024 10:57:21 PDT (-0700), Palmer Dabbelt wrote:
>> On Wed, 29 May 2024 20:36:45 PDT (-0700), cyy@cyyself.name wrote:
>>> On 2024/5/30 02:26, Evan Green wrote:
>>>> RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
>>>> hwprobe_key_is_bitmask(), when in reality it was an enum value. This
>>>> causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
>>>> since SLOW, FAST, and EMULATED have values whose bits overlap with
>>>> each other. If the caller asked for the set of CPUs that was SLOW or
>>>> EMULATED, the returned set would also include CPUs that were FAST.
>>>>
>>>> Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
>>>> returns the same values in response to a direct query (with no flags),
>>>> but is properly handled as an enumerated value. As a result, SLOW,
>>>> FAST, and EMULATED are all correctly treated as distinct values under
>>>> the new key when queried with the WHICH_CPUS flag.
>>>>
>>>> Leave the old key in place to avoid disturbing applications which may
>>>> have already come to rely on the broken behavior.
>>>>
>>>> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
>>>> Signed-off-by: Evan Green <evan@rivosinc.com>
>>>>
>>>> ---
>>>>
>>>>
>>>> Note: Yangyu also has a fix out for this issue at [1]. That fix is much
>>>> tidier, but comes with the slight risk that some very broken userspace
>>>> application may break now that FAST cpus are not included for the query
>>>> of which cpus are SLOW or EMULATED.
>>> Indeed. Since the value of FAST is 0b11, the SLOW and EMULATED are 0b10 and
>>> 0b01 respectively.
>>>
>>> When this key is treated as a bitmask and query with
>>> RISCV_HWPROBE_WHICH_CPUS if a CPU has a superset bitmask of the requested
>>> value on the requested key, it will remain in the CPU mask. Otherwise, the
>>> CPU will be clear in the CPU mask. But when a key is treated as a value, we
>>> will just do a comparison. if it is not equal, then the CPU will be clear
>>> in the CPU. That's why FAST cpus are included when querying with SLOW or
>>> EMULATED with RISCV_HWPROBE_KEY_CPUPERF_0 key now.
>>>
>>> For me, deprecating the original hwprobe key and introducing a new key
>>> would be a better solution than changing the behavior as my patch did.
>> OK.  I don't have a strong feeling either way: if someone has code that
>> tries to read this as a btimask then it'd be broken, but it would
>> technically be following the docs.
>>
>> That said, we're relying on this as a pretty core userspace portability
>> construct.  So maybe the right answer here is to just be really strict
>> about compatibility and eat the pain when we make a mistake, just to
>> make sure we set the right example about not breaking stuff.
>>
>> So unless anyone's opposed, I'll pick this up for 6.11.
> Though a few of us were talking and it looks like it's probably best to
> just make this extensible and put the vector stuff in here too.  So
> something like
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index df5045103e73..e74727e1b7c0 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -211,25 +211,30 @@ The following keys are defined:
>        :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
>        classified as a bitmask rather than a value.
>
> -* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
> -  performance of misaligned scalar accesses on the selected set of processors.
> +* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An set of enum values describing the
> +  performance of misaligned accesses on the selected set of processors.
>
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> +  * :c:macro: `RISCV_HWPROBE_SCALAR_MISALIGNED_MASK`: Describes the performance
> +    of scalar misaligned accesses.
> +
> +  * :c:macro:`RISCV_HWPROBE_SCALAR_MISALIGNED_UNKNOWN`: The performance of misaligned
>       accesses is unknown.
>
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
> +  * :c:macro:`RISCV_HWPROBE_SCALAR_MISALIGNED_EMULATED`: Misaligned accesses are
>       emulated via software, either in or below the kernel.  These accesses are
>       always extremely slow.
>
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
> +  * :c:macro:`RISCV_HWPROBE_SCALAR_MISALIGNED_SLOW`: Misaligned accesses are slower
>       than equivalent byte accesses.  Misaligned accesses may be supported
>       directly in hardware, or trapped and emulated by software.
>
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
> +  * :c:macro:`RISCV_HWPROBE_SCALAR_MISALIGNED_FAST`: Misaligned accesses are faster
>       than equivalent byte accesses.
>
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
> +  * :c:macro:`RISCV_HWPROBE_SCALAR_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
>       not supported at all and will generate a misaligned address fault.
>
> +  * :c:macro: `RISCV_HWPROBE_VECTOR_MISALIGNED_MASK`: ... vector ...
> +
>   * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>     represents the size of the Zicboz block in bytes.
>
> Jesse is looking at the vector misaligned stuff that's showing up on the
> hardware, so I'll just hold off on this for a bit -- that way we can get
> the vector stuff sorted out at the same time.


Can we merge this fix in 6.10-rcX? And add Jesse's patches on top of that?

This sounds like something we want to get fixed asap.

Thanks,

Alex


>>>> I wanted to get this fix out so that
>>>> we have both as options, and can discuss. These fixes are mutually
>>>> exclusive, don't take both.
>>> It's better to note this strange behavior on
>>> Documentation/arch/riscv/hwprobe.rst so users can quickly understand the
>>> differences on the behavior of these two keys.
>>>
>>> The C code part looks good to me.
>>>
>>>> [1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/
>>>>
>>>> ---
>>>> Documentation/arch/riscv/hwprobe.rst | 8 ++++++--
>>>> arch/riscv/include/asm/hwprobe.h | 2 +-
>>>> arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>>>> arch/riscv/kernel/sys_hwprobe.c | 1 +
>>>> 4 files changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
>>>> index 204cd4433af5..616ee372adaf 100644
>>>> --- a/Documentation/arch/riscv/hwprobe.rst
>>>> +++ b/Documentation/arch/riscv/hwprobe.rst
>>>> @@ -192,8 +192,12 @@ The following keys are defined:
>>>> supported as defined in the RISC-V ISA manual starting from commit
>>>> d8ab5c78c207 ("Zihintpause is ratified").
>>>>
>>>> -* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>>>> - information about the selected set of processors.
>>>> +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
>>>> + :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
>>>> + classified as a bitmask rather than a value.
>>>> +
>>>> +* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
>>>> + performance of misaligned scalar accesses on the selected set of processors.
>>>>
>>>> * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
>>>> accesses is unknown.
>>>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
>>>> index 630507dff5ea..150a9877b0af 100644
>>>> --- a/arch/riscv/include/asm/hwprobe.h
>>>> +++ b/arch/riscv/include/asm/hwprobe.h
>>>> @@ -8,7 +8,7 @@
>>>>
>>>> #include <uapi/asm/hwprobe.h>
>>>>
>>>> -#define RISCV_HWPROBE_MAX_KEY 6
>>>> +#define RISCV_HWPROBE_MAX_KEY 7
>>>>
>>>> static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>>>> {
>>>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
>>>> index dda76a05420b..bc34e33fef23 100644
>>>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>>>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>>>> @@ -68,6 +68,7 @@ struct riscv_hwprobe {
>>>> #define RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
>>>> #define RISCV_HWPROBE_MISALIGNED_MASK (7 << 0)
>>>> #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
>>>> +#define RISCV_HWPROBE_KEY_MISALIGNED_PERF 7
>>>> /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>>>>
>>>> /* Flags */
>>>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
>>>> index 969ef3d59dbe..c8b7d57eb55e 100644
>>>> --- a/arch/riscv/kernel/sys_hwprobe.c
>>>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>>>> @@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>>>> break;
>>>>
>>>> case RISCV_HWPROBE_KEY_CPUPERF_0:
>>>> + case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
>>>> pair->value = hwprobe_misaligned(cpus);
>>>> break;
>>>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
