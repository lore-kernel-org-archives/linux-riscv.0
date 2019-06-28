Return-Path: <SRS0=iP4V=U3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174DFC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 06:11:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6A82070D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 06:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bntRsPxy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6A82070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JBbf9ys0esptVy3KCBuoOOjh7h8OZTRjX4KyNH1uA8=; b=bntRsPxyujy0Ay
	zvvzvp/XBTP4jgzzfpG+H5/HuMqS/S/uTeokHc7eydQ/23ymbzdkf8sN6TXrfpRUS/Cm4Sp+xIYw5
	OlBQbQ3fS/jyFzXcCKpRN8ZwplxyZ4IOealt0GwX64B2USPNiY9XhYHdm3iUta2dIcnXbEPSfJN0W
	uCHESkeGXeNUIogvYD5zMkUbIXua/sjKFCCvSB0JnMbUeBV183KzLjZcN5cnX7smJ4lIpUqc0LobN
	xCzbZxrgPhfrFJIQmQ0v7zYTrTd7kz5ai0jpLPoiCWav9NGY4/pNfmAbQLuPLWpqzckTBYGQSqznd
	KWJetphLYkdR3eLwdM9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgk6l-0004Ok-46; Fri, 28 Jun 2019 06:11:39 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hgk6k-0004OM-3h; Fri, 28 Jun 2019 06:11:38 +0000
Date: Thu, 27 Jun 2019 23:11:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: using page table index in setup_vm()
Message-ID: <20190628061138.GB9834@infradead.org>
References: <CAHOvCC7EtFcYQDAQoenP7RdwW-4FQEex4FG5jLR2W0m+Q8t__Q@mail.gmail.com>
 <20190523095214.GD23850@rapoport-lnx>
 <CAHOvCC72URVWs8RswjqeewKn0rnoik2OespWkt+d+RNhdTHOAg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1906272304180.3867@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1906272304180.3867@viisi.sifive.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-riscv@lists.infradead.org, JaeJoon Jung <rgbi3307@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 27, 2019 at 11:04:56PM -0700, Paul Walmsley wrote:
> Hi
> 
> On Thu, 23 May 2019, JaeJoon Jung wrote:
> 
> > Thanks for your professional advice.
> > I'd like to take your appropriate suggestion.
> 
> Are you planning to repost this patch with the new patch description?

Note that this is going to confict with Anups bigger rework of the
area.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
