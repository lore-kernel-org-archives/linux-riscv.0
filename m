Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89262CF256D
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 04:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvMY+3ZsS0ieaKvgLQvVZk0yjxlDgkMKF42cUIly4mg=; b=cGJIQ+DNQD16bz
	pS8DlvOPHt46d9nJVHW1YKJXZ4C227PaMngr/2ldeL0tBZjKLTLnqZ7OVMv/fAJPwdhA9j77hUA1v
	dVHDLot0/IvuMaR2lK/C7odgTjFe2rgxHpRHxMWzH0LpcGYA2yOIcTVK6inq6RHuIG+Vpnrn3Y0a2
	MCtvOcDOEsOhv0YgEHFjNgqze6sP2nRjyG2scFb8kbDgZwjRv4wm/209Ii6lFkTfHOOASpVFpezRl
	pSdujEw64sjQrEyLKTqfqrROjGjioHVypWuDHf5NL7FW7lrSNLBfThQcOHQw/k+LfBaNKSiDgHR4E
	7bsh507Y2v3ZH8AOSeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9Y-000000067k8-1TlV;
	Thu, 20 Nov 2025 04:20:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9X-000000067ju-0QeA
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 04:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D67636011E
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717A7C116C6
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763612413;
	bh=k2itjZDhPxDXuyNPfurvrEc3AyRYhf2tkg/jBd+Aki4=;
	h=From:To:Subject:Date:From;
	b=PmOZe2DKGy93fSVcY6l2UKwWDZEIUZI7J9+CrjwjSY6Ijh7Waxx9NPywe/qMpZczN
	 6Knxju1/UwlT0+Ec9I5sJxaTlA+s+ay5+9icBNeHox+4NLN8FtdyEu8FQKc8VlQDL7
	 XASgguqpmw3Y01nI2pTab7+9DtXAkWu/ISOHLWd75b3ZpjqCIQzbk10gy219SXN6bU
	 z359HaJsiZaCTQUR/0rLp/ra99/HZ09k0Ux5nfRSCL8x02LtQOqzkwF/N2ux6ETX5I
	 5gutAHlzB7DqnPVQR8yZ/5j8tLBvge29VV/YUoB+95CDq739q/Rh0JS0tYR3ROuZxL
	 YKN+XQDjYSxjA==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] riscv: mm: clean up and optimize some page table get-and-clear functions
Date: Wed, 19 Nov 2025 21:18:27 -0700
Message-ID: <20251120042001.1766011-1-pjw@kernel.org>
X-Mailer: git-send-email 2.48.1
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

This series implements some minor cleanups on the RISC-V page table
get-and-clear functions.  We continue the work from commit
546e42c8c6d94 ("riscv: Use an atomic xchg in
pudp_huge_get_and_clear()").  The two themes are:

- avoid atomic operations on non-SMP kernels

- use xchg() rather than atomic_long_xchg() on variables that aren't
  atomic_long_t

Tested on QEMU 10.0.6 on RV32 and RV64, SMP and !SMP, running kselftests.


- Paul

Paul Walmsley (3):
  riscv: mm: pmdp_huge_get_and_clear(): avoid atomic ops when
    !CONFIG_SMP
  riscv: mm: ptep_get_and_clear(): avoid atomic ops when !CONFIG_SMP
  riscv: mm: use xchg() on non-atomic_long_t variables, not
    atomic_long_xchg()

 arch/riscv/include/asm/pgtable.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
