Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63579E7C4D0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxxLZyytHDLCS5aUN+ufOnpCGdUMDKyfGFUtxsF47so=; b=br1Aq1QnO/9Pot
	PW0a9oNqtIcwMvySbPSKkI6e3SkvUU7+q02BGvKtaPtQ+o3JWzIeFuiZ6iZCPYbD99pbEIkX8Ubis
	ENbBMWAO9vpOdXd9fHtp91aE7ZtMyXUB+iBoLhPGRWGMwpbNeNVoyw1OZTcHLHZW1ZwQOe6eWzFb/
	15eL+ZJlwOfdYa/Bepzdh3clr9EinU4/Y5sDceLF0CzaULZTLNFETJz5z5v3O8WpwmP7NGnJzu7Oy
	9YUHCXZCIXXFYlbd6G42mC+O0ZYs4hjGJ8zxQgCaqDmbkquP2gd9EQWhzK/mqC3LYjRzgReTWYoiC
	I7wLXr3mM6v8eo9tVayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3xd-000NJ3-25;
	Wed, 04 Oct 2023 15:38:53 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3xa-000NIH-2s
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:38:52 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3af609c3e74so1499763b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696433929; x=1697038729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvpIgA1NrzZoExz057WGLdJuiKTT6FN12MIO7ifzbic=;
        b=lDxjVzdRVTn/YDCIV3Z9gHTnE9a//osiHRZ3nGQpSrE93DTbu8XcjsEV31hPovFSg3
         7SQ8q14tKnsKTBE3FXgnjIhgZ3Azs9eevInQhQW8uvyn3XSRgIfW31Cpzq8YYx4/1gzJ
         gfEOA/pbMuaXSDuCqTYQVRGk3nyVoMKhJJeL/LEH5ki73wx7NUxi+Jspc65W5xAUIz3c
         hEYct4FWncQY+9Zwl9dOhuzarfMgMSEy5UFKKvM8VxC1Pq/NLE63SHltCYhTjIL13E3m
         JBA0Q7AambY/74wKuUP0h4BZNOGDxKrCiLNCy5cZHJ+e8i7pW1SdTcuDBXzJRaFUxcTe
         ZCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696433929; x=1697038729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvpIgA1NrzZoExz057WGLdJuiKTT6FN12MIO7ifzbic=;
        b=ak+RWPlHMmQAnvnL6QDxnyiAyHwyKt5czeJHsx3fk3rYUoxvvLhKSGi7fYyN9l0KaH
         p+tM/3AAGtwZ2RW8vkCOO+KNeiTjafc6yaFc0tS/WWsClLjhTgRxlfdSy3qlMaahLHKk
         SZZ2cuUdWD4YKC9xtjyDnfUrReXWn/vZZiT+ik15lLYv6xs8Mk+HDFWF/pr0pwTPwD1d
         0lfl1C/KPIn+HxKbb51YMko2CLPOXr1aEDRqlJh+QhGp8jUeoVtSeqVRmTkna6zEl4Hh
         RgqqOFAzd8+YwE4CSrtwOz+/9fdYNZU56cJT5dbfJFOogF/kbm1RYSR8J2Y/JAlxyG+P
         f/HQ==
X-Gm-Message-State: AOJu0YyExVhy4480OWBvFdHjnHAAdWpby9AHiF9KCBRYX6AKlIyr1YdR
	ZEHhtI6ptMWtaueAybyYarg=
X-Google-Smtp-Source: AGHT+IF6NBfKh7H6lOBUPb8/5Av2JxoQiA0M+JJQ1P26d/Dn8ttnK9MCbFGsUzJJC5LJ6rSsak9IuA==
X-Received: by 2002:a05:6808:1829:b0:3ab:84f0:b49d with SMTP id bh41-20020a056808182900b003ab84f0b49dmr3646541oib.3.1696433928750;
        Wed, 04 Oct 2023 08:38:48 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id b24-20020aca1b18000000b003ae24b38f99sm541000oib.2.2023.10.04.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:38:48 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 01/10] riscv: Add SOPHGO SOC family Kconfig support
Date: Wed,  4 Oct 2023 23:38:39 +0800
Message-Id: <46e7460668bcd88f35fbcc3cc55a96d1fd2a1fea.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_083850_930900_0540B7DC 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

From: Chen Wang <unicorn_wang@outlook.com>

The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
cores.

Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6833d01e2e70..d4df7b5d0f16 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,6 +22,11 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STARFIVE
 	def_bool SOC_STARFIVE
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
