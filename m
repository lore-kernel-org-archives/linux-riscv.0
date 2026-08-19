Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D9C5DF7D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 02:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sknySqRErkj3oGZAkjmhQUYpAI+yQmx6eGxbXJS/4NA=; b=n4j+0nKjETGwDg
	FQGX1bR++ElrtZMYC2IwUhBNk0F6SbtKZPD8Zc9hMqi6k98T73LF0xumbY+jJtrIdDkq2/1dKudr7
	SPbmi8wPc/k7sXPM7BaMsRVvavjnu1IH5HiSHdCFngySD6khLUDN0a7+XgksjMYhfuQUcOlE3qvcp
	NqkDwZcNxDFCvvCds2t/9FiOgJd0KeJuxbLq2CGVq4JHWM6nnZpBJzK+u+Xu9Ewa7QNiPCD3wMCxj
	ChFJWnheC1fTv5s4MUGoHZplPxfkHAievg0ThLHifJiKWC/4D2LBVA1ginLxhfDR3p7GOWKAgPMlb
	+YcUnTa1TMALOVfy3yCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW4a-00000008sgK-2Q3V;
	Wed, 19 Aug 2026 02:30:36 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW4X-00000008sc3-34m5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 02:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=bnDCW7/LrZXWETxlVsz0e02k5adMYu/+BGoT1rCaICg=; b=HrkMDY4X+Oq+jraZDgmYtUHhyI
	XP6vLHO8FI0DPZqaCBwosC+1lXhJdekxfcPmQv1a5VRzntv+U9GIFt9AVPuvSrmTzaVRfVs+AevP4
	s5XXLBRqXpgS3rnpYII8tWoSfrKvbvZDzQFUt2N6jjsxBlQfNZBA8kDodC2bXCs+GIP5aITQc03ne
	0MvKYn2y1uzQOZ5xCef/wrdxiO0wsHP/euJ0p2OCtqYB0xAHgKj0iAia/m6qBxkN1xmEDDTkeuScl
	LIB+NVBL1u2O0c2mMjahoMywUOmHtLDyfOnvP7p2KMLWvIVTtiUSj6Lh4pX3FjGo4SN1q0q9RTyNE
	CMQHvKkA==;
Received: from 186-249-144-28.shared.desktop.com.br ([186.249.144.28] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwW4P-005tfG-7k; Wed, 19 Aug 2026 04:30:25 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 18 Aug 2026 23:28:11 -0300
Subject: [PATCH RFC v2 12/13] modpost: move addend_*_rel() calls into
 addend_rel()
MIME-Version: 1.0
Message-Id: <20260818-sysctl-module-aliases-v2-12-d5a69dae5798@igalia.com>
References: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
In-Reply-To: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
To: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: kernel-dev@igalia.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
 keyrings@vger.kernel.org, bpf@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-sctp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
 virtualization@lists.linux.dev, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_193033_921213_B4E2BF44 
X-CRM114-Status: UNSURE (   9.12  )
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

Move the arch-based addend_*_rel() calls into addend_rel() to be reused.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 scripts/mod/modpost.c | 35 +++++++++++++++++++----------------
 scripts/mod/modpost.h |  2 ++
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8cc78bb4d01fa4c64254c7d7cd80e8f..d18a87b882a67f06d5f75ee92f4c26dc713d83b8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1296,6 +1296,24 @@ static Elf_Addr addend_mips_rel(uint32_t *location, unsigned int r_type)
 	return (Elf_Addr)(-1);
 }
 
+Elf_Addr addend_rel(struct elf_info *elf, unsigned int secndx,
+		    unsigned int r_type, Elf_Addr r_offset, Elf_Sym *tsym)
+{
+	void *loc = sym_get_data_by_offset(elf, secndx, r_offset);
+
+	switch (elf->hdr->e_machine) {
+	case EM_386:
+		return addend_386_rel(loc, r_type);
+	case EM_ARM:
+		return addend_arm_rel(loc, tsym, r_type);
+	case EM_MIPS:
+		return addend_mips_rel(loc, r_type);
+	}
+
+	fatal("Please add code to calculate addend for this architecture\n");
+	return (Elf_Addr)(-1);
+}
+
 #ifndef EM_RISCV
 #define EM_RISCV		243
 #endif
@@ -1402,27 +1420,12 @@ static void section_rel(struct module *mod, struct elf_info *elf,
 		Elf_Sym *tsym;
 		Elf_Addr taddr, r_offset;
 		unsigned int r_type, r_sym;
-		void *loc;
 
 		r_offset = TO_NATIVE(rel->r_offset);
 		get_rel_type_and_sym(elf, rel->r_info, &r_type, &r_sym);
 
-		loc = sym_get_data_by_offset(elf, fsecndx, r_offset);
 		tsym = elf->symtab_start + r_sym;
-
-		switch (elf->hdr->e_machine) {
-		case EM_386:
-			taddr = addend_386_rel(loc, r_type);
-			break;
-		case EM_ARM:
-			taddr = addend_arm_rel(loc, tsym, r_type);
-			break;
-		case EM_MIPS:
-			taddr = addend_mips_rel(loc, r_type);
-			break;
-		default:
-			fatal("Please add code to calculate addend for this architecture\n");
-		}
+		taddr = addend_rel(elf, fsecndx, r_type, r_offset, tsym);
 
 		check_section_mismatch(mod, elf, tsym,
 				       fsecndx, fromsec, r_offset, taddr);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index d5f6d82837d5b4fbd671ff9dab9bbe353442f6cf..a98811552bd2996c31cf73fd3619e6c58bac8a6d 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -222,6 +222,8 @@ const char *get_basename(const char *path);
 char *read_text_file(const char *filename);
 char *get_line(char **stringp);
 void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
+Elf_Addr addend_rel(struct elf_info *elf, unsigned int secndx,
+		    unsigned int r_type, Elf_Addr r_offset, Elf_Sym *tsym);
 
 void __attribute__((format(printf, 3, 4)))
 modpost_log(bool is_error, struct module *mod, const char *fmt, ...);

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
