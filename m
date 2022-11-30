Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DFCC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0zTDA1vi8skSCvuoICvbqAL4E+XXMATtxdq38QEQwo=; b=bhaqF0ySLn6TIF
	ywEjcxN595/mQNjg6qkr5IrNdXnIoIM27Mh8jcpVxSomIyLdapPwCXIqPU/nIx/mjemg13ixt43i6
	Td/o3hxQmne7S3uW/usTf7OMY+ybzGa7UumTrPH+c1qvDzwws/ElZZemS3hHyGrubcR32HA9gCVkx
	/jk7UYmCzXoTffG0C1GjSpXjKQTPDWF5IEBZoZv879DE1WCyGp7lbfym/wN+e2KiZw8ffhcQrIwRD
	MVzmzAz+nNbPjRBMLGpEqVfLe1Yi+jkz1/lGU8dLV6Yug5/tYFz7ieaemMKBqX9OSRodYAy7auobs
	3RutLnoxwbouX83YMGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nvs-00GpB6-4D; Wed, 30 Nov 2022 14:19:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nvo-00Gp87-Q8
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:19:26 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Nvf-0002TW-OP; Wed, 30 Nov 2022 15:19:15 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 02/13] RISC-V: detach funct-values from their offset
Date: Wed, 30 Nov 2022 15:19:14 +0100
Message-ID: <3573772.tdWV9SEqCh@diego>
In-Reply-To: <20221130141658.yed6aurdf6j3fuuk@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de> <4000385.ElGaqSPkdT@diego> <20221130141658.yed6aurdf6j3fuuk@kamzik>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_061924_896532_82683BCE 
X-CRM114-Status: GOOD (  13.25  )
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

Am Mittwoch, 30. November 2022, 15:16:58 CET schrieb Andrew Jones:
> On Wed, Nov 30, 2022 at 03:04:44PM +0100, Heiko St=FCbner wrote:
> > Am Mittwoch, 30. November 2022, 00:01:10 CET schrieb Conor Dooley:
> > > Woops, I built this commit in isolation and:
> > > /stuff/linux/arch/riscv/kernel/kgdb.c:32:32: error: use of undeclared=
 identifier 'MASK_JALR'
> > > DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
> > >                                ^
> > > /stuff/linux/arch/riscv/kernel/kgdb.c:32:20: error: use of undeclared=
 identifier 'MATCH_JALR'
> > > DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
> > >                    ^
> > =

> > actually that is patch1's fault, that added the prefixes in the first p=
lace,
> > and I've fixed it there.
> =

> I guess I should have done my grepping for patch1's review with only it
> checked out...
> =

>  git rebase -i -x '<build command line>' <series-base-commit>

voodoo :-D

I'm doing that manually right now, I need to address Conor's comments
anyway ;-) .

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
