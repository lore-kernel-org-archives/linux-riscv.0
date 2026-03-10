Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C431FCC9B2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 03:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ur5b7MSjV0EO/bFklvdid6e0fXr2WxNMjRVHOsL+YPA=; b=gXRfsixpGJom6s
	tIlxeb2HDvepIQ7OPKBmPNjP5z/A6kwXHDgrD8OwXVxsZawtzNjqAU0yctDNpWNV4utbHbuGvIyM8
	o/igVzc2QguCw9GcvTIGOW8o9qlh+YDMaNEbsCmfqGyXp1LmZlGZWaj9Vv9Wunge06s5GEAH2Hz1Q
	HbcdEhbNKTjae3klSBUkeemKgz0QQmH/fSmSm8CUTQkgeLvkAf27CsbeXMo6c7XPJlXGR5n3Msb7P
	ihO84kG8Gr6YP+IiGxApl83w7KC5dYMGMDNiFLLlEXxHW1sG562WdqUcDu09exBz2ZxgJhooF91iX
	ovTUEMRkxvRvrxZl5Rvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznkR-00000008eu0-2Wwy;
	Tue, 10 Mar 2026 03:27:07 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznkO-00000008esd-3kZ2
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 03:27:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NKl0BL5gWneRy8oIc5rSW3swGX1sxqPqZIAu8m6vIHM=;
	b=JMGQzxtpI9ePIXzWXzTcLVJ8WSm8gzVHohQ7nVAsmJYNnlqGlbBNIzIP4if/tct67FLFXmq4s
	7x9HWkKBcIo0SxFLA/Kofp5K/NDpWOmjJkrafmsqF0f2aOvcS9D5PymjzeE2Ri247hLkh8UJfuJ
	OfjvEF+n7jcvjLsUPd+3rzc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fVK0g6k9nz12LCw;
	Tue, 10 Mar 2026 11:21:23 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CB1B404AD;
	Tue, 10 Mar 2026 11:27:00 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Mar 2026 11:26:59 +0800
Message-ID: <3e5d9fd9-af73-4f58-88ac-0c5c75bec14c@huawei.com>
Date: Tue, 10 Mar 2026 11:26:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Fix get cpu steer-tag fail on ARM64 platform
To: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
 <20260309041659.18815-1-fengchengwen@huawei.com>
 <20260309102835.000037ad@huawei.com>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260309102835.000037ad@huawei.com>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202705_660552_B6D106C7 
X-CRM114-Status: GOOD (  18.48  )
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

On 3/9/2026 6:28 PM, Jonathan Cameron wrote:
> On Mon, 9 Mar 2026 12:16:56 +0800
> Chengwen Feng <fengchengwen@huawei.com> wrote:
> 
>> This patchset addresses the issue where retrieving the CPU steer-tag
>> fails on ARM64 platforms. The first commit is a pure renaming of the
>> ACPI CPU ID retrieval interface (no functional changes), which serves
>> as preparation for the second commit that implements the core fix for
>> the steer-tag retrieval logic.
> 
> Hi,
> 
> For future reference, please keep same lists +CC on every patch
> (for a small series, send everything to everyone who gets any patch).
> For me at least, that led to my filter putting patch 1 in a totally different
> place from the rest and some confusion.
> 
> Also, don't send in reply to a previous version. Just start a new email
> thread.  That both avoids deep nesting in email clients and generally
> ensures your series ends up in the right place if people are sorting
> by time of sending.

Thanks Jonathan for the reminder, v5 has been sent with all of your comments.

Thanks again

> 
> No need to resend this time unless others ask for it. 
> 
> Thanks,
> 
> Jonathan
> 
>>
>> ---
>> Changes in v4:
>> - Split the rename into a separate commit.
>>
>> Changes in v3:
>> - Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() other
>>   than add one new API.
>>
>> Changes in v2:
>> - Add ECN _DSM reference doc name and its URL.
>> - Separate implement acpi_get_cpu_acpi_id() in each arch which supports
>>   ACPI.
>> - Refine commit-log.
>>
>> Chengwen Feng (2):
>>   ACPI: Rename get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() on
>>     non-x86
>>   PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
>>
>>  Documentation/PCI/tph.rst          |  4 ++--
>>  arch/arm64/include/asm/acpi.h      |  4 ++--
>>  arch/loongarch/include/asm/acpi.h  |  2 +-
>>  arch/riscv/include/asm/acpi.h      |  2 +-
>>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>>  arch/x86/include/asm/acpi.h        |  2 ++
>>  arch/x86/kernel/cpu/common.c       |  8 ++++++++
>>  drivers/acpi/pptt.c                | 16 ++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  2 +-
>>  drivers/pci/tph.c                  | 11 ++++++-----
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>>  include/linux/pci-tph.h            |  4 ++--
>>  12 files changed, 35 insertions(+), 24 deletions(-)
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
