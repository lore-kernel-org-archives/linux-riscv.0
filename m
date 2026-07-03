Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F016BC43327
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrZiqniSBX6i9tfNIvLXuehiuTSRkMInVixKEzOB0B0=; b=NZxgji4zseSUos
	gj8oQq3YgkFsebNiOPZ6Wg6nEoLy/VzCRckDgpy4vHO5Kr8wHIaR2JUcS5pkAS3mI0/i4ccpxaw1U
	0BFedw+SkXldG23Tq73FygDA8k9SkdxprJ19RGYL4q8tFrPuMMOrmZyu0ZBKLIMBXENWoAjxyLYlf
	w1vlzikH4k55D81uxsrq4X1L56HpAWxG01iJa5RZJvRNtVJ5sliopkr1Zks0mNdihvoLjpphh2U2r
	Ie+NsGMUsQz4LC7V4uFSyAY+OviBQsnhKYqVzmuoodPsRVc0YcvW04d74aM0q3BNJVDDxI6vBvwjz
	fez1lttV5gfkoR5KXSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTD4-00000005qww-0Usm;
	Fri, 03 Jul 2026 02:00:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTD1-00000005qup-2Xs9
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 02:00:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c99672293cso331065ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 19:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044051; x=1783648851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=Co5Rx33M1wBUrxQD39qGeVnviO/lz4LonE9+9s4g3rvU1i0u5X5+xJuQXN7glLBxqQ
         7SYS2qoIm/YHc8SEAXYWJY/H5pAUKuvySnG0/FZi9Y0Nh5mD/tiGjL96OjbyPgBudP7N
         +CoUSPwJv3zTPYHfg+QFH0kDCbmtpT5CCjefaVBOhzSl9+GQloJuO5XOfFFqm3dUNfW5
         R7mv2dUJbq0t9fg5/Eb/pJrQ7xsDfrLeaAqtozgKgmAAMqRc43T2cDEHmGy3x2hxtSWa
         8ybuxTbOy4j0l7ZBgpNTlntDTEAnFIvdBVOMhkP+WflQbFVHAEq4LPw3pYG+8Wx/vcDS
         i6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044051; x=1783648851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=tZKsG3Kuuo8o6OcDO2PuvnahrGwNPsXHAy2OXa6kGJnZ6yknbpvUUgPv7qsJaI/Cu5
         j5BkwGlGAAwyPCN2vk0HyE/6w80jorYmmdNshOIgfndTz8zlZ2Ii7HHxDtbNzGS5aRvf
         j+syKqRskOG/liPBCS+YF/nPDw9pXFGVx2q4M2twx4mF2avLPAgrtdQXObJWCw9Agn+j
         sJQqzYwMaYNKuwJNZ6+WUDZzf6ACbsCuts2XmMb+8ASe3VdUwUPWiBPHiB/a0yr44/45
         hD/dHInOgNKRINk4LMxTG5l8j42jEWT6GdFF7j/FaduqPawG9lZ9QxxoRGoxAVTizafn
         BlOw==
X-Forwarded-Encrypted: i=1; AHgh+RpvOx2v2t03OZp2vZFb81CufWBkTNb7FdCbV+oT2B5/seUIxdwElraSFxSSe0ObFEcWyGPHtmjroYFcfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9hMSdNrmZNVZbiAdHiTctw5q94Ae9rz+McfEURPrUVXKNR9Dn
	RNzfs3WsHHaRPmiQTQc8pVyUhSslesIdkFABxWhNuL+rDmgaS+5K8ueH
X-Gm-Gg: AfdE7cneGM/HeCa6TrAudcwkNP1MTG6WBLYe+ue2pAx5S70ToyoB1/XH5MbBXhY+L3r
	GKOJ/nrHUFzsGl+ZtiM8agI8XbM1pGUyyGm6s6/jtdnjWFvT89D8nbaG01jm5XlpEGWsV17VFvC
	dhROyThQXLcN26VtxbHiv21x0o21VHFE3Sr3J5Y8YRwVWViUY+4xgc7h/3lFH17monwjFiXssdP
	ER/y6JJRjCaN/X4nojUF77zKUzibDHqs1+APLhE10U/Aivti5KOWJuz+aljXbx+eAVfWDUmQTBV
	vAJ4P9jiA2nw9GBmHEzTj4Ck96IXR+2mIS5+JM/Qj4sxE1hZWryTYWBYZLRx+HoB2oTi42EfBZJ
	6P7lMbXSAJllXzZLBAKurzujgN4eF2eWZ162hh9yBYSwYRZkA49H2vAeN6sBtX/dOPaYkAZ8vZU
	ZVMeDa3d2ewjM=
X-Received: by 2002:a17:902:d541:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2ca7e87f1f5mr99029145ad.39.1783044050535;
        Thu, 02 Jul 2026 19:00:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71458f6sm1481975ad.32.2026.07.02.19.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Fri,  3 Jul 2026 10:00:00 +0800
Message-ID: <20260703020003.485436-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_190051_769405_3EE3541B 
X-CRM114-Status: UNSURE (   9.20  )
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
