Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19F0CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faEvUpw1fVL0JTOc7RwomHmS8Tkgydn64Eyodb9B1Vc=; b=PMrxrkCAEkhxHP
	lXE7a8M8TXfagdjYPUCdZRunFJ3qiprT5Trcsv6rnyHt9TIJaFfGQnrddb7+WZZXSrEYfYk+GRa+W
	HmPWiZIB7BAf+KK+Cdx5H/ajifB/dtCC13XCSklJa3+8HRhkDmSRxa2StRwRevpShJdc6H8kecoYH
	zsuCTDYnSMRk+irMSb4FwXBwytrZ7EM3UmdSd+s0adPpF+rKFrrkD5ea8ZYQ0t8D2Js3tOG/UUocS
	Qt97+tupQ+qHBdyYr2u9lEgaVhJpNBCpMrKITlwyNQZNm1g0yDxejrf7uX0YcQ264Zr2bT3dUVi8f
	Zyud+sgBFrpRtn+BcxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma13-0000000HTqK-2wb3;
	Thu, 14 Aug 2025 15:37:21 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umW2l-0000000Gjdm-3HjW
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 11:22:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3811642EF5;
	Thu, 14 Aug 2025 11:22:47 +0000 (UTC)
Message-ID: <18ea9e1c-ebf9-4a5e-8880-d1af9ea07138@ghiti.fr>
Date: Thu, 14 Aug 2025 13:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
To: Paris Oplopoios <parisoplop@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
 <20250813180545.110666-1-parisoplop@gmail.com>
 <bb580c80-5c6d-43f8-808a-e0d713f0be0c@ghiti.fr>
 <CAAbFZ0hK7uAm_jXoThK+tLsGzBrLSNr1=Gv8=H21D7DyODWB6g@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAAbFZ0hK7uAm_jXoThK+tLsGzBrLSNr1=Gv8=H21D7DyODWB6g@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetieeitefghfeuvddvjeeiudehheeiffffgeeviedtleehgeffgfdtveekteehudenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohephedprhgtphhtthhopehprghrihhsohhplhhophesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsv
 ghrkhgvlhgvhidrvgguuh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_042252_008126_5DCF18DA 
X-CRM114-Status: GOOD (  36.63  )
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

On 8/14/25 12:32, Paris Oplopoios wrote:
> Hello Alexandre,
>
>> trying to figure out if an extension is available will likely result in a SIGILL, so that will kill your application
> SIGILL can be captured with a signal handler and extension support can
> be checked this way. Not all extensions can be detected using this
> method, and it's much more straightforward to ask the kernel.
>
>> Why don't you check the kernel config or even the hwprobe.h header? Since basically here, you use a syscall to return an information that is visible already from userspace.
> To give an example, imagine a new extension Znew comes out, it
> occupies the bit 1<<59. Let's say my kernel version was built with
> support for detecting it and yours wasn't, but we both have the same
> hardware. I compile a binary of a program that wants to do runtime
> extension detection and I want to distribute it.
>
> If I use the config or the hwprobe.h header during compilation time,
> the compiled binary is assuming that both mine and your system have
> this new bit. So when my program tries to detect it, it will find it
> on my hardware but not yours. That's because my kernel was built to
> support this bit in hwprobe but yours wasn't.
>
> But in reality your hardware does have the extension. However, how
> will my program differentiate from "doesn't have an extension" and
> "kernel version not new enough"? Maybe I'd like to know that the
> kernel doesn't have the bit, and notify the user with an "update your
> kernel" message. Maybe I'd like to do the fallback SIGILL extension
> detection instead.


What about parsing the isa string? And do you have a real usecase in 
mind? I mean which project would benefit from this?


>
> PS: I'm assuming you meant checking config/hwprobe.h at compilation
> time. If you meant parsing it at runtime, that simply wouldn't be
> possible on all environments (think chroots).
>
> On Thu, 14 Aug 2025 at 12:37, Alexandre Ghiti <alex@ghiti.fr> wrote:
>> Hi Paris,
>>
>> On 8/13/25 20:05, offtkp wrote:
>>> When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
>>> bit in the resulting bitmask means the extension is not available or the
>>> kernel is not recent enough to support the bit. Currently, there's no
>>> way to differentiate between the two.
>>>
>>> This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
>>> which returns a bitmask of all the queryable extensions supported by the
>>> kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
>>> fallback extension detection method when the bit they want to query is
>>> not available in the kernel they are running on.
>>
>> Admittedly, I'm not convinced this is necessary. As you showed in your
>> v1, trying to figure out if an extension is available will likely result
>> in a SIGILL, so that will kill your application. Why don't you check the
>> kernel config or even the hwprobe.h header? Since basically here, you
>> use a syscall to return an information that is visible already from
>> userspace.
>>
>> But maybe I'm missing an interesting usecase, just let me know.
>>
>> Thanks,
>>
>> Alex
>>
>>
>>> Signed-off-by: offtkp <parisoplop@gmail.com>
>>> ---
>>> Changes in v2:
>>> - convert spaces to tabs
>>> - use git format-patch to create diff
>>>
>>>    Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
>>>    arch/riscv/include/asm/hwprobe.h      | 3 ++-
>>>    arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>>>    arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
>>>    4 files changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
>>> index 2aa9be272d5d..6d77def0a46e 100644
>>> --- a/Documentation/arch/riscv/hwprobe.rst
>>> +++ b/Documentation/arch/riscv/hwprobe.rst
>>> @@ -360,4 +360,7 @@ The following keys are defined:
>>>
>>>        * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
>>>            vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
>>> -     Instruction Extensions Specification.
>>> \ No newline at end of file
>>> +     Instruction Extensions Specification.
>>> +
>>> +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
>>> +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
>>> \ No newline at end of file
>>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
>>> index 7fe0a379474a..501d49b7a02a 100644
>>> --- a/arch/riscv/include/asm/hwprobe.h
>>> +++ b/arch/riscv/include/asm/hwprobe.h
>>> @@ -8,7 +8,8 @@
>>>
>>>    #include <uapi/asm/hwprobe.h>
>>>
>>> -#define RISCV_HWPROBE_MAX_KEY 13
>>> +#define RISCV_HWPROBE_MAX_KEY 14
>>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE      ((1ULL << 59) - 1)
>>>
>>>    static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>>>    {
>>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
>>> index aaf6ad970499..a3b92df4dc05 100644
>>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>>> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>>>    #define             RISCV_HWPROBE_EXT_ZAAMO         (1ULL << 56)
>>>    #define             RISCV_HWPROBE_EXT_ZALRSC        (1ULL << 57)
>>>    #define             RISCV_HWPROBE_EXT_ZABHA         (1ULL << 58)
>>> +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
>>>    #define RISCV_HWPROBE_KEY_CPUPERF_0 5
>>>    #define             RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
>>>    #define             RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
>>> @@ -106,6 +107,7 @@ struct riscv_hwprobe {
>>>    #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0        11
>>>    #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE 12
>>>    #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0       13
>>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
>>>    /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>>>
>>>    /* Flags */
>>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
>>> index 0b170e18a2be..40e7fa5f85f3 100644
>>> --- a/arch/riscv/kernel/sys_hwprobe.c
>>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>>> @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>>>                hwprobe_isa_vendor_ext_thead_0(pair, cpus);
>>>                break;
>>>
>>> +     case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
>>> +             pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
>>> +             break;
>>> +
>>>        /*
>>>         * For forward compatibility, unknown keys don't fail the whole
>>>         * call, but get their element key set to -1 and value set to 0
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
