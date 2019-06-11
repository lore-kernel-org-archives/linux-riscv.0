Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232A3C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 07:37:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7FE62089E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 07:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QbMonL9g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7FE62089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAQlNYR8ZbpllHuBrwtHvliSx4OC0kEb6LR1sFQnoG4=; b=QbMonL9gKnkSKA
	myfBT7OoYMu/WKvHSE7osiC+2KyA1ue87530cLiks3CGxVoYva5m73COqCW0c/DJmwEk+1B6+5Ex1
	OievhOd1igfzffp7jdLGa11hpXUrVlQmWl20p8ThlTbzy5p+zZHXO0YEUsx7ranCGHnkH/jJzXWjK
	sUnsT+0WbFP4/4dr8fRVaMmAIcAhI0+gL8XBcAijqqg572gkcnX4AEPqwnnAwRGcWjNNsRf9dVEkE
	4aj8sxpI+Uq8khrnG70W0OY5N7Bp9h8m5WSCHJxu2cwuCRVMUJ01Vxw6y1wKNnbbRw1FuSuKGMf+S
	F7mfKfnjcQ+HQxg4r4mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1habLc-0006Qt-0c; Tue, 11 Jun 2019 07:37:36 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1habLL-0006FW-Ne; Tue, 11 Jun 2019 07:37:21 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id ADA6868B02; Tue, 11 Jun 2019 09:36:48 +0200 (CEST)
Date: Tue, 11 Jun 2019 09:36:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 04/15] binfmt_flat: remove flat_old_ram_flag
Message-ID: <20190611073648.GA21522@lst.de>
References: <20190610212015.9157-1-hch@lst.de>
 <20190610212015.9157-5-hch@lst.de>
 <b1ce6fc6-343c-7686-b4f4-35a305dc2adb@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1ce6fc6-343c-7686-b4f4-35a305dc2adb@linux-m68k.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_003719_924001_CAC1EC2B 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 11, 2019 at 04:04:39PM +1000, Greg Ungerer wrote:
>> index c0e4535dc1ec..18d82fd5f57c 100644
>> --- a/fs/binfmt_flat.c
>> +++ b/fs/binfmt_flat.c
>> @@ -488,7 +488,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   	 * fix up the flags for the older format,  there were all kinds
>>   	 * of endian hacks,  this only works for the simple cases
>>   	 */
>> -	if (rev == OLD_FLAT_VERSION && flat_old_ram_flag(flags))
>> +	if (IS_ENABLED(CONFIG_BINFMT_FLAT_OLD_ALWAYS_RAM) &&
>> +	    rev == OLD_FLAT_VERSION)
>
> The flags are from the binary file header here, so this is going to lose
> that check for most platforms (except h8300 where it would always have
> been true).

Indeed.  The old code is:

	if (rev == OLD_FLAT_VERSION && flat_old_ram_flag(flags))
		flags = FLAT_FLAG_RAM;

which for !h8300 evaluates to:

	if (rev == OLD_FLAT_VERSION && flags)
		flags = FLAT_FLAG_RAM;

so basically if any flag was set it was turned into FLAT_FLAG_RAM.
Was that really intentional?  I guess even if it wasn't the is no
point in changing this historic behavior now.

So I guess what we could do it something like:

	if (rev == OLD_FLAT_VERSION &&
	    (flags || IS_ENABLED(CONFIG_BINFMT_FLAT_OLD_ALWAYS_RAM)))
		flags = FLAT_FLAG_RAM;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
