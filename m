Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1807CC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 12:35:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567EC611F1
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 12:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567EC611F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QWCDcxFFHnZwvLlEf9gXcY+PY4kmh3iBaYSKeuy3Ol4=; b=Wjwy2csOZDyf+eGZeo/9aqkZt
	kxYpzVVq5/WPwoUq2c3kDF/0RXeqlp9w5PFBE2BuFrl0DrNcZk5b5SlLCnbW7FT49xPL1FkKl2gYP
	lmIqALFtrkrCg3nEhPq6rw5uoFwBKfiIYvk3LaYUlweTLHVJOrS11eDifp0VWHfv52Fr1HC7QpUNk
	TZUBpqCHhKZFmPM7kx5h5/7fW+wchKlAbfr2UQTVme1Flgx4oPq+qp1pvpt3h87sqlkhQwMKQhK7t
	kqIlYEHHNJOjGhCH54Azm6/f0jo2TEshMx1EWvJBd2ymUmzc0Yep7AscNnjg1kXPVEXLkec4ivG62
	7KlLAXTKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg57h-00EHhL-33; Mon, 10 May 2021 12:34:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg57e-00EHhD-Sd
 for linux-riscv@desiato.infradead.org; Mon, 10 May 2021 12:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=/EIJVurt4Xd2opuxANXsVdq4EaTdBAkwQUGpqmBG1mU=; b=Jkb+URAWWKU0+u7ndNuelJ53f9
 5I1hPbMdxKobNMVmkza5Ge/Yb2ape8h8SQjj4lGzuZ5coCOBbUw/DR7lj7lRCzC5uDcoKb3HjehNE
 ImYBiG8/Lp0GbhFdCsNoi7TlG3hCP1+W+107jDt5q4M2C/OH0Cj10anFpTHX8px7mpykSKOo33U9m
 dIuSAcR6TXCbBBhFq8lWJiYlubWY5g2fqSVnnA6fsoTLo+CyeOXADGTy4Aq5LWkSXUy+JmGulBZOM
 BwxmjhnN3mVpNYmEQMzjPD23Jkbe6+IwZGNS4aO6aY/F9lW2uIEC62vskdtLUiuVedTkFysaiclnT
 60Zv1WvA==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg57c-008hFs-1g
 for linux-riscv@lists.infradead.org; Mon, 10 May 2021 12:34:53 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 08A22FF805;
 Mon, 10 May 2021 12:34:43 +0000 (UTC)
Subject: Re: [PATCH] riscv: mm: Drop redundant _sdata and _edata declaration
To: Kefeng Wang <wangkefeng.wang@huawei.com>, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Cc: palmerdabbelt@google.com, atish.patra@wdc.com, paul.walmsley@sifive.com,
 anshuman.khandual@arm.com
References: <20210510115808.96615-1-wangkefeng.wang@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <1bb74f75-8452-54e0-857d-7d3cf1541847@ghiti.fr>
Date: Mon, 10 May 2021 14:34:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510115808.96615-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_053452_258956_63BD960A 
X-CRM114-Status: GOOD (  16.16  )
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

Hi Kefeng,

On 10/05/2021 13:58, Kefeng Wang wrote:
> The _sdata/_edata is already in sections.h, drop redundant
> declaration, also move _xiprom/_exiprom close to the caller.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/riscv/mm/init.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 136d0342b147..4d08e1f7a362 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -176,13 +176,6 @@ static void __init setup_bootmem(void)
>   	memblock_allow_resize();
>   }
>   
> -#ifdef CONFIG_XIP_KERNEL
> -
> -extern char _xiprom[], _exiprom[];
> -extern char _sdata[], _edata[];
> -
> -#endif /* CONFIG_XIP_KERNEL */
> -
>   #ifdef CONFIG_MMU
>   static struct pt_alloc_ops _pt_ops __ro_after_init;
>   
> @@ -461,6 +454,7 @@ uintptr_t load_pa, load_sz;
>   #endif
>   
>   #ifdef CONFIG_XIP_KERNEL
> +extern char _xiprom[], _exiprom[];


This place is guarded by #ifdef CONFIG_MMU and Vitaly has plans to make 
XIP kernels work on !MMU configurations, so that may not be the best 
place to move this declaration?

Thanks,

Alex

>   uintptr_t xiprom, xiprom_sz;
>   #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
>   #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
