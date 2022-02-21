Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388D9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:Mime-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRatTFmhKeVNzIDfhI0Cdmn7NblKjc93syUaUX+VDPg=; b=SFd4leRsXtZ+nf
	Xc6ZIy9413vPlmu0cvq8bNiAgSEBC1OF2Z2XuKf69+N4NgDUv8s/KbJUJcvIGLyj5C2dnnLDxIUf3
	pmQ6j9l+fLVzIy3A2rZZh/qL/p8tQzhQsM0bSU57m2MfuX5qPChedw0ZDoXPpfYIKk5FgM1Ah2QGD
	Zf/oilG4AmD73bjKUezcQBytgA6mmZQQRpryFj4UJzWTD5a1cK0PJJ6UBO0k0lTsLV1N9QcnBZmjG
	HeiskaLreZTzQHjoTEXEi9Jadh4/YeuMmYfAFGTSotbP0v6V5LsKDczRKrddn29V6rIshnHtuVL6p
	uHSw6lcdTPoKyNjK4QZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9Hc-0067PD-QN; Mon, 21 Feb 2022 14:03:20 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8xP-005z71-CO
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 13:42:34 +0000
Message-ID: <eaf1421b-677f-6fa5-0d0a-4f92c5153068@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1645450936;
 bh=Ot9j9xTiPy2WJHjjRs5PATRWvK2UgcOeU5KtMMfqAmI=;
 h=Date:Mime-Version:From:Subject:To:Cc:References:In-Reply-To:
 Content-Type:Content-Transfer-Encoding;
 b=QVTHc69HL3Ba8x26sCnsnVmaYnSPyuWk137pM+kLwo/zgRd+5KIbEo+VUQ0fA3IXi
 YZFzRCj/tm2zMiz1Qk2dSLpwi+58kvk09JI3wExYaDMVX/ZPV7gPIvyo47UzWAVcyp
 yPlbZXLnfdHX0bRqhTgZR5vZhEbFmkkRSsKX1tRo=
Date: Mon, 21 Feb 2022 22:42:16 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH 2/2] RISC-V: Extract base ISA from device tree
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
 <cover.1644987761.git.research_trasio@irq.a4lg.com>
 <8d7e1937f9476d14f64a53684b11bedd6f4ff88d.1644987761.git.research_trasio@irq.a4lg.com>
 <CAOnJCUKPBht9OY6bhHracxsX7U0w8jPKX-kFcQ5ZYkD-k7q4mQ@mail.gmail.com>
 <32ca2b3e-3e2b-ded3-39a9-df12bb9cb416@irq.a4lg.com>
 <CAOnJCUL_OX1NgzP_uqu4oEt3E-J1-ipdAeuuBPkByUKGAXSJTg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOnJCUL_OX1NgzP_uqu4oEt3E-J1-ipdAeuuBPkByUKGAXSJTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_054227_844142_D0578D16 
X-CRM114-Status: GOOD (  25.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022/02/16 16:43, Atish Patra wrote:
> On Tue, Feb 15, 2022 at 10:59 PM Tsukasa OI
> <research_trasio@irq.a4lg.com> wrote:
>>
>> On 2022/02/16 15:01, Atish Patra wrote:
>>> On Tue, Feb 15, 2022 at 9:04 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>>>>
>>>> This commit replaces print_isa function to extract base ISA from device
>>>> tree ("riscv,isa").  It uses a subset of Tsukasa's riscv_fill_hwcap ISA
>>>> parser.
>>>>
>>>> Design choices (1):
>>>>
>>>> It constructs base ISA string from the original string (does not cut
>>>> the original string like Atish's).  This is to strip version numbers
>>>> (too minor to represent as major ISA) but this behavior may be
>>>> debatable.
>>>>
>>>
>>> A simpler solution would be to just invoke
>>> __riscv_isa_extension_available for all the base
>>> extensions (imafdc) and print the base isa string.
>>> We don't need to parse the ISA string again here.
>>
>> I agree that my patchset is ugly and simpler solution would be good.
>> (Having two parser for same string is definitely not the best idea.)
>> There are some testcases (some are not accepted by Spike's --isa option
>> and requires custom Device tree) for testing:
>>
>> *   rv64imac
>> *   rv64imacsu      (invalid ISA string; test QEMU workaround)
>> *   rv64imafdch
>> *   rv64imafdcsuh   (invalid ISA string; test QEMU workaround)
>> *   rv64imafdc_svinval_svnapot
>> *   rv64imafdcsvinval_svnapot
>> *   rv64i2p1m2a2fdcsvinval
>> *   rv64i2p1_m_afdcsvinval
>>
> 
> Thanks. This is a good set of test cases that covers most of the cases.
> 
>>>
>>>> Design choices (2):
>>>>
>>>> It skips when single-letter 'S' or 'U' is encountered.  It improves
>>>> familiarity with regular ISA string.
>>>>
>>>
>>> I don't think this is necessary because only Qemu appends 'S' & 'U' in
>>> the isa string.
>>> Your patch in Qemu will fix that for future releases of Qemu.
>>> All other commonly used platforms (hardware/spike) already use the
>>> correct ISA string.
>>
>> Yes, only QEMU.  It's not a serious problem like on cpufeature.c but would
>> be nice to remove them (when exposing to the usermode) to prevent confusion
>> on usermode side.
>>
>> If you invoke __riscv_isa_extension_available to generate base ISA string,
>> would you exclude 'S' and 'U'?
>>
> 
> Yeah. That's easy. The possible valid base extensions are "IMAFHDQCBJPV".
> (all the possible defined bits in misa except 'S' & 'U')
> So we will invoke __riscv_isa_extension_available for those only.

Order "IEMAFDQLCBKJTPVH" would be sufficient.
Note that some of them may be incompatible with Linux or currently has
no plan to be added as a single-letter extension.

"E"**: RV32E
     (incompatible with Linux?)
"L"**: Decimal floating point
     (placeholder is removed from the ISA specification)
"B"**: Bit manipulation
     (no single-letter extension plan but multiple subextensions)
"K"**: Cryptography
     (no single-letter extension plan but multiple subextensions)
"J"**: Extensions for dynamic languages
     (no single-letter extension but planned multiple subextensions)
"T"**: Transactional memory
     (placeholder is removed from the ISA specification)
"P"  : narrow SIMD using GPR
     (this order is ratified but "P" is not)
"H"  : Hypervisor (different position compared to your post)
     (this order is not ratified but likely placed here
      for compatibility with QEMU and Spike)

Tsukasa

> 
>>>
>>>> This commit is intended to be squashed into Atish's isa_framework_v4
>>>> PATCH 6/6.
>>>>
>>>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>>>> ---
>>>>  arch/riscv/kernel/cpu.c | 83 ++++++++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 74 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>>>> index 6f9660c0a973..3f9607a66d95 100644
>>>> --- a/arch/riscv/kernel/cpu.c
>>>> +++ b/arch/riscv/kernel/cpu.c
>>>> @@ -101,17 +101,82 @@ static void print_isa_ext(struct seq_file *f)
>>>>
>>>>  static void print_isa(struct seq_file *f, const char *isa)
>>>>  {
>>>> -       char *ext_start;
>>>> -       int isa_len = strlen(isa);
>>>> -       int base_isa_len = isa_len;
>>>> -
>>>> -       ext_start = strnchr(isa, isa_len, '_');
>>>> -       if (ext_start)
>>>> -               base_isa_len = isa_len - strlen(ext_start);
>>>> +       unsigned char parse_break = 0;
>>>> +       char base_isa[RISCV_ISA_EXT_BASE + 5];
>>>> +       char *base_isa_end = base_isa;
>>>> +       const char *isa_end = isa;
>>>> +#if IS_ENABLED(CONFIG_32BIT)
>>>> +       if (!strncmp(isa, "rv32", 4))
>>>> +               isa_end += 4;
>>>> +#elif IS_ENABLED(CONFIG_64BIT)
>>>> +       if (!strncmp(isa, "rv64", 4))
>>>> +               isa_end += 4;
>>>> +#endif
>>>> +       if (isa != isa_end) {
>>>> +               strncpy(base_isa, isa, isa_end - isa);
>>>> +               base_isa_end += isa_end - isa;
>>>> +               for (; *isa_end; ++isa_end) {
>>>> +                       switch (*isa_end++) {
>>>> +                       case 'x':
>>>> +                       case 'z':
>>>> +                               parse_break = 1;
>>>> +                               break;
>>>> +                       case 's':
>>>> +                               if (*isa_end != 'u') {
>>>> +                                       parse_break = 1;
>>>> +                                       break;
>>>> +                               }
>>>> +                               /**
>>>> +                                * Workaround for invalid single-letter 's'
>>>> +                                * (QEMU).  Should break for valid ISA string.
>>>> +                                */
>>>> +                               fallthrough;
>>>> +                       default:
>>>> +                               if (unlikely(!islower(isa_end[-1])
>>>> +                                   || base_isa_end == base_isa + sizeof(base_isa))) {
>>>> +                                       parse_break = 2;
>>>> +                                       break;
>>>> +                               }
>>>> +                               switch (isa_end[-1]) {
>>>> +                               case 's':
>>>> +                               case 'u':
>>>> +                                       break;
>>>> +                               default:
>>>> +                                       *base_isa_end++ = isa_end[-1];
>>>> +                               }
>>>> +                               /* Skip version number */
>>>> +                               if (!isdigit(*isa_end))
>>>> +                                       break;
>>>> +                               while (isdigit(*++isa_end))
>>>> +                                       ;
>>>> +                               if (*isa_end != 'p')
>>>> +                                       break;
>>>> +                               if (!isdigit(*++isa_end)) {
>>>> +                                       --isa_end;
>>>> +                                       break;
>>>> +                               }
>>>> +                               while (isdigit(*++isa_end))
>>>> +                                       ;
>>>> +                               break;
>>>> +                       }
>>>> +                       if (*isa_end != '_')
>>>> +                               --isa_end;
>>>> +                       if (parse_break)
>>>> +                               break;
>>>> +               }
>>>> +       }
>>>>
>>>> -       /* Print only the base ISA as it is */
>>>> +       /**
>>>> +        * Print only the base ISA
>>>> +        * (original ISA string as is if an error is encountered)
>>>> +        */
>>>>         seq_puts(f, "isa\t\t: ");
>>>> -       seq_write(f, isa, base_isa_len);
>>>> +       if (parse_break < 2) {
>>>> +               seq_write(f, base_isa, base_isa_end - base_isa);
>>>> +       } else {
>>>> +               isa_end += strlen(isa_end);
>>>> +               seq_write(f, isa, isa_end - isa);
>>>> +       }
>>>>         seq_puts(f, "\n");
>>>>  }
>>>>
>>>> --
>>>> 2.32.0
>>>>
>>>
>>>
> 
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
