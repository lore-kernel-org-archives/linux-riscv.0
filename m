Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE1EE77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVDXFyyE+yUaOn3PVWbFukOYH12KCJzoAWj/cnR7hsE=; b=CKS08Zxh16N1aj
	389GsJ290B5Y/k4zi0UHLJliGpDbhl4te8W2jANoFZ4tYp77c17scPr4l5GgTM5iERuHd4pKNfgfK
	w0w9jbd/dxUN1dbwJpEE4KBtOwvh65P85ROC5w0r9hB0O5NLTjHe/RhkwTY9iSp+NN8vmhBZ09fzO
	Q3ocJygbVxXiRkiDE1gySzJdkbR1m7XRLUwOJckBkgyLy/xqUPFf9hWz0XLQklgarenFKbJ9j5N0k
	+rReFXlIEVYvCNq49leGWKUJxcbLwfYFn0oHdIbhlX9gwoKG9byJTUG3KIfiD7ceJkQnqTukZa4Ad
	8u6aWKHq4MT3cgtsb/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAnN-0000000A2nU-0nEN;
	Mon, 16 Dec 2024 13:05:57 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAnK-0000000A2n4-1x2p
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 13:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rF5t3Q7laTivLbivmn7qCWUA6FL9eCwlynHCIhe86Us=; b=g6IQjYZhGu+Vv1csN5p32oSvCj
	DdrzIgyyriNCGxFj3juvnjR/BFu8R3Hh2xX3HplduCliSk6q3SaD6rCigQ040C26OxSnvvb0tehVQ
	nj2UnFA2v4k878B0t86Y+IVtrDKzlGaXqNLCl2ub63muY/f7MY8uoHJKnQJHSTJdk/hpPi46Mn+Yw
	hjjULeBTfkMzCcbkEgcFq7M5F7NEZ3ACMahzdRa9jUu7b8+Py6F1x4eSLJ7IT8eHJSqfeHXbBlDJZ
	vmSV7KSrquiLbSfLyCbBN9ezEpq2X4dUIJA5qelvZk5PIcVH1WR+sJ2Efike4LVBFJOjJU5yZSO06
	Co7w216Q==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tNAnC-004RwY-H2; Mon, 16 Dec 2024 13:05:46 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tNAnC-00000002xh5-0D1t;
	Mon, 16 Dec 2024 13:05:46 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: bjorn@rivosinc.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] riscv: kprobes: fix placement in arch_prepare_ss_slot
Date: Mon, 16 Dec 2024 13:05:44 +0000
Message-Id: <20241216130544.706110-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_050554_590342_DE8530FB 
X-CRM114-Status: GOOD (  11.20  )
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

The second patch_text_nosync() in arch_prepare_ss_slot should be pointing
after the first instruction, however p->ainsn.api.insn is a pointer to a
probe_opcode_t which is 4 bytes... this means an instruction of length 2
moves the pointer by 8 bytes.

This means a kprobe may fail to work and recurse into the bad instruction
handler (which then itself fails as the original lock still seems to be
held?)

Fixes: b1756750a397f36ddc857 ("riscv: kprobes: Use patch_text_nosync() for insn slots")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/kernel/probes/kprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 380a0e8cecc0..c0738d6c6498 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -30,7 +30,7 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 	p->ainsn.api.restore = (unsigned long)p->addr + len;
 
 	patch_text_nosync(p->ainsn.api.insn, &p->opcode, len);
-	patch_text_nosync(p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
+	patch_text_nosync((void *)p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
