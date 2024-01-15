Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F2CC47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jpjv2wH2yKs/HjOPIU0drZaE8XK0SJIAcqK2faK2VaY=; b=v0AYGa9cswxyz6
	LlnWiitxRbcP//pEdPL+ozizqFr8LSUwRSMvQezkadNrJKvRbea2xD8Wcwt3oMy69ZFHD400z1RZT
	A9ciZNix+RJ3B07lzY5vG+DvQlqo26JfuyEq4pNjhHKYCJCx4/7BBEUHy8k9uLH3BQImnpvPy/4l8
	y+bk1+CSPfi4nPhG9YrToyg/8mxny1P3iBe77jSGcVGBFlVaKKehZeF9fJgCVfCRsxhybCUX11VRY
	tJnTtmXwKgzUGY5dviUNcNJHKCg4qxL2iw1yO8YAKjqUzqvMc4u/pLbi/wyEvSEv8dW86G9BjeSmN
	8Kk+v6IYycLHhl0DkL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMhb-008znI-1m;
	Mon, 15 Jan 2024 13:08:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMhX-008zlZ-0K
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:08:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3375a236525so6946781f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 05:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705324106; x=1705928906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WclvSvESBcB1ccyxeqjrdGj+frspJc0esD0QtgwrkCo=;
        b=MwZHIgzC7GmxaTB9WoIyMy9KqHMyBGlxzsA6W4Jq+4dWz/ez7MGLf5GxJUb5lWWkdE
         LaD40ImxMib9/Bs/ApNaRBOHZ107LezoMx2kc//zTHYfiZN9xpfGYS87iDpeaPf+hNbh
         Td2TY8FTZkazNN3aOokawxPSHSGwElaOsUT70yBsRV2P4Xg3Tmxyhzs1f4Aceolj+yaf
         mQOd54OOjxXfT52fILut8QNp8xpi4X7gf8T9etKu9DVCJYUiPORtR7LkrcvB+KaEvWjB
         raG0PiJm5BII/yfXp826SWAMVi7P4f6HOllea2Qp4kYx0HYK9m/e9KME2DaiUOI3ZT7h
         U9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324106; x=1705928906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WclvSvESBcB1ccyxeqjrdGj+frspJc0esD0QtgwrkCo=;
        b=p3/SiN17mKJCZbMhY36Ob9RqvBbtg6vMn2jAm3UP2zlDOWD1m3BNOHZWky1I5rGG25
         1849NY4y4kgxAhWknpysnqpR/jzUe0jeml0LqjNoTnNAOjU/e+2fVqZZyw62w4g1aNzz
         gJkibIVXlnqSrS39Uh8c2J3FsetCLUiHuKInAuhELYA7VdPTTvkCO+RWXHjO3n2ERXLh
         nOg+89oMalFbarl134W3AX3TrhjPWriS0mezPSOv/8RZfFCFIFjuVpa0CtKTxIqjfDo6
         EkUKKgswRJPdHVp4e9smv0/JF3M3haqwnnfRPEA5e7s61JxkLVc7OZclZ25r8RmqYiZ9
         u/Gg==
X-Gm-Message-State: AOJu0YznrEn/bsAyG7UFQ8+czSZRMcRjO5E/tgUkODxtSyzp94i/dLtO
	+GShAu8QlQvbhMBWpE3RV6E=
X-Google-Smtp-Source: AGHT+IGsOzQ7L6ielq7mxIFwHy6qHtdKpqdw04n+je7tcix4atLkzck0Yy0VuXqfteUT7WaM2h9fFA==
X-Received: by 2002:adf:dd8f:0:b0:336:5f04:bff3 with SMTP id x15-20020adfdd8f000000b003365f04bff3mr2990776wrl.81.1705324105815;
        Mon, 15 Jan 2024 05:08:25 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3d67:232:2eec:2430])
        by smtp.gmail.com with ESMTPSA id d13-20020adfef8d000000b0033739c1da1dsm11843620wro.67.2024.01.15.05.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:08:24 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/4] riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
Date: Mon, 15 Jan 2024 13:08:17 +0000
Message-Id: <20240115130817.88456-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_050827_136752_93137B4C 
X-CRM114-Status: UNSURE (   8.50  )
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

On RZ/Five we have additional pins compared to the RZ/G2UL SoC so update
the gpio-ranges property in RZ/Five SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index d2272a0bfb61..aa3b1d2b999d 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -46,6 +46,10 @@ cpu0_intc: interrupt-controller {
 	};
 };
 
+&pinctrl {
+	gpio-ranges = <&pinctrl 0 0 232>;
+};
+
 &soc {
 	dma-noncoherent;
 	interrupt-parent = <&plic>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
