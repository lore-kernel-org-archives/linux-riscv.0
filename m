Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC06CCCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BZ9nghuDDeg2RXai01bblVbzyu7ln7n5zanGkDeXgUE=; b=bmCpzv1MJcWJxP
	Piflm6SeShZGzEfNOSOCxQSE+96ZDECyEULKWOFw1uaGGn/SM8RKGeOqk636TRsrS45g2Uq4v/u2l
	2Kce3DlQ88PpYV7AhBvL8bdzBqoQsOiCpH/NnF9lX5PgaSkehjEoYCs2R5I3FjbGJF++a1GncZ29V
	S35KEKoxbjd6pUcs26N5F+gb0KRiG3GHkJYoyQy+D+dYVutqasS/hhM7AQ8qifRabzL8GapYSnIdO
	f/Q6AxDbqvxn+Gnwn4rT/X2G4u4uK1yZntgYaER99gKkfixO2gi4Gf//BuiazoKMEu/HlZhsy0/m3
	211L6Ry8MNmqlx4B/cOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHey6-00000002aKe-1HfZ;
	Fri, 16 Oct 2026 10:15:18 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHey4-00000002aJp-37Wd
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 10:15:17 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc147d86bebso568581a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 03:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145715; x=1792750515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vf6qHtCJHYPPUhzxjpIczur0NsiTKA4BX6nz592iMDQ=;
        b=I4AnClJJpBsUjoomJCSr8Wmi2RKggkmlN1Y+jfWT18RFVCuotAXk3URdXsAGAD7doP
         aSnqGJc/2qRdxzK1/f/1Pqawf1tbOhe5+lvA+xxAF9Zig9scg7FMAQqsJwwOef316oOq
         3naSS7AxqCrSc0KAMjn/qhrID54/Ot8Dh4QnhEMGk2sR6oOROOB5Vkq4CCU6IOJunO2/
         uPCHJb9SGncmvlumTuv1CQbZhR5RasElwiwoIP365GGO6Cng1ME/OjlCniJUaTMrBkGl
         xpiHAPNuloBbeYkT7Xq8vPF+B4uOrTCEnvEurTMGbtx9G4vFKmawXbGSELtfI91s7Mdz
         HZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145715; x=1792750515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vf6qHtCJHYPPUhzxjpIczur0NsiTKA4BX6nz592iMDQ=;
        b=wo7EdxpD0ZOWJva/nhRbCizJZzDWjQj3p7ydd15vImFWO36AgCyY8jNTrugqEyRJed
         SbdZCdx/FadTyagy2J2fPhQy29PXg3HGNnttI/fGF8vNg/pLNLwhyV1ETyz2ahBdF8Dj
         2fGTNug0wF0tisNiqr5iOS0ePrIhbQChjM+yKzcPm8kKR18nnCxhyehAQvoeIl2iMrf+
         lhvD1UgwY3XIcabnlBWcPFPjlgwSmuYzGUu6f9upmm9r775As1kNMF8AaqE7jzvW4nZ4
         B5LNt5SPGseNzdOe3kGEQgBLDxrzR8AC5hvKKyXowzqIAorttx2DCGLFzhi52vLP0WAb
         zO6A==
X-Forwarded-Encrypted: i=1; AKwUvBw9XjFruJAY0Zlrr/1IpoQu+UKKVSKKS34l9s0ckhvBxUyxSLCBEVXd88c5ImuKI0FOiwzdL8CCKdsbRQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLmqFGCqmttU+fy4iwPbtcLdVs/TZyYI8IbOJoP9npfYyCdkdYP
	N/ciisL0YQjetQf8ddqX1xN/qoR5LzsiJ+o6XDZBtUqJsMiwMQHcWad5
X-Gm-Gg: AYBFou2BWEwthU5IcEzj07c6ssR5OfQClzQDk0as+pZ6Ecd0wnqSBn9Zgi3BAFcoTjw
	DfQuKL9yo0pFKrryw6U4ZFbB3HIGx1onXw9SpG1YdDwxvlcA8zYsEtcLte8RUXBJo5ZJ/SZo2mS
	HIDNgPo8QYQBskx2YXy5VxIe0XkOKf5YLQ6azmJnd70lrweOkuxDIpc7+kntU7zvSgRvPXZ6qjS
	FIGN4X7vaRtVaETDoH14Cs/6sGoL526My+XqhpQgtLpOV8fNaaKvk+b9aBvAXAto9Oex8gMvVZn
	4RPggPbSHaQT5EOid3Q2Cna/UqMauX7gT9r8HZMTjKbYozyBKUB/5OgblGWjXWyxZ/8WGZoFAKX
	NgNO9Me3tvZVEbJcMw8WHyBhf6Un4p180oK+5cNatRSPqfJ5BxDz59Lysu7mVPqE6eNUMJut6pP
	xcZSpaqiodF8mT82mI1tG97QzsJRU0wnG9p3YtdJatoCMH+xRcjuohJt9l6zBr2hiQ8Mljl3XfK
	QdmSmrstiKnjGoHpirmOw==
X-Received: by 2002:a17:903:2f8b:b0:2df:b004:df28 with SMTP id d9443c01a7336-2e9772b0555mr20367255ad.35.1792145715452;
        Fri, 16 Oct 2026 03:15:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e85fd1dsm7876465ad.49.2026.10.16.03.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:15:13 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: Set Accessed bit in dirty-log write fault fast path
Date: Fri, 16 Oct 2026 19:14:58 +0900
Message-ID: <20261016101458.221648-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_031516_790179_7DFFC725 
X-CRM114-Status: GOOD (  12.24  )
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

kvm_riscv_mmu_dirty_log_write_fault_fast() considers a leaf with W
and D set already handled, even if aging has cleared its A bit.
On hardware that faults when A is clear, the fast path returns
true without setting A and skips the slow path that would set it.
The guest retries the same store, but A is still clear, so it
faults again. This repeats indefinitely, preventing the guest
from making progress.

Host reclaim or page_idle can trigger this while dirty logging is
enabled, potentially hanging vCPUs during live migration.

Require _PAGE_ACCESSED in addition to W and D before treating the
fault as handled, and set A along with W and D. The existing
cmpxchg loop retries if aging changes the PTE before the update.

Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
Cc: stable@vger.kernel.org # 7.2+
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
Testing:

On a HiFive Premier P550 (EIC7700X, which traps on clear A/D bits),
run:

dirty_log_perf_test -v 3 -b 256M -i 3

While the test runs, repeatedly mark all system RAM idle through
/sys/kernel/mm/page_idle/bitmap.

Before the fix, the test did not complete its first iteration in
over 11 minutes, with lock_stat showing about 16k read-side
mmu_lock acquisitions per second from the fast path.

After the fix, all three iterations complete, each taking about
29 seconds under the same aging workload.

 arch/riscv/kvm/mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 78a1826c466d..042d1e3b3547 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -591,14 +591,15 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
 			dirty_marked = true;
 		}
 
-		if ((pte_val(old_pte) & (_PAGE_WRITE | _PAGE_DIRTY)) ==
-		    (_PAGE_WRITE | _PAGE_DIRTY)) {
+		if ((pte_val(old_pte) &
+		     (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) ==
+		    (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) {
 			new_pte = old_pte;
 			ret = true;
 			break;
 		}
 
-		new_pte = pte_mkdirty(pte_mkwrite_novma(old_pte));
+		new_pte = pte_mkyoung(pte_mkdirty(pte_mkwrite_novma(old_pte)));
 
 		if (kvm_riscv_gstage_try_update_pte(&gstage, ptep_level, gpa,
 						    ptep, old_pte, new_pte)) {
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
