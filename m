Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3655C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YO490W4EptDpFB4dde9kLELj2D7pp9Er42Kj9GfjifI=; b=E82OO94FFhT4Nf
	iEyI78AshmCarcq0kqLEpysbH22XMUZrImktPhrSb1e+L5o9TDGIHadWVJ8PRA383wWtZz4rPHOML
	UQqlZlkK1d1aANlSQTHNhXHxVkdbBHSAwvMoSytqGcMQt2H4sZywpZstCNAOWAZO8h+N6bnCaXQdm
	jVd8KV7G8P32SkKUx9qC4+2PspohvwC8+7oLlKbZmiQ/xlRGUQWfM8kndL3glBLC/RevjasETROVD
	6OYJyODUltwu+DvQvmBkzNo/iOJXvHMxxbm6RTHKb9//yYMKqvWb00t0ejk6BK1d9QWFaiVnE31fZ
	IrhQtuGjC3PVCCZKXKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFeM-004Pua-0f; Mon, 06 Dec 2021 15:11:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFdz-004PlB-1Y
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 15:11:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1301F61330;
 Mon,  6 Dec 2021 15:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F0EC341C5;
 Mon,  6 Dec 2021 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638803465;
 bh=qfmITF7f/5VRc/TWy5vem0/292bk80Zd+3Le10rukNA=;
 h=From:To:Cc:Subject:Date:From;
 b=V0sOT6+Bl8qa7Rg0yXZi3VBmyjK4EBAPsgSl4BF8nI0GVIQQwgNVAUp8FHWesgvfk
 ra/mLRT0lmfTcZKCpm8KywmtoM6aq5RCx6KsbhhmauaA+81DuyNKTqSm51gthD/zud
 SFJv3ixxTzePOJ6iUyF7LxrFRXsDMGSJL1dy110GTFpFG6J1An85/+bL9NuYAb0UlD
 6oEsK64rOGP7OXMyNRt3dAiHXTFxEPC2CkhqwueviEU3rvzOdmgdBAA4G4h6aLyn7V
 AytonzkgIx1VOKppxD+uWYJzG9TIZk8poELwPbEsIA7uvqHxrJXmO8U1ZBIlCJyBeR
 mMz9cndzoL4OA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] riscv: mm: init clean up #ifdefs
Date: Mon,  6 Dec 2021 23:03:48 +0800
Message-Id: <20211206150353.731-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_071107_194352_75653ADB 
X-CRM114-Status: UNSURE (   9.14  )
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

To support NOMMU, XIP, the arch/riscv/mm/init.c becomes much complex
due to lots of #ifdefs, this not only impacts the code readability,
compile coverage, but may also bring bugs. For example, I believe one
recently fixed bug[1] is caused by this issue when merging.

This series tries to clean up unnecessary #ifdefs as much as possible.

Further cleanups may need to refactor the XIP code as Alexandre's patch
does.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/010607.html


Since v1:
 - collect Reviewed-by tag.
 - remove the __maybe_unused used in max_mapped_addr declaration.
 - remove the BUG_ON check of mapping the last 4K bytes of the
   addressable memory since "this is true for every kernel actually"
   as pointed out by Alexandre.

Jisheng Zhang (5):
  riscv: mm: init: remove unnecessary "#ifdef CONFIG_CRASH_DUMP"
  riscv: mm: init: try best to use IS_ENABLED(CONFIG_64BIT) instead of
    #ifdef
  riscv: mm: init: remove _pt_ops and use pt_ops directly
  riscv: mm: init: try IS_ENABLED(CONFIG_XIP_KERNEL) instead of #ifdef
  riscv: mm: init: try best to remove #ifdef CONFIG_XIP_KERNEL usage

 arch/riscv/mm/init.c | 76 ++++++++++++++++----------------------------
 1 file changed, 27 insertions(+), 49 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
