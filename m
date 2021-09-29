Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25CBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 10:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB990613A5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 10:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB990613A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzcBGaDWvLyR8Xw9YIriLk/O3J5p03TgBbngfaiJGcU=; b=5GXu69ZBW7YKAz
	lOzhzfxWC9/zzGG9M7Hh2e1m3dAXNpUVy/8foi6OFVthgcMqu2P6V4uaZlV7VmMzHkCN7bBusOpOh
	1t4rRkrCuRlNQ2tHfAgSIBkkVQQzj6TpLjyEx7SJXFavdGgVjzIh16zSYw6q9EkreRt1Ka88YFDYr
	WgPFoIjYzcb/iZqLYui3gpOE3D+JZLqz5VZ3swcKTRm/FJeq2qsMXXjB66S5XbsTknMGjwZTU3sRn
	76itXMikFaSLojQu1o5Fa0CG/9AGPYFkISoWqlEUsHEEO4c5OHActskFCnV3RJDV0QJW3QBjJLbJX
	qHbTz3ERWCYMhLhv3mPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVWa1-00AgrI-1V; Wed, 29 Sep 2021 10:12:49 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVWZx-00Agq4-3g
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 10:12:47 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HKBwn0xvHz1DHQr;
 Wed, 29 Sep 2021 18:11:21 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 18:12:39 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 18:12:37 +0800
Message-ID: <37778b13-aa03-c885-f78c-da50ac9fa602@huawei.com>
Date: Wed, 29 Sep 2021 18:12:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH -next v3 0/3] riscv: Fix two vdso issue
Content-Language: en-US
To: Tong Tiangen <tongtiangen@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <abdulras@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210901024621.2528797-1-tongtiangen@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20210901024621.2528797-1-tongtiangen@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_031245_359347_8ACA45E4 
X-CRM114-Status: UNSURE (   5.57  )
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

Hi Palmer, could this patchset be merged into v5.15, it fixes the
serious problems about the basic time api.

Sergey[1] does meet same issue too. Thanks.

[1] 
https://patchwork.kernel.org/project/linux-riscv/patch/20210829094708.169037-1-cerg2010cerg2010@mail.ru/

On 2021/9/1 10:46, Tong Tiangen wrote:
> v3->v2:
>    Adapt to the latest code.
> 
> v2->v1:
>    Add patch "Refactor asm/vdso.h" to avoid vdso.lds syntax error if
>    CONFIG_GENERIC_TIME_VSYSCALL=n.
> 
> 1) Move vdso data page up front and introduce enum vvar_pages, This makes it
> easier to introduce new feature TIME_NS.
> 
> 2) In arch_setup_additional_pages(), make Wait for the lock in the killable mode
> and return with EINTR if the task got killed while waiting.

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
