Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D862CC25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 20:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sUZvEQwQ53a+NT9AwtTDvXy7EMe2Le1/5XNvRH2u30=; b=uoLWLpVUwIPBfy
	opyF/1CSIQy4B45pFVl16bSake8OdAm6J0asElLupt57u11qXp2fUqWmO5UPARb4WLJPOii0xKoRs
	h2FjduXOK1s2XNgpzyFbINJMARpimoHW3GLdkwsXYKPwDXtor4+4GirANWN4y67K/IiA8LOSGmQ4E
	ak2YORBsm1JY1X2KRysxDEYBq0Sz7RJCgIBaBK+TG1Q/HBT9VQomdqfCuAaeQW2fD4lDdIFFUs8TS
	oL3WWm5ORcy2RPVTMLWo3zGKS/2dQ51bMD4ARwKkU/aPVPVHsmPDJgbzd9Uj45tAYK/NnPk9+FM/J
	4wtcehCuL9yaW3w2TRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAbtQ-00000009r3v-2ApP;
	Fri, 24 May 2024 20:52:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAbtM-00000009r1X-10cJ
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 20:51:59 +0000
Date: Fri, 24 May 2024 22:51:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716583911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnGzUsjzG0HmIIecrpeyhdj8xRmmJcYzbtjAguZpAMc=;
	b=KlKSYU71/teOqH2WxiRGXp7U+lVSfUBTL+htQXBPEgsDsZ+FIPaf8ehRnLE7VJdAt3/5B0
	lecEB6p39aOURjQ/ZPh8ZGAiI212GHRHx/jEM2FJkcnK9AZIf0IYOx1fYq7cvi70jWlW9o
	JKtVIf54tHlL5KCoYyHW90+KRFlfyfdGpzgJuzvX+rSvEVu7pVOE0Jq3bA6f7ych9axMfX
	b5wNrYkNVjt1cWOeMJn8nyv6QV1IxgblSZm7VArYgZWpK3F5uYgwz7u3DNpsaMF9sdME/B
	fUfBjE68dt3EZnoNwD/327H52oQER1PHoCHRjrdjDD283Pg+7gwxS/vIToyvoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716583911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnGzUsjzG0HmIIecrpeyhdj8xRmmJcYzbtjAguZpAMc=;
	b=dRK92Xlqdes65yghENzMvVaVr2hLmOXfLT7gE558r2LJBjTbK1XjdKD4okqnrOJH3G4oBJ
	60PoI4dUQ6JRj7BQ==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Don't use hugepage mappings for vmemmap if it's
 not supported
Message-ID: <20240524205146.ZaCva-qC@linutronix.de>
References: <20240508173116.2866192-1-namcao@linutronix.de>
 <43829e94-98ae-46a4-a3e6-dbabbe94d7c1@ghiti.fr>
 <20240508184641.WP8ok_Hg@linutronix.de>
 <8b741144-8a3c-4a4c-bb3f-dfab4aa8e576@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b741144-8a3c-4a4c-bb3f-dfab4aa8e576@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_135156_451207_F9496217 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, May 24, 2024 at 10:07:40PM +0200, Alexandre Ghiti wrote:
> Hi Nam,
Hi Alex,

> On 08/05/2024 20:46, Nam Cao wrote:
> > On Wed, May 08, 2024 at 08:22:43PM +0200, Alexandre Ghiti wrote:
> > > > Commit ff172d4818ad ("riscv: Use hugepage mappings for vmemmap") broke XIP
> > > > kernel, because huge pages are not supported on XIP kernel.
> > > I don't understand why XIP kernels can't support huge vmalloc mappings,
> > Me neither.
> > 
> > > so I
> > > think the right fix would be to enable such mappings on XIP. WDYT?
> > I agree that is the ideal solution. But I don't want to send any new
> > feature to the stable trees (stable folks may even reject such patch).
> > So I intend that to be in another patch.
> 
> 
> I have been thinking about that, and I actually think that the real fix is
> enabling huge vmalloc mappings for XIP as it was an oversight/mistake in the
> first place. On 64-bit kernels, there are no reasons we can't use PMD
> mappings for vmalloc. So I'd rather not go with this fix.

If you have strong preference for that approach, then we can go that way.

I don't like this patch that much anyway. The only upside is that it is
safer to backport, because it is obvious that it won't break anything else.

I will do some testing with PMD mapping on XIP, and come back later.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
