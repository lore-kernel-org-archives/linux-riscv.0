Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2274C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/32v6YusKsTObYISBaGNiatUaZsAzpKfCw5qxUkms4=; b=YAvvJ8KRkmnBV/
	4E9OMRSqPkJoLD9NFUlDTBev5j+5opQ5RRIUKUc+pfD8dJcvaGBzg6pR3fwH6Zk8mHzhGI52q2SM0
	IVunEBsbFHAx6LGmper+FR8j0QoLrgWj95rSbZsz1jxAfNw6Whmz3znH2vSXM/l3C4bWmIHAWYhX9
	q2OA+62HVyBdGPEtudOyZf7QzuBXmqU9uUcInHNshjYrKSjdpbSCtxGiyqZqI+ylZaIeGcdlwapQd
	2ajqrGw9A6Kc04Ny/p91dzOkGZ0D4nD7jqUX5fTPnU5UroGOeqcKfA9zEebnCG/rHaZnq65eAb/aD
	rq1tDI0XabRrhAdOnUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcbc-0000000C03V-0atz;
	Tue, 14 Jul 2026 12:51:24 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcbY-0000000C026-2CTk
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784033474; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=PlXcFe9PGrAD8oJJaTsvKAGmMOdAO7oL5qurnCWKNFY=;
	b=W+9PO0RE6wSg6E2qMk8b87Ny/v9LkxdYmjQFVGvRqLm+uqLg+F6Yoj21Pv4G0E8ZciR6B4SScuwThGuhZ5GOIkjfO4LBGDOtlJP+GP3iKDBOLV6vnoteaMOc/V08CMAW+oJR50BC2p5X+dbhYRB1pCEIVlGoK74m10H6p/fFt/4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X74eRpR_1784033455;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X74eRpR_1784033455 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Jul 2026 20:51:14 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Zong Li <zong.li@sifive.com>
Cc: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v4 0/2] RISC-V IOMMU HPM support
Date: Tue, 14 Jul 2026 20:50:47 +0800
Message-ID: <20260714125055.1974-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714083625.1083606-1-zong.li@sifive.com>
References: <20260714083625.1083606-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055121_300143_801AC211 
X-CRM114-Status: UNSURE (   7.82  )
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

On Tue, Jul 14, 2026 at 01:36:20AM -0700, Zong Li wrote:
> This series implements support for the RISC-V IOMMU hardware performance
> monitor.
>
> The RISC-V IOMMU PMU driver is implemented as an auxiliary device driver
> created by the parent RISC-V IOMMU driver. Therefore, the child driver
> can obtain resources and information from the parent device, such as
> the MMIO base address and IRQ number.

I tested this series on QEMU and it works as expected.

Test setup:
 - Base: v7.2-rc2, both patches applied cleanly.
 - Kernel: rv64 defconfig with CONFIG_RISCV_IOMMU=y, CONFIG_RISCV_IOMMU_PCI=y,
   CONFIG_RISCV_IOMMU_PMU=y and CONFIG_PERF_EVENTS=y.
 - QEMU 10.2.0: -M virt,aia=aplic-imsic -device riscv-iommu-pci
   (hpm-counters=31).

Results:
 - The RISC-V IOMMU probes, the auxiliary device is created and the PMU
   driver registers successfully:
     riscv_iommu_pmu ...: Registered with 32 counters
 - The PMU shows up under
   /sys/bus/event_source/devices/riscv_iommu_pmu_<BDF> with the expected
   9 events (cycle, untranslated_req, translated_req, ats_trans_req,
   tlb_miss, dd_walk, pd_walk, s_vs_pt_walks, g_pt_walks) and 7 format
   attributes; "perf list" enumerates all of them.
 - No oops/WARN/KASAN splat during boot or driver bring-up.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>

Thanks,
Pei


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
