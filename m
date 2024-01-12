Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D91C47DA2
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jpjv2wH2yKs/HjOPIU0drZaE8XK0SJIAcqK2faK2VaY=; b=ScmuYb9BMK1aJj
	hqaRZTH84lTzz4Mt5IpsXNWZmhcoqHAs2tPHNokFtRYtNxGbeuNROuVuCWGXzQj5npipgJIPozhYp
	7O36RNNNlQiz3zGKnQ9wjK+mc26J2a7OajCE3kcDZXdIw0GWgg/quCRiBC9HAzkSrLcMy0syPW/uz
	Ztps3/LYRaKe+2vB3jpkQ4U2oUCSqiBuBnz4zEekSuPYUmWHjGY/bbA7yl0h/1oF7RoDe8xWyGNQ5
	ginfOUE5W4Huh6NfYmZr7XNJ7mmydQUpphwojN3x1XXhepyo/nZjPz4DVxw8d1f/3qqJ2cjnUDYwl
	N7WFfUujaKTsmPp2HzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUZ-0031z0-0R;
	Fri, 12 Jan 2024 14:26:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUT-0031wE-2i
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 14:26:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33770772136so3226678f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705069591; x=1705674391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WclvSvESBcB1ccyxeqjrdGj+frspJc0esD0QtgwrkCo=;
        b=VrmQc9mk3BZjbFv8Yo/Y7sOPHepmfya6A7o7PNbdmipzMpJfk2tn78nKvz1IcN6cle
         ISY/Pz/oSdm6l4GEj7PM/5voLJwXUuuxGlaiuaDI3DfW2LW2x/QLgxMmo3PTWSd8Bioo
         eeIY97pTIojgcKDFfh9y1SjPWok0VQGSM0dNfeKghL38ROCCFkbzirronJSdZRuRppk6
         zSP7nfTIB9OMMdkXNGFoT1hcA3O1EL5WV1HG6NCQzbL+HuwLWHGWYwvZd8h8PHoFXw3x
         U3MsgyAtLlOBJ+VdppmRJVfr2cfLP5jeYiYkwByFiJPFWbEoud2+O+V9vRPVmxgcTxrG
         bxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069591; x=1705674391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WclvSvESBcB1ccyxeqjrdGj+frspJc0esD0QtgwrkCo=;
        b=U1i1Y6BWGHfAuW+nodlje+4ZqQFbz5HAUHmk0SIfQE6S6KKrXW3/owNV/IKbStJFUr
         DaWXPyQwDjWBzIBJ3O3soBbyqKEe6JaMc4+5sARN45UKkmvfcWQA5BNnVqqQDgWHGOwH
         Tck3oM+2aoqRcwPs9szFXSzvfqenx3oO5cKHCFi1+IbzMZyuOs2GSnUUZFiUiFPpSP0s
         O5va1QjWykV784lY0FllW2ATUiGS83Y7S8qSjx4wkC5OYf8knwC92H6kGd4I61ltvlee
         zw7fx5YLOnogZS4vY4/LFvOytwwtQGDFHsUzYBWHhZs9Ug0dsdFOmGB3Iu8Nm6a3Rpgo
         S/Aw==
X-Gm-Message-State: AOJu0YzE7DerN4KCj2bARBHbbJwTrrSMayrh7bXgY2NNlVlJy6IIP0+T
	fU0yoTGifsZX+pD8Fz151Xo=
X-Google-Smtp-Source: AGHT+IHVtC639FZXHSGXUI4wjXAd7RHB12n7+GICuZHzambNk3DzkW0+DuDqNWSh+t2v9ArOYbiv9A==
X-Received: by 2002:adf:fa51:0:b0:336:c3c7:75e8 with SMTP id y17-20020adffa51000000b00336c3c775e8mr697221wrr.45.1705069591670;
        Fri, 12 Jan 2024 06:26:31 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:494d:c489:3d96:1b15])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d4dc6000000b00336a2566aa2sm4021219wru.61.2024.01.12.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:26:31 -0800 (PST)
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
Subject: [PATCH v4 4/4] riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
Date: Fri, 12 Jan 2024 14:26:21 +0000
Message-Id: <20240112142621.13525-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_062633_892675_E8691530 
X-CRM114-Status: UNSURE (   8.60  )
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
