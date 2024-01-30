Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5DFC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fqMI4X5vWl0L5j2oEt2/rNZsAnt5VA83CWWNFB5EPU=; b=F9hBnVEp6XxCUA
	rp+/Y2iAdFD3ACR89ZsFrDRnTif0d0UhMY3ANFwYJ3uXju/EzO/RDgKiweYNcGIG0lEqR39gUBbSj
	wBIRRP87RS5AlGK5fMuFLlsgRM9lXZJUva/oT8KtuJkUvzWyRtAWjuGUllT/dhUM4AAW5lM6jShc2
	FZrLJLgua5nNcYd3wcrmnx0VGcm1YhC1gPEDRRrh+uOx7kmImbExl60R5eY4Tgs0N6X9pudyWf9Tk
	C2D/ot7nNgrvvFcM35IKDD/Cl6Q2dnK14KuksuYREM+hcgKyTm+l8HgGgFVk0/qFnKfSy/9qYzBeW
	fvpTnngT7ScI4hLO470g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlUs-0000000GDQf-0EvJ;
	Tue, 30 Jan 2024 10:37:42 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlUJ-0000000GD0y-1LwY;
	Tue, 30 Jan 2024 10:37:09 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TPM6B2Rk2z9t5l;
	Tue, 30 Jan 2024 11:36:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWlRn__eVLko; Tue, 30 Jan 2024 11:36:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TPM4b0x0Nz9sbF;
	Tue, 30 Jan 2024 11:35:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 16E428B763;
	Tue, 30 Jan 2024 11:35:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id W3NGrQMVAtQf; Tue, 30 Jan 2024 11:35:11 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.134])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D00E8B76C;
	Tue, 30 Jan 2024 11:35:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-mm@kvack.org,
	steven.price@arm.com,
	Phong Tran <tranmanphong@gmail.com>,
	mark.rutland@arm.com,
	Greg KH <greg@kroah.com>
Subject: [PATCH v2 5/5] mm: ptdump: add check_wx_pages debugfs attribute
Date: Tue, 30 Jan 2024 11:34:36 +0100
Message-ID: <e947fb1a9f3f5466344823e532d343ff194ae03d.1706610398.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706610398.git.christophe.leroy@csgroup.eu>
References: <cover.1706610398.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706610876; l=1389; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=joW5f5HSLrWZ5GQmf1rXby/U2dLAlVL7zEy3NPVkAVA=; b=sNgiUjWR0Fhosv8enaHSXqsDx5ggf6VAZ13c2rbebUX4KZyQTgf7zPLtHsJdwuYc6lV39bCGn 7Ww4MoEZLHXBCZISIB9MHxmZP08gTQfzYa0f+uOXeeMWzGpYGg6D3St
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_023707_596655_9A81BE7A 
X-CRM114-Status: GOOD (  11.59  )
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

Add a readable attribute in debugfs to trigger a
W^X pages check at any time.

To trigger the test, just read /sys/kernel/debug/check_wx_pages
It will report FAILED if the test failed, SUCCESS otherwise.

Detailed result is provided into dmesg.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Make it a read attribute which reports SUCCESS/FAILED instead of only relying on kernel message log.
---
 mm/ptdump.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/mm/ptdump.c b/mm/ptdump.c
index 03c1bdae4a43..106e1d66e9f9 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/pagewalk.h>
+#include <linux/debugfs.h>
 #include <linux/ptdump.h>
 #include <linux/kasan.h>
 
@@ -163,3 +164,24 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 	/* Flush out the last page */
 	st->note_page(st, 0, -1, 0);
 }
+
+static int check_wx_show(struct seq_file *m, void *v)
+{
+	if (ptdump_check_wx())
+		seq_puts(m, "SUCCESS\n");
+	else
+		seq_puts(m, "FAILED\n");
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(check_wx);
+
+static int ptdump_debugfs_init(void)
+{
+	debugfs_create_file("check_wx_pages", 0400, NULL, NULL, &check_wx_fops);
+
+	return 0;
+}
+
+device_initcall(ptdump_debugfs_init);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
