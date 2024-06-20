Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADBFC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 22:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRzaeGN1Wxs75IhgH1Sj1FBPCjDYJl6wNn0cTVDoEnA=; b=3csY5K2pxWl3i5
	capjBQfw2vSnyD9xKPV4IRGVY9YTvQcw3J//xjyChtzGfpT0qw38HOw4UNpWFNzWN/h+rWNCt2Wnd
	plMEiUe5YeJCbPd9id4tI/qPOVQVlTUcJIfCG6sTQZ/B2T4Z7ChZxred4woBRp6r6Khw0j85wubms
	GpzkQQyyvy182mgMrf4zemRk7e/LtvOjp6q6IiTz3szaowz3sjW4srXAmaFCYrI+Y+OTlfMQrWvIu
	/aOBY4AFssJKgklpN5JyDHe3239twHSdoLh4DiiWYFim9UbExE2ivmWUDw28airYfKoMigEg8222l
	Nrwlk4ZFl+QkjHDuEPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKQeD-0000000706a-0d5V;
	Thu, 20 Jun 2024 22:52:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKQe8-00000007044-3bvb
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 22:52:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f4c7b022f8so13018995ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 15:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718923968; x=1719528768; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HpVIY4+aAbkXXiS+A3JdTJqHYqpOhUBTuW6XcJDBl9k=;
        b=vl1wwl/nhWqrJEZZUWSSLLziiy3ao+BZzoRTAOWAZ3d+KJnXmnrn63iY+rCzDVPGbh
         Yga+RD2mjhL13AtkxCxoxrprZE4S/eDGss6HwuTc1ts0LYiDoZ5DOsTR2NRz/CdojVgs
         1eMCJ6r3giixs0Lwmq2m/7Ncre+f+X7hb6cZo0Zb3SqYo0OgQbjQ3Tm7PZWlKH56MUL4
         tvm8z3z7YPR8v/hXy/bWWLTZ204Zgl6/ATcIQNm6DHYcT508diXuFER87Rkgu1N3cuvF
         Ll+G97O6Ic5BAenbu0pcDJoPgCddoVKa34aU4o1sQDp8hCM7UAZedhtCxrTWYPPcPj/p
         cAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718923968; x=1719528768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpVIY4+aAbkXXiS+A3JdTJqHYqpOhUBTuW6XcJDBl9k=;
        b=WFJ+hohBISSXq0x+fSSLriWDYw795qpuraqycwM07fuLGen6jg0KPansP3zyjSzjrb
         YF4LpJxGi2ITDlSUnyMEktNtChdUvbcZonpo1m3E26JCQ+rci03rmkuKzqbeIhTG9cRf
         RsjOH0f2d7MQVatL9IAxudmHV0RH81rR8gkzE+hBldZmm8fQgNOiJkpP7HfjDWLrqKaR
         EOJM8C88oIVmW55FpLyJ+VmngbFC2Tiu1a0cU745FOTbJhxW6d0yX0gNX8OJ0qEw7AO8
         RsTouA/aRB2M2vrhvgPGAw2nhJfgRSmBOQg8c4EqXbXvaAu913qgfevTyvo8euvzE5Jf
         1FGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBO5IB/reZ/14f5st0kRq1rpUe0iozHdXXkLHJX+OMNwiIF01yZkBFL7faO+8LlpwdtZXalq8FLYuQhv2qfKjQqnkFqdlKH6zvH7gmzAgR
X-Gm-Message-State: AOJu0YwN8mdCXJVyMC0elJpNK1KhwLY9kvLJiRLNaCdq9xYs5tS/lru/
	KpZF9dEqXa4rUpA7c1gaOH0wugFuUqNf+OKWOXufjPx1U/bxTWsfsC4HlGHKiJ8=
X-Google-Smtp-Source: AGHT+IF+zqZ+Lx0RC6ue/poxgqOnOX1TFmx08Oct1RZJyaZY/hmhQDmLsojlT/WUXfCqsCQxo77OvQ==
X-Received: by 2002:a17:902:7447:b0:1f7:c56:58a3 with SMTP id d9443c01a7336-1f9aa3e980bmr64928225ad.26.1718923967881;
        Thu, 20 Jun 2024 15:52:47 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a0esm1331205ad.254.2024.06.20.15.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:52:47 -0700 (PDT)
Date: Thu, 20 Jun 2024 15:52:44 -0700
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
Subject: Re: [PATCH 3/5] riscv: hwprobe: export Zaamo and Zalrsc extensions
Message-ID: <ZnSyvLKC+xXlW1i+@ghost>
References: <20240619153913.867263-1-cleger@rivosinc.com>
 <20240619153913.867263-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619153913.867263-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_155249_033306_01FC0841 
X-CRM114-Status: GOOD (  19.56  )
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

On Wed, Jun 19, 2024 at 05:39:10PM +0200, Cl=E9ment L=E9ger wrote:
> Export the Zaamo and Zalrsc extensions to userspace using hwprobe.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 8 ++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>  3 files changed, 12 insertions(+)
> =

> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 25d783be2878..6836a789a9b1 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -235,6 +235,14 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         c732a4f39a4 ("Zcmop is ratified/1.0").
>  =

> +  * :c:macro:`RISCV_HWPROBE_EXT_ZAAMO`: The Zaamo extension is supported=
 as
> +       defined in the in the RISC-V ISA manual starting from commit e874=
12e621f1
> +       ("integrate Zaamo and Zalrsc text (#1304)").
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is support=
ed as
> +       defined in the in the RISC-V ISA manual starting from commit e874=
12e621f1
> +       ("integrate Zaamo and Zalrsc text (#1304)").
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perfor=
mance
>    information about the selected set of processors.
>  =

> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 920fc6a586c9..52cd161e9a94 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -71,6 +71,8 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
> +#define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 49)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 3d1aa13a0bb2..e09f1bc3af17 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -116,6 +116,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>  		EXT_KEY(ZCA);
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
> +		EXT_KEY(ZAAMO);
> +		EXT_KEY(ZALRSC);
>  =

>  		/*
>  		 * All the following extensions must depend on the kernel
> -- =

> 2.45.2
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
