Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251BEC10F1B
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z9nKxkZcfzMlaWESh5TVHKL/6VzT0iHrPFrkpNTgUMg=; b=VJzrokQrmtEJOP
	Uk1+aS4yJ4BtmxcCR5N3rVFF+DS363NFJt0YFQUo9r29OZEtJqoKWUUw6hBB+oefCXjPNjW00VA4n
	AWbo6EMdntERIIUUX3Fug0RcOEsy7QtSBDfDadO5XZ9aTv+geQPDTXP5XQj+SP5Eb8wWYAmVFDQYh
	Gq4bBDhUz6Nv0tAhpP8SR2LVNV9ABUXRvPbLbniPV9AZHhKud1ktWj8Lqe4tc7F/hvD5GpaFUXtec
	jNGfY8JrGHi0cL0+t4rhVCEUIW8UBU5B8MyY8PMgH0PsIGJbbOFAUZIsBvKnzdShvDz6Hk1kcP69V
	ZQjab3MVamdb2kTvAwkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wnn-00G9Gb-Vx; Sat, 10 Dec 2022 10:09:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wnj-00G9BT-M0
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 10:09:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D806BCE091F;
	Sat, 10 Dec 2022 10:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AFDC433EF;
	Sat, 10 Dec 2022 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670666980;
	bh=1e2h9zWuPvDzwbS9hi7jKUTtgujclYOSSbW661pCXiI=;
	h=From:To:Cc:Subject:Date:From;
	b=F2WFGkX+L68hGFT8r0tbzCbbKPi1IbeTDR5vTXt8Nl5/vISzWc7CGR5/8b5XdsIvD
	 P+U6QojelTpZGb91ZdDPgEvO1H1YtNYfNBiPdfA0p0WA6MVat5FW34nsACGCCooqRj
	 mNq2+VlNygT6Buns3kgPLj2MS95YzUC8zpelRY0OOdTyub43ueTg/TATsLJ7G8uTQc
	 J/jiGSaaXJVf1NXSNDsgR0lnXHz3npDaYq+cSe+alx7Lq47liDw3y2/oXtSfn0XFYs
	 LHPS4XL/fHYM/cMukTzwYRCNX/i9g4M6EpebCGnT+rC8OFwmGuhYP/5ql9C/iZ2OW6
	 K0UKhGSl4TNyw==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	conor.Dooley@microchip.com,
	guoren@kernel.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	jrtc27@jrtc27.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V2 0/2] riscv: jump_label: Fixup & Optimization
Date: Sat, 10 Dec 2022 05:09:25 -0500
Message-Id: <20221210100927.835145-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_020947_959546_89863B38 
X-CRM114-Status: UNSURE (   5.96  )
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

Patch 1 is the fixup patch should be merged into stable-tree.
Patch 2 is the for-next patch.

The series is based on riscv for-next-20221210.

Andy Chiu (1):
  riscv: jump_label: Fixup unaligned arch_static_branch function

Guo Ren (1):
  riscv: jump_label: Using c.j for CONFIG_RISCV_ISA_C

 arch/riscv/include/asm/jump_label.h | 14 ++++++++++++--
 arch/riscv/kernel/jump_label.c      | 30 +++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 4 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
