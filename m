Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030C0ECDFA1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 22:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DHslV7fs372cqL3jaSFsClJlF5aQjDmlE+9d8Gb+nxA=; b=aswhj0OxpJ9cSz
	Qg3+q0T2MFqYH1Rmf9j/AXaOTzRQ+zAUQibs7GDXZYsx29P3fia96Psli04rXwYcaeRFk9zOcx7rH
	eAxOsOBNKhBgUObiuO+M/9NiR5jarps8BRuspJFwOwdkc78W/p9D+BaACt1D6V6m+CwuOGVM2g1ki
	hT73SDp9yZqu59VBFi2IgOYwuF3V2rN/zCGFzMpmKQFFFeSJG0mQ9zqvmO1RFwFR2QKEBvySnGQly
	a3MJ5B4acARi/Aei6lew2JY9dfs1jwctRbahjyQlVoJRus4RyEasTrL7HKKepclyBB1PKfGK5wnDx
	ijhRTtWd9EdtfDhl1M/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onS4X-007L9V-7G; Tue, 25 Oct 2022 22:06:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onS4M-007L6c-5E; Tue, 25 Oct 2022 22:06:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id bp11so22837713wrb.9;
        Tue, 25 Oct 2022 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SkWFdDFpA2ET/e9kHATFDJrw30e54fmgfWvyavm263M=;
        b=A2RonXpa0rFb4YytEH1Z5+99MJaAl/mVWZzNqQ6EQRWGLl1Pco/PQ/opjEz0hTKxhC
         uyn6V7aiH7V21Gw1DiODqEBSeLWqJ/vy1M4kQQ/JoCrZVmaWz8lZVJygGBePG0DFa9mI
         KTt0s9CqhVkjTdFJrFMr6AR37vg9dnA0BrIJO7pD+3F6L2ZYzaii5WGqV1+4sQ4QCxX8
         9RnATpPBanielQGojIwyXsmK3QndMiGyit62HUB7vsBzXseIlIEhenOn/9v3nJI6kGGI
         jMz2yrTXtG6JqzDfUqXPhaMRobqyHLA9TlgbmxPKs2S4Gfl43mkbtSCgqX3OevAZ9OY6
         CcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkWFdDFpA2ET/e9kHATFDJrw30e54fmgfWvyavm263M=;
        b=GU8kngjonafi/PBIwtvz/Dr/djtVlZjlDzIy5z13bwXGKmtW4iw9MSVHafCq3BJu5s
         iRmKuWSwJ+f9ly2FKFQdV3vzZXpuQjOa9pwwTCar3iZB8NlGk60dBLxtvPYWbnQrtyUa
         j0SihFgOm7BK4t68iQi9XDgxnIuICfgcLJ6vUWGGjvV7sI6xNKrwT8tBONfXD2WGb0Fj
         A798xRbU7TC8I7sa4VrjlyyOJnw3WNtc0vBA9EZxC6PloVeCzDNsnfY106RxFP8GYhix
         CrFqGd3Yo90Vtbwm1P/EoKJsvsfpXKmpzYe3eQDdMHcWODME8KiAnOCJ+bdo2D6PBFiT
         QKfw==
X-Gm-Message-State: ACrzQf32YRvbChJUzQfLRuNMlVQXbNNcyszNDNvA80K1x5k0LCjntCEG
	ZD+/FT4w9tNK8ui0QQV8t58=
X-Google-Smtp-Source: AMsMyM6S2hCm+V5CuUIkT7HUDf8wqISyruffcau/S2wjKVy5wCFulcnX5ktIboGrM8eoVZNxd0ohXw==
X-Received: by 2002:a05:6000:1ac8:b0:231:909f:a4ba with SMTP id i8-20020a0560001ac800b00231909fa4bamr27793833wry.675.1666735603495;
        Tue, 25 Oct 2022 15:06:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:1d2a:d2a2:361e:a475])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c1d1200b003a342933727sm210534wms.3.2022.10.25.15.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 15:06:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] RZ/G2UL separate out SoC specific parts
Date: Tue, 25 Oct 2022 23:06:27 +0100
Message-Id: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_150646_223013_DDDBD45D 
X-CRM114-Status: GOOD (  12.15  )
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

Hi All,

This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
so that this can be shared with the RZ/Five SoC.

Implementation is based on the discussion [0] where I have used option#2.

The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
(r9a07g043f.dtsi)

r9a07g043f.dtsi (RZ/Five SoC DTSI) will look something like below:

#include <dt-bindings/interrupt-controller/irq.h>

#define SOC_PERIPHERAL_IRQ(nr)	(nr + 32)

#include <arm64/renesas/r9a07g043.dtsi>

/ {
   ...
   ...   
};

Although patch#2 can be merged into patch#1 just wanted to keep them separated
for easier review.

Changes for v2:
- Fixed review comments pointed by Geert
 - Changed the SOC_PERIPHERAL_IRQ() macro

RFC-> RESEND RFC
* Patches rebased on top of renesas-arm-dt-for-v6.2 [1].

RESEND:
- https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

RFC:
- https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

[0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-arm-dt-for-v6.2

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
    to specify interrupt property
  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 347 ++++++++----------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  72 ++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |   2 +-
 3 files changed, 220 insertions(+), 201 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
