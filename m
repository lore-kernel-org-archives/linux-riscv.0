Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB52C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 15:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD6561151
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 15:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CD6561151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B/yYrzEBd0ubTDgHQzrFYhZIZgXw6YdIWJysQJbonK0=; b=NFJHlKGBg+uCKBr0Dmnq7XblSE
	OSnCWSs1Z0sO7W3Uj1oR3Y0aTUaadVzx94teGZlkRdD8YdgPxCSB7prgkBw6d2YB5uveZkb2lKgjh
	SI375i3kA/JE15ixflfXVuKPXdzT34YZ6hUOHqRPcjr83CuAgHiRs5QnE6eBN9m6ptR+Zz7+cfZpi
	RyLlUwX6FSwCxBMHwxK0VC834vO8NIcc3VZXTCpEDbg2veNK3jiFv04j8w+gE089Y6wtBydX3vSZC
	5jwL0vVtBFh0wb9OVeS370ZNMRBuNDHUcitnzWjEkq3m9DFIOvTKmFSlUr046zOqeAPfXcTe1c77T
	7NqJAY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPoL6-002G7l-Pe; Mon, 13 Sep 2021 15:57:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPoL3-002G6l-Sy
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 15:57:47 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0A0E3C000E;
 Mon, 13 Sep 2021 15:57:37 +0000 (UTC)
Subject: Re: [PATCH 1/2] doc: Fix typo in Documentation/riscv/vm-layout
To: Leo Yu-Chi Liang <ycliang@andestech.com>, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-doc-tw-discuss@lists.sourceforge.net, linux-riscv@lists.infradead.org
Cc: ycliang@cs.nctu.edu.tw
References: <20210912155149.130332-1-ycliang@andestech.com>
From: Alexandre ghiti <alex@ghiti.fr>
Message-ID: <39e34848-65d9-75ce-f1f7-d5ee2c5f31c2@ghiti.fr>
Date: Mon, 13 Sep 2021 17:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912155149.130332-1-ycliang@andestech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_085746_124517_373D7C94 
X-CRM114-Status: GOOD (  16.36  )
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

(+cc linux-riscv)

On 9/12/21 5:51 PM, Leo Yu-Chi Liang wrote:
> From: Leo Yu-Chi Liang <ycliang@cs.nctu.edu.tw>
>
> Fix a typo of the End Addr field for `direct mapping` section.
>
> The value 0xffffffff7fffffff - 0xffffffe000000000 is 126 GB
> and is not equal to value in the size field.
>
> Update the value to make sense of the memory layout table.
>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@cs.nctu.edu.tw>
> ---
>  Documentation/riscv/vm-layout.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index b7f98930d38d..2525cf0d6794 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -52,7 +52,7 @@ RISC-V Linux Kernel SV39
>     ffffffceff000000 | -196    GB | ffffffceffffffff |   16 MB | PCI io
>     ffffffcf00000000 | -196    GB | ffffffcfffffffff |    4 GB | vmemmap
>     ffffffd000000000 | -192    GB | ffffffdfffffffff |   64 GB | vmalloc/ioremap space
> -   ffffffe000000000 | -128    GB | ffffffff7fffffff |  124 GB | direct mapping of all physical memory
> +   ffffffe000000000 | -128    GB | fffffffeffffffff |  124 GB | direct mapping of all physical memory
>    __________________|____________|__________________|_________|____________________________________________________________
>                                                                |
>                                                                |

You're right, thanks for catching this, you can add:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks again,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
