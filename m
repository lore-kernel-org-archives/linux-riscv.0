Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E703C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 22:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HFFHvQumMvuSYR9Ppa8wexYJM+o504K2l5DvKBSx21o=; b=kE+Vrw7r3G83yG
	zpOWhozbEu1I9aP8GGyt2joxi4yt2F2VIbmsrIQkpWAsKJR2QVtJ1UIfI5n1aXXyiOXLoxrRd/3kT
	ud91rpte1Db2oZKQeUmccNHqWneLkR7DMbA7NHCAbYSdJGOP/Ksdi9wNY2QBaJP5gPqmc0aF9/yM+
	+uwEHLRRf4YeYUWRKa7z3onbt2iE069NopxYbe2BKslfLz+WwhzPuIHjIIALIMgBnBTnoExhEFc4W
	d/jbLL7HV8x8Z3arMtpG5S3V8OxZXD0HWiGxk8BjmTtlmd6CBLut3QeG54ty8R4WA2W0gSb9jofrs
	hf1gfMtfSwKNT6poLvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtJx-00H7sf-Ke; Wed, 08 Feb 2023 22:53:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtJt-00H7q8-Bz
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 22:53:42 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pPtJi-0003OP-FW; Wed, 08 Feb 2023 23:53:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	ajones@ventanamicro.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 0/2] Small fixups for the Zbb string functions
Date: Wed,  8 Feb 2023 23:53:26 +0100
Message-Id: <20230208225328.1636017-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_145341_435177_92B210A3 
X-CRM114-Status: UNSURE (   7.85  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

I didn't manage to address Andrews comments on v5 [0] in time
before the series got applied, so here are two addon comments
that hopefully do his comments justice now.


[0] https://lore.kernel.org/r/20230117122447.y6tdsmsxqdwf76ri@orel

Heiko Stuebner (2):
  RISC-V: fix ordering of Zbb extension
  RISC-V: improve string-function assembly

 arch/riscv/kernel/cpu.c  |  2 +-
 arch/riscv/lib/strcmp.S  |  6 ++++--
 arch/riscv/lib/strlen.S  | 10 +++++-----
 arch/riscv/lib/strncmp.S | 16 +++++++---------
 4 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
