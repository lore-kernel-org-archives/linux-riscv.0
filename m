Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A745AC35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 06:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QTDSVgK3sM4VDH3OuAYkcGo/acI362WI7B0ITWgFaE=; b=qcSFC5fj2fW6Nl
	smDanpfVyh/qDgPget+3zplGxo5Fc4MJ+0dmBijtOMVwJ+qSi444LAuzuM5ObG2EiZYyFTVzYdSoD
	ajwtWVO4O2ftCRTIuSYn7l9/xut1UwiyHAQ68w9gvNrtiojlhWvj+fMsB2Fjtv87GuBq5UpjmpfUW
	yD4bxjDoD0PHLOX2JRXgUdpMvYJUtbSbqQKk0YJ9aUMzA6KEh3AXvhqP7j5/VuauLfgkUDgx835mi
	+WrVcWJC3rGHhQPYQbWAkS2YvDWC8LBk9gzP1g3SQ4njqMouJJMkotQJlIfnNBB5UMMI6gxFuMA74
	jqMmmFCCTvMjFEqSpN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvsO2-0000000GwOr-0SYj;
	Sat, 22 Mar 2025 06:31:14 +0000
Received: from [54.204.34.129] (helo=smtpbguseast1.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvsNq-0000000GwOK-3IqW
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 06:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1742624935;
	bh=ZUwDzUOO8B21ZdXUlMK7jpoccKcRIaUuh/idrOVRgTQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QA4cWYam8yzPDtPEzOJuX43jOD38n1L5/af5QmkDeQESy8vpfw72Wwfq2aejupf9V
	 9UTYj8cBb2QCIWSXvrtVWTn4cLMpULYP8X5fuIIhVsdmaBSGdnuHSEm4WX2+YrOBEB
	 wLPMyFim7FXk4kCDvYk07OuDTJqkIAy4gH1Yzfms=
X-QQ-mid: bizesmtpip2t1742624924t25799d
X-QQ-Originating-IP: EoFty24JGgb8Uv27sxTo45Myx+tTjSV1ie5YhBKGeFM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 22 Mar 2025 14:28:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6533944679590139330
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: wangyuli@uniontech.com,
	chenhuacai@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vincent.chen@sifive.com,
	palmerdabbelt@google.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Date: Sat, 22 Mar 2025 14:28:36 +0800
Message-ID: <CEF1937DAC500D66+20250322062836.362600-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N7JihbTpIyPvPSrqEYLxHxCEbLmgFfxpOk0S8bgDnTJ1m/Ve+qZ4zuEE
	7yw+yIa+3MlOlVYi0utsKQJC8+xvbxpJ0yyjx6dmrObwh/72ZVljJukZge1adwURJJs9zeP
	CjTJi/EwFpcFgZMpsyJ2uYHQ/OAd6zEGAxrPm0rSUVTmG9mjiaryxdv2VwYaMxLzU5jeR/8
	+ZQyP9xiffkbgxuALF+4rgWrvvZf2JD0EZNItXLBfRSsVOYuPfvg2Ujrkeozr+UOzFU5KpH
	Gy6+ejvSyVp/zp7eN0sq5xp2EunDzuj0w7yKj7gRJHK9fhwWAmWDqHpr/cRU4MPWjTi8H6P
	ywjNyShDsqNAEvbTLHj87yWTauYG1v6aHbf0eca1eiUZNko7RrGzyRu5H90yDCjZvfk8cF/
	R4GHtoNLDJgLFxTqmwHHtcU1d6qd+a8/jW7h5IkKrsTecgJfAZCkFn+x0s01WVxsbAPjfzJ
	95PhANTZJXcDuCHAtKlQMMtZ7j53K/71XssbsD6xmN/ko+dTHMap11G3fdzbq7W99MP60mh
	ZtHNynnsGyBspxPgX65QxIKSZGTSMfEmmTYWr5m794hJk17ezoTIC01hQnzYqKGDKlP4YC9
	2y1NsYatqhf5ayG75q99Mr/wtekTg413k0aemr5PCduaz4JyT6L0JPOmmXzzapg+WgKGHuF
	ui9/z8wPlMyClsH/3AGjltbvoK5jymXdmxwpMx8/QE6iekZtTpTnVIx9EjDatk8qZfcROHS
	RwApEfmkFvy4LTFM3T8ErWoD9HEvgictjWbeXtyft0e5iKUzGGsBa2NXgjQP5IEDPdp52Js
	3QDq3BQ0r8l8RLUKnnGMWt1h6JAqBRTGYEXe6HcqAdxTA+n93u/PzrnoS1BL5uLygQUVlYM
	wAcSjK4+Wnn6ATAtoie6Zy3jpmzkHru/ffyzan5qT+dn/JzNJjjEMYHEa89i1R2pGxjKLVa
	hJyULdpKKo30O5xYTyUkFMT30Q7B9GgVhkpl5h8yYiQq+rpFBHh6UtubRqibM4a/Iw5GIdW
	F5fwKZpj09b8DckLzI
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_233103_646565_7DC276F5 
X-CRM114-Status: UNSURE (   8.15  )
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

The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
symbol using inline assembly.

There's a potential issue where the compiler might inline
arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
symbol multiple times, leading to fail to link vmlinux.o.

This isn't merely a potential compilation problem. The intent here
is to determine the global symbol address of kgdb_compiled_break,
and if this function is inlined multiple times, it would logically
be a grave error.

Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/riscv/include/asm/kgdb.h | 13 +------------
 arch/riscv/kernel/kgdb.c      |  8 ++++++++
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index 46677daf708b..566ab1bc66fa 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -17,20 +17,9 @@
 #define BREAK_INSTR_SIZE	4
 #endif
 
-#ifndef	__ASSEMBLY__
-
+extern void arch_kgdb_breakpoint(void);
 extern unsigned long kgdb_compiled_break;
 
-static inline void arch_kgdb_breakpoint(void)
-{
-	asm(".global kgdb_compiled_break\n"
-	    ".option norvc\n"
-	    "kgdb_compiled_break: ebreak\n"
-	    ".option rvc\n");
-}
-
-#endif /* !__ASSEMBLY__ */
-
 #define DBG_REG_ZERO "zero"
 #define DBG_REG_RA "ra"
 #define DBG_REG_SP "sp"
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 2e0266ae6bd7..5d1ce8dacaf5 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 	regs->epc = pc;
 }
 
+noinline void arch_kgdb_breakpoint(void)
+{
+	asm(".global kgdb_compiled_break\n"
+	    ".option norvc\n"
+	    "kgdb_compiled_break: ebreak\n"
+	    ".option rvc\n");
+}
+
 void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 				char *remcom_out_buffer)
 {
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
