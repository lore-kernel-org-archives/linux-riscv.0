Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3E2C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcM5ioZQdIZmkBHsAJRBmsePPqCBpIZWFlOIkKFEmis=; b=QQmU2H3Za6puv+
	sAxnFIH749yTp721nzosZmH9Ui9Rs/nnPjbiUo7ihACPJswhOljdPApkashS7xmkUe3v0KrkUbToW
	rlUoZoNXjbCwNvdiRBdA9HyKAfmsUaTOX9y9ZBXo0flL9lOnkfVjI9lUell9sJIPxDwfnpTKIY9VR
	TFcwouto+twBdpsSgGZ/augXNuxViM3HvOqysVyZwCqnErPaeCSq3Ds9XG/7UhLwxX1P86xRxE+m6
	zYEhaF6UOHtJ3FPQrqzyPcrObQm+SyzLGK+guVZrUy1d8iblV7XFktR3ozeGsPK0MC2wx9qrZvXZR
	q3owCTQYgFY/vZ7RHt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiKW-005pvI-Hg; Tue, 20 Sep 2022 18:50:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiK7-005pVp-FP
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso2314448wmr.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EQLU1p9zTnbfza7bDPcd3NTO8vUBdj6VZqpG9QwD+18=;
        b=KqGa3vSo6XnGef1G1wAkb5SClNL9yfvCVdQtQAsrWjvrjhXEtvlKeS2Wx5Pl/cEo4g
         jyHMcEeIMCzJhn2d7oLJ5dyKw9QP1KriaW3agts4FTcty0sIokH2qQGwzG/8+uwXnXie
         9C2lkObVBs7SFuoqcGQKgafrr8GqKHAcBG9edfIb31IQdyG4bMqnLoE91OclsjrDEf/3
         95R/CXxpmoFxHHfxw796ffA9NTMLN7qLvzVqdkrbB6dnEyzvVOPDAXcqkc7PArungp6+
         WQ/t1WKBGhbC5ShIIt2ilu3Juz/3Ptn3rAniZ3kxS4W2uKYQQOIsr5TPl74iDo65BXHA
         DziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EQLU1p9zTnbfza7bDPcd3NTO8vUBdj6VZqpG9QwD+18=;
        b=lqPz/Tm501fOT66Id435+n1TONZjzstJvm3Z8d1iLnwkJcWnqI4fajflgWUzlBBl1b
         7KtouOv7s3CjEEPc343qkz6LhC3QJdWECFhi5dkiRJYo+p+dmeJ3ay1d0a60F1SbNML/
         MxmMMD0UBPUkREPYgvMviI1C8ds6hXdoNIG7tPSfst8mWi/0Qe9sRq0Wc94OxlZFr0SF
         sdrGcKmk233MzPlUZVL7FmGUYPL+JUO6+nLLBSd0iBzeId+1WhM4v1Dx4JlUhcrR0ueS
         OjH1TFtOxThy6mfvYa/1L8k0548vmKh9Q2WSZYr0Gg7FS0ORt3fvotzjaxOo2R3Y9APv
         hicg==
X-Gm-Message-State: ACrzQf3vWmIy8FYmwHyAQk37xDbPJzqW4N5f44LAVOfYCSuyxnRiIxI3
	Td9N/OMtjrJSCLNTPTwZpLM=
X-Google-Smtp-Source: AMsMyM6RQFozicQvq9rbieliRqHqd66tgvlgtA/miWJlG7cXqg4FA2VYKxF7IvVo5PdnBSZ+DwcNRg==
X-Received: by 2002:a7b:c34c:0:b0:3b3:4067:d473 with SMTP id l12-20020a7bc34c000000b003b34067d473mr3534185wmj.52.1663699817985;
        Tue, 20 Sep 2022 11:50:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 09/10] MAINTAINERS: Add entry for Renesas RISC-V architecture
Date: Tue, 20 Sep 2022 19:49:03 +0100
Message-Id: <20220920184904.90495-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115023_567831_22FEBC4C 
X-CRM114-Status: GOOD (  11.02  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add RISC-V architecture as part of ARM/Renesas architecture, as they have
the same maintainers, use the same development collaboration
infrastructure, and share many files.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3 -> v4
* Included RB tag from Geert 

v2 -> v3
* Merged as part of ARM

v1 -> v2
* New patch
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48c5a152f743..fbf507cd3f41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2671,7 +2671,7 @@ F:	arch/arm/boot/dts/rtd*
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
 
-ARM/RENESAS ARCHITECTURE
+ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 M:	Magnus Damm <magnus.damm@gmail.com>
 L:	linux-renesas-soc@vger.kernel.org
@@ -2692,6 +2692,7 @@ F:	arch/arm/configs/shmobile_defconfig
 F:	arch/arm/include/debug/renesas-scif.S
 F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
+F:	arch/riscv/boot/dts/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
