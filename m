Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBF0C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvKtHVesj69JrOKgCGP9FQR3KjkU5opGSaAS7GrYSxc=; b=aH9V+ylwZtUckf
	IBe3VMae6m28mbd33atZC1r5mijZuJDwm9xn1wsktN2nopyoutpZee4FFA29jkw2rqa6wc0JIimoI
	sLwJWEAtT+LA56z0PhJgEN/so+LvIWL+vTQ1nzhZ/CpM+w5m+OI0SrZYR/+y5KmUYK/6JzCyzCqls
	SjA++F9/NSo67vJ2ig6GdFSlG14vHmLq2mAz/+GJ81aONgVPrCNxHKjZceywRKhS5Yi/X8N2eva8X
	DZW7X/w53DRm1Vf5rm1nLuj9p1qwBb254g0d7d405DhZSyPFBmlDLNoe/VtvQuGmN7x1GHFArRTSo
	d7EJ4Ipm2uBUwrgi4Fvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hpa-00000002RSd-0nuJ;
	Wed, 22 May 2024 09:00:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hpX-00000002RRO-3H7r
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 09:00:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a5a5cce2ce6so861649566b.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716368414; x=1716973214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ5Hr3rLuHhBVJcgCy9JEFxvkpMRBY5L1Hcin1IIURI=;
        b=Z2SnJwx6UKN7joxrLrE1c3T7PX6g/6tudhWJVXiXnjzvNGny37aD2gDBMjOb7siWpA
         WrMhLRCCLkErA0t1mDlSoTo1A00Jmj19+EWN48xLQzl0o51pGjWedRQ4MPb2Mt3iZ20t
         NUocHpGWo3TEcIq3Pr4pHD5ww9XJj1RTvxDMG5OiZN9QtjStdctXii9TnZ0XsAwKcJbc
         EPu4ttYS64m7X+TM7NATcZNH48gYUAxsBmX/PBkKO43sZ3ZYkG56ISD4+R3CLyzBroMD
         DZWGMUs26o/mrdTsmSf6DPDjyH7lI1YI2TLuAaA35O5n+R+55zvr0hUGMgQwML6t7rET
         1yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716368414; x=1716973214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ5Hr3rLuHhBVJcgCy9JEFxvkpMRBY5L1Hcin1IIURI=;
        b=KK6M6HGZCcUV7LFXHSkeMx5iVJXWaNZzQPPWbJ4PVckNzDtiws4CUTMV23XTwWw5dY
         yFpJMICP3jBfIRiyG0fe2BMPMtc3birYGv6tL0gLMzcpZVhJb20xt7iOyu90ZOTrfkD5
         BcZb3WYlZ+hEZqxeUuOzW7diaFKMHdGU7mLKKU9q19TUySND5GCvelnjEOraofE5HLUj
         QgaRnUxzYy8wyv8zGFcwkJ4WaZ+cVN4w7MJ7nrGbIys8zSqIxJ8H/JHu2p+lpY+DSTmF
         +Uh9FD/iGSkuLnM5hDm5A7uOp6emccAzz5wnw0U7fqYjB6Tkf7Z6kUEC0Qrz8WbMEXXp
         D8/Q==
X-Gm-Message-State: AOJu0YzKOAaq2XlPBFUypAUl4tigUw76Jn3dtTJy4p2Jxly00NYGKG6K
	FtTqMstwVcyo3eihQeNJnPk7N/oUGiZ9PYS1HddsyJgHufZ6VMSFgxTTRpNcIZ0=
X-Google-Smtp-Source: AGHT+IEwdep8vQZ/ua7S5w4rCp0YCSyEUG5g9WHDPfQAhOr3vrC9k0evxDu/P938ceZsPJNhCgo6Ww==
X-Received: by 2002:a17:906:4c56:b0:a59:ca33:683f with SMTP id a640c23a62f3a-a622807c04dmr84271866b.28.1716368413766;
        Wed, 22 May 2024 02:00:13 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1789247csm1741002666b.82.2024.05.22.02.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 02:00:13 -0700 (PDT)
Date: Wed, 22 May 2024 11:00:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] RISC-V: KVM: No need to use mask when hart-index-bit
 is 0
Message-ID: <20240522-74009df58fb51008bae6cbaf@orel>
References: <20240415064905.25184-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415064905.25184-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020016_102244_3E6792D7 
X-CRM114-Status: GOOD (  20.14  )
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

On Mon, Apr 15, 2024 at 02:49:04PM GMT, Yong-Xuan Wang wrote:
> When the maximum hart number within groups is 1, hart-index-bit is set to
> 0. Consequently, there is no need to restore the hart ID from IMSIC
> addresses and hart-index-bit settings. Currently, QEMU and kvmtool do not
> pass correct hart-index-bit values when the maximum hart number is a
> power of 2, thereby avoiding this issue. Corresponding patches for QEMU
> and kvmtool will also be dispatched.
> 
> Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/kvm/aia_device.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index 0eb689351b7d..5cd407c6a8e4 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -237,10 +237,11 @@ static gpa_t aia_imsic_ppn(struct kvm_aia *aia, gpa_t addr)
>  
>  static u32 aia_imsic_hart_index(struct kvm_aia *aia, gpa_t addr)
>  {
> -	u32 hart, group = 0;
> +	u32 hart = 0, group = 0;
>  
> -	hart = (addr >> (aia->nr_guest_bits + IMSIC_MMIO_PAGE_SHIFT)) &
> -		GENMASK_ULL(aia->nr_hart_bits - 1, 0);
> +	if (aia->nr_hart_bits)
> +		hart = (addr >> (aia->nr_guest_bits + IMSIC_MMIO_PAGE_SHIFT)) &
> +		       GENMASK_ULL(aia->nr_hart_bits - 1, 0);
>  	if (aia->nr_group_bits)
>  		group = (addr >> aia->nr_group_shift) &
>  			GENMASK_ULL(aia->nr_group_bits - 1, 0);
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
