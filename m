Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20783CCD185
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 00:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ySPN6496hDyWsIDDeFSPHnwTtYarBpjfJGG4/ZZf2w=; b=nPckS5zrze0GrI
	BJxriQ4gfiIjaYTUzXqpoUYixJ6z2snKK2aE/vV7zfXpPTTAFqS9e/P+Vv/uX6uF8k3CvEi2wq1Ue
	dJzdCx2OtnJf2TCwEMxqmWRkzABIr7IFVjks0y53vabc/XZP7ntQXFJGJ9hps5SFO6tRXOXl6bONb
	HI0S0GEKH0R5ugUBwUf+WiwKbEQlW5yBW3fpWazJo6phTd51vOQKEp9Dt+X2idAhkl/RR3MfBVeDY
	f3bPcU8uD2eJp8bjJcZxVwOTWIFS2qVKmTnd2bYyeVffsRO8Ft5tBQme0KbdFkX0SuX3EfPOZJpv9
	90mKLYcguIjzwsbv8aIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NmL-00000009bZB-0Dqn;
	Sat, 11 Oct 2025 00:48:09 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NmH-00000009bYV-2hjW
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 00:48:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760143680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cji4z2er6pRmGYHI01Em2KoluPX1Q6shi/bLvXruyQg=;
	b=wqIxp567kScmh0J2IFpMr8rZwffM2m/RoXY7EJfFR0Q22ZONddZP9MLhH4F8UZrDyE/O3i
	gss7dAHbQtxQnpSI072N8sF71OhbVIVSPAuvJWxTfgyE5/w3DPkDvAfMGzs6uuuX1DMHIe
	NvyVa4xfXt6MiCg/F3R+QnQo71nODUo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: KGDB: Replace deprecated strcpy in kgdb_arch_handle_qxfer_pkt
Date: Sat, 11 Oct 2025 02:47:47 +0200
Message-ID: <20251011004750.461954-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_174806_130843_86C93E19 
X-CRM114-Status: UNSURE (   8.56  )
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

strcpy() is deprecated because it can cause a buffer overflow when the
sizes of the source and the destination are not known at compile time.
Use strscpy() instead.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/kernel/kgdb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 9f3db3503dab..15fec5d1e6de 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -265,10 +265,10 @@ void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 {
 	if (!strncmp(remcom_in_buffer, gdb_xfer_read_target,
 		     sizeof(gdb_xfer_read_target)))
-		strcpy(remcom_out_buffer, riscv_gdb_stub_target_desc);
+		strscpy(remcom_out_buffer, riscv_gdb_stub_target_desc, BUFMAX);
 	else if (!strncmp(remcom_in_buffer, gdb_xfer_read_cpuxml,
 			  sizeof(gdb_xfer_read_cpuxml)))
-		strcpy(remcom_out_buffer, riscv_gdb_stub_cpuxml);
+		strscpy(remcom_out_buffer, riscv_gdb_stub_cpuxml, BUFMAX);
 }
 
 static inline void kgdb_arch_update_addr(struct pt_regs *regs,
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
