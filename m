Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2666DCA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrZiqniSBX6i9tfNIvLXuehiuTSRkMInVixKEzOB0B0=; b=3Vf/jvGGM9bDdz
	HchEgDlwHE2MH2IsUyaMxrj+Gp9aSLXDUs0ho5a2G4X74CDXTXgLX/Pc8P5AnCaYpYayKtTZpP/Ur
	hY93uAiVD0AraXovx68V+xi8eTNk5P/lI+RR9t/dSyRDsu+P8c8jNOt0ef9AsNMe3AWuuU6UZW9xZ
	kWMABO5aBVFDZYIYy3l9yX9fMarATrKjYw73MJNjJ/szM0QvxJE/tpOcqPnMkEGY/57a+3FfQufdw
	PiXZW8QLQ+qUozmC437rIklG9152t57r2HebEsR07hftfZQk1xZvGxzRWZHDW3tNWWZC7TlazytVX
	U8ZV15r50uzo77FEK7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLz-00000002oF0-16N2;
	Tue, 29 Sep 2026 08:38:23 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLu-00000002oBJ-3pwU
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:38:20 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398cb5615deso3164115a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671098; x=1791275898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=rOp9NIDsuVLk7jvd3+eIP4/wCANdutjm1e7ENJux1NgVy53l0igrvftyTJvFEmYfkv
         G2XYIU+2VkQS8PtOJJ8QsRgr5lkjdZcDbOHJ1pDpSghX2QedqODXlRoKHBm+0kRfbqvV
         onJjmDhRZ7MOTYCXAmW6dudMML6EnXXdE6l/BzNQBw+4qsflc9TwNqOnWecWy3myAyam
         DDOf61UfiTJgwX9pugrNbZMFKf+0igT1e18q4U/yX8nay9wy6zdoEs1E8LGC1L7k4m/V
         IsehwWUjQAbAQ/wQGGj4Zh5oPx4uxy/RK8Y+r93jdq5OOD52WB14PT38NsMN2Acl8WoO
         BUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671098; x=1791275898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=ZomOABQi6L+XPMDuB3EA7r0clkbZbk0TLx5pQoheljnhqQm6ofBSa+TF/Bhn+wT3VR
         kuFYX03oFNcBQ9bnX/+p+DpE6mF2J+Q7tQaqx8wbPrI64fca79TihLRIvQEw1yRTeMdG
         GC8bXyFU2YpGXrOkuMqTfhTrX4q1qLsWaNYItQz4x5nOdjS0bsi8C5nAzNqLqSYucM5o
         /pVgB7Rv1on1v8IIGBwxnB0T0p3ee2C9mrC4Oc2SKNj0HmtETn5xvgtxTTMwr1kWwqKb
         gNlY+s+AD7NSYzwPLR59WkkYMalXOt54g3bI/DUUVqTBqfa27c3exqzo4tCBlCImsYNg
         TSqw==
X-Forwarded-Encrypted: i=1; AKwUvBy49IrDlMwjx2dQtuuMsh07NmBG3ZcXCqHzIRuEaRx2rsv9bbWdfXzw2jevhQKrbUx0kvr8vf+/MKmCHQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLpYh2aCTA7nOlc3jvfus8hATrpwiEOAb+4SncLV5IguyfQw44r
	mhVYkAX8R3k9pXaJ9mNI0rAj3zDYwle7ttGUqY2qLdHeNvCkCXSvi7jh
X-Gm-Gg: AYBFou2Z+XXARqOMa+LUzktHcXyqrtxE/hbYUvmvnhG3GIWQof6szVOQG4BlCAsf0bB
	j/XABZZAnqjYFoSojmJgbaeW0K4Ytk3itc382z7CDGIDu1dPRj3kYXyh8eRuYYIynzSci00/oJY
	cTBxKr556JIJKrBRM+pwDlx+JbogCNHF3S3SzT36OLBId+gQp7gcTsipzoTSG+Hf1QNp74WSPmm
	yR3DOfOz5VkuZR/Y5OdCzYXaham1d0kOcZBMnosxUsfdiuSMp4a8s5RnxuoUBq7Dip5CTyPJa0b
	ztYj+0SSQ27GNJc5CwNtm2+An7zfwyQIYZnTu0l7WakN1zGm8rI31Xy/gyweS5dXhdVpTyn9ws/
	WS1Q8v9iY4f3jh4gc+VL4VlvZjOit+C6HAPGVLYFss6eZdVVGuRNSN4i6AvTJzMtJ0vNdYjNzng
	NQbQTHlL3UbXEFm8n16a0TYjrtiO5KaQM5J5WTpaJn8lCzcTN5gJoc16ehVyqwIjHDnxX1
X-Received: by 2002:a17:90b:2251:b0:3a0:9640:8031 with SMTP id 98e67ed59e1d1-3a098d4364cmr12391254a91.8.1790671098293;
        Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm3751988a12.9.2026.09.29.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Tue, 29 Sep 2026 16:37:50 +0800
Message-ID: <20260929083755.458238-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013818_974773_28341FE4 
X-CRM114-Status: UNSURE (   9.89  )
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

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
