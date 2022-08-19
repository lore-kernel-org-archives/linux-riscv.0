Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9206C32789
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mLw6TcwNynoSZ2LUHfVFO0PQrRK2uF7yqvSt1EYO02w=; b=kQsMGPrLvkF7Rr
	kUq8/+z3eahk4ULd/LSpV6vl4d/HePN0AV5SjYniCqEjqwcUE54IMdWUOm1smcWWFdEP7BZGmJdBm
	erl8als7c/hnEF5M2bJGVooJiF8a6Qoq4DGSSOkzMriazbKrqOPP7kS38+zxu7ELqoBO0dtcqfBUu
	TBoVE2GeakXhj0pPVVZzqZva+WCK6wwhBbpf1pY789yuokFxORmrUobVNnehMbGmPsQ10QmrxJOL2
	/ORhVPC+h37pg7PwaJ7FxrB+v+V/I+/unJgDv8NLnFEf6CIuOPqZhopiwu65GwNZp2oNePzlMH1+q
	juur7OVSG1R00A2bh5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCA-00DHVk-Nk; Fri, 19 Aug 2022 23:14:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBC6-00DHOq-V5
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bs25so6722797wrb.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=SaeFaIV5wV1MKMr29Q6wupMh56tK3GFJ3AGQW75BYAE=;
        b=CGs3P+Cp1wV98Tih58wKHgLyWCKINJrfx6yL72mF1A8UF9jmiJMChfyPINgIVOByhr
         BTraVSVz4osV3Wr3JoOqCa/t6H410iUM9T6oU4m2J/9fYv6+SurQjrupYfo5M91mndyr
         ahmj7QeGxOVY00UfKAw/9xc/w65Ijrfdyl0ejMXa8/rnMnuUaSNR01kpejLmHmISVhnF
         +6WEjyzVLsTZMLuB1/6gOl8DmPR5wCbL5dremvHWhDt1rbRaunnmAaOJh+qvhZAEluR3
         CLjygIoBx/umhsPSf74QopQS6EDYGRsPFk3XnabCP6abxdxF6zPGvyNBABIT4voyhiJ2
         OFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=SaeFaIV5wV1MKMr29Q6wupMh56tK3GFJ3AGQW75BYAE=;
        b=UUHfe2i/i9+m171vBA27eBHZRoGv1kMKcjOmu8QRf53QYoBXgQEk9XS+DrPKsLl9wH
         QUNYwIhf+zWA+C9KOC4yp2fPMJvjQ6DyjwYq1vuYLoElumqD9Utv761BI6B/9I3veGzx
         6XVvyS7G4ITISaXO2RaFnuIXTP08rhLBt9ciHm2rjBtUCtbjr4piXJY+cv6ZY8gLBDSK
         5y0Dg5DOe3nP7Oeu99ty6CE6eqUTFOHARRft/rJ54bzb86Myhs1FFFh4d9DFlHhyZeU9
         wsNNicSDEB/OukBfkY/IAjOXut7OLV19eOEoXuDBBkBA5AfhW/KCwNuG/v03m/UVUpd/
         X6Fg==
X-Gm-Message-State: ACgBeo2Jik45PnQBC9e0bQ/k4hdCuaG+ch8YDt0LDBs0xvpqkKsn7jkh
	lmyJBFchgDDUAhk3DvYXNNLvkA==
X-Google-Smtp-Source: AA6agR45rexqagWDTaf4OrZKNQUASwm12brUKvs56alSg1WmnroFZwWLaQyc1Nq9TLv496a/xaoE2A==
X-Received: by 2002:a5d:4642:0:b0:225:33bf:39f4 with SMTP id j2-20020a5d4642000000b0022533bf39f4mr4002097wrs.77.1660950864300;
        Fri, 19 Aug 2022 16:14:24 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:23 -0700 (PDT)
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
Subject: [PATCH v3 0/7] Fix RISC-V/PCI dt-schema issues with dt-schema v2022.08
Date: Sat, 20 Aug 2022 00:14:09 +0100
Message-Id: <20220819231415.3860210-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161427_058833_A26DAC29 
X-CRM114-Status: GOOD (  10.05  )
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
dt-schema to v2022.08.

Since all the dts patches are for "my" boards, I'll take them once the
bindings are approved. I added a pair of other dts changes to the series,
mostly for my own benefit in tracking what I need to apply that were
previously at [0] & [1].

Thanks,
Conor.

0 - https://lore.kernel.org/all/20220811203207.179470-1-mail@conchuod.ie/
1 - https://lore.kernel.org/all/20220811204024.182453-1-mail@conchuod.ie/

Changes since v2:
- fu740: make clock-names required
- mchp: add regex to clock names
- mchp: add a new patch adding dma-ranges as optional

Changes since v1:
- fu740: rewrite commit message
- mchp: rework clock-names as per rob's suggestion on IRC
- mchp: drop the "legacy" from the node name
- mchp: renemove the address translation property
- mchp: change the child node name in the dts rather than the binding

Conor Dooley (7):
  dt-bindings: PCI: fu740-pci: fix missing clock-names
  dt-bindings: PCI: microchip,pcie-host: fix missing clocks properties
  dt-bindings: PCI: microchip,pcie-host: fix missing dma-ranges
  riscv: dts: microchip: mpfs: fix incorrect pcie child node name
  riscv: dts: microchip: mpfs: remove ti,fifo-depth property
  riscv: dts: microchip: mpfs: remove bogus card-detect-delay
  riscv: dts: microchip: mpfs: remove pci axi address translation
    property

 .../bindings/pci/microchip,pcie-host.yaml     | 31 +++++++++++++++++++
 .../bindings/pci/sifive,fu740-pcie.yaml       |  8 +++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  3 --
 .../boot/dts/microchip/mpfs-polarberry.dts    |  3 --
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  3 +-
 5 files changed, 40 insertions(+), 8 deletions(-)


base-commit: 69dac8e431af26173ca0a1ebc87054e01c585bcc
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
