Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E60CC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 16:44:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F6F61042
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 16:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F6F61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dDp40h3jAdLhIZ6G0sRySOEYfLB1Dx+ChA0PCXzzPzE=; b=AqFIETtbS96zpKF9H+/4dcPdMn
	hEEGqFqR2skyERHeB4/O5FKDkekYZRk+afL8UEeAxOq5EKPkuUZOH2VaJhv/YVZFaL5Mh4VA0E/1P
	tEeDFKVFUlHYCPbg6Bcqf5P3Pk1mUk3gTcAhK21QEk4CL2f4TDFvfsAdJIa3iOToPxv+1+igNqWFH
	y5rRCIvRaKBx+IOmM3c60ZFX9+ShL/63jCW+7nTtI/VEQq5jTjDZRz9VrURrexYfWe+GrmS2n8RHO
	zdAzWsSx77x7xeVtfkt7A0zXXev400H4ZNZ8HkNemNnLRhIeJYqHVw2H1l3OGFPgHxFSFurhvXw7W
	MimgJvWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRZm-002plA-7D; Fri, 16 Apr 2021 16:44:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRYX-002p3h-Ui
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 16:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=V43aKoKjJB1GJ8L7DevKb0+AH+9zmQ4aFsOcNjBKj8s=; b=fYWoAZN/uy4lQHZLHdkwkcerwS
 rTA/R/cFGraOVuXm9gqhzRvSC4jAR9Y4lCHByHDNGk6cLjC3ydYC+3mDfoSrfM+Ouyt8wJvu32q1G
 +9v5L7Kr8aX+vNF5Rhl7gjGZarKInwqdwpAHSyFWQTvquz7LbAe5BFL0AT/nKD6XMpHNlKv5bqRYF
 XA2xY8acQyXHW0CYzkgUln4ASmAYg70IwzFZTFrWuJAcYKWri1P7nz+dC2DIKD7Qm5LGunP+sZ8yM
 fhjzqh5eqIZ3HG3hAdi20Ml4dZkUgmb4NgZJFY1Id1lJsVxTTAcTQVViMCqQWcAODqu4fz/dQBvnA
 SmhP5oFw==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRYK-009Z57-J6
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 16:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=V43aKoKjJB1GJ8L7DevKb0+AH+9zmQ4aFsOcNjBKj8s=; b=lzmx+h887qjx7
 O0htMlV0I1+BsqSCqTegZP4WtLOZkUTUyye/MuHnceRA7RhAunqWF42YwuPUyZxU
 sLX0tJr7Db9mu0GK9EhJHlELFjAYj9JcLEa61JvYojRYztWTH/KVh5ZIeJRTRbtK
 NOeB81WkiWOQy+m0u1CUin2hyGghKo=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAnLkpyvnlgag7tAA--.45092S2; 
 Sat, 17 Apr 2021 00:42:28 +0800 (CST)
Date: Sat, 17 Apr 2021 00:37:22 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH] riscv: mremap speedup - enable HAVE_MOVE_PUD and
 HAVE_MOVE_PMD
Message-ID: <20210417003539.5bceabc2@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAnLkpyvnlgag7tAA--.45092S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy3tw1rZw4rXw1rXrWrXwb_yoW8Zw4kpr
 ZIkF9akrZxWF1Ik3yayry8W3yru3Z3WaySqryxGa48ZrW5trWDZrn2qw45JryUGFyvv3s3
 Wa13Kry5G3y7u37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
 xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094245_625903_2A9C19FF 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Jisheng Zhang <jszhang@kernel.org>

HAVE_MOVE_PUD enables remapping pages at the PUD level if both the source
and destination addresses are PUD-aligned.
HAVE_MOVE_PMD does similar speedup on the PMD level.

With HAVE_MOVE_PUD enabled, there is about a 143x improvement on qemu
With HAVE_MOVE_PMD enabled, there is about a 5x improvement on qemu

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
Hi all,

After reading the risc-v privileged spec, I think it's safe to support
the HAVE_MOVE_PUD and HAVE_MOVE_PMD optimization on riscv. The patch passed
the mremap_test on QEMU. However this can't be tested on real HW due to lack
of HW boards, this is the reason why I mark this patch as RFT. I hope I can
buy a sipeed Allwiner D1 SoC powered SBC soon, at least I can test
HAVE_MOVE_PMD. Helping me to test on real HW is appreciated!

Thanks

 arch/riscv/Kconfig               |  2 ++
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e8074d248457..37660de68b00 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -80,6 +80,8 @@ config RISCV
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
+	select HAVE_MOVE_PMD
+	select HAVE_MOVE_PUD
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ebf817c1bdf4..287733b95d10 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -360,6 +360,18 @@ static inline void set_pte_at(struct mm_struct *mm,
 	set_pte(ptep, pteval);
 }
 
+static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
+			      pmd_t *pmdp, pmd_t pmd)
+{
+	set_pmd(pmdp, pmd);
+}
+
+static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
+			      pud_t *pudp, pud_t pud)
+{
+	set_pud(pudp, pud);
+}
+
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
 {
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
