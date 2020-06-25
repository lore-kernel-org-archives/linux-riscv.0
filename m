Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE74AC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:04:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DCC20781
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Am3hzM3L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="AaW0I7wf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DCC20781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=qZJXCfDpEa40umAAEy54woX9eIGRpn3viA3eBMR3C0w=; b=Am3hzM3LBTmcGWslBXciHJ2bV
	WxJWOYG4a8CjyWV7pr2kAsTHZoA8iM4r2PsQ+4EC34RuHqxZnwjL9QrDGMFSxMcBnyd/eodvaRuhb
	1NHEiHCbJzfVBw48zlgI7Y5TTbJVwSixEX/nd4q7zZJtDBNWF+rOXp6jjs8hx4qXgUcCAaPy16h8G
	gaanHIvdeiv3Dj6acIu5rIz+M95jr7bTdmK1NNfGUOwdvVSAgCymplaM4NiiSk3D5rWDsJXgWj4zv
	awk9+q7B1rOQb6mNNrLu/D3n6hQNXm0B9BaZCeka0kO+6ZwC+4qb+uc6vzb4NDACvCG6Cw3euwNEz
	/kBJpPuug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jom9h-0001qh-F3; Fri, 26 Jun 2020 11:04:25 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jom9f-0001p4-29
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 11:04:24 +0000
Received: by mail-pg1-x542.google.com with SMTP id d194so1435397pga.13
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YwxJgs2ekm2F5i2bbq3bvR99tjvhSs3RBO886udVeFE=;
 b=AaW0I7wf4VZi0tWYgsg0VXtU1/5OGKDM1/Sk65n9jmsn2IHKE0FgxNJRUXhp2LNS5O
 VxEWngolyhwIiqJPDqTRL+0wV2tp8Lk2ANlwhpXuC6ha7JwE2aCr7+7ojqIx++AnnoBL
 0lp82ylALuEFpFZLkRpDZsRyFetD4967ioBXlIWWukROBYsxAjquAShJp8VX+91+6uTD
 fL9zHCiRxJ5DJME5M77E3XFFnvdAPsV3FoyiFSkA0NDnONfIWKiB+tL2+MOQNanqjWQx
 FnKzlMURYcU9CGrPQy6PW9nZyRMvNZjdDF7uxzbDMqcSd4L94Vr2KH+717jxAE9Q4b+k
 mqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YwxJgs2ekm2F5i2bbq3bvR99tjvhSs3RBO886udVeFE=;
 b=uDkTD+Hc0cor9L1bSMoIu34SIo4bjDUpG2rW/z9S4ZcxgEtRXe77yRNB1wTsjG/k2i
 Xe/EaP8ZPCydU5O20fh/6pc5ZIodBj9yxO1D9TPJ/2zOR6c7Gzwduqjw6UaSgswpZrdU
 lJSkcmhxp74Uj/e2ptPCxQLG2jCeHl0WnfleSziADfEClj2CzSJuocq1XqX7eYtwHC1+
 bUIBWJuuVkxofxmbWKzEy1WUrAfu64okGVEOGIHqwx+a8F1wSFbVquxWbJyw7F8ohMPS
 3jlhS0JxY+VIGqoOQCANjhQ4GY7j9C1d6JdiQHuOf41dSCep+8SPRfcBjaEVd/thUmp4
 Vkug==
X-Gm-Message-State: AOAM533SDy1gpucwflUaOl+Nu67OcdmG+m4gX+uJmEfpmwko+OV/CltP
 VqtGjgrTQKYwT19SNdQAPxJAC4nMbwAxbw==
X-Google-Smtp-Source: ABdhPJyogFv4o4zWEa+ucdAZImpfWIBrztId39Ahncn0ua4AkeSeZAubIKQiOim3F6/RucN0oZ3bQQ==
X-Received: by 2002:a62:8782:: with SMTP id
 i124mr35615630pfe.267.1593120471660; 
 Thu, 25 Jun 2020 14:27:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h2sm24673386pfb.175.2020.06.25.14.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 14:27:50 -0700 (PDT)
Date: Thu, 25 Jun 2020 14:27:50 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Jun 2020 14:23:09 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Use a local variable instead of smp_processor_id()
In-Reply-To: <20200622234725.92511-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-99e5afcf-d8c7-4660-a9e7-eb515e9aa55b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Jun 2020 16:47:25 PDT (-0700), Atish Patra wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> Store the smp_processor_id() in a local variable to save some
> pointer chasing.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/smpboot.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 4e9922790f6e..3e033e97dd08 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -146,6 +146,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  asmlinkage __visible void smp_callin(void)
>  {
>  	struct mm_struct *mm = &init_mm;
> +	unsigned int curr_cpuid = smp_processor_id();
>
>  	if (!IS_ENABLED(CONFIG_RISCV_SBI))
>  		clint_clear_ipi(cpuid_to_hartid_map(smp_processor_id()));
> @@ -155,9 +156,9 @@ asmlinkage __visible void smp_callin(void)
>  	current->active_mm = mm;
>
>  	trap_init();
> -	notify_cpu_starting(smp_processor_id());
> -	update_siblings_masks(smp_processor_id());
> -	set_cpu_online(smp_processor_id(), 1);
> +	notify_cpu_starting(curr_cpuid);
> +	update_siblings_masks(curr_cpuid);
> +	set_cpu_online(curr_cpuid, 1);
>  	/*
>  	 * Remote TLB flushes are ignored while the CPU is offline, so emit
>  	 * a local TLB flush right now just in case.

Thanks.  This is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
