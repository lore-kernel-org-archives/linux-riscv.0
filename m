Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAC4C47DDF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VPuOsK5g/xuE8if6WcVXwXHp5wK+OM5LOLVPQxiuMuA=; b=aW1CgREFZf1deu
	s/ZdpN0TxHyCR4K4+e/EwgdTJvuP6sL3ofX/kgVrs+xIU91bfI7K8srKSFaLv+M6wBAUejFOFsSoa
	XcSKmInXp+m6rcdIGUpN9aCoIwGH8Lkuvb1d1W1lIFFJ18ANzzt09nEWJ4MFTNLc0M1VWlIKjvikE
	VWP+Shs6W72qS6isFpLsMHTJ1+gfkEOYN2HKYhPl09vcdC7W71dCdeV2+vfCajwxqJxty6fTUeuDK
	roaIYXllQhWnKTGsUpdAcG2vkYYHCpNw84oBAXev8F/lULQGgeialh24NIaBtJx7ilA2FAlcOidFw
	Ag9QObHAW7rese3sm6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3Fq-00000009JMe-2xVA;
	Sun, 28 Jan 2024 11:23:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3Fm-00000009JKF-1Xr6
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 11:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA1EDCE0925;
	Sun, 28 Jan 2024 11:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE08DC433C7;
	Sun, 28 Jan 2024 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706440983;
	bh=FoqEX1cRVe0NITYGpOghxAdM7Y1pgwLjfNaiHFus6Ts=;
	h=From:To:Cc:Subject:Date:From;
	b=EkhrNOQ6ulzMyD9V4IxKWn9bKK2oTSCUhJqxcv3YDM1s9DanNaBph3qAaJ16mTOoC
	 9iGbMhn9M6p641OQhYqNYOQcFJd9nnWNphe22vARm+EjUAQJYIwZPBReBGGy7cPAQH
	 zdUlJsivPFe0HRbgC3XUXAPSxAC71dDBbnB8bh7kPj3CiiN7RZuZrBCBayCogEL/Au
	 YRt+IPQ85RTh8IOXU6ORn7kufldUbS7AVBeo3JGdWoqHu4VD9YgEreLiFfAq1i8uvm
	 SXet5T3SpLyS3YzUmTPZOvYEd9hug4TUK0CYSH+N4+qIX5VqAOlg3jnCamLyHUAlHT
	 g0/FbtHw78raw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: optimize memcpy/memmove/memset
Date: Sun, 28 Jan 2024 19:10:10 +0800
Message-ID: <20240128111013.2450-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_032310_603802_2DAB74D0 
X-CRM114-Status: GOOD (  10.59  )
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

This series is to renew Matteo's "riscv: optimized mem* functions"
sereies.

Compared with Matteo's original series, Jisheng made below changes:
1. adopt Emil's change to fix boot failure when build with clang
2. add corresponding changes to purgatory
3. always build optimized string.c rather than only build when optimize
for performance
4. implement unroll support when src & dst are both aligned to keep
the same performance as assembly version. After disassembling, I found
that the unroll version looks something like below, so it acchieves
the "unroll" effect as asm version but in C programming language:
	ld	t2,0(a5)
	ld	t0,8(a5)
	ld	t6,16(a5)
	ld	t5,24(a5)
	ld	t4,32(a5)
	ld	t3,40(a5)
	ld	t1,48(a5)
	ld	a1,56(a5)
	sd	t2,0(a6)
	sd	t0,8(a6)
	sd	t6,16(a6)
	sd	t5,24(a6)
	sd	t4,32(a6)
	sd	t3,40(a6)
	sd	t1,48(a6)
	sd	a1,56(a6)
And per my testing, unrolling more doesn't help performance, so
the "c" version only unrolls by using 8 GP regs rather than 16
ones as asm version.
5. Add proper __pi_memcpy and __pi___memcpy alias
6. more performance numbers.

Per my benchmark with [1] on TH1520, CV1800B and JH7110 platforms,
the unaligned medium memcpy performance is running about 3.5x ~ 8.6x
speed of the unpatched versions's! Check patch1 for more details and
performance numbers.

Link:https://github.com/ARM-software/optimized-routines/blob/master/string/bench/memcpy.c [1]

Here is the original cover letter msg from Matteo:
Replace the assembly mem{cpy,move,set} with C equivalent.

Try to access RAM with the largest bit width possible, but without
doing unaligned accesses.

A further improvement could be to use multiple read and writes as the
assembly version was trying to do.

Tested on a BeagleV Starlight with a SiFive U74 core, where the
improvement is noticeable.


Matteo Croce (3):
  riscv: optimized memcpy
  riscv: optimized memmove
  riscv: optimized memset

 arch/riscv/include/asm/string.h |  14 +-
 arch/riscv/kernel/riscv_ksyms.c |   6 -
 arch/riscv/lib/Makefile         |   9 +-
 arch/riscv/lib/memcpy.S         | 110 -----------
 arch/riscv/lib/memmove.S        | 317 --------------------------------
 arch/riscv/lib/memset.S         | 113 ------------
 arch/riscv/lib/string.c         | 187 +++++++++++++++++++
 arch/riscv/purgatory/Makefile   |  13 +-
 8 files changed, 206 insertions(+), 563 deletions(-)
 delete mode 100644 arch/riscv/lib/memcpy.S
 delete mode 100644 arch/riscv/lib/memmove.S
 delete mode 100644 arch/riscv/lib/memset.S
 create mode 100644 arch/riscv/lib/string.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
