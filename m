Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62434C7EE39
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 11:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/NGFW7NBshc3dSTUL6VVd9UKBOaR/6yn6pbMPbX+3c=; b=4UljaoHESSJ4z1
	te0+16XMxENPy+2QzZi+ha2pygykWSHVogEWkud40Sf0dakJ3cY2kLdf2ZTXGLWUDOOxpoevaazVS
	hXYCYwJJ4qPA6tNFpp4Drcrx1WMQ5xvC6nKyie2yAvE8vy89cygtO1hw+GTTnfC8idCGC2rNZQLGw
	ISdMhujOxuGjHta67zZUUIAvB5C6BUKH3LBwudhjZ1t7pL3PY0uL3MA3CHJMCTe2nJUpp8s/qxV+a
	wzA3mYwXBfMOxsMwedDi3wlduwtnRZHlaOKJxa7H/lu0k4Dpckqx8Te9u5zVgVFela1r7xOo1uYiM
	ZI9dVP/Hgfi9L3Zwz/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCw6-000000024tK-1G0V;
	Mon, 30 Jun 2025 11:44:34 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCcb-0000000217r-3hTC
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 11:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1751282666; x=1782818666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rtGozj1Eecsc0Y022urCuSqjhAue5dzTmGXqpT9ZSF0=;
  b=Ie4vjYc+6Ek4Ii9w2I1SUANS20+m1s1bWMFoJyPJAU2XxXbZHrdSOXuN
   UGxVN9zenT1HprVW6Mcz1H/rQZJrQRFbyeIQBbf11AuujfMqHWX504JFH
   9aSZGIM5/8RCtKZLy2H5rF5dqV5zQ4YSySkGMJP+O/FNkyR9VWLGppMgw
   96KtSr8XRPahFWdq0hHgfClovtOVR0lYMTQZ3HPWj69JYMcOD06ySlYa5
   FBnILiPLsH9orL2BLwDh4K2PPp2fjuyNjB3nXYdIbQoEr3B5lou/FyR0+
   feeCFBqdYuw7VVOOEvdhcfu0l7vxqJkKBBG2Xagb8CjqBvnkoifLEf0cm
   A==;
X-CSE-ConnectionGUID: /8xEBu/PRPGl5Ten3WctcQ==
X-CSE-MsgGUID: m67o+qpgTwiK4wRqK7ZKeg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:24:23 +0300
X-CSE-ConnectionGUID: IGZG9yLwTFKAHMP+1UGyIQ==
X-CSE-MsgGUID: bfdPHOXyTq2LEkMUeDkMhw==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 30 Jun 2025 14:24:20 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Mon, 30 Jun 2025 14:24:21 +0300
From: Pnina Feder <pnina.feder@mobileye.com>
To: bjorn@kernel.org
Cc: alex@ghiti.fr,
	bjorn@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mick@ics.forth.gr,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: [PATCH 1/1] riscv: Change memblock reserved name to be recognized on kexec
Date: Mon, 30 Jun 2025 14:21:30 +0300
Message-ID: <20250630112309.97162-4-pnina.feder@mobileye.com>
In-Reply-To: <20250409182129.634415-1-bjorn@kernel.org>
References: <20250409182129.634415-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_042426_224400_766C6A11 
X-CRM114-Status: GOOD (  12.79  )
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

memblock resreved exposes as Reserved on iomem,
kexec tool doesn't take those parts to vmcore, but
the kernel use those address and it needed when opening the vmcore.
Without this fix the crash-tool fails.

Fixes: e94eb7ea6f20 ("riscv: Properly export reserved regions in /proc/iomem")
Signed-off-by: Pnina Feder <pnina.feder@mobileye.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 14888e5ea19a..16e0cebed170 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -249,7 +249,7 @@ static int __init reserve_memblock_reserved_regions(void)
 			if (start > mem->end || end < mem->start)
 				continue;
 
-			reserve_region_with_split(mem, start, end, "Reserved");
+			reserve_region_with_split(mem, start, end, "Reserved-memblock");
 		}
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
