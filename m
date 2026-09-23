Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D945DC98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrZiqniSBX6i9tfNIvLXuehiuTSRkMInVixKEzOB0B0=; b=dHmcrIjovxdjCU
	gog6deWE1NmepNDdyEGDD2ZsOrPz8J74I4HB8zLUfTgzG5FNHmtuqxkUGpHaoHRmvPUyQHVABOcbR
	TE3iMgzIx+SJPCjGyg/+BvqpYZJXazbsqkE9r8Q0XX2XfszAAB94ODLWcIJBN1HDyZaFs0TXt5Z3G
	qQCrHdxIL6cLk56s/N+HK26mY8NUNC2ef1eaPG9fhQuQhG5mVChHFQGh7iwDgDoVtEXwDL1GVDesT
	buQm9pJShYERmtrgPLrhWVKuTSk6soBpZoWUtNckIXggAiMK1aYVOgTNybfhB2xWq26QoRx3FdtN3
	F0MSwINUT9qz4KUcHOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8s-00000006t5L-3bjk;
	Wed, 23 Sep 2026 01:51:26 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8p-00000006t34-3s3a
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:51:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1000069a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 18:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128283; x=1790733083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=jWqXe6CYiKHf9klb3LgGTKmRCSSDkOrhcu+47FuI9jb37iGfXs318GugAd+5o7uYrg
         6FQfkJc8gwOVo/Usvjn74i5dbzHpW+frPIi/JbOV8u1s1O9YdkXghdG03b74Qm/dQLC8
         TS2SX2pYSVpC/I3RYY65hI/D75bca1wAgyMoHBf2heTeDa5pqCNZp4LbjXfopi/e6oWU
         BRC/0WYrJs/HfTXibPej0tw4DetFHQlXCOGs+8ieM66Ko8EUydq0d4CMAhtMqnY4xQME
         npCerlzNqVGPFHiR8WgOWC2TjERWlLozpR60woPCLBQk6KDP/qK3NyM0lS/IOS1FvLj6
         63Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128283; x=1790733083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=jV2/gs+tHSMUM8bJ0ktihSNg/NmjuEy2InLubWhbBy2NH7pxtEfQxIEQUiIlCSXIs5
         3PixpfVdz4+zCD7WK5Ez6i45vAtMLUWQgtAlmvrg2sQaRqRZTnkPzt4P5RANaCNgBf4K
         yypfwJmQBMvn53FGnwAyx1RmsFu4Oj9LMQ5iwb/DhC5xkt23MRdUz2MA4UjSNbrcTbnR
         g4Br98NSsNQJA6JjY6Bs8pzTPbIvqFs4jHnbki5wxHAZ20+WfcgxEy3ekUeo4bkWAN5g
         RLSMeGDP0hAD0npO9asGnVHaloIsvA7jSaLNwLmLff+hfvCs1YUJ0Dik9rb5YjiMshpa
         FNaA==
X-Forwarded-Encrypted: i=1; AKwUvByeOyCyyVDmbBaJiGpaMnap7SFEFG+p5uQWa9Z7jhnHEn/CFIvxdaZBZVw0lg2e/zSvUQXXvZTBgaNt4g==@lists.infradead.org
X-Gm-Message-State: AFuF++nTq5NKwjdZBiPNpAPtg3vHmd+UdA79tbMDr4KItf4fBR2OgcS3
	AnAl+QoWcGFMqMZQI5Oos+JSO+RwV976AWBvId9i4lHD+JYZkdh99DJW
X-Gm-Gg: AYBFou0nlMD20gIiio1V5h5i2bCG6i5+N+Jnem0DJ/FtXqDbDkPGvPo6pa+4IWU0xjv
	kUL0gnWf34LUCkfrzBqE9usiUlCQiiS707PsvHfHj/f74YwR5pulc7I2RLHKIyyMs2VK0k12qLf
	7XoABdK8wPUaRdE7yWB91vkTGuf5NJuVgKsvXoS8xj+ZDtHHq2nzggiNedbDMODbbLdmQ/EdIdk
	qao7P4cgSz/A90PVDajKuJ5t88LFRK8aROi8Zma8XCZOazgv0fAhIJISwdVTeOT/pFKMFTVf6Pu
	1spwxDek2kV6epXH+rcrIrE//iNYLlmR7sGdtmRqyLOJY8ECAALPE9bs8r9IQlGVfdfGxgBr4o7
	L+UCwiopIRA81c78KB1N9XWCdUN7xyP8i5tLL3i+PB3R8eozp/eCIKiAR1fLiTMKMx+/4b1etYT
	SXErM/SbqYBjg/U+aOFPZFCVAZO/b3aQpBcym5NEJK0H0lNmc=
X-Received: by 2002:a05:6a21:4882:b0:3dd:85ba:ad4 with SMTP id adf61e73a8af0-3ddec8562ccmr2388263637.39.1790128282867;
        Tue, 22 Sep 2026 18:51:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d67bbsm291074a12.13.2026.09.22.18.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:22 -0700 (PDT)
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
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
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
Subject: [PATCH v6 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Wed, 23 Sep 2026 09:50:13 +0800
Message-ID: <20260923015016.64069-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_185123_974722_B9768D8B 
X-CRM114-Status: UNSURE (   9.99  )
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
