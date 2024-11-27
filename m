Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF3D6ACC3
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWn+cFOKXRDdT1BoydN5iKWGGMfySFSclPhbjQ7uTJI=; b=0xr9TV9GGRMTvX
	E3vTYpuxgW9aXHlgOLJop17TmtpqMBKRZdNuwZ42W5HHVg6SSZjcK2vNFyxK+YVUJvmqIy+zKOt1Z
	oBQR0XcMzxfYWe7iyV5qRjt+XQJXZ7pxBYpFSCRQbCyHf2g9KL5ANw0bQNoY7unNEcmK0CAldt8tC
	GTG7RuFgB9h5FOdMl79LGo0CjPrluDMBc3LJumMq+NSy+yc7K4+GRYw2bTYxJkBct//XxVqPOxR+C
	MHhR4k9XuR+doxRSG+QEpEbyaUaiKgf1g4M18I9ki8RITl1wuQrvscuSuQsbGGK/IyxYvv13qjKwq
	2n4c+u9TWLgzDscyAA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGcN-0000000D40S-3iWM;
	Wed, 27 Nov 2024 11:54:03 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGcL-0000000D3zv-3627
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 11:54:02 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so50900751fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 03:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732708440; x=1733313240; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOs9KrZ8bmGuTWUf23U0G5It2JNzTdjZoc7pAW2KegU=;
        b=YwySK6Lats71lOvRb+306roYyXbf235heOqS4UK7zjFGLqddR5ry/nWNPBC7WuWeGt
         pgXfnW1SDgl63cVsfsloNvE+tIXW/gtYeAJKIyuQBKmxwFUe96mCtVmcxtx0V3o/W3/q
         4Iob2EOjATVGDEenrZan4GUL4Eq7xOxO8kjwv14W71BQWRNMk2sKeCTBZOotlWKNKqtj
         Z7rF7JiGTdPhXJ0KWtS4Ue5exXN6+j7SI/uwd+lmBqtYdkst/vdltoG36Rw9zgMoyLsp
         8zB147u0ZAblGscdyUVkZRWQVtHf5M0qk56Q8t07qFYGxBwlER8Z6vEhnxePsrHLd5A8
         Crvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732708440; x=1733313240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOs9KrZ8bmGuTWUf23U0G5It2JNzTdjZoc7pAW2KegU=;
        b=dnPf1c2O56wdjrh7+rJa4Uug9QH7uROHPvsM1t5KAxEnjxMByE1Ze3dHyAO4bS4XGE
         kHI1xYeAeGYwlcw+cm5yQQ0humDh6K9JSWjXoBIJyjMonGjXYTIMiGFgokR0QTWqb+4J
         UNAsJaB3XIdlVjSj1YW3xa4u7JAIHGNyxIUV/TG6SnXedn7uIlp0ItJ0ujCdPgQt+Nqd
         kJOQyJrG+uijPJqzT3va5TVc7sCp8VIfFfL9AwQWKle0hEuLdutcFwIYwv2Sw+mSlE9r
         bxOCA17NMcc3OiRYfz05AYkWWj0uEyidjAVIvDmoOV/G2Uqz8X5J5Z7wcugs3+kAAtk/
         reyw==
X-Forwarded-Encrypted: i=1; AJvYcCWIi1H9OqLpZuc0SHjHoT9AOhQFBUh3bXM+nkcDrqz58S9xv/d9Qzay904H0fEVf++1/GUhF7yCIENzzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5BDyoe8wqYUoGSergGk8YItBM8salokaW1ayHbMAfPNcAiTlH
	QzZL/Vo3uRQxUb0D1hwX10s3Z8rn6bREtApfkJnoGo5dNh3F0UyHxLIHr3eh
X-Gm-Gg: ASbGnctjppKsEUFqwnwLazXOTuz5P3lYKqRId5C9eaGP3cBcuWNqoY5qI032xhzIsEF
	G3+ueNSu7Pr+Blv9yLqzskz4MfZ4oyuhLbW/2DmpN3HTUNJkKvhfq4O9RfNm4pX3PgDukUy3NfZ
	LG2GQRXhIpVwMd3Xc7AfNoK4vo+hub1cQUlBkCR8ij/NecMLx4jBodtyyNmLZhN65TOW9sdtGxY
	H8/AJfDHWH6XGB1D37fKKmVMQUI8EoFWvvZtNbTT9sduLe3Bt9BMz44EnRx/Xm2pdo2/6GQkpW0
	AuYKox5/fs4OV7zeAGZqm3E=
X-Google-Smtp-Source: AGHT+IEdZzPpvtt5g2veZ28kg3Tnjg7fOynNz8QbLn502RI0VK50895DSX0/X2Tm45sPeRl6qJx+cA==
X-Received: by 2002:a05:651c:b14:b0:2ff:5c17:d57d with SMTP id 38308e7fff4ca-2ffd5fcc09emr22424751fa.2.1732708439476;
        Wed, 27 Nov 2024 03:53:59 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5372002aasm539318166b.66.2024.11.27.03.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:53:59 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 27 Nov 2024 12:53:57 +0100
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Quentin Monnet <qmo@kernel.org>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Abdurachmanov <davidlt@rivosinc.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH bpf v2] tools: Override makefile ARCH variable if
 defined, but empty
Message-ID: <Z0cIVfgdU5XDoa7g@krava>
References: <20241127101748.165693-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241127101748.165693-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_035401_779087_23B6E10B 
X-CRM114-Status: GOOD (  21.78  )
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

On Wed, Nov 27, 2024 at 11:17:46AM +0100, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> There are a number of tools (bpftool, selftests), that require a
> "bootstrap" build. Here, a bootstrap build is a build host variant of
> a target. E.g., assume that you're performing a bpftool cross-build on
> x86 to riscv, a bootstrap build would then be an x86 variant of
> bpftool. The typical way to perform the host build variant, is to pass
> "ARCH=3D" in a sub-make. However, if a variable has been set with a
> command argument, then ordinary assignments in the makefile are
> ignored.
> =

> This side-effect results in that ARCH, and variables depending on ARCH
> are not set.
> =

> Workaround by overriding ARCH to the host arch, if ARCH is empty.
> =

> Fixes: 8859b0da5aac ("tools/bpftool: Fix cross-build")
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
> Acked-by: Quentin Monnet <qmo@kernel.org>
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> ---
> v2: Proper tree tag "bpf".
>     Collected *-by tags.
> =

> Andrii,
> =

> Apologies for missing out the tree tag in the patch. Here's a respin,
> and thanks for routing it via the BPF tree.
> =

> =

> Bj=F6rn
> =

> ---
>  tools/scripts/Makefile.arch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/tools/scripts/Makefile.arch b/tools/scripts/Makefile.arch
> index f6a50f06dfc4..eabfe9f411d9 100644
> --- a/tools/scripts/Makefile.arch
> +++ b/tools/scripts/Makefile.arch
> @@ -7,8 +7,8 @@ HOSTARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/=
x86_64/x86/ \
>                                    -e s/sh[234].*/sh/ -e s/aarch64.*/arm6=
4/ \
>                                    -e s/riscv.*/riscv/ -e s/loongarch.*/l=
oongarch/)
>  =

> -ifndef ARCH
> -ARCH :=3D $(HOSTARCH)
> +ifeq ($(strip $(ARCH)),)
> +override ARCH :=3D $(HOSTARCH)
>  endif
>  =

>  SRCARCH :=3D $(ARCH)
> =

> base-commit: 3448ad23b34e43a2526bd0f9e1221e8de876adec
> -- =

> 2.45.2
> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
