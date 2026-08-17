Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91512C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=po9bGhY0NBpxhsDIKCke8hJFvI4DzoGRbVBxOIWbjbQ=; b=2W1EKAGh0nsJZL
	6ZSwdC83+BAZNro2ytSn+tfBI864RNnv19WHZK/Hl5/Cze0y+yKrnfnpirovPe2sad4HFxUU5QSMC
	J05HcNjUIvfXeCFqJ2LyhHnnZzQNnXF/Ev7ljPbMVsDeVJKHzkfK2AqHqAZKxQRedjo359IvYPyC8
	pEfApqVnbGDTU2Frms1TS8QfKHLxkMzetFxdsbH9A3cYSAvmwcUF/UvFvjYPa/R+O/yG3xlmE2/4G
	Zz11x5ynpqJ2YDIHUhJZ0yUsdu+oOI8LVXPk5Cu0G9noUnEBbqkpo5PP6klOYlHv9nDVSqXhXZKIZ
	epufOhYS3liqWBmnuDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvo4C-00000005NAd-05U4;
	Mon, 17 Aug 2026 03:31:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvo4A-00000005NAV-0HAC
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 03:31:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E73460204;
	Mon, 17 Aug 2026 03:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABF41F000E9;
	Mon, 17 Aug 2026 03:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786937472;
	bh=toX/MnDHIJfbzMtrwLv5Ia5fgxHNg9bMGwJkF9+Vi0M=;
	h=From:To:Cc:Subject:Date;
	b=X8vLFnA65DVCR+2PGFO16WB2XwankYOHjBcqOiQIIO/XZxK6I6HFqy/zeUUBz/QNs
	 LFkkTPeum2HQXclxW5wh3/UdTFQp53NV0s0UeMJdgmvBuydi3riHumZJyf3Sfdm2J4
	 ieV/Bbc5rx2IEgGBV1m7S8YttUBs2LGngtCV3TlZYhWqi8o/pek7QovPue77wfcNK4
	 0mJT5VyjU5P7D4VUe37hWf+8EA69ZXUUbC6VRzhN7wIZpAt8YhjYxOaSclxQ574+2u
	 rqs0PKyadGuK5nFQU2Sf56l7ydewpK3AgoXC8Ffu9E0YSSbW91pPMkVzw1WPLEFShZ
	 zC3pDCTROJLTA==
From: Guo Ren <guoren@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: dlan@kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	junhui.liu@pigmoral.tech,
	"GUO Ren (XuanTie)" <guoren@kernel.org>,
	stable@vger.kernel.org,
	Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH V2] riscv: dts: spacemit: k3: fix IMSIC num-guest-ids
Date: Mon, 17 Aug 2026 03:30:38 +0000
Message-ID: <20260817033038.2286436-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The initial K3 device tree used generic/placeholder values for the
IMSIC guest configuration:

  riscv,num-guest-ids    = <511>;

According to the SpacemiT K3 User Manual this values is incorrect
for the X100 cores:

 - Advanced Interrupt Architecture (AIA):
    - M-mode MSI: 512
    - S-mode MSI: 512
    - VS-mode MSI: 64

Therefore, S-mode IMSIC (simsic) needs num-guest-ids = 63.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Cc: stable@vger.kernel.org
Cc: Guodong Xu <docular.xu@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
V2:
 - Drop the riscv,guest-index-bits change for simsic: the property
   describes the number of guest index bits in the MSI target address,
   and the per-hart stride on K3 is 0x40000 = 2^(6 + 12), so 6 is
   correct as is.
 - Drop the mimsic changes: already fixed by Junhui.
 - Reword the subject and commit log accordingly.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..4a4a9ec7c981 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1129,7 +1129,7 @@ simsic: interrupt-controller@e0400000 {
 			msi-controller;
 			riscv,guest-index-bits = <6>;
 			riscv,hart-index-bits = <4>;
-			riscv,num-guest-ids = <511>;
+			riscv,num-guest-ids = <63>;
 			riscv,num-ids = <511>;
 		};
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
