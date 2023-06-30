Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D9FEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4BF1B3dW2qQj4oqrMw9xT9c4Ej9OZhAWMFaUSX34GA=; b=NpQQkdM2JxLY5N
	x7C6GvGrddNhuPtF0OMB9XE0hjzaAKW/nqRDe2DmxFhqFcNS7w2MfYSx2ugrYXjE2lefXYvcG5MwC
	lZmkvWDYVeOy4GLzhADcQO9APOrebzij3rh5iO+IgmZpDNQowRo9a1ONHmfBaOuS/emNkpHSD25eJ
	9HxHqwJ2ZDZBkWkIReeN0gXspJy0SjRDGkS4Mmiw3X0akjN+WDgooOSfmG2Z1gX6SA96Yt23VaL1C
	efTOZ4Kr+TibcCXPwudtriRjFnY9wEeScT2eMNypUVqD8CbQAn8zpPHgoQLn7HWBwNWHqDbCcjPGc
	ddcUciZCY+lleHKWwuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCsO-003ekP-1k;
	Fri, 30 Jun 2023 12:05:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCsL-003eiL-2w
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 12:05:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fba545d743so20409975e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688126720; x=1690718720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW4HxCYnatcP/vztbzCLoFkbFaiPGRf9h2XT9nzoMiE=;
        b=VMutcdnOHcriAlE+V2oVuSLEZkP283yTDLN5t6c/yEHifGOtsPHZ0SiWEWs3WvFCMo
         AXDE2kzOIFrcBIfHkiU3sXEUVXK3bxCuUtBm64a+pX8OCRf69cQ5Dj+tkXD/hQMdaaNZ
         xB1SpI4kcKPKUx1aGyAOk5fWDXJbbW5qt+dXBpc9xNGNs/Q26UjSkAsyKuB0lYqPZn/4
         eRQlDAN6b2a5kp8wjrwmyxzNIWfzyQT9R5Z7Cu80k2BVzjhcKBaEG2ZTJSjXhrEJxG4l
         njAtczOuJeQ6GiH0qAlj1hT5jAmhza91Pk/gx9m/si961e34XynbZT9Ms7Ryp4SqGmjc
         Q7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688126720; x=1690718720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW4HxCYnatcP/vztbzCLoFkbFaiPGRf9h2XT9nzoMiE=;
        b=InNBeaAKMiBPhX8u+Iq1LLdk3PMOGoXzVIwLOoeWFn7k/D1HimAMzquPdjWHmesHM7
         peeFFLLpXB1NgNTrKu4DCZNMmgHoXPodp0XqMHy8G2XdDppwPHOox28Xt1Hi7qAM1W7u
         t4xuf8z1ZJidViSA+/Vx4to7l5pxKxjoRcPreITfigVZKATzfSFkp86VjAOGLJ0G7ImT
         7h9s3klYwglYfY8FfqPth/yOKZvLeGNDU1CLFitjtawCWpncXjrtdDs85ZZCSIIPoQWs
         wakTxbi2IYTzqDI8ng9iRiil1ZLISTq85H0I+EJv6NPZgPeq/b1/djgEYNFSuLh2dO+L
         yYhg==
X-Gm-Message-State: AC+VfDxK63TPzeS4rvO1ZSMrHMPDR+cfk/O+gCDthYDRoONGz/QE6FFy
	amXVrDESqrMshqjxfLF2xFM=
X-Google-Smtp-Source: ACHHUZ6EeL6gq5EtG9xZeYtWyzA5dejfnqdUzMMQGBUc9q9SgKVmMs87uSMG5uyXDkN0xF6o5D4hEg==
X-Received: by 2002:a05:600c:b54:b0:3f9:846:d892 with SMTP id k20-20020a05600c0b5400b003f90846d892mr1874404wmr.9.1688126720584;
        Fri, 30 Jun 2023 05:05:20 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:dbbb:7082:18ec:f407])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003fb40f5f553sm11766912wmr.31.2023.06.30.05.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 05:05:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 4/4] riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
Date: Fri, 30 Jun 2023 13:04:33 +0100
Message-Id: <20230630120433.49529-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_050521_947917_D5B8A22C 
X-CRM114-Status: UNSURE (   9.17  )
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
index b0796015e36b..e68a91c9fe77 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -42,6 +42,10 @@ cpu0_intc: interrupt-controller {
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
