Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D544C3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:30:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D75217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n8XrNElC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D75217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AISu0ZbmtUk7qv/uEHIOZCYY4OfF31dz+lnSsc4LX9o=; b=n8XrNElCwGIC7k
	tuGPTNMfOOSyCq3+DcxvMkuP+zGErw2gKbLcfzd1bOw259DnJmJJ4BDgabMstgczR7SzEq447P9PK
	AqVX0B4+QTkB/0XOIXWwYRs0dZ6ChU3mNGBwFfGKIt0BPD2heOHogF0xM29M4s9JrkF3TqH0UMtfR
	53KDpSt+Nkszd6ha+KRup4IllJA7M9HnmA7aBsNrCMrpBXzwTRKDXCxPJ4fJg0rNeVPXyhkbs/HGU
	elGjbspAdBQzHFT3XBbugZbZEDMoHqKG40ypAtkE1EqrjS4pX4V90fGCnfO1e3Iz2z+d3jvDEpSu/
	1Pu6rcBh6rOO1wjnbXvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DCr-0008IT-NL; Mon, 26 Aug 2019 11:30:41 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DCp-00087h-T0
 for linux-riscv@lists.infradead.org; Mon, 26 Aug 2019 11:30:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 293A568AFE; Mon, 26 Aug 2019 13:30:35 +0200 (CEST)
Date: Mon, 26 Aug 2019 13:30:34 +0200
From: "hch@lst.de" <hch@lst.de>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH 5/6] riscv: don't use the rdtime(h) pseudo-instructions
Message-ID: <20190826113034.GC15002@lst.de>
References: <20190821145837.3686-1-hch@lst.de>
 <20190821145837.3686-6-hch@lst.de>
 <d15a578760061a5a0ebad8ca6024768f831686d2.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d15a578760061a5a0ebad8ca6024768f831686d2.camel@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_043040_087616_3C060023 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>, "hch@lst.de" <hch@lst.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 24, 2019 at 12:37:02AM +0000, Atish Patra wrote:
> > -static inline cycles_t get_cycles_inline(void)
> > +static inline cycles_t get_cycles(void)
> >  {
> > -	cycles_t n;
> > -
> > -	__asm__ __volatile__ (
> > -		"rdtime %0"
> > -		: "=r" (n));
> > -	return n;
> > +	return csr_read(CSR_TIME);
> 
> Does this work correctly in QEMU ? I was looking at the qemu code and
> it looks like it returns cpu_get_host_ticks which seems wrong to me.

It better should.  rdtime is just a pseudo-instruction that the
assembler translates to a CSR read.  (in other words something totally
pointless, no idea why it even is in the spec).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
