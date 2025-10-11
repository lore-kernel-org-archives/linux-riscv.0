Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA5CCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CMrJwk0n7mdK57C1z21bZyNpdgA61Wv1+F4rzlCYozg=; b=3bT2KQkpsBSJBo
	ddjV0y7OsQsu89/AA19hqnhPXd2/KHo43CFyRX47pKgFDwJrzGWi0mNS3au0m6Z2amwLahUPRl29E
	kbz59MBMSgJ8hH7HKH2irymAk5QFHlrrPXbiIA3TYmYowZ8BsSdTK+jEZK9Z6gO/YDxKwguQewF9y
	QW9GozUsCOP/rekkub/D2zxHtms4ohfbGvB4NriLYa+ecYP26ayywhaBbv5H/npMKberDMXisWENl
	7o/o28UG7ErRMpE4CVxjP8/igjiWWvvJa9wkaEKtfyhuvZgHwIqkqhbzqDDpkodM7EydGK0VrmM7o
	K585YfyvoH2OylymhPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7bzL-0000000AJie-0ccJ;
	Sat, 11 Oct 2025 15:58:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7bzI-0000000AJiJ-1iEz
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 15:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 841BA4429A;
	Sat, 11 Oct 2025 15:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7CDC4CEF4;
	Sat, 11 Oct 2025 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760198305;
	bh=13vVZxNHU2kX9V+J8ofU5hUJOLq7n/KvIycm49QX6jo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ne1UVR+Y3FkFUoYr4J7Iv6hMXn0a26q4gHUnserlAo7mygmvjStku6D7AIQXjzheS
	 ooOIOfK0wFs2agrd7tEznLfh7MzPTPtXDFebfLJTF8TuK0btR9Dv97t34uWRW9+BK0
	 NwioQHlKq5T9UaLhCGGUAqwS1LrbNORabiTxaur8zAo3orIzi/mb6FlEIKic1kGZPX
	 z4e/oNmBv+lU2mpKYgFhxWq0V4qNX3FqOZcS2xeT4kft1z/yIxlUcPZLx2/BHMlQwe
	 D3olGTpEBbXSoUoFhxT+PUvB+qqLZGqabusj/aKFt0eciFGm4jX09hg1C4Cs3Q7G+O
	 iq+SnnN+Nk6Zg==
From: guoren@kernel.org
To: samuel.holland@sifive.com,
	david@redhat.com,
	yongxuan.wang@sifive.com,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com
Cc: guoren@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Add pgprot_dmacoherent definition
Date: Sat, 11 Oct 2025 11:57:46 -0400
Message-Id: <20251011155746.1558731-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_085828_466127_19F98102 
X-CRM114-Status: UNSURE (   8.61  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

RISC-V Svpbmt Standard Extension for Page-Based Memory Types
defines three modes:

 Mode | Value | Requested Memory Attributes
 PMA  |   0   | None
 NC   |   1   | Non-cacheable, idempotent, weakly-ordered (RVWMO),
      |       | main memory
 IO   |   2   | Non-cacheable, non-idempotent, strongly-ordered
      |       | (I/O ordering), I/O

The pgprot_dmacoherent default uses the IO memory attribute if there
is no asm definition, but IO is not for main memory according to
Svpbmt rules.

This commit corrects pgprot_dmacoherent with the NC memory attribute,
which satisfies performance improvement and prevents using the IO
attribute to access main memory.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 29e994a9afb6..2a84479de81b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -654,6 +654,15 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
+/*
+ * DMA allocations for non-coherent devices use what the RISC-V architecture
+ * call "Non-Cacheable" memory attribute, which permits idempotent, weakly-ordered
+ * (RVWMO), main memory. This is different from "I/O" memory attribute which is
+ * intended for MMIO access with Non-cacheable, non-idempotent, strongly-ordered
+ * (I/O ordering), I/O attributes.
+ */
+#define pgprot_dmacoherent pgprot_writecombine
+
 /*
  * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
  * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
