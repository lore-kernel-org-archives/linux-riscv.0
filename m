Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCABEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 06:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5gQp/MPCu0rhhEMWJklcZ18DuEm24MZry35m1wpFKjI=; b=CU3Ac7nTg1EZM+
	7bgGFkGSq8o/ko9ucSupzrQq/O0rVyFKhb1izpuDeLu1jveDMmdbb1YMYnH+6GACeGKDNgxHeeMkt
	R5+PfsaUG9EfruJ+nL61N4B+foUHzM6+/evzwEAmfb/a3MrwqgZMtHA+7uRSMmWyFS1s4RrLqt2SY
	HWVRQ50b3Cy3Yn6q391xeUiKJdyGrAc5VorjPVZeBxfV8Zr5bRFq72U9RV0/w7UpAU+kWkxUChqDm
	vkf5SmWshA6YJ0UgDK6LG0rnA8/f2TJGB/gdVkRCC0KLP5tsj278Ns3Tdq4SEq6CCaxEAtba9mcPK
	/Fyr7JhhBYgO+BTUJ64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN611-00FwDn-17;
	Sat, 22 Jul 2023 06:22:55 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN60y-00FwDA-10
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 06:22:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 3EC27300089;
	Sat, 22 Jul 2023 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1690006961;
	bh=6QvYNuDgqW4yU0Tnx3bP9OfKhn3SbeMldcXlojg4zHE=;
	h=From:To:Subject:Date:Message-Id:Mime-Version:
	 Content-Transfer-Encoding;
	b=gswblEGpQ15Ad1eY+rKJ5jM89hP5bF9b9HJwI2oI9GPSQakIlosbBeXUkJrbwqXKx
	 7NS3CGSf6IZqgVGIrvoS91KnmKpuX4Dx/yaar8Gd1RMHiYUmX0YXqjoKPq4D20g8eg
	 VVSFUrR/iHBexYewoUZEBn2fUK56KBRoYp1dgyiQ=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] RISC-V: minor fixes to the QEMU workaround in ISA string parser
Date: Sat, 22 Jul 2023 06:22:36 +0000
Message-Id: <cover.1690006695.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_232252_801270_66C1DF4B 
X-CRM114-Status: UNSURE (   5.10  )
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

Although hardly functional (mostly editorial), the author hopes this to be
useful to give less confusion to kernel developers and improve
the maintainability of the RISC-V ISA parser, including the QEMU-related
workaround that is "fixed" by this patch set (intended for QEMU < v7.1).

v1:
(the initial submission; see the each PATCH for details)




Tsukasa OI (2):
  RISC-V: make ISA string workaround case-insensitive
  RISC-V: fix the comment for ISA string workaround

 arch/riscv/kernel/cpufeature.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
