Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62391D68BE7
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Nov 2024 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KFHUJCifY2p8KDpFR46x8sD/odWJwOskN76egxF6ulY=; b=cRZ3lKjpWkgQAW
	46wneM6EiGKuws8bodFlPZr5h3CfLSGkkBDxmov1O9ioM79h4FutquoXReR+nzyALiDzxGoUH42Eo
	ONRowr96hFDVygCGfGz46HTShBsT10b/480t8jToKTaIp5xtj+MrAS4WGRn+0iy85ki6CFNvGgGXJ
	CEav2YUHNuw5BW3HlhEkd9YDhnLXKhnt+BOFmGIwJUI1YOsw6vbBw0FqLnGcuTXkwGMjJTsDMC/qx
	eIWCVqiGJSvIbWlrG1pyN+i1bJ1mQ+5J5+D1+HKeVwcc7YQC7vW3eyU6AsoS6ElGg2D7I9MhPnrPA
	OLW9Iu6XXiC9NeMTGrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCLNk-00000005tHg-3OPt;
	Sat, 16 Nov 2024 16:10:44 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCLNi-00000005tGp-0hZe
	for linux-riscv@lists.infradead.org;
	Sat, 16 Nov 2024 16:10:43 +0000
X-IronPort-AV: E=Sophos;i="6.12,160,1728918000"; 
   d="scan'208";a="225039180"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Nov 2024 01:05:34 +0900
Received: from Ubuntu-22.. (unknown [10.226.92.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 37BE54012505;
	Sun, 17 Nov 2024 01:05:16 +0900 (JST)
From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Colton Lewis <coltonlewis@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] riscv: perf: Drop defining `perf_instruction_pointer()` and `perf_misc_flags()`
Date: Sat, 16 Nov 2024 16:05:06 +0000
Message-ID: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_081042_553349_31E69BC4 
X-CRM114-Status: GOOD (  10.62  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

With commit 2c47e7a74f44 ("perf/core: Correct perf sampling with guest
VMs"), the perf core now handles the functionality previously requiring
arch-specific definitions of `perf_instruction_pointer()` and
`perf_misc_flags()`. As these definitions are no longer necessary for
RISC-V, this patch removes their implementation and declarations.

This change also fixes the following build issue on RISC-V:

    ./include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags" passed 2 arguments, but takes just 1
    ./include/linux/perf_event.h:1679:22: error: 'perf_misc_flags' redeclared as different kind of symbol
    ./include/linux/perf_event.h:1680:22: error: conflicting types for 'perf_instruction_pointer'; have 'long unsigned int(struct perf_event *, struct pt_regs *)'

The above errors arise from conflicts between the core definitions in
`linux/perf_event.h` and the RISC-V-specific definitions in
`arch/riscv/include/asm/perf_event.h`. Removing the RISC-V-specific
definitions resolves these issues and aligns the architecture with the
updated perf core.

Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")
Reported-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
v1->v2
- Update commit message to say it fixes build issue
- Included RB tag from Andrew
---
 arch/riscv/include/asm/perf_event.h |  3 ---
 arch/riscv/kernel/perf_callchain.c  | 28 ----------------------------
 2 files changed, 31 deletions(-)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index 38926b4a902d..bcc928fd3785 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -10,9 +10,6 @@
 
 #ifdef CONFIG_PERF_EVENTS
 #include <linux/perf_event.h>
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs) perf_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index c2c81a80f816..b465bc9eb870 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -46,31 +46,3 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 	walk_stackframe(NULL, regs, fill_callchain, entry);
 }
-
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
-{
-	if (perf_guest_state())
-		return perf_guest_get_ip();
-
-	return instruction_pointer(regs);
-}
-
-unsigned long perf_misc_flags(struct pt_regs *regs)
-{
-	unsigned int guest_state = perf_guest_state();
-	unsigned long misc = 0;
-
-	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
-
-	return misc;
-}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
