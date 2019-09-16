Return-Path: <SRS0=O4lQ=XL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DE7C4CEC7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 06:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FCF20830
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 06:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pGgOLnMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FCF20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Y3u5GKzKZPKGKBPBgokvX4AsOBvctXpsyZw+8PLrsE=; b=pGgOLnMcFb3D5a
	6oImWFXYKnR1YlRXPPjpK7vzwMhIUw28WY2Q9UrMZ2xeA4iH2Iu8c/nfPCZMOrCRVdErBFgMwmlwU
	VNnsaQVQLH/tpcg8G7jH7Wcp7sa208dkjNtdWj7fFXj21fXlJTLvJThxGZAnSdTV9L9qdSfATIyRG
	iQVwVgwSxoIyE/eCvEs2X9+j7lKI4ARbaVPk6/+UPHm92+S4O5xUq+hv6eTYw4a7EiN5DVm9yM503
	1SdHM9K921hoJ+4OUhiJFPpP2LOjj/uTXu0eRXLY0nRiKv6aHL9HRWA6sUNrZ3Znv8tnLOj2svzMo
	jk4DTvClnVwiAwyfG+Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9kj2-0005SH-Ju; Mon, 16 Sep 2019 06:43:04 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9kiz-0005Qo-2E
 for linux-riscv@lists.infradead.org; Mon, 16 Sep 2019 06:43:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2B61668B05; Mon, 16 Sep 2019 08:42:54 +0200 (CEST)
Date: Mon, 16 Sep 2019 08:42:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] serial/sifive: select SERIAL_EARLYCON
Message-ID: <20190916064253.GA24654@lst.de>
References: <20190910143630.GA6794@lst.de>
 <mhng-218f6b9f-bfd8-4adb-8147-298989494bcf@palmer-si-x1e>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-218f6b9f-bfd8-4adb-8147-298989494bcf@palmer-si-x1e>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190915_234301_261690_C1BBCAC1 
X-CRM114-Status: UNSURE (   7.58  )
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
Cc: Greg KH <gregkh@linuxfoundation.org>, schwab@suse.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jslaby@suse.com, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 13, 2019 at 01:40:27PM -0700, Palmer Dabbelt wrote:
> OpenEmbedded passes "earlycon=sbi", which I can find in the doumentation.  
> I can't find anything about just "earlycon".  I've sent a patch adding sbi 
> to the list of earlycon arguments.

earlycon without arguments is documented, although just for ARM64.
I can send a patch to update it to properly cover all DT platforms
in addition.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
