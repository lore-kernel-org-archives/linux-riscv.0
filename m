Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD73DCF8840
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uyfgVByhR8MMN/XRDq9TXA6618wH9UL2APHkDToYBM=; b=NNLVKVHdQaFdij
	1N9mr4PASpDfc5wJQjanxvUWVk61uXh7m7REJqqz9oRFIlHrJOhYJrTuyw2hwv/W41jIsM1eyCHjI
	mEEK17PqGDTVQQPba0fka/B8oy4JjgORoHO6xK74EIiowTBmSJuY8qlVdjen8L+Fa5HL/XB7gIHHf
	Oo6toq3D2OH+fFLlsDja++36htFMDTPRjz2nl2yhEGptyfkCObtRn1XjmWgScrv8Flgbb8A0i6JrV
	oU9CZz0qhvm3/Dy2DKz5G1pims6SL5faP7Q7F55ceq5VXeJhdhrnTEQf3InnJRj52mMqVUvUqdgDl
	MeqRU8jieCxBXGHm2U2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmuA-0000000DfDg-2BMW;
	Fri, 04 Oct 2024 18:19:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmu7-0000000DfCF-3VeL
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 105835C5F30;
	Fri,  4 Oct 2024 18:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FCDC4CECC;
	Fri,  4 Oct 2024 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728065990;
	bh=DTVQMn5qLMaxZLP5JEkomQkN+Rm1ujTymnl59WAJqOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mquDRSxRGs8cxl7do36SFdI4kGyJXhys+c/ALO5voWGkKABE/CwCbS0Z0AQjUL7DG
	 aslAF43fNn2iaT4Ek0dIRerUD4VhLyGaYR9ONBJMqgvjRHyrKqwtRGHcp5wzEXwO45
	 EdtkyDkr+0hpSn6qi6dXr7+J7NtxaRsSQHC6Lxi4ai2/Of4L5woBsl5Udn7WL9UNp0
	 UCVmv95Q3L6OWHavUDZJkYuVcdiiPO1uroDjxtevPZxKx9CwQVj9Nfg7nROqbfxBHR
	 xlUKWAfNm24p3b2T80iXWjgkXYFU9uzgu9Yae+9aE7moxZXp49PK6dJtVLKD+Gf9Ko
	 KDQdlldhtaFKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ying Sun <sunying@isrc.iscas.ac.cn>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	arnd@arndb.de,
	pasha.tatashin@soleen.com,
	surenb@google.com,
	kent.overstreet@linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 43/76] riscv/kexec_file: Fix relocation type R_RISCV_ADD16 and R_RISCV_SUB16 unknown
Date: Fri,  4 Oct 2024 14:17:00 -0400
Message-ID: <20241004181828.3669209-43-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_111951_948173_770AF42F 
X-CRM114-Status: UNSURE (   7.08  )
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

From: Ying Sun <sunying@isrc.iscas.ac.cn>

[ Upstream commit c6ebf2c528470a09be77d0d9df2c6617ea037ac5 ]

Runs on the kernel with CONFIG_RISCV_ALTERNATIVE enabled:
  kexec -sl vmlinux

Error:
  kexec_image: Unknown rela relocation: 34
  kexec_image: Error loading purgatory ret=-8
and
  kexec_image: Unknown rela relocation: 38
  kexec_image: Error loading purgatory ret=-8

The purgatory code uses the 16-bit addition and subtraction relocation
type, but not handled, resulting in kexec_file_load failure.
So add handle to arch_kexec_apply_relocations_add().

Tested on RISC-V64 Qemu-virt, issue fixed.

Co-developed-by: Petr Tesarik <petr@tesarici.cz>
Signed-off-by: Petr Tesarik <petr@tesarici.cz>
Signed-off-by: Ying Sun <sunying@isrc.iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Link: https://lore.kernel.org/r/20240711083236.2859632-1-sunying@isrc.iscas.ac.cn
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/elf_kexec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 11c0d2e0becfe..3c37661801f95 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -451,6 +451,12 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 			*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
 				 ENCODE_CJTYPE_IMM(val - addr);
 			break;
+		case R_RISCV_ADD16:
+			*(u16 *)loc += val;
+			break;
+		case R_RISCV_SUB16:
+			*(u16 *)loc -= val;
+			break;
 		case R_RISCV_ADD32:
 			*(u32 *)loc += val;
 			break;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
