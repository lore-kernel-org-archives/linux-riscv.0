Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB75C7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/SsrvkEuJ7xwzKVEhGDHgH9fphWAuJkhxsagNUUPWw=; b=saJXeh080jzF8q
	XBWLTYIkTYioqRSIx+TC3z3RJuwpTd+vKN/X8MbXqvHI9BfdN6tktMpt7XZBQsTTyor4vqB8yJT2x
	8iDy3PpidppI0+OEemEC0zqE90a7W2NMiI7kT5ZsUlb2F6zSFxXeTt/nbkTQVM5WbTSYAbYT/zV+5
	BNgP6R0unvBm5TctftsU3sCD2cnbLw3IUDuZtzrGJPlKc1OLZCMbDpyG4K/msRm3l5iWDGd/kXPMr
	YKl98umvaNj54ZUj2yipzUrhTmFFghE36wJ64Xed3VgcSOD0b4Fwsf1tQYFCQknsz0Juq7WpnWB33
	cBCPUSzneMwZJ7K7Nu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUV-008VSB-1P;
	Thu, 04 May 2023 18:15:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUS-008VQm-1E
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F03676354B;
	Thu,  4 May 2023 18:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF8BC433D2;
	Thu,  4 May 2023 18:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224139;
	bh=WFeiayG63gpQp4occGvr+vuuSR18T6kGBpB8q1BLM2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=huRm3EA0yysIW5cW2jSVv8/s+D/eNjyCvqL/09kCh5d2QWiXqBnT/OFw2eQGKuEAo
	 zyzPiYD5oJXOHMlUSgYWLPtrBPEKairF81ajetedeeyrbchPaBF7n6lgz43x/8Mepi
	 gBm19pNtiO3In4U73brGHVpOuay5v9R+xwqj/tPxML+yNol2mMkuKmP+uCj5MrcS2G
	 8gRK59bwRBAJloqk29EymnOfhcYo+nV1l0dcmkEdZLSgUjThCEM9JHbgsbOy8DyUbw
	 DiJ/BizRBcFd0PuPoCQuVHcvgeBjMeAbMV6WISkFPBjMfJ7IY8kh9v+2WaZLVCQCAj
	 OOJlUX4/cRhdg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 4/7] RISC-V: validate riscv,isa at boot, not during ISA string parsing
Date: Thu,  4 May 2023 19:14:23 +0100
Message-Id: <20230504-sultry-frostlike-9dbf19333725@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LzRABWZBYHCl/Zh9ART404rTGPlznpa1N0nvu/XU4Lc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX/8xM2269Y3jf8EDn+AD+U//vl4Wf/jKrkKh95P5n 0XGiWWe6ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEck0YGaY2GB1g1Zz/N0Rr 8eKoxxc+n3l9OSmQof+/cp3WYTX2CXmMDAt+Sn9vkvq2LmK15E3Ftb0yRwqnreQtTk1/aD1T8SW nFh8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111540_505288_911F1601 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Since riscv_fill_hwcap() now only iterates over possible cpus, the
basic validation of whether riscv,isa contains "rv<width>" can be moved
to riscv_early_of_processor_hartid().

Further, "ima" support is required by the kernel, so reject any CPU not
fitting the bill.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c        |  8 +++++---
 arch/riscv/kernel/cpufeature.c | 12 ++++++------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 7030a5004f8e..b0c3ec0f2f5b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -63,10 +63,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
 		return -ENODEV;
 	}
-	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
-		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
+
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
+		return -ENODEV;
+
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
 		return -ENODEV;
-	}
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ae456413f79..a79c5c52a174 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -130,12 +130,12 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
-		if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32", 4))
-			continue;
-
-		if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64", 4))
-			continue;
-
+		/*
+		 * For all possible cpus, we have already validated in
+		 * the boot process that they at least contain "rv" and
+		 * whichever of "32"/"64" this kernel supports, and so this
+		 * section can be skipped.
+		 */
 		isa += 4;
 
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
