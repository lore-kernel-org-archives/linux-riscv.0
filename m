Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667EFC27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dz+T7G1aUqqHj6OQImEVnPh/v0jmjaYZxbIgychbOx0=; b=xiIy6xDBNWmYF2
	u28AXBm3AtIuMQwUGXtteAqzLOI9I21hAzK8EEUj/xxYSkQCBkQc5hs35mwDWY3TglfcEV9hChRUN
	Ctj/43EiUzboOjYmR07vD8517o/hVZZdgmGO0q6NI1Sb5lNQGgSIUD0+Y4+AuWnk/aiQSOIZQ8ke6
	G/DnxZHiOeQnJ4CS+wYfFMbvJwxyhTdOFE3SbH2tHHW7DqCuOEliZd92uXCyWRGU92ZZSxjikbBY8
	O/Qq4oyzn6IOcVadg+6+Zq66hf/SGhCFiOUpuYa/21PMwOi5Ui+Dxbxvf9k4d2/x3+3SHoDsqwK5o
	M06ubArQ5W9lo6nQOHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRVn-00000005gpf-1HA1;
	Wed, 29 May 2024 22:11:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRVj-00000005gnk-2ttY
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:11:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f449f09476so3205735ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717020666; x=1717625466; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sg/QIRblIFtNLWufQCRmoJv7k/DY1a76R2WYQ7BmaYQ=;
        b=jslz+lzexnbjhY133bipTjAZPH/mQ7cl7ggSF/PztHQag3zn+zZp0/nNV3SDMNsy0D
         k5U8HNN4kwBsYOLpoL9QDn/eEFPdG/7sAS40BnWRq7Tv9hpnwZbGjwIIt0QzDqq88j9W
         rp4afDiwHUa3V1xhwSCCPt6BBK7S2KIrCNjwBLejgG7oQDP5Cyc9UMvEBmpoOfCqfy7i
         tkN/SqdfVlIYGeyXQseXimZJDv6Ry5mxP5/iKhwDxKcnYXm2yLJhvvIFYZ38qODoDa8m
         LShABLcC2OBLm/e7Dj4e6K2Ro0dhMAJVxNtaemdwrJzfQYUD494GNZv2l24ee60jPvDs
         qh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717020666; x=1717625466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sg/QIRblIFtNLWufQCRmoJv7k/DY1a76R2WYQ7BmaYQ=;
        b=r8grOO5h8cp6PDKI2pRg49XSryA9sQvvHRzkW1kQFnPGpsYVL4Kb2YLJUOMv6AsexB
         v9KwUnkAuHV8MXU40VTwequUD3DeI7A29svmvzGh2BqYysslvxxyDvmePlL44da1v8Pq
         UFqh768AftfPao5EvAkQWU1zATMxPzhKd952mxswMwUyJ4tjyftKXve5xSOZhUgdfCSd
         gche7K5XOQ1czYgq1I19P4Pn5lQNwBvPU5XWMI2dPypzV8IlcMEcjrgjbTwCgvAUxtxt
         769eHhs9U+/Xk8nCC+BGl0AyAmX7cV7/Z19+/m6wo+tc5N6xCTRLFhQwwxDu9yn0zynN
         DXyw==
X-Forwarded-Encrypted: i=1; AJvYcCXVdvB122Dsbqa/cU2CTrqrToqoGzup2tiuSTeFhyiKH4TfJoF70hlAH33/sHsR65go4Pk25Rp4ZTN923p0ug7IxqtPS+BBFQKwquzhsX+D
X-Gm-Message-State: AOJu0Yw8HHHAT74/6kUmKXrluOoT6NYNjKu02Eauac9G3hwhFdz+OSy/
	ppr4fW5hUA9r+cqakwCDr37ALljgavboOpkhnWiZVWRjzWt8zyrxxNKJyxMk7Z8=
X-Google-Smtp-Source: AGHT+IFpmEQrXuUDZrgWg6NtOFBQ3/COBrU/d0R2GFKbvKzuiLLzyv7oF+19wM11U+2Hr3DDC5DgmA==
X-Received: by 2002:a17:903:183:b0:1f4:9b48:7561 with SMTP id d9443c01a7336-1f61bddd04amr1614855ad.6.1717020666343;
        Wed, 29 May 2024 15:11:06 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c968488sm107303805ad.172.2024.05.29.15.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:11:05 -0700 (PDT)
Date: Wed, 29 May 2024 15:11:03 -0700
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
Subject: Re: [PATCH v5 03/16] riscv: hwprobe: export Zimop ISA extension
Message-ID: <Zlen931jkx9zGthc@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145302.971019-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_151107_772276_B2719F7C 
X-CRM114-Status: GOOD (  18.72  )
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

On Fri, May 17, 2024 at 04:52:43PM +0200, Cl=E9ment L=E9ger wrote:
> Export Zimop ISA extension through hwprobe.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  3 files changed, 6 insertions(+)
> =

> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 204cd4433af5..48be38e0b788 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -192,6 +192,10 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         d8ab5c78c207 ("Zihintpause is ratified").
>  =

> +  * :c:macro:`RISCV_HWPROBE_EXT_ZIMOP`: The Zimop May-Be-Operations exte=
nsion is
> +       supported as defined in the RISC-V ISA manual starting from commit
> +       58220614a5f ("Zimop is ratified/1.0").
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perfor=
mance
>    information about the selected set of processors.
>  =

> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 31c570cbd1c5..3b16a12204b1 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -60,6 +60,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
>  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
>  #define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
> +#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 37)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 969ef3d59dbe..fc6f4238f0b3 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -112,6 +112,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>  		EXT_KEY(ZACAS);
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTPAUSE);
> +		EXT_KEY(ZIMOP);
>  =

>  		if (has_vector()) {
>  			EXT_KEY(ZVBB);
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
