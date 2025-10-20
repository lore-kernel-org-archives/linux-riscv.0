Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F0ECCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qR0tsOQcGiaGFCISye7WARMn6/L3ue2/xBoeJCrLI/w=; b=HBC6d5lVNichv8
	08LKgmjJgYjfcm1ARQbBwW3DUMTNDGlt5D7HyO8Ninrx3FjjE9ioNWtiUJ0kGWN5pJceNh+pBC9kf
	Rt0Frgd2jzcTvjens0ePYA3T52IIjfHBtpEd7xT94ppCb4DW+7FO1G2VJIwjt1gv+10X4lkg1qldZ
	OdSLROYW49qv5DLVffvrzm427c8DjkkuA96ElfM+K6Kiyzgbpe3P63xdwKVS8+sb4WIi6B9EXVacN
	RB6hT0GhZCarn9htUa519jWVBNF735lzV/g+8DMpaFtwi/vVqV1z890HJLlUCe2dinNMyMkuG9BXE
	BDuhFIDZnCqUsyu2gEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApgY-0000000DjLF-1plU;
	Mon, 20 Oct 2025 13:12:26 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApgV-0000000DjJ9-2nJX;
	Mon, 20 Oct 2025 13:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760965941; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=OBImoBy0givvKDy/jG9fhQjUBUsrZdSED+mmJaxLZFs=;
	b=QKUKbvAlMwoLlcLt3vyFGHQjubZdE/fdHWp6I7DaQelv2nKte0Yj9EGEynuMcdR3ASR63XAKNNrBZufqiKlj+HDXvEpwQV+aWBFC2srWK/j3uIx+nuArSlugYKpdYZQ8kPMUhy4wjIYJtGq0XH4hKqjiTuIfObjDTi+l2I70TmM=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WqcnIPA_1760965938 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 21:12:20 +0800
From: fangyu.yu@linux.alibaba.com
To: ajones@ventanamicro.com
Cc: alex.williamson@redhat.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	tjeznach@rivosinc.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v2 18/18] DO NOT UPSTREAM: RISC-V: KVM: Workaround kvm_riscv_gstage_ioremap() bug 
Date: Mon, 20 Oct 2025 21:12:18 +0800
Message-Id: <20251020131218.68932-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250920203851.2205115-38-ajones@ventanamicro.com>
References: <20250920203851.2205115-38-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_061223_844201_749761B8 
X-CRM114-Status: UNSURE (   6.91  )
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

>Workaround a bug that breaks guest booting with device assignment that
>was introduced with commit 9bca8be646e0 ("RISC-V: KVM: Fix pte settings
>within kvm_riscv_gstage_ioremap()")

The root cause of the guest booting failure is that an HPA is obtained
in the kvm_arch_prepare_memory_region.

Here [1] might be the correct fixes for this issue.
[1] https://lore.kernel.org/linux-riscv/20251020130801.68356-1-fangyu.yu@linux.alibaba.com/T/#u

>---
> arch/riscv/kvm/mmu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
>index 525fb5a330c0..994f18b92143 100644
>--- a/arch/riscv/kvm/mmu.c
>+++ b/arch/riscv/kvm/mmu.c
>@@ -56,7 +56,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> 
> 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
> 	pfn = __phys_to_pfn(hpa);
>-	prot = pgprot_noncached(PAGE_WRITE);
>+	prot = pgprot_noncached(__pgprot(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ | _PAGE_WRITE));
> 
> 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
> 		map.addr = addr;
>-- 
>2.49.0

Thanks,
Fangyu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
