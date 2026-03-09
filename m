Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A29BEFCD74
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NI5phqxerXz9htIEqtL2wHz33CB0X4YZv//aIQZX38w=; b=Q2Bs2OmGz/G9iK
	mm9LKHpWCwIf6FN0kgsodaricNSwW/zwl6ZZW9sezMWAiLMowlTkxG+BE8k3W4kbSHC4BuVZn8DUC
	TyZlNakkkCpKpwLZItJdyZnpFo1C9pdpluI/3vhPtYy5QXLZhY2wfgIZc/LEfpqBY/AcpTSKlQTtz
	y/cSm2SM+kjGBx2g+EyYZW4kQ3Gp+HpwxoMK0i2RMDITJ5tctJqYpXCWb7de2/qAd4UbMJ3bd02fV
	kKFeyRAS3zzEREJry8xGETtvwd+++/qO7Y9hf1EdWjNy4V7wf4B/LLsQ6Bsc33kJ7Hrz/V5wv5Zhq
	6sXAtjIkK8UDeDylLxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXqw-000000075ou-3pTf;
	Mon, 09 Mar 2026 10:28:46 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXqt-000000075o0-1FOn
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 10:28:45 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fTtWG6PDFzJ46vK;
	Mon,  9 Mar 2026 18:27:54 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id A6E264056E;
	Mon,  9 Mar 2026 18:28:37 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Mar
 2026 10:28:36 +0000
Date: Mon, 9 Mar 2026 10:28:35 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v4 0/2] Fix get cpu steer-tag fail on ARM64 platform
Message-ID: <20260309102835.000037ad@huawei.com>
In-Reply-To: <20260309041659.18815-1-fengchengwen@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
	<20260309041659.18815-1-fengchengwen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_032843_642290_E6EF8ADC 
X-CRM114-Status: GOOD (  14.95  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, rafael@kernel.org, linux-pci@vger.kernel.org, wei.huang2@amd.com, Eric.VanTassell@amd.com, stable@vger.kernel.org, wangliupu@loongson.cn, sunilvl@oss.qualcomm.com, linux-acpi@vger.kernel.org, wangzhou1@hisilicon.com, liuyonglong@huawei.com, Palmer Dabbelt <palmer@dabbelt.com>, jeremy.linton@arm.com, bhelgaas@google.com, Paul Walmsley <pjw@kernel.org>, chenhuacai@loongson.cn, linux-riscv@lists.infradead.org, wanghuiqiang@huawei.com, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 9 Mar 2026 12:16:56 +0800
Chengwen Feng <fengchengwen@huawei.com> wrote:

> This patchset addresses the issue where retrieving the CPU steer-tag
> fails on ARM64 platforms. The first commit is a pure renaming of the
> ACPI CPU ID retrieval interface (no functional changes), which serves
> as preparation for the second commit that implements the core fix for
> the steer-tag retrieval logic.

Hi,

For future reference, please keep same lists +CC on every patch
(for a small series, send everything to everyone who gets any patch).
For me at least, that led to my filter putting patch 1 in a totally different
place from the rest and some confusion.

Also, don't send in reply to a previous version. Just start a new email
thread.  That both avoids deep nesting in email clients and generally
ensures your series ends up in the right place if people are sorting
by time of sending.

No need to resend this time unless others ask for it. 

Thanks,

Jonathan

> 
> ---
> Changes in v4:
> - Split the rename into a separate commit.
> 
> Changes in v3:
> - Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() other
>   than add one new API.
> 
> Changes in v2:
> - Add ECN _DSM reference doc name and its URL.
> - Separate implement acpi_get_cpu_acpi_id() in each arch which supports
>   ACPI.
> - Refine commit-log.
> 
> Chengwen Feng (2):
>   ACPI: Rename get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() on
>     non-x86
>   PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
> 
>  Documentation/PCI/tph.rst          |  4 ++--
>  arch/arm64/include/asm/acpi.h      |  4 ++--
>  arch/loongarch/include/asm/acpi.h  |  2 +-
>  arch/riscv/include/asm/acpi.h      |  2 +-
>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>  arch/x86/include/asm/acpi.h        |  2 ++
>  arch/x86/kernel/cpu/common.c       |  8 ++++++++
>  drivers/acpi/pptt.c                | 16 ++++++++--------
>  drivers/acpi/riscv/rhct.c          |  2 +-
>  drivers/pci/tph.c                  | 11 ++++++-----
>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>  include/linux/pci-tph.h            |  4 ++--
>  12 files changed, 35 insertions(+), 24 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
