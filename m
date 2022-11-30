Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC40C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0Vm3OWUKT4OHkt7dkgqwWEQQCHqZCFOV/R9hHHljQ4=; b=J6V5U/fdlMJM+m
	aY0B1Yh+Ww4ZUpFkRKwZOlxeM/Cou4QaOKnmMDrGr3u4COqRfRFJNlOVlq58JuCufxtvd+6GyZHRp
	RebDMp0w/PmqxkNjuyLrWDi4gi8KWk+Dq0dUURAHg9dv4m6VWww5NKNwXIdTNQv3toc+5tElLGOCF
	UCtp/GFypb/AoCssA/Gw+g3TgCXcaMqIIdDmBWuVZVr6BV6NF7VW5u/KOADb5IRcR00ngerBtwW0+
	vhgRMSQrf7cDJRRDVgNznrfIf1nDreMvv4di0BIoCPnB5/HB4jCNQZHRQhlKgg9ISOKoOHkdPDEEB
	4BUNWDOCoJxC54JbwxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LxU-00G3kL-0P; Wed, 30 Nov 2022 12:13:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LxO-00G3an-Pv
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 12:12:58 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Lx6-0001rV-Ty; Wed, 30 Nov 2022 13:12:36 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 01/13] RISC-V: add prefix to all constants/macros in parse_asm.h
Date: Wed, 30 Nov 2022 13:12:36 +0100
Message-ID: <7363079.DvuYhMxLoT@diego>
In-Reply-To: <Y4aFjRTZKGq8EnfD@spud>
References: <20221128102632.435174-1-heiko@sntech.de> <20221128102632.435174-2-heiko@sntech.de> <Y4aFjRTZKGq8EnfD@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_041254_873842_25C1CE05 
X-CRM114-Status: GOOD (  18.93  )
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

Am Dienstag, 29. November 2022, 23:19:57 CET schrieb Conor Dooley:
> On Mon, Nov 28, 2022 at 11:26:20AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Some of the constants and macros already have suitable
> > RV_, RVG_ or RVC_ prefixes.
> > 
> > Extend this to the rest of the file as well, as we want
> > to use these things in a broader scope soon.
> 
> What's up with the "weird" 57 character lines here?

that is my brain shouting "you need to wrap lines" too early.
I did make them longer now, but the line count won't change :-) .


> Either way, I hate these sort of diffs and my brain just switches off
> while trying to read them. Perhaps there's a way to make git spit these
> out that shows
> -
> +
> -
> +
> rather than
> -
> -
> +
> +

I know that feeling well :-)


> and I could be more confident, but it seems okay to me...
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

thanks


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
