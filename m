Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC42C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 21:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rWFQfrEbBRnOhQwFrrDi7VMd2zs5q1/r+z4oU1aC+Xk=; b=GmNuRsSVq+2vvP
	0RfQgoc2ebbCjncx65IfW+27qDmayrs/X05L/ZdfjyCss+PeML+61TJWwWGaBKnRwgIjOdK/dy47d
	jRLoFDh5dwDLubYU94tainJC7ZQawdZRwDWveoFTIhi2U0pgHlS58otnROs4vrODH7ysNMI8PpBXe
	myD0sPUHDtnWKnIrO2sA9bnJUyUpND3Nupz+s+RXjpg09vltyf6c9crmJRCCj9FMCkXO8esM0fGk8
	kMF0AyfY/tLwoQsHLZGZSZWZAYq09fB62Kle0oZtiZu5F8i6C20TbAuvsUNxilDfiAjj+8k4B6LsB
	AC8X/lY+vrE/1cHQeXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeaw-002UGD-1n; Tue, 07 Mar 2023 21:11:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeat-002UFp-Kz
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 21:11:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 08519B8117B;
	Tue,  7 Mar 2023 21:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BF7C433EF;
	Tue,  7 Mar 2023 21:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678223492;
	bh=EXDC7T0HCZ9zuW/vJJVnytDmH8Dd+fNhlSzYE22XptI=;
	h=From:To:Cc:Subject:Date:From;
	b=nPnkaV5pie3+a9dEYCF0fGOuO9TLLI3z+zjk5ZMAjPDwLoIASU7muMziAk36Z5EyY
	 Xk90gZv5tjWNo5GyldUrUS2Nhbmy3sOMAnOxm7FzRdF43qIOKo4sw5PaKjHpyLkgst
	 CGrjEdC8rTBFYE0W6Fs81yrTKJ+vwRwb4FCSBwmDcdn8N5ZEWGNvnW4jSgCrCz6YUk
	 LHPIGxBe6Llg7EUbRIFt1jB6Ah2IQPBqwEONLKV14+tNHDPXtFtVOZ7Lc/ibmHbXZF
	 Ww28x8i++ManhHO3J5cTD5PKuBNGlvXUOQGFOinNRcqTTrPcUsc3thBxrBdIS8OJZG
	 iCzNTNM8PYmBQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	dare.mcnamara@microchip.com
Subject: [PATCH] riscv: dts: microchip: fix the mpfs' mailbox regs
Date: Tue,  7 Mar 2023 21:10:54 +0000
Message-Id: <20230307211053.1777066-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=conor.dooley@microchip.com; h=from:subject; bh=BSoHV4C5qWQHkzZKNa27YCOlsu0iTMfw3c0cj0wSf14=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsK2K8J+/Ie7VfOl4t4W2XfvHXX22Wp8Qtjk+K/Dhv1 sOS+YYTO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRD3EMf7jf5C22eHwvWLWk M22h2vmt8Qnik7hk559rW39tzezaVZcYGfZ3v/g9/9Iep/MCT8vUNab9k0ieENBzL385B2/Eevc H15gB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131135_869797_AEAAD890 
X-CRM114-Status: UNSURE (   9.90  )
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

The mailbox on PolarFire SoC should really have three reg properties,
not two. Without splitting into three sections, the system controller's
QSPI cannot be accessed as it sits inside the current first range. The
driver & binding have been adapted to account for both two & three
ranges, so fix the dts too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 0a9bb84af438..62b1aec4ffff 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -498,7 +498,8 @@ usb: usb@20201000 {
 
 		mbox: mailbox@37020000 {
 			compatible = "microchip,mpfs-mailbox";
-			reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318C 0x0 0x40>;
+			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
+			      <0x0 0x37020800 0x0 0x100>;
 			interrupt-parent = <&plic>;
 			interrupts = <96>;
 			#mbox-cells = <1>;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
