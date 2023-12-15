Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989ECC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 19:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VeNPDatS9I/5y3kQSyMbZ8CEkdNIZPJlNPM44h4pXQA=; b=1TtKaEAS5ZuD6v
	6Gx23pykhobScX0MFTQsC1HBd70v+X/t3GtDj7c+a84F5jtStxU1TGkdXvNGIoDUWHVHaORfCK/4B
	WIWZaPblTwUMAjuOuEWwrz6P7eV96eqwsy3BMxoTr7pwC4+T6d4NG4tK8OPQy8eJe4O3wO2gSrjHw
	clqNHW0rv7yArNxiN27LZw8eMSNbK3NSPMs2Gq8JnK+YnNcQIHmwuX9Si2RgUkDSPpyAKeKLEVOaQ
	8/W0KBQ9i8SjemS6kx1U1LNnShVOI4nsfxLikcK9umP4ZEFXRNkBN6eSbo2kYf055CltsRP3ATObU
	GXKs1whE43h5PBTPENNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEDYk-004Iwo-1f;
	Fri, 15 Dec 2023 19:09:18 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEDYh-004IwN-0s
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 19:09:17 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0AC763F2BB
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 19:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702667352;
	bh=MRZYQIHPmA7btUFQOfGYSO5VRHm0MVyK696kIcZXcYo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=vXDHXPbfzSLvnSVOKE6TP9QsztVOCO+29wlniVxZ5suCImxukbCNBKzlRtHHFovq0
	 Dnbw5xlINqbVff5kgEm1iF7We8h/7XcNal7X0YLJM9RlygqhCuy24Y+E1uPLYtGQGQ
	 quOLMBfyyxI49oqKyouIZWTs9JQOHQX1p9oo/ArWUbZU3PHE5jE0x6LcbeU3bXRrmn
	 P81PCEujycca4ie25Qp6Pe9NDZ/uBqRyE5WjEeHIshl/MGpOntnCk7WDUgh876b4VA
	 B7h2yBhyEJc38xyXwtXHkQpRVo2cqOnnsgk1YHQ67B07EcBrWixIQ7Eg+lE1vhFdtT
	 9vs5zMeRzRdxw==
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50c21a1733eso867973e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 11:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702667351; x=1703272151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRZYQIHPmA7btUFQOfGYSO5VRHm0MVyK696kIcZXcYo=;
        b=KrtFUY0K52M0x4Rh1VDiHtXOX1q0/2m3uWZPf0rPS1UXPgqfADnQ+2aeKThXXq+Q3D
         lsSlr29qEqGuNQ6FiEGDHunJfwvQXtHQ2vgNe5+e88GRvx8AGkLdW5p8GTJLPnhUzdg5
         k2TYJ/kGkVsJh00lPBAG9B5H4ZWgcnQCzt0i7+G8Rl5myeSGNVEHetfJaA6V/77WAppM
         m4gSg+qSFZDBhok1yofxFRJz0yDN1arIHhOsbHI/0BBMQQh5JdA46GwkDBiAIm52lzE1
         QmrvtjYoXz+5NlV7bCnkxf/55/2tnvmC/gtYRZlY2RRyKT3Fxu9TypREUkZUxG/yv8QJ
         F0fQ==
X-Gm-Message-State: AOJu0YwR4PkuWVcJpjtPiTspwFjPUFL/JEJHWlU8jhEgxEO6rbzLPTt6
	8nRSPIHjwddYW+zTyx6TPmzPhJENzqkdSQoPOgDxiOiJwV5hN/pSZGma4Uq7dbihAMTU46ViJES
	usrcEtqztMX1xe9z+83Gn4xAyGOyILEUQaucEAVETHLeI+60JKpxQ1g==
X-Received: by 2002:a05:6512:4847:b0:50a:a5f7:47fb with SMTP id ep7-20020a056512484700b0050aa5f747fbmr5071610lfb.49.1702667351114;
        Fri, 15 Dec 2023 11:09:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHfU/LDng1X8+W90PqDysrUy0Azr/q6l0EAbqvK90+Z7EyHsMSWUvd4IZQoXgYzTA4LDhgYQ==
X-Received: by 2002:a05:6512:4847:b0:50a:a5f7:47fb with SMTP id ep7-20020a056512484700b0050aa5f747fbmr5071607lfb.49.1702667350770;
        Fri, 15 Dec 2023 11:09:10 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id et14-20020a056402378e00b005527cfaa2dfsm1700456edb.49.2023.12.15.11.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 11:09:10 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] riscv: errata: Make ERRATA_STARFIVE_JH7100 depend on !DMA_DIRECT_REMAP
Date: Fri, 15 Dec 2023 20:09:09 +0100
Message-Id: <20231215190909.3722757-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_110915_438132_6F56D76D 
X-CRM114-Status: GOOD (  11.13  )
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

Similar to the Renesas RZ/Five[1] the JH7100 SoC needs the non-portable
CONFIG_DMA_GLOBAL_POOL enabled which is incompatible with DMA_DIRECT_REMAP
selected by RISCV_ISA_ZICBOM.

[1]: commit 31b2daea0764 ("soc: renesas: Make RZ/Five depend on !DMA_DIRECT_REMAP")

Link: https://lore.kernel.org/all/24942b4d-d16a-463f-b39a-f9dfcb89d742@infradead.org/
Fixes: 64fc984a8a54 ("riscv: errata: Add StarFive JH7100 errata")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Kconfig.errata | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 692de149141f..f5c432b005e7 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -55,7 +55,9 @@ config ERRATA_SIFIVE_CIP_1200
 
 config ERRATA_STARFIVE_JH7100
 	bool "StarFive JH7100 support"
-	depends on ARCH_STARFIVE && NONPORTABLE
+	depends on ARCH_STARFIVE
+	depends on !DMA_DIRECT_REMAP
+	depends on NONPORTABLE
 	select DMA_GLOBAL_POOL
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_NONSTANDARD_CACHE_OPS
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
