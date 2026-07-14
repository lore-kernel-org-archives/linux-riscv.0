Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AB7C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQGy2iqIrpPJpRq6+ZcAnOk0J9WlD6Hkeql5BvLqS5M=; b=gyDg5YrLrNr7hC
	Ny//AiNUkEU9sAzAXAJOIVFgBE6bkqumnBAbRhDRfuDwzUeX2RRhwAT97+lMFg0OCG3esCkq2pq84
	+mhO3benBB05q7OeSRjnx0Hz3Jw4iWl91OJm4zIjBk7h/h1SJIbp8tWIS3mVWGAk0MoxSg9ZPK/8H
	KBhGokiWBh2VQsL0yl2hi67DAcxFrG2XtbGuwVW43OoJy2zJyMV/v6GRkpXQT774b05hy2/17xMQe
	v3gpplR1cbjy9Nn3f1fW5PiO49/tpsLLuQCIz2IlBceC2I7l5wn4A9/ojx2k+GqQdBHodaq4wtpHd
	RF1X0Y68LJczSTX7AHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcwp-0000000C7el-1GuU;
	Tue, 14 Jul 2026 13:13:19 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcwm-0000000C7dH-3O7g
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784034792; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Cvw+yLgfc5nxnZnw4xOzJ2gkqA3uMTGlyfIEWyjk02o=;
	b=rFcz8eK4Ub0ug6UyPzvitO3fJlgiDfKQkCqvzCaiTp5Yf3lv9GZfrNdzq03UgBQThvhTwIPcPkzlbpnZTvXhi/lA8ygDxgi2o2Q359422KGs4fUKKx0S0uqKBmWyJgqCmBjlextJp2EbGL3S07mDU/GEg0hh6DhDdn5xRdQZWNs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R381e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0X74q15Y_1784034788;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X74q15Y_1784034788 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Jul 2026 21:13:09 +0800
From: fangyu.yu@linux.alibaba.com
To: zong.li@sifive.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	david.laight.linux@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mark.rutland@arm.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	will@kernel.org,
	zhangzhanpeng.jasper@bytedance.com,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: Re: [PATCH v4 0/2] RISC-V IOMMU HPM support
Date: Tue, 14 Jul 2026 21:13:05 +0800
Message-Id: <20260714131305.55950-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260714083625.1083606-1-zong.li@sifive.com>
References: <20260714083625.1083606-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061317_039396_A9FD4EF4 
X-CRM114-Status: UNSURE (   6.23  )
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

>This series implements support for the RISC-V IOMMU hardware performance
>monitor.
>
>The RISC-V IOMMU PMU driver is implemented as an auxiliary device driver
>created by the parent RISC-V IOMMU driver. Therefore, the child driver
>can obtain resources and information from the parent device, such as
>the MMIO base address and IRQ number.
>

Hi Zong,

I tested this series on a riscv64 QEMU with a QEMU NVMe device.
The NVMe device was enumerated correctly, and the RISC-V IOMMU PMU
events could be counted successfully while running I/O to the NVMe disk.

The following command completed successfully:

  perf stat -a \
    -e riscv_iommu_pmu_3010000.iommu/tlb_miss/ \
    -e riscv_iommu_pmu_3010000.iommu/cycle/ \
    -e riscv_iommu_pmu_3010000.iommu/untranslated_req/ \
    -e riscv_iommu_pmu_3010000.iommu/s_vs_pt_walks/ \
    dd if=/dev/nvme0n1 of=/dev/null bs=1M count=100

100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 1.43612 s, 73.0 MB/s

 Performance counter stats for 'system wide':

             26449      riscv_iommu_pmu_3010000.iommu/tlb_miss/                                      
            256659      riscv_iommu_pmu_3010000.iommu/cycle/                                      
             32063      riscv_iommu_pmu_3010000.iommu/untranslated_req/                                      
            132245      riscv_iommu_pmu_3010000.iommu/s_vs_pt_walks/                                      

       1.464510700 seconds time elapsed

Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
