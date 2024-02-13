Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FE1C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tA8Emie1E5LRGxsmnocW4NmNrddIpJ11/hyIR4Ol3Ek=; b=GVV0/wKGOy7VsC2RUwyTyEG8kM
	zwK6CY4e9hLoAqeqEqg5Zd/TcxzmHD0p/kU5hRTTsnMkYGcO21dXTUQlQhyoVEAxTNtqNBcekaZy6
	ed46NpZXnUGN0jlnTZQCyWbIL6yfxiYVX2JyLP5qfM6RubJPKJmbE5M7WZtw9af7EVkcfQlEC1F7D
	MKJvrKjA9YibCvB87bgE90hM9/EFmTIto49/9e+LxaaPmpYtP2sqWXNtj9s3h3bx7+4XyLlc1N//H
	gRHOAaaN+A2mjoRd4LpbfOn1PLaTb2R9tUp8wuMaLxQawjZtPXZk6Y/bD7rmWKy41vL3EIgYqXQzP
	zHnkwORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZv3u-00000009pVf-1YrX;
	Tue, 13 Feb 2024 15:51:10 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZv3q-00000009pUM-0Fa8
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 15:51:09 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 338143F186
	for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1707839460;
	bh=PqDyS1H1K/fgosXDqnPB4MGkbFe2muNuJORUG4Z+IbA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pD7zKTm85khSfoDW9yNqdMgRpWdYY2nWRekb+7okxqF9l7/QYKIOwwpXoIWILvVZg
	 OGAD34Ytz9A7N4qKebPXFm3G790HzmXrgOUP68b/vjp4tZoHuYHL09TAb3PVKfecKn
	 cdHFpmAX/djGqLxysMqg1mhVNpYgKiUlxc2LdBerwQxetSGuJvfK7DOgecna5uZvFj
	 tMFd1DX3LEkQKrKY/henZsDynAtFe18CTE2e4jIMD5gKTOpwJ30W+QA0rdzmiRyffd
	 flFuUoNjlmQY8oSz83j83k3cl7Ayl7srfDdoz1gA6Y+o8MIUIzhTc3qeOtK0gG3fHt
	 gbQpEeg9tK/Vw==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42dae720bb0so7280911cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 07:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707839459; x=1708444259;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqDyS1H1K/fgosXDqnPB4MGkbFe2muNuJORUG4Z+IbA=;
        b=Vvh4eS79MnhEgX92NOJx30dYuy8w6h6rndGfi3xvbWI4R5s5uy77qBVDwVNSKec12F
         UFKNECB7RWPEWLOHZM2pjzVBh5mg4iv80IZr0u72At4nIXGKmjEfjM41oqz3sQJECZvz
         3sq4PUI4FEgFYAgMHoT0ivfoRM/na82Ceuqve+tqztmyVxgEePdsd6cFuiH1PFQpAAdb
         JbQyqrdzcIdf8cwB2WCCkMuovABjtNotixJZqZkGzRz2ko6AAKla1KnTyAxz1u0dh+hk
         cdfndwiOFKBc9u1ahU6A+GCCjvMznvGEPwi9DBiAL3D1eQqtkE2ya8TpFZtIBWJcDiSe
         Xnvw==
X-Gm-Message-State: AOJu0YxQgEz1o1wXtMTJro+pyVm9U7ALq4PrJumQxSUNR88C9YmAxCSt
	47ubyRdN8LUqmj8S3Zm/D2n86x3SOPm1Pxje7HIrXn7J61CzIXj85efzF8ZhQLbDo7Y9cfkeEMB
	yfuWV/cXElMeu1wY9DzlNRIC2G05vRGOOXOmfXRMtyG71fGA2wa8mcPA1giXbxqsA0vnBC8/w3P
	aFA1zfz0lkfgS85yzi/qHepwOHHKz7EpiWBgpTwsbXDatDxHpVVWYE6X34
X-Received: by 2002:a05:622a:1106:b0:42c:3928:86f3 with SMTP id e6-20020a05622a110600b0042c392886f3mr11501541qty.49.1707839459045;
        Tue, 13 Feb 2024 07:50:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHQyoPI0wxKtVPCeLp3fl0yJNJIsSPsu5VT04yEP7zIQdzx8woRDQ98UPB4t2EnAdJ2f8tLMNm4riVmabc3fk=
X-Received: by 2002:a05:622a:1106:b0:42c:3928:86f3 with SMTP id
 e6-20020a05622a110600b0042c392886f3mr11501526qty.49.1707839458723; Tue, 13
 Feb 2024 07:50:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Feb 2024 07:50:58 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240213142856.2416073-1-ericchancf@google.com>
References: <20240213142632.2415127-1-ericchancf@google.com> <20240213142856.2416073-1-ericchancf@google.com>
Mime-Version: 1.0
Date: Tue, 13 Feb 2024 07:50:58 -0800
Message-ID: <CAJM55Z9qiQ6GpzKbYORQP12sz4V67UBGfWChZJeHvD_5j_d93Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] riscv/barrier: Define __{mb,rmb,wmb}
To: Eric Chan <ericchancf@google.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_075106_383107_A1A18432 
X-CRM114-Status: GOOD (  12.73  )
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

Eric Chan wrote:
> Introduce __{mb,rmb,wmb}, and rely on the generic definitions
> for {mb,rmb,wmb}.
> Although KCSAN is not yet support,
> it can be made more consistent with generic instrumentation.

nit: this commit message has some weird line breaks

>
> Signed-off-by: Eric Chan <ericchancf@google.com>
> ---
>  arch/riscv/include/asm/barrier.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
> index 110752594228..4c49a8ff2c68 100644
> --- a/arch/riscv/include/asm/barrier.h
> +++ b/arch/riscv/include/asm/barrier.h
> @@ -20,9 +20,9 @@
>  	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
>
>  /* These barriers need to enforce ordering on both devices or memory. */
> -#define mb()		RISCV_FENCE(iorw,iorw)
> -#define rmb()		RISCV_FENCE(ir,ir)
> -#define wmb()		RISCV_FENCE(ow,ow)
> +#define __mb()		RISCV_FENCE(iorw,iorw)
> +#define __rmb()		RISCV_FENCE(ir,ir)
> +#define __wmb()		RISCV_FENCE(ow,ow)
>
>  /* These barriers do not need to enforce ordering on devices, just memory. */
>  #define __smp_mb()	RISCV_FENCE(rw,rw)
> --
> 2.43.0.687.g38aa6559b0-goog
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
