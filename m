Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A93EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IwAWoJ4oiXrb2jDj32WinKrndG92NkQA5d5c6WAlvpo=; b=hQDTF+K9nfTUZH
	eTrV4vGui3TzdWibb7aAtPf+cf5/oFni2UBZZTD7kEYqH1/tOD4y310nu0CFXZ0NXmZ9DR+MHtHZo
	/xXQiOwON0f18D6+4/2t4Y0gDfsofp6EpCKImO1/QZgvYldpc63aXYxewOP4tqDvclOXTWfNDI6PU
	VEePTdBdhBO0fs17+65Z3dj528aj8wTmX8D90poughqSqlYwUyLgT3f0T4hbrZxRnw+q7LFYpJauU
	0VfsODx4+XMJEtzHn4lUHiSqi0Zr67APzpZYvN8IpB3TWi+K+p2wqCpAqhkFniYToB0K3S1wfNESc
	lnto9o9M2FDb71HUlYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFMi-00HMyU-2J;
	Thu, 22 Jun 2023 08:08:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFMf-00HMy3-11
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 08:08:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F45361795;
	Thu, 22 Jun 2023 08:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC56C433C0;
	Thu, 22 Jun 2023 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687421303;
	bh=yFq9Zyr6bfzKa8zhqccBba3/9IvWR8bp0YdV2XNmgvo=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=zkPIBCJaqlv0ttgXKfzaTcGZPsNUdUcwvubcFmV8eQzsvbl+hyPJxF8pUB6yITACb
	 xQst4kN9hyyamesm3RnDqZP5Uj/n7LTWRxwQacBC6/pgxPtn1IukkPZ0HwaSW7jNzY
	 Jx+h9Ukhybgd3wA66jemstEG51NsfDVBkyP9h7Q4=
Subject: Patch "riscv: Link with '-z norelro'" has been added to the 6.3-stable tree
To: 202306192231.DJmWr6BX-lkp@intel.com,conor@kernel.org,gregkh@linuxfoundation.org,linux-riscv@lists.infradead.org,lkp@intel.com,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,palmer@dabbelt.com,palmer@rivosinc.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 22 Jun 2023 10:08:21 +0200
In-Reply-To: <20230620-6-3-fix-got-relro-error-lld-v1-1-f3e71ec912d1@kernel.org>
Message-ID: <2023062221-moving-eastward-9967@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_010825_436527_42B4EAAA 
X-CRM114-Status: GOOD (  15.64  )
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


This is a note to let you know that I've just added the patch titled

    riscv: Link with '-z norelro'

to the 6.3-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     riscv-link-with-z-norelro.patch
and it can be found in the queue-6.3 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Thu Jun 22 09:37:45 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 20 Jun 2023 17:44:50 +0000
Subject: riscv: Link with '-z norelro'
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: palmer@dabbelt.com, conor@kernel.org, ndesaulniers@google.com, nathan@kernel.org, linux-riscv@lists.infradead.org, stable@vger.kernel.org, llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Message-ID: <20230620-6-3-fix-got-relro-error-lld-v1-1-f3e71ec912d1@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This patch fixes a stable only patch, so it has no direct upstream
equivalent.

After a stable only patch to explicitly handle the '.got' section to
handle an orphan section warning from the linker, certain configurations
error when linking with ld.lld, which enables relro by default:

  ld.lld: error: section: .got is not contiguous with other relro sections

This has come up with other architectures before, such as arm and arm64
in commit 0cda9bc15dfc ("ARM: 9038/1: Link with '-z norelro'") and
commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
CONFIG_RELOCATABLE"). Additionally, '-z norelro' is used unconditionally
for RISC-V upstream after commit 26e7aacb83df ("riscv: Allow to
downgrade paging mode from the command line"), which alluded to this
issue for the same reason. Bring 6.3 in line with mainline and link with
'-z norelro', which resolves the above link failure.

Fixes: e6d1562dd4e9 ("riscv: vmlinux.lds.S: Explicitly handle '.got' section")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306192231.DJmWr6BX-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/riscv/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -7,7 +7,7 @@
 #
 
 OBJCOPYFLAGS    := -O binary
-LDFLAGS_vmlinux :=
+LDFLAGS_vmlinux := -z norelro
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-6.3/riscv-link-with-z-norelro.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
