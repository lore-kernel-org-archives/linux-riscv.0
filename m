Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C95EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/sCZtGVh3+RlCliF6sRusHVr853dBcotS5fW1eoRGE=; b=QpI+f525wi6pNQ
	QrWDk63RITC8NpXM4qF59e7nsBuDd2qqlguZWE3F1hCJEMYGlfZRgBFpiPHxJGSowiE87hFzpNG+c
	vfzKmFEQYKodYLjFTl7y2JzUxXccpmsNZSX80xpqaq5mhRQ7BGQHCWJOL3dk8bOYSPKPAprTyryrs
	49W5JZFZXdrsCy/cFTSTqZTTmHTakmtmMbkuDQCGqwWGzCgiNK9n4WUFh4TI/LRO5gg95watst7o6
	ElWfNEchyvmuhz2IiX06INetT6A+r8OXgJV7nonghKgju95wAQ/rMRDqxDme1CcUOLi5Ebe7Fbqlh
	cNIRsrdCwMm0rzrAzKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n27dp-000PmU-DD; Tue, 28 Dec 2021 08:15:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n27dm-000Pkl-PT
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 08:15:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C01106117C;
 Tue, 28 Dec 2021 08:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002F8C36AE7;
 Tue, 28 Dec 2021 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640679315;
 bh=VBxcm5mbsbYVIp6HBaklzK/nPNC0PMjZn2VE4aLnAOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vwrzngpastuetBPEvMyaV2HOPaZCNDjEmFST41sBawwyngnYsNBJX/XyP+ZCbvzZ8
 Er2f017CXxfpLME5JRrqRrQnRjuRfFNLO6IG8ZTZxbUtALVHMFkfIONWhjLATAEmjr
 tECrWtGEKyjGgMi907uTqCBWIv6X8bAZJnOy1xJY=
Date: Tue, 28 Dec 2021 09:15:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [RFC 16/32] misc: handle HAS_IOPORT dependencies
Message-ID: <YcrHi7cZDWZlTZ2w@kroah.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-17-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-17-schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_001526_914856_49E40795 
X-CRM114-Status: GOOD (  16.43  )
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

On Mon, Dec 27, 2021 at 05:43:01PM +0100, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/misc/altera-stapl/Makefile | 3 ++-
>  drivers/misc/altera-stapl/altera.c | 6 +++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/altera-stapl/Makefile b/drivers/misc/altera-stapl/Makefile
> index dd0f8189666b..90f18e7bf9b0 100644
> --- a/drivers/misc/altera-stapl/Makefile
> +++ b/drivers/misc/altera-stapl/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -altera-stapl-objs = altera-lpt.o altera-jtag.o altera-comp.o altera.o
> +altera-stapl-y = altera-jtag.o altera-comp.o altera.o
> +altera-stapl-$(CONFIG_HAS_IOPORT) += altera-lpt.o
>  
>  obj-$(CONFIG_ALTERA_STAPL) += altera-stapl.o
> diff --git a/drivers/misc/altera-stapl/altera.c b/drivers/misc/altera-stapl/altera.c
> index 92c0611034b0..c7ae64de8bb4 100644
> --- a/drivers/misc/altera-stapl/altera.c
> +++ b/drivers/misc/altera-stapl/altera.c
> @@ -2431,6 +2431,10 @@ int altera_init(struct altera_config *config, const struct firmware *fw)
>  
>  	astate->config = config;
>  	if (!astate->config->jtag_io) {
> +		if (!IS_ENABLED(CONFIG_HAS_IOPORT)) {
> +			retval = -ENODEV;
> +			goto free_state;
> +		}

A comment as to why you are doing this check here would be nice, as it
is not obvious at all what is going on.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
