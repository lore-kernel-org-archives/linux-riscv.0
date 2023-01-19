Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED81CC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BS4GH6F34aQMQyfw0A3JrL4lUTppkZyw5EP7ZnOpynk=; b=jrUMEeXg0n3NaE
	+tCLfBuCx3SRzfrDUO1EMkIygrItI6ARiSzUAxMtMcZ0SLSLR90P5DucAfnG+96lp2hlJJAtrjdsp
	sU0U+WDL5iFj27DDtycAwS0ZL2CopsU/DI11qliY21DaEFpmc3yzIPt23CminsK1oLG8xBSYjkzwE
	hNqbfPQEQtCM0zO3VyS0kGZkxSRyBeYCUWYgPNiZd2gmPOLlwtcLF/pf9xybwM5hHl/q5UeXAFLMK
	z9+Xd9KGM3wU+Eg19BpM8NzqJBS6xHSJcswlFBmsRHFssXFlmxyncAJvDcsT00NSFSMrmLKAiL1vx
	SGQvGS3pI3jCSh5fv+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXP9-005pmT-7g; Thu, 19 Jan 2023 16:04:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXP6-005pki-Bk
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 16:04:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 36D6AB825CE;
	Thu, 19 Jan 2023 16:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331B2C433D2;
	Thu, 19 Jan 2023 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144276;
	bh=bLiBD1lcTQlE2apcHhtHrHNRHMGBCYK7pvp8YphbLrY=;
	h=From:To:Cc:Subject:Date:From;
	b=PHA28sXsdkIBTt828JLOLw8VtnGqWragwmGlYDnKnko5/DgoZK+PA6pCUy4Ufmm6f
	 Tr+T5k68kXaxP/kjDm0wrK2eTdFARnKvIqjl0EFhhDob5tg867mGpgl1OBwd63DA3M
	 QIKyemxHRzin5DplvVozZ5iXyTOYkcN/Aqbpndb1lW5funuUUor7K9hW2Lt74Cv0mo
	 FffZzwXRA/+sghu21oQ5H0/KqTFSKd0OZRnUFyVpasC1dVhu1wJ0VtXKyvMYvZVDUD
	 zeGo0HdCGKnm62bi5rpqTwmY36e99v73rs4zhOY57h0pomKM7pAHaKp000Ztw7o8G6
	 hg+/nQyvgnEtA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] riscv: improve link and support ARCH_WANT_LD_ORPHAN_WARN
Date: Thu, 19 Jan 2023 23:54:12 +0800
Message-Id: <20230119155417.2600-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_080440_593878_9B0BF8D1 
X-CRM114-Status: UNSURE (   8.89  )
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

This series tries to improve link time handling of riscv:
patch1 adds the missing RUNTIME_DISCARD_EXIT as suggested by Masahiro.

Similar as other architectures such as x86, arm64 and so on, enable
ARCH_WANT_LD_ORPHAN_WARN to enable linker orphan warnings to prevent
from missing any new sections in future. So the following two patches
are preparation ones, and the last patch finally selects
ARCH_WANT_LD_ORPHAN_WARN

Since v1:
  - add one more patch to catch .init.bss from EFI stub

Jisheng Zhang (5):
  riscv: lds: define RUNTIME_DISCARD_EXIT
  riscv: vmlinux.lds.S: explicitly catch .rela.dyn symbols
  riscv: vmlinux.lds.S: explicitly catch .riscv.attributes sections
  riscv: vmlinux.lds.S: explicitly catch .init.bss sections from EFI
    stub
  riscv: select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL

 arch/riscv/Kconfig              | 1 +
 arch/riscv/kernel/vmlinux.lds.S | 9 +++++++++
 2 files changed, 10 insertions(+)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
