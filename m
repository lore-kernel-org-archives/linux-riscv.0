Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29342EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 06:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgKOi0wh7Wiy5M81FqRD76OF5pukZELjRSjL1j7tTus=; b=NMBn5KV6D59/Ew
	P2hzEPYzNYJvSLzVzwIQDA1+NcTArOB7s1khDprbJdkSuaBmgmMhJ+Q+jSx7j9VS6mOGtAlmvvfD0
	pconpEThLPSkH3uWtHuSWVrEiUbtunHkFJypM8zj+Z7FGI2H/bOi6OyQ7PcK0dcMsHD8R3pb6KT64
	ZI6UBjNnRm7a6ol5dLkcQ7x/cOPVzl9vnbLX/qSWCVfgiGOIKmMSzBljZ2107QiIeBckqRyG50A8W
	2xOrpoxAIkbox3HlVQJVNsDVT/qmmCrdSrI4GQSw8Pk2TlCOpJsaZyCLAtokppKYIEoxumxtGU1cu
	Z+9b9wJ7etChJE4XafuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKCGo-005AOX-0w;
	Fri, 14 Jul 2023 06:27:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKCGl-005ANy-34
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 06:27:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B09461C03;
	Fri, 14 Jul 2023 06:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792A5C433C7;
	Fri, 14 Jul 2023 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689316030;
	bh=c3Cyfkv+SZy5VmgtRQ3j2i501qpHew8qxvq8scls6SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pw6p5qPaBiYXC9imxMcFQ1UKmoth5rzV+n7xPbyoSWJcXqNz8wQS+Txb3YDrw87WR
	 327pVCW6xz2h/+kbSTaJN4TS0wqfstxYEFqrnHS0BXejr4YVdHpUXWFNNiTM9ONAWu
	 I2CCFpfQHU34X/JaO0j7MxEwJUUWgtcBMuUgR1p5M15IVU5kOAyLhYfXEgCxG7WGDh
	 EdzscCliaIRX8eFucCUkXlA3SFcb+vc74KHAvYc5jK4WLZ1VaJkeNdciL7lkhFUYcR
	 +5ySC1w4MtdCVHf7xr+eAFCMrkUyv3tUtXrtCw9/4IS5/dqU9pHq2IGQN/OxLN5mdN
	 2kYx3WqSs2Rcg==
Date: Thu, 13 Jul 2023 23:27:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20230714062708.GH913@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230713074042.GF2199@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713074042.GF2199@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_232712_050835_7D17DF0F 
X-CRM114-Status: GOOD (  20.53  )
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

On Thu, Jul 13, 2023 at 12:40:42AM -0700, Eric Biggers wrote:
> On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > This series provides cryptographic implementations using the vector
> > crypto extensions.
> > 
> > v13 of the vector patchset dropped the patches for in-kernel usage of
> > vector instructions, I picked the ones from v12 over into this series
> > for now.
> > 
> > My basic goal was to not re-invent cryptographic code, so the heavy
> > lifting is done by those perl-asm scripts used in openssl and the perl
> > code used here-in stems from code that is targetted at openssl [0] and is
> > unmodified from there to limit needed review effort.
> > 
> > With a matching qemu (there are patches for vector-crypto flying around)
> > the in-kernel crypto-selftests (also the extended ones) are very happy
> > so far.
> 
> Where does this patchset apply to?  I tried torvalds/master, linux-next/master,
> riscv/for-next, and cryptodev/master.  Nothing worked.  When sending a
> patch(set), please always use the '--base' option to 'git format-patch', or
> explicitly mention where it applies to, or provide a link to a git repo.
> 

Hi Heiko, any update on this?  I would like to review, and maybe test, this
patchset but there's no way for me to do so.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
