Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE009109024D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yyppvB18/x6bU99q6+7hnMIMbT83JGK7rdD1ww5AWjc=; b=PSZ8RWNf2pr3u9
	AqkSKJb38IbBr/CNJwFG7OWmvd5WBh/iA6Tl3KenCyVl+mtAnTfR5xnTSU6e40JSZPkUPaEzQgyMQ
	5qH+Cj9N918LK+0010tQjjqL0LBt+jgqlA8Q/Bc7z7vW6wyauHlH2bYZiMMqF3B301N1rHqKEahuh
	V8TCqoyJamj0VoIdSKvt2ZO+02tgYARUsMLKPr/C0TP3c6ddyU7HkU+M6J0V+S0xcYmI7Lp9b1Gg0
	sfjzmpdkrPMvD+DbmdjUZEXPpyB+3T+Fd15NRNj372uNfZr8M7PzCF2ENChV2BFISqZeGaQ7YEnQU
	BETo1ZMEoxsweHhbmo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHh-0000000B5BC-0j2p;
	Thu, 19 Mar 2026 16:31:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHe-0000000B5An-31Ez
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 16:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 949DB44189;
	Thu, 19 Mar 2026 16:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BABC19424;
	Thu, 19 Mar 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937901;
	bh=tX5CZ3K8Vq/igCccbXJWFNMbc/1E+klQ2HU03miDdJc=;
	h=From:To:Cc:Subject:Date:From;
	b=K6vb6vEqnzVw1iwc1/6E75xCDqIxm/ECFR+CswBv5djrLb/XY708t6gpIMY/POpXq
	 q8IonaCwV816TcuMYINEFAejsXUVDQnj3bYJaCnNaKRn5ZtQQblXUpBiBY65Ntvcrd
	 8uHzuNz+e14H7uH3c5cMMDC2ZGbwPJD9v+uqNT049S04kB8cBS4YukJ9NxFlljJVQw
	 a3BYHilBlZqAKJXLEG9FuJy3GR2Uo9kdlhPlNB6apyVzwL5zr3hgFRg6f4Q+uwfiV2
	 VmC4kftfDKg+e3Bn3IZuG2+mUj6m13VwaGy7s+7/9pUXuQcB2sOx9kaDKSxIQ48Ufd
	 5rbBKYuVwKT9Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: [PATCH v1 0/5] riscv: dts: minor beaglev-fire improvements
Date: Thu, 19 Mar 2026 16:31:14 +0000
Message-ID: <20260319-outsell-hypnotic-94b480408ad4@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IE2qHnLos3DeWsfckcYM89YQUbZK71dJp/VB4KAbbWU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl7VK6YrmnuEc4STq5O2bL5xzefpVbzhC4byqWtk5inu 3hC4LLgjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEwkV5eRYebswGs/Fq5M7wiX 8Jyvt8X3eazPyz2XBdOvTuNw5Fs9T4eRYdbbgAJR/3e+6+zuWmivKe0JW7r349fauue/5weUTWO 4xQwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_093142_780614_F62294E2 
X-CRM114-Status: UNSURE (   5.60  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

Some minor improvements etc for the BeagleV Fire, spotted while updating
our downstream stuff to the latest lts.

Produces errors at the moment, as it depends on changing the
interrupt-cells in the gpio binding.

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com
CC: Brian.Burke@microchip.com
CC: cyril.jean@microchip.com

Conor Dooley (5):
  riscv: dts: microchip: gpio controllers on mpfs need 2 interrupt cells
  riscv: dts: microchip: remove gpio hogs from beaglev-fire
  riscv: dts: microchip: clean up beaglev-fire regulator node names
  riscv: dts: microchip: add adc interrupt on beaglev-fire
  riscv: dts: microchip: add gpio line names on beaglev-fire

 .../boot/dts/microchip/mpfs-beaglev-fire.dts  | 36 ++++++++++---------
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  6 ++--
 2 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
