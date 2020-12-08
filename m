Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1,WEIRD_QUOTING autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98146C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 01:21:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C12B82054F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 01:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C12B82054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fj8x9rJDk7yE+qR3Py5g2EpJg+TCjAi+lyRyR2379xw=; b=i/L1JixeV38KiTBgwJP3HGqbb
	GXwM5mYpnyxyAyOYE6g4pvTx3KaLxtme71KGmST/4m+nBTykkFiutSfiGpuKfRX0yx91dlrz+ikih
	Je+oDGH4Y7qTX5f5zUpuOBFvviTGpD7zKe71hO4mJb3sFFMpjgc/elNeZxwFONbGnV26ddfhAuOxb
	0m79rDwgPqoIfQJkpXBw55NVClLq5ZGUzt/FTpHga0FuMpft+VlnLujsZ8kgC8E03662VCwneLgTJ
	GkdjYgB15QqG4PYjc1eqjtbfz/YfP3+draUQ3Sxe0L3xI7k2pzPlXy700e7NiLTTxQV/j6sk/UNts
	03W0gKy/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmRgj-0003VI-Dd; Tue, 08 Dec 2020 01:21:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmRgh-0003V7-C0
 for linux-riscv@merlin.infradead.org; Tue, 08 Dec 2020 01:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=vXfBmV1WtpQrMd4/iEKqvXO0wvtb19cUUXMuUNVtQi4=; b=Rjq77hcRxkpyBdxp7o+bgrP+kA
 qmjJgvrrF1pNpYJwCTCyhfePAXp/wWm0Pkcb/rp5IQ2dVh7XfivNR2zy/DJ0odUFEht4kfP0AqWk0
 6um4Vrip3g+f4C2/F4gCj7mBfTG9BsHVQDgylUSAmTu8/UTyCKMKyJHHXWU94nWCCtu14BOXe0hMt
 MNhseyweAsJyePULtVrFbONLqF2H96ys1T1axJl4x3EzSJADMtoNC2HMp8N5lCA2nywHr54Sh9tQR
 ZRUqRZelOOWhInu3zWEJOEqUr5XH4mbGiB7c8xP9ZonpIY7BlUhf+6Qar+jbLgWOS97ZXbI0lQ5O3
 efwRnr9g==;
Received: from [2601:1c0:6280:3f0::1494]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmRgd-0007VO-4E; Tue, 08 Dec 2020 01:21:03 +0000
Subject: Re: [PATCH v3] drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201207204838.21406-1-info@metux.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b550dcf-7e4d-39d2-bcaf-3f6cdb688da0@infradead.org>
Date: Mon, 7 Dec 2020 17:20:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207204838.21406-1-info@metux.net>
Content-Language: en-US
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
Cc: corbet@lwn.net, mst@redhat.com, linus.walleij@linaro.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, jasowang@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/7/20 12:48 PM, Enrico Weigelt, metux IT consult wrote:
> Introducing new GPIO driver for virtual GPIO devices via virtio.
> 

Oops, I missed one thing:


> 
> diff --git a/Documentation/gpio/virtio-gpio.rst b/Documentation/gpio/virtio-gpio.rst
> new file mode 100644
> index 000000000000..e7bf01ec1ce7
> --- /dev/null
> +++ b/Documentation/gpio/virtio-gpio.rst
> @@ -0,0 +1,176 @@
> +"""""""""""""""""
> +Virtio-GPIO protocol specification
> +"""""""""""""""""


In Documentation/doc-guide/sphinx.rst, it says to please use the
following heading adornments....
and """""...""""" is not one of them.

Neither is "..........".

Also, only use an overline for the document title and not for
lower level headings.

Here are the expected heading adornments:

  1. ``=`` with overline for document title::

       ==============
       Document title
       ==============

  2. ``=`` for chapters::

       Chapters
       ========

  3. ``-`` for sections::

       Section
       -------

  4. ``~`` for subsections::

       Subsection
       ~~~~~~~~~~


> +...........
> +Specification for virtio-based virtiual GPIO devices
> +...........
> +
> ++------------
> ++Version_ 1.0
> ++------------
> +
> +===================
> +General
> +===================
> +
> +The virtio-gpio protocol provides access to general purpose IO devices
> +to virtual machine guests. These virtualized GPIOs could be either provided
> +by some simulator (eg. virtual HIL), routed to some external device or
> +routed to real GPIOs on the host (eg. virtualized embedded applications).
> +
> +Instead of simulating some existing real GPIO chip within an VMM, this
> +protocol provides an hardware independent interface between host and guest
> +that solely relies on an active virtio connection (no matter which transport
> +actually used), no other buses or additional platform driver logic required.
> +
> +===================
> +Protocol layout
> +===================
> +
> +----------------------
> +Configuration space
> +----------------------


thanks.
-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
