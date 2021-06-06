Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AA6C4743D
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 23:48:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6896109F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 23:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6896109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ti13BYA35k7yvimOLYgmnyk+uphLaAwyOIHFCxPWvqA=; b=W3cIunEXImoG+loOF9Sf3gM6Zz
	IgrnjNCuT0l5kUk8FE+kLgBdZH8xxKXA6k0CxJt9kfJH3wB1rpH4OtQu1kUnxUXDr/FkgTAlHVlqA
	Hvi8+aYzcpiwPMmTF1gc7Py7yl2plFJAoW4vPIRIpoNm6D+YiTq/EI2enrw/YL3XAjENRYksilVaa
	/7hiBv7GGej455xchnsFBCFtsEf3ELWVyAumQ/UMePYIzZED6kCVdEd2BD6vkTos0sKoRfM++O+Jc
	WzmMWFSqZ0u/UmOBTgmtUP6VEckcvJPQvqScnOmOg1vYBQ13dWvyMlN10+UQxDDZCUOBqzZ0gAUCa
	bV+sIg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq2TC-0013gQ-4y; Sun, 06 Jun 2021 23:46:18 +0000
Received: from [2601:1c0:6280:3f0::bd57]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq2TA-0013gA-CU; Sun, 06 Jun 2021 23:46:16 +0000
Subject: Re: [PATCH] riscv: sifive: fix Kconfig errata warning
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Vincent Chen <vincent.chen@sifive.com>
References: <20210522212036.5513-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <990a9263-dc33-e616-12eb-173e6872c93a@infradead.org>
Date: Sun, 6 Jun 2021 16:46:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210522212036.5513-1-rdunlap@infradead.org>
Content-Language: en-US
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

ping. anyone?
thanks.

On 5/22/21 2:20 PM, Randy Dunlap wrote:
> The SOC_SIFIVE Kconfig entry unconditionally selects ERRATA_SIFIVE.
> However, ERRATA_SIFIVE depends on RISCV_ERRATA_ALTERNATIVE, which is
> not set, so SOC_SIFIVE should either depend on or select
> RISCV_ERRATA_ALTERNATIVE. Use 'select' here to quieten the Kconfig
> warning.
> 
> WARNING: unmet direct dependencies detected for ERRATA_SIFIVE
>   Depends on [n]: RISCV_ERRATA_ALTERNATIVE [=n]
>   Selected by [y]:
>   - SOC_SIFIVE [=y]
> 
> Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/Kconfig.socs |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20210521.orig/arch/riscv/Kconfig.socs
> +++ linux-next-20210521/arch/riscv/Kconfig.socs
> @@ -14,6 +14,7 @@ config SOC_SIFIVE
>  	select CLK_SIFIVE
>  	select CLK_SIFIVE_PRCI
>  	select SIFIVE_PLIC
> +	select RISCV_ERRATA_ALTERNATIVE
>  	select ERRATA_SIFIVE
>  	help
>  	  This enables support for SiFive SoC platform hardware.
> 


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
