Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD1FCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cs0P0rrNh6BCM4yLk3pc7pADgYxWPGKbuEE/U9rjus=; b=WWEI+VNHIt3P8I
	K9qogHAvnJX+QjriLeuwtR/WapFJu1u88CQB74XrXrlo2D++4d43zv1Eu6K9S68Z76Uj5fxyTxpH/
	gKZnFra+lDyG1qeNwXhZW0T/cWMQXMAf8n8ykPcxT2/g5nUB82fqPvzqmTs2o0vszeIfo2WWC5RHj
	SZBKOPSdPGbG0LKWxO4xgVPjOigDADELaM0hSXh/BSu82AaNWp5+T4yWy+ikOwyMHY0iiH/BYV9b1
	paRWXrBlIWtGougQJWltCynDwvzznw9HUVtnFK2e7BChPSacCDILtTImA3w4eoE/jqPYVDOmaCRHA
	LkMJ1DvamBZHe5kvZL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyA45-00000004fh5-3j2L;
	Mon, 15 Sep 2025 14:20:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyA42-00000004ffu-2wn5
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 14:20:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3e1a31c692bso100052f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757946016; x=1758550816; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HOBdKdBeIE5LskiTRckXQqXZ27Bu0OLdpEVHzR/yBs=;
        b=Nv2vnptE0DFq8q4Sa6SWao0vqtHoG3OqnvG0ey6jo2e3WhXMzMAg9/G12Z3M3p5dOX
         TK1pLTr0XKuLS6wyrcDvsvSJP1vNcSl5k1k1yUmo9R7axKptrIJ73dbkLBp6hd6ubn1q
         /8d1rQEKogxUBguElUoPhNrlMdWWVGxVp74Dnq8ughWTKCfmKAJYpdVBgfPi6V5FIxtw
         YRFGGfVYUIm/Le9yNZp52TxsnDRbv17V0BfhQrPKYCm1PyowAui7HD40huKo1i/essjf
         Uufs7xDcDccrRTGfCQaN3Ldc5Hk/ELsORfDEnzgDLysGzQmbxCbps24Ka0bkWW3ikNmc
         Jf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946016; x=1758550816;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/HOBdKdBeIE5LskiTRckXQqXZ27Bu0OLdpEVHzR/yBs=;
        b=SpZZu9C6+TpfWbwE1neGXidzv6TmaWoIxmkqJugJI13A2tv61kNZR5/jbkoty07Ptd
         2LmFVGaR2swDffdfcyGmT8VQEA+5uTEoejQs9vRhJsEGE/v8mrewGyeqAJVbcAgtr7SD
         MfDLLbeFIvbEBITEVrYPoBGv6FxlPFEQ/PjgHEI0TbAFV+IzuK+18WCZB87Cups+Qjpq
         pJqaSbW+7HJ/KYg0+o/V9vptsZow8eWCfgY+rMQ3ViDggUyEkAUtUZqLnX4jnFRpvaOw
         HQhethbT8CVuUWkkmCDFTvAbRtLl68NQzIKVzzHhhs3+qngu9SOBqFXMQmDCOuDM6fz4
         oZbw==
X-Forwarded-Encrypted: i=1; AJvYcCVHsgdQ3dKpwPexTLhVfZx2fEaApP/cmHhUh+LP3ek0ZOS6kQOOhVqVc31ZuLiGPFu3Tqrd7KfKHcQ4qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHqjAJOopwvBdgA3dqHfWQKX1dziydWNAWsg7q+IeCVNgCr46q
	igoCKJVHqYRz/H2bTDBxZPst86Vl9BSnu1kX+M/o/ZqJFOQFas/aeC9YsaEp/BmKLGQ=
X-Gm-Gg: ASbGnctLQCCWXgo2eyIYlrETsA0vmeYQDXs5R0Idj2Tt9WJDQ4iAFsKrqmufoIfrli/
	4NIjPnAI8mye8IjJB/uLlbgRjTaabGqfTFszNE4U/MszHnM0RF6Yr2RakDqV16eog/DKZshXh9d
	76izMuyE4mfM09AkJ7AVKDW1zJcn+DxTjsvhIdZQj94Niv5mZKgQo9MIEGXpsuowyYxgHLIqF6G
	GPti31hFTmCW0d4D+OO3y/U0nulcqhCwWg1QdjbCtfqygjhlBsr89AnZvTSb7gBJhAFWfvuaXJ2
	UgHppQGc/PxxSqLRjcMoM0K9vhUHCEUeC3gE2rgTmxek+IAo8Ularr0aEKBfbpqXHMGYRiRawWB
	W4DZAcAT1giM=
X-Google-Smtp-Source: AGHT+IEr9ywKHT8W8C37v/Lf/D76aQexJpKD96gz1cziMZ3TMNCvKPnp0aeaGYo/6Ls07zNiG8J5VQ==
X-Received: by 2002:a05:6000:2008:b0:3ea:6680:8fc6 with SMTP id ffacd0b85a97d-3ea668092cemr1775272f8f.3.1757946016139;
        Mon, 15 Sep 2025 07:20:16 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9c2954b10sm6780169f8f.50.2025.09.15.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:20:15 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 Sep 2025 16:19:21 +0200
Message-Id: <DCTFU1UCDSZZ.3J6L3T6TYTELM@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH] KVM: riscv: Power on secondary vCPUs from migration
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Nutty Liu" <nutty.liu@hotmail.com>, "Tianshun
 Sun" <stsmail163@163.com>
References: <20250915122334.1351865-1-tjytimi@163.com>
In-Reply-To: <20250915122334.1351865-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_072018_768905_4A6D204E 
X-CRM114-Status: GOOD (  20.20  )
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

2025-09-15T20:23:34+08:00, Jinyu Tang <tjytimi@163.com>:
> The current logic keeps all secondary VCPUs powered off on their
> first run in kvm_arch_vcpu_postcreate(), relying on the boot VCPU 
> to wake them up by sbi call. This is correct for a fresh VM start,
> where VCPUs begin execution at the bootaddress (0x80000000).
>
> However, this behavior is not suitable for VCPUs that are being
> restored from a state (e.g., during migration resume or snapshot
> load). These VCPUs have a saved program counter (sepc). Forcing
> them to wait for a wake-up from the boot VCPU, which may not
> happen or may happen incorrectly, leaves them in a stuck state
> when using Qemu to migration if smp is larger than one.
>
> So check a cold start and a warm resumption by the value of the 
> guest's sepc register. If the VCPU is running for the first time 
> *and* its sepc is not the hardware boot address, it indicates a 
> resumed vCPU that must be powered on immediately to continue 
> execution from its saved context.
>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Tested-by: Tianshun Sun <stsmail163@163.com>
> ---

I don't like this approach.  Userspace controls the state of the VM, and
KVM shouldn't randomly change the state that userspace wants.

> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> @@ -867,8 +867,16 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	struct kvm_cpu_trap trap;
>  	struct kvm_run *run = vcpu->run;
>  
> -	if (!vcpu->arch.ran_atleast_once)
> +	if (!vcpu->arch.ran_atleast_once) {
>  		kvm_riscv_vcpu_setup_config(vcpu);
> +		/*
> +		 * For VCPUs that are resuming (e.g., from migration)
> +		 * and not starting from the boot address, explicitly
> +		 * power them on.
> +		 */
> +		if (vcpu->arch.guest_context.sepc != 0x80000000)

Offlined VCPUs are not guaranteed to have sepc == 0x80000000, so this
patch would incorrectly wake them up.
(Depending on vcpu->arch.ran_atleast_once is flaky at best as well.)

Please try to fix userspace instead,

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
