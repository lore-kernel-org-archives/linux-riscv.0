Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B67C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADsiIJTlBTObRuoU4DnwVTv30aXRi49zYvky+y08CHE=; b=lNJVLA2iMFGTaP
	5CNkmrzetbSLzzGfkqy0LV6x7FeEqGnsMz7Zd9AeoImDE4aJSWuozM676M+joS+O9AP/GVkF8FfxX
	pOScY5WBvOD99RzxHv4sW3kL8e3DRRFzTWNZpyv/99ZQtj4WrfIdCPyC/adrtjDLRmZ1g/ERklNwn
	z6VU/roCcj4rZmBLpwvLWoSm5N1tsYD0wdtDhwjYjGP8QAz3a4DCbx5Km7Emh0186dRUI8ETBQOfp
	dGXhmJyEfPh/JRpkkxQEsseNWDPbngmxRTfch3gokPUtZJsabEKpo8ArTHTVOB2+dslzUK8J9cXG9
	QEnD4zxVFksN73kRl+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfoO-0000000BeiW-1K0G;
	Wed, 19 Feb 2025 08:52:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfYv-0000000BZKW-02CS
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 08:36:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3308656f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 00:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739954167; x=1740558967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hX5Pqy74HJXGhYd3EYVGCK1e+ORfs5MU+F8H+njiblE=;
        b=fS3FjYJGyqCLb0dvezGwFk9jMFUMnrPk7ODT7E58EVlemFEZ1gTQmnzpkYfFu3Ja8X
         flaISJ84q5/G07bYQ//XSWQYLbpah+ci3YsPOVP3y8iGNJISdx4SAbVofN9POyGKQNSt
         c0poO3EMAdTnnuXDmujYjLvzCUJJX7gblPm1qJ/UnFer75hwgXLaMjviyTvLjYuaoNvR
         zz2meWFblIST1mImdEXFfqfO+ksxwVOd9YZKZA/6bMvcfOS4SOGsZl2n4Mj4hy1T9UvF
         QSUCQW2TQFCS9qbBFV5MvM+fqFojElHwu7bMl41OdYXUMU1hQ4jm0J5h7xB7+C0Lf3Ma
         C1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739954167; x=1740558967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX5Pqy74HJXGhYd3EYVGCK1e+ORfs5MU+F8H+njiblE=;
        b=KiIpCJeoX9VqlokOIj9nCOPDhzdjtww/pH5Bpp5l9nX401ZCASU8Ebgdsc8bEJtFyI
         2v14XAUVsW871jk4HsgOH4nWI46DDgpn5BbXvjoxGGuida5vHsnZp27UfSEFma4gi3cH
         DIuZKNpWjik7fAeMNyLnV5rJyhchlJihqduuuuTtGCAk47NFkQ29E+Jv3On3Bg3mz4kb
         WT+s6uflDDRfA/qhB0DPjp633NSR0GQ4PmBSmypvEamZccPHUiiK6sRFIscXsmmj/O1R
         ph0YHFALvKpq79waL33CUR2sUloMITKUBS26e2bFuGYuk5QeH9a8HpJhSeExKqLfmLLW
         ZuEw==
X-Forwarded-Encrypted: i=1; AJvYcCXQjONr82vMzh0T3FXSzZyVj5pTSQrB4WW+X977qu2mvBe6Q0uv/wfnEDwmTLB8wl2sJTxjQY3EFPq+vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuzP1M2BL3WTbcOR30W+t0dHme9AMthKcvMXkqFop9BCLfnems
	h08sXbL2tW8sOaePP0D0IUOw4j/nyWDKK1M69vJ870mszxofslarVGUYnFw4myQ=
X-Gm-Gg: ASbGncvQZiZWum8XjpjAoxx7bbbOPA6VSuX/fRHvUPaZFe18CvYKSU6i8TsG2AomnDQ
	zAa8qJzTilJH1Gipu0MN8+XP6R7T2XDpJ/y9oqSp2+jDgWpwwHMpT5cxg8qveVqFYpb+RqxWOMm
	cDUBwP64KmKhb7hidSA710WbtAyWfVFRqgx/h8zf5d/3KDs+l6JLvFfpFfTyDZ47I89bfvQKfNZ
	ADkUIC0IUU9P6TWSbFh1q8B8TVu6uRE8hl7KnS5/aggIbGjW5QIh8CLLQ/dkyf9kaRDh2+oMyGz
	zH0=
X-Google-Smtp-Source: AGHT+IHs4kVPkFYUzWm7KaTrDUxtzlrgRhTgXt+SxWy9TWu9laptUSWnP8MSP8v1LxvgTwxXTCCeSQ==
X-Received: by 2002:a5d:6484:0:b0:38f:4c30:7cdd with SMTP id ffacd0b85a97d-38f4c307ec0mr7919846f8f.37.1739954167212;
        Wed, 19 Feb 2025 00:36:07 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d58f3sm17085819f8f.73.2025.02.19.00.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:36:06 -0800 (PST)
Date: Wed, 19 Feb 2025 09:36:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: anup@brainfault.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250219-badec60b9b12834cf534dcbf@orel>
References: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_003609_053327_8CF4D969 
X-CRM114-Status: GOOD (  20.16  )
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

On Wed, Feb 19, 2025 at 09:54:26AM +0800, BillXiang wrote:
> Thank you Andrew Jones, forgive my errors in the last email.

From here down is all exactly the same as your first email, which I
already completely replied to.

> I'm wondering whether it's necessary to kick the virtual hart
> after writing to the vsfile of IMSIC.
> From my understanding, writing to the vsfile should directly
> forward the interrupt as MSI to the virtual hart. This means that
> an additional kick should not be necessary, as it would cause the
> vCPU to exit unnecessarily and potentially degrade performance.
> I've tested this behavior in QEMU, and it seems to work perfectly
> fine without the extra kick.
> Would appreciate any insights or confirmation on this!
> Best regards.
> 
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
>  arch/riscv/kvm/aia_imsic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index a8085cd8215e..29ef9c2133a9 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -974,7 +974,6 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
>  
>  	if (imsic->vsfile_cpu >= 0) {
>  		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
> -		kvm_vcpu_kick(vcpu);
>  	} else {
>  		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
>  		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
> -- 
> 2.46.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
