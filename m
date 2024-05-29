Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21CBC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsIG6eDKdX53hiVGZOYpFBuu7IlydplSXyYyY9Iqkj4=; b=inIBRuuOl2c2hz
	HS1eWm22zlp15XdzG0eUUbV7ZRTzgHkF8sxv+FRWnG7VZLpZH3+Yhi7xIXy4YE7o2Naz9gJiDY4Ds
	Ocn370PHxvxSIqIHdxPWRcBp1R7G2oMUfe+Ew9OKBXJVEzP157zdSrliAeJDn9gZKBgsgtZDTZQf7
	QBKA9PTS/3DZncH6or1UZA7FDp4HRuH0+FjPyQYZ04aWx6MxBI68ScC0Tc/O4k5kUKNG3qTdiQEBl
	mbQVN7DGSsXKaTAoaYjkFLSJrd+XAelVlMoWkJmiHhViBO7kbbngtXevH/UEBgJLx45fKJrjWMn1Z
	ktM3NflcMkfvTtYD0vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRVH-00000005gd4-48ct;
	Wed, 29 May 2024 22:10:39 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRVE-00000005gc4-3jaj
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:10:38 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2bd816ecaf5so164898a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717020635; x=1717625435; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e+fbNuxAx3WZmFzqMqAqWViMBWTStqdh1s3mW/5wrdE=;
        b=YoWKVo7ntT1LRpTd91p4llv14WPUwhS4hwb/XpIZJ/wjACNVF7BebSYKwTUQE2njYs
         ZAVxkloTXSrwo45n/nhJj8wGUxYC0Lu386XdvI+Sa6PsX2WMHuIA6Jgoe/5ZTAEspRQE
         G6fmETi8ZdHiEZIH1RyppxKwul9OXrwlAthdaXSspL9W9BdDQsHLd1G+i0lwx/T46a/X
         DM5L0CX9/y/znbK56oM2X2+OxXwm6sSGrHnHayw4+pPkbvz7p7PNX7Pl1QJShUjDh+6F
         8ViGsAo4kKuQAzAyWW/Gey+mwxaEo49tucEpjc4nLfcMjI6byPxBCOnt5PMLEpQHs6uk
         vCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717020635; x=1717625435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+fbNuxAx3WZmFzqMqAqWViMBWTStqdh1s3mW/5wrdE=;
        b=j/d+AwuXSAHzf3uGubMoVQu+ovv4TDF/B4uSlQLULvKy8Gfa7X/9U1bIFDt7gD+kJd
         EdiPb2XkqLGMFupXEnVOnL2W/ylNZsVPc9UY2fj28q+ubvrYbad5SQ0lKINyeUzjtuci
         DDYs6K1C3CjAtzcqdSWHd1ulryImCpjV6QsuqNaRyySy8DSVJkwHYT63qwMkPJZlxnLR
         O+PtB46UQM2ntgPcfc2QD/AvAUkVXWq1Slj3aET9+d1Te85vSdAvjTwR+MZRTv63vXNf
         TSMhNn4/ucPM3IQJiKWAfPNw68FOV//cactODuoGtf83ysn1R7TMdXBYDvivEyhKuYVe
         +Bsg==
X-Forwarded-Encrypted: i=1; AJvYcCXy4nknUDjbSAW5TlyR+8kHLLQLLtVfp8f5/GVVG5Ks2lbxAHR5ZvmBFumQFMtT3F6ukax0OM1UW9z5HSvKT2HGHs7KtxS+1MoQ0fWx7F5t
X-Gm-Message-State: AOJu0YyUuCgTefUm9bNPpwQTpN+20qU/ZX4dUqhIYQ2nMGdBz7T/5XFI
	3qh/2fYr4i38pYWWq7slQkImBEVT0daDGYNjsl6cPTW7m9jJJY84H8mrC+j6IfA=
X-Google-Smtp-Source: AGHT+IGB2IuW8qeBair3I30nTxYXl3h2Wp+x/ksnoaod2z/+/aYYn9Gy8Js/qgGb7n5+xXapJsQdmQ==
X-Received: by 2002:a17:90a:c798:b0:2ae:7f27:82cd with SMTP id 98e67ed59e1d1-2c1ab9e39a3mr414491a91.7.1717020635249;
        Wed, 29 May 2024 15:10:35 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1abebfbdbsm121966a91.55.2024.05.29.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:10:34 -0700 (PDT)
Date: Wed, 29 May 2024 15:10:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 01/16] dt-bindings: riscv: add Zimop ISA extension
 description
Message-ID: <Zlen2LmttEdaqAGm@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145302.971019-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_151036_963059_BF2229AC 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 17, 2024 at 04:52:41PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for the Zimop (May-Be-Operations) ISA extension which
> was ratified in commit 58220614a5f of the riscv-isa-manual.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 99d2a9e8c52d..b9100addeb90 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -363,6 +363,11 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
>  =

> +        - const: zimop
> +          description:
> +            The standard Zimop extension version 1.0, as ratified in com=
mit
> +            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manua=
l.
> +
>          - const: ztso
>            description:
>              The standard Ztso extension for total store ordering, as rat=
ified
> -- =

> 2.43.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
