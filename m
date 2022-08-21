Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D1C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=62hMoY8nmC2uFiWKc2S/jvSEtlRiEXX0tB8EE6VmPFg=; b=DjmyJxqeVf8DN3
	GSiPBhJwXjgU8wvLrDK9ARL5irLao3u034zgWzwZ011hOemJNkIJcqbIuTwXsKY948tZaqq5RhA6j
	EKyNGYdR+FTA2W5vxjhpIyGh0RPQM/rfiNcMZEIHyD4w2dHGdgcalghkBM/R9c9/zP04Wh/2j64ej
	txSjmOR1MfoOpDhuxBmtXL5VrqWOURhAt8/ObpOAu0P2BgkQz1a96AduRr4YR0bjHF67YSbej0Kz8
	97x43HEe3mhoPQC9PgFjD1mA88WLcNwYmAsevOlv9dQ6RAc5WtCSlfD48301rHOlJeWGYUROaiWp1
	h1FXv7NYKK/i04x29yhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPoXg-00Ck7V-EI; Sun, 21 Aug 2022 17:15:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPoXd-00Ck59-Pu
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 17:15:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 17A6ECE098B;
	Sun, 21 Aug 2022 17:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE896C433D6;
	Sun, 21 Aug 2022 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661102111;
	bh=/YxzEa9cM7Ef+kzrSskBrq6YKw82hJWi2Yi0D4j4i8E=;
	h=From:To:Cc:Subject:Date:From;
	b=VaMwGGMGmaGF1+8f7BA8T3jnFyN9Y3T2yRQhqcuc7RHxaIBwXZJuLHqot010sNQkd
	 Dtv6hdBbjmTcW1p40l75tFJ5Onvn/KUl2WCeXWEtQgIuXfgY1+uO9g1Xb+iFa0aIF4
	 I/HZzurP1wDn+2Y4l11GZvnn6nUYTHPCmMYoXpYy4yxULHbKmHdycQWxC52ROn0Oqo
	 wcRYBRqctC135WPfKMfA+SRpB89PpJWR5QzLWW+bvk3zorwCt4ScVtQZDwonmxLKzk
	 fJ3ertrG9karfXrM7PGTxTzhDr8wyo5uTgc/37s2wk7L/ODNoNyqyg5NugrqokcSVW
	 ExAnTnGmale3Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: enable THP_SWAP for RV64
Date: Mon, 22 Aug 2022 01:05:59 +0800
Message-Id: <20220821170559.840-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_101518_053569_E799E528 
X-CRM114-Status: UNSURE (   8.66  )
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

I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
memory optimizations such as swap on zram are helpful. As is seen
in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
swapped out"), THP_SWAP can improve the swap throughput significantly.

Enable THP_SWAP for RV64, testing the micro-benchmark which is
introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
shows below numbers on the Lichee RV dock board:

thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)

Improved by 382%!

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..19088c750c7f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -45,6 +45,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_WANTS_THP_SWAP if TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
 	select CLONE_BACKWARDS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
