Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35A7C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 22:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2UjnM9jyoCqgTtsqy5HY9G2eaYbyFcOGAkcsHRSw28=; b=dD8NRoIHcanpdK
	Koxaw2PsHXT4XD+JoX4Fcn3MGAaK8XD5YiI1w4cVJdu9hN2uaCaEFlKNQl5DiO7i2BzddIMRW1bkG
	nTONlenjse8ScY7hLTqvUGWUtntqkMvlPR1/kYvH+su/DdsIIy014Rx8YQySozFBTCeY48ZtuZo/F
	aL6HX5ti7dQj/5HftTnoOmEh1jovyuGUHe0JQrmQbT6opmnnmMs/GBKuj+DInPcgtySIACvQEtaG5
	hKJ7NrfKFn+TtdIKqahenl5WGU3ZMfmagLkkB8lBNl0a/SdkzpZd079/svTLau+JDqrlAp1kzI4DT
	BGDmopvWKuE/FTZxBiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWLU-000000054wJ-0Vs5;
	Fri, 09 May 2025 22:37:32 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWLR-000000054vu-1ehg
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 22:37:30 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6f54036c4b9so25180546d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746830248; x=1747435048; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wls++UmOuF/4mPyEoE5Qu8r2syygUVJY2hk7mKDxU0s=;
        b=I2pszFwBA77oj0IoayLlzqbBhNim0cqjMVDkgR/p+op/EYdUi/l8AcmsaA8cDXZOW5
         enPPYCi/uKcxYIHJHsYLeNKnJu+ucvo2rApeNaeQF34Jz8ZImwdCbNjvqDp7HNsvr9yg
         9ePfksPfMpQavjEmp1CooFhOLPninuw99GDzgrgWXBC+VcQynMtTmC3cVNafGxYw6sGu
         2RnBzyFROv6+Etwq7iQYkQQX44vKivmxprXjRymmMeaGS3bQNLVH0SAFU/wFHpOpIchM
         RWvSYMrnYrbKzvxgq1Xmp8ejERyOffPJt1u2z62aGBHCG5MCjed7wvH3zP/6B6BHGCVO
         Hkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830248; x=1747435048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wls++UmOuF/4mPyEoE5Qu8r2syygUVJY2hk7mKDxU0s=;
        b=IaOnqquzJ47Llf6Zm+oEXer+mUtE+AoZcVopfnlSlBUpzlOmHN/7oE+Uc5T5vV2uR8
         Ip5VC9ICGcARHewodpTZsplhKoKz95nszhbY73lX1EL61+rXhu3xWHo/UYCQP9t9cyVr
         bjPWSqLSLXquuZNzg/RrzgCibbWLag36nt/fFHiNpNuYVKaQF68yz+mvoaI227f92dVB
         b3gHwGKhdoROsyw7CA9P/O6Uxgco8NCf9NgS9gPtkwdZjgmYc3VJTy7YQEmln4iSG3/I
         2BTzmRuqjxuWMUZuNXyDad7o9426qq/nwhNEV7yR9/CTTSUEk/rQhzXJ0LEOd4pdfews
         a63A==
X-Forwarded-Encrypted: i=1; AJvYcCUc6VYMYRbpUCKz2+Jnzv3DyfjwgDa4biKuFIycP8ysTagNCUpDHKBWlqcJC+aBV4VVSglnnzTuhjGP3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/FRCiPbC3LfWTog5E45FEdcVqQGHPtk4BYpZQQGgZ8tW1vgHr
	dnzfIrCW95A2ffDCLB9toar8WcDkDVuSgQGtsD5OPqECsmyQezoL
X-Gm-Gg: ASbGncsHaoNHLtANzpSocjre29vrZA3/XNo6Pj1cdPyiCsaDdR+6iLp2tgG06cR6xr8
	fYyDXOeS2tWrBYOZLGrHUurqHXLp043SqFp8dMkEKvDT0Fx8qfrFORXcj3IXj1rJMLpDiU18K7M
	T9mzbpCRCQp2mJQ0vfjRgSDjbzOSqMvD2qUaLkYcD0l+T802ZaUnBKdmQiqMN6IpF0+Lnxox/l3
	ldodlPjBJjuK0Y/Cyy6U8VAbca5dV3N/w01Gtv2NtYnrKCNrVJhTU1SH8G1jrgKGMKM6rpzJ7H0
	fr7AjZkDCwaAuDxJPnlZCr3gSnQ=
X-Google-Smtp-Source: AGHT+IGT4gynGMwVrr5xrHK5k1kPhXxajuXtDsQp/TWj+voeyjLTQ+BuPWtRD2a2o0XUy3TbdPOunQ==
X-Received: by 2002:a05:6214:528f:b0:6f4:f458:7ef2 with SMTP id 6a1803df08f44-6f6e480f83amr63955966d6.43.1746830247675;
        Fri, 09 May 2025 15:37:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39e0685sm19440936d6.13.2025.05.09.15.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:37:27 -0700 (PDT)
Date: Sat, 10 May 2025 06:37:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Message-ID: <5hn5ywklwlc2cfjeesarg7hcf2knsujloxijzp46o26ox33yzo@6kuf3bkqqigf>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_153729_436350_7542AE19 
X-CRM114-Status: GOOD (  12.55  )
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

On Sat, May 10, 2025 at 02:13:29AM +0800, Han Gao wrote:
> Add DT binding documentation for the Sophgo x4 EVB board [1].
> 
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index ee244c9f75cc..0f93f4cbfc6c 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -35,6 +35,7 @@ properties:
>            - enum:
>                - milkv,pioneer
>                - sophgo,sg2042-x8evb
> +              - sophgo,sg2042-x4evb
>            - const: sophgo,sg2042
>  
>  additionalProperties: true
> -- 
> 2.47.2
> 

Please keep alphabetical order.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
