Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF7DC61DD6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 05:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fT3MmOjMDOHNYgaACarlor9nuUjBYfqx4b/paukuAPw=; b=gXUI/KaZTSBlrx
	/4cSpgV3JYrQvzbxPovvaqtYC75RFqZbMgM4ClHKsy/VWL1x4ZtmyifXjF8VyR0nu5AvWr34dTHhF
	5/h+I/m61GCQxxzxfEMHgzEJVWOzNYWIbXTN0hx3Y0FkygJKKMdxmxJMGu9ZXmuiBSMrxLdJF+xO/
	wZkifm28J9MMHgrG/RPdx+sDE7Z8Rt5Fp07dpO4ujb6iXZfYmR+7y43hyi+vS2J594dKoq1z7VekL
	L7O7Q4C/8GxTMSaE9w1JbXcNCyDvRPvqA7+Y6Zflt8yMraP3OQcl5nfxxLELNwKDqqMH1iZ5MxNvW
	oBdU+mQE6yTIRWmbD3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Gbb-0000000Azhg-02lC;
	Tue, 01 Sep 2026 05:00:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1GbZ-0000000AzhZ-37WX
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 05:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2C7B403B0;
	Tue,  1 Sep 2026 05:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112741F00A3D;
	Tue,  1 Sep 2026 05:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238816;
	bh=rVEVnDnCmmIl7ecM8N8brK3OzzR2flC2RoMKBklo9CM=;
	h=From:To:Cc:Subject:Date;
	b=jLZaQ4Skqvr1D2wbpHRCHkQ1S5WURRMU5fmKvgZlFHz68AioJKX7cMPrebBltqwoB
	 6WXoqSSN9KTgKylsPSdfgVGx7AyHDC7l6WXlFZcKtLnY0/A7dMLJJuAb8RUZvb2MPk
	 NDc1J//F0ZKg4/u6I9DSpzXJbMzCpytqLR2IU1NqZYwa3OiopcKJkvY3Ut+xJgEmh0
	 5/DBeEBnHrOwuQHzDUD7i7IUDFE/1bORTq0goLIUcQY0eeOSw1sPtlecQvtcZRmk5g
	 7hXtaiFlOuvNGaT8QSPaFbhKQLJp8jVPYwatE8RHnb+YeQ6gYe15ohocSpyf4tCsXG
	 QCY6EaJ10hTyg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/3] riscv: word-at-a-time: improve find_zero()
Date: Tue,  1 Sep 2026 12:40:28 +0800
Message-ID: <20260901044032.5635-1-jszhang@kernel.org>
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
