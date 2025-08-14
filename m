Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4300FCA0EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/GI4B9LI2pgNq6s9dRofQTVsexr/Unse1VjXcAllhhg=; b=tOtBHGbLAqJlsm
	o9iqc3RtmUt+vyqz+6Ziz1dy58mx3A0K5jFB/kRDS9DEUcz4FBLkds37mYRqW8N7T0suHimWdmVXD
	LQuLdkXyk438V7zj33+AEFT5nwjXzDfNRZIXjWhgKi6IPSJHpfQywo8xv7MNQtsuLF535qwm8PqnU
	tuIJTLyroWpUbEI0J8LDqzP2HQuICbQLsXiPrV2n4pwEF8n08PXg2j4O+dx+mYcCUqppm5y/nAxay
	vzKLl/qefpChQrYiZI3VQ48+sx4s4/9eVOuDIf8FZKyxcQ0/jhe/HutAAa+5nR1uGWGgaSnd/5KoM
	jz61GIPnPDDLnB9ZFA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXms-0000000GxPT-0KGR;
	Thu, 14 Aug 2025 13:14:34 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umS4X-0000000G2J4-3gyO
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755155298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IY0TyYGEnYgW6vCsjXDw/T/qi49rCrlXY2ZhA7XIn36zbQAwmONr43oUlDHv7eGihoGWvEfNpvjtY6B7GoISZzOKIRxo30TzXq95uxO66Krhb5MY9v6NFWQq6tdVeKQGrZDQPqfai9KRiUY0Ri9TbuA8bjt0hIvI1Mnct4/5iPs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755155298; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5EDAGFHJuC9tPrNz6YQCZPVDFGTy8SOuvDsgiiHyCxU=; 
	b=X5CoDENaz14mkXuNh7l6nUEjtxk6NcaRNIoTqBD6OVvqn56xfREzLmD17FaDfJLYMReigYbh/+OGcevfuU4IVPT5/qrP2N28qVj7rRSMOrqoLL3r9zn5va++771Al/01YUMwHp0cMx0ckA3dP3wCBKKOoHS64YZHnLs8xWjqeMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755155298;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5EDAGFHJuC9tPrNz6YQCZPVDFGTy8SOuvDsgiiHyCxU=;
	b=CeKvNwY0RoVu+SSNWIhoN7JBCB3euGdh7/JdgG/E8gqCLd5kdzmqYAqFBQzOfiVd
	J+/ZBmOgwOxO2IZqWR06Hm1LtfaTtmpFIFjVPZl67CmXfapjodttx0vFMuTt286eymO
	RGYMPCMvIIU0x/UwZhO4cxAt3PygyckJ4fTkhd2u3l5HfMIr2DiKCWyGbPudKr6jaic
	Tzi188EP5jr0Gas4X39o3uDpO3PkjGGx55OgsZUb1nRXgTXEQUH4hquDnJxClLu2tyi
	sxQgbQnvYzi6nxGAe38jpAn7AgvwxTDbawCr6lkBBIpLUmGd4LlTAeaTZKVtJHjmwfh
	oIm2LrGGpA==
Received: by mx.zohomail.com with SMTPS id 1755155296251591.0287398528361;
	Thu, 14 Aug 2025 00:08:16 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 0/4] riscv: dts: thead: th1520: Add mailbox for SBI-to-AON comm
Date: Thu, 14 Aug 2025 15:07:53 +0800
Message-ID: <20250814070757.2267325-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_000825_991389_6B6DAA3E 
X-CRM114-Status: UNSURE (   8.26  )
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

In order to make system suspend / CPU hotplugging to work, the BSP
OpenSBI wants to talk to the AON firmware, and will parse the
information needed for this communication from the device tree.

This patchset tries to retrofit the thead,th1520-mbox binding for the
C910R mailbox, and assign it for SBI-to-AON communication.

The binding seems to be badly designed, and the retrofitting process
looks quite dirty. Should we just abandon the current compatible and
make a new one with a more proper binding?

Icenowy Zheng (4):
  dt-bindings: mailbox: thead,th1520-mbox: retrofit for other mailboxes
  dt-bindings: firmware: thead,th1520-aon: add a mailbox name for SBI
  riscv: dts: thead: th1520: add reserved node for C910R mailbox
  riscv: dts: thead: th1520: add mailbox channel for SBI-to-AON comm

 .../bindings/firmware/thead,th1520-aon.yaml   |  7 +--
 .../bindings/mailbox/thead,th1520-mbox.yaml   | 49 ++++++++++++++-----
 arch/riscv/boot/dts/thead/th1520.dtsi         | 20 +++++++-
 3 files changed, 58 insertions(+), 18 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
