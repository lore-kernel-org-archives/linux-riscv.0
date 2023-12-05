Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FADC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 23:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DRMR9x7b7d/Ehff3dfZRMaAFwSMGVUxdWY17kyBohz0=; b=0jWJM//qCGH0Lu
	FfR92x7OvP3PWK0Wp1LuOAcWSeCnkZaIWK2kHph6TMq4QmbIA5uQEvXlONl8pgTMc9bZTqvLZScg8
	dS5IQbAD4aFJo//mHEWMujQBz8bYbdVkbTjiOovXzcaW3bqo6dmuZeRsjch1l3NzI9CUcGUkwHk7D
	lKi0aCUbF7dvpKxaQA2WiIn//S0agAwu0Lz+myiUutQT/OxBs1z/PmrI+t75d/e+hnip3wPTAcDGP
	qCvKdUu/bd6hhOeVpgfzGmckcKQ9Oxggv6kIOo7L4ayrDlx7+PuPzlSDZ7udUSLFaWczVuJeW0g0h
	kmyLCthwQTkUS4nMzTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfEu-008fTB-2k;
	Tue, 05 Dec 2023 23:54:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfEr-008fRA-2R
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 23:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7EF6CCE0A10;
	Tue,  5 Dec 2023 23:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD91C433C7;
	Tue,  5 Dec 2023 23:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701820439;
	bh=y/jqertrO7frvcmMbzQv5qp/lLtbm42FIUi32gqKKTY=;
	h=From:Subject:Date:To:Cc:From;
	b=HnO/23+J7Z0MsuTFQi1T5wWU6invgYUs70iS/MAR4gtRjF5ObSqqHmVtULa5Ojcvk
	 3erW/Oa/ZZncJ9/8DlrHRRUTMDI3oK8RlfkfD5mhEa0zB3v7CIXTVRH3FnPWPJcvXF
	 J3bLveJlNDLck1gUDuiNW8rxPkXPpCwnr8A2fhssmxuhe9Z2V6SD73s4S4gGGtM04W
	 DA7S3xg75s0ioAS3eivrpa1fI6cTtXwuBCtK2SQJwneXBuvu6zF8HXHnZ2oMwaz7FG
	 qBYx04GN+6ejn5HE4AFBdDY7p8jh96eyYzdIorgO4hkO6ovKPnRSJ99588+2qh/N5I
	 p0P6xPYDEivFA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 0/3] RISC-V: Disable DWARF5 with known broken LLVM
 versions
Date: Tue, 05 Dec 2023 16:53:49 -0700
Message-Id: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA24b2UC/43NQQ6CMBCF4auQWTumLaDgynsYFrRMYSKCmZKqI
 dzdyglcfm/xvxUCCVOAS7aCUOTA85RgDhm4oZ16Qu6SwSiTa21qFA4uolBYhN2C3asVX+I4xge
 2dWUKa+tz4SykwFPI83uP35rkgcMyy2f/ivq3/pWNGhWSU11+qrwt8+p6J5loPM7SQ7Nt2xdtc
 XClxQAAAA==
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 conor@kernel.org
Cc: maskray@google.com, ndesaulniers@google.com, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=nathan@kernel.org;
 h=from:subject:message-id; bh=y/jqertrO7frvcmMbzQv5qp/lLtbm42FIUi32gqKKTY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKn5O8Re5h0w0Dxz3u2i223Ro88ZF37uDCwSubE6dce2N
 6aLizdZdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJLDzHyPC1OO1An+EljfDY
 dztfHFjfzsnEmLH13WGHWzGzv3BO8r7O8L+y98uGVXZiRbLs6d+UNERkT/7N3XY7Msj4xzbZDQw
 6XhwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_155405_977409_C02D301A 
X-CRM114-Status: UNSURE (   8.73  )
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

Hi all,

This series disables DWARF5 for LLVM versions where it is known to be
broken due to linker relaxation:

https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6

If I understand correctly, it sounds like GNU binutils has a similar
issue but I am not sure of the status of the fixes and such, so I did
not bother with checking for it but it should be easy to add if so
desired.

---
Changes in v2:
- Added patch 3 with Fangrui's suggested improvements around
  CONFIG_AS_HAS_NON_CONST_LEB128.
- Pick up Fangrui's Reviewed-by on patch 1.
- Link to v1: https://lore.kernel.org/r/20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org

---
Nathan Chancellor (3):
      riscv: Hoist linker relaxation disabling logic into Kconfig
      riscv: Restrict DWARF5 when building with LLVM to known working versions
      lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128 comment and name

 arch/riscv/Kconfig  | 14 ++++++++++++++
 arch/riscv/Makefile |  4 +---
 lib/Kconfig.debug   | 12 +++++++-----
 3 files changed, 22 insertions(+), 8 deletions(-)
---
base-commit: 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
change-id: 20231129-riscv-restrict-dwarf5-llvm-a9824bb974cb

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
