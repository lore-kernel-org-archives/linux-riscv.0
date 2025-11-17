Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C68CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M6lywQTZ78rBUSgvl/we7bvQrtfJPtNHorua7lmJSfI=; b=YKpD5rPMgwLHpL
	9NwfVXoghXbuk5IurwEnU+8GOfCOUNoEU/QYKKTfI6TM82FJjZycZhB8vEDmvIVsWsZv1jBZ3VD7B
	V54v5NBasJslYZxMinYVN7tfny7b8nZOQDQHLRsWf1XSFj79To+hf0abfCv1G6rw3IMoBkLa+48Ce
	Tq/E8tkq8OulNGsD4hriUmHciFRaXY5Zj1xzAKMF8tOhO/MHq0ZnR9K07sjdea5vjawIi6sE79Cxk
	JlHgC7cwEgFdrhVvARrG3izizS0c331lmFfzfQcWSbAoXzswkJfPbPpeMWZ8FPX0+KhIqDAiZkH1f
	F/6hjOpbPse96pgjWK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Tu-0000000GQlO-1ikf;
	Mon, 17 Nov 2025 16:53:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Tt-0000000GQlD-0Ouw
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 422946022A;
	Mon, 17 Nov 2025 16:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ECFC19421;
	Mon, 17 Nov 2025 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398411;
	bh=jirAepMGk643XDOW71/E/gpSvFkccHqAf75JsWUDiac=;
	h=From:To:Cc:Subject:Date:From;
	b=CFfOQCL0ZDcspG5JmJEPOLVtzFV1InfM+3qpaLc7ctTfsqsL+32Y0gQaip6AUruGu
	 rwsMlciHbWX8oVdn/N5ceXKpT1q5HaatAHyS5AtLk35yIcujVuPs5Apm9a4sUZI5hR
	 sdzqUMl6ILpZzz6BOWqPq+cTpQm5m7h+ZGzHIgs61ZBBTxwF5QvKu+Xe1nm+qit6A+
	 c1pXsiqJ3YFRLJ8qYQ0eRdGxPd5cVU0HNzvl+2BubvtjFHZumf5hiPGvHRVuipBts2
	 F4Z519Xa4mwpDjwMqFab0E/TWFOpDaDXHeB0xAJz7cUR1sQVCII3ICc0M17nsePPS9
	 TX1TJksIu5PSA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/3] Add support for Microchip PIC64GX Curiosity Kit
Date: Mon, 17 Nov 2025 16:53:21 +0000
Message-ID: <20251117-paprika-tipping-e7bb3e211d6f@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=pwCT9CaX9KdSL1R9EJYAgsxDoGAzi1p14elOWIrNg0E=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSQf83aKnZGr7cMfesi7CDwPT2PbmGi2ou3N8z6z/vz 3XHvxw53VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJvDvHyND4hIWveYLtH8s3 Xksdtp9+cpo5e8vTg4Gx+50YzYN7i1cyMlyxUIhP5Ntrsqzuy2Px7lK3eyu4t0reUS/9zv5Y6OZ Bd1YA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

v3 of Pierre-Henry's stuff from over a year ago:
https://lore.kernel.org/all/20240930095449.1813195-1-pierre-henry.moussay@microchip.com/
In it he said "This will be fix in a V3 coming in due time", and I guess
that due time was ~14 months.

I've cut out all the binding patches, to hopefully make their
application process more obvious to subsystem maintainers.
The only real difference in these patches is that I went off and implemented
the clock rework that I was asked for on v3, because it ended up being a
requirement for hwmon and pinctrl work on the platform, as well as
blocking this series (although it was obviously not a technical problem
with the v2 of this series).

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Pierre-Henry Moussay (3):
  dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
  riscv: dts: microchip: add pic64gx and its curiosity kit
  riscv: dts: microchip: remove POLARFIRE mention in Makefile

 .../devicetree/bindings/riscv/microchip.yaml  |   7 +-
 arch/riscv/boot/dts/microchip/Makefile        |  17 +-
 .../dts/microchip/pic64gx-curiosity-kit.dts   | 165 +++++
 .../boot/dts/microchip/pic64gx-pinctrl.dtsi   | 178 +++++
 arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 630 ++++++++++++++++++
 5 files changed, 987 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx.dtsi

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
