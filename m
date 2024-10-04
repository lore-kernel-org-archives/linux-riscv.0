Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DD8CF885B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+OkQG8ZaiYLOQuEWkcJV4nCY019O8YWMm+UisZ9Dg8=; b=wRoROY11h1kmN3
	3JISBnBpLfIO321JfuVh3f9MVeY3VScs8BSUefbZBU5rWwYzV+RyfavDksoXcBDvUPLeGi4uQ04cC
	xhc45AzgKJfnuP2q9RpO7pc0pfi3POifeHPW0YUD+SY7pFK3e6WsPKww+U/2bBDxFuulbUg4vXUJ6
	k6VTZlG3IrALVlKell5mhgMN+Got7HgzMREai1sDkYIPUEV6oSdQqwglya2Tk9FH05gOzvXHmpOck
	SIUcmxPP4olwKaftqydwFigCqYvvTwMKoFLBIfI2FubeoXt5JAqHpRUwJm8wJYteLCJmwGpubx8tb
	mEDRkLNvBTlS1+Xlbm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swo29-0000000DulG-1ciL;
	Fri, 04 Oct 2024 19:32:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swn25-0000000DhgI-0fcR
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52E555C5815;
	Fri,  4 Oct 2024 18:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EC8C4CEC6;
	Fri,  4 Oct 2024 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066484;
	bh=7DJvnD7AOna+uDixrJmrJNsS9vYCmkYC8XHt1twYYLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRhi7HWn7yIZ767Ybt/OdjDxmM3TMFUKRX3CvEwH5iV+hlDB9g+/EGQODYi7Qkdww
	 +HnHH72+hdJHxdicqlG5syYsKyhX4S5pr6vnRF+1P3aWtMfTgVld0TZkC0qHTzdmpw
	 NEQCaETl4k9CVp2SVxOZSYG57wb2kEP0muVPeI3OA2PJwbl1uqLA3mXcOBMPeh+C8V
	 WpDPGW5ec5tAZMXwPAZtw4vAiTRpExfKjWMeakL+cmjz40oM8rIezsEiSRQYIVbs76
	 1S+uz1a29KV2X0ROHg9M//NdsoFBFXK345LDK8rqzDEDa9B0m+p5Koy0SczQGnz7K2
	 isaz5ecj9blAQ==
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
	pasha.tatashin@soleen.com,
	arnd@arndb.de,
	surenb@google.com,
	kent.overstreet@linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 25/42] riscv/kexec_file: Fix relocation type R_RISCV_ADD16 and R_RISCV_SUB16 unknown
Date: Fri,  4 Oct 2024 14:26:36 -0400
Message-ID: <20241004182718.3673735-25-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182718.3673735-1-sashal@kernel.org>
References: <20241004182718.3673735-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_112805_276030_72DA7698 
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
index b3b96ff46d193..88721bea81fcd 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -444,6 +444,12 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
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
