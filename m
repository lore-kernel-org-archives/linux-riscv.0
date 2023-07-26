Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB71C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 05:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4dGI7qo5G6nXS4K4sUBCwsBTKn3gDhOe49O5ZTu4Kc=; b=bNRLZBISC1xygS
	1TH89ETPA2mIw8oBpMcfb8h3g6jZ+5GWxJMDD+4VCwAZU9I36bKHJxabEL6QHHQ3O9J0Ze39JSNXV
	uBN3rFJZ9ZffrTC1wwkqERWx6hebsgfhktXdzqLQdiIqrBRi02x3PTh7lDrxrag9D4rwhxvVlCG89
	7S/9c/HO3/m2MuZBqmW50yR2k7GB8Y7v0EVxNSXG0wkBiLtjdu/S70mX1Oo86Hiy37v7xKx9EaKUp
	WpEYJzpqpgTMyB6I9v+pG7UZPEFV8BBZC4Bz5coJnGV56YyZZOlvBeQW1c7iNiu7BBFVIPmFq6F/d
	x/zN6d6wXqG7DzJB31yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOXK3-009Dni-1t;
	Wed, 26 Jul 2023 05:44:31 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOXK0-009Dmg-0c
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 05:44:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 8F7E3300089;
	Wed, 26 Jul 2023 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1690350260;
	bh=zrApQpHZ1Bczr/rz1I7l4s1dmzPJWqGn3glQZX6Wx6Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Transfer-Encoding;
	b=BCjxB7OBaGPYLzn3p/qjkYBBH2R2+Gp1TrsIPS9cQMby8hykZK51GnZiMi96KZLVD
	 qRCo6rXw1uHI0vLy0viWVsM3CEwwMEtPRy5LeRHRwzpgd42S8lK1ZZtYRWclAnxY2U
	 0d/XSFWN8qo79p1sVA7zyxgb//12Imi/BN/vmAcI=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/1] RISC-V: clarification of the QEMU workaround in the ISA parser
Date: Wed, 26 Jul 2023 05:44:15 +0000
Message-ID: <cover.1690350252.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1690006695.git.research_trasio@irq.a4lg.com>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_224428_689895_3B8F1415 
X-CRM114-Status: UNSURE (   6.24  )
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

Hello,

This is the PATCH v2 to clarify the intent and a non-working example of the
QEMU workaround in the RISC-V ISA parser.  Along with comment fixes, I hope
the commit message itself should be helpful to understand the workaround
in the ISA string parser.

v1:
(the initial submission; see the each PATCH for details)

v2:
*   PATCH 1/2 is withdrawn for now
    (now only comment fix; previously PATCH 2/2)
*   Other grammar fixes
*   Clarification of the commit message




Tsukasa OI (1):
  RISC-V: clarify the QEMU workaround in ISA parser

 arch/riscv/kernel/cpufeature.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
