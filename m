Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021E3C54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ar+tyzSNqHl5HXgWZXAwR8qh9LruakrrQPrJ30hiKY=; b=oMskI/8tKcHiCF
	BH7hWtj9BO7iU8OGT/DFHm+0N4RfcHCu76dEH4qPmTEEfWG5jGiAuwIMOrSCeyLN7CuUaBroWwObK
	/reUbNneKJa8GF5IadgXxCcE2xZ3v/TeYD7aa0HiikkkdjEmAErG/KVt7t0Ab7wz3l98bfnZu0rON
	qGufmTqT6IZbkEN5uljn0YM10pPBZwW8v9e5CFCjLTqrcjWPZlkaGygURblRztaJac0Dmyw2/BNfh
	VdPi65aGqr5whQk/hfq8BQikh44UOhDO+6VJKuVNIAkZE2AuSrUIrCkdmLm4I17qy60fh/YxpzDM2
	IYaN2IFHygAHPnkpDTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgMz8-00000003M5u-1mXV;
	Sat, 02 Mar 2024 10:52:54 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgMz5-00000003M4M-1uBb
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 10:52:52 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so6813496a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 Mar 2024 02:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709376769; x=1709981569; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCdvI1CI1wq3H8VWZLB+tHk7uMQZkydnbuu9eDe1Sx0=;
        b=JKcdTveLVh+S9K8jPasLhMxh7Tq25zSb5oqPVaun188a0rebRS6DdvOlnxP1U1vnkN
         BFRQMNlyQcTZlvYX5f05rRTw/XQFnoFEpcuL0uSkA0zDvXw8mvTjcqTq9cWEYaRgRd5S
         nNwEVIk3/7rLH89AJwxP1E9c+fp3p4yoBY17ATl6pzzmcH9nZw4l6X9oxegEpTfcHgf9
         tAzwr2NUwMiWjsIau7WPrFmPvfH55zqWMUrB2OEqXLdcL4t1cGI9BgnOJNYAJWyGLa8h
         E2pHURu0HstG5n7DnLdDI7pjKpYlGLFWAWnCkJwaPdDaZeQapHnastHOL1E56AXGgYWD
         92Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709376769; x=1709981569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCdvI1CI1wq3H8VWZLB+tHk7uMQZkydnbuu9eDe1Sx0=;
        b=Qx4NTACYJQ/9ITBeruHollKkjGPev4WF9++eS+sR+E54SLygPfgD0cILue5AiFO1DF
         kf3GRM2Vl8ErPbBempnyx93KujAwjGvTB6NisgFTi5jYbXcZk3peTuMJbyJEhM4PZrMZ
         2pfdAO1Y+BskovvnVZbPjIQskQmPRMpLTsENNTp+rrcrHBI2hRgTUuFsTjJlZxuruRdI
         GBnC2hOhtHGq3ovNgxjYlqjNYePyceKWzT6PcLk6QVaRrrj55M8lbBCUd4Fb99otyld3
         i/TrHSRg7lxDZED7FspxJj3uO6cBP2YQSDtdNyafhtPGJHZSeadHvi5IrJe8WZG/Ea8N
         ASgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8QuWzfzgXnePXAgEN4aj8VDNtNbVEhfvz7GGnX8x2j0By1qwAbw4r8VdSKKfXejTxVqvZvGVKLtMVy6jznjTOC35p49quzFt0WNtE+FSD
X-Gm-Message-State: AOJu0YwwDtzEYzOQzj4rm1+C+fCNc92GB4FThjQf704vKvsBUeOFK6Jg
	C5n+C8DULMcOqXDdEIBZhed/2Voa++oXDy+4lJTk93g6XpMWM2D9w1UA+i2EP+I=
X-Google-Smtp-Source: AGHT+IH6Pl/QPl+wRDhZFxMPC4+oxVy5/XhywXdvlh+0HQh8Mv83KzaWy/I5XWneZ/OFSKQ1NKD+og==
X-Received: by 2002:a17:906:c2ce:b0:a44:b9e1:560f with SMTP id ch14-20020a170906c2ce00b00a44b9e1560fmr2326365ejb.14.1709376769624;
        Sat, 02 Mar 2024 02:52:49 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ss1-20020a170907c00100b00a43eb697337sm2596196ejc.49.2024.03.02.02.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 02:52:49 -0800 (PST)
Date: Sat, 2 Mar 2024 11:52:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 11/15] KVM: riscv: selftests: Add Sscofpmf to
 get-reg-list test
Message-ID: <20240302-df57978623d37ec586a2748f@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-12-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-12-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_025251_525829_F0CBB4D6 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 05:01:26PM -0800, Atish Patra wrote:
> The KVM RISC-V allows Sscofpmf extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 8cece02ca23a..ca6d98a5dce5 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -43,6 +43,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
> @@ -406,6 +407,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(V),
>  		KVM_ISA_EXT_ARR(SMSTATEEN),
>  		KVM_ISA_EXT_ARR(SSAIA),
> +		KVM_ISA_EXT_ARR(SSCOFPMF),
>  		KVM_ISA_EXT_ARR(SSTC),
>  		KVM_ISA_EXT_ARR(SVINVAL),
>  		KVM_ISA_EXT_ARR(SVNAPOT),
> @@ -927,6 +929,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
>  KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
>  KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
>  KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
> +KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
> @@ -980,6 +983,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_fp_d,
>  	&config_h,
>  	&config_smstateen,
> +	&config_sscofpmf,
>  	&config_sstc,
>  	&config_svinval,
>  	&config_svnapot,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
