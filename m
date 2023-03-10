Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF00C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 18:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GazNF9UUlZb8Q2Vm1ZCmjJpopiVygA4seZmlsj+yM7Y=; b=RUT4NUIxABWuCz
	TyuFdqCctOV+9v+IAZHjZrJclnWnmoLUk3qAYyyUMyV5BBTY+g89mO43tXYQ8xuIYHYvuic6V1jd0
	hVnm4Q3BNQvan4iF2sgmJtDh3uGSRxFzJG9Mnmwjnv21zjHFgUsaWFIwTuUORk6SaJ4g7XYvMahZq
	X000E0hbum2Y5CIBr9EyJKvC9GqTL5tAtNgcFHo4oL+vmYn9QlsOSza5JKGjY/LvHwNLhNzgqTc/B
	TCNpag33/5UthMl9Kb8vbP8Dumbqb+PK83Co7PimNPLbcA10+0yGS9nlA4QvwIDstiF2FopR0wf1X
	fWtE98JU7wf8yJNT4zug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pahSw-00FkoS-Fh; Fri, 10 Mar 2023 18:27:42 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pahSs-00Fkn4-5Y
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 18:27:39 +0000
Received: by verein.lst.de (Postfix, from userid 2005)
	id 038CF67373; Fri, 10 Mar 2023 19:27:27 +0100 (CET)
Date: Fri, 10 Mar 2023 19:27:26 +0100
From: Torsten Duwe <duwe@lst.de>
To: Li Zhengyu <lizhengyu3@huawei.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Li Huafei <lihuafei1@huawei.com>,
	Liao Chang <liaochang1@huawei.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: relocate R_RISCV_CALL_PLT in kexec_file
Message-ID: <20230310182726.GA25154@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_102738_393519_D203ECE4 
X-CRM114-Status: UNSURE (   6.24  )
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

Depending on the toolchain (here: gcc-12, binutils-2.40) the
relocation entries for function calls are no longer R_RISCV_CALL, but
R_RISCV_CALL_PLT. When trying kexec_load_file on such kernels, it will
fail with

 kexec_image: Unknown rela relocation: 19
 kexec_image: Error loading purgatory ret=-8

The binary code at the call site remains the same, so tell
arch_kexec_apply_relocations_add() to handle _PLT alike.

fixes: 838b3e28488f702 ("Load purgatory in kexec_file")
Signed-off-by: Torsten Duwe <duwe@suse.de>
Cc: stable@vger.kernel.org

---
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -425,6 +425,7 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		 * sym, instead of searching the whole relsec.
 		 */
 		case R_RISCV_PCREL_HI20:
+		case R_RISCV_CALL_PLT:
 		case R_RISCV_CALL:
 			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
 				 ENCODE_UJTYPE_IMM(val - addr);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
