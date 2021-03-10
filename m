Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F23DC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:43:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9E564F80
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9E564F80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zk5OKBZJNiEOHswfNF6fCJ7skxEB8DrLNNvhJZ8ZT2o=; b=mlZsFd+A2DlG+pNO/+cB+svC8
	laZEJXfvZrG9WXmb+yYdqHfLGaGzbden1NR9bNi+/BNBmMTYHWdaj1U8AdbxgiabwAq4EwK0ZxEYC
	GnE5MY3hPUrEn8xDhhJb564A+WxTJc6tdb7XEzYUqYkdbpy//+e7OhRevMijX9+gksrp3PvkwAd7h
	O4ghvBXM8yvtuIBwbdbdCvnrsU+zxTkMm0lzfpeWwtayglpDOui3voX2trBrqcIBvn2ZI/2oNwqdA
	nccYmXGHzE5NMAanmfOHU+EN2ztQKUQiS4GSDXDx85wHzHnNxs7TM5M0X9y2s/mg+i3XG08m3iBV1
	VfBa+N/sQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJpk7-005wCE-4K; Wed, 10 Mar 2021 03:42:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJphu-005vrk-93
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 03:40:27 +0000
Received: by mail-pl1-x62b.google.com with SMTP id z5so7805647plg.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 19:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3OqJC+cttIyAEj0ZMP1XfOiYvayZbkWQ+7SrOM6TZlk=;
 b=NAQjVjJzyOyIVm40eqmzNz2hU4rB6TwAP2wLECkJV9VCgfGRAykcPqYTfJktP+nWOa
 sA0VCafsqItVh792k//2T8Le8TVvHKIc4pkWAaw0N/8gfQMEVBj0Au9Kp94NcjjT4ccz
 Mbzr1aNZDPYKDVo+L3lndqi9UDYMjms6QlAFfj469sZVabua4uTOlxzX3SpqtuXyI10j
 rV/XaLauB93JMVF3tDp234cDRBtVra46WYh0LHxAmNfPBEGR37vyRoVQCwO/KzOpdsXh
 RE4kwF3Iq9VdDpcMalzAl54nYDvTWzDAkQaARbxYpBW1OBmpW8lSbuCpWKl5l/iWM8Kh
 4VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3OqJC+cttIyAEj0ZMP1XfOiYvayZbkWQ+7SrOM6TZlk=;
 b=BpiScmPmqQAVoUY4nin0rbo5wHhQIj7Akj7z+24YaXPfjKQhWyb9ulZHZiJnssO8Fd
 wSUcF3Qz5Sa+3wlwrJF4XxASbBhSEYsdmiz+OKA6BzDY/YV0LEPVORouruiMkBxGiDYg
 XvfGmLQwkbUNlTQojLcqmPN6oY9KTFZ0rmAo43vrEdEKWNG0hMD1cCjfzeYqcDlT37D9
 AA9xjB2WHv6GrAFL1A7tIs2zJjKGnzj4QKkKqYQmTnYLrUZAxWfJZ4ZosYMSioqWRWnR
 /pRxS/0UyewVRMsnKbyNgwKZKYf8xEeKCyriM+1M7rvjOhnSz7uGeZzbiY/1/ZDAPekg
 5nqA==
X-Gm-Message-State: AOAM533XIAGxYrNXJwQl/soNvg4rr5LvIQRkcc87ZYV/j3xK26B+eELT
 lmOw3FzG7AiOR+/Q3OMfdpxgqQ==
X-Google-Smtp-Source: ABdhPJwo9TcfZ13g2oYXDQP+g8cUFLl0R6S9AC2oBh3GO19zKgQz/tFHnTsCGvd6VugfCLKZVT9Gow==
X-Received: by 2002:a17:903:2301:b029:e4:700b:6d91 with SMTP id
 d1-20020a1709032301b02900e4700b6d91mr1272532plh.19.1615347620670; 
 Tue, 09 Mar 2021 19:40:20 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x9sm4180264pjp.3.2021.03.09.19.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 19:40:20 -0800 (PST)
Date: Tue, 09 Mar 2021 19:40:20 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:40:12 PST (-0800)
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
In-Reply-To: <CAAhSdy1skWAbBJGukg-mu4kFaknn56meVi5PbbW4fCoaKGopKg@mail.gmail.com>
CC: guoren@kernel.org, vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 Frank.Zhao@starfivetech.com, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, 
 alankao@andestech.com, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-0701d3a5-7d35-4a36-9ae3-926db273d665@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_034022_759643_27104F57 
X-CRM114-Status: GOOD (  35.23  )
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

On Mon, 08 Mar 2021 21:11:04 PST (-0800), anup@brainfault.org wrote:
> On Tue, Mar 9, 2021 at 6:58 AM Guo Ren <guoren@kernel.org> wrote:
>>
>> Hi Vincent,
>>
>> On Mon, Mar 8, 2021 at 11:58 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>> >
>> > Issue 3 SBI calls to get the vendor ID, architecture ID and implementation
>> > ID early in boot so we only need to take the SBI call overhead once.
>> >
>> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>> > ---
>> >  arch/riscv/include/asm/csr.h       |  3 +++
>> >  arch/riscv/include/asm/hwcap.h     |  6 ++++++
>> >  arch/riscv/include/asm/processor.h |  2 ++
>> >  arch/riscv/include/asm/soc.h       |  1 +
>> >  arch/riscv/kernel/cpufeature.c     | 17 +++++++++++++++++
>> >  arch/riscv/kernel/setup.c          |  2 ++
>> >  arch/riscv/kernel/soc.c            |  1 +
>> >  7 files changed, 32 insertions(+)
>> >
>> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> > index caadfc1d7487..87ac65696871 100644
>> > --- a/arch/riscv/include/asm/csr.h
>> > +++ b/arch/riscv/include/asm/csr.h
>> > @@ -115,6 +115,9 @@
>> >  #define CSR_MIP                        0x344
>> >  #define CSR_PMPCFG0            0x3a0
>> >  #define CSR_PMPADDR0           0x3b0
>> > +#define CSR_MVENDORID          0xf11
>> > +#define CSR_MARCHID            0xf12
>> > +#define CSR_MIMPID             0xf13
>> >  #define CSR_MHARTID            0xf14
>> >
>> >  #ifdef CONFIG_RISCV_M_MODE
>> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> > index 5ce50468aff1..b7409487c9d2 100644
>> > --- a/arch/riscv/include/asm/hwcap.h
>> > +++ b/arch/riscv/include/asm/hwcap.h
>> > @@ -44,6 +44,12 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
>> >  #define riscv_isa_extension_available(isa_bitmap, ext) \
>> >         __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
>> >
>> > +struct cpu_manufacturer_info_t {
>> > +       unsigned long vendor_id;
>> > +       unsigned long arch_id;
>> > +       unsigned long imp_id;
>> > +};
>> > +
>> >  #endif
>> >
>> >  #endif /* _ASM_RISCV_HWCAP_H */
>> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>> > index 3a240037bde2..4e11a9621d14 100644
>> > --- a/arch/riscv/include/asm/processor.h
>> > +++ b/arch/riscv/include/asm/processor.h
>> > @@ -72,6 +72,8 @@ int riscv_of_parent_hartid(struct device_node *node);
>> >
>> >  extern void riscv_fill_hwcap(void);
>> >
>> > +void riscv_fill_cpu_manufacturer_info(void);
>> > +
>> >  #endif /* __ASSEMBLY__ */
>> >
>> >  #endif /* _ASM_RISCV_PROCESSOR_H */
>> > diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
>> > index f494066051a2..03dee6db404c 100644
>> > --- a/arch/riscv/include/asm/soc.h
>> > +++ b/arch/riscv/include/asm/soc.h
>> > @@ -10,6 +10,7 @@
>> >  #include <linux/of.h>
>> >  #include <linux/linkage.h>
>> >  #include <linux/types.h>
>> > +#include <asm/hwcap.h>
>> >
>> >  #define SOC_EARLY_INIT_DECLARE(name, compat, fn)                       \
>> >         static const struct of_device_id __soc_early_init__##name       \
>> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> > index ac202f44a670..389162ee19ea 100644
>> > --- a/arch/riscv/kernel/cpufeature.c
>> > +++ b/arch/riscv/kernel/cpufeature.c
>> > @@ -12,6 +12,8 @@
>> >  #include <asm/hwcap.h>
>> >  #include <asm/smp.h>
>> >  #include <asm/switch_to.h>
>> > +#include <asm/sbi.h>
>> > +#include <asm/csr.h>
>> >
>> >  unsigned long elf_hwcap __read_mostly;
>> >
>> > @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>> >  bool has_fpu __read_mostly;
>> >  #endif
>> >
>> > +struct cpu_manufacturer_info_t cpu_mfr_info;
>> > +
>> >  /**
>> >   * riscv_isa_extension_base() - Get base extension word
>> >   *
>> > @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
>> >                 has_fpu = true;
>> >  #endif
>> >  }
>> > +
>> > +void riscv_fill_cpu_manufacturer_info(void)
>> > +{
>> > +#ifndef CONFIG_RISCV_M_MODE
>> > +       cpu_mfr_info.vendor_id = sbi_get_vendorid();
>> > +       cpu_mfr_info.arch_id = sbi_get_archid();
>> > +       cpu_mfr_info.imp_id = sbi_get_impid();
>> > +#else
>> > +       cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
>> > +       cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
>> > +       cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
>> > +#endif
>> How about let opensbi emulate csr_read(CSR_MXXX) for S mode, then we
>> needn't to define new sbi call.
>
> Accessing M-mode CSRs from the S-mode kernel will only make things
> complicated for hypervisors because now hypervisors will also end-up
> emulating M-mode CSRs.

IMO that's not really the problem: hypervisors are going to have to emulate 
CSRs anyway, so adding more isn't a big deal.  The problem is having S-mode 
software depend on M-mode.  More explicitly:

* The RISC-V specs are nominally layered, which means S-mode doesn't include 
  any of the M-mode bits. M-mode CSR accesses are simply illegal S-mode 
  instructions.  I know the CSRs are a bit special in that they're chunked out 
  by privilege mode, but there's nothing preventing the ISA from later 
  reallocating these M-mode CSR bits in S-mode (aside from then having a modal 
  ISA, which is a design anti-goal).
* All behavior in M-mode is implementation defined, including these CSR 
  accesses.  While they're obviously allocated and a behavior is specified by 
  the ISA, there's nothing that says M-mode has to actually implement these in 
  any sane fashion (ie, it can return 0 or shut down or whatever).

So is essence, adding these M-mode CSR accesses into S-mode kernels introduces 
an entirely new ISA extension that we're just making up on the spot and 
assuming will be implemented by firmware.  At a bare minimum we'd need to have 
that defined by a specification, but even then I don't see it as the right way 
to go.

> Best would be to only access S-mode CSRs and SBI calls from
> S-mode kernel.

Agreed.  I'm not opposed to expanding the scope of the M-mode kernels to boot 
on more systems, but users who want S-mode shouldn't end up with M-mode 
dependencies sneaking in.  So in this case, I'm very much in favor of the SBI 
call over accessing an M-mode CSR.

>
>>
>> > +}
>> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> > index e85bacff1b50..03621ce9092c 100644
>> > --- a/arch/riscv/kernel/setup.c
>> > +++ b/arch/riscv/kernel/setup.c
>> > @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
>> >  #endif
>> >
>> >         riscv_fill_hwcap();
>> > +
>> > +       riscv_fill_cpu_manufacturer_info();
>> >  }
>> >
>> >  static int __init topology_init(void)
>> > diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
>> > index a0516172a33c..58f6fd91743a 100644
>> > --- a/arch/riscv/kernel/soc.c
>> > +++ b/arch/riscv/kernel/soc.c
>> > @@ -6,6 +6,7 @@
>> >  #include <linux/libfdt.h>
>> >  #include <linux/pgtable.h>
>> >  #include <asm/soc.h>
>> > +#include <asm/hwcap.h>
>> >
>> >  /*
>> >   * This is called extremly early, before parse_dtb(), to allow initializing
>> > --
>> > 2.7.4
>> >
>> How
>>
>> --
>> Best Regards
>>  Guo Ren
>>
>> ML: https://lore.kernel.org/linux-csky/
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
