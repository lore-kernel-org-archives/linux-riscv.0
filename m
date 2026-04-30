Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AD0CD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOICyoWOpELAg8IQkUGD330lrsl/vQ+0fqQEuWz7FQA=; b=hIpqDWbRr6U9oR
	LkdMT13PVrQ+PWbtEahK3GWEBQ6v/Z3o5PzVSrvVpF46cFnZ+K7rJUHO5fkOBk1s0PQ/HBPR03Z2O
	SwNWLI5b4noQJSJcJwtv4/rV8zkqvX+3ic5U7GYpfD+0NJvbBQpDfSdEyrUonCd+uxLwRtbSWgGCL
	knlMqaWPUpCklUdQOgrszr0yXMufw5bTYod+gLhra/IKdQJ9aHNTaLVVcG9tsknabzJHStTTn0k15
	Sq9RgC5xK+8miV6Q2EbgWSCK6//q4kbyur32dupMaSCi6Id42de7mlYAEG/uPSWHIA0AjxGA71CF8
	riKgVNNJvuliKXRy6p7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWUm-00000005qSi-3J40;
	Thu, 30 Apr 2026 18:52:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWUk-00000005qSN-2yRN
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 18:52:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88D1B43C93;
	Thu, 30 Apr 2026 18:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A79C2BCB3;
	Thu, 30 Apr 2026 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777575137;
	bh=7ryAeRblcPWnwSjPRvoFAvAgofVV8hhRtulzzlp5ePw=;
	h=From:To:Cc:Subject:Date:From;
	b=G8A54/ODPxbJlb3id7uBBZqmtwkcT+Bhb99lBx3MVW0+qYf4ug9I5TcmSTAUTxrqi
	 RE7V+zQTuKzBDLtv5d3SbJL1mXJu7/ybSRJClEiFq8EVNfHwtHccUeV2j1iCxeUKEY
	 FbH5WSdsllKyFblIJ/2xaMl0ZFrIb1Nlw9vvnz2RGEYSTwxlMbpiVgHJRNMOrHflY9
	 O0e9x/MtPOW1BIGc+gZapX/sQRiz34b33C2FzR9V1QHNl2bD5uwW80lRZJHuviJAEN
	 gwherCHmJqB1yR/ICu9dITjOGb8Gph3MY+3yFqVLRzXoCs3ZsFCOQFExiNrwNanF5C
	 d4h1WM0S/0KUQ==
From: Conor Dooley <conor@kernel.org>
To: spacemit@lists.linux.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Date: Thu, 30 Apr 2026 19:52:12 +0100
Message-ID: <20260430-reword-overstep-3be08b7eab25@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZzIyf8kNpSShxQake71q8Bn//zWKDFH9gBDY8/gGuwk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmfl9yJzI3N0Hpmfu5hlL/d5g81aqerzMwlPmieYrx3R 0nmxceNHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIZQZGhjeVuUWKdt9SMqrd VU7MNbL3lX97Ovv3plPxbLPVfvtMZ2D4H7dqzTfpTfds9p068CRtpoNx2/K5Xr21b29z5h2Renb DgREA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_115219_155977_00A7AD65 
X-CRM114-Status: GOOD (  10.34  )
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

Because the default console's baud rate is not set, defconfig kernels do
not have any serial output on this platform. Set the baud rate to
115200, matching what is used by U-Boot etc on this platform.

Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
Fixes: d60d57ab6b2a8 ("riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Yixun Lan <dlan@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93db..333ac8ebf3f51 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -19,7 +19,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
