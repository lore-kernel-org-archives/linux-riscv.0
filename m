Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A201C369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XRzlm2PlQqhjhdO4vVfMBFzvwmVPL+yoVb0o9BQrgCU=; b=gapn3FsIZI3OTM
	UXkCpaSDJO8uI1e5FwgMgpttHpsxZTEIfktgBZB0Q6uY+q6UF1nV1TOpmEauBTQc8cPyONH6Q5uw+
	FjnAkTn9aYnWI1CJHLSt9MiNtYHnIRaGJkfCbKUApXSYa6x3bAPJi7yW2jZyOXaAzzDcrCWLlFXvq
	K+PQj5AI3iXLbLY/tsKWt8HRmYAOsgSDvWA21vA8f/thmzDuOYuvj4s2FHruvbx0p4+u1Kqnty8JZ
	ElcliURkpSKQvnPMCMyhMDG1A7PLk+IGITJYEbfHyJOFZUJcfXidZvqV1fvaMk9QDJnSW3/DeTOj4
	nSIl67TQJKkKIP3YxxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gK6-0000000BtPf-11vA;
	Wed, 23 Apr 2025 20:03:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gK3-0000000BtP2-3YHx
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 20:03:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDED949B9D;
	Wed, 23 Apr 2025 20:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34FAC4CEE2;
	Wed, 23 Apr 2025 20:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745438635;
	bh=GOtTYoCHMPW5XORDGg1hgjwlC2VQy46M8btk4g+X5XQ=;
	h=From:Date:Subject:To:Cc:From;
	b=NAM/PTzVcBO8Gc9lk0Vws5Z/JbifBKa7FL/qNcOrOg921aVCmFHKRnCe0ro2cwahX
	 J30fjxHQgkLnTU3mo0akUZH2ZjJEoeJGirJl31C0nJgTbRbvGgi+Ynn5JqbXj/pUVz
	 A2eHSLp0iQ2nOJqVoE4bdlK2qwUMiOjUo48RegyjNONMr2VoWIiK2BSzF6THa5Fj9g
	 ct8f1apgZVyIU3y4lxfXskV9mTLsLs7MaxAglHBpJUNcl8OIQGMaSXvjdeQPwxGP+l
	 aekS8PCCs/NNf2bVLYau13+CbowNV5dW9Ip/xrfieVw207bJat9NOLzJOWtzPbuUqZ
	 AU2oJsapWZstQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 23 Apr 2025 13:03:43 -0700
Subject: [PATCH v2] riscv: vdso.lds.S: Do not export __vdso_getrandom when
 building a 32-bit vDSO
MIME-Version: 1.0
Message-Id: <20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ5HCWgC/42NUQ6CMBBEr0L22zVtAUW/vIchBtoVNgIlW9JoC
 He3cgI/32TmzQqBhCnANVtBKHJgPyUwhwxs30wdIbvEYJQpVWFyFA424pPfaP04N8sjuuBxGBy
 SbivV5qZwlzOk/SyUarv7XifuOSxePvtV1L/0H2vUqLEyylFpG3dS5e1FMtFw9NJBvW3bF0uY5
 NbDAAAA
X-Change-ID: 20250423-riscv-fix-compat_vdso-lld-e1b80b324d97
To: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Xi Ruoyao <xry111@xry111.site>
Cc: linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Linux Kernel Functional Testing <lkft@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890; i=nathan@kernel.org;
 h=from:subject:message-id; bh=GOtTYoCHMPW5XORDGg1hgjwlC2VQy46M8btk4g+X5XQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmc7ivfPiksmrZxhdQyg10z4mvW+XfzROarzznrcXuhS
 0VopVNtRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjImyyGfxoaZeztdS8dfwrs
 WelqlC4Vkbl6uezU/wlLrrdMnRkWe5nhn877Y6fWmHo83f4rhO1c/M5CFU2vQ4/umy5I2bJS62X
 cDyYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_130355_975493_1E2F83B3 
X-CRM114-Status: UNSURE (   9.05  )
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

ld.lld defaults to '--no-undefined-version', which causes the compat
vDSO for 64-bit builds and the regular vDSO for 32-bit builds to break
after wiring up the vDSO getrandom() call because __vdso_getrandom is
unconditionally exported, even though it is not always present.

  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_getrandom' failed: symbol not defined

Move the export of __vdso_getrandom() under an ifdef to only include it
when CONFIG_VDSO_GETRANDOM is defined (to exclude 32-bit builds) and
COMPAT_VDSO is not defined (to exclude the 32-bit vDSO on 64-bit builds)
to resolve the error.

Fixes: 89079520cef6 ("RISC-V: vDSO: Wire up getrandom() vDSO implementation")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Include a check for CONFIG_VDSO_GETRANDOM to fix breakage on
  rv32_defconfig. Include the tags for the report that helped highlight
  this issue.
- Link to v1: https://lore.kernel.org/r/20250423-riscv-fix-compat_vdso-lld-v1-1-820de5cad605@kernel.org
---
 arch/riscv/kernel/vdso/vdso.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index abc69cda0445..7c15b0f4ee3b 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -80,7 +80,9 @@ VERSION
 #ifndef COMPAT_VDSO
 		__vdso_riscv_hwprobe;
 #endif
+#if defined(CONFIG_VDSO_GETRANDOM) && !defined(COMPAT_VDSO)
 		__vdso_getrandom;
+#endif
 	local: *;
 	};
 }

---
base-commit: bafa451a96d0f1404aa1a5a267f78767a55fac71
change-id: 20250423-riscv-fix-compat_vdso-lld-e1b80b324d97

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
