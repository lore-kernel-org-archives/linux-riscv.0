Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29812C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kvlL5yXjjKaMd3fzEAGUpKnrlsPFnhrKNJgKJsyWlyY=; b=WH4rZYSVUtW8Sc
	2KhygPbI4sALNvP5VC8pAwiE003qwySfwA7ZJK6OiLajvp9Lc+qFsV2uoM0VO+kF5JavF/pO8nlbu
	aFOUdQ0SExNtyyUKkF2/GoKuxI954gLPOY3o+8/j6eVmKUf9wIigs84zrJk13wfCcgf2TncUyDh8h
	Uw5JHv0szu7+EfZ9X4lvVA9AAMgqN40bJwBzgiWnoB4dVMcpXO28ztgGkh6FBUsf7rPHbeStl5ZlV
	HP1edXq7LTQOxhnJrbT0RHnc6wwqeqYk3T60xDdRURGAUPM51+nCB7e8bIH3c4MmCbsZ6w5fe8WHa
	hxb7Ah8CqmmvTBYGvACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0ym-00EM9e-Rr; Fri, 03 Dec 2021 05:19:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0yW-00EM3j-4l; Fri, 03 Dec 2021 05:19:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 914AF6291A;
 Fri,  3 Dec 2021 05:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE51C53FC7;
 Fri,  3 Dec 2021 05:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508751;
 bh=DIZ3iH9eTHW1kh3AtvEImcM5tdEzpteHHLSK3AhyocI=;
 h=From:To:Cc:Subject:Date:From;
 b=pwAgFJYrBa6ZaXpfWCune5BzG6L7h1HBmuLVVxnUVumJnJNly8D9n25nol++Q6NrE
 omijuK2cbfxAN0weD9K0s5YOrmKpa+sXTxvw30B87IOuPW2ty0CSz1BmIrPFZ+ZC7Y
 Gw90LwhSB7r3c2My/ifoHcj/cjfue3r8HPoRLqLFgGzx5+cBV2Nu/RcEUibuOIfuvJ
 SHcugi2aJOTLuv3i5ibsKLT1MnzCnwtMk7uy3jIo8qwoIUN2bznKPITIj6XYr+LH43
 3oKo7rN/NdUvshAWpldSxfqFHfTacl7nM8Es81p38wsHP7hhvDDDUcwsBG3iwXy670
 JhW8DJiDTf9kQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: [RFC PATCH 0/5] kexec: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of
 #ifdef
Date: Fri,  3 Dec 2021 13:11:52 +0800
Message-Id: <20211203051157.2160-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211912_251446_4CC92639 
X-CRM114-Status: UNSURE (   9.67  )
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

Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to simplify the
code and increase compile coverage.

I only modifies x86, arm, arm64 and riscv, other arch are not touched.
If the idea is accepted, I will modify all architectures code.

Jisheng Zhang (5):
  kexec: make crashk_res, crashk_low_res and crash_notes symbols always
    visible
  riscv: mm: init: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
  x86/setup: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
  arm64: mm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
  arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef

 arch/arm/kernel/setup.c |  7 +++----
 arch/arm64/mm/init.c    |  9 +++------
 arch/riscv/mm/init.c    |  6 ++----
 arch/x86/kernel/setup.c | 10 +++-------
 include/linux/kexec.h   | 12 ++++++------
 5 files changed, 17 insertions(+), 27 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
