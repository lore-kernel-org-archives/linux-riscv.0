Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415C8C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQy/8YT0VlmEN5tyIhMOdS5aRskt8E9BKOfQU8050R4=; b=PmEp1n0Wf63iXr
	MBe9u5ydZZOLrfNgENAl0BrZKs4k9G2T5nrS7ypRdiLEV520owLB3giX+4wL5/eKkS/1iTsXYfhUt
	pO3Xx3o5kSmqZsIRk5s8JqJXhU4KfVUUTKPG85V+ZnwHp+eYbOL3Jl56whn3hEey56GIjWmElFaCG
	BROvmWbL36oxVl7Xln0CULT9jYGudO0inLRBH2KwscW5saidbAqXds2YvwvhtFgrvOkiziFxvzaSV
	t7aotppEUhBfURuhwb9T+6AmQGFYOG2Kvtnxn+m9xrYDy37aNLo8gftgl+jXK7byNggm+txnZPE+C
	A9OKs/GnKTcpZExOdIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRMU-00EnYz-34;
	Thu, 04 Jan 2024 17:18:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRMS-00EnYF-0k
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 17:18:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D23D0618D8;
	Thu,  4 Jan 2024 17:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434EFC433C7;
	Thu,  4 Jan 2024 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704388703;
	bh=4BDLtWSfYGZgp3W2cYGuKr7Sby6Scya/xnEGeEw71bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozARAWKfOoTssT2qAByVR5pY7jB4Pp03cp1083vFpdHUP35jsbwxqDl3iMoG3KCZb
	 LMCQKOLqm5+KgucXw/zwgDVs0VGEgDcqjZqyL8XO78G9PbeUFGkrDhcTPu5LkGgkQl
	 efQ9E9kziOE/XPVH4aJvMosk/kPflkT59rOMsPwUgOuy5S3mjX5EVnpSMankwqAJ5p
	 HOVQXl1ew0mB8BMuPkiZjM2WcVVdyABubVwgeaVJp3rLwi3DVDAsw0Z+miz1gHs6jW
	 DqgGFZNJNtHXPf2rFzV3wtmx6brI/uK3J9AmFh6sRPYrdNcAFe/ur3SmZ2fswTsmSm
	 LImliq38trvHA==
Date: Thu, 4 Jan 2024 09:18:21 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>, hongrong.hsu@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [RFC PATCH 07/13] crypto: riscv - add vector crypto accelerated
 AES-{ECB,CBC,CTR,XTS}
Message-ID: <20240104171821.GA1127@sol.localdomain>
References: <20240102064743.220490-1-ebiggers@kernel.org>
 <20240102064743.220490-8-ebiggers@kernel.org>
 <20240103145043.GB773@quark.localdomain>
 <905D43CF-B01A-49DE-9046-51A370B6F680@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <905D43CF-B01A-49DE-9046-51A370B6F680@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_091828_375872_1921C216 
X-CRM114-Status: GOOD (  23.49  )
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

On Thu, Jan 04, 2024 at 04:47:16PM +0800, Jerry Shih wrote:
> On Jan 3, 2024, at 22:50, Eric Biggers <ebiggers@kernel.org> wrote:
> > On Tue, Jan 02, 2024 at 12:47:33AM -0600, Eric Biggers wrote:
> >> diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
> >> index dca698c5cba3e..5dd91f34f0d52 100644
> >> --- a/arch/riscv/crypto/Makefile
> >> +++ b/arch/riscv/crypto/Makefile
> >> @@ -1,7 +1,10 @@
> >> # SPDX-License-Identifier: GPL-2.0-only
> >> #
> >> # linux/arch/riscv/crypto/Makefile
> >> #
> >> 
> >> obj-$(CONFIG_CRYPTO_AES_RISCV64) += aes-riscv64.o
> >> aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o
> >> +
> >> +obj-$(CONFIG_CRYPTO_AES_BLOCK_RISCV64) += aes-block-riscv64.o
> >> +aes-block-riscv64-y := aes-riscv64-block-mode-glue.o aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
> > 
> > A bug I noticed (which is also present in Jerry's patchset) is that some of the
> > code of the aes-block-riscv64 module is located in aes-riscv64-zvkned.S, which
> > isn't built into that module but rather into aes-riscv64.  This causes a build
> > error when both CONFIG_CRYPTO_AES_RISCV64 and CONFIG_CRYPTO_AES_BLOCK_RISCV64
> > are set to 'm':
> > 
> >    ERROR: modpost: "aes_cbc_decrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
> >    ERROR: modpost: "aes_ecb_decrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
> >    ERROR: modpost: "aes_cbc_encrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
> >    ERROR: modpost: "aes_ecb_encrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
> > 
> > To fix this, I think we should just merge the two modules and kconfig options
> > together so that there is one module that provides both the AES modes and the
> > AES single-block cipher.  That's how x86's aesni-intel works, for example.
> > 
> > - Eric
> 
> That's a bug in my patchset.
> I don't test with all options with `M` settings since I can't boot to qemu with all `M` settings.
> 
> Could we move the cbc and ecb from `aes-riscv64-zvkned` to `aes-block-riscv64` instead of merging
> these two modules?
> Thus, we could still enable the single aes block cipher without other extensions(e.g. zvbb or zvkg).

My proposal to merge the two modules still results in the single-block AES
cipher being registered when zvkned alone is present.  It just won't be
selectable separately via kconfig.  I think that's fine.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
