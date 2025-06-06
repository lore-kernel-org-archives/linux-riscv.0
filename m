Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891CAC61CE8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 13:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pp6WsvaHBmP+R/zDnTIMnDplkkF9LKJfg4RJiH41gB8=; b=jOQ6fVqtqaPo+W
	hWHFpcXm9C+zp8SStdVe53yO6WQnz1t4Q/Z117wrZ/70ASWia7OeB5EaCvDzhsX69HhnkgbxETaQL
	TRWt88V+I8hz9dueMiXxI/ntzEmPHoEHH9pqAzCiSecTu0oeDID5ZDJWuPQWMQ1QT3IMYh2zoGtcF
	IRWR2FSRUlL5aZvHrDuv+hR+XNOALh8+e5GHC6qODb8bQ9aMNc1zsZ4qRTFyGTD2HsU+lqyajmHxT
	y2w0BufQNT5Zyqar2rqiEbaHP8qau8yMSZUZCXTxyAn6tEwlxQ5Ql4yxKkBe4qjJ1810D3WCh1wBQ
	CJbk6kh4pl29SokGKZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWkA-00000000IMo-2Sdd;
	Fri, 06 Jun 2025 13:04:22 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWk7-00000000IMQ-43TD
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 13:04:21 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 95339B4C440C;
	Fri,  6 Jun 2025 15:04:12 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: E Shattow <e@freeshell.de>
Subject: [PATCH v1 0/3] riscv: dts: starfive: jh7110: More U-Boot downstream changes for JH7110
Date: Fri,  6 Jun 2025 06:02:35 -0700
Message-ID: <20250606130253.1105273-1-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_060420_171530_D65A8D1A 
X-CRM114-Status: UNSURE (   6.53  )
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

Bring in additional downstream U-Boot boot loader changes for StarFive
VisionFive2 board target (and related JH7110 common boards). There is a
memory controller with no downstream dt-binding; create a basic dt-binding
(and not any Linux driver) in support of the memory-controller dts node
needed by U-Boot starfive_ddr.c driver. Also add bootph-pre-ram hinting
to jh7110.dtsi needed at SPL boot phase.

Changes since RFC:

- Drop additional timer node from series as not strictly needed for boot.
- Add patch for starfive,jh7110-dmc binding
- Adjust ordering of bootph-pre-ram hints to follow devicetree style guide

E Shattow (3):
  dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
  riscv: dts: starfive: jh7110: add memory controller node
  riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot
    loader

 .../starfive,jh7110-dmc.yaml                  | 76 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 22 ++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml


base-commit: d50108706a63dfd896db42172bf9f6aebec219c5
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
