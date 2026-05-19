Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9833DCD4F54
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 04:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AS/wBGXl/y0vRDYvhNPH3ddpStlEfslv+dth0j08cn0=; b=o9diyz3c15PUgd
	f2RBzNXbuwJisaI09yunCqJKxyNgmy+WF1Bkrlzc5xT5fHALC2jWg/tByrmwaJZ22bA6JwBjpETeG
	OlAM22pWM/rSvoigeeQvpvTb8BYN0+vrhkqhw7cOfdnAC+ykZuOScFVHbSzYbRZ1G1tDSC+7UU5pt
	vsmgJ1X1eG9PZK0Nb1RlBcTR6r+E0NSp/N3bD7OOAdCD3ckRniF6AiDaqv3uDLbSEL3sLf5zhFtIL
	s2xnYkkiFhVv6FQoFG6qh+OZOzO9/dKKF+T7IMbFyrrikJgVS7Vb6CkzPu9g6mR4yOGG9I9pP5M4a
	7p4OFbYaw02jidzC7/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrW-0000000053p-3VgL;
	Tue, 19 May 2026 04:15:22 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrS-00000000505-15yk
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 04:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=wM4H58iEOJFXQLWNwkR2FmcvNn+x1jTyqvj3BChTMss=; b=NG2m1G6GxfGiHbGuQn6kUo2drP
	JQOh6frU1TtpzshZxfbua3NQvA/sm/17TJMFNHcaBp0eF3MlZRwMy+aNBD5AYC9rUQDzX++uh5gmX
	HsqgrdzvVWoFOkJgfCYGqpX8B/4yN0/NkDnfRVobBueRZfH4fPhaLUVKct+UWfueso1Z8gtDBpqC0
	N8o34186X/SvmZTKY/ixix/wU1du+yAbjZhamtGMAdaclHNNaBd2NiFPYeLS7YCStgq+47WTaU/9d
	T15eieUl7VKwpqzbsvX2yYda0CpzqJzMj7xa94PRLgjEqG3Tn63aRcNzBk0PkomQ/lWUNE6U1/6Va
	NtFePZKw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrG-000000032le-2MrT;
	Tue, 19 May 2026 06:15:06 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH v2 0/5] riscv: dts: spacemit: improve Milk-V Jupiter device tree
Date: Tue, 19 May 2026 06:12:34 +0200
Message-ID: <20260519041458.3287843-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_211518_308530_97881CC7 
X-CRM114-Status: UNSURE (   7.68  )
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

This patchset updates the Milk-V Jupiter device tree to align with the
changes recently done for other SpacemiT K1 based boards, including
enabling SD card support.

Changes in v2:
- Rebase on linux-next, which includes the SD card support series for
  the K1 SoC
- Mark the eMMC as non-removable
- Add patch to fix uboot partition offset
- Link to v1: https://lore.kernel.org/linux-riscv/20260514160356.1642075-1-aurelien@aurel32.net/

Aurelien Jarno (5):
  riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
  riscv: dts: spacemit: sort aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
  riscv: dts: spacemit: enable SD card support on Milk-V Jupiter
  riscv: dts: spacemit: fix uboot partition offset on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
