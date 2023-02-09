Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C147BC636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONXSxSgUgBhznupmcAPeiu0pRQSrEBrA8wfBxz33G/M=; b=mOPbXT7Rtd74u9
	DYn7re6jtN4RPLjCqXgaIB+gwG+KetUsM26eWGVEdDGBlKhTC4ag4yuyPG3P/Jhm0e6YW48CZHfqy
	yCGy3ELrcDDcyVHzJxig8JNGUrmKS+2s1DJW3rb0bmScwrv+TRBbZRJ2E+IKIYNuVsLFZhF09o41y
	qTwfEO0j03de4IlfM6U/0W/RLZcqWS2W12oYneIsJimPw3W5jPrRf3zSceNeTtDFzcQOtg8TTrUbS
	dIanR9KENuzrDpxC3h2QxClWQ7/2A4EkFwLRmiprPgj0sLJXV0jUI7YQo6oE/HERH9uIaZSAMXHOJ
	lzv80FDcw4s3Fc7tUNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBsR-002sWB-4T; Thu, 09 Feb 2023 18:42:35 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBsN-002sTv-8H
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 18:42:33 +0000
Received: by mail-lf1-x131.google.com with SMTP id bi36so4433011lfb.8
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 10:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i0aEDE75N2SdBDGGPL2lgt++w/A4f2z3JZVFa7fsP6w=;
        b=0sGaXDcbijcr7oYBBi4A/osUlPOLqpddmvr6yjcUghq8IMl4ZIdY6zKpopKJC9W6pV
         AGLHN3sBHEWqECUOQcSLQuJaRQsqGw6B+NcJwVdtbQ/mER/2nlVYQrJU2YuCTjaL2O/K
         ImF+MpptlhOrZxCBcvWTvrayzNUzK/SkWimx6fVKMhP8QIyMYlNAYyFUVWBg+XARH8bm
         65NFolmnqRyUx8euHY3CRVmmLp7vWK9ebEhQxRy4H0UTo1kRSKkyJQbTyw+GKXUap1jR
         xWoa0KMPh5Nw9oXdYTYbk6YGD0n3+b7jgsKk9MXrXTjwMPyq5xelyKlhVtgC2trJ0fSK
         Bg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0aEDE75N2SdBDGGPL2lgt++w/A4f2z3JZVFa7fsP6w=;
        b=VBT6x7KwjflNPQRYeO+6oJn4O5h7VMcNq0lLj+iFO9z/sa5iKlasxKFwYrLiUpFZdk
         NptNSrVWJXbUtvXieT9uDUCf+fUmJ/cC8EXa61pIzI6aJPtqvY49lG6PZh0cEpPFHhx7
         suZR0V4QGKRvxN6pccsvTF3kVFpSHiO8eKchBM1269QTSNNwy12hGurLGlWUpbA1/Slw
         MICDr57bSfmvLjHmc6NhiOg9QL6a73nhT7QTYKqni+yMhWpxH2/CIMQhsbUsepH6VEhT
         oBTU9mDikxniEVmQ7rxmq7S/HJNqyQPJH8gIajXiGLFnMOcO7LXS3YKEBnJs3SlUAzrW
         QBcg==
X-Gm-Message-State: AO0yUKVksn0/FawK9Y6qpbE91knEUHSLDicQj+bF2EwYYtP9T4IJP1Sc
	TEC+bRPFclc5ts8I2zWGB2p/XVErn+OxA4CNfgqJCw==
X-Google-Smtp-Source: AK7set8Xnf2aypJtFoPs/ialPERepYClud8fqjfrGasZLQIuYamcdQuwo/59VT5Flm2ac6uKIY2iXRlx6BJ+wdu8Hyg=
X-Received: by 2002:a05:6512:218e:b0:4d7:2dc1:b7bc with SMTP id
 b14-20020a056512218e00b004d72dc1b7bcmr2133331lft.100.1675968147543; Thu, 09
 Feb 2023 10:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-3-evan@rivosinc.com>
 <Y+HsE397cY4HF+5K@kroah.com> <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
 <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com> <Y+UpqHstcMahbadE@kroah.com>
In-Reply-To: <Y+UpqHstcMahbadE@kroah.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 9 Feb 2023 10:41:51 -0800
Message-ID: <CALs-HssV0=fcDKtUN_3S8T+_Qtq+6qCiNbfQU9SXicsh2KFt4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com, 
	heiko@sntech.de, slewis@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Bresticker <abrestic@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>, 
	Atish Patra <atishp@rivosinc.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Celeste Liu <coelacanthus@outlook.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Ruizhe Pan <c141028@gmail.com>, 
	Sunil V L <sunilvl@ventanamicro.com>, Tobias Klauser <tklauser@distanz.ch>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_104231_503916_A0E92F80 
X-CRM114-Status: GOOD (  30.96  )
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

On Thu, Feb 9, 2023 at 9:13 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 09, 2023 at 09:09:16AM -0800, Evan Green wrote:
> > On Mon, Feb 6, 2023 at 10:32 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > Hey Evan, Greg,
> > >
> > >
> > > On 7 February 2023 06:13:39 GMT, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:
> > > >> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> > > >> system call that quite does this, so let's just provide an arch-specific
> > > >> one to probe for hardware capabilities.  This currently just provides
> > > >> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> > > >> the future.
> > > >
> > > >Ick, this is exactly what sysfs is designed to export in a sane way.
> > > >Why not just use that instead?  The "key" would be the filename, and the
> > > >value the value read from the filename.  If the key is not present, the
> > > >file is not present and it's obvious what is happening, no fancy parsing
> > > >and ABI issues at all.
> > >
> > > https://lore.kernel.org/linux-riscv/20221201160614.xpomlqq2fzpzfmcm@kamzik/
> > >
> > > This is the sysfs interface that I mentioned drew
> > > suggested on the v1.
> > > I think it fits ~perfectly with what Greg is suggesting too.
> >
> > Whoops, I'll admit I missed that comment when I reviewed the feedback
> > from v1. I spent some time thinking about sysfs. The problem is this
> > interface will be needed in places like very early program startup. If
> > we're trying to use this in places like the ifunc selector to decide
> > which memcpy to use, having to go open and read a fistful of files is
> > going to be complex that early, and rough on performance.
>
> How is it going to be any different on "performance" than a syscall?  Or
> complex?  It should be almost identical overall as this is all in-ram
> and not any real I/o is happening.  You are limited only by the speed of
> your cpu.

At best sysfs is 1 syscall per key, whereas this version of the
interface lets you query all the keys you're interested in with a
single syscall. With the
proposed vdso version, we'd be down to ~0 syscalls for most queries.
The complexity aspect is mostly a reference to having to do a bunch of
open/read/parse/close operations at a time when mem* operations are
still being set up. Since this is something that may get run on every
program invocation, it seems worth it to be able to get fast and
simple queries even if it's a slightly separated interface.


-Evan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
