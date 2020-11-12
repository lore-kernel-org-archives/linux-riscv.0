Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39BAC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 08:56:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7B5206CA
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 08:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f5piOE2V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D7B5206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FhDqaTBKLLoiejE482eORaPag0azfndDymjUYXiVie4=; b=f5piOE2VE3cH7TppgXOIi4m7z
	zFmgdSGHgV8ANKoGW+eSQEpJxxC/4iiDFGxl7eL3RziDjwOEyVTQRlWOw4t2pNgOyqHOQIGDFFQAb
	eDEtOF46xNC+pz+nplKxGDSOGSLp/W8XvlyAoao89BG9xQy7OpYS9XKT+Xyl636NI1lOjqJTv0T6U
	ST+zZP5InseE7t6JDYHs960PXlfHSafh4irb6W/LRt4KOO2ffJ1ZqK4CVTNM2yYXFqb6JKXt/lOtv
	iPOdWKKknV3pnMNorW9ofTz8l9c1unN81YIDFN8hjQD0wNpqjObI+FCZ+X0v5EDw9vJ3x1wUOHw6C
	XVeEYAScg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd8P2-0000bK-Ti; Thu, 12 Nov 2020 08:56:25 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd8P0-0000Zw-CJ
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 08:56:23 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CWwS848YSz7311;
 Thu, 12 Nov 2020 16:56:08 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 16:56:13 +0800
Subject: Re: [PATCH] riscv: Add HAVE_IRQ_TIME_ACCOUNTING
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>
References: <20201028042842.92619-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <454abd65-915b-d8cc-f375-34ebfb2ca9b7@huawei.com>
Date: Thu, 12 Nov 2020 16:56:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201028042842.92619-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_035622_700345_27C40BC9 
X-CRM114-Status: GOOD (  13.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Any comments, kindly ping...

On 2020/10/28 12:28, Kefeng Wang wrote:
> RISCV_TIMER/CLINT_TIMER is required for RISC-V system, and it
> provides sched_clock, which allow us to enable IRQ_TIME_ACCOUNTING.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   Documentation/features/time/irq-time-acct/arch-support.txt | 2 +-
>   arch/riscv/Kconfig                                         | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/time/irq-time-acct/arch-support.txt b/Documentation/features/time/irq-time-acct/arch-support.txt
> index d9082b91f10e..6fc03deb1c38 100644
> --- a/Documentation/features/time/irq-time-acct/arch-support.txt
> +++ b/Documentation/features/time/irq-time-acct/arch-support.txt
> @@ -23,7 +23,7 @@
>       |    openrisc: | TODO |
>       |      parisc: |  ..  |
>       |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>       |        s390: |  ..  |
>       |          sh: | TODO |
>       |       sparc: |  ..  |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 44377fd7860e..dfbc1351ee62 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -68,6 +68,7 @@ config RISCV
>   	select HAVE_FUTEX_CMPXCHG if FUTEX
>   	select HAVE_GCC_PLUGINS
>   	select HAVE_GENERIC_VDSO if MMU && 64BIT
> +	select HAVE_IRQ_TIME_ACCOUNTING
>   	select HAVE_PCI
>   	select HAVE_PERF_EVENTS
>   	select HAVE_PERF_REGS

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
