Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B316C54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1Ww+jOQTVmGtvL3zcWb0XZ4/kzclq2DSUMLGRr9Ofk=; b=4wpdSzp4nldLkj
	Bffkb7dqqDVZ9qgGgYuSSnjhOSeHMGo1FwHdc2+GawPLliTGHFpLraUMkMH8mtlT8AnK9/QsWUuNK
	BOmrRxL9V2UrS7xcYFuUntDjzI3Jzu0tKZqNLbFharl83PvhKiXc52m6JbvBkxMquWfdkdG4diXTj
	/tgqcLFN7Ps9bv4p1STQT3YSOCN7NeieVs8nIn8KgXdp4u67JLUR3mm2gt55NbFgeoc4p8zPzSZg7
	O2ax6kalpggFbXdNmCtL65Vb15RcehU1v7IDtAHXs1RAyjL2FH01FOs3dP2gxGluOBSNeXwxfRgIq
	TxxqPSdr696ttJrRoK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwgl-00Ezro-1t; Thu, 12 Jan 2023 12:28:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwgi-00Ezql-B4
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 12:28:09 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pFwgc-00062j-Af; Thu, 12 Jan 2023 13:28:02 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, jszhang@kernel.org
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Date: Thu, 12 Jan 2023 13:28:01 +0100
Message-ID: <4200744.ZaRXLXkqSa@diego>
In-Reply-To: <Y7/3qc6ppZzie/ve@wendy>
References: <20230109181755.2383085-1-heiko@sntech.de> <6183320.UjTJXf6HLC@diego> <Y7/3qc6ppZzie/ve@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_042808_400280_B0A27E75 
X-CRM114-Status: GOOD (  19.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 12. Januar 2023, 13:06:01 CET schrieb Conor Dooley:
> On Thu, Jan 12, 2023 at 12:21:38PM +0100, Heiko St=FCbner wrote:
> > =

> > I've gone forward and imported that series as a dependency in my tree s=
o that the
> > ordering becomes correct :-) .
> > =

> > Though of course I got a conflict with Andrew's
> > commit e923f4625ed3 ("riscv: Apply a static assert to riscv_isa_ext_id")
> > but fixed that up - though maybe a rebased v3 may be in order?
> =

> To be honest, I "strategically" didn't resend a v3 despite that trivial
> conflict since it's at the bottom of the list on patchwork.
> I was hoping that it'd get merged earlier in the window so any of the
> various bits of extension support stuff could go on top of the re-order,
> given it conflicts with, give or take, every other extension related
> patch. That's not come to pass (yet?) though.
> =

> I can easily respin, but if I do & some other extension bit gets merged
> before it, it'll conflict again, so I didn't in the hopes that the
> conflict could be resolved...

I guess it mainly comes down to what is easier for Palmer.

From personal experience, the less you have to think before applying a
patch, the easier it is to just do that that in a free minute. Though on
the other hand, the conflict in your series is pretty minimal.

So both ways have their advantages somehow.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
