Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE84AC79F99
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 11:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrZiqniSBX6i9tfNIvLXuehiuTSRkMInVixKEzOB0B0=; b=tNNKp3QjYNsYOO
	CqfrHADeJVYj2ushko4m58e/K9ne9G6KOPeXso9Iz/gtqABJbHwG/rXU1Nwd+m7SuVpy1jeFntxBw
	ZV5RQwhJTiy681NBRL+LXlfmb1csqxzBikmBBBgZJVARum+wXLBVb/b5fs8XnYX0cLDjOlOJMkiyF
	BRem/KnSEShWDyvDwrYRvyY9ZNe2xdul2gDUze0vgwWeOMq6Z5iilMSZ7JPlWVy8HKBVjWF4H4ZCi
	eilbHD+dj22zfoZdPsI8XRl1j/FggrEHB6+bFaN3Lyzqi0MfTx0mm2/q9aEkuCdtInNez3GYRK0z+
	ExZzAdYQhuZNYw0qmFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUw-00000006eAY-1oam;
	Mon, 07 Sep 2026 11:26:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUt-00000006e93-3P7r
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 11:26:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8557c3f270eso1592723b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780407; x=1789385207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=i8H2hHLgDT1Cn5O0KsezysCF2NmWTfESdRwH16nSBQQ6d/R4PUe8prcHzxooBmMiCc
         WdLlivzcj4yfYOQxqFj1xDem3NYFkgerf8mtD0aCvr/bZs8cBNUXCh7b0yMg/ZAfY/cU
         JnPAONF2TUCoNe3l/eIN5VjFgVvI28p0iQJ3NW8v1+tkCGBVfXZ8E5wRiTsMzARGRsqt
         2tYC0EmdXhWeFKBGRLa/c8Ubs8e0MLTpEnnZayz+cEvN2HFxNq8GfY20GqisXalopT8u
         XZ0w9lbWVMsXF+VrOtMFoigzJD4OtaPK4nCYwmWJvKq2EIokew6H9D0cLdtupONdFI7c
         urTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780407; x=1789385207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=r+Jl3Sl7aboobFzZYvocyhPcSF7o4M/5VC/CMDIB+ECaWXHt5KDu5pT5CFD00yxPvn
         h4agEQUuZ78PP+nXeS5deDTTfBIPJyA7yC6MLp2+b+HOze9jq77BYshlROV5ceIZPNxO
         qckrPMzs6EQgFr3J7rZhBJKhcYWO8MkgiFNFs/XZ7OmGNRUbVUPqVV4WttCnLswfAqVV
         Z48nzNinPU7BJwFNmMGh55UaYWUjKXQhOPWVd1hpFXOMM/h5efSVN/XGcDPSfia2z2KM
         We4a4WJpyhipN9gMxHrr0L9SfcyQOfpFavRBWCTH1OuRUDWNZBGXE2/qtVPGPFq5woFT
         AnBA==
X-Forwarded-Encrypted: i=1; AKwUvBzkvoeB8HlYW1Do2TM5LXvAjfzifqoOicOE+E+L00hPdhVclRN830Fe06n7ddbs1vlJwrwG18l97Z/oCA==@lists.infradead.org
X-Gm-Message-State: AFuF++mpThE7WqYPYYkJW/fjIJdmI1OsvLL+UuxQ7eIReJB7M+CogBTr
	ZzH0oMVHDY2+aVWDajIMO+CLEv46DiPd81jJJ0zWtp1lI4PYp+VLBxpa
X-Gm-Gg: AYBFou0SH4dQRfx/TpogEFuv+0BS32U2n++krU5N7XhV6gvTrb6v3AAP77AXIXPqkas
	J4jT6mETpQWFW06BQKigQSbp+E8dn1kTS4XqzQ4S6pNVhnS+C62zKrZIB24dakco8lB4kqZry11
	+DhnMBorWuCWk+ZWsr4VuwXXnry9PQV3s5uI7dDN66GUaEJq4UeDqcVPgMFFbCCcmBj6fQ31oFo
	1+eUW4GKNN3PvNRVEvzZYCunbRc6t4HQ6VO3eClVWmOxKm4UDPcXUWXyBXL8EIPrlO6dpGruVaP
	yWi2Fen8btoMupg2V7PZsO3TeQwE98S8eQPjbiABRzs+QZTIVCNrrXLbjn9n6IINSBDwVBQ7ffw
	wtW5R9ezAeFW0etpgGNsf3TE+ywcg+3T7RPEmSiC/GJtjsg+U40zp5kq8VW1RaQArRsR4H8YXQG
	+IHr8IjWHEe/fa8YP47Eh0D+jNAFiuwig4/UU0
X-Received: by 2002:a05:6a00:32c4:b0:857:73e2:9107 with SMTP id d2e1a72fcca58-8616c8498dfmr29556641b3a.23.1788780406647;
        Mon, 07 Sep 2026 04:26:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f67sm4265654b3a.18.2026.09.07.04.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:46 -0700 (PDT)
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
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Mon,  7 Sep 2026 19:26:03 +0800
Message-ID: <20260907112606.465778-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_042647_855453_2C1C23D2 
X-CRM114-Status: UNSURE (   9.60  )
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
