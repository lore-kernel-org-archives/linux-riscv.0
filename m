Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0FDC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IdR+8wqZwP9hJkD1ffOlQ7bP5MSzY1OSHbIeCTozUGQ=; b=xtY5RyTKVYRPW7
	n6ZrOcguZQ6tEffNExOvKavAdogZmJtIrrKegVfO4EqWuE1gfVnx836zCuyCO3tUzaahA6dHB1vwh
	KqlvHO9vHecprHZUjka7JxwzwrDS3xhipHo8R1aLbHKomEK35cEwMIQ1hxKZabApotgc+2n1D41x3
	5i2ZT+ghPExm4/kEI3IBQwak3o1Mlhrr46MeHsz8QgUxmcvghMNh+tRt5QaspKy1hwreIwZMuShUL
	KmVOMjhJo3coXBWpHKP0t9I54IXZ0w6ooB+7T9hSuEn+41clZwE6vR1AUeSKkmnBrF+nlgdN6kqZy
	lI0upi0I2iXP3LNnYPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiQt-0000000H1sm-1hXf;
	Mon, 25 Mar 2024 11:24:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiQn-0000000H1q7-2Jif
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 11:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4BC3CE1686;
	Mon, 25 Mar 2024 11:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34608C433C7;
	Mon, 25 Mar 2024 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711365833;
	bh=qqT5s5v8kHRYnSn/7vdNCIRU1OWwV2sCCtz6w1JM1Uc=;
	h=From:To:Cc:Subject:Date:From;
	b=eiBSWOIG2pSRASD6PO69pP2hPiCQKWE+AVg6i3TV6bCwHMH0ewGmYQ5ChxBRots+j
	 xacNlooNv1+qpgk4aXRe7X7q/Xtp0lmkwDmQa2xDL5MCgekHdADjWqmisgwY+eq8kR
	 dKhEY8AejhTpwQ+aup/+I78sGVjl0prRB3+f7UZuZrWuYi9140owjxaW2EibMAt/V/
	 JGVdl75CbIyxVe1lYaVyF7w3/YGvOrgN7XraaaW/J5Y3QW88ByToMWLYLGj9H5kLbd
	 QIJR5zGm7tUotSa7Q5Zycx/pu3mw9zqKtEN+DnQjddKKAP9ZLHTo8qeSebTVJlFuT0
	 evMHazH1Sj2Gw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 RESEND 0/2] riscv: enable lockless lockref implementation
Date: Mon, 25 Mar 2024 19:10:36 +0800
Message-ID: <20240325111038.1700-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_042357_969044_B9E5C391 
X-CRM114-Status: UNSURE (   7.27  )
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

This series selects ARCH_USE_CMPXCHG_LOCKREF to enable the
cmpxchg-based lockless lockref implementation for riscv. Then,
implement arch_cmpxchg64_{relaxed|acquire|release}.

After patch1:
Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
On JH7110 platform, I see 12.0% improvement.

After patch2:
on both TH1520 and JH7110 platforms, I didn't see obvious
performance improvement with Linus' test case [1]. IMHO, this may
be related with the fence and lr.d/sc.d hw implementations. In theory,
lr/sc without fence could give performance improvement over lr/sc plus
fence, so add the code here to leave performance improvement room on
newer HW platforms.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]

Since v2:
  - rebase on v6.8-rc1
  - collect Reviewed-by tag

Since v1:
  - only select ARCH_USE_CMPXCHG_LOCKREF if 64BIT

Jisheng Zhang (2):
  riscv: select ARCH_USE_CMPXCHG_LOCKREF
  riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}

 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
