Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206E0CA601E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qo5ZpZwwn6ee1D34usCF+uZDb+MZU1PIEOBRqCTJzDQ=; b=Wpg+4CB0FBBmZ3
	I0sKR3MoD+FjOQA3tqofeR7c8mjGtOhCf730pnFLaz+6g2qVtXj3dC+V4OMTXidV/SCaq5Q2ygwVp
	DX3Jv+7b6g2ASx0qvgGWdqekzlTxOvQbTZ2BbT7zv+/deta/hP2cuRy78oxit24vYoUojQHCzw2zT
	AB4swapye1udGhzsdcjr7EHrIWxukHxpfTZukncZnVSKEx3QJNfXJ1TWdZv/PZx3LxQ3HNazWOxW5
	PxypIbB3jNw4qz1d4Q2rCmJ1tDsbKg6IiyIYmJV7H3EcpL5WGU0bFnQ7kjqE9I9y4Cc0I0dEjlU8F
	IWSkFYuhdwIEzHasv9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKZZ-00000007Lrx-0n2d;
	Sat, 10 Oct 2026 00:04:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKZY-00000007Lrp-0awN
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 00:04:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E33FE60211;
	Sat, 10 Oct 2026 00:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9421F000FF;
	Sat, 10 Oct 2026 00:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791590658;
	bh=NFvj71R+I3vUUj1f/B2usaeSFh/yQzsOo/5M2fDlCjM=;
	h=From:To:Cc:Subject:Date;
	b=Snrx+lw3mk8ALrVcHbk095e3kJ2a5vI0eBAI5Em7TH5cJN092h8reP89wnij3dU3K
	 Lz1ikSFhjjTLr/XHZSsxiMZkadI4tP2OMJjRzwN2qXxUiNcgpl6drKwFoiTk9z/pRz
	 kX4HwTNYX+7dBGLH6NYgwSsVACPhkEKIZRqKXBuU5N4mt88LEtUhoJhFjbI3mREa8+
	 koFqGGWDX4DoOFV4S8jdQC0zADsg4AS62Od2lDNR4TAurhP+Za4gYL6l5FY+Bc8A6U
	 Z+aU82jUBVjnRqiOdRMviO5OPayglWkwtnRd1BmA9KlmcFn2LpXj7OlCC2jgcUIRHt
	 2frbv5b6emnGw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] riscv: word-at-a-time: improve find_zero()
Date: Sat, 10 Oct 2026 07:44:17 +0800
Message-ID: <20261009234420.29425-1-jszhang@kernel.org>
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

Since v4:
  - fix commit msg of patch1
  - collect Reviewed-by tag

Since v3:
  - fold part of patch2 into patch1 and make the RV32 improvement
    as patch2.

Since v2:
  - fix wrong version(PATCH vs "PATCH v2" in cover letter)

Since v1:
  - rebase on the latest rc1
  - Use if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))


Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB or no
    Zbb
  riscv: word-at-a-time: improve find_zero() for RV32
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
