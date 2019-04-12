Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F28EC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 06:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710BD2186A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 06:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1DFEEAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 710BD2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ws0syb4pOHy69Y2Wus0gfAqf3X0G13I5n4IOX7yIrtE=; b=r1DFEEAjffUYq5
	GWczMH31I2bZKH5OMrc97YHflOHvDNqwjc2waytE0Eu7zsBvkcl7twOZsiKLKW8xVRh8QgCO2/Hdk
	/JExRMh6zyz4Jl+jpgCdVTVPj9Bg3hKg8W9bQ4chy2BkTQ7++73QWYzUXb9lPdzTUd+2uD5wkPSpS
	NwWURDOJ9+mCIbvDCIo79YcGbSiFSu8+apsBrIovk3bNMz6k7gDRwrmMVTJ2OsY9vhbxJ7Sy38jfZ
	pHaOcLek66W7YUt57Ivx4ZB8eucpAAwuzFZJ8nyNWc0j1B3ojM4H+RbJ+Kqa92+4FvwUCG3YWpIOy
	wSqmCBmEPSEpnyEgW0CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEpLm-0004ur-24; Fri, 12 Apr 2019 06:07:46 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEpLj-0004uU-9W
 for linux-riscv@lists.infradead.org; Fri, 12 Apr 2019 06:07:44 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id A731068AFE; Fri, 12 Apr 2019 08:07:30 +0200 (CEST)
Date: Fri, 12 Apr 2019 08:07:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 2/9] riscv: remove dead big endian code
Message-ID: <20190412060730.GA32440@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-3-hch@lst.de>
 <3382adaf8be0b44af9ebb8b7528cac41@mailhost.ics.forth.gr>
 <20190411154731.GA23171@lst.de>
 <a5de00d885d5ebf5db35fa2c78738963@mailhost.ics.forth.gr>
 <20190411163109.GA26533@lst.de>
 <a4c98bb5f5d4823d68c84f8133320eb0@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4c98bb5f5d4823d68c84f8133320eb0@mailhost.ics.forth.gr>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_230743_484533_851AF588 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 07:47:20PM +0300, Nick Kossifidis wrote:
>> The endianess is selected by arch/riscv/include/uapi/asm/byteorder.h
>> including include/uapi/linux/byteorder/little_endian.h, which then
>> defines __LITTLE_ENDIAN.  So we'd really need to check one part of
>> the kernel port agrees with others, which is a little odd.  And in
>> which place do we check that and in which one not?  It isn't like
>> other ports like x86 are full of such just because checks..
>>
>
> You got a point there, how about something like:
>
> #if __BYTE_ORDER__ != __ORDER_LITTLE_ENDIAN__
> #error "Unsupported endianess, check your toolchain"
> #endif
>
> on arch/riscv/include/uapi/asm/byteorder.h ?

I'm not really sold on it.  But I can do it as a separate patch and
we'll see if anyone likes it..

In fact it might make sense to just add this to the generic
byte order headers so that RISC-V doesn't stand out too much, which
would seem a little more sensible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
