Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2814C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 11:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvSA/PwbYqwSgqXI+CC48nSgQYkbXCN1r5fAFczY0Dw=; b=YpZGBDjyWGIngv
	TVN2GHZHOPZFWvyqsLeG2zEWBR8/D+2vRzrw7BCt6f46mXhmMM7yBYUVFyKE/9qgRYlfYjcAWLe8Q
	vqwVk+pMrTKWNTBkMeMVZcu9OZ7p3uM2JXfGs+nz6Cta8hT3LNJR1XBvxl4qAiBc5YWD3cS90qD/j
	OS0eDXLgwSdYXNTd2eTonysy8YYUimhniDCmHYDd5Q4KPovDpBkBCCTv5dxbySFT42+9xvJkXzfiH
	GOi3jR1DxbVGJtH54NYi6AQ+TOCcXdobHF4mHpmcestRpcElfDihXzWLG1w9ZP2/sUK2AcqsKPjig
	0J4FYCzvZZ2io08PxD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRJb-008JTI-S3; Tue, 22 Nov 2022 11:19:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRJY-008JQn-HN
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 11:19:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oxRJV-00005N-Dd; Tue, 22 Nov 2022 12:19:41 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Tue, 22 Nov 2022 12:19:40 +0100
Message-ID: <11144018.nUPlyArG6x@diego>
In-Reply-To: <CA+V-a8u=vrrvhWCo+W28kbogMYHULuO3B6qcDeAEPEgzp+sVWg@mail.gmail.com>
References: <20221110164924.529386-1-heiko@sntech.de> <14108757.uLZWGnKmhe@diego> <CA+V-a8u=vrrvhWCo+W28kbogMYHULuO3B6qcDeAEPEgzp+sVWg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_031944_588789_13FC0FA9 
X-CRM114-Status: GOOD (  15.77  )
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

Am Dienstag, 22. November 2022, 11:59:57 CET schrieb Lad, Prabhakar:
> Hi Heiko,
> =

> On Mon, Nov 21, 2022 at 10:17 PM Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Am Montag, 21. November 2022, 22:31:36 CET schrieb Lad, Prabhakar:
> > > Hi Heiko,
> > >
> <snip>
> > As either manually or with a helper like
> >
> >         https://luplab.gitlab.io/rvcodecjs/#q=3D0xf4c080e7
> >
> > you can then decode the actual instruction and compare.
> >
> > In your log the two jalr instructions decode to different offsets,
> >         jalr x1, x1, -180
> > vs
> >         jalr x1, x1, -834
> >
> > Can you check what the patch_offset value is in your case?
> >
> patch_offset for the above case is -654.

which is a big indicator that the auipc-jalr-fixup function is not catching
the instruction ... i.e. -180 - 654 =3D -834.

I managed to reproduce that issue with your branch now
(after hacking up stuff a bit to run in qemu :-) ).

I'll try to find out where the fixup fails.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
