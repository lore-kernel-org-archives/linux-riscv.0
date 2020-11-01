Return-Path: <SRS0=HNWJ=EH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146BFC2D0A3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 16:52:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3328206CA
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 16:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="arE8ie1N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rzDR+2zh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YXEIzcJm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3328206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bdipj16a9/aUpg5M/4oTUzeyn+XUxZcnFOYXJmZScoo=; b=arE8ie1NYDrklYiDCa4uvhxgw
	Q00Nh8oaSzsICok1t4yyQ9xLIHtHFjUzoLNLaIn7Bu6gHKyDWDFsGNAU82rZyvNtnApfGs8hTj1UT
	8OY395awERHLdhPmrdyd9Acps8L/xEF/P8dbQn9DvK/Ei0yVllpOykRSk56mCwuKvKRmti2jLO/5E
	ck7lXslBwmdeJ05NHcfoDxuS4Ar5y/2xc4b0VNXjGmpbRhtVQ+iDVtzEvQPTBAEdAH5QBYP4WpsLh
	5THaWnFIep/fWuQxE2HVgokccRj5NYCRnEzCjJH3vjE6q9VGo+R0EXZzgWXyr/0ohndqTNq81vms0
	USOdt8ObQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGaV-0000va-Ly; Sun, 01 Nov 2020 16:52:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGaS-0000u6-Gn
 for linux-riscv@lists.infradead.org; Sun, 01 Nov 2020 16:52:13 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604249527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZtASmEsd/FB84mTk1oOXBBdXFIzwqjrsRZ2JdtHEOE=;
 b=rzDR+2zh3P3kB8f1ohciGFUAFS+loOaeUt2q6n+LOzyF4K4yooUpVDBHzkjigj34c6vZLQ
 vrvDKB5XdW0fIBBgZNY/URJ6cHHqkJQzt0FX0pSWkuU1FT4s9f81w9+dKe2AbWgzkNHliQ
 WEWfqgjaz2BqPJ13NO1FiHuCIyQK/GWVyYCeUbeM3CIo0tGZyMMpedMm4yKqzCvWJd9XTs
 vYaMLpMOdqNnCcwtRQ/En1fcjzz9KZvOEgEVUgMHKQWmj0omn6vTryH+f/LBbM9x152oa2
 xR8nHmo2XoZ0fZuTZXFyedM5ftUQCJXpk2SjJpBYqzM84HNzfVzLvbTXEaFjXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604249527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZtASmEsd/FB84mTk1oOXBBdXFIzwqjrsRZ2JdtHEOE=;
 b=YXEIzcJmXyl4S9UEy4PEjHt1tgehLjQfzOBdlUK4WLqdODsHxp/XnNQqoIf76chRfQSQ40
 ocMuF+0sU1IUJTCA==
To: Marc Zyngier <maz@kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, anup@brainfault.org
Subject: Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when
 interrupt is hierarchy
In-Reply-To: <160423261831.76459.6853837344029171039.b4-ty@kernel.org>
References: <20201029023738.127472-1-greentime.hu@sifive.com>
 <160423261831.76459.6853837344029171039.b4-ty@kernel.org>
Date: Sun, 01 Nov 2020 17:52:06 +0100
Message-ID: <87y2jl81ft.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_115212_738978_044534F1 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 01 2020 at 12:10, Marc Zyngier wrote:

> On Thu, 29 Oct 2020 10:37:38 +0800, Greentime Hu wrote:
>> This oops is caused by a wrong chip_data and it is because plic_irq_unmask
>> uses irq_get_chip_data(irq_data->irq) to get the chip_data. However it may
>> get another irq_data with the same irq_data->irq if it is hierarchy.
>> 
>> In this case, it will get irq_data of sifive_gpio_irqchip instead of
>> plic_chip so that it will get a wrong chip_data and then the wrong lmask
>> of it to cause this oops.
>> 
>> [...]
>
> Applied to irq/irqchip-next, thanks!

That should go into urgent, the offending commit is in Linus tree already

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
