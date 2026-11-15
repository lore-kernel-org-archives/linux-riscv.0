Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F4E606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TpIHZZhy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kwM2M/u/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tQVULJdxujoCKASH/Ut2FU72BwVD3YRSNCZc09vVSsw=; b=TpIHZZhyT7fzE50QOeArkO0imv
	j1S4jVp5TsIUxzD7nkqPC6SLi15KHIEaZ4h2tUJEHQIh5VOfzFd1QjP5SnVvIX1nLol1wl+w0TbYq
	UUUCL4LLs4bNINhmlPjSPSHLRAZVqSsiBbcaeE65FaOXrLIaPnHd7UP+k7xiEH/403HhwyVoU3ceN
	HhryLFQhtFNc3+TeE48Ip05OLCuTnJfaYaAj7gDpB2gyUqFpA9TOXXKmvf2j/FOGA62rBdOoGY3hf
	RV6/hP4YKH211hrW3HLHjCvA3+aN54RnL2iho3yyPaL+nt1nk1UWD1njkvMl7sXBjs6uAtrxciWGg
	cH+/T4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb47-000000001qa-3OEB;
	Sun, 15 Nov 2026 14:18:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb45-000000001pM-3cjm
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 14:18:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso925511f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752320; x=1795357120; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
        b=kwM2M/u/R5vpqgoUGa3Cc1HN+4gMbJKhucrnUfgOfz0igY/h7oRCRWcl3XRB/O4rS5
         v1hAklUGzQV7bp7ZkM4JTouhWiQ7fZ6D/WUZ3hPCM2lTQAH9u/uFI+96VG3xFS6qxhxF
         8+miwe/LtD7u9qBuxi3EqNxfg4gnrksLKsLc8xawq+/QBNskZfz2KruZWR5vP/jRAAhd
         Zkiwj5c1VIATHWLR1S8ycmOR5pbxrGgq3a0Vwmf8bYZ+0n55mFpp0wsKIGQzPeH5nubQ
         oQ6JXvpNKeOBJUdzTIi5uO/FOthrYCDROrbAmFfaTDp1X8mNxn+6IidhNcqr3njNNYrN
         SRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752320; x=1795357120;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg+6x1taFPz1aG2RIqr++6bIa3IK0w7NjTUlcchGBio=;
        b=buGA3OIm4GzWjuWAHp+7CPzH2bxKdtNdwk5o6L0y4AzpJ8vy/ZCIb296RPt8jdMxXU
         Y5fy8CdUDzDopSjiSQ/W+F1Tf4jU/QSpJVd+PITGEI29xfdjlw7FGdw8dffRv+e500CB
         l7xAdIa1iRUG1tW3cXwRSCx+bAGXuQN+mPlArbFsotwYL1Z6bRIIpaeqb7tciSJ0P1tk
         SO9lSVdiJBx1WgLLnTQUY3F/dYVaH1/kcRZ/nMoDAjTocotlnq1V2Po/cmeMccU2awmA
         Fx3qj35FdQ8ZCGipdS5ek3/7z/0UBsGRCD0HY0bqwX0t0NYgz70S7HGuvMXZVUD3rJLi
         x2Lg==
X-Forwarded-Encrypted: i=1; AL+hErGGZjpp6mhZcVS1Ficb2rBCVvDMRg9QIF9hg1LvbCyHEV/a9YywotknjQzyQjQAa+nUd8BpbmZpGZTWJQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+EMi5MqNcs5C9yAI1jDr21Pf5HTcsSqy+h2uKQyAk7omwBxxGP
	u8Nz9ZG8UPRRcBPGaANut7htA9w0/sWCIsPWlNF8Llc3cZSGGdfCIt8Bx/CcTSJrnA4=
X-Gm-Gg: AYBFou3GPGEjH5/Ja1d9hsE94UtJzoraW+ftiZw+0kfuSNq6rpAvMLbgXfZArjLyL/4
	Xk0Z5ZNifP0zbqJZlDrX3SOI0uBq3B21ZmgY89tp5aFVYfuFn8lvdGkRpkTqlQ0L/RJr3VAMJd0
	lu6g9X6aZQFZ4DpBjxIpiMpk1Rk3J4tIakOsK1jBokUKFiyil5mPFYmZMjsarKQdHrHVG5OXKNc
	A8LgQ1HWa8g9SzC+wMSZ+F/U9Kba5YPIUiL29brAZm6J1ATqrnVPHzyXzeGDmnE9AoscW96YCjF
	6FR+HHAJIOzkhKwTXxoof/CZCpGar1BJXTGl5HtWChiVPGPU1mZ9ZyaYL2JOj9vP2PSUUuGMjzu
	eFT6wgGPQz2mv8T2ia2v2OIGR46/qlOyTcNXPEK+8uCD5ReRLPReb4Ap5geqYu9ZckaBXjtkTSg
	K+ILu7xettetZKkGk5HB6MFGkChy729HKaCqYped4odYMUN8338iZ6Gyb+EazMYYdteVyMLz+VK
	vSBZ64F+N+/WMqb+PZLdktnMWAD4G10ypeIUjfOoirMZuNFZ8u8uuESp3Ek/9PGj7r0Ys/gIT6h
	HssEcxXrwO3CblrrZot0JYThTjkTtO8y+mUo8ri0DSHpv4CK
X-Received: by 2002:a05:6000:26c7:b0:492:f563:cfa1 with SMTP id ffacd0b85a97d-49c73ed0ba9mr17977136f8f.55.1794752320034;
        Sun, 15 Nov 2026 06:18:40 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm17400553f8f.8.2026.11.15.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 6/6] reset: starfive: Add StarFive JHB100 System-0
 reset driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261013102707.9207-7-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-7-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.14107280802504551112.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Apxx3Ov1ydC3jlD163T+qDu/ZuqndG5aUGB/PTRcBEc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95snLg5eWf6gfN/cd7eNeK+7ct2XeLhA9fyZ2Ifdw
 aUXGnamdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAi3zUYGd79iDxWUNy96YPo
 jLWvixQltj48/ErwXcDMiA5r1t3qoZkMf8VXaTvsaJ0547OP7Yxb39Ws+j6E33qolafOZLHo8CP
 LY4wA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061841_930834_DBACF5AE 
X-CRM114-Status: GOOD (  19.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
> the auxiliary devices registered by the JHB100 clock generator drivers
> and uses the register base handed over as platform data.
> 
> Start with the System-0 clock and reset generator (SYS0CRG). Its reset
> IDs do not map one-to-one to the hardware reset bits, so the controller
> is registered with a reset ID map.
> 
> The other JHB100 reset controllers are added by follow-up patches, each
> right after the clock driver of the same CRG.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |  6 ++
>  drivers/reset/starfive/Kconfig                |  9 +++
>  drivers/reset/starfive/Makefile               |  1 +
>  .../reset/starfive/reset-starfive-jhb100.c    | 75 +++++++++++++++++++
>  4 files changed, 91 insertions(+)
>  create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f66998e8eb64..c2ab9cbccf49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26858,6 +26858,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
>  F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
>  
> +STARFIVE JHB100 RESET CONTROLLER DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Supported
> +F:	drivers/reset/starfive/reset-starfive-jhb1*
> +F:	include/dt-bindings/reset/starfive,jhb1*.h
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index d832339f61bc..84baefbaee14 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> +
> +config RESET_STARFIVE_JHB100
> +	bool "StarFive JHB100 Reset Driver"
> +	depends on CLK_STARFIVE_JH71X0 || COMPILE_TEST

This would mean it can't build without the starfive clock being compiled too.
There should just be a shared header, unless I'm missing something and the
clock already imply this driver, that should be enough ? no ?

If so, 'default ARCH_STARFIVE' can go too. and just

depends on ARCH_STARFIVE || COMPILE_TEST

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
