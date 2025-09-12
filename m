Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5829CAC587
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PY4JrwDTDHrVX3ywWguN2+S8pZXCnyOlCMCIPg1SjUc=; b=Wr7DDMxkbJrOxQ
	xrfzpZemb+HT6cqlDnxyj9aDLwDfWZpv5QRNeqkvZTXMYW+yZgY5OVLGqpebhve79p+MTXrdSebNR
	yRWXFpT/6im019wW7+QYlsnkitxxW54WoFhvZMiMhu0RV2LG1l3SJc8xYTLVsuJjQ4rFOsYCAPf/v
	SHM1k6iV5wv9ZwV9eSIcZ1onFkFR2Iil8c34YgjFIs/zc2sswngfZg3bci2bsnDVokVDn/JKgw9yz
	anFabnjm1o3aKOvSpA07QSH3LduXwdHSeu0SD/XR0RhrraWcI172UaBDU0xJT6izevH3N+2fHtrWt
	YlApInJrZ4uiX2QYEoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtfB-00000006YEf-3fKP;
	Fri, 12 Sep 2025 02:37:25 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtf9-00000006YDH-2iIg
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:37:24 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-31d6e39817fso1893444fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644642; x=1758249442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=ISYfb+890wtODWv36xPKBaKksC2NAramVN3biDlzCWzRgxkNAp+nRMdoXXz7lFXcJE
         FjHYZDPryuR60mjDSIB7SQM1XRujRdHYOMU+iG21O6fEWqAEdFqvowvO3UcZaPSKgjV+
         KnY4cy2iFkjBqGWcEatSwu5K/D9QpKwsWk7HYStfwNl9bISUcAq6N0gOXy69VHY+Zner
         mytWYLzisbdvUXVVj/CAKLkU+2O+S/ClWvgSifltG64x3ogHNYKeBwzHMZApNu/Rvj/V
         55Go/R0b0w7g7u7NTYxU/rpCeHv4jZR2dJTiiPNfGj674tf72BzgZpykkdYXhPkko/9s
         lXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644642; x=1758249442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=ootpGIFuSbQtxP8L2xVVQTFkvIk4jBRJ0+NeIdByHAYYSftNL0jEoU2xkqH/Y8NIVY
         fIRkUPNxV/9MGLP1kdKhnkOu2tUT6i6NtcCIYS/oibbUioCtld/Uxdsxs9ewv+4qGxJk
         yk4A26yz7hgQowuUmg75797fbC/VeEPAuilwUr9+4mgUw21//qDOhI/Zniad/5F6OiFl
         31pxWWaMRc33f2v4ThNlfHdxCjHfiKWwGyIaQG/JTVKzCh86bfTF2aGLBhTQoouSfYof
         7ZsuDQmMnV0T62DN4njeLZZAwfk0WiGZBMa43n6XRttC7/L2pHfd/d1V4iWiZCGi76dz
         uSgg==
X-Forwarded-Encrypted: i=1; AJvYcCU/BkGgnV4MsQJzpaVkGpuM6BezXVOB3x6kreJYcW+JBBLpKbpqGmZrI4EdsLrlOAHuMM6lbGbcOA5j0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxoOHvRZLOhNI2jfAORKG9mhP9oomOuarz7LumUCa0J6vhpG0U
	3H0atnrZXahrswdCZjp8UQHc9IOkbPr49IZhZ6yQBm3SMmfX56sdiHM7
X-Gm-Gg: ASbGncs+qa9hlLljIuG7sKK5XQcj5Eqb2V77eu8awAh4gAReFSYY1pz3nfz8uZMziwG
	w2ElEiJdS+gur0IJ+TZhSCoUaQyfGp4RQbSnFZiq1PCjGKlLt9m2iDL5YAFKZoUmg0sgWnkjR6F
	6gu2RvWbYx5UuRdhCEGtB4woLdsS14HM1/yFq7lwP27VZdiyJ3xtGPtTw+r5hVO+HAZrSQnfofY
	gefbODGWk3drB60T/HOcTI9AMGNbzn87tQCocmYLh3i+F5fcDYPLjahfSuuOC8qR/hNxlbAta8J
	F+pCFDgaxL2SqEFTeWxQoAp88Uh48cDL3iY+IAsIuS9S6r6cXdQcFqb2ka5NnrsIF1AC6Ioc0+L
	sxGXHR5iJffySZUJM5QJgtlFqTSh2DtA6GXm7JUeqasY=
X-Google-Smtp-Source: AGHT+IFJlDg83j9kDJr9JJPfps+eRdqlRn3OyrAApBvHJZ97334vhQbAuQiDLCanW42L2b91pkrT9A==
X-Received: by 2002:a05:6808:6552:20b0:43b:6639:7307 with SMTP id 5614622812f47-43b8da12395mr687917b6e.23.1757644642421;
        Thu, 11 Sep 2025 19:37:22 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b828d2ee3sm565466b6e.5.2025.09.11.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:37:21 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 5/7] riscv: sophgo: dts: enable PCIe for PioneerBox
Date: Fri, 12 Sep 2025 10:37:13 +0800
Message-Id: <a499a1c17f317ea57de8769032ec65e1e18b4b36.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193723_694470_3087B2FA 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1..c4d5f8d7d4ad 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -128,6 +128,18 @@ uart0-rx-pins {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
+&pcie_rc3 {
+	status = "okay";
+};
+
 &sd {
 	pinctrl-0 = <&sd_cfg>;
 	pinctrl-names = "default";
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
