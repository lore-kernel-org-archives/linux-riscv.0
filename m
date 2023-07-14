Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439A5EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJsF07PYj8yeyGQOSDNCiI1Pw7ojEoMytSTbwVrVMj8=; b=znl5GLF3niKo8s
	4ouDIwDW5L8uWHdjendOt0L2zbtJx6yzSmvntpZVm3ZOwPosJ0Ggwcewl+18Jts7JGfBcTc5phcgd
	J+qWcenr9mw4/Hav+cBx8t6U/GgQYMqT9jRIe0XGuYfLWD1MTqRhZYWzrDG+ZvvIcv+mQxm9beDe9
	FwHkPrNKGoy2xoV0MUG3LwJxS+LYkE4pyrig0UyB+9m58FgAk/ej1QVlcrbtoAj4IXYDCSIHmCGkc
	aUhBajpu5R0BrsD8sI7SwGdbZFSWgTb5AZHzF/G05AlLNfNQt++9qulWvan/UbT369GEGze3Hx5wa
	d2Xl3djOGM4caSIYfHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKCpN-005EqQ-0u;
	Fri, 14 Jul 2023 07:02:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKCpL-005Ep0-0e
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 07:02:56 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qKCp8-0001dj-Am; Fri, 14 Jul 2023 09:02:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au, davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Date: Fri, 14 Jul 2023 09:02:41 +0200
Message-ID: <5036521.5fSG56mABF@phil>
In-Reply-To: <20230714062708.GH913@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230713074042.GF2199@sol.localdomain>
 <20230714062708.GH913@sol.localdomain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_000255_237270_90C5B404 
X-CRM114-Status: GOOD (  24.89  )
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

Hi Eric,

Am Freitag, 14. Juli 2023, 08:27:08 CEST schrieb Eric Biggers:
> On Thu, Jul 13, 2023 at 12:40:42AM -0700, Eric Biggers wrote:
> > On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > 
> > > This series provides cryptographic implementations using the vector
> > > crypto extensions.
> > > 
> > > v13 of the vector patchset dropped the patches for in-kernel usage of
> > > vector instructions, I picked the ones from v12 over into this series
> > > for now.
> > > 
> > > My basic goal was to not re-invent cryptographic code, so the heavy
> > > lifting is done by those perl-asm scripts used in openssl and the perl
> > > code used here-in stems from code that is targetted at openssl [0] and is
> > > unmodified from there to limit needed review effort.
> > > 
> > > With a matching qemu (there are patches for vector-crypto flying around)
> > > the in-kernel crypto-selftests (also the extended ones) are very happy
> > > so far.
> > 
> > Where does this patchset apply to?  I tried torvalds/master, linux-next/master,
> > riscv/for-next, and cryptodev/master.  Nothing worked.  When sending a
> > patch(set), please always use the '--base' option to 'git format-patch', or
> > explicitly mention where it applies to, or provide a link to a git repo.
> > 
> 
> Hi Heiko, any update on this?  I would like to review, and maybe test, this
> patchset but there's no way for me to do so.

sorry about that. As you said, this should've been mentioned in the
cover-letter.

This patchset goes on top of the v6 scalar one [0] which in turn
goes on top of the arch-random patchset [1] and that in turn sits
on top of 6.5-rc1 for me.


Heiko


[0] https://lore.kernel.org/r/20230709154243.1582671-1-heiko@sntech.de
[1] https://lore.kernel.org/r/20230709115549.2666557-1-sameo@rivosinc.com



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
