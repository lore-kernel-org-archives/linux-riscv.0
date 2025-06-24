Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E317C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myRYL2ejnCgS+RwS31oQACH/NLntrTMY4OFcqsKWv8I=; b=EVS6sIPHPjxFJe
	8V2Qqdk1vW4IDzJJEW4/e+ZXppLIQROc9rTpz7io6zObGv98W4D4OBar/X3viB4biaAlB4n5M21lJ
	21Lek/uaIGWy/vbuz/KUrgD/nqP1SRkwGh1pFm3y8cRCknz+3b9BuKztIeyv5T/jk2ODo1JNcE4aq
	MDY3anOoQrvBrKOKRysg0qii4hPsR4Bi/VXFOpONM3aZ+f5bBgHa+tlL09C06fopi2ALgyTa0tqL3
	bKR6dypWSpygCB056GG4LAehzJMHKkz1hAzYKGiCzz/IlS4QHyFPNGi29qx3gfR0zRPd5rCsRtoWJ
	FUE2HES6iZlkEw3sOeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pc-00000005r3N-0cEv;
	Tue, 24 Jun 2025 14:14:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3yV-00000005lK3-2TOa
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:46:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so3466294f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772770; x=1751377570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eoo0fa0GCv1oBnTiujtR7cKFf/6yNPbDr+2avmoEsNU=;
        b=G7MVtxqRuCtXtejQBF3gxCo9UByfiVThJPnIE6VOaBsIZsYngHetjpdzIN1jkn0cp6
         MU2fk2TFR4pRbQJaKVtLqfLs4dAKNpJFwMQVG5knNzrddQgL6+5CISwL/XN5r6g7eMZs
         dOUlAyH+CK1Kwb75feAHxc/PDE8XboQsOuiXEHFKgK8nHiT5tfbT/mN6W42zUWMILVmQ
         0HwjsYhULGP4StYTIBJxKTp5hMR2VNBk3AqAfgt2XN48WsFx2qo0g0WNMmkAtkLsB1YV
         Lj2OaVhGDHnnzIYkyL7DBYAYlY0r/hcHo7r1PHoMbMMXHlkJSZ/EHdWqJfeu2QNggV1t
         pfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772770; x=1751377570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eoo0fa0GCv1oBnTiujtR7cKFf/6yNPbDr+2avmoEsNU=;
        b=ODBEw97jBk87mmEbV+uZwOJPby01P39hS37/mzpeKeb0UB+eqsSzFk2Tlo0GoNe3q7
         AES07e9aJSF9FqdTqkHRNAPNHxmo8xnAa0V1U4ykh4hJH57titPzirSTMXpQsosoQNSc
         vVZdiFJnYI/4eTMYvmtavj0Yo+5vyk8XcPvS8WNsAc4ltVxifoZsXJBigO+c2uPCoU4+
         0OMqFDzLPeuB7cXy8cfpnwsASXJVLrGXEjgo1OlB35yqYDg0m54S9MDjFLOnQVak/aZS
         fzc952JFRUt2n77NC8CdgUoMs2cgniKNQTU6bjBQTvNVN9icUxgzcaQ5aqg37Lfp4nTM
         ZMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/qEIv2/VhEOHwF+2xLtbHcBLogmGqy32EC8GSqkLEqexkdP19x8iWLHFU4ZhWSXgRBCpjwmVBxFGiLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgikm5AzUh6AvqDsiXHZtyQktxl3/wBJTtGVUrzkjTVD2RPOyD
	1xpR1Xf5xZqr3CLVcifiZT3Mb1eQZ5fv0rwFLpm4TD2UZzSCWmm/8L9SZbJy6xrNfUhSM298Oxl
	37483dQo=
X-Gm-Gg: ASbGnctm5ZpoN6QJYTO2UDGujK5ah5z8bdP6uXvNn8dTeNsWMjcf1v6VlRii1HqYBYN
	EhRnX4oaFzH7HSJ9V1v4IqqGgAle4mQBzmRzXl/lXtKTvUuuB/E+aH7aPUYuSSs2AMOJFmQlxdj
	33jnfcTCyw8OGMXiacHOYceS2IhUaNa7nQImqcxOFCDTPdhZuTzVOn6k4Yqhrw/APQqD9u0M/DQ
	6pMGHfvUkw05DgCG/Q+nQSDKgQM7hoIEY+p+HyjtQZ84uLFpAmfw+uFsSaebB1Ywv9rPHH3kdAv
	4eMMbPSkq1PYv2lAIQF82sLGTX9mifmt42bAzhXeQl6lIHvC5A==
X-Google-Smtp-Source: AGHT+IFEAC1W+Y170mCC2sU03t16kmaicwlOVBXCKZyNDj9U1iBSb9Gp5uGrQiBVTIpsYnn7B2iLdA==
X-Received: by 2002:a05:6000:2583:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a6e71d4cf3mr2905989f8f.16.1750772770139;
        Tue, 24 Jun 2025 06:46:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8068fd0sm2066068f8f.38.2025.06.24.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:46:09 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:46:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/5] RISC-V: KVM: Allow Zicbop extension for Guest/VM
Message-ID: <20250624-fd191a60c31c732c0d401f46@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064611_630005_5E5779DD 
X-CRM114-Status: GOOD (  14.60  )
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

On Tue, Jun 17, 2025 at 09:10:30PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zicbop extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 0863ca178066..56959d277e86 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZICCRSE,
>  	KVM_RISCV_ISA_EXT_ZAAMO,
>  	KVM_RISCV_ISA_EXT_ZALRSC,
> +	KVM_RISCV_ISA_EXT_ZICBOP,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index b08a22eaa7a7..d444ec9e9e8e 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -68,6 +68,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZFH),
>  	KVM_ISA_EXT_ARR(ZFHMIN),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> +	KVM_ISA_EXT_ARR(ZICBOP),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
>  	KVM_ISA_EXT_ARR(ZICCRSE),
>  	KVM_ISA_EXT_ARR(ZICNTR),
> @@ -171,6 +172,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZFA:
>  	case KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_RISCV_ISA_EXT_ZFHMIN:
> +	case KVM_RISCV_ISA_EXT_ZICBOP:
>  	case KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_RISCV_ISA_EXT_ZICOND:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
