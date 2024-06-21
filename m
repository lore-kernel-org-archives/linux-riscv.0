Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E036C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7qv6Xl8HaCYgKVfQo3dvhA0IOoVvRxKRbSLc1WSJLA=; b=xr8KJ8JXEztOvN
	IA78NX9dPrqGtLbbuKGWXLKxJIm71iPpxyq3nI7EwLoZ+XVWYIhbfKRJ879cWtlAX3py3I5w3pwLU
	WYi5ekQxsDWB4gkCULff0ZZjW3kPKA1VmMz48qArJ2l/dawfhiIe6inCtZrt9A1tWiL1Ja9IX5OdX
	jK4fOtpKwTVam2xK/cPoXgf8K0wmp7/d9rLzYBQRHj3umS5po5TZg4h1nW24n24Mm5G7BSsmv8XKh
	lVQ7NyJ94leaBfzCCBYtWcy9Pdu91hlNJtZCROvzcZlD03vz0mI8q5IEH0uD8Pm4fL0MN9HkbBltv
	DGj+ypOLWvT8AckwYPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKa1Z-00000008Qi7-2RaA;
	Fri, 21 Jun 2024 08:53:37 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKa1X-00000008Qgt-2WgS
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 08:53:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso1994405a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718960013; x=1719564813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHbob/VjuwQy7mgeQNSOdhI4orkGQDAEUkxEcv4Rw3I=;
        b=CWbDcmdsjDerKc09L805ckXzRwNUi14qdFQiAKFCgK+PNZrvRVKC5ImGF4agRAc22Q
         lhXcFjPK+627K2jm6GngxsYbkkm/8UuE4tHa+9yqsHCQM5YUHtHYyvp9RwazD69wg68N
         gr+raxoPLGFYOoQzlDWJss71noo2GhmUXFiaMn6cvMI5hQmx0OYQha9cak9T7XXEOfcU
         RaI1MS0VCigReIeHmUcgiq+lcTl/D514eiBKcH7WVqag/bx/wcBfiv7jLrBosaiPie77
         f6Xs6b5fvuueOMkEcHjL3gTtGr7SbvE4o0YyIMa5afrbaan4hV3RQa3PUktaLUaqbd85
         aw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718960013; x=1719564813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHbob/VjuwQy7mgeQNSOdhI4orkGQDAEUkxEcv4Rw3I=;
        b=uTkl90LROh0y4Bmo5h6clNxVtwi+mxNO3KY/sy1Hggf3l3mQLkm6MlvSewDlkkpKMk
         UB5UMngpjsr3UEyR27HNxNxcQYURdtXhboJVjjA/2XJBKEAtfPbaJCYuT6NCpE4VHVro
         qGjxf2cw+g/dwHgJo1b+35sHy7XspZVjMw6VcQlzWsPeXUh605GSeUIeyls0NgzuS9o1
         yX5F4ni5un9F5ZRZXv3IUarhC+jVw67LGVvMGu/r/zboFtc21Y57OeYWPZC6N0Ya3gmD
         +rUkTmJfxYMKHH4gDvPSIqG/CkehLnIQ5d9tdCYUhG/jFsqzQ36+PCxMXIWDv7HD7Liu
         a4ng==
X-Forwarded-Encrypted: i=1; AJvYcCWvMA3IvCX85cSiS/7yirb0TEqbSh5KhyLpMcSsfsGszz1j8npW2/JWRebgynLWxTyzeTSbYhbmHAYAkZFQDDKJheYZiczcLafnFm/aOKMF
X-Gm-Message-State: AOJu0YwPCyz7ASn/1PE8v1utP32OKLZ1yiEabcY1ALQX1JdBGNYGFk76
	wuGJPaz5cqdPeUs4fBN0VnwPq8bPR+ARMqvc/S+UVyx59IlvKOGTyRrZ0wp++hGAk1tadePrRCV
	WJwA=
X-Google-Smtp-Source: AGHT+IHkm/oNBDIDLkuaQ777H0KNvj0PKQQ8b7Mc9eNVWoGzQpZxRs7ccJxtYM++XnYbEFlLwFFDDA==
X-Received: by 2002:a17:907:1b0b:b0:a6a:ab5:6f2a with SMTP id a640c23a62f3a-a6fab60a12fmr716591066b.11.1718960013134;
        Fri, 21 Jun 2024 01:53:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b4ddsm59093666b.67.2024.06.21.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:53:32 -0700 (PDT)
Date: Fri, 21 Jun 2024 10:53:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, apatel@ventanamicro.com, alex@ghiti.fr, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 4/4] KVM: riscv: selftests: Add Svade and Svadu
 Extension to get-reg-list test
Message-ID: <20240621-f02c058395f929dfac9f3883@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-5-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605121512.32083-5-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_015335_647872_9B4DFFB1 
X-CRM114-Status: GOOD (  14.20  )
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

On Wed, Jun 05, 2024 at 08:15:10PM GMT, Yong-Xuan Wang wrote:
> Update the get-reg-list test to test the Svade and Svadu Extensions are
> available for guest OS.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 222198dd6d04..1d32351ad55e 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -45,6 +45,8 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADE:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADU:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
> @@ -411,6 +413,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(SSAIA),
>  		KVM_ISA_EXT_ARR(SSCOFPMF),
>  		KVM_ISA_EXT_ARR(SSTC),
> +		KVM_ISA_EXT_ARR(SVADE),
> +		KVM_ISA_EXT_ARR(SVADU),
>  		KVM_ISA_EXT_ARR(SVINVAL),
>  		KVM_ISA_EXT_ARR(SVNAPOT),
>  		KVM_ISA_EXT_ARR(SVPBMT),
> @@ -935,6 +939,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
>  KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
>  KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
> +KVM_ISA_EXT_SIMPLE_CONFIG(svade, SVADE);
> +KVM_ISA_EXT_SIMPLE_CONFIG(svadu, SVADU);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
> @@ -991,6 +997,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_smstateen,
>  	&config_sscofpmf,
>  	&config_sstc,
> +	&config_svade,
> +	&config_svadu,
>  	&config_svinval,
>  	&config_svnapot,
>  	&config_svpbmt,
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
