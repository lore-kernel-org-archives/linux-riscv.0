Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83DEC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbpVUnZsmSYlGbTcEWMSZ636GNDAyvweks45iCA7Zgg=; b=z6se/zeG+rkmA6
	VRwTOAYyxkfCTBTz40WaSiMLWICFKVqsq7guhHj/YJQWPP0m6JRePI6KS5Lkg+nRMw7K3aHcfmD59
	pUyzBBi8Fvf0oG2L3xAiBwgGPbarYpjCNicl+/T6suid6tikDswI0ljrAvhS754/1ndQjYS+U9lXp
	+8W9LhjLCm6D0+LZuqfJ6lJVCXOJ+Xmfku76Mu7BPWvho8MxkDAd924Rd9/En6YdXDKax+tIOKSrA
	CM/DFDB4kOqqGs9mmDKl+gJ0SKzMv5ErEvFSRlIsDTVO/eAZ1YqTIWtURu6KC+TkJeNArEmlzyhKx
	mYLGlgerZKfBgGe0Pkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LV-003aEv-00;
	Fri, 15 Dec 2023 14:39:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LR-003aCO-0d
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 14:39:18 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 645F53F2CC
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651154;
	bh=RobAsopvkyaJG4ZlGH6Q+ihyPFqhE+HxeBCHD/K5fRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=JveIQFn2hQtiyEGthTh3fz27PLBh02oceELhU88h2YjgRTXCJYOY0JUZ+vYeU3i3W
	 d8ToUf4a3ADU9cvRYxnL7sp7OnVFU+kdzfBlHhAXj/cLKY+DhCgEklXlR5MiWV1IQG
	 K4OTjk1gGeDQNunql/fABmy0Pt9168sPtJz8DnDnLSium2duC9Ysvaz62cTPyo3uNw
	 qRoCmrbIQLAeRFfO0WNhWAZVi7u1RsihmSVxcBNt8p4vCHJilN+ACd0DdzB/LUd/GQ
	 6wBgNRZ090lYheME1O2MGw6c089o0Cz3wcVzR3C5k9dcd26eJTENBpHPvZFZLb4Kwe
	 ywC/z0ICQJ51Q==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a1d0182f0e5so29055966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 06:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651153; x=1703255953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RobAsopvkyaJG4ZlGH6Q+ihyPFqhE+HxeBCHD/K5fRk=;
        b=PB3i1k9iKbygB8DdjzGFA2Hlt9Giy5VgaC0o7eQdOSmD2x7jqk7uhgIBALcQQg6D1H
         p407ao1x/6esUcnOjqBuRmkM9ywH8X36wVh3ZlioJnwshnoigxiGIoY3lmpgqw2vY6tI
         sFANA6fvzCOZWD+FyCz/u0VzhvhNHglwzi7XGQpk3UzDsifrPfiVFYTfOTDJDY5sCqNU
         xihYBmroLs4EhlA3sGeMiekQUUNW4OssuA3odiPT9APa8m4k+jdpRYvift26P42GdBiJ
         lo+l+e1Qwd1DTNf06HqdrKiAdoJs0vXiVK73HApvDBwpWqwVshuPhjzFBMAcYIzoGjPs
         W17Q==
X-Gm-Message-State: AOJu0YzULv1TKMAQ8iPkKoBUHjUL75S1pZ+ZXILg3emFwPD3KZ1eb34R
	Yw3Fex7vNDzH/ve3MyCHk2yF5jZhJU8EkqgPmV6gqEaRXHcuoqTBJjbenZzqd5oFUR8Q+9F9fAV
	MpRypqFCIlisCU+EywBrhgchrj1MOhlStAznSgx1a4vzpjg==
X-Received: by 2002:a17:907:9714:b0:a04:bc39:c1c7 with SMTP id jg20-20020a170907971400b00a04bc39c1c7mr8341366ejc.36.1702651153752;
        Fri, 15 Dec 2023 06:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMJ/XNk1OcnlxBlTONG8qxR+NbDMfjb9FP+RE/bMN9YTONgYiMhiDoaYwky2i3vk37hslVhA==
X-Received: by 2002:a17:907:9714:b0:a04:bc39:c1c7 with SMTP id jg20-20020a170907971400b00a04bc39c1c7mr8341347ejc.36.1702651153594;
        Fri, 15 Dec 2023 06:39:13 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:13 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Date: Fri, 15 Dec 2023 15:39:01 +0100
Message-Id: <20231215143906.3651122-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_063917_364398_5DBAD9C8 
X-CRM114-Status: UNSURE (   9.55  )
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

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ba4d2c673ac8..397d5c71bd3d 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -242,6 +242,11 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-group2-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -278,6 +283,11 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-group3-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -414,6 +424,11 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-group1-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
