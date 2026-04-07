Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F0FF5104
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65cSj/QP8wOgUP8Dft6fksSxofFavRoxVF7R381imeY=; b=AJG+NiPL+8j/hc
	uFp0/a+KRq/1ccqddlBvLz+Xpb1f1Iz1pwfCOu0buCk1E8n8raBM8NYp3RHkVJIn6CKKfqmByg5Ki
	AyaH6ONqMAhCYJ2hE62Fzm+7+1rbNk+Jtd/G/DM4KIIOtQe0pom//o+tTzmGG3keDbDwYhs41g3Vl
	VfB0XwNc6ysAHUvc86RY0/6qhkL1HPuIGs5Nb5tjLiRqRiQgN4NvuwrBcA7+8AP3INOizhNaRiYOw
	AChEDawBUb1fFOK4DX2wUxyfdzYgpPPKXgtk1cOyfQ6IJOGPEOnbPsExG8fNr8821PQRYy37kSHCH
	P+o1GvBd0SYLMUgpkZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tr-00000006iiO-0tvb;
	Tue, 07 Apr 2026 15:36:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tq-00000006ii1-2FAC
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2653600CB;
	Tue,  7 Apr 2026 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690CCC2BCAF;
	Tue,  7 Apr 2026 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576201;
	bh=DH37cfEXF2cJHJVn2jWwCC2NApJXQp6lbIYOXvuL/Nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gY5FTdAjHMsB3u3f/z9odoG3ogONMZbnYaqZnbtpEpv2AGhJO9bqK5fZYl/gKY9Vu
	 VyMj1li0ySl0+gx/xDniAP4MModjatPU4yVZ4UFh3baCW5x+rrnb8WSEh45nhZX9w6
	 1TGBzzE/6IlXHLzLrzIDKjbTO9bSQmgFtyCFNfSHkea87aTMLoWEbM+NIre3bEfr6q
	 FK+bq34WTQrprDjgnqtMDHNfSjPAham/29IfPsxrQpEfU2B56dnXeF64SIIzwtmIgA
	 k5Kmd2d93nT4JoG1oTGhwzGznvavqsVugrZoW2rO70lVDyl0CHYf67GmjZdUrV8S0p
	 CiH92x8KWWszQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically
Date: Tue,  7 Apr 2026 16:36:25 +0100
Message-ID: <20260407-cable-manhood-afcbc9cc6765@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-rely-speculate-dae3a81ea1fc@spud>
References: <20260407-rely-speculate-dae3a81ea1fc@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VE15P75fuXqIekeKfGvIuqlcVQNDL/22CSYpQvm0hdU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXVSrsPxxUs6pMjlqz6vIk9ndLT1o8mql/Tu67zdnl5 1yWKCRXdpSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiV38x/A8/teL+Hc7lk+xE cp2evNE+/luroN9upofcgcCMQ1yaj9QZ/ucIaOtsrexTv2DTx76l3MSx+uTK1OVF3yaWL7OImBu rzg0A
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

The i2c nodes are out of place, sort them where they should be.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/pic64gx-curiosity-kit.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index ed3ff03f3b11b..ef5bff3093fc3 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -89,6 +89,14 @@ &gpio2 {
 		"DIP4", "USR_IO11", "", "", "SWITCH1", "", "", "";
 };
 
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
 &irqmux {
 	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
 			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
@@ -134,14 +142,6 @@ &mbox {
 	status = "okay";
 };
 
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
 &mmc {
 	bus-width = <4>;
 	disable-wp;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
