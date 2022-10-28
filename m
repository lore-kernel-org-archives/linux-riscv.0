Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E28C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1lfLE9GR3xZxQgjITfG02ZW3oNZYDK18yYkU8pBXYg=; b=4BGpdkMfLV5C0a
	md7yLdM8oqz7QGtL5kM/amZx5GwP9T6r84eRWrN1P0GJvwnnvV7eOYtsUfa+yXOpGTc5WyZmkDKNw
	eJ+z8VtludcAQYux25JVGkxLQhTftUansLRWsSiYkvFW0mhmDGRu9oBu8UfIQoG3FGn39FP5e2Llr
	T3PAiWfEQM4Hs/xuVIMZcPlWCbQfATy5GcdeBnYQlIaFZMiWjxeVJ73xGWb4tkNez5yvjEDrtbXIU
	EmptpVFSx8ryFd4D24ZeEc6I3R1uovS2zk6t4rqgWmdoxAtqP+SxAsD59MHA8XCDNvac2ACQcpOt1
	l2mJ7jNcpVvz8BC+hqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTCP-001K4o-Vd; Fri, 28 Oct 2022 17:31:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooShq-0015kA-80
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:59:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id r186-20020a1c44c3000000b003cf4d389c41so4189312wma.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f+mcZCr/CbyA6aN8Vpia+kx8w0RlnQ3lGVCG0LnGcQ=;
        b=AYbAXYgXFNzRhCB2OIZbIOvjNlVL8Oab5vaT77FIHUDdpokqYundq5fez00SBLysS4
         HINgemKrgVy4fyU7ZIuiKdywRW8MHTd7UPXz98uzb3pbYN17qtJpKwXF/+joBsCNDhgj
         Jq+OVjeZvm3/E3TWxD8D6Oasn9T6YKu/HyoMmhnfYBRVkGn/OZ2qSfHVNXPfks8DbPJQ
         M5U736BD+OF9DCksohUfzlBG6cbbeMi1QdAFSGNtTjs1Y3d1Hd6G29dG/VxzxrMsHi4Q
         C+1uWYheneC7+3WweLuZzrjq9za6nyQu/LXoShX7m1Dtu2ElNHOboPCC4LMAOA4UTq8A
         OUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f+mcZCr/CbyA6aN8Vpia+kx8w0RlnQ3lGVCG0LnGcQ=;
        b=Kw99VBkOAXhVo4d3djHjA4WrF7vpjbdTtaim1yAb0kV/gH73rWIpSb7pNDUtkOFAeL
         tpqV391MiIYUc+ZOeqJis/FcmUW8WjXbqDcXzdKsWfmE1aTq19r6/HIV8Q0bJF5RaIoY
         t1MuHS38MZfmnPyfoQFjT7a0eqMxy60+blsBpOkcb+mxnZVaZIwpa3Gl35z/k6Q0xZtM
         pt8jOTVZUY4cEvdgfLZ/bL47MlYYFm0Vglchg0uc9akeXbkDQNmZa7PKNNSIILd0mxNd
         eb6WjQTBtpnct95eY+HwPha7ICk0P2Rmrn+06GYOO2Gna/FB49kANMsKw5dqRa/YLxbL
         rx2Q==
X-Gm-Message-State: ACrzQf1maDrPGwsP0C9r08COSOqzLj70F0fpBzEatEcA3EWv/9RgbN+Q
	O0cZvMJipMsW0n07pjb2yzw=
X-Google-Smtp-Source: AMsMyM52a0DnQ+hKf8g3nm3FMmaqMhba1fBR5bCgeOIbr3zcKBqCXjJBeDc/XRn+1r6KrxE4JFA4EA==
X-Received: by 2002:a7b:c30a:0:b0:3c1:bf95:e17b with SMTP id k10-20020a7bc30a000000b003c1bf95e17bmr125243wmj.31.1666976378165;
        Fri, 28 Oct 2022 09:59:38 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d53b:eaf9:15f:6a8a])
        by smtp.gmail.com with ESMTPSA id h2-20020adfe982000000b002322bff5b3bsm4939689wrm.54.2022.10.28.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:59:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 6/7] MAINTAINERS: Add entry for Renesas RISC-V
Date: Fri, 28 Oct 2022 17:59:20 +0100
Message-Id: <20221028165921.94487-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095942_358630_47B79494 
X-CRM114-Status: GOOD (  10.56  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4 -> v5
* Rebased on -next
* Included RB tag from Conor 

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
index 6cdc2a74c7a2..0204f106d8c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2691,7 +2691,7 @@ F:	arch/arm/boot/dts/rtd*
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
 
-ARM/RENESAS ARCHITECTURE
+ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 M:	Magnus Damm <magnus.damm@gmail.com>
 L:	linux-renesas-soc@vger.kernel.org
@@ -2713,6 +2713,7 @@ F:	arch/arm/include/debug/renesas-scif.S
 F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
 F:	arch/arm64/configs/renesas_defconfig
+F:	arch/riscv/boot/dts/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
