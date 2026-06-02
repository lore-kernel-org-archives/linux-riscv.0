Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CBCD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 22:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCiEPFaAoQRzc+bt/S+pGz8fKOOEIdlqokndQhP2sZs=; b=OWYxs3VBvAA97k
	IDUEW+IjBosVF/ne0HTYsEQ5GAKFfTQhyUNPR8ymF1o1mXt9f8aMPaoZ8yd4RQE76oY42FETD27t8
	k3/gA6G7updU325lbmwkiDorSM5Bk+pnXKX6I6R2ricO0lehfgPeY1gh4mm8w8ZWoJnSAe50PrI6r
	iNcCIHuKhJmTiQQL+QWvSq5MpP5MSYsGgugWrxurM2AbWrAzRTX84cCks8jFOt95ANLh7m3IukuRs
	E4cMvQ9hrGByjg7fFfbKO2Qayd3BPBlW9UoDYTiY9MGQ/bqb/f0Vibp52cWMva5cYyBSXDRiNt7Bn
	QuM33n77SNGgOdZ5q4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXvC-0000000DuCB-0ufF;
	Tue, 02 Jun 2026 22:49:18 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXv9-0000000DuBC-0Jf2
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 22:49:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780440550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xTOuacRFqf7jRiO8aj4MgPqi+i+IVWIh9egGsHuyaHw=;
	b=MTZHuGG16xFHjwh8YRObibc+qHri/oFeWwccfRwxatMgxCdI1sfe5Yg7zte9PSgvNZHNAC
	l/hhMlpfVGOOqNxrlB192BaKaR85P4Dy/yvxegls7Hfh5I44juISra3CRgBr6jezQoTt1P
	XoMhraNz9u5nEGHDMw2i2hDNOklzl0k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Song Shuai <songshuaishuai@tinylab.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] riscv: kexec: use min to simplify riscv_kexec_elf_load
Date: Wed,  3 Jun 2026 00:47:22 +0200
Message-ID: <20260602224725.1088385-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=thorsten.blum@linux.dev; h=from:subject; bh=tH5WJ66QRToRkxKMi5CzlJ8nS5W/lCMqd4UDM9GQwkU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnysbX62efmu2TG/wxgcXQQPfLKY67qGmGj+t8KR/QnH JabmRbRUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABOpiWRkaPa3Tt+0bBHjkSW/ 2yZHzJ78fsmFw5bFnzfd4a8/se3gk7OMDBOPpvjVyHtvULD1LmtNaHzBZ6O0fkMtf+G2Mq0TrFN 3MwEA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_154915_320735_4CF45A97 
X-CRM114-Status: UNSURE (   9.84  )
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

Use min() to replace the open-coded version and assign the result
directly to kbuf.bufsz. Drop the now-unused local size variable.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/kernel/kexec_elf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index 531d348db84d..528141df90ba 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -19,6 +19,7 @@
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
+#include <linux/minmax.h>
 #include <asm/setup.h>
 
 static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
@@ -27,7 +28,6 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 {
 	int i;
 	int ret = 0;
-	size_t size;
 	struct kexec_buf kbuf = {};
 	const struct elf_phdr *phdr;
 
@@ -38,12 +38,8 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 		if (phdr->p_type != PT_LOAD)
 			continue;
 
-		size = phdr->p_filesz;
-		if (size > phdr->p_memsz)
-			size = phdr->p_memsz;
-
 		kbuf.buffer = (void *) elf_info->buffer + phdr->p_offset;
-		kbuf.bufsz = size;
+		kbuf.bufsz = min(phdr->p_filesz, phdr->p_memsz);
 		kbuf.buf_align = phdr->p_align;
 		kbuf.mem = phdr->p_paddr - old_pbase + new_pbase;
 		kbuf.memsz = phdr->p_memsz;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
