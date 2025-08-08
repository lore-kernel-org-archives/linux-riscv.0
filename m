Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C26C87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 04:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0E+4WSyEXNWcf2DkhJZ9ASm/UmGnIxEgNhSft3vUEU=; b=c6ZRGf+kmtYtkM
	5k0s9fijjZRyHKjeO0TXZTEYemmr6jAz1LunBzGu1r8n75fomXweyqK3fkXkjPLFczkw9inaeKqwN
	CiGqi5egPBM0p7qQT9h76G6ilzS/emDayAyvBSiMja9kSlCrwK8FNDuSLPvkV8aBNJ9WFKgkNBiWA
	JIXyHBahEpX6iDsYSNvtz/Q9MLjR6MnvZ0se2tMiqE0SjCGvBdCe7yI0/CmLf5qTkofwRbD4+3CoJ
	ABedXmTbBmAO5oCPoWpjcsIBydjU/hm9mRbOhwmqhQGG30HQupu2sVcwklhKhrAKcEa7JSPcPEzrI
	hzTeF6u2jGJzFxjdIwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukF6D-00000001zHR-0AK6;
	Fri, 08 Aug 2025 04:53:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukF6A-00000001zGy-2vLx
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 04:52:59 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754628775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JDnGGV7dC2AbZvKaXgtHgt5QXxVMQtVIKS4qBQaA58U=;
	b=NmPqKo5Ev007ZLd0iXzzv3TkeqjjsCFihzHkopauv4t9+m/nH8+JJAS8yNg1IuT2+euAJS
	rK6UdMm7t7wERSUaxCWxw5And+7rzwO92iNZaWOFRvT+1zxy/0wDnXJCXNV6m54wgvqeUB
	0YZCRPERBzmL77gHpgF5VDgStd3vhSzmaSRbJ+42ScFXiDGj4CBJb8QE+9zpnzBnphj8RP
	VTkc+ESbnTnEn+cZDlwKvaSkmGcCz848zsMei0IMxtVsICs9PwplBgv/wY1vrr+ZkiF3EL
	F+eeVdbhcVNjCai1G4Seh5/opYwo3Jkg4vSGfhAo8c5V3cabgBEkcj1AsVgA4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754628775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JDnGGV7dC2AbZvKaXgtHgt5QXxVMQtVIKS4qBQaA58U=;
	b=dkxkoec8BEhRpTO14mVCPGwylv4H2TKn5yquJUDsjdM4wRUJRjAnQ2McQhBT92uGYwQbWF
	QsF+WmM0EpQ3WRAA==
To: Inochi Amaoto <inochiama@gmail.com>, Inochi Amaoto
 <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan
 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Respect mask state when setting
 affinity
In-Reply-To: <prnjyu7ev5scocf4jh5jikox3niftje364lf3bjvizppxamdov@hbizpiazqual>
References: <20250807111806.741706-1-inochiama@gmail.com>
 <87fre3mhkh.fsf@yellow.woof>
 <nowqjgxmomniw624avrizohwzzq7ebkznb64m25qim3zgxjacn@oizd7ngxjd6a>
 <prnjyu7ev5scocf4jh5jikox3niftje364lf3bjvizppxamdov@hbizpiazqual>
Date: Fri, 08 Aug 2025 06:52:42 +0200
Message-ID: <87qzxmpg85.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_215258_877197_03A4D366 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

Inochi Amaoto <inochiama@gmail.com> writes:

> On Fri, Aug 08, 2025 at 06:01:39AM +0800, Inochi Amaoto wrote:
> After some dig in, I found it is not very necessary to add this,
> When all enable bit is clear, the PRIORIT register of irq is
> not functional, so only umask the irq does not make sense. Only
> calling irq_enable does enable the irq.

Yeah, I contemplated doing this myself when I added the unmask to
plic_irq_enable(), because it looks more natural that plic_irq_enable()
and plic_irq_disable() are opposite. But I don't think it is necessary.

> I prefer to add a comment to describe this behavior, instead of
> adding this change in a separate patch.

No preference from me.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
