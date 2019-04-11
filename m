Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70240C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:31:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C71A217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:31:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pbn/XtPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C71A217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OXtivMddF+9c/g0VLNlty1SP/8r2xVnV03ttGwsHZg=; b=pbn/XtPFhryq3Q
	8u0Mmvag5URPcEEvBpJ+qCXovD2c1mTfOaJAR3LXDtaiTt2E9d4u7fvXpTjG7/ZgiT3pw5BV06kGo
	BCRPOSoKrCMVdSlW661riMQPhOOZoaNKwvWl3634u1zWsjoS8ZUmqQcEQ5gNEQjzAEdK+UEXQpq8d
	TVKWjpXFDFJ1oYr9HB2G6nbnEY3+SdFnySmT2JFVA3DmErEJKUadE4mfrz8Yb8uiSc4YX+koA1lC8
	94ZBOIeZ9pyQxuIexvqqBQKrJTDugzjaXd73oq8fRfctPKkVqQttXqlWssrZOiKa56YDpuJyK8CFD
	I+fb6xbPMADcgaTaMEiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEcbl-00047H-Jt; Thu, 11 Apr 2019 16:31:25 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEcbi-00046y-G8
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 16:31:23 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0E1C168AFE; Thu, 11 Apr 2019 18:31:10 +0200 (CEST)
Date: Thu, 11 Apr 2019 18:31:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 2/9] riscv: remove dead big endian code
Message-ID: <20190411163109.GA26533@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-3-hch@lst.de>
 <3382adaf8be0b44af9ebb8b7528cac41@mailhost.ics.forth.gr>
 <20190411154731.GA23171@lst.de>
 <a5de00d885d5ebf5db35fa2c78738963@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5de00d885d5ebf5db35fa2c78738963@mailhost.ics.forth.gr>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_093122_689853_0D68B8A8 
X-CRM114-Status: UNSURE (   5.80  )
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

On Thu, Apr 11, 2019 at 07:08:30PM +0300, Nick Kossifidis wrote:
> I think we should at least warn the user about unsupported endianess,

The endianess is selected by arch/riscv/include/uapi/asm/byteorder.h
including include/uapi/linux/byteorder/little_endian.h, which then
defines __LITTLE_ENDIAN.  So we'd really need to check one part of
the kernel port agrees with others, which is a little odd.  And in
which place do we check that and in which one not?  It isn't like
other ports like x86 are full of such just because checks..

> also I suggest you also clean up include/asm/elf.h.

Agreed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
