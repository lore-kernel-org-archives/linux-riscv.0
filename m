Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A898C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpGHIaFGYX/0KQ1U/uFlZrAR6b0ZAfPs97ZxAzn8i58=; b=iMslAFAq7XYiED
	7Q57rMztp5RfK06ilxu/lX7cL+vcMJFvpW1/Fd7D030ns76wE9SEqIK0dG5d5RccynfiPiOmwaRGF
	chtJbTRjrZGEyREU0iX0AEhRdDULSHen8aVMT/pzUSPxLGQPv6OOX9D5ApSgld02wCxDnqAKWpuBH
	R6Tb5pX05TcwH9N3u03zVCilQWrzVokyT9kg5M1ti93D0GKQ+Xw6XIJXmsdEg7yGxsT3cDVi/m9NA
	i2whMyqrq6qsKSoyWN9iwggOCcTN7SjIhkRUCL/IPd2Tm9SBA4Jx7jC3xrSb4hfLQpkf84p4WH3Tg
	N/CvhhDLe7fxsevYr0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcry-0000000Ejzc-2QjX;
	Mon, 24 Feb 2025 18:07:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcqQ-0000000EjYu-1pXj
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 18:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70E2D5C4B84;
	Mon, 24 Feb 2025 18:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC5CC4CED6;
	Mon, 24 Feb 2025 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740420376;
	bh=fLLXimX9ynfgWBIWIxxfLc92QfSdbBwQm11gCIosTSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeCL1aaOnkeSIok2hceVAi8lIKo0Gd4fEIrcc1zJ5cdsXeHxoXEGWnCJ/hADdqtdK
	 N2ZDtbNRLQB2sPslywxDh9nlot8TGDfheps9d8+lVu7aAevaB8CNT3G9axE6AMPAX1
	 crWe0y3wP8oDb5e3mhXjPGN1bKvvrD20v9k4LMywQCaf6DththB+6ElignJRB8oV1B
	 pDo/yyC7d8EvipgNaI5sMlJcxzGtgPHVOHmXHYNobbLDDbPjUOyJz2aYaBJkvElT0S
	 ydYJt3RRTKBKERUOZFR/s82jUGV08OaAD98VyZeAEahBrMI5r/UZsfFIQ7YPeGkd9d
	 bwwgd03l6/Hsg==
Date: Mon, 24 Feb 2025 18:06:14 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 0/4] RISC-V CRC optimizations
Message-ID: <20250224180614.GA11336@google.com>
References: <20250216225530.306980-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250216225530.306980-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_100618_529178_D39767FD 
X-CRM114-Status: GOOD (  15.59  )
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

On Sun, Feb 16, 2025 at 02:55:26PM -0800, Eric Biggers wrote:
> This patchset is a replacement for
> "[PATCH v4] riscv: Optimize crct10dif with Zbc extension"
> (https://lore.kernel.org/r/20250211071101.181652-1-zhihang.shao.iscas@gmail.com/).
> It adopts the approach that I'm taking for x86 where code is shared
> among CRC variants.  It replaces the existing Zbc optimized CRC32
> functions, then adds Zbc optimized CRC-T10DIF and CRC64 functions.
> 
> This new code should be significantly faster than the current Zbc
> optimized CRC32 code and the previously proposed CRC-T10DIF code.  It
> uses "folding" instead of just Barrett reduction, and it also implements
> Barrett reduction more efficiently.
> 
> This applies to crc-next at
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next.
> It depends on other patches that are queued there for 6.15, so I plan to
> take it through there if there are no objections.
> 
> Tested with crc_kunit in QEMU (set CONFIG_CRC_KUNIT_TEST=y and
> CONFIG_CRC_BENCHMARK=y), both 32-bit and 64-bit.  I don't have real Zbc
> capable hardware to benchmark this on, but the new code should work very
> well; similar optimizations work very well on other architectures.

Any feedback on this series from the RISC-V side?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
