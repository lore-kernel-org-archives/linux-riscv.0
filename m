Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCC0C07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620D661411
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620D661411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpHjRLNEPc7V46naw9j9Hq2CXuoo0zJtTo/3BgEQdYo=; b=ImnUf9Tnn0Rsjz
	eI8HBgRbzde3oNI+Ed2LZOS9tIBOvFldx/kqhwubkaHN+yoWf3U+roHRrvpAEdTytMHIWy8FVGR4y
	uz3s/ZHwOKj5+ouk6BN9v2hdeUjEgSGUNx8p9kGpuzEZ8h/RDLRi1Kbfg6WZO6IuLIhlKNDRdei/y
	hKPfrkxoVBfhPWGCTpJp7NXmh1+HFDp2sn7VMp8cZzh1pnSzwR1XBQG2aAMdf5qt9gI+9ZuhiXA9p
	Pj+N/nkj89lvCgBtUc4tJW/lhUixq9+9FAlfRjqCySmU2xDcEgTkKmjtgDo6tXdzUuTCg7kjaYOzE
	CVxi3ctWzf3XekO0Mneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6YF-00ClXp-PT; Fri, 04 Jun 2021 09:55:39 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6YC-00ClW6-0A
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 09:55:37 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mgebs-1lAFQ725yG-00h7Uk for <linux-riscv@lists.infradead.org>; Fri, 04 Jun
 2021 11:55:31 +0200
Received: by mail-wr1-f45.google.com with SMTP id a20so8730579wrc.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 02:55:31 -0700 (PDT)
X-Gm-Message-State: AOAM530Sw4LVTTc4FSgAuxpcOWtorjyxVtrhKFWfVN2g1Hzja4Y+SLAR
 jztpiK++eyFroMiSrhdXHubptPgt8FfWbPL+co4=
X-Google-Smtp-Source: ABdhPJxshE3+Uw6+fWuekuuwJhK8oE6TcJIBm0QrwrkRRuWDjLhV71VM+ZrxsXwvq+Gqd5ead+heu/mutRyeZaqbM2U=
X-Received: by 2002:a5d:5084:: with SMTP id a4mr3045824wrt.286.1622800531222; 
 Fri, 04 Jun 2021 02:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <CO6PR04MB7812D8905C6EEBDE8513866F8D3C9@CO6PR04MB7812.namprd04.prod.outlook.com>
 <mhng-3875d1bc-74dd-4dc8-b71d-18a8f004039a@palmerdabbelt-glaptop>
In-Reply-To: <mhng-3875d1bc-74dd-4dc8-b71d-18a8f004039a@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Jun 2021 11:53:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a03sxxnzpZPxNnXLtCFOFBZ6espEj4V5y=K+59dOLJc6A@mail.gmail.com>
Message-ID: <CAK8P3a03sxxnzpZPxNnXLtCFOFBZ6espEj4V5y=K+59dOLJc6A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, wefu@redhat.com, lazyparser@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-Provags-ID: V03:K1:5n5g3G5xtua3c+FuFfsnsfbJUZZvWQtNjmCNhHk2/xqmmtjYMkT
 P6ufsQlFJEM1W0McGYA/xTm8KQKfBmuFIJZWDaj2px+3S94VU1b/wbnZSl8IZ0p5blmokSu
 sP0bugf4uWRwb0MNMQq+3QfoBjH8e0IleVHkr4oZfTQbdwE8IGcyf97X2WFUa1QqpvKo5fT
 ypOvNp1CByB/m2QiWKkZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FhSwdiYNnds=:Ga4qt0E5Sk67io3T0oJfVG
 HaFOOusm5giBmmFiVWjgJ/H8Z/bnTq6QiCgAoCKhPJcVbFSUxtkyVhK569m8Z6qSMs1Ut36+9
 0KPXcVKe3GuV20NA+hE1fg1hijZ1v5KCFU9Fbm1FTMxasyIs2O7MgdIvb/Yqp79fsQvGEDTOC
 ncpvk5dOg8y7tqdmJIrQRAvDKeloYusmrv1BDhU3/adCDx9tNFOJZpVfBsGb/IWaDbD7qRHZC
 C0NzwbbS9I3rSf3flL1BAPXVrQSWwP8M/pIQGd9L0UWzB1ZLWiQvjlkX6xp5g4RB0CIEpElyx
 WKTwo5OsksRE8Y4qHcnE6iD1pRppLPbfBiCyWAc83LR4ThdlpAzn+9DGEq/714QPbO2sNR229
 HtgaclQnk6MoxOP4Hf8JYgg2zceRF9JY5dXXOdefGyjq1WMh3yprhmPTMzt7HdMCdvDD6bSO7
 Yr8JkqsKF33vhYoINNAGUCh/GZQSu89KLH8Y/HiSuwn4BJneagxJtyJMJ7KPAn++jYDLrpXCQ
 ewsj4E2ZNmOPb2skOHUaYc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_025536_364580_6EE7410E 
X-CRM114-Status: GOOD (  32.57  )
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

On Thu, Jun 3, 2021 at 5:39 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Wed, 02 Jun 2021 23:00:29 PDT (-0700), Anup Patel wrote:
> >> This implementation, which adds some Kconfig entries that control page table
> >> bits, definately isn't suitable for upstream.  Allowing users to set arbitrary
> >> page table bits will eventually conflict with the standard, and is just going to
> >> be a mess.  It'll also lead to kernels that are only compatible with specific
> >> designs, which we're trying very hard to avoid.  At a bare minimum we'll need
> >> some way to detect systems with these page table bits before setting them,
> >> and some description of what the bits actually do so we can reason about
> >> them.
> >
> > Yes, vendor specific Kconfig options are strict NO NO. We can't give-up the
> > goal of unified kernel image for all platforms.
>
> I think this is just a phrasing issue, but just to be sure:
>
> IMO it's not that they're vendor-specific Kconfig options, it's that
> turning them on will conflict with standard systems (and other vendors).
> We've already got the ability to select sets of Kconfig settings that
> will only boot on one vendor's system, which is fine, as long as there
> remains a set of Kconfig settings that will boot on all systems.
>
> An example here would be the errata: every system has errata of some
> sort, so if we start flipping off various vendor's errata Kconfigs
> you'll end up with kernels that only function properly on some systems.
> That's fine with me, as long as it's possible to turn on all vendor's
> errata Kconfigs at the same time and the resulting kernel functions
> correctly on all systems.

Yes, this is generally the goal, and it would be great to have that
working in a way where a 'defconfig' build just turns on all the options
that are needed to use any SoC specific features and drivers while
still working on all hardware. There are however limits you may run
into at some point, and other architectures usually only manage to span
some 10 to 15 years of hardware implementations with a single
kernel before it get really hard.

To give some common examples that make it break down:

- 32-bit vs 64-bit already violates that rule on risc-v (as it does on
  most other architectures)

- architectures that support both big-endian and little-endian kernels
  tend to have platforms that require one or the other (e.g. mips,
  though not arm). Not an issue for you.

- page table formats are the main cause of incompatibility: arm32
  and x86-32 require three-level tables for certain features, but those
  are incompatible with older cores, arm64 supports three different
  page sizes, but none of them works on all cores (4KB almost works
  everywhere).

- SMP-enabled ARMv7 kernels can be configured to run on either
  ARMv6 or ARMv8, but not both, in this case because of incompatible
  barrier instructions.

- 32-bit Arm has a couple more remaining features that require building
  a machine specific kernel if enabled because they hardcode physical
  addresses: early printk (debug_ll, not the normal earlycon), NOMMU,
  and XIP.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
