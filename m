Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5886BECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sRX7uC1qO4ltB0Olk2Skk9dvupsHJ2zcgh0jAbu5sd4=; b=ijihbNq6c32gjb
	hrJBP2+fHg/FP7IRxFj/78bBuE/fXjELhM5Rg1f9MwZqTE/+es+vigUrYvFpMYwcJP7+H8py9T6uf
	k4aT+woCxCYM00dhWFobrQtjV2an3+EpATKlR1c7UEXLW9Xw6rHdHO2rVQzZjHdMSeBXDkQAjkFeq
	2zECnCRh3fyqcqrWUjRCH99ZysibcLSTkzJCDxHk/YK2MVvjMj3nSrPrdEUqenjbMq+DWW9uMJd0O
	oSkW4gVD84Bznrnd1dpjPw1IlNs5tv8YP/lbowbEcGwJGLSYW/pE3DjUr7ee7o04xbB42HANfCchU
	u4Zh4ZYtXdBNQJOdpTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVw0-00DXMd-FN; Sat, 03 Sep 2022 16:23:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVvp-00DXAI-Tz; Sat, 03 Sep 2022 16:23:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7382B6010E;
	Sat,  3 Sep 2022 16:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357BAC433D6;
	Sat,  3 Sep 2022 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662222219;
	bh=VwwOXJImNZSacIylO5PCh0kYdKDhH9SoS9a2my6P4Y4=;
	h=From:To:Cc:Subject:Date:From;
	b=N3TNQZmCWEBrVbWy6swUqBf+C2W/wMtI95XWC8cOmI4MvR5NcTE6h51nWCrIjSlBO
	 cmcarQ2uFFwOtZifMPk0GLORkQCmJxK+an5f3aFQR8Xz6wY+I/IezDM0TpKfLzw0hJ
	 wJQPenP0cWUS9RaDccXxnVUi2pcRli0rZ4BUzxHZrylvlQngPiJeyyA1LhonssVpDn
	 OjymH9H4a1BoHKcdZqh9EBdo5M1Z4eUHm71+/COidRP9+EcdPfXFkCehqa6IXnUlbr
	 Vmh7U0EMYSQE51Blweln3ZN7yW74dvqqsgoWAew74j6xsDRbcIj3ziwvSTQdXlmR1c
	 7l3d1nifZ2bfQ==
From: guoren@kernel.org
To: oleg@redhat.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	monstr@monstr.eu,
	dinguyen@kernel.org,
	palmer@dabbelt.com,
	davem@davemloft.net,
	arnd@arndb.de,
	shorne@gmail.com,
	guoren@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/3] arch: Cleanup ptrace_disable
Date: Sat,  3 Sep 2022 12:23:24 -0400
Message-Id: <20220903162328.1952477-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_092342_047844_263312A1 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This series cleanup ptrace_disable() in arch/*. Some architectures
are duplicate clearing SYSCALL TRACE.

Changes in V2:
 - Rebase on linux-6.0-rc3
 - Add Reviewed-by tags.

Guo Ren (3):
  riscv: ptrace: Remove duplicate operation
  openrisc: ptrace: Remove duplicate operation
  arch: ptrace: Cleanup ptrace_disable

 arch/arc/kernel/ptrace.c        |  4 ----
 arch/arm/kernel/ptrace.c        |  8 --------
 arch/microblaze/kernel/ptrace.c |  5 -----
 arch/nios2/kernel/ptrace.c      |  5 -----
 arch/openrisc/kernel/ptrace.c   |  1 -
 arch/riscv/kernel/ptrace.c      |  5 -----
 arch/sparc/kernel/ptrace_32.c   | 10 ----------
 arch/sparc/kernel/ptrace_64.c   | 10 ----------
 kernel/ptrace.c                 |  8 ++++++++
 9 files changed, 8 insertions(+), 48 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
