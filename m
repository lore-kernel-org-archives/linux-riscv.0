Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F162C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4v3jvvs+dyTopIGgktI48k4I2V50N/FO0QTyOeZA+I=; b=UsGwE0/z/cF0YW
	iPT/D3aj7PsWVZxBZAtoi2bFM5jLxkSDAmoT3s8YeuPEDeNw+u4OuEfcZXU27+aLkZIMxbKC2/rVj
	FCGleAK94lHB/acC4OV2OAJAB8Pp4AW9r5yud3orUNfv3TnEHnIewwKyoKTyRW4UXHn1pG0V+2hph
	jf9tuhaG2y89BxoSI1ueplVUGIO98sHSyTCZmzJTrop5cJHH4Y/2qXOtArjsBlEfonqJ13krlY7CK
	Kn+SYAmjJyeyxNZn1j0yqkqVXyrZ1AmJzUZU9nYV258E8aXjEjXE8p/HWVzkwV2zQX5KgFft4Um03
	keHFK/2x2ekwNrD/ROlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKNwc-007tlv-19; Wed, 16 Feb 2022 17:18:22 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKNwJ-007tdy-9S; Wed, 16 Feb 2022 17:18:04 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mxlmw-1oD2EI2hTy-00zHJ9; Wed, 16 Feb 2022 18:18:00 +0100
Received: by mail-wm1-f47.google.com with SMTP id o34so1634573wms.1;
 Wed, 16 Feb 2022 09:18:00 -0800 (PST)
X-Gm-Message-State: AOAM530ylA5cogxMmWm23uzvCa009lXgPhqGOX2c0+Zl0eTszrDLbLSW
 g+1D9GhiMKVr0zjJqa+BW9FG7j8pcVnjQqOeT4c=
X-Google-Smtp-Source: ABdhPJyc/mWw7BZcqDmPeOb0/9e0zsIX4UzDnjikuc6xYXH+Y45DLjEbP22nAVw01wqU4hWYYZzBcFWGXH0CiAOKTKo=
X-Received: by 2002:a1c:21c5:0:b0:37d:40d0:94c7 with SMTP id
 h188-20020a1c21c5000000b0037d40d094c7mr2504948wmh.1.1645031880257; Wed, 16
 Feb 2022 09:18:00 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
 <YgtQkjRe7fbXI/lS@infradead.org>
 <alpine.DEB.2.21.2202150901170.34636@angie.orcam.me.uk>
 <Yg0YHHk7NVWjedgn@infradead.org>
 <alpine.DEB.2.21.2202161631020.34636@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2202161631020.34636@angie.orcam.me.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 16 Feb 2022 18:17:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3F4x6XX9oZG+6L6NDYOMWv5O-vr2dN6=VF0SLGJzPMLQ@mail.gmail.com>
Message-ID: <CAK8P3a3F4x6XX9oZG+6L6NDYOMWv5O-vr2dN6=VF0SLGJzPMLQ@mail.gmail.com>
Subject: Re: [PATCH v2] parport_pc: Also enable driver for PCI systems
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christoph Hellwig <hch@infradead.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:nGTcDo+06CTL6YHOeNWC4SXg9Iww21ay35arQfJY2D4YwUAeFLb
 ZRid90M2vEAASaWZ7JtdCw60aXkuYhWXGLh/VL8tikaIhSQh2KV5iMVL+5x+Oc/IAuYQAvm
 +SGEnWJ+z71qVAoyfeC8Yrr8ELoe8V7IaYsjZShUAO+ePHM6Zcx7tC7DeZTUz1DlGh8ElfR
 zvYu/9LDz9pqBlLgHRNyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0UxNQp9zAa8=:9+xQcrByTwCAMRS520016V
 1J/t/UDfp/scn/u68GLfWu5uunFMnubxkmVfZj0UET+qld976FZSXz+t0v+2lwfhRSZuvzRg9
 t6CisGY/rn3ppCspJQOrlbr3E06CmcjTECc0lNKbtB2PAxwY/7F1KI7+r1JEjHkzVd20UTnDd
 pS10PL00DFldNkzMZGRGKSzwCEgTaL+miN6aQk9w/Ua0R3zTVI9L8dJB1VQvrwDaA4oF1/fay
 YK/PmMoO9ZlmYEQVuEYjZ8y0UYb/CjWdRDoa2pVYwo2M4BBJJFSLga2QluUyQ1SQ1Fz4F4aqA
 8DCG5vwAZKAn2k1QadTaHclsJOooue+bMM30xq0zRx5U6izfdPf6jpJCgyD/aP7XzzqrVNH4r
 JdMWbK09I5BVKjo+XGmVp0sJ3YUncSOEQe3lxDfG83lqFrqlEO087AwrRc9+/XmyilOvPpSp1
 IvllSichTaLl2Gk3teN86HeU4WPuIaGCAxMXcaJXmhLZaRwPE5sBYWKZPbu9+0230HDDXv+Tn
 8C1/ACWKX7QiHKy+asj5M2tQls9eT9tFCqcpy/piayEpC1APmEubh3TlcL7NkvFTyL6J2XBgn
 4xRVQmypVwzl9vS7c6S3k7USffCLzBjAtvRquif9UD58tTRPuWfQLfL7g7aHoNWz/a3phTsG1
 gmk6MKtjFs7VTdzyFNh8VnJPDYTpowW8RYwyYG9Hnamo4hAnm4sKSqSsiEaZZ3eeyI/vkXkXI
 eQON1w1e0cThyT8/MWim5XK6yLj2bfwHnhGGTFF5QVmFRFFPivEIn+emNoN1DXF3MEfGRuLjJ
 KPsj89NKJk/5GAxY2K5Vi5i8AICGvWXeN8DsGB4uBH8jN+fLi8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_091803_630024_5E552D82 
X-CRM114-Status: GOOD (  19.06  )
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

On Wed, Feb 16, 2022 at 5:35 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Wed, 16 Feb 2022, Christoph Hellwig wrote:
>
> > > > Instead of adding generic-y just ad a mandatory-y in
> > > > include/asm-generic/Kbuild.
> > >
> > >  I'm inconvinced.  Not all archs want it, 5 don't.
> >
> > Which is exactly what mandatory-y is for.  Provide the asm-generic
> > version by default, but let architectures override it.
>
>  I don't think so.  Those 5 architectures don't want it at all; 7 other
> ones have their own versions.
>
>  Otherwise we could blanket-list all asm-generic headers as mandatory-y.

I think ideally the PCI driver should be a separate file from the rest, or
possibly it could get split up even further.

parport_pc_probe_port()/parport_pc_unregister_port() are already exported
by the driver and used by some of the front-ends. The parport_pc_pci_driver
looks like it could easily go into one file using module_pci_driver(), while
the platform driver stays in the existing file and the legacy detection logic
goes into a third one. The powerpc and sparc versions could technically
also be separate drivers, but I wouldn't take the rework that far.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
