Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CEC606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 04:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c6oXROVR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJe2NO6T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pHfEQufefzl52xRiklTwZ5G7UOLeG5895hQ622fxOj8=; b=c6oXROVRxdGLq2Ep6tpkN9kXWF
	XaHdkPaFF+P0M0Duj5QQ7Qr79HyXvAS58DVUxgpfNbE2s+O7m9VEI8oIpbWl/X6bxMWQ6ScHA5SIc
	fHUNT2mWb15odnBsbrUuRnP6XRyedB6AzEVKfWqiAGrbyjRJKMYQ24QZEE7RVy4doECeu+z5PQL7F
	Y2Dn+QoKd5TygiuNrDoIcTiipNFUwNV6snFowPkPJ8XN7tSj6PDyfzW45yVuoMh0wIIFDUHMCt1DI
	bWE1zOH/wwGGHLWLgDiKSHDmfN0oX45QussvQL9Ks677sO47jjGQF1Z1b2Ge0YDJKWyEuDk6UiuPP
	UdbBEANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4QC-00000008NFJ-1rev;
	Wed, 25 Nov 2026 04:15:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Q7-00000008NBg-0hTN
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 04:15:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2396640b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580146; x=1796184946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=jJe2NO6TQjuiNBvyYme8n5T+lS8Cghtiv0jwVxlGi7KzKsmQCH5n/Q/IQJjpTdJbCJ
         koAZ47nm/fxvk8W+KhGQR/TIe6PxnE++kjzWltvJN/n9J9BtnZk94C25xf6Pp131OIXX
         oBKs55MT5HgZkvbmao25n95pNzAHf/Ca8Y5ZWD0ixqZjvFamNdteuNFK2IjaYnj4AQYU
         20VE6HGDAD7BbbWlABuY42O0yfrH3OPxf7iEV4bwh2MsqgFeMMkpV+2n7b9Cg0x17f/n
         DePohFBokq2A+kQMhTCPHKfijxdfw4P87ZJbcj4sVT4tauZOzb4UMPR3AlNNcROrX7or
         oWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580146; x=1796184946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=ILaXdAPVXRvjoTZ7KM5dF2WqZoP9NFuKuwvTmo6g/bQiATwunLBvdtvicQ4n6+l1Qr
         Kah7YsnZzrBAwWYIb1pmbysNHyecr/sA0Q5croMsZClmZHbBhI7yxu7ZI3rNwR2J+3yq
         rrhBitPpqeC8IKTKopWwi8MeS7Vrl9PFlqLfI+iO3nihPBpvd6jj0fsJqaeaWea6ObTF
         r0/uVjsfDG/HdJRCame241Z/CPU0EoFIePK9EoknRt1uuUUIiai8w2SR6Kh46Q2s4VFA
         SF0b/vCRslxR9ZBsmJJyT6TDwG64EVy+BJNwxADP9NBoi75VYPwDXR/FPs4OB+bSZ/UO
         4zeg==
X-Forwarded-Encrypted: i=1; AL+hErFDr9q/ol2XQi2J/w8I2DxeyKF9KuwNKWYCI0kpCW9NCF7Cl2BFeRQcfCL9IyKJSiUPhOf2gz6XKQ8nyg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/okbputhiAoIgS+W8E1WUSf5VYhcIIUJoP7OSATIj2wOTIH3Jv
	saHGVkZucwhFqaV/4b0wMEJq81iWHHshFjvERQ57xSs14+QrAypSdm1N
X-Gm-Gg: AZFdTZcWAKPeoIZhW5NqO8JRMYE3RhKDdZVDjgLAFN9OsY2r16NKIXM+kA1lt4AbLUP
	fRFBUFgrhDUFaoSGfEQoN2i/oYW3wS2zdagCI6ptVPlIJxWyE2Tkn83QSggW97MD5mdMfIQ7XTj
	JfERAZHy5nEHspCZlBe6Nmu20uZp1CnC+r5nlWZbdKczlA2qA6tgRnrRT9Q/UnBX93EzMmlbMmr
	qui6Chg5eMa9fyYr1rkPTmzlPNv7kmifNJpToLnsExozMBzRY+dQlYCY3d3zZ3vIBJ9+u1ZywWy
	mP5M32bBwvKXgXHasCuuctBDy8dhZEZAtIJzDzVrzQzPUPh9L8vV45rPzLdKW8KeT6pG6YRkzPq
	SF9Rc2VMzt9pwOxGReOiqP4QaMnPDwjgewWALvXiXPGbmbu5XyETVRW59hrlXePieJpu/wAO+21
	lzMqap3DWQo2cnJc8bYHzt9bBIult8cSU2IftiIjgyY+NjobV5sQis5obP7KmiDYyW+9mErgqoN
	Ax2rSmhAwXJpTRFgMDcT7U4rS4NfX5xFy7oLCDdjngp99sUed8Bn52M0FHogTZBT+hopizwsK25
	OOlynzGiqUGApo1C2c4tUMXEtMU=
X-Received: by 2002:a05:6a21:3b8d:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-4014c94a7a3mr16524789637.16.1795580145986;
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm8306084b3a.19.2026.11.24.20.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
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
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Wed, 25 Nov 2026 12:15:18 +0800
Message-ID: <20261125041523.242588-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_201547_212329_A813ED27 
X-CRM114-Status: GOOD (  10.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
