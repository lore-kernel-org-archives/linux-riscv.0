Return-Path: <SRS0=xQFv=QZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB718C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 09:50:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84733217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 09:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uf/PWUzM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84733217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oyjT50pF4gIWH6kpDyKSgS0jru4r8KITbOOyEiDQ64=; b=uf/PWUzM9bYhnJ
	CXAXJzrTbh2/51RkZSBMV5F5KEiVcNtB/qQ7jnSPN7VdqfBd0HFgwOjnMDtK08nYxiqzgmXcId/5O
	58ouVc7ijRLRauhKC/ZUKiMke02K7oDOKPyy8AVeRBC/oAcavrQVjXX3WBg2vK/v6MoQ9HUN9tdnq
	9nWpn/e0MsrSuc1Ocmbv0JoXR2DLTK4PML17jhBBkWk2qnAVBX0Kq1axAXuaFwtHolssuKt0Jpvz5
	8Qpa7Pkx9/LaUg3+ymA3VyHMuwSJFJBZPDzqgsZVK1aPHX6TziQV9UY0XSV4LYIcJ/yVTda/ASP5r
	e2+ZFqU5YKpZB5qLoH8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvfYl-0000K4-1J; Mon, 18 Feb 2019 09:49:59 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvfYb-00007I-VD
 for linux-riscv@lists.infradead.org; Mon, 18 Feb 2019 09:49:51 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 64A3B68D93; Mon, 18 Feb 2019 10:49:48 +0100 (CET)
Date: Mon, 18 Feb 2019 10:49:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH 0/4] provide a generic free_initmem implementation
Message-ID: <20190218094948.GA5892@lst.de>
References: <1550159977-8949-1-git-send-email-rppt@linux.ibm.com>
 <20190214170416.GA32441@lst.de> <20190214183854.GA10795@rapoport-lnx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190214183854.GA10795@rapoport-lnx>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_014950_316876_4C9EA32F 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Richard Kuo <rkuo@codeaurora.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 08:38:55PM +0200, Mike Rapoport wrote:
> On Thu, Feb 14, 2019 at 06:04:16PM +0100, Christoph Hellwig wrote:
> > This look fine to me, but I'm a little worried that as-is this will
> > just create conflicts with my series..
> 
> I'll rebase on top of your patches once they are in. Or I can send both
> series as a single set.
> Preferences? 

So far there wasn't really much a reason to rebase my series, hope
this gets picked up either by Andrew or Al (not sure what the right
place is).  I think for now just rebase your series on top, we can
then figure out how to proceed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
