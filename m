Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88118C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A6X0tp1SWxuGuyN7MraLWuvO9UPkpmaeoJsyp/TBDxw=; b=3YWpjWEwdX659W
	ENDE8FH5/hRYujhrrdq+DHChPozkl9CibnJWGVP17SmBC9d88MMKlme+//jGvysKpWAF5ldM7bmN6
	xAmTaVWJ5eMbOBitQpZcO3yMY5PobHi/H1nyMca6TRihhBL3r483x/pnTeJppsshW0jCGGYZv1Sja
	32W8QIh7Chi3tF19uMVds5rJl1XmtCuZKe3pir2ZYhQ5k9wLfVnjUt9hZOploGug40bGEMzyPLv/d
	AzjVQuy0lVDAIX3WCaFIOXhlRNbLGG06FqdD9gSD1xx1U23+iqDi3CyPq1f9QadR9eleqJWhdsenu
	uiccDzEJdFflt3UL4b6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GM-005oD2-DH; Tue, 16 Aug 2022 18:26:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GJ-005o9A-97
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:26:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z16so13576342wrh.12
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=i14dSapeS6A95og3h5kVrEaeQxUOEEcffvmz7W7v7mg=;
        b=SFfhLwGA1m3W49evekpktH/l4IitnbDTV07fTcveNPx+SVDpmrIhLDWbuuqx94qZCQ
         3k4dwlMnCtECF1kUYylgBOCmMmcHMH2BGHCInV4vx1IHN8RZaI7SxCTkW5Z+hlZS0pAA
         px1nzTkEaWBBn7CjvMDvM064Rs4nvR8/vGfqGAmsu49ckurodNOHilwC9LJa56thDAbT
         fU7QmYIp9OyTLf3KIAqEXBh1A0W0uJtqQZaIYZdz+q8dQ1n7mQFlY6ZF6w4BS1wiBa12
         dc5ffczB0xcWpaLya62H3cEkimt/Lu4jTTZtqctIcDm6rpHHOEgxMLffokpP/uAwnuDD
         gI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=i14dSapeS6A95og3h5kVrEaeQxUOEEcffvmz7W7v7mg=;
        b=KIJ3fZbwIeHKZphuLi1qEGj1PdxY6S8nJsfJOyA1nwz6ZiUFMW5Phtd2J3sc6Pguxg
         kfxwBGesqfenaghCvtYuUhRt3PY+E4AmPy5ffMPyYmVfxUQm1VdjnYSDMb3TEumQSPml
         WCT7bYI9MhcTAue1XWd+dbBkpPJ45i3es02PMBqg9iDdADgQ5/8Oa646MoAtJLNAhaiy
         Zx2Apd1sNaNbhl9vCPqVmUYLgJBteS0FZAMSqNtgte8kF0eGGAVp6cmulR3Up60dupXx
         GirpWbVVMAKHF2McOLCUtjILJ9al1eZmpkhDfvddnfKPR020Qfi2ulJBU/Tb1RgosXKh
         DiLw==
X-Gm-Message-State: ACgBeo0TUjwHsyarI396e9bq5vNDILw0GDQR/gOhl0iGJGPANkWuIUgI
	pB4x1HR0RGtFsh94fIGXLONeNQ==
X-Google-Smtp-Source: AA6agR6bTwH/YxxR5LcBXZI5QTnN9mSXoYCK/TmLm8WaQxf55ygx9S28F9mU7Vc29aiDwpv9EgOsEQ==
X-Received: by 2002:adf:f74b:0:b0:225:1fdb:a787 with SMTP id z11-20020adff74b000000b002251fdba787mr1250471wrp.33.1660674355174;
        Tue, 16 Aug 2022 11:25:55 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003a603fbad5bsm4015482wmc.45.2022.08.16.11.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:25:54 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/6] Fix RISC-V/PCI dt-schema issues with dt-schema v2022.08
Date: Tue, 16 Aug 2022 19:25:42 +0100
Message-Id: <20220816182547.3454843-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_112559_385894_DDB3AEF3 
X-CRM114-Status: GOOD (  10.02  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,

Got a few fixes for PCI dt-bindings that I noticed after upgrading my
dt-schema to v2022.08. (and the associated dts now too)

Since all the dts patches are for "my" boards, I'll take them once the
bindings are approved. I added a pair of other dts changes to the series,
mostly for my own benefit in tracking what I need to apply that were
previously at [0] & [1].

Thanks,
Conor.

0 - https://lore.kernel.org/all/20220811203207.179470-1-mail@conchuod.ie/
1 - https://lore.kernel.org/all/20220811204024.182453-1-mail@conchuod.ie/

Changes since v1:
- fu740: rewrite commit message
- mchp: rework clock-names as per rob's suggestion on IRC
- mchp: drop the "legacy" from the node name
- mchp: renemove the address translation property
- mchp: change the child node name in the dts rather than the binding

Conor Dooley (6):
  dt-bindings: PCI: fu740-pci: fix missing clock-names
  dt-bindings: PCI: microchip,pcie-host: fix missing clocks properties
  riscv: dts: microchip: mpfs: fix incorrect pcie child node name
  riscv: dts: microchip: mpfs: remove ti,fifo-depth property
  riscv: dts: microchip: mpfs: remove bogus card-detect-delay
  riscv: dts: microchip: mpfs: remove pci axi address translation
    property

 .../bindings/pci/microchip,pcie-host.yaml     | 25 +++++++++++++++++++
 .../bindings/pci/sifive,fu740-pcie.yaml       |  6 +++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  3 ---
 .../boot/dts/microchip/mpfs-polarberry.dts    |  3 ---
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  3 +--
 5 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
