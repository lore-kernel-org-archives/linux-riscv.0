Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0190EEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/+aaOc1NmAe0b3bXaMIexuNOGrYx8qgmcvSbkidmqSc=; b=GgMUHzk3SjOUpM
	vgJy+3sLw57yLPQv8Nm+Cdel/Prkb1UMi8Aj9lsFAtzs8QmJu2VLv8kDAPYYGEZ4msTUVwtQdnrPi
	hdIlGGTcJyxgsRunqRkcTqkBjzrKmjbusrczeMfoWlvLhOl7dDp/307hAFIZN8oJBsOYRZEQxa8ua
	/GSzVZIOfYAERHzEJdHbEfZ/MpxdqvuQN7MNO0JAc7ZezvBZIFvpHpUpcEJDY32oTTcdcJrpIt4j1
	vUmcQQK90N5OzCwcZtUpbVYJ6WLjjXpfabgXOfdZrKa9hAZDmztLBs5Fz5KSVjJo0ztRUOLxj+k7D
	arnoVta1/ySse5zhAH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0G1-005WEm-2p;
	Wed, 19 Jul 2023 06:01:53 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Fz-005WDV-11
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OHHcOhkbsv1p/qZwif2W/kSpl8RMjgRTDPZDHV7WrBw=; b=PedTKh+cefSknu54GRBu/cs62F
	bmNIrKUn8V4K7swS7o2dnfFtOD0C6F2nuGNnI28gPjP34A17UvwlCvhkDQ7yFNx4wB2CE83wYcD2M
	XLvwBzneptp/NWuVhxZ3S8CZ54vg1kpvDLoJWPQNbmHQ8KhYhPqF7ycx7KAFpKtXPXSWsrbbzLDBJ
	UeFQGofPU+YbSxu/865eEiGBFAKnlFCqX8IIZmUekMDI8obsX0x/cPgkiwKatVM6kdqtdjpjZmsxq
	PCCpJJv7EajnSD8mbhJwTRUiWDQ7w9hs0549IwtL8NUnBOfLp1t0YKyA4q3PFQWCUJThv+8gxVdjD
	PbDflmZA==;
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLrpb-00C1Wg-03
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 21:02:05 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-262e3c597b9so4365897a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689714058; x=1692306058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHHcOhkbsv1p/qZwif2W/kSpl8RMjgRTDPZDHV7WrBw=;
        b=LOkbMmif5Ycr4XzhJft2CzhA9qbAeEjYa/Cr0ll2csDNgcvG/NXmoNZXISITQglpRj
         hhtX/VRxsa2hxIDKzNTyFAN++h5tdTzFUqqtIFcjQIHCj6Qq2zobuQLE/fBu/qw4+9uq
         KRjCEp33u2nXN0u+0H1XJGVL6NqeU3WZrWgnYRV3gc0ZAxp803ROYs0SKZ2VXffz8JLE
         xc97gI3pIYHq4XW72UVvcf3uVT8pn43z6plpgB5LFvwKGuee6miTf9TRMpipJglmdmAd
         RnU2XIrpwa1voPrQqUppPno9Bpmwtr7nz3oimKRWZIhB/dFSrlBzrIcfo+GK8654aZ4b
         FLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689714058; x=1692306058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHHcOhkbsv1p/qZwif2W/kSpl8RMjgRTDPZDHV7WrBw=;
        b=HllSaPkVw5T+7hk31i1MvbtE/J2ELxs48lyvWEiOHlCbbFS4XNTZ0LUoTwP0HHCt8E
         AUl7R5fRqBlIy9jIyGYUyVpH+zRbwl4krT/dzsuFjgVhvyjRvipfOrPp462VgjESyHiw
         2Ou4kaYmNsL736NssaID0/NzEDtfnzP6f+TB6pStHRFuyTdygRfYsHZy9iGckb/A5UPD
         Q7tbxp7QUuwYq3DROOOx6WIY5vOQVCRPSfz14YPtfqF5Z60bruw9QJ55Qe3OE7GEA9kw
         BQjUN4hF3ihU3hc30ZXiHe+CQXsPsy4E5GJu+C6acES9KF7KSJkXtL+P1gbC/5nYKpPg
         WANg==
X-Gm-Message-State: ABy/qLYLSJYZsZoKIJJpbgLCopuiy4zuRmZ4rsMnZSQYZENgN3ndIjvx
	N7ZS3pp/oDtbQKPeqyxbc60=
X-Google-Smtp-Source: APBJJlGtYn6KzK28oMCE0qYWdPXLgvr+4ng4J+CyxMR+FL2Vlo5llyfi1/hx5fY2V82w7q/P8bwraA==
X-Received: by 2002:a17:90b:788:b0:264:2e2:7be8 with SMTP id l8-20020a17090b078800b0026402e27be8mr13566948pjz.18.1689714058379;
        Tue, 18 Jul 2023 14:00:58 -0700 (PDT)
Received: from localhost ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a0cce00b00262e5449dbcsm20590pjt.24.2023.07.18.14.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 14:00:58 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Date: Wed, 19 Jul 2023 04:57:30 +0800
Message-ID: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_220203_655007_4F389BA8 
X-CRM114-Status: GOOD (  11.69  )
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

When we test seccomp with 6.4 kernel, we found errno has wrong value.
If we deny NETLINK_AUDIT with EAFNOSUPPORT, after f0bddf50586d, we will
get ENOSYS instead. We got same result with commit 9c2598d43510 ("riscv: entry:
Save a0 prior syscall_enter_from_user_mode()").

After analysing code, we think that regs->a0 = -ENOSYS should only be executed
when syscall != -1 In __seccomp_filter, when seccomp rejected this syscall with
specified errno, they will set a0 to return number as syscall ABI, and then
return -1. This return number is finally pass as return number of
syscall_enter_from_user_mode, and then is compared with NR_syscalls after
converted to ulong (so it will be ULONG_MAX). The condition
syscall < NR_syscalls will always be false, so regs->a0 = -ENOSYS is always
executed. It covered a0 set by seccomp, so we always get ENOSYS when match
seccomp RET_ERRNO rule.

Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
Reported-by: Felix Yan <felixonmars@archlinux.org>
Co-developed-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Ruizhe Pan <c141028@gmail.com>
Co-developed-by: Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Signed-off-by: Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
Tested-by: Felix Yan <felixonmars@archlinux.org>
---

v2 -> v3: use if-statement instead of set default value,
          clarify the type of syscall
v1 -> v2: added explanation on why always got ENOSYS

 arch/riscv/kernel/traps.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f910dfccbf5d2..5cef728745420 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -297,6 +297,10 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
+		/*
+		 * Convert negative numbers to very high and thus out of range
+		 * numbers for comparisons.
+		 */
 		ulong syscall = regs->a7;
 
 		regs->epc += 4;
@@ -308,7 +312,7 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 
 		if (syscall < NR_syscalls)
 			syscall_handler(regs, syscall);
-		else
+		else if ((long)syscall != -1L)
 			regs->a0 = -ENOSYS;
 
 		syscall_exit_to_user_mode(regs);
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
