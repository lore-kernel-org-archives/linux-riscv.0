Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE50C79F82
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 00:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k06D6qepbD0nWMJZURCZZzRd1I2oN+MtaWAMRST049c=; b=XmnySkX/nW70sF
	4GZIfQCcWAAlIZBcmfj5lsgGQgOnIMuFoA972X4Rx3CGYrnvxrXYAIRCPxGLxKCXmTro18QLhn2sF
	d19mcoLPbhP7Jh+GZRdPMyXzUghQhq2EpoED0uLGZfwn89+O3pyZ/2yZcNyX14Qnjwgx80YIAVN0P
	m7nVmdf5uL2NLzU3AyBxkugqOCnzwz880enAcidz7Iy+n/bTC9lgpJOVjCCYL65+hDGR+cNQjzP1J
	EY8wtzVGuU15OYKC0MDTh9ydvfZZQrjFunT+baU7KKrJGbVoZ0eoUbCWCy4UcwERJhFdZD9ZqxB3y
	Cv3u5eCsqYVRSUXMrqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45vy-0000000ATyk-0fBt;
	Wed, 09 Sep 2026 00:13:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45vw-0000000ATye-3FyZ
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 00:13:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 285F443973;
	Wed,  9 Sep 2026 00:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAD31F00A3A;
	Wed,  9 Sep 2026 00:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912780;
	bh=aHlmPL6QBAJM0yWWQKBL0jzKhUApocNgYUMEhjQYmOA=;
	h=From:To:Cc:Subject:Date;
	b=cgeWwwaZTplPX21uoVIX1qisk1UxgM+t2r9k896OCRsrt4AVQYzQtqKW5wcy9978p
	 eZoz9Ywm0b/6VlfwMXGwJpn3Zwrpne/e2sLvW7PEI+/g4267hAm14k6YdE9cBk8KOL
	 9/TVqhc/CfQwizoaxhs9EyQtq67UM8EBpG05BvJC12VVb6dzo9k1pnuQLAUTaw/axc
	 ewdB7rU8DlMmuAGR1zh1Oi0bDf+UNJM3jTJRL9AsMJa279F4WVOPA4dSdkJqlDt0FU
	 dDf5c8VCBD0QGgWOA6+GxfxNKhRmmgQlq1YEj++/kQ741/t9cRDgJjMc+aEbFvKJHP
	 Rhu8m5lWb5O8g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] riscv: word-at-a-time: improve find_zero()
Date: Wed,  9 Sep 2026 07:53:09 +0800
Message-ID: <20260908235312.8440-1-jszhang@kernel.org>
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

Since v2:
  - fix wrong version(PATCH vs "PATCH v2" in cover letter

Since v1:
  - rebase on the latest rc1
  - Use if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))

Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB
  riscv: word-at-a-time: improve find_zero() without Zbb
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
