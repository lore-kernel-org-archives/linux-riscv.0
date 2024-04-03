Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F578CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 20:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMT/CqGlgbtayLmRiXOsiE2NJ5LfjD4sFtoXZtu+5vY=; b=W7hviEpnkqP+f+
	z0LXh2TuXzharKnyiZe1Mj13jIZCbEdpsE/aaRGANjvsAOwg9DieCeVOoaXmw8d88ZxjG1EAdmh8V
	RAdXKXJtr5qsNE77dqnPsZhjmL0R5CEMYl2kaUTz86rFTCVD1bqRIklLLqBKvJ025wjVWwIhtNTFk
	rcxfXWK8cfxDjNa/XRNb5dihLgOaYjtXoJorpLabstm1voKMaZ1u15YjyRbJ2ES84+sy+h0IIhfc4
	YasDeTed62orUbPgZXyzIrRCM36xmliTNHLmhZRoRnMYF2xV6dp5bjCoihzVeQwfbt2GC6KoQJ9nZ
	cSVJ5PwBHzbs7LrrUEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Lg-000000006u3-15dQ;
	Wed, 03 Apr 2024 20:36:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Lc-000000006rH-149Q
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 20:36:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4162a3e2d9eso299625e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712176598; x=1712781398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/LXAek9DTip2Fdt/jPhnz1YflAKKdWZVYvtfB/2Zns=;
        b=XuExxWJ7FvuHCSeINfRO+egOyNAB2CjipTtDo5UZK+P4qMG4ZJokA910rDm4WeMO6k
         QRykFxDzyzBtzpmUPTnomsUxuNDwOZQr3ChJf8GC7+1AeT5UIhrHIMrTj8BZGkWiXlq+
         Nw/FzVbIrHsnhfj4y2JeV7hLGhWqq8pGsgu3+N7+wa4nvsc/PB9LX069ye/AXddTaS+u
         RMLsXzEpgFdAL5vzx292DXOVZgPPXbxaLqL2uIs+uqdK18sxL83fimdIOLIZZDkZzp88
         T1mB+CdCMKcoZGmegNPwmbvEgaha4dG4ZHhTNQgJLDySSbwkr8613BPI3ig0Uw85iJd3
         0deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712176598; x=1712781398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/LXAek9DTip2Fdt/jPhnz1YflAKKdWZVYvtfB/2Zns=;
        b=n/q5S3KUnVOStovM4HZb3CctMLVjRF/1mtrA88Ba90bCMTZNeoLJUR7zr4L68fNpWb
         OJSu978Pd9OUeSAEr1/ab0GsUjKz5jTNuGOOG0f66wCO2lIWXTXQbbF6G42b7164bBXG
         OaQhEe0mrXvOWeN/pSYcIOdRZbUrMitwvlikzrvjGpZzr1QQOoZV48mlm0IPRMsfsset
         ZRW6vLAYyiOQaHS1ablFSG/V8RLTVhrC6I/2DeUCc4J+RKx5jV2zTkoCoHzHq0egk9IZ
         CFjUNDcYL5t7NhYfYW8Tm3b7zKwWOPFQHOz7z2M+hqb7wWlIo4kbm5plkzwlXtXX4fTe
         icWw==
X-Forwarded-Encrypted: i=1; AJvYcCXUwjaJmbh77zoe3J5qEa4t9/a7iVChyn2iFt8PgZI6w9V2OUb6YYdzR8GO0tQSlDDgvU/HVumyuq8KeBOvk7i4kypqKQ4mMKZ51Jf/h6ES
X-Gm-Message-State: AOJu0Yxg1LE4drHBDvNqTc8S7t/KfJsEEzqRjsmMjTX+7SXndv/wzQGV
	3e2wFcZFbUPIjTX5rzfm24xmt+NNwQmTtgT/SnpsExqpGOLG9/5p
X-Google-Smtp-Source: AGHT+IGyJCnA6zLH2lUVZ2qdR5AHvakpNrLQ0l/p+xtJ4HL1Pvgl52IInn/oXMhJtKGphOIkGjoIVQ==
X-Received: by 2002:a05:600c:d1:b0:414:9072:98dc with SMTP id u17-20020a05600c00d100b00414907298dcmr658973wmm.41.1712176598262;
        Wed, 03 Apr 2024 13:36:38 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5eb:3d93:f2b6:25e8])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c468400b00415f496b9b7sm244910wmo.39.2024.04.03.13.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:36:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/5] arm64: dts: renesas: r9a07g043: Move interrupt-parent property to common DTSI
Date: Wed,  3 Apr 2024 21:35:02 +0100
Message-Id: <20240403203503.634465-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_133640_318073_538BDDA9 
X-CRM114-Status: GOOD (  10.79  )
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

Now that we have added support for IRQC to both RZ/Five and RZ/G2UL SoCs
we can move the interrupt-parent for pinctrl node back to the common
shared r9a07g043.dtsi file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Included RB tag from Geert
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 766c54b91acc..6212ee550f33 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -598,6 +598,7 @@ pinctrl: pinctrl@11030000 {
 			gpio-ranges = <&pinctrl 0 0 152>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			interrupt-parent = <&irqc>;
 			clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G043_GPIO_RSTN>,
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 964b0a475eee..165bfcfef3bc 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -54,10 +54,6 @@ timer {
 	};
 };
 
-&pinctrl {
-	interrupt-parent = <&irqc>;
-};
-
 &soc {
 	interrupt-parent = <&gic>;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
