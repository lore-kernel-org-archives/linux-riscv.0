Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC6ECD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCiEPFaAoQRzc+bt/S+pGz8fKOOEIdlqokndQhP2sZs=; b=llLC88oIOXwG+5
	vAeoKevoUm4nKitSC7f4wdj4b1DtwNCDeQedLt7+xKcx6hi3WS0y9ilhiuY5jQCqZqVjV7sj8cUAO
	yXrLT6XVYlQVkW7NeYl86k4u/AL8VcizxBXphEyExcnd6zMaZI63zM2kvCqqbGxsGJDhZx/sm54fP
	BlUl6/OpHnjEj8WQyK/o5fTbg38L3QoWyOHikfz0BQunfIDazi6N59ZjBBsaCiswpWG3wJMtXxW09
	ty6vGPQe7i3PuaQYsbVXYwfuOeTzUHSsu3vohuVhpIJ/dtajiCY1xRKedPPqu/RxyNti8+JORT0DM
	8eyqPOWNVv9Pp7TK1Xtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvjt-00000008uoY-2Kq4;
	Fri, 15 May 2026 16:50:17 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvjq-00000008uni-2WUD
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 16:50:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778863811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xTOuacRFqf7jRiO8aj4MgPqi+i+IVWIh9egGsHuyaHw=;
	b=O/DasoEoGDcTGx8ffmNX0/z9Uv2PDz9BqNwqyFXWyFtqDlMtS2AWCgcf7ja++6/yVQcuyA
	9MmPEE2neYO6FbkDr++2X9oikz5OajuiUrTa0/YkggVjws+TZ2M5oHCtndMdoyxJPl/doN
	U/OSHy/veaWlVjiIXYyFzTeKOd5OEAw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kexec: use min to simplify riscv_kexec_elf_load
Date: Fri, 15 May 2026 18:49:40 +0200
Message-ID: <20260515164944.574460-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=thorsten.blum@linux.dev; h=from:subject; bh=tH5WJ66QRToRkxKMi5CzlJ8nS5W/lCMqd4UDM9GQwkU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnsfiv1s8/Nd8mM/xnA4uggeuSVx1zVNcJG9b8VjuhPO Cw3My2io5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACZyOZXhf9bXVe4zdBgfWmxd 6Xbwt6NtaNmcrHlLnHcvNtZdFpyeyc7wP8qL/9vbS2+mz9pbWFpRt+vbn09mm6XOiLxi+yskKJI rzgYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_095015_139931_F9331917 
X-CRM114-Status: UNSURE (   9.64  )
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
