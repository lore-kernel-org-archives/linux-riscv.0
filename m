Return-Path: <SRS0=CW4g=X4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110DFC32792
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2019 16:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62B5222C4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2019 16:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XlkRy84h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62B5222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ca84uCC3rZPAjhQcl8H5laH8oNQuWvgnTZGRJ9CiXw=; b=XlkRy84h0CtPnr
	yXPzHHZMn6ZA4rG817BXQ0J5aLED06YyVmJv4DaYipI0XI/FOsDEHrNiNU51WbW19BrC2rYePoCNW
	10QJdAc0nq0SI2LXInP/bln/AbblX4C396TUDQy5XJ94Bkt8rvQBlhsiPPO/rTXTpZB19IFcZjy7b
	wJLOAmKwjCQp0NwRSSrVoc02bfTG+7af1LahObSjj5OHdEuKAw5Tgt2SjurlPeJC5325h4keTESla
	mruZb9eGY1+RugFdD5G/FIsU3uepolCjSLOIJ/ZfpswynbPQSDOKwvZTxghErlyBgZu2MEttmC8JK
	Imh8uTzVFIWudaig7oSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG4L1-00047C-R5; Thu, 03 Oct 2019 16:52:23 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG4Kz-000467-Tg
 for linux-riscv@lists.infradead.org; Thu, 03 Oct 2019 16:52:23 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 414B02D4;
 Thu,  3 Oct 2019 16:52:12 +0000 (UTC)
Date: Thu, 3 Oct 2019 10:52:11 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv-docs: correct the sequence of the magic number 2
 since it's little endian
Message-ID: <20191003105211.4ec1ed16@lwn.net>
In-Reply-To: <alpine.DEB.2.21.9999.1910011132280.3732@viisi.sifive.com>
References: <20190916130108.31404-1-clin@suse.com>
 <20191001072212.21d55899@lwn.net>
 <alpine.DEB.2.21.9999.1910011132280.3732@viisi.sifive.com>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_095221_977765_004D920C 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "palmer@sifive.com" <palmer@sifive.com>, Chester Lin <clin@suse.com>,
 "atish.patra@wdc.com" <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 1 Oct 2019 11:35:11 -0700 (PDT)
Paul Walmsley <paul.walmsley@sifive.com> wrote:

> This was simply due to idiocy on my part, due to a very last-minute patch 
> submission, where I missed that the original documented magic number was 
> already in little-endian format.  The updated number from Chester is 
> correct.
> 
> So,
> 
> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

Great, patch applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
