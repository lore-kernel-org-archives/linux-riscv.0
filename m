Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E643CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWF0MLiOF2BCKYs6MRC4y7RUPTtNxuwHNsFZSmZOOJI=; b=VTzHzstAWpOhJX
	uPUov/iHtWiCcpgvlkkXXwctAR5CClfDZI3rsnjflUkmVlNaKSGl3Fk0aWnhFNp6a80rI3RQMfTZG
	Jpq/l9iY8lQhNabqySOZIFnIn02x8uPDPQ5IcoEwAFLjfFvPSX4g/sp7ZQwRvH4fWYRp5TEh2lNK7
	nD2nO+YISLwtlfqA4kYeCiisc6s9HviBR9sNtt39P3PF0VPoh+KEfci44wri8qGBZilmIi1Q6jVpz
	giZCf6D0CbomQqeFnZ2jIztzUyj1mNK0brdoOFDqqeg1EbKY7nv/Mf98lnTSne6XNgUSDlJbcc8Sj
	c7eike25Audamr0WoR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCSf-00000005BNw-2h3T;
	Mon, 15 Sep 2025 16:53:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCSc-00000005BMg-3d1H
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 16:53:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45dec4289f0so2404715e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757955229; x=1758560029; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMjc1jYjo0pPUV3IEMrRaUWcTH6UPkM8lTmOpgavsDM=;
        b=F0LWUPEYEz/Qe9uG7w/HQs+uhjspaYdWBBTlJfc7OX6hZYitUXQYe0d5qcO4M6X0uc
         qcAJdWymaYc3RqfZDN4jwNRNc9GGfulWyckHKYG4/GL8cZHxLktGox5iPMTnh1dBNFpb
         icsSX8W+Xh1DOgXqY2JHGNkDcsTfwm5dhJ/NuxGt/7pvWt8tg+cogVH3pXjhIFyhoyaN
         8LDuqc/ULozRp+wzVTXH9lLWyPoY0cC5uF3DOZQcXwn9KS0Occ0huLW04Bh2jlLF9kF7
         T6wxSdoS3pi/RYwKpCMe8WQWiRe9+3JiJhkV8U1lWZ8d2uIoStaj2/9GHeWyFM72Tp95
         gVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955229; x=1758560029;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QMjc1jYjo0pPUV3IEMrRaUWcTH6UPkM8lTmOpgavsDM=;
        b=Wia3dHX/LCu/VAe4jjhPTZWMmxefZRNxZa4BcQzUGEjyVj0E8nKFYjQ2myPZYwlz2j
         ihu2vbSxWCghtzG938qT4qSLCLRh3V56ZV7232He7mLq8R+kBCJpCAYRwhAF93uMSp1y
         JudHdu6P9EH2RZBu456DWjXwbkV5k6De3XqCVDKwRikE2Fnfu4LQ2mMWRtKY/T6PycAW
         p207wWKn4DLBiaMtBrGzeM6m3B+9zQrESb5++y0MlhwcAWSvZQRqXVGxztxoO98c2Zkq
         Et074sUy46TyhY/RLwED7DxwOdVzm/g7rTPw9gY53gjFIP4wrqx9ufXpAlcQOKSjEQl7
         3GnA==
X-Forwarded-Encrypted: i=1; AJvYcCXu/1ei6lPLT/G3zwmmdM9CcUSVhDYym+XRWjsBuIlMHKS3zx+6JGneIXGiNefkyEFGhLGxzsvhlzZIfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+MzyjDioMkyQxRCErXKAM651DXR0JdzhqIlptUJhGOW/HATlO
	UiP7jOUQ0kmwrbOXHodfLwvzJRyyNDRK8EPg0KCIZlAQN8suHyQnxX6JTsn5nnnmegU=
X-Gm-Gg: ASbGncv+C/5aFJIFspbAbAl0Wfs2HBXkSZGvgW5NDckf1ElRKCbvO9Gq7qOUjav08nC
	hVFFVaTtTfbjEjpt5V/IkLDxOh4WcvxpoGCzM2gLVc7B4uracRhRRxHNj/zcYKk4Ve+DTxeiSNq
	Yri5P+N7MGIRXXJ5LNxVHmqwF20Mvxluj9rYeU3hX4w82/QeLUhTvWxxYC8cZJmIIR4tGPoiic4
	EoDcSQ7hgR4pqD1zkE2Nco1JW5WTkNGvTv+cg7mkH/P9kws6D0yvDdw9zn65bStIGykajW30FXR
	HcrwSzrb4NzsA8Zkg280AWaVA/YYBD9I9YUFuKKtlVzgn/WTBBE6S4W83fRKxcMzVK0t12lBXv9
	MH1h2PzDllC0+VKBTKpQXNw==
X-Google-Smtp-Source: AGHT+IEBYG+XYWr4vSIUvW4i/gC6ebTomXgFIobLIBRml4hWNT81ZQCvn/NDrF/4mBzDZAjMlg3idw==
X-Received: by 2002:a05:6000:2008:b0:3ea:6680:8fc6 with SMTP id ffacd0b85a97d-3ea668092cemr1990129f8f.3.1757955228923;
        Mon, 15 Sep 2025 09:53:48 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ec22b16adesm726619f8f.13.2025.09.15.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:53:48 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 Sep 2025 18:52:56 +0200
Message-Id: <DCTJ3N8W4PCL.9XCHFVGS62SF@ventanamicro.com>
Subject: Re: [RFC PATCH] kvm/riscv: Add ctxsstatus and ctxhstatus for
 migration
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Tianshun Sun" <stsmail163@163.com>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Nutty Liu" <nutty.liu@hotmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250915152731.1371067-1-tjytimi@163.com>
In-Reply-To: <20250915152731.1371067-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_095350_926457_00CDE5CE 
X-CRM114-Status: GOOD (  17.33  )
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

2025-09-15T23:27:31+08:00, Jinyu Tang <tjytimi@163.com>:
> When migrating a VM which guest running in user mode 
> (e.g., executing a while(1) application), the target 
> VM fails to run because it loses the information of 
> guest_context.hstatus and guest_context.sstatus. The 
> VM uses the initialized values instead of the correct ones.
>
> This patch adds two new context registers (ctxsstatus and 
> ctxhstatus) to the kvm_vcpu_csr structure and implements 
> the necessary KVM get and set logic to preserve these values 
> during migration.
>
> QEMU needs to be updated to support these new registers.
> See https://github.com/tjy-zhu/qemu
> for the corresponding QEMU changes.
>
> I'm not sure if adding these CSR registers is a right way. RISCV
> KVM doesn't have API to save these two context csrs now. I will
> submit the corresponding QEMU patch to the QEMU community if
> KVM has API to get and set them.

I don't think it is...

> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Tested-by: Tianshun Sun <stsmail163@163.com>
> ---
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> @@ -489,6 +489,12 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
>  	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
>  		return -ENOENT;
>  
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxsstatus))
> +		csr->ctxsstatus = vcpu->arch.guest_context.sstatus;

Userspace can set guest privilege mode via KVM_REG_RISCV_CORE_REG(mode).

This does propagate to guest_context.sstatus, which is otherwise
internal KVM state, so we definitely shouldn't expose it directly.

> +
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxhstatus))
> +		csr->ctxhstatus = vcpu->arch.guest_context.hstatus;

Neither should userspace be able to directly set hstatus.
KVM should derive it from other userspace configuration.

What isn't correctly reflected in hstatus?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
