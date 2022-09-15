Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9878ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lncn7af58lHVrAH9pZexmHs5c5D+k0yO0ChIXRfyE0=; b=odeWLNFe74eSbc
	obe6iANhj8pwXrdpJ1TQXPcxOLHPky+AYBdtOysysmgym09JZGuw3t+vQ/SpMfXdXNR1sblrWDraC
	/HyatKy1/IuZnIUHSqNnYMKhEP3Zy7GV+CvWQIzcH11bRJC/9RtXZYeh2aQhgi+kXaLesfjnkJV9z
	woLTSDed2iBZkkyjiZhhVgkoSeE8wO+v8w340ufaoGKGsl+g1hKYHWt38BXhfe+LzyvaugsmxCtGq
	CCk61Jq4ACV5+9K+MJuEfaRtmYREeSAUFx680f7VhFAJ7IKtm56aHMRJ7j/QAreSt3KS3H2QYP9Pi
	l74xvM2L3UwppZ/FMAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQl-00FUOU-GA; Thu, 15 Sep 2022 18:17:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQh-00FU74-To
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id v185-20020a1cacc2000000b003b42e4f278cso15190573wme.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=w/cmM+y2gxKg5jm8Bro5w4Q9rtvJS+fA1dYQeKasii4=;
        b=ADLKYQ+KHFkm21cgXoAe5QyUtuILHJ/XNR4JJ5k7vytPPsxRuFEK33s6bW5+JgXxM3
         W01KDKcsJogony9DNkb95goIwVkKUuhwJedzsQUXB/uFS1FcRpKa6t8v8ejDmAtswciW
         ZirWdPu5JqSabpGpfYOkrhGxxMfc1LY46xngiO6a7BmkuUB7VCMTGfYhQH94a/FRqVEi
         H8WJp7HCSxWutENhrbVvQq224oR7S5eM7sUij6FeMMWoxv5HOUcZWx4nA6dOBSNYGzvK
         36gL09GwADtU+GarM13IK7uFaBP0PDOUw0sTQkTj7y+0cxXuNgKxdup9ZYm10W2D1TQq
         khog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=w/cmM+y2gxKg5jm8Bro5w4Q9rtvJS+fA1dYQeKasii4=;
        b=ec0oLuM4VCj61/Z1CiY+45nw8CuBJ0fzY/5TZX8WS8+0QMwQ56QsXk24d769c/tAE9
         JmUXmgfxUKlMlv9tixpGr1KnAAD2mIgjJI+GQIVRZCz9oG504tex08TjM/A2AQH3znxs
         dwWSG7WgHx6OahTmM1DTT0RxbsNtjaG4a9670RciGQOVD6UvFRobskPZ3KQ3CyeEMX9g
         3RpRoxmN+9Nsx/EZINRvrWnowBEecRJJ1kxu7CfzP2uf44A+ajZcd76p/rLfq0thDYcs
         FBDyp67mIQ/GQvcGLPaf0Ae2e2Fxvz1g5enhurJyVbieEGGrADfptkVhRL+dWx9tDwd6
         uaJQ==
X-Gm-Message-State: ACgBeo2GZCcHTdi9+CJZWEY9GH1Bhhe22vlQXuAqtDK0KSwGBPA3qKsD
	fQAQjzzt0c6tb9aiLN3tWiQ=
X-Google-Smtp-Source: AA6agR7an9/4uyQQO6F1vpBCBq8xCtvSqjGN8uRyktlX5udO0YulxTlFh0tTWfgxnMgn8ncFz0+4DQ==
X-Received: by 2002:a05:600c:594:b0:3b4:7637:9444 with SMTP id o20-20020a05600c059400b003b476379444mr7863290wmd.52.1663265853164;
        Thu, 15 Sep 2022 11:17:33 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:32 -0700 (PDT)
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
Subject: [PATCH v3 05/10] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC kconfig option
Date: Thu, 15 Sep 2022 19:15:53 +0100
Message-Id: <20220915181558.354737-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111739_999187_63A0A458 
X-CRM114-Status: UNSURE (   8.83  )
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

Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
(R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
of the Renesas drivers depend on this config option.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
* Included RB tag from Geert

v1->v2
* No Change
---
 arch/riscv/Kconfig.socs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..91b7f38b77a8 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
 
 endif # SOC_CANAAN
 
+config ARCH_RENESAS
+	bool
+	select GPIOLIB
+	select PINCTRL
+	select SOC_BUS
+
+config SOC_RENESAS_RZFIVE
+	bool "Renesas RZ/Five SoC"
+	select ARCH_R9A07G043
+	select ARCH_RENESAS
+	select RESET_CONTROLLER
+	help
+	  This enables support for Renesas RZ/Five SoC.
+
 endmenu # "SoC selection"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
