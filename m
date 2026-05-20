Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BFECD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GZJpa8uewV/MSWIX9cNzlmTOUJUPseO+S2iePqEVnM=; b=elDQMdWObdt4SR
	n+vfD2C+cM4DF7hUmMG25agDJqEBjX7uyPWclTUEFEiG7u7Hsolf53ZoBfU/5030n85QDNJhie2pL
	sk++t6D1FqJP3lox4vB7Ma33RjgEfQxdJEnuyQXVpBHx7PQDb07Ybujpj1k1OnRyzaxHyQz2ecC4W
	eneN1uTKCfazJicJh/vZ4l5qGqKiA4aMHMPVpUlPsMnkjXiGTZ/PAxh+Z1+6gf/oPJjk+QmVmaVZP
	QNxCNaCThDAo5FZ6Ppo81gC4cpO3djaIJHkaKE7UiHryyEcjnMkOzfsg+oPAS0R0kzQ+i+buWzoA0
	aku0kVt+cL3kThvz0v0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPilc-00000004y4N-0Hkd;
	Wed, 20 May 2026 15:23:28 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPilZ-00000004y2N-0n6i;
	Wed, 20 May 2026 15:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=od
	Esu4ivXyLhWqfIiJF0LkZTv8IhxJkl47gzx8ElsNs=; b=S6jodwsxcndgSb0jAD
	n6oGNFcijbWgLISH9fFniKQsT77rfB4PAeCGPisPrk7g82gWY9n2CpmJdU2cmMpO
	emUQBV4HCarL30Hhw4VVLiIY1L3JpZDts/ZpHP3VMlWsQutVN52ELdENyuA5Ikfn
	mr0+1JxESly3Po2QQei8W52zs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAnt1md0Q1qGHMGCg--.33359S3;
	Wed, 20 May 2026 23:22:09 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm <kvm@vger.kernel.org>,
	kvm-riscv <kvm-riscv@lists.infradead.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH 1/3] KVM: riscv: Pass the target size to huge G-stage checks
Date: Wed, 20 May 2026 23:21:46 +0800
Message-ID: <20260520152148.131272-2-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520152148.131272-1-tjytimi@163.com>
References: <20260520152148.131272-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAnt1md0Q1qGHMGCg--.33359S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1fKw47JFWxKFWktFyxZrb_yoW5AF1rpF
	47KFs0krWYyr15Ww4SywnrW34rZr4rG34UJa4Utas0yFs8KF12gayDAay5XryYvr93XF47
	uF4avay5u398KaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEqg4xUUUUU=
X-Originating-IP: [2408:823d:2011:b54:c309:80a7:694d:2e40]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC0AF68moN0aFatQAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082325_602893_3FF42F12 
X-CRM114-Status: GOOD (  15.30  )
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

fault_supports_gstage_huge_mapping() already contains the two checks
needed before installing a G-stage block mapping: the userspace address
and GPA must have matching offsets within the block, and the whole block
must be contained within the memslot.

The helper currently hard-codes PMD_SIZE because its only caller is the
transparent hugepage path. The hugetlb path needs the same checks, but
the target block size can be either PMD_SIZE or PUD_SIZE depending on the
hugetlb VMA.

So pass the target mapping size into the helper and use it for the
alignment and bounds checks. This keeps the existing THP PMD behavior
unchanged and prepares the helper to be reused for the following hugetlb
fix.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/kvm/mmu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024..10be8f683 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -286,7 +286,8 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
-					       unsigned long hva)
+					       unsigned long hva,
+					       unsigned long map_size)
 {
 	hva_t uaddr_start, uaddr_end;
 	gpa_t gpa_start;
@@ -300,8 +301,8 @@ static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
 
 	/*
 	 * Pages belonging to memslots that don't have the same alignment
-	 * within a PMD for userspace and GPA cannot be mapped with g-stage
-	 * PMD entries, because we'll end up mapping the wrong pages.
+	 * within a huge page for userspace and GPA cannot be mapped with
+	 * g-stage block entries, because we'll end up mapping the wrong pages.
 	 *
 	 * Consider a layout like the following:
 	 *
@@ -321,7 +322,7 @@ static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
 	 *   e -> g
 	 *   f -> h
 	 */
-	if ((gpa_start & (PMD_SIZE - 1)) != (uaddr_start & (PMD_SIZE - 1)))
+	if ((gpa_start & (map_size - 1)) != (uaddr_start & (map_size - 1)))
 		return false;
 
 	/*
@@ -336,7 +337,8 @@ static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
 	 * userspace_addr or the base_gfn, as both are equally aligned (per
 	 * the check above) and equally sized.
 	 */
-	return (hva >= ALIGN(uaddr_start, PMD_SIZE)) && (hva < ALIGN_DOWN(uaddr_end, PMD_SIZE));
+	return (hva & ~(map_size - 1)) >= uaddr_start &&
+	       (hva & ~(map_size - 1)) + map_size <= uaddr_end;
 }
 
 static int get_hva_mapping_size(struct kvm *kvm,
@@ -404,7 +406,7 @@ static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
 	 * sure that the HVA and GPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_gstage_huge_mapping(memslot, hva)) {
+	if (fault_supports_gstage_huge_mapping(memslot, hva, PMD_SIZE)) {
 		int sz;
 
 		sz = get_hva_mapping_size(kvm, hva);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
