Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9922CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 03:38:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6127821741
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 03:38:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlDbZYdd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Ly2y4lHY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6127821741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uloRyIGFDL2aS3+O3rCHn5RxzDOFix1zNQ+Ekzyr1JM=; b=RlDbZYddjwSkxm
	+FckzVcUuCqIMmxWMDWHxQfU1i/JBDt5Okp1XG499Ls9Xgs1L2+0JCmkooVJcuGFfxeyEwDjkAut1
	RjY4tcMvs6igRVJFhw2fPqIOj5TsS8Af/IoOxPLfpsqh2AL4138JV4KeM0cyjgZEqI/JWvZG/F1pA
	FK6P5SQkiDUjfkwGRJOlWZEIAp26Se/IWngYTmoUjkXw2nRpjvaWbZLFT7CBiMY+rLvtuwaZopnY9
	6ZzXHnQr8WP0HI8riZjPeMiHc02YV6q+DweN4yA7Yz1ZzabTlHGrlYwlrK/NGAj9DcuFT9bJGp94W
	yh04TTKWfNgIAdRtKmFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcMV7-0005vf-9U; Thu, 27 Dec 2018 03:38:25 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcMV1-0005uk-RG
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 03:38:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id r10so17083945wrs.10
 for <linux-riscv@lists.infradead.org>; Wed, 26 Dec 2018 19:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aDUoqQRTnNv8ybCgbXaTIde6zC06OstmyEq9KrXom/k=;
 b=Ly2y4lHYRBeMWyOe9V9k8iaEAyxLZqNsfB4Jg52//kPQXPyUAlg1/tsen+EoUFFvml
 cfPQlKuvk7gcXDuS/qqZuHz0Gwe10JPDGzEirWL39CKHjwcpj4dREsqLLURd74KVgOsc
 FVO7XuH74eM41LdpIptn64A8eEqi1/X6O2Npf+Wl4H8hA3rrkXD2ghyKxl0tMJXtph3U
 lbNLdncFB0qzfwBdFXA3VLz9vmwoCtZReVtd6yOocVyJjCylk5C40M7rPK21/+Kvtw+M
 ioiMlZzqaORmLYIxGYaEwvLNorVsj9rdD0TD6XPbwxS0IQYvB0OrdKr7C6hmRZ2aSAXU
 3cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aDUoqQRTnNv8ybCgbXaTIde6zC06OstmyEq9KrXom/k=;
 b=qehJjhGyJRJn2Xor9By4JWDm5PayX4zc9XbyooV8PxYCTsgmcgpaGAGzE7KWpdddMr
 J2pgRuL/8jaDWaj5C98Zp5MPiwba18L+Ob9EkZB69mdh8OwhMnFDn84H3Owd4nd08+jb
 kXYG4GaDV5OvLir/njEYZfuWTdQ74LOnamYrjhSNu8tHhpSrKMEj2wX/jge2QIHQnLXF
 Gk4wlz863gCs98IR26uJ1WN3Jn4KF387aF0yjiSbdl9Btyp6JbxbGC57XX2qjDnfPexB
 /z2hyU9IsFY7y8Br+nBduFoFipdzqS8d1mLp/TAZ+ADCcds8lmqI/arJ+gn9dG65VQgI
 AfFg==
X-Gm-Message-State: AJcUukd8mQLsr2UwQjsaxrhgPmq2VNtDiMSsb+MF/rOe5iiWQbWR2m4O
 0Hrm0tKw7EkenTGh235nHXASc987Ub3k8kQGHjGYDg==
X-Google-Smtp-Source: ALg8bN6HyLNDs99kQtkKUsIs7T8pufHsJZUnYZHs6TVXUJNS0F9oEWIV/jZwaxd5Zp9khGlulxpr5o+jQL5oE0K8z/4=
X-Received: by 2002:adf:8506:: with SMTP id 6mr10635609wrh.128.1545881888326; 
 Wed, 26 Dec 2018 19:38:08 -0800 (PST)
MIME-Version: 1.0
References: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
 <1545865741-22795-3-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1545865741-22795-3-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 Dec 2018 09:07:57 +0530
Message-ID: <CAAhSdy12XrVOXcSaoUj1s1DBT-qW5S1nMiVQpCvEVcQM31cRJw@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: Move cpuid to hartid mapping to SMP.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_193819_885909_4A04237B 
X-CRM114-Status: GOOD (  15.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 27, 2018 at 4:39 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, logical CPU id to physical hartid mapping is
> defined for both smp and non-smp configurations. This
> is not required as we need this only for smp configuration.
> The mapping function can define directly boot_cpu_hartid
> for non-smp usecase.
>
> The reverse mapping function i.e. hartid to cpuid can be called
> for any valid but not booted harts. So it should return default
> cpu 0 only if it is a boot hartid
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/smp.h | 13 +++++++++++--
>  arch/riscv/kernel/setup.c    |  2 ++
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 41aa73b4..8f30300f 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -22,12 +22,13 @@
>  /*
>   * Mapping between linux logical cpu index and hartid.
>   */
> -extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
> -#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
>
> +extern unsigned long boot_cpu_hartid;
>  struct seq_file;
>
>  #ifdef CONFIG_SMP
> +extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
> +#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
>
>  /* print IPI stats */
>  void show_ipi_stats(struct seq_file *p, int prec);
> @@ -58,7 +59,15 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
>
>  static inline int riscv_hartid_to_cpuid(int hartid)
>  {
> +       if (hartid == boot_cpu_hartid)
>                 return 0;
> +       else
> +               return -1;
> +}
> +static inline unsigned long cpuid_to_hartid_map(int cpu)
> +{
> +
> +       return boot_cpu_hartid;
>  }
>
>  static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c290e6a..bd4d7b85 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -83,6 +83,7 @@ EXPORT_SYMBOL(empty_zero_page);
>  atomic_t hart_lottery;
>  unsigned long boot_cpu_hartid;
>
> +#ifdef CONFIG_SMP
>  unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
>         [0 ... NR_CPUS-1] = INVALID_HARTID
>  };
> @@ -91,6 +92,7 @@ void __init smp_setup_processor_id(void)
>  {
>         cpuid_to_hartid_map(0) = boot_cpu_hartid;
>  }
> +#endif

Please move __cpuid_to_hartid_map[] and smp_setup_processor_id()
to arch/riscv/kernel/smp.c

Otherwise, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
