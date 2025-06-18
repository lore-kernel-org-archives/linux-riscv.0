Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5701C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 21:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irVUdUPFlT9UsQWzdwaAuzHu9yA/fxHjF9d1YoLOOEs=; b=ZHco9C+mQbx0XY
	H98QQZJYtEscCY7QpYa8DdWYa60glkzgpqW72jL+pZfYLTwkBoClAN+VMUHYL8I3ejY6IHB2tZWmk
	Qta0TPReSrpSsunR3RE6JpPRmYS2Qx/DHOVNYUJnasHN2DZbDSLsglsIC1syEyP44cKrCu+Ntgsuj
	n9fHK1UsZmUxkp/RchD1YJEZrO/3B+eedaol5fv366Bhs0pLvEatuS0lPI0Gp7GDpaCfII1bX1ckL
	LPcH1pPphcL/zBo5NuB7IxGBiefUtxjJX1X8jgNRdz1GXHoy6bKRGLDumSrsjv4piwDZY2eHpaqfr
	AMOsz79EjCDi8agZmdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0PP-0000000BSDx-16UV;
	Wed, 18 Jun 2025 21:33:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0OO-0000000BS7d-0IbI
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 21:32:25 +0000
Date: Wed, 18 Jun 2025 23:32:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750282342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZMa2O8AGL4rZzzEiOPMYNakhubHEX8RJDS3+FA3SZ0=;
	b=M7mh5ZdRzII5oV0oqtDb7asLyTW55sU9xj26atQWaVYF5EAWrqK7QJyqNezb6xlar1s3ar
	07xLlCKf9K8RClOa1aOXtmGCro5WuItm69UObbwypLToeX6d+QYmQoOPivkwtE24xDb5HI
	vWbM7fMAXojT96YzCLrX2UPKK5YBXiGqBNK/x1+hmbtgij39dUpvRDQ4uA1MXKXFxMHeXv
	eM/3nqN4I7b2BXMcSFF8nYkBdCyF5DWsYJq4+jucZ0E0fT98kgN3lICsWMnz9K5z2uqRCx
	xkRYbUVgWcr1cnyIsl8FWXpiwC1Wg+1zf2gDNyU8q9fsjWXdEzcP6Wlv1DO+bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750282342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZMa2O8AGL4rZzzEiOPMYNakhubHEX8RJDS3+FA3SZ0=;
	b=apHMb/5QRrxV+6M7sGj3MPH3Kj4qDIKQE21q/rF0oOWdVaCBz3ewnWmDbKSH27+bf1pg1U
	sk4ab00QqNKV/0CA==
From: Nam Cao <namcao@linutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rtm@csail.mit.edu, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: futex(0x1ffffff81300000) on risc-v -> mm panic
Message-ID: <20250618212944.oFqYBNC3@linutronix.de>
References: <20250618132559.J2jP-TbE@linutronix.de>
 <mhng-CC013FD5-8FF2-40EB-902C-AA0078E99AB4@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-CC013FD5-8FF2-40EB-902C-AA0078E99AB4@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_143224_258412_FD6CA7CF 
X-CRM114-Status: GOOD (  16.58  )
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

On Wed, Jun 18, 2025 at 12:58:44PM -0700, Palmer Dabbelt wrote:
> On Wed, 18 Jun 2025 06:25:59 PDT (-0700), namcao@linutronix.de wrote:
> > On Wed, Jun 18, 2025 at 07:10:28AM -0400, rtm@csail.mit.edu wrote:
> > > This program on risc-v:
> > > 
> > > main(){
> > >   futex((void*) 0x1ffffff81300000, FUTEX_WAIT, 0, 0, 0, 0);
> > > }
> > > 
> > > results in:
> > > 
> > > BUG: Bad page state in process a.out  pfn:81500
> > 
> > I cannot reproduce this issue. Can you please share your .config?
> 
> It's also not reproducing for me -- or even compiling for that matter, but I
> stuck one that compiles over at
> <https://github.com/palmer-dabbelt/palmer-tests/blob/main/rtm-futex.c> (I
> figured this was a good excuse to start piling up some tests).
> 
> > Also, your kernel seems to have some commits on top. Are you sure none of
> > those is the reason?
> 
> This is on my fixes branch right now, with defconfig + CONFIG_DEBUG_VM=y.
> So maybe it's one of these patches, or moybe it's some other configuration
> thing?

I can reproduce this with QEMU and Debian trixie. defconfig + DEBUG_VM=y is
enough. I have to "search for the address", as OP showed in the other
email, because 0x1ffffff81300000 doesn't trigger any issue for me.

I can also reproduce on 6.14 and 6.15, so not a recent regression.

I will look closer tomorrow.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
