Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A3FC369D8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0q0Z/3RCZ7wFBdUt40psVTPORR6QypvO6xmylvedpNk=; b=rZ4jIOWiFcVZ76
	n121P+p+oRsLl3IA49pohW1bVVNKjr1RkoHnk3LGKpveapTd6wOn6CBLrt1au6eKwdqG4fQq6SJIE
	KHei7h/pr8Nrg6AsEbdQ9iAHsvhmqLG7c4CyeukWdQCSKe/km0fV4cXhXkKOd9sPXnhv43hrLJ6Pw
	lyo5FJaZorn8GfHm4epWu0Ro+aAmYswLkd72oszE6GXw3B8CfCdRgoBkO9KwF035C3FV0q9pYQFDb
	NzFyTMHkglsDjLoUOSA2QT+Uup4g0ZEDx6tDvHs/IteaT80cnzsHwpR7elajQMsQtU3g2jAjlkd3A
	Gu8vMRmNfL7fy43uY5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7f7w-0000000BdBU-1gH5;
	Wed, 23 Apr 2025 18:47:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ecu-0000000BVvC-3pJN
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 18:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31076A4BEEF;
	Wed, 23 Apr 2025 18:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D562C4CEE2;
	Wed, 23 Apr 2025 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745432115;
	bh=QKTt5bkmQB/d+gAbXWH4LWzz44kO06euZJ/bzPjxlQg=;
	h=From:Date:Subject:To:Cc:From;
	b=PyYSu7AXHJSv6R7bBbKR6rJAqUrRpeM9szO3JKjnRwSzegtREIZI+k23pcPpGNRJC
	 6zuT5kS5KG0UcJ5u3e/U0RnnPQhKTW3ezMX9okd8+Qxu7Txe4otxi1r3z+pU55hcbg
	 RyYj6ST+5M8NjxbOO0ZAk0jwp1s8wdfUifP1VZlFLFy4OPRL5FNBj+OeJ+HqUliUn+
	 60VJef9Ae++9aEJq45/kY+IALhch/DiprHYPJT2fxADXFYwuxBaUznQVI4vyVbeVl2
	 EQDqVoAtKC1lCUmhur9pEZVsQOFG0t4+8RFNQpdhDAoIeHXiPdUOgp20LAOrjrUKRV
	 2RVkFKIG2OteA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 23 Apr 2025 11:15:02 -0700
Subject: [PATCH] riscv: vdso.lds.S: Do not export __vdso_getrandom in
 compat vDSO
MIME-Version: 1.0
Message-Id: <20250423-riscv-fix-compat_vdso-lld-v1-1-820de5cad605@kernel.org>
X-B4-Tracking: v=1; b=H4sIACUuCWgC/x2M7QpAQBAAX0X729Y55ONVJHG32MLpVpeSd3f5O
 TUzDwh5JoE2ecBTYGF3RMjSBMw6Hgsh28iglS5VoXP0LCbgzDcat5/jNQQrDrfNImVTraZcF7a
 pIPanp6j9765/3w9375oqawAAAA==
X-Change-ID: 20250423-riscv-fix-compat_vdso-lld-e1b80b324d97
To: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Xi Ruoyao <xry111@xry111.site>
Cc: linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=nathan@kernel.org;
 h=from:subject:message-id; bh=QKTt5bkmQB/d+gAbXWH4LWzz44kO06euZJ/bzPjxlQg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmcekZ1Cza32mce0d+8bIq82nrlEj7N+ZvYmxxClpc+9
 ru3o3RJRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIrpOMDP9mZigE9E9jZuqW
 ydTMWMieuMxEKb9xYeJCxWlrQuTibjH8056rk++ae7xaqjTdvkPF79/PxMWzuo89iY7VLP7PseM
 rIwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_111517_045545_D3339F26 
X-CRM114-Status: UNSURE (   9.06  )
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
vDSO to break after wiring up the vDSO getrandom() call because the
linker script between the two vDSO implementations.

  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_getrandom' failed: symbol not defined

Move the export of __vdso_getrandom() under the existing ifndef for the
compat vDSO so that it is only included for the 64-bit vDSO where it is
wired up.

Fixes: 89079520cef6 ("RISC-V: vDSO: Wire up getrandom() vDSO implementation")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index abc69cda0445..dd8f0d128e4d 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -79,8 +79,8 @@ VERSION
 		__vdso_flush_icache;
 #ifndef COMPAT_VDSO
 		__vdso_riscv_hwprobe;
-#endif
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
