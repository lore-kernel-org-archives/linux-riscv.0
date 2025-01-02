Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54DEE77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 20:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SG1+mZ3iBNZ35kINo9tUd6ZaTXz4W7foLINgTXOxW30=; b=Ez0LmZc54vDHOb
	EU8XPmWZHTkBnRjdOm2Nnh+MfC2kI4psR2E7gK3Cukb24PcNxsdq8/yEIfhJS65HtlMSCxVtlFgm1
	aecEcv++CRx2Lgpf7d7Q+4l4QLeph5E+sXv9KAkTULQBOs6x19UENFwTbcCevu9mE7/aR4BVHQIHM
	4Vxzmtc6rXifRTWJQSshYWULCzOnia8LLR51onlcz317rjbwkUrOlEpTWC4lEryzBaFh2A5u+EiZ8
	ZejJTjR12Ni+oZPLH6S9tyxjcIsC+62loWJBdcY/jaT5CzDCDRstmzPD5InjI22CQaBCZSkLtL0EI
	o9UdZzxCV/B2PudDmIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS4m-0000000BQFl-1DKC;
	Thu, 02 Jan 2025 20:45:52 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS1C-0000000BPcA-0Pu8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 20:42:11 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DF5C7B220C7E;
	Thu,  2 Jan 2025 21:42:05 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [RFC PATCH v1 0/3] riscv: dts: starfive: jh7110: More U-Boot downstream changes for JH7110
Date: Thu,  2 Jan 2025 12:41:20 -0800
Message-ID: <20250102204137.423081-1-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_124210_312226_4A2681E6 
X-CRM114-Status: UNSURE (   4.64  )
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

U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
with JH7110 VisionFive2 board target (and related JH7110 common boards).
Sync the minimum changes from jh7110.dtsi needed for boot so these can be
dropped from U-Boot.

This series of jh7110.dtsi changes is RFC as being uncertain about what is
required for boot. Testing, review, and suggestions are appreciated.

E Shattow (3):
  riscv: dts: starfive: jh7110: add timer node
  riscv: dts: starfive: jh7110: add DRAM memory controller node
  riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot
    loader

 arch/riscv/boot/dts/starfive/jh7110.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)


base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
