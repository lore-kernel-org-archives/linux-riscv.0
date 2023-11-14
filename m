Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2F0C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SOyQSqBU4vKZf0Bt48vTJ5YASQI3U0xjFHGDa+bvphA=; b=PlMlvrUiaAYcgw
	20M01cxXXm1Utw5K5O6t9cNMGY2bWHaDO+GURdyiFcyZFE+uo4KCjQPMQHF7Z3u8FCYmcMPXV2Q3V
	vO/oC1OzbXLnfxuBrWKWLe/VDbjwSa6uu/2RTOJa9usBi6DdsTXKsYXzIg8AIrungZraC/Le3inrR
	J3pFe9709JvEQmkTtOJZMyVStGiyFNyq2wSlCda4FFVZrg6I6AfDI1RzobM04hW7NW8NsS1itbkyg
	8j0Z6WrCRW/G3rBGwNMfIVw+/2oCvZ78x7qjs/NpvdOjRlMZuPPczTYHShGZUtv37iEa51kodXYKb
	XLeV9K3Pe5ekoV6mcLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ufy-00GFA6-2X;
	Tue, 14 Nov 2023 14:46:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ufw-00GF9a-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 202A561307;
	Tue, 14 Nov 2023 14:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C316C433C7;
	Tue, 14 Nov 2023 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699973158;
	bh=z1pm6buW7ZPrKt2TauADLrqPVq3fh/nOdfjF6mt+BNM=;
	h=From:To:Cc:Subject:Date:From;
	b=rVQqLCH9RYYQG1ODw4+cBHyWhY++NX4ltchJARQctk6OlmOtkOd3az2gsGOYxRSYP
	 Up51X/vof2D1AhJHxsWYCgF8n6iIWYtHiVGw+VqA3mysv3bx0uoIaldLBsFCMPAgMA
	 8Mn0GyRbJ4d6gdy8HQX8FayG+ERzSyuFtbfOOdokZnCFdM76cq3zTulshU8i285m2z
	 2nn99hFfJ2wUTFhELpboyLoclS+0RMcnOd7Zm8I6jRAohKzFnPDThsXl18SDE2kSGL
	 gfCjwKS4AgRzvaFTS+X9x/k9k5ygbuBamr7ulspl74jBmszEoJMltbF+YT1Gv4gnhx
	 7KSqrOPTm6tdA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
Date: Tue, 14 Nov 2023 22:33:36 +0800
Message-Id: <20231114143338.2406-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_064600_584688_3C0A27F5 
X-CRM114-Status: GOOD (  10.42  )
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

Previously, we use alternative mechanism to dynamically patch
the CMO operations for THEAD C906/C910 during boot for performance
reason. But as pointed out by Arnd, "there is already a significant
cost in accessing the invalidated cache lines afterwards, which is
likely going to be much higher than the cost of an indirect branch".
And indeed, there's no performance difference with GMAC and EMMC per
my test on Sipeed Lichee Pi 4A board.

Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
the alternative code, and to acchieve Arnd's goal -- "I think
moving the THEAD ops at the same level as all nonstandard operations
makes sense, but I'd still leave CMO as an explicit fast path that
avoids the indirect branch. This seems like the right thing to do both
for readability and for platforms on which the indirect branch has a
noticeable overhead."

To make bisect easy, I use two patches here: patch1 does the conversion
which just mimics current CMO behavior via. riscv_nonstd_cache_ops, I
assume no functionalities changes. patch2 uses T-HEAD PA based CMO
instructions so that we don't need to covert PA to VA.

since v4:
  - rebase on 6.7rc1

since v3:
  - collect Reviewed-by tag

since v2:
  - collect Reviewed-by tag (but missed them in fact)
  - fix typo

since v1:
  - collect Tested-by tag
  - add patch2 to use T-HEAD PA based CMO instructions.

Jisheng Zhang (2):
  riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
  riscv: errata: thead: use pa based instructions for CMO

 arch/riscv/Kconfig.errata            |  1 +
 arch/riscv/errata/thead/errata.c     | 69 +++++++++++++++++++++++++++-
 arch/riscv/include/asm/errata_list.h | 50 +++-----------------
 3 files changed, 74 insertions(+), 46 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
