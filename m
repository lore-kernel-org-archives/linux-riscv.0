Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09768D2D0E8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3qkDaZenRszs8SCQdg+Np4+RgXZt8gkKLyNNFOYe750=; b=HzbmV0zig9wXgD
	SoZ5zQvUyYOOH3xX+X/vRmNrQK9YdBHjjBvD6gQBgkMX7Jg0Bkk5J8GgGAMSwfZyZqnmVQGKrHzKn
	DcQdfPhv8/wkNwqnoZNn3XIpLVcLEJw0mRP+Lmd74XKiNH64vRxEtX5CIshY6SZNR1cQ6XYSBVuUs
	fDWl5BfXUXS0IPY5uoBw5ageW5BFqjSdDrKnngNAp5xcxfSsc8qljIK2oxPGVYz+ptvbCR4e3H0Pn
	V6vlyRyIsnObvbtInPC1EOMpu9LEEMx7LjX1SfpAQ1Jii8BCjBCTo8VdneSWPqqyCZy4532E8x6pL
	NbGSSQjOhp4CVM6v2X9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdjv-000000076Wp-0hsR;
	Tue, 13 Jan 2026 12:43:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdju-000000076Wb-1Fw7
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 12:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB2A26000A;
	Tue, 13 Jan 2026 12:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72978C116C6;
	Tue, 13 Jan 2026 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768308193;
	bh=NfeZf0TnPY7410h7rGkeymXivD7y1mkFjmZR3zo/LXs=;
	h=From:To:Cc:Subject:Date:From;
	b=fZZknozkQpye/GZKCJT1zM1B8IH4H/Lh3/epDuMFbfjsbko9+MSs0aYurgQUebTOw
	 OCb0zI6WmG1jEpRXjhGwd2abH3nYTweAdh8XGNuMyuDgUBNrGRqxkvp+UhuiWvkR5w
	 8T8mktdsfqFPtsnpgGth/AAYVbf3Hq73xJYEpsXhBnYXS6YSscmuv9lJyI2KSYCFMp
	 Z+8rgpvFVcbD+oNgve7re9+wCiyMb3FmHQQLiJSJH4WkV6gcowXFCyUbmYWmp1c9CW
	 szzCvv5Pe5PbdbC40Z+gW8H0YyWk+30wdb6BoymmI1UihRcbunImTog/+kEL7qe2AM
	 2Xev2uywHqpzg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: word-at-a-time: improve find_zero()
Date: Tue, 13 Jan 2026 20:24:54 +0800
Message-ID: <20260113122457.27507-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Currently, there are two problems with riscv find_zero():

1. When !RISCV_ISA_ZBB, the generic fls64() bring non-optimal code.

But in word-at-a-time case, we don't have to go with fls64() code path,
instead, we can fallback to the generic word-at-a-time implementaion.

What's more, the fls64() brings non-necessary zero bits couting for
RV32. In fact, fls() is enough.

2. Similar as 1, the generic fls64() also brings non-optimal code when
RISCV_ISA_ZBB=y but HW doesn't support Zbb.

So this series tries to improve find_zero() by falling back to generic
word-at-a-time implementaion where necessary. We dramatically reduce
the instructions of find_zero() from 33 to 8! Also testing with the
micro-benchamrk in patch1 shows that the performance is improved by
about 1150%!


After that, we improve find_zero() for Zbb further by applying similar
optimization as Linus did in commit f915a3e5b018 ("arm64:
word-at-a-time: improve byte count calculations for LE"), so that
we share the similar improvements:

"The difference between the old and the new implementation is that
"count_zero()" ends up scheduling better because it is being done on a
value that is available earlier (before the final mask).

But more importantly, it can be implemented without the insane semantics
of the standard bit finding helpers that have the off-by-one issue and
have to special-case the zero mask situation."

On RV64 w/ Zbb, the new "find_zero()" ends up just "ctz" plus the shift
right that then ends up being subsumed by the "add to final length".
Reduce the total instructions from 7 to 3!

But I have no HW platform which supports Zbb, so I can't get the
performance improvement numbers by the last patch, only built and
tested the patch on QEMU.

Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB
  riscv: word-at-a-time: improve find_zero() without Zbb
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 47 +++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
