Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3860C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 02:36:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8647B61213
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 02:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8647B61213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmYLt3HIjl4DQ0d5N3gTMQKwlN4QdqeHo2RaMuaww2A=; b=W0q3qg49d3LGFrW4bOaw2+mXXI
	sOTPI8zMSCz0XUWsUiNarZmD7DksOcEksV0KgDDdMeZ6jtfYWnC1QhAwxCEyeIhA1u20OB6yhKhIo
	gpfXFUL7IHRd67s5nVamzGu+YJ3VE5POgTiugd4Pb7OFNzvh4MJv+iLSx94Aygn4348xbvkOEW5Hw
	QaHp8cjyu+TJ6esdd9BFVc3BlwncJWGcCgcTob927x6zrm7bUqHlenZKw0ExQtflOjZXCSTDdWKwb
	FhQe7hc4+VUIZbMA0rDMwTqJYucC59kxgndW29RxdDP2sVcpvn0pKY5hSfEdiUcQfzCYqPq/XI5mi
	oNaHtXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV2yM-005JBD-Ua; Tue, 28 Sep 2021 02:35:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV2tT-005HEE-6Z
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 02:30:57 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HJNfY4R8jz8ywv;
 Tue, 28 Sep 2021 10:26:13 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 10:30:41 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 10:30:40 +0800
Subject: Re: [PATCH -next v3 0/3] riscv: Fix two vdso issue
To: Liu Shixin <liushixin2@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <abdulras@google.com>
References: <20210901024621.2528797-1-tongtiangen@huawei.com>
 <935c5e32-8df2-670d-da33-869e6dce4917@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <380ef41e-bba7-1f7b-5e0c-08690cef13eb@huawei.com>
Date: Tue, 28 Sep 2021 10:30:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <935c5e32-8df2-670d-da33-869e6dce4917@huawei.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_193055_460559_F2F24331 
X-CRM114-Status: UNSURE (   8.14  )
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

kindly ping.

On 2021/9/28 10:19, Liu Shixin wrote:
> On 2021/9/1 10:46, Tong Tiangen wrote:
>> v3->v2:
>>   Adapt to the latest code.
>>
>> v2->v1:
>>   Add patch "Refactor asm/vdso.h" to avoid vdso.lds syntax error if
>>   CONFIG_GENERIC_TIME_VSYSCALL=n.
>>
>> 1) Move vdso data page up front and introduce enum vvar_pages, This makes it
>> easier to introduce new feature TIME_NS.
>>
>> 2) In arch_setup_additional_pages(), make Wait for the lock in the killable mode
>> and return with EINTR if the task got killed while waiting.
>>
>> Tong Tiangen (3):
>>   riscv/vdso: Refactor asm/vdso.h
>>   riscv/vdso: Move vdso data page up front
>>   riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for
>>     write killable
>>
>>  arch/riscv/include/asm/syscall.h  |  1 +
>>  arch/riscv/include/asm/vdso.h     | 15 ++++-----
>>  arch/riscv/kernel/syscall_table.c |  1 -
>>  arch/riscv/kernel/vdso.c          | 53 +++++++++++++++++++------------
>>  arch/riscv/kernel/vdso/vdso.lds.S |  3 +-
>>  5 files changed, 42 insertions(+), 31 deletions(-)
>>
>
> Test-by: Liu Shixin <liushixin2@huawei.com>
> .
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
