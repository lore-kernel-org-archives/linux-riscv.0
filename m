Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B73C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbI2sig4yoSIlVvbp2H67AJhOi8uAMJJXwYf144p8YU=; b=l7XkOOvcLRIEKO
	/tI8AFLo/TKm3WgHrRx4AxXT90XNu08eqOomIcJA93E6TmYigkbwnzoTihnriN/m5uIEFSwRvvGVL
	3qLjVrsvMrDe4t8w8DBgaVTKS/LYw2GyAIHqmpWvpW4delc0l++rRM5oGaWuXQs51PJvjApntp3hu
	7dqIkN9k+Z0njBfGMls9pxIFWmgnS4ZY8qR3mYL06DVPzxAgsxgRbOYFkYnDBcgeeIQ+twvtpXxKg
	SYjMk1hA4FS7LB8r7H1FDMYvQ/biuA0NXdyTBnK2hFUXobcewsbSPeVJkdKaEyxDJUMgbL33bOxtr
	HWNwlYniEHwGcKE9nv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQa-00FU6s-El; Thu, 15 Sep 2022 18:17:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQX-00FU2n-8g
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id b5so32088208wrr.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1kMaGOYyU6bj/tvC0QnNHtm9kk+nLvr6d2aRk6glIRs=;
        b=QQ02RwhHzFVjmu0CTMvsqR4LNpGw08oPc7Vv9eCr/WGRACQPmttZU6QybB1rGNtYb7
         jCXHS+o+6IB6HhQYuzpWvrizRX7IvpxizaGkEY4cgGdaLgLK3CAfHXe2+1aUQBB3DbCI
         vfB5FuHOAYooEGf2xag3Hk8K96CwSk/QEs5P2LSPGD5PZbRPWk+/7gPPPvHiBXNlO294
         lCWryhApUMmYLeBOqDJFjXcEeomnrVRrErvRACENER9maugY2Yn3Eu/FbH6odtxrgsQ2
         QRx1QKGHZCuPK0FzEg1pIiKSCwzsfKERg6UgmmuKRvF58TS+xlG2vXyG76nyw67avwsW
         59xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1kMaGOYyU6bj/tvC0QnNHtm9kk+nLvr6d2aRk6glIRs=;
        b=z74X35N3QuBtm2wCsCw2cT4XE8bRcwQ/VkE0eH0P5lOTTyVStKbkLE0azcCwDP5sOe
         UVatsYfxW0bxoSJ15+A2nr7OlMtfV4hSd59S+2jLsYcup4gkXLcAK8eWg6TRBk2MmGOn
         o5hxlEoHuTxaR4BYytrOAIf3HfAXcmhX9fdD22H3nZCZVYLAsTrOu4VCqrO8jrJN8Xiy
         EkHYMHlNlgmvdr5HDc2kTLksgXCYdyi7fkF9cDhYFSf57ew1oVXdNaPLy89qLKqa6T+F
         Ls5Sm/1bulWUKmfM8MBuV7d5BuvbGseWDdyAJv7N1jN5sGqBddVrlSb+/8D2NsjPtZbD
         nOLA==
X-Gm-Message-State: ACrzQf2DQz/uxC3cpAVRD0YdYDtDV8fIOLI5M5A2fik0V9u8OI8tOY29
	/eLAd5MtTpxs3kToJ9vQUPY=
X-Google-Smtp-Source: AMsMyM5pSwquDv6Z9TOe/3EQTCmIcBKd4kDwDnrHZ4I8sBfN2WGkB7fNfmNXrOljyfGoNCbfKNTyXw==
X-Received: by 2002:a05:6000:1548:b0:22a:c113:c9d0 with SMTP id 8-20020a056000154800b0022ac113c9d0mr610513wry.653.1663265845601;
        Thu, 15 Sep 2022 11:17:25 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 01/10] dt-bindings: soc: renesas: Move renesas.yaml from arm to soc
Date: Thu, 15 Sep 2022 19:15:49 +0100
Message-Id: <20220915181558.354737-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111729_327580_5578AC30 
X-CRM114-Status: GOOD (  12.50  )
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

renesas.yaml lists out all the Renesas SoC's and the platforms/EVK's which
is either ARM32/ARM64. It would rather make sense if we move renesas.yaml
to the soc/renesas folder instead. This is in preparation for adding a new
SoC (RZ/Five) from Renesas which is based on RISC-V.

While at it drop the old entry for renesas.yaml from MAINTAINERS file and
there is no need to update the new file path of renesas.yaml as we already
have an entry for Documentation/devicetree/bindings/soc/renesas/ folder.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3:
* New patch along with this series previously posted as a standalone
patch [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220815111708.22302-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 .../devicetree/bindings/{arm => soc/renesas}/renesas.yaml        | 0
 MAINTAINERS                                                      | 1 -
 2 files changed, 1 deletion(-)
 rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml (100%)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/arm/renesas.yaml
rename to Documentation/devicetree/bindings/soc/renesas/renesas.yaml
diff --git a/MAINTAINERS b/MAINTAINERS
index c26a5c573a5d..f5f17c50dac3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2673,7 +2673,6 @@ S:	Supported
 Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 C:	irc://irc.libera.chat/renesas-soc
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
-F:	Documentation/devicetree/bindings/arm/renesas.yaml
 F:	Documentation/devicetree/bindings/hwinfo/renesas,prr.yaml
 F:	Documentation/devicetree/bindings/soc/renesas/
 F:	arch/arm/boot/dts/emev2*
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
