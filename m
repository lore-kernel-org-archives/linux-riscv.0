Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7F0C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ut3KG+cQepVOIOXOgVlNe2O1wge3BdAr/rWBf7/rleM=; b=pQILBWMGTu0yaw
	30QBnjJHopNC9oVdsea1xF3s4Q/QlgZzlz5eRsxiK1inoIKCK+LzoWXc/DuMFKBCv5gUZj2qnBYIY
	hfigRZGknz4X1cfWEd1bfegI8KuazN4zPniqpy4ZYANUcu7kCLTOM5Sfe/FlW4QcBNiW0grlvDY+Y
	7kLWHlhB1rSi3qZ7B3szNDEiNDgxxF87Buq7e2bDuu5jY3YKS2Xt3liQEdErBDA0rEX6i7bBne5ht
	/6P00OoNmi/JXv2fontLFKwr+NfAgca5OdcgVCM0dWOwtefCB05NmZ7cqalNikl57SSOJbzlCOH2P
	ap1JX/3uShwGzbm6Vfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiebf-008haw-2C; Wed, 12 Oct 2022 16:29:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiebc-008hYd-CH
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 16:29:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 241E8B81B60;
	Wed, 12 Oct 2022 16:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061EEC433C1;
	Wed, 12 Oct 2022 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665592152;
	bh=FLS1ScUOsweFiqs7skL7eFfKH7HuRS2fZKu2NMHvIr4=;
	h=Date:From:To:Cc:Subject:From;
	b=HkaJ1fPGBx22gZ504jqvA1EwvUDmvXusfNkhlVAqXlXP+AlA1nei2o4rjRDknXmAp
	 PTHbCxrgflsss67b52x9mqnixldShYqfd03v1R9yrwWrNQPyrVUydUmZiaHCV0Q6JT
	 PTPRUyX3ZA3KDp0nn6EF1AHTIFHKTbgyjBjErgj8zVT2XzQghKMA9Cl6E07AOBmQpA
	 TfKIsCAFoZfVnabPyRbqgSwEOnob7xiWodX9/ENLMJCVI2YePg20ehoeeXtWi8t5Tg
	 SWrV5rqJkwcuWc+QyIyPIUxxva5TV+27jATujph2TQx0eS5ZZtN+ZqDfnrQKWTtflC
	 ixg+B9WA1Cnag==
Date: Wed, 12 Oct 2022 17:29:09 +0100
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor.dooley@microchip.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] Microchip DT for v6.1
Message-ID: <Y0brVcwYZnoU0ewX@spud>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_092916_733725_F8994B65 
X-CRM114-Status: GOOD (  13.37  )
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

Hey Palmer,

Late as previously mentioned since I had to wait for the reference
design to actually get released - there's an -rc1 up on GitHub for it
now that people can actually use :)

It's all been in linux-next for a while, apart from the HEAD commit that
is a fix I added last week rather than send you something I knew was
wrong.

There's one conflict between this PR and some stuff I sent via fixes,
but the resolution should be easy. The commit on -fixes deleted the
microchip,matr0 property from the PCI node & when I moved the PCI node
into the -fabric.dtsi I accounted for that removal. The correct
resolution is to take this PR's version & remove the node from
mpfs.dtsi.

Thanks,
Conor.

The following changes since commit 69dac8e431af26173ca0a1ebc87054e01c585bcc:

  Merge tag 'riscv-for-linus-5.20-mw2' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-
08-12 18:39:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/dt-for-palmer-v6.1-mw1

for you to fetch changes up to c210b91818e81068ca2573c20684644b8e110a07:

  riscv: dts: microchip: fix fabric i2c reg size (2022-10-07 13:43:42 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetrees for v6.1

Fixups, reference design changes and new boards:
- The addition of QSPI support for mpfs had a corresponding change to
  the devicetree node.
- The v2022.{09,10} reference designs brought with them several memory
  map changes which are not backwards compatible. The old devicetrees
  from the v2022.08 and earlier releases still work with current
  kernels.
- Two new devicetrees for a first-party development kit and for the
  Aries Embedded M100FPSEVP kit.
- Corresponding dt-bindings changes for the above.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (11):
      riscv: dts: microchip: add qspi compatible fallback
      dt-bindings: riscv: microchip: document icicle reference design
      dt-bindings: riscv: microchip: document the aries m100pfsevp
      riscv: dts: microchip: add pci dma ranges for the icicle kit
      riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
      riscv: dts: microchip: icicle: update pci address properties
      riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
      riscv: dts: microchip: reduce the fic3 clock rate
      riscv: dts: microchip: add a devicetree for aries' m100pfsevp
      riscv: dts: microchip: update memory configuration for v2022.10
      riscv: dts: microchip: fix fabric i2c reg size

Shravan Chippa (1):
      dt-bindings: riscv: microchip: document the sev kit

Vattipalli Praveen (1):
      riscv: dts: microchip: add sevkit device tree

 Documentation/devicetree/bindings/riscv/microchip.yaml    |  20 +++--
 arch/riscv/boot/dts/microchip/Makefile                    |   2 +
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |  43 ++++++++--
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts         |  18 +++-
 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi    |  45 ++++++++++
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts         | 179 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi |  29 +++++++
 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi    |  45 ++++++++++
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts            | 145 ++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi                   |  32 +------
 10 files changed, 512 insertions(+), 46 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
