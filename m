Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B15C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 03:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jnb2qfR+A6xAOlKyjqqrw/UcunCVxbKJ54IbwCaMb3w=; b=Nf873veio7D0BB
	UQ9pTDjuayPIrnoDpau+pZX3gngYcWxTxLWXUUujO8REA6H+NFMJCW2NFQyw0d0mWdipKWKLp1ncS
	NYzkfxtGYMaueSKqPLVBNIuXc1zJ5VSJsZXLCNf1kZ9HKS61b1AfwDn2lP7x3ytgeiqqLG/eGdnNI
	9a6c0TRDgzVK5bOehBDnhM7kdfWsoLPzCLxKLCQVsly2S78IoRVnqaLz4kYbZMF9RTsrBypBCoP6F
	/sUwo0OvRh/V4y4fzWoWUNOFmw9XLEL3vvBYo5DIqA8vpUmKzRIAnYX2DsJVsxfWzjfFbnsUKWvBF
	PvQjDXewatSfyVVi3wWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne7Xn-00BSbP-BC; Tue, 12 Apr 2022 03:50:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne7Xl-00BSan-4a
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 03:50:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 532CF61740;
 Tue, 12 Apr 2022 03:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B31C385A6;
 Tue, 12 Apr 2022 03:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649735415;
 bh=P9+O1kpUptYnKFD23NWAw1Xn9Hh0s8Rg+gBWuVO+Hew=;
 h=From:To:Cc:Subject:Date:From;
 b=dRKJ8Ovtpx0hFHCkElq0iMIL9BZ98ES/fbm4BQOSUJP+Ag9nH9qE1JChNSS9cQkRw
 IC2Fz5AXrSN6R5Kzlq7fB9yKqZwdMRGfxNZS/FzW87ig19Doc/z3rQLrcJl4r2QGqc
 RySZEYOZq/8CagzXX3CdP/nxKjp9BhJYNKE8MMm/Tz07ebnvNGG2EHgM7j4fY3M9yd
 YDH7fwe1r9r+ml4VoryrMUHa/ITMSWAGs0z/ZbdN1XYS+BvKXIX2XSI0jYCK4m3MsN
 I41hxKxwaPFhS5EH5dq7D6C1Hch0SJ4ZO6WEwsNAfQsDmlcY5RhNYMwC586Db4jXlc
 jOwjOyHOaMV6w==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
Date: Tue, 12 Apr 2022 11:49:54 +0800
Message-Id: <20220412034957.1481088-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_205017_299572_3E513EC0 
X-CRM114-Status: UNSURE (   6.40  )
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

These patch series contain one cleanup and some optimizations for
atomic operations.

Changes in V2:
 - Fixup LR/SC memory barrier semantic problems which pointed by
   Rutland
 - Combine patches into one patchset series
 - Separate AMO optimization & LRSC optimization for convenience
   patch review

Guo Ren (3):
  riscv: atomic: Cleanup unnecessary definition
  riscv: atomic: Optimize acquire and release for AMO operations
  riscv: atomic: Optimize memory barrier semantics of LRSC-pairs

 arch/riscv/include/asm/atomic.h  | 70 ++++++++++++++++++++++++++++++--
 arch/riscv/include/asm/cmpxchg.h | 42 +++++--------------
 2 files changed, 76 insertions(+), 36 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
