Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939E5CAC587
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGXRRNjMZsSJdBGQlbIG66fP5dxjfQBETzO/evj+O+4=; b=GrgbxtOgH4feTQ
	vA83QWNSYTUnIDUHqelXas2fC39LNm/AnbUaEmzLFSm32EqhSUpzQN9dGLVx7CFzDJIrXxLwWZXKB
	5lPKZQuzgoqF6xVeB8dWXAFuo6YSJgtRl3Yegbgm9Rmm9fin8EAGCzSnNnS7W3807Z0dDFkpUSB/n
	iUKsYaU8nW8cWD1AAUY5qAwTvlid4oVBbOi+nxygzCFyXEZQLam5i5Bsa/wa5BBi7azyguXUgn6Ct
	Mk6A3cvxZJQreSk9kDeHMtSfBK42pR5PUJ4cLJuED17jI+Mnmch5y46ben6oJkQKON4j4yq4Z/fhx
	6KCegBKRVdjgOQgvDR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtfZ-00000006YTB-0p1l;
	Fri, 12 Sep 2025 02:37:49 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtfX-00000006YRo-0FUu
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:37:48 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-74526ca7d64so1409963a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644666; x=1758249466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=cQCy45C3tR4DCmjVfHLyvn8gbzOIdLOiSYL4ZgWp6hhK2cL+NgXKZ5eF/Zy27I4N/O
         8Dotv+6WF+f/002tFu+CedjyYTp01n3+/YfxmWfUvhtQ4oAkpj19dxocwxpi7bs3CzXY
         VFzjWymrlVFJafGstr5g1q9u5wORmNGtWkbfr+22a55Hm6N4AvIjDSPXKj0fcWwIDNRF
         5AbRDPqltimC6FE6+Pb2g5ZX87MjodgP/VUUeDSERyisgvoOhmrq4XjbdU4/TYJAJeei
         fkK0Bm/lh8f8PD8cXf+Rj9byHgzN6AhZgYf3pAhN+IJ41MxoRvlibbtlHKWvHSn4q9EN
         QXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644666; x=1758249466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=UbLqMfW9S/ZUvCZUMUpW3urXHsG5ze2ijgQ+JIKVvbi57Vg33KpG8WH9cw9syAyV+o
         sgQOnwC3Zsak+0Ehr2NYdqHcjloMA+TkEfdzPTA/zJJ5zh/rdYaEuGJCsznzZ5CZ4cIA
         sRyziFAm7nZU6M35L7KB/gCCp2GBF/wd9vaHKamTlQL3QUcJmlFzN94bd4XuDI9cKN7M
         uSvf6S/vrrjubUXlX5b9JW8WGuALr0FnKc0nW5Tlmz3L8PkGR1glc1dAMrOCmUQi/56v
         C+cBDGxC4/UMPAsdI9n2SsKclq8e8xjkeZn56xuMtTFooBXnEUkOp+Vd0Ai6xzPYAvlK
         glwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQEl4H60vhXKshP4gP9BlrEV5xk8FFZBJ+TDlQsG1WAlCBaF6K3/3EOXLoZpH5M5IuqyZp0mAWMYtatw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxVuRQnXBTGD/umXoamIUIxUgx+r2Ivqom5Ewo7erAbIjgjaxK
	0BPIOI9ntW6XTEiGIjOhidLUsaEUalF7jM/1CQRI7iUXgfdHcOEfbpta
X-Gm-Gg: ASbGncvfjCTfdsnnHgnJl83NN6jRHFNdAAJuwxXnCjZdZTyeNgdOkmwWeIgZu60zxvk
	REEClduqF2iF+ggyw+LkSGc0D2ZelIMv4jAuW9bmYT7SqdFcUAxk+29k85p7Mn0A3XO54jMEg7t
	dNd5uijkV+WbZ35X1de7VvHQgCpecFfJs0Wi+gruWU0k7vBCqT3XfrgNTda++HOzXMzk+ip2lbP
	fp+JBGipDND79CMF8iTf1nWc5AmVVcbVtbHva3WBnZvncPsGkbcW50iYkrfUSBWghKVeOcpDF0t
	jmtKm38wGbXUwoxyPQwrgqWgo2qvhxUHSWVA75EDPuhlkqv7Vix14EWps8XddBag0HT8tdQsfa/
	w3i6C8v4CpCD12JpqIYZ9LnY0uKrwcjfpOUp110mozRk=
X-Google-Smtp-Source: AGHT+IG0TQa2WVbWUOjIbbfIZ5nePfOY9XArUERpTrkKtked//q7vNW0k55MNp1jMcZH67KflOuh+Q==
X-Received: by 2002:a05:6808:4f24:b0:439:b198:23ab with SMTP id 5614622812f47-43b8d8cff2cmr506892b6e.18.1757644666012;
        Thu, 11 Sep 2025 19:37:46 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82a7264asm586173b6e.21.2025.09.11.19.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:37:44 -0700 (PDT)
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
Subject: [PATCH v3 6/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
Date: Fri, 12 Sep 2025 10:37:35 +0800
Message-Id: <76d4012e515dc3c3d4e406a237eadc55203f77b6.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193747_100344_D9802FAF 
X-CRM114-Status: UNSURE (   8.02  )
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

Enable PCIe controllers for Sophgo SG2042_EVB_V1.X board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c6..a186d036cf36 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -164,6 +164,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
