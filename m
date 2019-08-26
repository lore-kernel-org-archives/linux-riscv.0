Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81B5C3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC2A217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a1BB4VNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC2A217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzoPTvTM0/VwMfVYZLPgRjNIWwzzds1mELh3zpti6nk=; b=a1BB4VNJI14XkK
	YwwR2ODYluKX8Xski4y6qxSYwaiaqrIMA9N6lE/GopXjhLxMsZ4M2UYLygVQt3fj24lPAeir54V/Z
	ZhEzSkIGbOXjdI64I7Or0Bt4+LKoXgwljKHYpAahlVAeIucXEKbeE6TkT2R0z1El2Zn6uUNDfsbMc
	o9NYa1g9mG4DIsnrWJ27gXsY0gK9jfilCcyogp7plVIPPOCcyYUg7JS5NWQADfwlZ60DVRgk9yj1+
	OtgK32vT38MQO79AI+LLs0+3nM14efgIsyI2D8IgIrkAjps+OJLV4O5x9Yyh3YzSOs6TK4CmA9U0x
	JHevt3+faLPH/ZvvoqkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DIP-0002Ac-Aa; Mon, 26 Aug 2019 11:36:25 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DIM-0002AK-44
 for linux-riscv@lists.infradead.org; Mon, 26 Aug 2019 11:36:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id EA54C68AFE; Mon, 26 Aug 2019 13:36:18 +0200 (CEST)
Date: Mon, 26 Aug 2019 13:36:18 +0200
From: "hch@lst.de" <hch@lst.de>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH 7/8] riscv: improve the local flushing logic in
 sys_riscv_flush_icache
Message-ID: <20190826113618.GD15002@lst.de>
References: <20190822065612.28634-1-hch@lst.de>
 <20190822065612.28634-8-hch@lst.de>
 <7facec591af41619c640c00f54843aaba346075d.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7facec591af41619c640c00f54843aaba346075d.camel@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_043622_314211_7667DE6A 
X-CRM114-Status: UNSURE (   7.00  )
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

On Thu, Aug 22, 2019 at 05:34:46PM +0000, Atish Patra wrote:
> > index 9180b2e93058..8f1134715fec 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -20,7 +20,6 @@ void flush_icache_all(void)
> >  static void flush_icache_mm(bool local)
> >  {
> >  	unsigned int cpu = get_cpu();
> 
> get_cpu should be removed from here as it is called again in below.

Indeed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
