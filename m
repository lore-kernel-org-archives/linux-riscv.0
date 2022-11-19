Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7780DC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 02:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFU9LudiNEpC9dRxWhVy/VSjeRJ1NUb6oLIQoqBX7k4=; b=jaBdxmSkUq6K/T
	jydBQxV0yGoimXRVU9O6eUfvbeSWoq+HwER5HlrM89Su2qDPnnNAMxmoJbSxHHNhHzUemsofxcssC
	iExBOUEAb/iki3Bd7tnwcdO6RfbsDJjCXCH6Xjk9LfTQoBst0CHYqTgxxpOPza0DOLd7KyFqsi5IK
	SvNkw6OAm24CK0bVMRlNw7s4JBqrSJ48QEtdt68l12M3Ak/0FHKxeKJp0SLHgq0kMl4z0nD8oJD7g
	g8aMIKKnDs3oJTAUYDYeku4XvanqPps/Fk4WDRAJS4vhnL0YIBJoVRWbiGJP6qPTmayUC1Dmz5t/S
	SV9Mdwylypq2wnHeyL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDQL-00AI9v-DA; Sat, 19 Nov 2022 02:17:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDOo-00AHMx-BX
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 02:16:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3000B82676;
	Sat, 19 Nov 2022 02:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A1DC433D6;
	Sat, 19 Nov 2022 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668824163;
	bh=CQytZuh4lAVbWMGShkYSAQPXRU25fdzUw6prq3XT1/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=szC4v83422323E0IbO4gJioOC+v1jcweMy+0eac9qd8lhxkcHFBNROxFMPchK0eOI
	 /yLfX9XOqeLWijiL22FLdEe6QoWsQapVSe31Ik2yL7CT+VruV3lEs67oG0rr8dnxIS
	 DxnjHEhEW5cyvrrS9BMabNjDN55wEP6z+hizcJY5ZFmHDDBgZr6w1qNQXJdaLVEsH6
	 WhGLDcwwmXLpjOQgFX9lDqK8LnH1I3/DsBYmrHFftHVEcuE4P8v010j78QBLcY9cCl
	 8ZhxtEB86aJcDuFwvbvK3fEePvzEgddumW+ylwGBS5RiHyEHvQmBcDSqcs6hHI2m7b
	 bQRFUPsQq2ubw==
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
Subject: [PATCH AUTOSEL 5.4 10/11] RISC-V: vdso: Do not add missing symbols to version section in linker script
Date: Fri, 18 Nov 2022 21:15:42 -0500
Message-Id: <20221119021543.1775315-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021543.1775315-1-sashal@kernel.org>
References: <20221119021543.1775315-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_181606_758019_5D1060BA 
X-CRM114-Status: GOOD (  10.30  )
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
index a4ee3a0e7d20..c533ac869aa2 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -20,6 +20,9 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 
 obj-y += vdso.o vdso-syms.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
+ifneq ($(filter vgettimeofday, $(vdso-syms)),)
+CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
+endif
 
 # Disable gcov profiling for VDSO code
 GCOV_PROFILE := n
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index f66a091cb890..4c45adf23259 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -62,9 +62,11 @@ VERSION
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
