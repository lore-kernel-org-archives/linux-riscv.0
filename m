Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3DCC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 14:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D08026104F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 14:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D08026104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcnnvtvdHhplLaJpA2ZZFu/2tVxOLftTNP5SGA0AlHM=; b=sP4/yW0AEZl7XtHA2HPDqthxUu
	/SW1ypBRA1bN0vDAMLnpbOLIG1uGpK3S7x9JV6kN4Ir2EArzcvzVppO2rEEI93pn9GnFG3YrpcXuj
	+6jrVz5lBFzjF9eoLajRYyjwyvO6t5n5Vcq+sjhFTaRI+JoVrO4ERxMnKLISZZG3YwSoP9Tai/g/f
	OJdjAiXtY+AgSBkjPW/e23+IxJyaImNofrxYQcC8l25QX3dQtnu6627unFdEVeyjDCUdyDc54HZmU
	zyPQFhKvFUxy5qZeRGZ69XBnuNp/d9STXt0+E0CFBJkrshhJZc6MZaOhzLBJ9xB9G3m4VXMYfTQt0
	3Jru4gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEBi8-00ASHL-RC; Thu, 12 Aug 2021 14:29:32 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEBi7-00ASH1-CO; Thu, 12 Aug 2021 14:29:31 +0000
Subject: Re: [PATCH] riscv: add rv32 and rv64 randconfig build targets
To: linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
References: <20210717044424.17478-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <25894c79-120f-8885-34cd-2e9dec0017ba@infradead.org>
Date: Thu, 12 Aug 2021 07:29:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210717044424.17478-1-rdunlap@infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,
Any comments on this patch?
thanks.

On 7/16/21 9:44 PM, Randy Dunlap wrote:
> Add the ability to do randconfig build targets for both
> rv32 and rv64.
> 
> Based on a similar patch by Michael Ellerman for PowerPC.
> 
> Usage:
>    make ARCH=riscv rv32_randconfig
> or
>    make ARCH=riscv rv64_randconfig
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> 
>   arch/riscv/Makefile              |   10 ++++++++++
>   arch/riscv/configs/32-bit.config |    2 ++
>   arch/riscv/configs/64-bit.config |    2 ++
>   3 files changed, 14 insertions(+)
> 
> --- linux-next-20210715.orig/arch/riscv/Makefile
> +++ linux-next-20210715/arch/riscv/Makefile
> @@ -132,3 +132,13 @@ zinstall install:
>   
>   archclean:
>   	$(Q)$(MAKE) $(clean)=$(boot)
> +
> +PHONY += rv32_randconfig
> +rv32_randconfig:
> +	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/32-bit.config \
> +		-f $(srctree)/Makefile randconfig
> +
> +PHONY += rv64_randconfig
> +rv64_randconfig:
> +	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
> +		-f $(srctree)/Makefile randconfig
> --- /dev/null
> +++ linux-next-20210715/arch/riscv/configs/32-bit.config
> @@ -0,0 +1,2 @@
> +CONFIG_ARCH_RV32I=y
> +CONFIG_32BIT=y
> --- /dev/null
> +++ linux-next-20210715/arch/riscv/configs/64-bit.config
> @@ -0,0 +1,2 @@
> +CONFIG_ARCH_RV64I=y
> +CONFIG_64BIT=y
> 


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
