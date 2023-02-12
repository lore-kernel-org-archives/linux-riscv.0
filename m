Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF769C636D3
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oD4JSd8BB8pQCJ1fqb2NwcpYhNmMi8jFnJ+N8bjuys=; b=ZenpWL7W/ygNl6
	HMubLjRhVcAYOyjCsqgmV2XvD2ZnxisKLwqT93fwOUR6jhEBo/lr5LtqSYVssgzLcjGaIwjPBeqUz
	UDgBf1S6j1SjaIUiu5Y8W//UZOMnet2WBBq/cn+tLb680I+KVojTBsCdFZtL7Y0Jv72ms9VqwvEKn
	WPodrBRxIrgTczXIwHhtzLSCeumG6MSvZKrm0JfnnRSg7J2pe9diFjvHE5dhIw61q8J0VcY+DXb43
	2KGOGwcTh9CObcSnlHIsTGMbLx5n7ujG5qU8p8lB+b26/LHRq2i/FW9fGWFD8VPPrNCNKKu7wTQap
	hg4236EvKTU+wRnt4zRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRHE7-00C5ep-7D; Sun, 12 Feb 2023 18:37:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRHE4-00C5dx-GV
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 18:37:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE0C60CA0;
	Sun, 12 Feb 2023 18:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC042C433EF;
	Sun, 12 Feb 2023 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676227042;
	bh=lZKQIEO7UGeivhn0TxcsgdRpjPn0tConcYHrlR26cWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMGMzKRRXBU+ePfdud7KxhsZKGxgA3FMJMpTsOl2bCpWU9WXIaszBciS/mAKBWzmt
	 pFk40VxZzRjpRKEDwB7JRf05dGe8/z5/QKxKI6t/6DShauKCSQ6i/uUH4nxWKrcWBi
	 inrFk4G1EAHmkx+AQ2CkyBRwr3RVhWChB2ggbkWJNRgsFRgvTOL+RKXkW+mPCRqHjQ
	 ATuke1lgxtUp9dE+3u0ySSJ6E7z12SBSNWiTfESMeYQ7uiv7i0v5QJPCXfqAyAyGzy
	 V2tQzd+WYXOY3G+XanuoZ8par1ufewgtcBo8qKmBOW2F/kPvF4f2pjfclUpvloNjuA
	 SdICanzCUxcdQ==
Date: Sun, 12 Feb 2023 20:37:17 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Conor Dooley <conor@kernel.org>, mcgrof@kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 8/8] kbuild, PCI: microchip: comment out MODULE_LICENSE
 in non-modules
Message-ID: <Y+kx3fb2Lzlg+u5+@unreal>
References: <20230210164749.368998-1-nick.alcock@oracle.com>
 <20230210164749.368998-9-nick.alcock@oracle.com>
 <Y+aMh5e9bWaTphiZ@spud>
 <871qmx1fv5.fsf@esperi.org.uk>
 <Y+akw9VBjg9oZ7QV@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+akw9VBjg9oZ7QV@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_103724_629785_7E5B48ED 
X-CRM114-Status: GOOD (  11.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 10, 2023 at 08:10:43PM +0000, Conor Dooley wrote:
> On Fri, Feb 10, 2023 at 07:26:38PM +0000, Nick Alcock wrote:
> > On 10 Feb 2023, Conor Dooley said:
> > > FYI $subject seems wrong, this is a PCI patch AFAICT.

<...>

> > kbuild is present in every patch in the series because this is a
> > kbuild-driven change (the thing it disturbs is part of the build system,
> > the construction of modules.builtin*). This seems to be common practice
> > for kbuild-related treewide changes.
> 
> Okay, I'll take your word for it. It just looked/looks odd to me!

It looks odd to me too. Please add SPDX tag in modules which don't have
it already, instead of commenting code.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
