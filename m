Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BB8C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 02:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXY6Cae1DslP5hvs3JgGtXZVZB69x41671Zf3RYll8Q=; b=YTRHRAfoe8l9cR7RI/NP4V16g6
	HMvBko3tQM/CTXxfXu9x/QteOug06FzUlDnH0ef/IuTJ7mxJxrd9vNTsBqxFBE/dJ2V7BlVtlhJRX
	hq8nn4C92CvXSTqgbjTAvREzcG5TqdCfhBenyY39Fz6XgOFuTjmx4zUrhWd8d/oemCDHCWfPV2y9a
	tHdv6pdGyyAlMoPc/+aLoCrWU2bNF2BZ5Kv6AL72ZDG9teZn8sr6/xe7mcoWbTxTEH+dYt3L6IuRh
	I6jmbaQNtTl7AQotUuQ6WDw1E4OuCfMinl4jka3BhNFhcxmxs7TV0XHPOy/AAFiUpMHfgic4GcYAC
	z6hedRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZPx-0000000FI6U-0L40;
	Mon, 24 Jun 2024 02:26:53 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZPp-0000000FI53-2gsR;
	Mon, 24 Jun 2024 02:26:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W6sDP5dnlzxTFc;
	Mon, 24 Jun 2024 10:22:13 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 043F718007C;
	Mon, 24 Jun 2024 10:26:31 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 24 Jun 2024 10:26:29 +0800
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
To: Haibo Xu <haibo1.xu@intel.com>, <sunilvl@ventanamicro.com>,
	<arnd@arndb.de>
CC: <xiaobo55x@gmail.com>, <ajones@ventanamicro.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor
 Dooley <conor.dooley@microchip.com>, Andrew Morton
	<akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>, Baoquan
 He <bhe@redhat.com>, Evan Green <evan@rivosinc.com>,
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Zong Li
	<zong.li@sifive.com>, Sami Tolvanen <samitolvanen@google.com>, Alexandre
 Ghiti <alexghiti@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Jisheng Zhang <jszhang@kernel.org>, James Morse
	<james.morse@arm.com>, Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck
	<tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>, Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Robert Richter
	<rrichter@amd.com>, Yuntao Wang <ytcoode@gmail.com>, Dave Jiang
	<dave.jiang@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-acpi@vger.kernel.org>
References: <cover.1718268003.git.haibo1.xu@intel.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <d9c996b8-fe36-1b69-331a-94eb2547cc0f@huawei.com>
Date: Mon, 24 Jun 2024 10:26:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
Content-Language: en-GB
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_192646_008213_8EF857C7 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024/6/13 16:54, Haibo Xu wrote:
> This patch series enable RISC-V ACPI NUMA support which was based on
> the recently approved ACPI ECR[1].
> 
> Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA information
> from SRAT and SLIT ACPI tables.
> Patch 2/4 add the common SRAT RINTC affinity structure handler.
> Patch 3/4 change the ACPI_NUMA to a hidden option since it would be selected
> by default on all supported platform.
> Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
> potential boot noise on ACPI platforms that are not NUMA.

Looks good to me,

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
