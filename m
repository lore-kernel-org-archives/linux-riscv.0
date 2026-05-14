Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1546CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0OYGzZytcEf6Lr2fHk/2XDi4EB2NW32ctL9tDeoC0Ck=; b=PEuQslVZ4v1k4D
	vofkOETmk1hN4RfRRcVlkRLKnfz+Q+cIMDcQv7OKN1V7CiEp9a+IDT1csJEK3t72pMb70k2Q6IF46
	UCdXVijwx/D2+318zoljDPLc7sLUTErj0w0sa9pwCEoin+qcDjizqSWdKDS3iSuCGb5FtrcDhKNL5
	66K5JILTziqlhnFYNrnfH7/BNSACpTCwWETJ+wmgfWK6sGFNNTIfA8N3YAc+ZuvowCOrV+YojAjWk
	MFI2gmjrZPUMTu+CIFs2tvGTlqUKthmrc135MKgAIj39i665gLLrrojj4UMO2HRBenJe2Uz0wahhb
	5X+cvTX4iWnKSQMtPr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYYD-00000005zG1-3bqJ;
	Thu, 14 May 2026 16:04:41 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYY8-00000005zBN-0GPp
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 16:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=JARAgOxWgx/BmBgpATzav7ngBmd3um0PYsWZ9kX/7f4=; b=D6kV5Dk9H5LOFeb729H2DsI0Bw
	c5djFikSM0W4LPoJcZgvA/6Y6HEZ35S2pzSjM/C+zlNA1RHazDJB/wKWiU+uigd5q4hkTUTl7OIWe
	xfM4/cMHw5v6g/MFjLax3KTDfbGeo+hcXVQDRmyHOP5xQjIfBewzK22wSCwdUtZAushQDnkorwqOs
	PbBr68U8WevDnGtmmCv9G2bnmrOXLKJ+joB+cMpzMrajPW4xoVPilVIFl1F+y4yqxpBH6uJcO00va
	58BbpPpcOZ2op42Ydn5vsvX03ZDGk7uVnO01yVFNtnqCKdSryfhKecmE0TMyxQbiUABs8ztFVSm0G
	evVb99Qg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNYXx-00000007W27-1lZX;
	Thu, 14 May 2026 18:04:25 +0200
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
Subject: [PATCH 0/4] riscv: dts: spacemit: improve Milk-V Jupiter device tree
Date: Thu, 14 May 2026 17:56:20 +0200
Message-ID: <20260514160356.1642075-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_090436_104814_2D60A386 
X-CRM114-Status: UNSURE (   6.42  )
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
changes recently done for other SpacemiT K1 based boards.

In addition the last patch enables SD card support, but it depends on
the SD card support series for the K1 SoC to be merged first:
https://lore.kernel.org/linux-riscv/20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com/

Aurelien Jarno (4):
  riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
  riscv: dts: spacemit: sort aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
  riscv: dts: spacemit: enable SD card support on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
