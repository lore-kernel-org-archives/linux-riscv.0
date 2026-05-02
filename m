Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D3CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 05:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhOCatsbv/42r4G5B8MshN7AByrz+xgD0XLVaMWTKRo=; b=g9KTjaHaXRe8nB
	YOy6BcuTUy0QKeUIPFXGUBbu6h7xpUtkELSxPurykDLzT74utighzoh8lxmrez1hI/qiOe3ihdpMP
	LIGow3Ud+nzCKYtDEEIuqFMyaqIO7/DHmQ6KvyD4rr4VzYIVk/Xk+do31QaffRn9r4I87fFBN0W6e
	YcxGZGOR6rQkG3/sU8xq5CsHrcuSwwiftn2pVSPI8AmWr6cdtpIkCEUZZBAyMnO6vO6ykgHUIWV//
	+lZsgX0+HuOkcMwMLurt6SCmaRbCWWtECF+BcPHk+hzLgpN5hzzLNT9Qfm0/4hV8pdPlYHBFZdhuP
	XKUFtY5zTGhga1zUk9Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2lE-00000008KoK-143H;
	Sat, 02 May 2026 05:19:28 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2lC-00000008Knh-0ULk
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 05:19:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82f68b3aaf7so1071896b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699165; x=1778303965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yn4Ikrliqtn1tmBnkwrqopx2vI+LbVSo/RlQYheF60=;
        b=pjZJ/klmqZgwYJbzGu93jrnLTpEVne4ohS5fq6HriRwJhCsW4ddFUO/TurYxv4UnK4
         H22T/DPiFGbTwDLLyI69YMP2Un8FR9dqCCz0dBIMukXfuu/379Gv1gydCrfo4nj5UkNL
         +Ehkp0NuvLNdh2JbkWyQ8cyi5V6Myn+J1Aj1L/eyYBb2oBtt26qdFMAN+X03bciGN11D
         CpncpBcJkqEBTP2yTciuoVUb5TV3xcWMj6j+VBrzih8m4rskshPHp+CLK0b7wBIzb97O
         fjAP8gmi2LOtUjV6Hw4k1kSSlTfIaIDW6RuBsgPTziT56PVT7arQ5SGfWdKin4OpwpUx
         R2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699165; x=1778303965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2yn4Ikrliqtn1tmBnkwrqopx2vI+LbVSo/RlQYheF60=;
        b=a1dDk6olrmakjNpXImgN+bC4N2UHB0sjHeeEIikwhQKO9nCu7X7eQ2P034IkDu+xU4
         zod0Tvn6J7LnY3Gd0KsSGod/5b6Dztr/KYnMEmsAL1AVbxOcmTy732XD+AFHfCfu3rzy
         Evskz/QWAnB+xCvUutynTbNxux7BnXsfaUfDCco9PiD3qmVY9mKrc6LKBOnFkaYtkK71
         N0MON+JGsgAxGI7ei+VrNpAhUKmUHE3oFI1+jutz7By5c0ssA22ZvZmusjYJ8OeGQmA8
         7AupcG2BlhDkJCpiSsFKfQ9VzFyek1Z13nU094rLpAIl4GbSZ/o7ylUDwY6W8h00bB0y
         FeTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8T2PL/xO+3QKMZx9hyHXyKzR/Qwop5AHbWMIvCw6zjMie8n3owPv0VsntMD02oz2eddFTE/U/GMmqH/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy39eihA7q4ra0lBDaPAdkXkjaUHAFiKqjubFoxkkHavYs3zStf
	Fe1SBE9BJz6tQ5vQ2EHx9DYXcJey3yQ8c+Vpr5GM6PPnhWTV0xecri/u
X-Gm-Gg: AeBDievED0tdUtUjHvWx4Ns1wy1F8xmqpm92BFEIfrZQDmHAzPi+QmMzaRn+ftNjWlj
	KlqPl76RRd1TDCktzii+I+K9qyTRYZsP2TVoOR5jcBCZQU1Jp8XA6HksAo32vZgSiwHTCUiAwIB
	OxkZLAW5R5+R4/mBt/Gxwaz8lq6Wd04PF5vUgIdhweOwT2CpnbNMtX5TCB4NmdGJPTpAnVM3irQ
	bY0de4v0hslag1gV6sOrAtYrAB3ykbP8QG6Ro9+3Dx9JsQxCM1VX0OAlZ7ZlB21cyckn2lby5E8
	cD+Lru7LfTqPWH8JmwbsMKiI4a9H0oWONWH7I81PpCfxOEjVLgKtiAPEJ7vBKY+hKynn0ZKI7zN
	NtQ4Fmy29FVURV6OXF/JoPJVSicpZmru4TwaSvNMtNI9MPjJMS/ay8F3d+U3pBRMR7PBMTWM+P2
	H6d5RPm0ysWcO46pDdgEub7xu4HBpmHw==
X-Received: by 2002:a05:6a00:b610:b0:82a:ea3:c172 with SMTP id d2e1a72fcca58-8352d3283d7mr1705636b3a.46.1777699165158;
        Fri, 01 May 2026 22:19:25 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:24 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for Banana Pi F3
Date: Sat,  2 May 2026 10:48:54 +0530
Message-ID: <20260502051906.8160-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_221926_157960_AED59479 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: Han Gao <gaohan@iscas.ac.cn>, Chukun Pan <amadeus@jmu.edu.cn>, Ze Huang <huang.ze@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
DC input. As per the schematics, vcc5v0_sys is the input power source
for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
to correctly reference vcc5v0_sys as their parent (vin-supply).

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..9727ecdd9f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
 		regulator-always-on;
 	};
 
+	reg_vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	reg_vcc_4v: regulator-vcc-4v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_4v";
@@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
@@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
 		regulator-name = "USB30_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
