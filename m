Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A9AC28B30
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 05:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hzuQbeRms1LKN1QVtmgAarDzJdjiKDGZg48fKddwozM=; b=vvRxxu2AVita8T
	vkATvDuiRQRsFExwbOzf5T7uF+WhAzlkcZAt1oeL0n9GkkxGTLJAtQ3SFASRCcmKZZNvv+y/5Q8HL
	nIcHA6H8AbS9I1AJoooN9LRjGsaHFJJlytTctiS7LR083ptbmrcDAqxZtVOzDWg3mpx+9Jq6XmvV+
	6T4VjEIDy9cQJ17CcOT9aqOp+61HDYrEje8L4ceGsUkyuXBe7/LzHAJTdUt4OQ1Z83qCBy9BLK7hj
	HrKGOEFpFTHTOBh11rR5yXUui7MTlz38/W/SLsEg+7c9me5VyUz1e/VkJl+k08ci7g0i+MEutpI8K
	DZpArFARXTYPSF2zhR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txJ70-00000007aJq-3AoM;
	Wed, 26 Mar 2025 05:15:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txJ6y-00000007aJL-2BeV
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 05:15:34 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5FFEF25C5C;
	Wed, 26 Mar 2025 06:15:27 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlOByq6gm0eH; Wed, 26 Mar 2025 06:15:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1742966126; bh=+LJCCKn0opKh5cFi0ybzchKJT1o2HCUGFb7DQNDom4k=;
	h=From:To:Cc:Subject:Date;
	b=GlKGdtJPQuAkjEi/XT/OFxcpclRpWYtA+k9DvLM7Znud+qCNCBJqJn4mp9BJy6W+/
	 PomhJVkhxGJKLP8LAlrm9XScPlP5VTtYtjhjGpx9YkeR4p1KMfJX180d2EwxFYHD2T
	 0IzNoCmqEb2pJ+mUhGXQYH7whcB5OWyTLmJR3dWroRa6tiFUN5A5jgBrr98PeXO5MA
	 VFVNCJJkqS4lCzymu76ghsLOxnSHIEW1Ghzy1ZPgm0yDgzs+wucD4cB41/zVC+SfWD
	 5UqH8SJUxkCZbUeziR9YOI7+q+N2CzzQbQjihnw8oELA/KqCKpPRZgXNHwKRjOKn5l
	 icyajgZHihFEw==
From: Yao Zi <ziyao@disroot.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Ying Sun <sunying@isrc.iscas.ac.cn>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH] riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
Date: Wed, 26 Mar 2025 05:14:46 +0000
Message-ID: <20250326051445.55131-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_221532_957089_B1AE6B23 
X-CRM114-Status: UNSURE (   7.55  )
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

Commit 58ff537109ac ("riscv: Omit optimized string routines when
using KASAN") introduced calls to EXPORT_SYMBOL() in assembly string
routines, which result in R_RISCV_64 relocations against
.export_symbol section. As these rountines are reused by RISC-V
purgatory and our relocator doesn't recognize these relocations, this
fails kexec-file-load with dmesg like

	[   11.344251] kexec_image: Unknown rela relocation: 2
	[   11.345972] kexec_image: Error loading purgatory ret=-8

Let's support R_RISCV_64 relocation to fix kexec on 64-bit RISC-V.
32-bit variant isn't covered since KEXEC_FILE and KEXEC_PURGATORY isn't
available.

Fixes: 58ff537109ac ("riscv: Omit optimized string routines when using KASAN")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---

I noticed RISC-V support hasn't been merged into kexec-tools, so this
patch is tested with this dowmstream branch[1].

Thanks for your time and review.

[1]: https://github.com/ziyao233/kexec-tools/tree/rv-Image

 arch/riscv/kernel/elf_kexec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 3c37661801f9..e783a72d051f 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -468,6 +468,9 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		case R_RISCV_ALIGN:
 		case R_RISCV_RELAX:
 			break;
+		case R_RISCV_64:
+			*(u64 *)loc = val;
+			break;
 		default:
 			pr_err("Unknown rela relocation: %d\n", r_type);
 			return -ENOEXEC;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
