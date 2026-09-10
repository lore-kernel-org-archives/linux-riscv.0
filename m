Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B16AC88E41
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 21:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8C0RGem0SJLuVT5nrWhKXNJedKfuYElMmAfueBFaqZM=; b=07P0aPSlENAj4D
	MSzHQgPqWpLGgv0grnMy4OcS3preD5pt/WNAgAp/t4jtl+T6mfT04fEqtbCAc1aKsD784UjNJTUPM
	LzUE59MFcqC5XnenrgWqGXxuGV07KlEzQHJ6wMmIwJUdG8sF+bgRr0pL6VlWLlsc/KDZRQiBa06nE
	Ba3/uFNtPP/BwtzSbPK5dW3/9k6uDUbubUKuNjPXJfP4JY8JOKAU11ehb04vk1pp1bOAIlYqOf/xq
	3/Dhxu2i+/hXDSb7M7Jf32UhH+SUG4GV5PZrVCXIqM0LwBec3Ouyn6n4jgw62EFcDZ6I4KK79/IE8
	F9/gs6DvlGS4hBtk3orA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mPu-0000000FQdu-21Mt;
	Thu, 10 Sep 2026 21:34:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mPt-0000000FQdj-1iGj
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 21:34:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 863D1601F0;
	Thu, 10 Sep 2026 21:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2E81F000FF;
	Thu, 10 Sep 2026 21:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789076084;
	bh=PKXkT/ObO3AiQVnD0gr+mNUkvO7QaDovBbeHZ8BprGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LMnwZ3m9+8G6xA4eJcyg1vRKBen51ojARFFWQLxA+XAWKssNS5/JGUuIA9Q3kaQ4M
	 7iDkzZTk6rPn3jQ6l0xCcb2z4KiVMYykFnFFeV/EOTCrDzyqXvNohLlz+1999VnLAy
	 /VjLfQZk9KlFP1A+f3C5he1lBEooJPUm7ZFCo83a6U97ux7nvwX/qbC7gVZKXkiVBz
	 xYJoK9fr3iuTrxVhyXoeg3MqRr2OvSuFmqthLdwvbz21VZ8ednjFGqp+VIpNHNuTCI
	 rvhouhNv0hhn6eub0AnMJabvvlOw/AftJy2U7UalOkbDpLmBgd77l94K6XpSI9z3JU
	 OxH2ys6sle/6w==
Date: Thu, 10 Sep 2026 21:34:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <20260910213442-GKE2346@kernel.org>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
 <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
 <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
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

Hi Guodong, Philipp,

On 10:09 Thu 10 Sep     , Guodong Xu wrote:
> Hi Philipp,
> 
> On 2026-08-07 19:51, Guodong Xu wrote:
> > On 2026-06-03 09:34, Philipp Zabel wrote:
> > [ ... ]
> > >Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> >
> > Gentle ping. All tags on this one are collected:
> >
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Yixun Lan <dlan@kernel.org>
> > Acked-by: Alex Elder <elder@riscstar.com>
> >
> > Could you take it through the reset tree when convenient?
> 
> Second ping. This is a MAINTAINERS-only change and carries your
> Acked-by, plus Reviewed-by from Yixun and Acked-by from Alex.
> 
> If it is easier for you, I'd like to ask Yixun whether it could go
> through the SpacemiT SoC tree instead. Unless you object, I'd suggest
> we go that way if it has not been picked up by 2026-09-17.
> 
Sounds a good plan, let's give Philipp some time to respond, if he still
unable to proceed by that time, then I will pick it.. just want to avoid
 collision that both of us picked accidently..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
