Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FD0C3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 22:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KTD5u8gnL9Djoydj6FQWzqxDXszFZe6xd4nWKHuMCJ8=; b=PKuF3dLxGxFeiC
	9MhP2zbaGgjqp1BLa4dx26hRqiFBayo0JCid0D919v6Z6fZTZ4GKonFtRhZv5D68KMUuOJlQwOjgN
	pXhfHlNS03UCzFeqLj0A0FDP8ssgfFJUgB4ARIio9UIVqCkMMdQowfT3ehRMChcyBP/4+HSJV9uXW
	t547r3a1nxcEQjhVIojCM+46m6/kDHPD0NmOR3kVgK5T+kJ9wVkmZp8oGwf9XGFEi3X2rjz94MJJP
	QWa5cwZLw1CYS32us84PD2z6EALu0lVtD2kQqkWglJoBXm40y4Jgx+BEi2Qx5gAZbkUDJNqyoVywO
	KVOqokluIPhG1eSMWDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCTI9-00EaSn-Ub; Mon, 02 Jan 2023 22:28:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCTH9-00Ea5G-7z
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 22:27:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h16so27550243wrz.12
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wtP7E2/yHl02046h04PnnDHRMQAylX/VciI7feb4uc=;
        b=XYlFT3Q3gY1UCrytvXj2iKmGX3LlIliu5asqtmjrPwaXmHvtudON3zx4M+A28yNMvs
         dRHNCj/GtDG69GekRpiGhCLUNKom1z55XXESugsG5G50xQoOkRzMijKqwxZ811lFS2Aq
         nuz52UsvkiTUEBZt6dr8KHPJwWMGoCCzRap+ZXeOFvzDQWZRunGZ/DOAWJghLVdfN/KC
         AANSi+CdzSqyfU6+Rmf+uaoUhrhZu9O+lcBwAAvt9L7io5sdtS1ImqbvecObwVuFfzqs
         /8NwZ358JAO2VhODXhaOWi2wOKS2cELCLtn3HJNEVTROeWHdRS50HhRLlBH0KQ+sTtyr
         42KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wtP7E2/yHl02046h04PnnDHRMQAylX/VciI7feb4uc=;
        b=iMaSrOK9jdTzQmoCE9z6DE/m3KV64IlgUC0MgGarc709W0KAZSIzXBVb9qTrJ85se7
         rzLEKV+eU3SQCAD3x8TB2nRR+NAILy+4kVxmNPnxKwXh16jE2AiSOr+t5bTsaszEc4oN
         1+vtpe9TXyC0OZONEN8KqCcOJwvVPjiXetOJVJFrxkNkQJexLKuaMUtH9kFLA4H48+80
         TUiE94MxUT7Nm442PrLxvLKmykMBWkw+6GKh2kOIZTbDFnvwP4y3LeX4StDL+zxEyHjB
         zZXBsDQ4MC0gcwTM1SLpp3cAvJWVCedhyMuoLcPcEG6Olp12u8/FJoPtCt18LH9HPq1L
         JgIA==
X-Gm-Message-State: AFqh2kqlfuXqfFfb1jGxpKUcj1a376LoY2zsGg/FvSVRINPitjZyNXIr
	wj/2/lFNVxn/HcNt7qCGsxc=
X-Google-Smtp-Source: AMrXdXuAdYrxMskOHbOTNuRZtKsmI9gENs7lCNTVa9gUFGSdMVP1y8CGfWRhragy70StL+hWnqdgLw==
X-Received: by 2002:a5d:4687:0:b0:289:552f:ed13 with SMTP id u7-20020a5d4687000000b00289552fed13mr11682705wrq.25.1672698441013;
        Mon, 02 Jan 2023 14:27:21 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:8a7:e535:b020:566a])
        by smtp.gmail.com with ESMTPSA id h6-20020a056000000600b002423dc3b1a9sm28298184wrx.52.2023.01.02.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:27:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] riscv: dts: renesas: rzfive-smarc-som: Drop PHY interrupt support for ETH{0,1}
Date: Mon,  2 Jan 2023 22:27:08 +0000
Message-Id: <20230102222708.274369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_142723_359558_DE0C3203 
X-CRM114-Status: GOOD (  10.39  )
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

IRQC support for RZ/Five is still missing so drop the interrupts and
interrupt-parent properties from the PHY nodes of ETH{0,1}.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,

This patch is to avoid build issues due to patch series [0]. This patch
applies on top of [1]

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230102221815.273719-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221229230300.104524-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,Prabhakar
---
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index 73941a5f844d..d6f18754eb5d 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -24,10 +24,20 @@ &dmac {
 
 &eth0 {
 	status = "disabled";
+
+	phy0: ethernet-phy@7 {
+		/delete-property/ interrupt-parent;
+		/delete-property/ interrupts;
+	};
 };
 
 &eth1 {
 	status = "disabled";
+
+	phy1: ethernet-phy@7 {
+		/delete-property/ interrupt-parent;
+		/delete-property/ interrupts;
+	};
 };
 
 &sdhi0 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
