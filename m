Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082C8C43219
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 02:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYIBkAfPxjpHmOLdhqYHBjPcVN3Zmyrrb9sVinjcLbA=; b=AhQWX/C4mwbWZn
	Oio7luBxT3jydwRCwdCXd1oYG80FEvz04bXMvtRqj9Ke0fjwzvr2ui5p0jSOrKhG64JlqriHjQceY
	XDfCGrHmJegBjYZBnsYifY3KPUhaDhKcy3nDIEnVCPnpHl/42GM/640N2NhDLUl9hXvEGT0qymUcj
	4E502j8eQxBaRsr6IGWMYUsNYTwtSaKU2K7sLbOP7vt2z1fc89G3Yeb6zmr9PkokzqEzkM2rTDSDx
	bqPvVfVqrVJXmLO5eTjMSWBndxERN65EEpBHAK3fbHLM0DCuMqpxpULRcI5++W4ZwFlDDX8gJbwih
	vW3uaTIOyMzDobBKDhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDMa-00AG4R-Us; Sat, 19 Nov 2022 02:13:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDMY-00AG2u-6G
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 02:13:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3B3362837;
	Sat, 19 Nov 2022 02:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B51C4347C;
	Sat, 19 Nov 2022 02:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668824025;
	bh=7oI6x6dGUAcNjzV/lbzUit+ElYgYzejNqrXIADa4U4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GBMBNR3eR+cVnln/DzH+kvtIXDs5FtZcYD1KZVO3w78dj+AVRTVmFhM40BxWs4TkZ
	 A1ly/msQusBWOCx/AONjcDEIV6IogGMDklBHxmG2MH+Pviz6FB7rKLAOsX8QS7Onaa
	 +eCtsWu5f6/V79CjXqtI2bPLhhslU0y2YKp9/9GM6aSJFKPsybRMpmQpNgUgGczq49
	 RiBmBDRvEyNUoTFOrOQN4rptdq5uyri3xA8yvltTByJDVSiGiJ47KIFmAlMLT9M1G8
	 jc/TMxsJqcrlHKcGkVL/6+v1Q/cBGCgu5yz192Jv9Nt84ED03wv4E9wJqyxsuYRkvP
	 ogFO5UThTwRzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jszhang@kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 42/44] RISC-V: vdso: Do not add missing symbols to version section in linker script
Date: Fri, 18 Nov 2022 21:11:22 -0500
Message-Id: <20221119021124.1773699-42-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_181346_369376_4604A786 
X-CRM114-Status: GOOD (  10.33  )
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

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit fcae44fd36d052e956e69a64642fc03820968d78 ]

Recently, ld.lld moved from '--undefined-version' to
'--no-undefined-version' as the default, which breaks the compat vDSO
build:

  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_gettimeofday' failed: symbol not defined
  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_gettime' failed: symbol not defined
  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_getres' failed: symbol not defined

These symbols are not present in the compat vDSO or the regular vDSO for
32-bit but they are unconditionally included in the version section of
the linker script, which is prohibited with '--no-undefined-version'.

Fix this issue by only including the symbols that are actually exported
in the version section of the linker script.

Link: https://github.com/ClangBuiltLinux/linux/issues/1756
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20221108171324.3377226-1-nathan@kernel.org/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/vdso/Makefile   | 3 +++
 arch/riscv/kernel/vdso/vdso.lds.S | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f2e065671e4d..82416ebf4cca 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -28,6 +28,9 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 
 obj-y += vdso.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
+ifneq ($(filter vgettimeofday, $(vdso-syms)),)
+CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
+endif
 
 # Disable -pg to prevent insert call site
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 01d94aae5bf5..150b1a572e61 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -68,9 +68,11 @@ VERSION
 	LINUX_4.15 {
 	global:
 		__vdso_rt_sigreturn;
+#ifdef HAS_VGETTIMEOFDAY
 		__vdso_gettimeofday;
 		__vdso_clock_gettime;
 		__vdso_clock_getres;
+#endif
 		__vdso_getcpu;
 		__vdso_flush_icache;
 	local: *;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
