Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F82FC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4L+inwq8yDs/U48nYbF3r0u09GsL7W27/3WZK3DQSs=; b=qXeimMm4TLHqNj
	A5jHquhO0MbbwP7mGbf9IINTbRgrL7TB020l0KoA5grmf8PGB8CbROA8yqmvmaMSBAtkc/FoY4rAD
	lnemp9sD6H0uLROOYC6/9i72Zbrm67ruX5iI8ycOpnG+LMoU7HpO7KuGLTF9yHULyN5TXLyUoitPi
	ILZTr3d3p6cdkyIhZNpgfD5qS4sRQzx9MoV7EhkkHRFHbK7x6ADJ/ZfgMDh9Aqp98lsZ29SGESwZp
	YeKuVqcU19lwMBAjSm/kOMbxsqaY/KKfg+J3a8C0yEG0cElBt542XPoeXfZ2pihhNOA2WtdZ2RWh7
	nhyCM8JLYU23onNBTgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38uZ-0000000CtT7-490T;
	Fri, 11 Apr 2025 07:34:51 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38tn-0000000CtOF-305h
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744356795;
	bh=eckRTImqAOQJJRiuiUg+ZtvTkIaatRAZLaXWFpf7/hk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FvUofNjYdLCntE6d3e99/DLFIDf1XfzzyI97gqbVNRcYsavpfpAbhguGtApxzA6wM
	 MWEfXSJafA42JkdnMgoT2T/lorOxkNAogX+Zrwjqtyi2RIzARGtwL7rQTcj5mIdpRD
	 VHttxAftu+TIe8yt8rsN1MBhRv1v3hWiKpdwkYBk=
X-QQ-mid: bizesmtpip4t1744356748t39ebdd
X-QQ-Originating-IP: oavQRg0TIfZfWb6lYfVFwI5gOXtxCy1KV5qtGHWoJCw=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 15:32:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13556097003863952081
EX-QQ-RecipientCnt: 15
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chenhuacai@kernel.org,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	niecheng1@uniontech.com,
	palmer@dabbelt.com,
	palmerdabbelt@google.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	vincent.chen@sifive.com,
	zhanjun@uniontech.com,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v4 1/2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Date: Fri, 11 Apr 2025 15:32:21 +0800
Message-ID: <F22359AFB6FF9FD8+20250411073222.56820-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
References: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M8Li3la+wnbNEMPwE2ICO7D9P1/8/N3zILcQmTNOa3m0e3fHlwa9alLo
	tbYCYkSnHXuyQlbIdaC6kH0RcOTowpvUeADdSgUXDQrjxotEcqQbUDsHVjQPx+a8cC08sci
	VzV/zCG91uGd86kjpbUU07unLqzQ7WOjMsAzib1m31l1lfIDqNDEAhxuK1oHT0CUrqTkFHH
	8zo+gG4WrGsRQ0dWTOKTnlBX2FKk9okgiYngGmk9gOk6roK9jmJ6o5wMkOjdXuaT0W0CzP7
	f1UzIitYn1hnEYdiI4jMTMb1ZKQkLCmkAC3T6U04Q2jYDxk9AE/W/EvuCJIc0UUbVKD/VMV
	0suPN1ZfM4H5v7OsLjGMLyoWkqP73eElQIa+SJS8xnwvD5+z19+pIQtrRpMLpNNBY3b1DMZ
	9ow3q1hz6Q8c5Up+fgvmD9Zrg/0F71rG9k1vzRRuC1A0k1qXYOv4Y0xT/y6X8v0ttfu6igT
	St5rUzbfg6M3OSAfBJ/dY8Byb586S+MXdykjhJPmCn8LXmK7WRwDXbdeiF0PL0Y3+/16FA8
	Bn3sPF4P4wAEYLH+vyfos6Up1Na5AWC3wpTlTZ1vwRCww64uGt7HoPA8c2M2BVgjY3S9xTL
	lox1Kc5yCRqZuHDbyecrWb/qF0yiNVcQybteYvvRWJunel0KkyXscg9g8MK/kqJLSrCz9Bt
	piMSLIoz9FJeTl76prfJTQGLoPzVEoCTA72qllVhgphhbShn+TyUS4hYhRSwiakpPnpBC8Z
	ePKfmTz1OZ76Tkd6+jdXuRH/HLw+48XdpjLNGTWQix/wkH7VrSndjgOVv6sN15Q/xhqg72V
	ul+2uAvqFa93rJ9wONze6Ba8+mU+sWA4E6zcKkU9FaxQJfPljQxl/iGrEOiWCSRI8Hlps2A
	1T0N+kMooXT6ovhvEt700hdaPbO9QUtaBHihTEDm/ZztM4HOUvr4wPyK4yQX6h6ODLxorq0
	tKY1GTLzWfbX3+wTPNvGc4nISafVunItxFwa0KCefcja3PRaqn4pE0a9pr/PTHZBLqnuYER
	FV3AGV3CDlu7qrHyBk
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_003404_123252_C1A647C5 
X-CRM114-Status: UNSURE (   9.50  )
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
arch_kgdb_breakpoint(), which would then define the kgdb_compiled_break
symbol multiple times, leading to fail to link vmlinux.o.

This isn't merely a potential compilation problem. The intent here
is to determine the global symbol address of kgdb_compiled_break,
and if this function is inlined multiple times, it would logically
be a grave error.

Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
Link: https://lore.kernel.org/all/5b0adf9b-2b22-43fe-ab74-68df94115b9a@ghiti.fr/
Link: https://lore.kernel.org/all/23693e7f-4fff-40f3-a437-e06d827278a5@ghiti.fr/
Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2:
    1. Add the missing __ASSEMBLY__ check and substitute
".option rvc/norvc" with ".option push/pop".
  v2->v3:
    1. Remove "extern".
    2. Restore the inadvertently deleted .option norvc to prevent
a change in semantics.
  v3->v4:
    1. Replace kgdb_breakinst into kgdb_compiled_break.
    2. Split the origin patch into 2.
---
 arch/riscv/include/asm/kgdb.h | 9 +--------
 arch/riscv/kernel/kgdb.c      | 8 ++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index 46677daf708b..cc11c4544cff 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -19,16 +19,9 @@
 
 #ifndef	__ASSEMBLY__
 
+void arch_kgdb_breakpoint(void);
 extern unsigned long kgdb_compiled_break;
 
-static inline void arch_kgdb_breakpoint(void)
-{
-	asm(".global kgdb_compiled_break\n"
-	    ".option norvc\n"
-	    "kgdb_compiled_break: ebreak\n"
-	    ".option rvc\n");
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #define DBG_REG_ZERO "zero"
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
