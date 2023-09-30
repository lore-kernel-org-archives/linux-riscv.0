Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC0EE77372
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oYnCJljeii+um/rTJfWQBOdzgIzgvHfOglksjaO3X1o=; b=OgmfqXMPfAHkqF
	XkSHHXsFBnDLWKWY5WvGLjJ32O0tDGorO7NKPnVEgru6ohSzwr2CJLrjdAfT/UqOW7qR2v5g+Hz+v
	z5HCNvHfl4zW0G8B5ASoGN8dDQXpgkYZk9VvaTs18WgkiqwrgMq8yxUHxRl8wWlBhU1oBMMBy9OIF
	9QR5aX34K+LX3bS4bnYdqU1D1XBgqBMr+d1RIp3Ks4C1eU9dVH5251nHB+CRgaec1q/ZjeHbs2iS/
	FfK3BIihpKLZTrT+QAnBcMsQyl9hjH7FbajXLeHbOpU1zve6rz9ivjAvUFKUt1TkBfIT9A9EI/EdO
	5M0bB8622uX6dcNZe4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZRt-009XKP-0C;
	Sat, 30 Sep 2023 12:51:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZRq-009XJu-26
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 12:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2244660A5F;
	Sat, 30 Sep 2023 12:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E858C433C8;
	Sat, 30 Sep 2023 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696078312;
	bh=o0BDP7/qlpQFQEz4SdtV7n0arI35k2WTUQrSjrLMH8Y=;
	h=From:To:Cc:Subject:Date:From;
	b=AT1XpRJfxeXzvWQAjkpRWgnj+Of5ZAnVxc1AsCX/skmJb5W7yQIaShbKkrnIOT1o3
	 vzW3tZf040hAbfNU+bs+MZeUmPPxdf29L7wFCRG0WPJ5lyDXFaeEoN5VtZsHYUO7EC
	 UHlVZFzNvURcy0FLBYny8rGW60QJixaNQvEUZ0VIa4ANCWYD+nlPthyJtkHXuhjHAS
	 8N0tJpgpE3HGEADgGRmkmjYDUq6KUl22wTUnaO2kdjknjwOzWIoUY2bq2r1L2ajoTF
	 63A6zpTyyHdm9mk0zpwnQ+bL2GSAaxOWAGE477CNyC1qj1tZtTLyRws3ejQZkIIvY/
	 exGHvsv17DMkw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: [PATCH 0/5] Add Milk-V Duo board support
Date: Sat, 30 Sep 2023 20:39:32 +0800
Message-Id: <20230930123937.1551-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_055154_759231_98C2471C 
X-CRM114-Status: UNSURE (   8.45  )
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

Milk-V Duo[1] board is an embedded development platform based on the
CV1800B[2] chip. Add minimal device tree files for the development board.
Currently, now it's supported to boot to a basic shell.

NOTE: this series is based on the SG2042 upstream series for the vendor
prefix and ARCH_SOPHGO option.

Link: https://milkv.io/duo [1]
Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
Link: https://lore.kernel.org/linux-riscv/cover.1695804418.git.unicornxw@gmail.com/ [3]

Jisheng Zhang (5):
  dt-bindings: interrupt-controller: Add SOPHGO CV1800B plic
  dt-bindings: timer: Add SOPHGO CV1800B clint
  dt-bindings: riscv: Add Milk-V Duo board compatibles
  riscv: dts: sophgo: add initial CV1800B SoC device tree
  riscv: dts: sophgo: add Milk-V Duo board device tree

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   4 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +-
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  38 ++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 117 ++++++++++++++++++
 6 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
