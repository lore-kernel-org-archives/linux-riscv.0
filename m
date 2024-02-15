Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184F9C48BC4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w6xk3Ww2YEOjgfy8PRAZGRRlt+0+QPlUzYoRbxOjkrI=; b=P0HWONdOYDF3rK
	YGqBdbQApiBMho9GQ6Vusg3zr0InpfLUWrH8r5eRgztGxkE3UBnyBhy3SSqzq2hNACFjOs5r8yAGQ
	5tlHvQgzstU1tu5pBhxS824tBVekP6kaKNLs6tGGnAe45ElTZjNUfFbt7JtScBW82nw7QZ8DX8Nvf
	qHmUwdH67lL8ucyP2L4w/eCcPIDgqDgd62trEOrsCRLI/HisInB4l6xerniwm+AzuslkJMPJctAs4
	/LEmRn10xyyiI5ASS4cFD6UW3crpCXX+zHLWRTOPQiNLt0qNQAp/uOOkakllzllCBlpX3NHsFe0ah
	4F0c0bKPLwQklMR1lMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rabjo-0000000GNLz-1662;
	Thu, 15 Feb 2024 13:25:16 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rabjl-0000000GNL4-0Mcf
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 13:25:14 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by xavier.telenet-ops.be with bizsmtp
	id nRRB2B0040LVNSS01RRBhu; Thu, 15 Feb 2024 14:25:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rabjb-000gz5-Nj;
	Thu, 15 Feb 2024 14:25:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rabjj-00HZiA-2z;
	Thu, 15 Feb 2024 14:25:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] riscv: misaligned: Grammar s/disable/disabled/
Date: Thu, 15 Feb 2024 14:25:10 +0100
Message-Id: <e541754cd564253b2da9efa952479c75bb7fd2d6.1708003477.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_052513_282758_FF410134 
X-CRM114-Status: UNSURE (   8.93  )
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

Fix a wrong conjugation of "disabled".

Fixes: 7c83232161f609bb ("riscv: add support for misaligned trap handling in S-mode")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b49016bb5077b860..84b8200f7a625b07 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -706,7 +706,7 @@ config RISCV_MISALIGNED
 	default y
 	help
 	  Say Y here if you want the kernel to embed support for misaligned
-	  load/store for both kernel and userspace. When disable, misaligned
+	  load/store for both kernel and userspace. When disabled, misaligned
 	  accesses will generate SIGBUS in userspace and panic in kernel.
 
 config RISCV_EFFICIENT_UNALIGNED_ACCESS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
