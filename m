Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14C0C61DC2
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=shF1YkMnK4HjGlkza7WA8y2sKSH5YqFA5s0jRvM6Y+w=; b=OrDHnmuT553Rll
	0NOq65PPbnb9694V2Fu/QqeeC0ZggqX/vpb0UGnW1VE/0YuxTgorbTl5WUV5paPZZXtOMTkJ2n4BX
	TxzSm25osudIxlaRvt9xSFSz5z21zdjHA5Xgth9y2nK6Np7rllmmh0hlLj9PE6RwJX2IxtElMDBw+
	1yFrbyJr1d6hDSrehAbRyIg5T6hjPJXNX/WJPxtKyOV+lbyidbFck23va2JQAPEYDXYBCUG1p1j+Q
	VX0HGl1fhmeWdbORf8lPzbI7TMzntj79DUcC+bmo5AaQzClcl34SwYiKSdtIFdJ1+vlaYS5ceHNNE
	srjYC9L+LiWnYVA0JJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8Q8-0000000223t-2xcQ;
	Wed, 26 Aug 2026 07:51:40 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8Q4-0000000222s-1u2h;
	Wed, 26 Aug 2026 07:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Yc
	9zQrup+PpPpZzZy0ZJfYR/Eum3M2GHmGKdRuSVXHg=; b=TiYMbbu+bwW059ipIn
	zUb7y8sdSdJGiJ/g9FwN57dSTtescns9k4vvx1bhe8/Yl6H9d7LS82P0YztK/83W
	grW7+Ihz0SKcnwSez7X66VmAXFXFoMlQdUBnRSn3MW9pElJMAMWElJ0iuep0mqxM
	Bw1+bu7YZjYU0y96UIPE/bGPs=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDHjBGzmo5qahHQPg--.62147S2;
	Wed, 26 Aug 2026 15:50:16 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] KVM: riscv: Fix NACL hfence entry update order
Date: Wed, 26 Aug 2026 15:50:09 +0800
Message-Id: <20260826075009.68952-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDHjBGzmo5qahHQPg--.62147S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48tw1rXr1DAFyrWFyfZwb_yoW8KF4xpF
	WIkrWrKr4rGryag3sxZws7uryrW3Zagay5t39xuayjkrnxXa4rZwn7trZ8ZryrGr40gF1S
	vrWj9FWj9Fn8AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjPfdUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9BgTvmqOmrj41QAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_005137_771834_6AB7E79C 
X-CRM114-Status: GOOD (  11.47  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

The SBI v3.0 specification (section 15.1.2) requires a nested HFENCE
entry to be populated as follows:
1) find an unused entry with Config.Pending == 0
2) update the Page_Number and Page_Count words
3) update the Config word with Config.Pending set

__kvm_riscv_nacl_hfence() writes the Config word first, so the SBI
implementation (or NACL hardware) can observe a pending entry with
pnum/pcount values left over from the previous use of that entry,
resulting in incorrect TLB flush ranges.

Write pnum and pcount first and the Config word last. Since the
consumer is an external agent on coherent shared memory, use
WRITE_ONCE() to stop the compiler from reordering the stores and
smp_wmb() to make the parameter words globally visible before the
Pending bit is set.

Fixes: d466c19cead5 ("RISC-V: KVM: Add common nested acceleration support")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kvm/nacl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
index 9aff03c4f667..a5cda9a65156 100644
--- a/arch/riscv/kvm/nacl.c
+++ b/arch/riscv/kvm/nacl.c
@@ -42,12 +42,24 @@ void __kvm_riscv_nacl_hfence(void *shmem,
 		}
 	}
 
-	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
-	*entp = cpu_to_lelong(control);
+	/*
+	 * Per SBI v3.0 section 15.1.2, the Page_Number and Page_Count
+	 * words must be updated before the Config word with its Pending
+	 * bit set. WRITE_ONCE() stops the compiler from reordering the
+	 * stores and smp_wmb() makes the parameter words globally
+	 * visible to the SBI implementation (or NACL hardware) before
+	 * the Pending bit is set.
+	 */
 	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PNUM(i);
-	*entp = cpu_to_lelong(page_num);
+	WRITE_ONCE(*entp, cpu_to_lelong(page_num));
 	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PCOUNT(i);
-	*entp = cpu_to_lelong(page_count);
+	WRITE_ONCE(*entp, cpu_to_lelong(page_count));
+
+	/* Ensure the parameter words are visible before the Pending bit */
+	smp_wmb();
+
+	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
+	WRITE_ONCE(*entp, cpu_to_lelong(control));
 }
 
 int kvm_riscv_nacl_enable(void)
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
