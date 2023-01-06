Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2ADC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 01:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9pVdaNk7C0DLsggBpwZExIK77FtVlB0eTdRT9K/VDc=; b=NQFi/j7WyuS4N2
	ocbsvv/bHNG0VORHeTBDXZKugfLtieMogwTUVc2E1E0BCt1E+qLsrEjsmQm7PYdCaM8qhPKvJz10J
	Ekx+/w+Z2L38tXldPiKOFJMOIELAZjYoYL21PVTUbfWN0r4dkbNjE1pbwTId0pIwUjZ3pXrjzyTDC
	mF6eQC8jTn2OPjyvW54sDPqZOuqqAu0l6LHpncmtSUrheEdPnGCXiL6YxuFx/Etk10vwgv6Ab9m1s
	UepSzqbucAvijeg9cOFOWV2PtfsvpfNFsCEAyOf0Qm/w51MTsBIw/RFELOrOmcjfjpgqCazLZ6l8O
	amN1Ks5ertWPykYzurHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDb9c-00GhII-4G; Fri, 06 Jan 2023 01:04:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDb9I-00Gh6D-Se; Fri, 06 Jan 2023 01:03:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55B0612FC;
	Thu,  5 Jan 2023 17:04:33 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000253F23F;
	Thu,  5 Jan 2023 17:03:48 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	=?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 1/4] dts: add riscv include prefix link
Date: Fri,  6 Jan 2023 01:01:52 +0000
Message-Id: <20230106010155.26868-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20230106010155.26868-1-andre.przywara@arm.com>
References: <20230106010155.26868-1-andre.przywara@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170357_008681_65D51D42 
X-CRM114-Status: UNSURE (   9.45  )
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

The Allwinner D1/D1s SoCs (with a RISC-V core) use an (almost?) identical
die as their R528/T113-s siblings with ARM Cortex-A7 cores.

To allow sharing the basic SoC .dtsi files across those two
architectures as well, introduce a symlink to the RISC-V DT directory.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 scripts/dtc/include-prefixes/riscv | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 scripts/dtc/include-prefixes/riscv

diff --git a/scripts/dtc/include-prefixes/riscv b/scripts/dtc/include-prefixes/riscv
new file mode 120000
index 0000000000000..2025094189380
--- /dev/null
+++ b/scripts/dtc/include-prefixes/riscv
@@ -0,0 +1 @@
+../../../arch/riscv/boot/dts
\ No newline at end of file
-- 
2.35.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
