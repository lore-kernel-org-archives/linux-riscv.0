Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9830C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 05:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56B06109F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 05:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A56B06109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO6UDFpl0TFzKEukQOgl7oBbBv0ASBdX5IkEXaJCLds=; b=ZXnbD4fRxdyBd9eZMQQKRDRYpi
	Xb9s8zcsB7k1GTbCucIE8jKETiCRth841zsDBdGrG3RmOWZAz3EsFH/WTcqQ70bbpWvHZ50qfXm6j
	+P8FosVTo1CTGJfVeW46Qp+gsHFBksrd91CpqP1f6MLZmeVlaBeQ4YDkXfGcrS5n0Z6E2O28NDbrA
	x/sJ8Jf6Cb4ZcKK/0gemjxKIzlaQj0EMSKvZJosiMu4vuS37GleXMhV6XIwNzoWlwfBk5gec96FSg
	pk65wMRi1NwgBcvCvz/MXNeXQNo1yn2ijm/BxOWGAKEhaV12Z3Z7g7zNHPK6D3BD/m3VtWIsGdzQ+
	ttRsBFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGaXb-007GUr-9Q; Thu, 19 Aug 2021 05:24:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGaXX-007GUE-Qk
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 05:24:34 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GqtQJ23H0zbfHJ;
 Thu, 19 Aug 2021 13:20:40 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 13:24:25 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 13:24:24 +0800
Subject: Re: [PATCH -next 0/2] riscv: Fix two vdso issue
To: Tong Tiangen <tongtiangen@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Palmer
 Dabbelt" <palmerdabbelt@google.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210819030650.716478-1-tongtiangen@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <7b9520dd-1c61-4a5f-7239-b42f5f37cb54@huawei.com>
Date: Thu, 19 Aug 2021 13:24:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210819030650.716478-1-tongtiangen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_222432_494137_D280D2F4 
X-CRM114-Status: GOOD (  10.64  )
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

On 2021/8/19 11:06, Tong Tiangen wrote:
> 1) Move vdso data page up front and introduce enum vvar_pages, To pave the way
> for the subsequent support of TIME_NS, the support of TIME_NS will be issued
> in the later patch.
>
> 2) In arch_setup_additional_pages(), make Wait for the lock in the killable mode
> and return with EINTR if the task got killed while waiting.

For series,

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>
> Tong Tiangen (2):
>    riscv/vdso: Move vdso data page up front
>    riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for
>      write killable
>
>   arch/riscv/include/asm/syscall.h  |  2 ++
>   arch/riscv/include/asm/vdso.h     |  4 +--
>   arch/riscv/kernel/vdso.c          | 51 ++++++++++++++++++-------------
>   arch/riscv/kernel/vdso/vdso.lds.S |  3 +-
>   4 files changed, 36 insertions(+), 24 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
