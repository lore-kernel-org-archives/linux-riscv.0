Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74035C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 02:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE4A61262
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 02:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DE4A61262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:CC:References:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vogWxroB5dpSXB41sWVrE5gvH58StJojChBLdsxIWKg=; b=Ls+Xi0hD28qooKIQqqTTaLNq3M
	5XSBYEFEIGE06mXFi1u+zSiAosiUD6oN/2ylVveVXHtqRuzzDHfrYcnJ2anaH8e7FP0Y+2eRnxR0j
	ZUnPERzS0a30CIU9U8kK+93j1GzOMfGp0IOR4RwG1vYP+q4NBbGklxav+rFuUR+IahFTcme3u6CBo
	4D7NxK3o0F1+1xahQmRBMrSQz9lL5cD8FJaIdclCjNN1G8EKJUEne0jRODOGiCGK5P9Rm5zLjr5fx
	GoqWHxCpgPVWhqq3Vzu1tdEcZunAL1Q68kKypZIRgXnrid6TvvmBu8aD2i+NW6PjMZrZxdCqGmpQ2
	14WaTMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV2jH-005Fbn-By; Tue, 28 Sep 2021 02:20:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV2jD-005FZn-SQ
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 02:20:21 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HJNQ70yygz8yrj;
 Tue, 28 Sep 2021 10:15:27 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 10:19:57 +0800
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 10:19:56 +0800
Subject: Re: [PATCH -next v3 0/3] riscv: Fix two vdso issue
To: Tong Tiangen <tongtiangen@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <abdulras@google.com>
References: <20210901024621.2528797-1-tongtiangen@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <935c5e32-8df2-670d-da33-869e6dce4917@huawei.com>
Date: Tue, 28 Sep 2021 10:19:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210901024621.2528797-1-tongtiangen@huawei.com>
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_192020_143077_E2410CE4 
X-CRM114-Status: GOOD (  10.01  )
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

On 2021/9/1 10:46, Tong Tiangen wrote:
> v3->v2:
>   Adapt to the latest code.
>
> v2->v1:
>   Add patch "Refactor asm/vdso.h" to avoid vdso.lds syntax error if
>   CONFIG_GENERIC_TIME_VSYSCALL=n.
>
> 1) Move vdso data page up front and introduce enum vvar_pages, This makes it
> easier to introduce new feature TIME_NS.
>
> 2) In arch_setup_additional_pages(), make Wait for the lock in the killable mode
> and return with EINTR if the task got killed while waiting.
>
> Tong Tiangen (3):
>   riscv/vdso: Refactor asm/vdso.h
>   riscv/vdso: Move vdso data page up front
>   riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for
>     write killable
>
>  arch/riscv/include/asm/syscall.h  |  1 +
>  arch/riscv/include/asm/vdso.h     | 15 ++++-----
>  arch/riscv/kernel/syscall_table.c |  1 -
>  arch/riscv/kernel/vdso.c          | 53 +++++++++++++++++++------------
>  arch/riscv/kernel/vdso/vdso.lds.S |  3 +-
>  5 files changed, 42 insertions(+), 31 deletions(-)
>

Test-by: Liu Shixin <liushixin2@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
