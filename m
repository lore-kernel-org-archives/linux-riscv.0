Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D41FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PA9CPmEV6HgYwEKRceHYI2VvP27h+2e5tMLjCljlj7Q=; b=u88krqBhcbnOJj
	GPuqiX9qh7a99wmzXPYdiDd9r4t4TIzL8XUzrrAzlYfPdgTr3pX0Xu17GPx2cgE2O5QX0rkYVBt+6
	x/zXEXClFTG38t2EsaI2ndTeQl+zOKqnoUeRZ78cSsRZekaMDdohrDfQciI86OfvEdk1dbFoykRzB
	RuRDtt29zeeT1KSzi8Ire+21MhUGouXmB3SBNvCdzh7g7zNS5ED9moyW4dgNZtVCEyjQU7pM5NAzo
	sryErEhxgKSkn03o+VCQLnn6zxeIqY7ztamIuxsR98u9KNogyFd2KuDvGLjJJYVkQmYAOb/Yvltij
	sdkT5M+Vj+4g8P3ocx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywZZ-00BjNs-2F;
	Fri, 03 Nov 2023 15:59:01 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywZW-00BjMn-2m
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 15:59:00 +0000
X-QQ-mid: bizesmtp83t1699027115tqmp7mar
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Nov 2023 23:58:32 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: 3M0okmaRx3gtg4dkowId3SRZK6iJt7bmG/bknUDKf+3ULUZKiHp/tkQ2jHTjZ
	qCAJtCYV+PBISnAzK2lTT9gQ93lFd4WLGlpACg09bFke2VMU51xGkofztcVkF64kLeB/I40
	gt7AiMXFEF2xrMMx0HrXUSXv2jHoH+pff3Xms4oos9d5sxvTKIeoM4HgumgCEXWN1DXMZGG
	mOnRKFHyB0tdauEDaWiRCJ4WkEsUYt3jBksdkZqXTIOM4Sg1erJZuCIGNrgNzHJvUOE0TQI
	qfM8VoqG8AKNC9mj7MLM6aOKtJ7PJZrzG9XhTTXhE/GAatyk3aTKEWjcCrmwWhXqp/YBb1k
	Fal2Ut2duOE5o37lshvTGlRfYJ/VnEvHOdQu3tDN7OWkjvzEFMMskq1oA1G7g==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4824966276626844455
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 01/14] DCE/DSE: allow keep unique bounded sections
Date: Fri,  3 Nov 2023 23:58:30 +0800
Message-Id: <c1af88e9c5e5956f22de6b9e7e69186dfad68767.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_085859_210752_B001399B 
X-CRM114-Status: GOOD (  11.22  )
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

From: Zhangjin Wu <falcon@tinylab.org>

The bounded sections may break the elimination of some dead code.

Some unused syscalls have been wrongly kept by `__ex_table`, we will
unique `__ex_table` for every inserting and then remove the unused ones
explicitly and eventually, the unused syscalls will be eliminated.

In the future, we should find better methods to solve such issue:

  Some code may use '.pushsection/.popsection' to insert data
  to a bounded section, use `sys_sendfile` as an example:

      sys_sendfile:

        ".pushsection __ex_table,\"\"\n"
        ...
	".long		((" insn ") - .)\n"
        ...
        ".popsection"

  `insn` is an address in `sys_sendfile`, even if no real user uses
  sys_sendfile, the keeping of __ex_table will become a 'user' and
  break the elimination of `sys_sendfile`.

All of the bounded sections should be uniqued, and we should check if
they are the last users of the code, if so, those sections should be
removed and the code should be eliminated.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 include/asm-generic/vmlinux.lds.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 9c59409104f6..ea8170e11ab1 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -103,6 +103,7 @@
 #define RODATA_MAIN .rodata .rodata.[0-9a-zA-Z_]* .rodata..L*
 #define BSS_MAIN .bss .bss.[0-9a-zA-Z_]* .bss..compoundliteral*
 #define SBSS_MAIN .sbss .sbss.[0-9a-zA-Z_]*
+#define BSEC_MAIN(sec) sec sec##.[0-9a-zA-Z_]*
 #else
 #define TEXT_MAIN .text
 #define DATA_MAIN .data
@@ -110,6 +111,7 @@
 #define RODATA_MAIN .rodata
 #define BSS_MAIN .bss
 #define SBSS_MAIN .sbss
+#define BSEC_MAIN(sec) sec
 #endif
 
 /*
@@ -201,12 +203,12 @@
 
 #define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
 	_BEGIN_##_label_ = .;						\
-	KEEP(*(_sec_))							\
+	KEEP(*(BSEC_MAIN(_sec_)))					\
 	_END_##_label_ = .;
 
 #define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
 	_label_##_BEGIN_ = .;						\
-	KEEP(*(_sec_))							\
+	KEEP(*(BSEC_MAIN(_sec_)))					\
 	_label_##_END_ = .;
 
 #define BOUNDED_SECTION_BY(_sec_, _label_)				\
-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
