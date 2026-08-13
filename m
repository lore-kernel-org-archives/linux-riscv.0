Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F71C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wYLpTZD7/PhwnbvjYXkmZkyllqZkKpED40s/tG2njr4=; b=lrsRaFjiIT53pUblSTXwHZCgr8
	f29Lb7K2QIA3Zf3irtOSlbaKM7l24XRIr26Ptut8hXGAP+ikKEu+NCFTzVvkJT49/mL4md4rKkm30
	RP0jyn/pjRvT3tuVgT4Kybiv7baOrnShcMqiaaBSRZ1v5PlWGo3xLbBgfyvfQdqpXsD9oWpaODvIH
	ey2EBVzO1MYo6CgfaBKe/9s6KuGdukAPyT6qoLzjZvepb064wjo/0QcA9Vw9msAQ1bx9iUaH1OQ40
	Exm3P0ZFteCRi4F/X79aE/7IYBcrQQOzXwRN0Dx4StzLLnmcXKu2we41lWG5L/Z4COVyZbCSBDpO8
	3cRNZSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUEU-00000000csn-1bEw;
	Thu, 13 Aug 2026 12:08:26 +0000
Received: from [113.46.200.217] (helo=canpmsgout02.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUEQ-00000000crc-3Urv
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 12:08:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=p1IaZrga3tw+zONAd1nRt5CILnuvdDUAsSC4l66metY=;
	b=Y6nFriUl7iEGi1LAFfjTAi2eUReE2M7/qodq2/k1YBqphUx+JMJ4DlhFiM9BMn+6WJfx6rX7N
	Bep3szryKzEhE9r6v83MExjQxeWQs3CXa/ne1tYK+hvudbwT5DZFTseB8vDVdLqPhJRktZhYV/b
	6j3BiGtSIxOmFRlbX83fSzc=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hLP4Y5tqbzcb0T;
	Thu, 13 Aug 2026 19:57:49 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 1830340561;
	Thu, 13 Aug 2026 20:07:59 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Aug 2026 20:07:58 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Aug 2026 20:07:57 +0800
Subject: Re: [PATCH v3] tools/mm: add hwpoison-panic tool
To: Breno Leitao <leitao@debian.org>
CC: SJ Park <sj@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<kernel-team@meta.com>, Andrew Morton <akpm@linux-foundation.org>, "Naoya
 Horiguchi" <nao.horiguchi@gmail.com>, Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <david@kernel.org>
References: <20260813-memory_failure_rewrite_test-v3-1-f9fb6542cbff@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <2641f4d4-c08b-e9b2-1e8a-c91ce1f41d58@huawei.com>
Date: Thu, 13 Aug 2026 20:07:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20260813-memory_failure_rewrite_test-v3-1-f9fb6542cbff@debian.org>
Content-Language: en-US
X-Originating-IP: [10.173.124.160]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq500010.china.huawei.com (7.202.194.235)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_050823_354125_F3D851D1 
X-CRM114-Status: GOOD (  10.96  )
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

On 2026/8/13 19:45, Breno Leitao wrote:
> Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
> sysctl, picks a kernel-owned PFN and writes its physical address to
> hard_offline_page.  Three page kinds are selectable with -k: rodata
> (default), slab or pgtable. In all cases the host should panic.
> 
> Example:
> 
>         # ./hwpoison-panic -k slab --yes-panic-my-kernel
>         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
>         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'
> 
> In dmesg, you will see:
> 
>         Memory failure: 0x100032: unhandlable page.
>         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
>         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
> 
> This lives in tools/mm rather than selftests/mm because every successful
> run crashes the machine, which is not something to run from CI.
> 
> The --yes-panic-my-kernel argument is required so an accidental
> invocation does not take the box down.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Thanks for your update. LGTM.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
