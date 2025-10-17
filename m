Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B12CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=is1DA2V5aUBNN72qfrLTvL4mydmWkGJFF6kErGb6/Ww=; b=qwwc9dwQY9ST+9
	EAuLzfMboqfEALpe8whSJie0klkBQfVBHZqqrdCOxknu8pPEcQNAnMTVuhFf3hQgb0FTIlOZ7qWkq
	PFeuB6yhnup+0+SsrxIfG6RbwM3hUjq+qYzAR3yEtIq4GitCjErLTATtGipi2Jy5iyWsLPGRNKmCM
	CyVqgNaGqgaPcnRVjPF40l/N0NJUHLMN6S+itWgNCDAMKkqEyVuqrWELtS1m9y4VFk4LEksZEYp3e
	KOjWq50jRn2je4b5Tp1U1yDNfJbvsurSouFmDWUds+gwfgmw2B4wCX1LKW4604QU9hQpgfzBoAeFI
	kWuzuHx7DLopsQvf8gcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pno-00000008ntu-2pb8;
	Fri, 17 Oct 2025 19:07:48 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pnm-00000008nrx-0XYe
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 19:07:47 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-430cadec5deso7111195ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728065; x=1761332865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AlkAll+OG6DFncv4Mizto8zaWsmmVbaRHf+nrpHgq8=;
        b=smjGjtURO9EbXvDs36BduA9FxUEJjqCVXt7UgOn7EhNXzsi4i6OkLL/WQdfPJKeqAH
         ZPikXyx6VmYZFq0vYTXA4WnQ0l2nCb5hTgbYSobA+2PFBtvX4lOXUDvzq8VnyWS7BZhU
         ComRtC7qAzKOg88STz2DjMhJn59klDQBsYcRrdruuirzHRYIju/Tue4esekTuLhf8uFz
         tvSjDy7lyD5/Mdcb4Oyx16tbdIw+8ftiUCLU8Se1AP5i78SmJB9HhxbEtSui0GTgynEw
         9IzoC22MWOZxD58VESuzJYoXRzcgIMJkO8YsQBF0XilW/986U387BnFbEdjqCkdB0RvB
         1Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728065; x=1761332865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AlkAll+OG6DFncv4Mizto8zaWsmmVbaRHf+nrpHgq8=;
        b=VFAKivouBH56fqX1360lyZFBjKhIiltx+VwEHH/oEOgLe3vlrBtGGnUWTHDqEVP96Y
         UerWJyJI1gYYi+sNWFZgl6SycEdC2MKnhtgNc3ONBIHNjySRCluX22zZcZxT55MR+odJ
         A12Lw21CRA6X+9WsYifrV/DjNBhdCgyZPpjWUZwh3uToZk4ggnnNfL6uOgz32W3pcIQq
         ReGNfawc/WvBbjG1XGeb6yUcDwFSPeIQIBkpwuxcFG3J21MCWJh/fy0pPJf62JwVukRh
         3tpZ3nW/VkeXodQ7egQPgi1NDFAVN6fO+ZE8DuYqGsQCTkonQz0l6ExOmurNDtL/1T47
         IRJA==
X-Forwarded-Encrypted: i=1; AJvYcCXWm2MwYHrx3aCgKBJwdNI+tVBJMSVA6dYudfes5Sv+Gp32+9NXgktkBzYTFVarbqCpYOWEAW8h1/br6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9mPZv5uOtVFYDxK5fTJ/U3pkvuRUUuEFKsIdAvWKatOGv4DAa
	pB27w1HrXM2Vk+9YrVLZsDiHTWxnIQirjlfdPnIga/rKQFDJI/r5Yxh2i8C78W1eRyU=
X-Gm-Gg: ASbGncswbnG/WN5PAw54wScBn27tiWKcV95+iMVdr828HLtr9PHQ1T/4ZblLC/x+beC
	CZKZWRqEDdMrVihRocjUk4z0LM0+huejzs9n4kJ3WcZp5KMCKIAi6ERBlSzdIuKr1S6+xDmAR/2
	WluBW0KEomZemHHxatQG7NynSF+miHWX3UvKT+jm8LIhf9dqAxuYfnglwihZyDnPOUD80AG5k1b
	71IcrIJEdS6orlWBGCTnViLED+jiFx0dFnjkxofZlmdIVa6F0TNU16e3v90Vy6kbJYb8DaT41a0
	iaHR5ghPhVnEJ5UZW4jvaHxVq70NX2shmguoHVLod8ot5BeO1izxo3Gu8O/ofoAIaEMVx8//xWA
	5HRC+ROqP8HX0HLnbArNfH1qMIOXe74aHCDr1YQ6PE7754Y8sZi5Wj+DlRqxz488kAaY2ZYooaq
	/T0VyCiTSLPj/2EOeoomS4hEnDD7lWwQ6mc2AZ/cfgtqMME0sYxiHurA==
X-Google-Smtp-Source: AGHT+IFcpf2h7+KbWg4DjQlVTU7Ya1aj204MdKeqW83UKVIYqzbU0vSTSCHA4r5eCSfPwXiiSMaLeQ==
X-Received: by 2002:a05:6e02:4510:b0:430:c77c:cc35 with SMTP id e9e14a558f8ab-430c77ccd47mr56314875ab.29.1760728064783;
        Fri, 17 Oct 2025 12:07:44 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: ziyao@disroot.org,
	aurelien@aurel32.net,
	mayank.rana@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	thippeswamy.havalige@amd.com,
	krishna.chundru@oss.qualcomm.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Date: Fri, 17 Oct 2025 14:07:32 -0500
Message-ID: <20251017190740.306780-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120746_406994_275A50F9 
X-CRM114-Status: GOOD (  16.35  )
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

This series introduces a PHY driver and a PCIe driver to support PCIe
on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
one PCIe lane, and the other two ports each have two lanes.  All PCIe
ports operate at 5 GT/second.

The PCIe PHYs must be configured using a value that can only be
determined using the combo PHY, operating in PCIe mode.  To allow
that PHY to be used for USB, the calibration step is performed by
the PHY driver automatically at probe time.  Once this step is done,
the PHY can be used for either PCIe or USB.

Version 3 of this series incorporates suggestions made during the
review of version 2.  Specific highlights are detailed below.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pcie-v3

Between version 2 and version 3:
  - Reviewed-by from Rob added to the first two patches
  - The "num-viewport" property has been removed
  - The "phy" reset is listed first in the combo PHY binding
  - The PHY now requires a resets property to specify the "phy" reset
  - The PCIe driver no longer requires a "phy" reset
  - The PHY driver now gets and deasserts the reset for all PHYs
  - Error handling and "put" of clocks in the PHY driver has been
    corrected (for clk_bulk_get() rather than clk_bulk_get_all())

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20251013153526.2276556-1-elder@riscstar.com/

Full details of changes made for version 2 are available there.


Alex Elder (7):
  dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: introduce PCIe PHY
  dt-bindings: pci: spacemit: introduce PCIe host controller
  phy: spacemit: introduce PCIe/combo PHY
  PCI: spacemit: introduce SpacemiT PCIe host driver
  riscv: dts: spacemit: add a PCIe regulator
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 147 ++++
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  38 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 146 ++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 311 ++++++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
 12 files changed, 1553 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
