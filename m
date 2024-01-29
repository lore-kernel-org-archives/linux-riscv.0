Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF544C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jr6CCyhZKoKSQxNXNbBaDJ1rUd5Y0KdUdLTeqzQw24=; b=uiQU5DDwoMqi6e
	6Zo+7UanP3g9wzb5WnNvAjkoIIhPgV/vef10eZd5boVAcAghy72IK5oZ5wDG1hnzsYhtKJ6M6sZkH
	l9uSjeltOVApNXCbTE2nrG970RBlvDb7b3KRPMWylCFwemK/DE9E9nXTw9C7QMnQKav42Kr2J1496
	5bp3cdoK2PFNAqApV2jMCHWykLkuoFEhyQT09VgtDga36LBXvNh6UQ//zsyzP5XlYJLFOeVqp7nU6
	yu0oIhIg9m5D/yRlOzlLsUINqlNwA78AXktbpvkaX9PKdn3jUIby6IyrumZWEkcIvnk17Ogfc5sK4
	BaARCpI14OWbCwYeLpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNM-0000000DE8F-4Btd;
	Mon, 29 Jan 2024 15:16:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNC-0000000DE2z-42pP
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:16:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40e775695c6so25312595e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706541393; x=1707146193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4bMMpLXuQIixNeR6WwJ9UQMuCJ9W4sOuZfXsidKNW4=;
        b=dKAHm4Zy7TToBBIfNmFpHT6KaSwA9vZmOmHD0stpH4VhrWP3/N5QpW+kOyeSEIF/Rd
         zpTVpS21C6vXa75+RgIgSYjzXL0GrjyE5UZ77ZfLgP4iYSILWjQGraMy6dY+JXKJr85i
         4rIvL4K/SdWAVSHyp3JkP1KQ9m2dmA8ZBocV2xItccrTo6BpSxOkHnRF30M0B9gzPhzt
         6yb/zzFS+sPBFO2kXY3liRSj8K1MOFJn/THL65L0m6/CVEHEonzK3xPXqQx2IvojS9AY
         rVoGr/y5MsdLrlN7xQtcnQpmebOZWLqJSshYzeHyApGHOTuwHrCRGuBsbcTThwLGahgk
         T5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541393; x=1707146193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4bMMpLXuQIixNeR6WwJ9UQMuCJ9W4sOuZfXsidKNW4=;
        b=Eg1anWN8YupkecQ0/4KyFh1QnbUCokYnIiUJcHUoBmyVy5D0kE0ZX8sy80OH59+hXV
         nI0U1yZYYtXs6hOPJPQ9JyseZSneQmt23dLAgSeFsSI7ldmW+02ef+cPUk72Nkodx91B
         Q6GPIguCjkgU77zYBwSR+RUjZFam3vLV7cp+W0beThO2AlWB1dUGrTZJQaLAoJSFtrbQ
         jl4e7jHi7Y5rC7P+rdsQCZvZRWZQ+UA5WWEwkonGlps1KZx8mlphyxcK/5NrH4J8gB3A
         AuFdOxCsz83X6Z/gUS+fLcFfdCctMEwKpLx+NFIoWWua3c+hYL+6EDhnTSgOEPizUBdW
         2Y5w==
X-Gm-Message-State: AOJu0YzHFkg/oWq5a4/ZdUevPWQkw0pBmUrROoq2Ne5Y3ZfRyN94Qm1i
	8ZZn5jFOpr6JmwbOCXEBb2XvtgW7nOK6rRc5gk6XzcBNXle4I2C3
X-Google-Smtp-Source: AGHT+IGC87bYjEe1iZ7p/5fpoWfZzxhMEEhDy0q4/HOyZO3KfblXARleUUPCKunnw42Wa9PiyCeq9w==
X-Received: by 2002:a5d:47a9:0:b0:33a:f34c:23a0 with SMTP id 9-20020a5d47a9000000b0033af34c23a0mr1892243wrb.2.1706541393177;
        Mon, 29 Jan 2024 07:16:33 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm8397774wrb.115.2024.01.29.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:16:32 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] riscv: dts: renesas: rzfive-smarc-som: Drop deleting interrupt properties from ETH0/1 nodes
Date: Mon, 29 Jan 2024 15:16:18 +0000
Message-Id: <20240129151618.90922-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_071635_026391_CE1B7B5F 
X-CRM114-Status: UNSURE (   8.45  )
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

Now that we have enabled IRQC support for RZ/Five SoC switch to interrupt
mode for ethernet0/1 PHYs instead of polling mode.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index 72d9b6fba526..86b2f15375ec 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -7,22 +7,6 @@
 
 #include <arm64/renesas/rzg2ul-smarc-som.dtsi>
 
-#if (!SW_ET0_EN_N)
-&eth0 {
-	phy0: ethernet-phy@7 {
-		/delete-property/ interrupt-parent;
-		/delete-property/ interrupts;
-	};
-};
-#endif
-
-&eth1 {
-	phy1: ethernet-phy@7 {
-		/delete-property/ interrupt-parent;
-		/delete-property/ interrupts;
-	};
-};
-
 &sbc {
 	status = "disabled";
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
