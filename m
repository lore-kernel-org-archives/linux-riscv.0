Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA19CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lub+FRoMSS7bsVnsxypmFuEGmZSnVclrkG5UqTtz/1U=; b=2Ji/eLzhktRCvA
	CVk6YYy0wtJZM+pWZQ7SKwIfet1fREQYbV+VQSIlX9aGfkKVKGDqdJoiaWyfqy2Z8yu0sJlnbATjV
	B7tEOR50mFeDZa+J+ui3mN9aLRE1RyrFq5MrU2Ht7MBDCBuOOk5apxy+IFWg2GsZo9rqoIcKah8e0
	nJt6IwY4HA/cnQ5dzeC/5zLTW1JK8rlYo8JFvlA8+ZCqo4k9J/bgcE/rEnwfp6U4fM/WkSu/1DPtK
	zNg4qggpaQZ39Rgx+mf11QEl9bvVwN+O4Vjg83+kbhu/FIgsZaKLJz44+kpg5MeEinyCQpyTPZMTd
	WWLNAbqd37SLrvAhQbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkf3-001Wud-2F;
	Fri, 20 Oct 2023 08:15:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkf0-001WtU-1j
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 08:15:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso681473a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 01:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697789708; x=1698394508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9mLk3QRlIYO5dYhhdXhtQWG8pCu0/EaP/qTEbU6WOs=;
        b=o6P385qgE3yx3I/HDdP/gWfvS8wIbvT0+CKeDRfOdlRmKinmG6pw73awwhBgDcYO/f
         2Bsxf7Ff5/Iq/zKQrBWMA6Ez63MwRtpvgWGkRwbw19rd7qyf8oSF+gIwJucLCEssLG19
         JaKnlzJ4MVwHxf0kDWQGbttC9Uf1C8wK1qgm7FI8KqaHQJ+GyUzjBTNVmdape7zbdgLt
         qDU9bDktJL77/wzxFLeeVoP/b59hzCpONPMxXkPp/TlWE/SojHrGbZfQrdpQ2KkOl/eU
         eAvaq5tO4DkIAhWeggiXPoksLcxOS3CZWlxtBkSwyhmjXITqEWrzl4Fm7ZEH+HpLE+dm
         ZzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697789708; x=1698394508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9mLk3QRlIYO5dYhhdXhtQWG8pCu0/EaP/qTEbU6WOs=;
        b=uaa+oc53tWSxh9EeuHhZZFJVo5vGSQeLRDn2gghPmhjrD253c5bxDFbowhtbTSmPcs
         J4H7RADcxXmxddKFk0xeotBocnICpXuuEXAmQ0LZI0/3Uf6gopQ7RnFZYGqU0fQ0WfEA
         gMjnZJtiQ+/j/IDaU06KZuQu5P1nAlyKElpO0ZAjP3QsiZ5HHUqmzr6nrKMgLeJ1wnIb
         6ooNScq9DQqrn8aKuEWWc08VHXAox+wfKlXywLQPpUpHPnA38AvyQXGU3fuv2f6+daMH
         Os7WEybcNwyP/5yZkqHwNJ2ZDBUAfF2ILagsi7ZUwJFHaPtUIJyVnW6NzcC3I5qV8L2v
         FQUQ==
X-Gm-Message-State: AOJu0YwteeDvrcnqyrpEWe/OuTb4Kf06cWtpw4YKwUtF/vZiqtXLAgYE
	ps+E2IzbvefMxJgjW6OaCF9cjg==
X-Google-Smtp-Source: AGHT+IFxDBdUK0jjgrdu/5lSvIddhM3Qd3L9VVDVSECPo1+jfo3eLrczA0b0wVyjpO8bPpxHApIM6Q==
X-Received: by 2002:a17:906:ef0e:b0:9b2:bb02:a543 with SMTP id f14-20020a170906ef0e00b009b2bb02a543mr922414ejs.74.1697789707967;
        Fri, 20 Oct 2023 01:15:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906261900b0099cc36c4681sm994192ejc.157.2023.10.20.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 01:15:07 -0700 (PDT)
Date: Fri, 20 Oct 2023 10:15:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] KVM: riscv: selftests: Add SBI DBCN extension to
 get-reg-list test
Message-ID: <20231020-825e5e2e7d355330a93f1194@orel>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020072140.900967-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_011510_580694_EC3E5396 
X-CRM114-Status: GOOD (  15.24  )
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

On Fri, Oct 20, 2023 at 12:51:36PM +0530, Anup Patel wrote:
> We have a new SBI debug console (DBCN) extension supported by in-kernel
> KVM so let us add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 234006d035c9..6bedaea95395 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -394,6 +394,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
>  	};
>  
>  	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name))
> @@ -567,6 +568,7 @@ static __u64 base_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_DIS | 0,
>  };
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
