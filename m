Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01709C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrZiqniSBX6i9tfNIvLXuehiuTSRkMInVixKEzOB0B0=; b=QFOpToPMvUb1Kj
	yjkdjBTVLOLG7wAICRK8dYWps+AmNCj/3qkU2KNmwHt2ELck1I5YTW6YxtNM7hemOtOsqtL7OXC3y
	Vf7YE1xWEV4ghS18+AdehdB0nCIYReH7iYbDf25Vu/FzCUWkq3R3AdbEI0NX5YUnG6lTG9kdCUibP
	F3jO+P1wDJ8Qtt7rXEBbOJQMFimApinb2EaU9Wk/HupmVuLEfWPqtJPsBpe6bLVDZvtCyRYb/6X8C
	4Yh4U72DQzrMOSOd+gs81JxgAQJGaA22IXqMTWEmeuZ5TLLYjN8lXov+hwAIRkwc6CgpDj97AqaGP
	QxTn+0O0ZNSXEH5ZN4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfx8-00000000xFF-0VBo;
	Thu, 09 Jul 2026 04:01:34 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfx5-00000000xE4-3246
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:01:32 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84830c774a0so1419888b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569691; x=1784174491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=jvc9gTEdWggGJrvgW9rW4H0nw+gu/3TGiG/Av6YzqIlyl+FngRNgDYRwXngicWTNK4
         Om9hDStObpQ6rjp4C3qPhsveDoT2ktA4KStx3PCIQGRsM0/xfe0ee9boAV3DSmum3zfS
         gKyNQBL/YNghGkerxVlBsszi5I1xFbTE+2Jcybb7rbvF6q0W0qhbH87ryKdXc1qzyqCE
         2vJ5EBSPx8NlTp0tKCgQv9klFL0IoVwFa3wpDlReMU1+RxYOwn4e5qmU5PFUDZVG2Zou
         vRmGjO4rw65yp3AvI4ZT4QZj96SwDZqIIiUHD+NchcVoKZk5dEY+HNlSP/adm5AmQybH
         Q4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569691; x=1784174491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=holT0nyFzoy0Fm6KAtrAH5d0cuoGHonzF+FOzyjPyMiXxjwGOdi/HAAOy60reRBGRH
         A7CCpsEBFF3SUDq3LQyiK5KEpj1qNRf63QiUf9OtoBop9uYV6lSz++Q2QfxqNgr3mUUd
         VSpb0dxhOoTdJwnTLJpNE9y2ShRFJB0iml62FZ/rZsfL3RcrKe2dRvndmbcS5tIGlJfU
         nrbZ20DiAGZftS4pYcHmFlSkGS3/dPzoLSUsoqlDoZJt9LBPLBw4fedF7As2uE8UDeNi
         UJJWicEV6Hc0QNvtm4fHMD6N5AJ5rNuxS9DLlNQDSIDIcjyubciVjocH6lZfwHl4KONb
         6ZXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzbjEFkkLgfbU5Dx8Nsy8G7LTtYRVwgHJwF09dbJQ1tPmWNsw/My24ykCPwIy/yknzvHS8UVQyM/OR4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3eZgQweQ/VVUMS7Hbrqmn0SFYJIyrjZU0g+TcwSkGJLYwBRi8
	hq7DJLVajHgT4TmnW0fkMN+TTaZ08dVjGDCZSzxv9OQPK8WyLlVfh5dc
X-Gm-Gg: AfdE7clNRf+681Lq7/maUhkZm6cyTe5DVRUsxSKFm5NzA6CAPCQxnjMfxHGN3QSwwki
	rY0CQQ+9Xps/DltLisDTTaJpqqbjOmtfZICRaolAOZE95AVSBUIcDAGhJJVkOfGsgKmrIxwGxEN
	b0HNHnQf90cO9EV8j9QG9g0210eXu+Qx3El+pC8I3cvB1qHZn6W2yPFc3w53Yavxo1QInpxAZu9
	llOUt5yuBbraXtNkC49RP6rSKnkUo2VhsVVy9G2wPXZJ4b+16g7Jd2UQLvpgNt8YuKU+RN3mcMy
	Jn0jeRNQ7xgMIY6qGuh8uVV68dd9E7h8g8VJ7N2VDQRAEC8yFNsBBR/flFJLLWWuHynaz1S8dB3
	XOOcMcB7MUXiK7csM6DGnvXbiJHSMHPh+VWiqENbiQEv1ucOcRg2RTKzXnXe14YcC
X-Received: by 2002:a05:6a00:c88:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84842eb7ef9mr4875368b3a.3.1783569690624;
        Wed, 08 Jul 2026 21:01:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b93f8csm8273199b3a.19.2026.07.08.21.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:30 -0700 (PDT)
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
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Thu,  9 Jul 2026 12:00:24 +0800
Message-ID: <20260709040027.958400-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210131_785743_A7C75971 
X-CRM114-Status: UNSURE (   9.32  )
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
