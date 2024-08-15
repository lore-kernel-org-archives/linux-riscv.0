Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B5AC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mHdbne3sz5EwshBoLaBxtMeaDdqixfOr4A6FEYJsQo=; b=0R/2Rsm7Fwl1iW
	x29Y/Wr4eLbmEXJuDZw1B74RAAtcaYe26yH2CAfdvI+xTpqRHglU1owybR+HuZS1ss6qKlfcw7gD1
	dq2K+jplhtxXkSVg4DGtqR/RrYUNEPUzu4ElJGX8KSLeaxLNr7q/v2BloupJ86RvYjcUgh9eLjABh
	HkdZz5Rys4MgpU0lPq7ooj45d1nVNxPQQrShu7EOqIxGZ2LMoH/ryquEdnhZOoKPASXMwC9kaMl41
	ScEKKyPMuafTz+/PoUkFQ45705ftQJouAL8fieLgH6RYcOg6O5IV8QQSOeT2c2S1tBRnMwhVZ7yUA
	uKE9j+3Hj3QxheiHeKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seevg-0000000AjD5-206K;
	Thu, 15 Aug 2024 18:10:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seevc-0000000AjCK-0o2B
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 18:10:31 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723745426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIcN+dIpsXv32UGdjkrhLz6191NfIjPhsUje1gE84Ek=;
	b=YJGog9NahT5FBJYT42XzusFUmigYmnDfd+JLK0/zYmUsEGcqIJW+41DEd4KzKkCmff4+rO
	5vVQ1dELVh4U/zx3KO2t8XEuUI67pTEg9DCfaEODuKkSo/vpjrX3nbpfFeFS1sVR+gVC46
	3M/wd89TS2e9kVk4j/qZOUi9Mf8RdhSYbdre6evbVFfj2+69PBAk0w3Y6PmiszOgQI1r6r
	yisI8NXFi1v9PSSpgOfG0rYUgbC0sg6jDlnjcYeyO26cUUaIfC9pqAr180iHr46d+GCogZ
	PVspcb4B5A2GWMaHHgC92UBBi1fYOtkGt8HPXXXJ25FaFWntURDc9MP7KLd4wA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723745426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIcN+dIpsXv32UGdjkrhLz6191NfIjPhsUje1gE84Ek=;
	b=Pz9qjuQUyR8OhF/TBmmZiUXsC7RCoLOjJO846L4GaTFJPylLrqwjnO/HyVujGQl/laZYwe
	L6dRlDcMQbQ8sUBg==
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
 samuel.holland@sifive.com, aou@eecs.berkeley.edu,
 daniel.lezcano@linaro.org
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <mhng-5403a4a9-4cdf-447f-9c7e-ea655a2f86fc@palmer-ri-x1c9>
References: <mhng-5403a4a9-4cdf-447f-9c7e-ea655a2f86fc@palmer-ri-x1c9>
Date: Thu, 15 Aug 2024 20:10:25 +0200
Message-ID: <8734n5mzce.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_111028_399220_BEF41DB4 
X-CRM114-Status: GOOD (  13.92  )
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

On Thu, Aug 15 2024 at 10:51, Palmer Dabbelt wrote:
> On Wed, 14 Aug 2024 10:30:48 PDT (-0700), tglx@linutronix.de wrote:
>> I'm very much inclined to take the reverts right now, send them to Linus
>> for -rc5 tagged with cc: stable and ignore/nak any irqchip related riscv
>> patches until the next merge window is over.
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> if you want to take the revert.

I'm happy to wait a week and see whether someone gets that CLINT hack
working or as I suggested the D1 PLIC early probe quirk.

> IIUC the patch above doesn't actually fix it, that's what led to just 
> sending the reverts -- at least reverts are better than breaking users.  
> I'll post over there too...

Right. We figured that out by now :)

> And it's no big deal if we're in the doghouse for a bit.  Regressions 
> should get fixed faster than this, so we deserve it.

For a week I consider you probationers :)

> Probably also another sign we're way too focused on getting new features 
> merged, as that's coming at the expense of making existing platforms 
> work.  IMO we've been way too focused on getting support for specs that 
> don't even have implementations, and not enough on building real working 
> systems.

RISCV is not alone with that. This whole industry is nuts about features
and forgets the stuff what matters.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
