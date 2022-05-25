Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB04C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZ26ao9vo6AzaygUUlSrhHxy7Mozjle2fXrDeKe45L4=; b=cgd6ZKExqyisyw
	MWVJpYFvDZ+kBaw9ciPlDiEe4PbawYrb8G5W4JQ8h2ZeDv/YiFoZZ9vNPzidZAvcWCG+MFhcX72Vp
	69x3z9wQhB2cnMu/Bv7us13ayblEx9oH/RquBaqjk9c9t6MfhbaADokUmNfRq+jC/AA3LxXUkSCmu
	X7nZOKXi1LcNcyG29AtVWn45ryNmjUt5aMhb3sbG6hxD5MsUSU9YL3S6oQV3J50MpHix1Nb09XLZu
	Ju3jQx2nI6Uoe/a9GXTRu6KVM+FiGslrqIynF00Jmk3vHxQGlvdej20eLiOkeoRtF7c6cQXFwhE44
	MvvXQ6L9qcwa0exIKeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsvc-00Ba7w-7o; Wed, 25 May 2022 15:28:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsvY-00Ba5y-Oy
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:28:02 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4D8973F4C4
	for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653492475;
	bh=56sEzsfe9fPL+dqkAvgXm6tKeKfT2Xup4I6lOsE7aaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=SrUHixcD2mGkBw7Y+PG5YCkUcM6eGgKI7D0tbvHM1q5eFa2D6wafb7zVn0ZeFtvKb
	 kFoHRUBY04fBcW3icLvu7OXSgIQuaqLE/yLqB7+1JH3JuDRNTRrpTEq6Aw4YI6i6Rf
	 IZ81JXwVLSkKcYYr+unhjRra1I7WYNXUouxF+N4geT9kg7mDMnakoHLDLjvp3WTdqT
	 X2d3Cal8UjMYfN8oziwb3Wwlj+T953zellsATRBHJNpe2TI6euagZ0qPJZEWjziw4O
	 jlbnALsRbcUI9wmlAE5Oi/4qmybZt4gOTR+0SgjBZNb6X4Rlz8seh5h1RbEfxfvX8P
	 dvF0F3+/fYEtw==
Received: by mail-ej1-f71.google.com with SMTP id s4-20020a170906500400b006feaccb3a0eso6598893ejj.11
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=56sEzsfe9fPL+dqkAvgXm6tKeKfT2Xup4I6lOsE7aaY=;
        b=TII86/RWLg4Bm11pguRdS1NaEbbDOYjPvksSmwlc/aIY90AmbkVgYyYtlxH6z604xe
         b8iDgxJrBtGjTOlDNE1wGlF2RtUvNn4cpGjxqikCXaCUQ5yJi52YHLNL6knvVm09Y/uK
         Rbap1pH53fuQfDYJ65yccQqvr58kVWTQ4/Sdo+iz7odiBhHEWdoMXWDvPz6AlLfvYuIt
         kXNAWhzdM7q4jpzISLruLR7io45MiydAKprS+OXB86VA1jVFZA+19jU5pQ8tozTb6z2N
         UKzKcVeQsFSd51wXIPViF1oJWhYvy/wRPtSuUco5n3xbArXtEVhW093vTBFXFmPFBsbe
         ZSwg==
X-Gm-Message-State: AOAM533UcnaAClrTm2bUGjA/9NaIA+N9B/pdx9kNCu83iwiPIZP1ebYS
	EKle1fu904D3VlD6MJ4ZtNEixKDJVNeAJKBOIqX9IQKnmq8pDMPzTLTLWhVLMv5THh0xdy32ex6
	oac3H+63FoHckgL0dSKYH34A3mLa0oJXJdLMwu9gZPbk1Kg==
X-Received: by 2002:a05:6402:c1:b0:42a:b8a5:8d5e with SMTP id i1-20020a05640200c100b0042ab8a58d5emr35551092edu.266.1653492472951;
        Wed, 25 May 2022 08:27:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMgUBU4W0WxQRyLzKq/RFbQUPt10kiAPkQG+6E6TfHVPoTMm1PohbGn87/ilCtMwv+r912wA==
X-Received: by 2002:a05:6402:c1:b0:42a:b8a5:8d5e with SMTP id i1-20020a05640200c100b0042ab8a58d5emr35551049edu.266.1653492472640;
        Wed, 25 May 2022 08:27:52 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id s25-20020a1709066c9900b006fefd1d5c2bsm2246992ejr.148.2022.05.25.08.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:27:52 -0700 (PDT)
Message-ID: <a7910ff4-0bce-befa-f961-a82a8a1025a1@canonical.com>
Date: Wed, 25 May 2022 17:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/5] riscv: cpu_ops_spinwait: Support for 64bit hartid
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, Sunil V L <sunil.vl@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Atish Patra <atishp@rivosinc.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-3-sunilvl@ventanamicro.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220525151106.2176147-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_082800_991299_47FDB15D 
X-CRM114-Status: GOOD (  18.11  )
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

On 5/25/22 17:11, Sunil V L wrote:
> The hartid can be a 64bit value on RV64 platforms. This patch modifies
> the hartid variable type to unsigned long so that it can hold 64bit
> value on RV64 platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>   arch/riscv/kernel/cpu_ops_spinwait.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
> index 346847f6c41c..51ac07514a62 100644
> --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> @@ -18,7 +18,7 @@ void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
>   static void cpu_update_secondary_bootdata(unsigned int cpuid,
>   				   struct task_struct *tidle)
>   {
> -	int hartid = cpuid_to_hartid_map(cpuid);
> +	unsigned long hartid = cpuid_to_hartid_map(cpuid);
>   
>   	/*
>   	 * The hartid must be less than NR_CPUS to avoid out-of-bound access

This line follows:

if (hartid == INVALID_HARTID || hartid >= NR_CPUS)

INVALID_HARTID is defined as ULONG_MAX. Please, mention that you are 
fixing a bug:

Fixes: c78f94f35cf648 ("RISC-V: Use __cpu_up_stack/task_pointer only for 
spinwait method")

NR_CPUS alias CONFIG_NR_CPUS is an int. You should convert it to 
unsigned before comparing it to hartid to avoid build warnings.

Best regards

Heinrich


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
