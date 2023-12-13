Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07BCC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlDKfrIXE7NWQQC4Bm36XbXmVtm1q8gkbEHEbdMdf5s=; b=Hx48Eev2Nvd2ey
	M/F/whf7NsJhTR8h3dZ5I80+R43rdOirZAqoNBvOgDg+8dSsfLCwdgRBM5OHp1n9NSzABkOHkA9mO
	+f3tMbYMkpc132qunlhLFDPARw+U1epXyowg6TwNWRVuht601m9DNlD2JGTyhgin69PDYYxUVO8fs
	2jIMVId4AUBN45clcppmhfyEnIdbks913y5uzqzoLdyEN/BWt6nhzpIjkk0QfD1t0qT0gzLMKs+BZ
	+YF+7WNlotodHx1j+RCB/Gf6jTLKZkz3gQ8jtJREI2wXtpoKzbxHGxRNXW4KMr01Iu8OnOy7MT8ST
	OsCd/ch8dIbdexym7IEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDT9p-00Fccg-32;
	Wed, 13 Dec 2023 17:36:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDT9m-00Fcay-0k
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:36:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so44800315e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702488984; x=1703093784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nar7AGpkKCMY3vU9wBOjKXihyoMWUwSDoyGxla1FSMU=;
        b=DC8t14AzlXJvErn95WPBFICU7Ochp74TvheXBFI/sQ1i1bqHIHuXZ02nLp06No83mE
         2BfGLti/YHletuzuWP/P/wA0IQc2Zl9r8ShTPh4kR4Qkii0elUEBaEAaXQEj4vgUryTE
         Hd+NX57aMTvSd00pxeUs8Pc61HnhyLrw2i09AWx/xSDbKxOKbWrAplAJ+lLu9iMqCTiC
         2fjmrDpur/XjeATnfSknezLJSayevO+eTLDigkXrkEmO31pfi5upDZsyxtGW44EzeHGg
         HcOZ3VM1WcCu2r6Xtbg9kB0LlUy4qqahC5W02iwTPAypLB9+0pG4JvG3mNYQNW/dlwYJ
         4Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702488984; x=1703093784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nar7AGpkKCMY3vU9wBOjKXihyoMWUwSDoyGxla1FSMU=;
        b=cYR0w6lovVQ/7+toem3EKksuMBCvCYoU32BxQY90KIWNqzJcEnV6rrzkE3MVTUiOEF
         r/pDLimu8SOOGYh/MJMI53hdEK2l07oRLbXxAJIuOszHXHqDxyjSXD4Fqlf2COpNoBwx
         9qkNtaQZzjFDXVIvUVLPAYqlGW7UXo0sfmAu9ek4y7m+NQkfr1nuZPxuHpyS9omH7LGN
         /vbB0TgNBnsKFckoblaK+vN1ZACIUiNkjjxwJPlQTmZ4MpK9Ojjnu6TKt5EZIZ1mGEkD
         /axVRPoox5JWnKt68GYxLd5xkEovtWBsZqXSjSls+yL28SDRzf1lG0C6RSvabL5IGjqY
         ylkg==
X-Gm-Message-State: AOJu0YyWDcEmkF6AXe/H2HTHNf+MBdfn0z5zIiJylcCJokjCJ5PTvXQs
	NVOCIog/9ILJQcenYIqRjlwVhA==
X-Google-Smtp-Source: AGHT+IEK2Pp7nkWqxvEj/mdVNQpoa5hctJ9KTENrVC46QZLfOUyzk+bN6eF4FhiRrxtksDL5J5C+hw==
X-Received: by 2002:a05:600c:3590:b0:40c:2c56:4f37 with SMTP id p16-20020a05600c359000b0040c2c564f37mr4662038wmq.36.1702488984605;
        Wed, 13 Dec 2023 09:36:24 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c4f5000b0040c57e4ea28sm4720420wmq.17.2023.12.13.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:36:24 -0800 (PST)
Date: Wed, 13 Dec 2023 18:36:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/15] RISC-V: KVM: Allow scalar crypto extensions for
 Guest/VM
Message-ID: <20231213-1c93d927d30feb6d09739e94@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_093626_268545_E2316B16 
X-CRM114-Status: GOOD (  15.05  )
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

On Tue, Nov 28, 2023 at 08:23:46PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable scalar crypto extensions for
> Guest/VM. This includes extensions Zbkb, Zbkc, Zbkx, Zknd, Zkne,
> Zknh, Zkr, Zksed, Zksh, and Zkt.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 10 ++++++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 20 ++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 518b368b41e5..7b54fa215d6d 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -140,6 +140,16 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SMSTATEEN,
>  	KVM_RISCV_ISA_EXT_ZICOND,
>  	KVM_RISCV_ISA_EXT_ZBC,
> +	KVM_RISCV_ISA_EXT_ZBKB,
> +	KVM_RISCV_ISA_EXT_ZBKC,
> +	KVM_RISCV_ISA_EXT_ZBKX,
> +	KVM_RISCV_ISA_EXT_ZKND,
> +	KVM_RISCV_ISA_EXT_ZKNE,
> +	KVM_RISCV_ISA_EXT_ZKNH,
> +	KVM_RISCV_ISA_EXT_ZKR,
> +	KVM_RISCV_ISA_EXT_ZKSED,
> +	KVM_RISCV_ISA_EXT_ZKSH,
> +	KVM_RISCV_ISA_EXT_ZKT,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f789517c9fae..b0beebd4f86e 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -43,6 +43,9 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZBA),
>  	KVM_ISA_EXT_ARR(ZBB),
>  	KVM_ISA_EXT_ARR(ZBC),
> +	KVM_ISA_EXT_ARR(ZBKB),
> +	KVM_ISA_EXT_ARR(ZBKC),
> +	KVM_ISA_EXT_ARR(ZBKX),
>  	KVM_ISA_EXT_ARR(ZBS),
>  	KVM_ISA_EXT_ARR(ZICBOM),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
> @@ -52,6 +55,13 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZIFENCEI),
>  	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>  	KVM_ISA_EXT_ARR(ZIHPM),
> +	KVM_ISA_EXT_ARR(ZKND),
> +	KVM_ISA_EXT_ARR(ZKNE),
> +	KVM_ISA_EXT_ARR(ZKNH),
> +	KVM_ISA_EXT_ARR(ZKR),
> +	KVM_ISA_EXT_ARR(ZKSED),
> +	KVM_ISA_EXT_ARR(ZKSH),
> +	KVM_ISA_EXT_ARR(ZKT),
>  };
>  
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -94,6 +104,9 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_RISCV_ISA_EXT_ZBC:
> +	case KVM_RISCV_ISA_EXT_ZBKB:
> +	case KVM_RISCV_ISA_EXT_ZBKC:
> +	case KVM_RISCV_ISA_EXT_ZBKX:
>  	case KVM_RISCV_ISA_EXT_ZBS:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_RISCV_ISA_EXT_ZICOND:
> @@ -101,6 +114,13 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>  	case KVM_RISCV_ISA_EXT_ZIHPM:
> +	case KVM_RISCV_ISA_EXT_ZKND:
> +	case KVM_RISCV_ISA_EXT_ZKNE:
> +	case KVM_RISCV_ISA_EXT_ZKNH:
> +	case KVM_RISCV_ISA_EXT_ZKR:
> +	case KVM_RISCV_ISA_EXT_ZKSED:
> +	case KVM_RISCV_ISA_EXT_ZKSH:
> +	case KVM_RISCV_ISA_EXT_ZKT:
>  		return false;
>  	/* Extensions which can be disabled using Smstateen */
>  	case KVM_RISCV_ISA_EXT_SSAIA:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
