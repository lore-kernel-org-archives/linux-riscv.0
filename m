Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F58C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jpjv2wH2yKs/HjOPIU0drZaE8XK0SJIAcqK2faK2VaY=; b=dKTMVlnXpvXNla
	+ZoVAM7s9QDc93ct7FqGIXAe7ly8vbOzv40plpIYmw0wz2sT92Yc1RYJkdMhZ1xJGSVwGkLjEBnqi
	tNr/HCc67Cl3wlQ1dv4GVQvgH5VhTvgdaqHaUbOJOrlvF4K4pJOMqcOvKFtPTDG4eeZ1/AU0G4WER
	FeytuIWXmtmb0CqEQCNURoQofZmygXtZVFYPl9JhEZIP/3KBvsJ3g6kxJk2NU6sv3SIvq2Yvam3lt
	dKNMlBYuCAENsV363zuYHpOqSwhbwWQbmOFaC4DLN1os+mTu4SYuAeLhy4J2AGV/wuqfKRKfFko1C
	oX4ht2sZNR04GQhPgJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUS7o-0000000Cy22-2GWm;
	Mon, 29 Jan 2024 13:56:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUS7j-0000000Cxy7-3T76
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 13:56:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33ae3cc8a6aso1439271f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 05:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706536588; x=1707141388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WclvSvESBcB1ccyxeqjrdGj+frspJc0esD0QtgwrkCo=;
        b=Y5a7zl4L3Wa3yJKYP+JK0AHLuwJGNYgOMNQtCSw1CduQ8Vw6B9XUYaDOP9AxX0fOL5
         lXuntrAKm4PVTK+dABudB286pcxitXSCXum6vvnL0QsTb73Xn1fGHU6R6PiJhoxhRTW+
         1nS3+Q4qVunMm8QbLHxmv7bqH13HnYH3uvG9avMlUmyyndpq6EAEmLGPBUcOqFbBsX6/
         62CfWG/nSy/AM/Di5Zgxf08AliZeIYq/8KejRbyjvQjxa9QPMJKyN2dWkHVt3VX4+Vla
         deG6P0kE0dPFWDWOR5jvs3ZQa7fyFiYgeFFvDd8zMxDCRKAYUvK0kxFDt6R0Yp78xmK3
         vgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706536588; x=1707141388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WclvSvESBcB1ccyxeqjrdGj+frspJc0esD0QtgwrkCo=;
        b=hTLGSflwT31hVkCSXtRZoV/oYZQmVYbBfDiYwS3LQxyPwFgxSJRu3N3U3mUqFyeDAZ
         NGpHlyseB0AVtCu4MRoXZkChmI8I4IS7/ISvI4qWGAG+Q5okYdBaf5zng9WfOjvb6ebZ
         rWMf08lDTbWqt8kbJUWHfu0Wa9Zih8gyeY1GGVKTePVbVUqvlEckBDtk1RrrOZvpRJMk
         mU6+RCknvxF0cb7yFhXlkaUkdd9jMiboEhEkZnCuIWxMpGL5AdBDlwToER1pqFHix5Sp
         2GVwXVY6CN4r7lkgGr+4X2gMJN0onPcYfeBdIP4SVO+jfaWIvdPBQAEEvExSMc+SlJAv
         /B5w==
X-Gm-Message-State: AOJu0YyrHlJ1XZOR1GERaV38ME7SYI2r2iYK+YQzqoYqbdtEVyU0vlsB
	ZQJ0+58PwhQvPv1YyX+GTC49flCJCxaV3zzwphzL7eVFOMWcfEw+
X-Google-Smtp-Source: AGHT+IE/VmvDYsDUatlkAcbfvFN0EbwPx+JdGJuMYr0hmxp2wA6wVVhbilb4HSjUJXPxhVsTUXxUyA==
X-Received: by 2002:a5d:6da3:0:b0:33a:ed3b:3739 with SMTP id u3-20020a5d6da3000000b0033aed3b3739mr2973996wrs.30.1706536588205;
        Mon, 29 Jan 2024 05:56:28 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id bh5-20020a05600005c500b0033aed46956csm3058057wrb.80.2024.01.29.05.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:56:27 -0800 (PST)
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
Subject: [PATCH v6 4/4] riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
Date: Mon, 29 Jan 2024 13:55:56 +0000
Message-Id: <20240129135556.63466-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_055631_953950_A7C6A00D 
X-CRM114-Status: UNSURE (   8.57  )
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
