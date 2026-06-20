Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D1CCDB46B
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 06:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOrnOL7nBkmDgsiPJ6B+qNqgmeuYph/MquuPl1RNwwI=; b=2nvS44pGJAussN
	cXq1/PzmP6uMDKNKP5ZuTt6CtTJSAoyW81D4yK54e7RgzzmFYPa0WyR9hrRqIk2z3kw7BFeKcQ5Ef
	ZW52wREYkrjKWZVW5AXziWBXSFszr2qkvXTb8Plf8RG7HhOQZ6jitElDQVNd3u28zOfIx3u3QmREI
	TKSKoUkCTtsdM2/7OATW9Ed5BF7L+/2H3v7HRlEeFGIAjjgqm/DY+T4FhEpBdPR7fNxWyFXz5ivrv
	DS6jhWH/1U/bVbX7rblooUz6AvUC19KF2sElgw2TjPuDRv/jeUwpQgqnVnvRcRWFDnFwK/qF7K7OP
	Fm7AvOqG0J4cQadlWh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6e-00000003C9n-0b2p;
	Sat, 20 Jun 2026 06:23:04 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6b-00000003C7m-17yG
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 06:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=OviHOFRy1QWUk0+YOqcYp6zydhwgz85x/wivs9esC1A=; b=zqOgw3wpzgIniiz3sQ2AqZ3vSe
	afx+4G0HRtu9btU5ekCEm7EpZL6Ft1sXyHgfk5+k9ToQBYne2EOUq6JLCa6nZ5iY3iUCWcKQN/u7a
	7DbgSYIWL+u2q4BI+ql1z2wORq4NxY3UUSl+NI1zjzQ4Thi/G47JbPT+rD8xyX12WVjalTfW5J7nX
	G5ytOTEgfnv92tVTFjdIxMvkYNp+Q0JJ10cLCapuWpF5/kOkrZTZEAGl6Ttmo56maycuBqLaheI3f
	l5r+22MgjRvjnuaRUI6A9N7qmOx0qbBTH5DHQMHDDhGrX9uBxDTBTqA1QjPs+uVvFCZp4txHjclHF
	vaT5+RaQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6S-000000006dW-2NRh;
	Sat, 20 Jun 2026 08:22:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 1/5] riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:02 +0200
Message-ID: <20260620062238.3199108-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620062238.3199108-1-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_232301_307255_6D647A05 
X-CRM114-Status: UNSURE (   9.91  )
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

Because the default console's baud rate is not set, defconfig kernels do
not have any serial output on this platform. Set the baud rate to
115200, matching what is used by U-Boot etc on this platform.

Fixes: 7a6131804986 ("riscv: dts: spacemit: add K3 Pico-ITX board support")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e6649..509cebc0c9568 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -18,7 +18,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@100000000 {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
