Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09443C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 13:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/SqJP8yc9s0S/xyHEEB0GJvtXKvF4Z0kXGLkyfRVs3Q=; b=FKghtdvsSOQOzk
	/4cjB8dQt+WZqCebkQwmFnA4/qr5eilRoP14IvA0pZWMoyIaX8MRR7GMhDz7OsbwoL1GST6U+qM0T
	sKvRrogrXrAz3wvwxvOq6mYTb1aNOZpdJjQ6lYCwHPKeX8UlATCRERztuMOND39unvDxKaa0vNVDW
	DEhyVvHnVU4dr+CX8REJ49QWuJefPBqrWhxdPHXawlxBpLdlNsrOi2vJVfMoBhNZ8pNvwdJcm4o3j
	iGqeBYuuPJqgyDXl5XRCyxNdJuTbSo8CjqnM2gDgBelHaWOsg0CRAcyvTUA2TVO033HHrUM7QUMzn
	muQRHWNiQQWI+SN2SZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1sN-004Fn0-Mx; Fri, 18 Nov 2022 13:57:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1sL-004Flj-Ut
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 13:57:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id g12so9335398wrs.10
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWeG46+stoyqg0DxeWDTE3Ia6sRtYUvD/f2AC43whrI=;
        b=UBy2pMwmY0F9TprKdzF9+oHmuDyYef1NLk4176juESl05IbLKp/9GV1uvwNyE05eZK
         Z+p4UqW4trGX9r7dbmMuBuftaRQ4LvECgbAC/ityZUzukli41iB650dYXFJgH1YVEbw3
         anilvPdoIUHL+/519Z4dn9g5IfQiiRtLNH4AmNo9+rZS/xdn2l6s5OlKa7Et9KiQ6ulO
         wg/8YoszXR0Tuer9L5IYFieHON2rjcYFY533+oLLD4OJnogLo1dw8T+LrUog6HLoC0VC
         LwD7qSPBu5dMc26l8lV2VfWN+AqetNatAGJVeor5LCkDBvhY2c3wSb8PyU0NMXaTUTdf
         SmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWeG46+stoyqg0DxeWDTE3Ia6sRtYUvD/f2AC43whrI=;
        b=7TpzlpvfXSbUA1RuArB7GvIR5T9LewlbmPfHlTLm+AZy1Dpj/zLXIL57QmiF0UM8Df
         i0jYjXEEiEUaAk4dFylUwRpjkXqkGTjYU+tEkq4qH2HDRJkKoQffnndTB7Y+1O5WbCwS
         rBT3pSUNoDu7V33juZ/5LzLvayXdxmnLMBbNFRgxTdjN+HGVPhFxcWlp6Oi4r1p2/lD6
         R1X/5CHXcKEjJAeJuDIrOYj/0R9RDjesqe6bL9sx+fTEHzYymSt/rwyC6DZ2vEdF6Nua
         y8tNoZTa6xYQq0M1Vhlw4UH0YUj3egTpiuY1aLvi2ASNPGuGcVriapm2586woOi+4mdw
         9MZQ==
X-Gm-Message-State: ANoB5pmzvUGlztzjld6gcGLmv38wJpD87GV5tbz78MrZonEnbhkP3YYq
	hRmou3NWDp8Tp6JFMb7mTlY=
X-Google-Smtp-Source: AA0mqf5ExHBrb9jNKEdMu558qiVQsc11nUOiP0QaPE81UIhiHekyMevzM8kLNpjwRinrrCouduOJ/Q==
X-Received: by 2002:a5d:6282:0:b0:22e:31a4:2323 with SMTP id k2-20020a5d6282000000b0022e31a42323mr4368273wru.691.1668779866301;
        Fri, 18 Nov 2022 05:57:46 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:29e1:fee9:75e6:d6ea])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d604d000000b00236695ff94fsm3638491wrt.34.2022.11.18.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 05:57:45 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] riscv: dts: renesas: rzfive-smarc-som: Enable WDT
Date: Fri, 18 Nov 2022 13:57:15 +0000
Message-Id: <20221118135715.14410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_055750_046391_D23D92EA 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable WDT node on RZ/Five SMARC SoM.

Note, WDT block is enabled in RZ/G2UL SMARC SoM DTSI [0] hence deleting
the disabled node from RZ/Five SMARC SoM DTSI enables it here too as we
include [0] in RZ/Five SMARC SoM DTSI.

[0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note,
- For the WDT to correctly on RZ/Five we need a fixup patch [0].
- Patch applies on top of [1]

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221117114907.138583-2-fabrizio.castro.jz@renesas.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-riscv-dt-for-v6.2
---
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index 2b7672bc4b52..fdfd7cd2792b 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -41,7 +41,3 @@ &ostm2 {
 &sdhi0 {
 	status = "disabled";
 };
-
-&wdt0 {
-	status = "disabled";
-};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
