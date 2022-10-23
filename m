Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6D7ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p3QL6aTqOZPqxuLIrx4KYotnmGiAfAmCvmarbvnO8xk=; b=dJ7zPAXVVdmuK1
	Nm0KEXW9gGpdLxJLKloTLMHKck7BZhu3DV0ovn6OQp8BlTxB4uSFp4uFsiDGtZ938pht0z9fYFkk3
	JkJMauwtJLmkZ6ydADjTF4sldSEXBHr98AbpkuMA80iqLfcSfJBgYLWIodsMvIfRXWNMAWjnsVZj3
	GljdEjcVHJPxChAyK2zrXFTuOplzru0MsHD+yFdU8ybn9ljI19dC36+YUdjLba+u5gFXfb967MEdq
	sA2iftDTGsSosODv0IHKtCLDUOS0EyIxq3XGAxJcqmk4KDP3MnrJnPzgNNcCxNVcYGqtNQpcYRSf+
	q08+o5VSFBUfV6rrsFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omb6w-00FM4U-RC; Sun, 23 Oct 2022 13:33:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omb6u-00FM3J-Is
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 13:33:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47B7460E05;
	Sun, 23 Oct 2022 13:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11926C4314B;
	Sun, 23 Oct 2022 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666532028;
	bh=QJ7fR+gHywsczUhCwjPOdR2Nl2xq5s+MM7Zax4w8w9w=;
	h=From:To:Cc:Subject:Date:From;
	b=Y22/Nw6qhMXCSnZbqhtnLDFteTfssdSmaPHl1PMAiT1VRJoveIq/uCM0ERbB8h131
	 4sDIRXSjSdnNyY8heVMn78H9JBlSjFGUBEzNBN0WfG6fy5paB+J07Rmt/gbax7UpP7
	 BbBXon3Yfgn6RQTnKs/LY0SBUtZaGb+YS3fJAAYU0w7GLuiECDx+TjqyQHzDi9a7HE
	 cSFn0brFJiP6dK7IAvjvUmrSjQV1XTkxHkBJRYCdzJc0TNOSPuTwin8/la2vRy0naR
	 kdb++uEG6YhGrvaVccMsffZPkSKfmY7zRYlHt0hU//YhzCGPtZYTfmnJHnLme2VcPq
	 V3M5NIC2fja9Q==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	heiko@sntech.de,
	arnd@arndb.de,
	songmuchun@bytedance.com,
	catalin.marinas@arm.com,
	chenhuacai@loongson.cn,
	Conor.Dooley@microchip.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/2] Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP & fixup race condition on PG_dcache_clean
Date: Sun, 23 Oct 2022 09:32:03 -0400
Message-Id: <20221023133205.3493564-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_063352_690519_AF37460D 
X-CRM114-Status: UNSURE (   7.13  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The first patch fixup race condition on PG_dcache_clean which found in
arm64. Then enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP and tested
with simple hugetlbfs test case.

# cat /proc/sys/vm/hugetlb_optimize_vmemmap
1
# echo 8 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
# mount -t hugetlbfs none test/ -o pagesize=2048k
# ./myhugemap_test
# umount test/
# echo 0 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

No problem found.

Guo Ren (2):
  riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
  riscv: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP

 arch/riscv/Kconfig                  | 1 +
 arch/riscv/include/asm/cacheflush.h | 3 +++
 arch/riscv/mm/cacheflush.c          | 7 ++++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
