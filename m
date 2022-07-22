Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E37C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWmqWNkb1zKkqfUb2uAvUAw36k5cja6+5miwxsxBRSA=; b=kU1NHAANsLZWOw
	ziZ4bAr8U6vliFHi3UbOl1jjFujP5RWn+GZ5otQDPHGDihSLssOujTWHBXzq2XQRD74Cw4JauINBV
	CN+KS+IecImLcISudd6SVwaLEnd862Og1KPxtiKWAgVTNRvl+daFqrt3+YCMjeaTYq5aipKfGgM+L
	eiPJGpIyIzdHZ3SMTPJT2D99Edsv6SvSVpu7FXnxDswgrrBd/ahFV2nryfX4cT0BG6ysy7nDAmBI2
	HsgCAOz/0ltdtzL64B9k0rqH4LOxuSMj6BkuMZEpDEDNdGFFXL253uhcxy2zt9rinAhoxErwNy35m
	BhnTY9dZb7Qe1/HMCm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnTc-000lzt-G9; Fri, 22 Jul 2022 07:53:36 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnTZ-000lwk-9Z; Fri, 22 Jul 2022 07:53:34 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBlpC-1oMXEU09jY-00C86S; Fri, 22 Jul 2022 09:53:30 +0200
Received: by mail-yb1-f170.google.com with SMTP id r3so6766937ybr.6;
        Fri, 22 Jul 2022 00:53:25 -0700 (PDT)
X-Gm-Message-State: AJIora9IgmRqpW0pqnoTPkg2ZLgn41oeEi2tUelc2bf5JOWYPEorIu7t
	b9HEYT7vWp9exRssJ3dfy71SXSjVxQsUkalqBMs=
X-Google-Smtp-Source: AGRyM1u41IXDpMEFZlEyB5V83L7UcLnJ5KdxUhKbRxndnLJwe/AJGnvb+uTj5YbKPfI9znCIi02PXAb+ssOFnGHCMII=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr1946760ybq.472.1658476404347; Fri, 22
 Jul 2022 00:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220721134924.596152-5-shorne@gmail.com> <20220721173733.GA1731649@bhelgaas>
 <YtnMEwh3U3Ng9q4a@antec>
In-Reply-To: <YtnMEwh3U3Ng9q4a@antec>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Jul 2022 09:53:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3T0GvYyRgw=ojD_wts_pfdzfqXS8iNfUYuByBvLF9SGQ@mail.gmail.com>
Message-ID: <CAK8P3a3T0GvYyRgw=ojD_wts_pfdzfqXS8iNfUYuByBvLF9SGQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] asm-generic: Add new pci.h and use it
To: Stafford Horne <shorne@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Pierre Morel <pmorel@linux.ibm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um <linux-um@lists.infradead.org>, 
	linux-pci <linux-pci@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:gevxnFAxARYcMGhy8ttWvCFfD9Dn7idbRRIXqWgzxGT0fGoLLjk
 VcAXZAfwssLfmKj6ZsxNSntBAxtYWxpQjJf5M3zrwmcWJPT3OQHReOWwdeMaBLDNe9Ch3z9
 OH/uCIcnQNeJ2vhI1eI8NRyW/tXiQrOf9/BdDG6EwGzlFtd6ZXlUkLhZVw6YporYcJaK/UA
 UgKf/8Sy/ro6b+MoJnHeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IKuyRd1lahE=:E82bSvQ8WaHHJSGqZAGInb
 0brKh1TqSVhm/YN1jqnvsQLBrO0kOFBep11iDzOmq1VXefuLoaufGllTj/SKL57l0QQWf9VKc
 iXGI1xEKzgQh8sb18EDQZESvRMenRfdaIVukDMQVyAKdhNTN5VAZmtri+JDgRpKo/5Lv+toKo
 7a+e83PnjZHDx0eb0ZNRaQGgN4da1Oppn4N6evha7JyLT2w0Be9AEgd/Iy789HW+zqklkDnfv
 wIfMqwOPHoCjGQvzXwgPHLn8PDRPx2SnRjM96qZ/d74p/9ugYgbKpN8r0hDUvk4nt+7XBr9Eh
 Y6XNsObpNcJpYMJldOGQ9qkR5do6aEqzxJ7YsrRCjownBu3x0U7cjF8xAUTcdmbEPPkja94is
 k7S7r6+B05gyP1BL8mmm8+6NhwgUPdtT3d4TdQpCi5WYLY5yDHmfLCO/YNYyHqvyQ6j4Laz6g
 0CunsT8KjR8ULr+P8qNY7iHlxtyb1EX9svBYpT/8e42PbhXecdQabYxlG4R+TWpeVs1IXc4wZ
 VGjJM7FZsvLnguM7ZZSHWEhIuTBfIrt7c7HeFRPRGClZ+6YxkKjl9zxNlAo/ijjR71hZjNSjP
 BbFb0FfMDuG8inax0W6m7S8UAn4GJ57mFyUkvuRc1JK2DM5DRyPm7tnTmLFdZDFAcMQLuOWI+
 kXB7kZp6ameNS/w1YMJ4zEzQW6025RgcVnekynqZE8jwkzgEOiNeQ8YcGVshdHYUwfxuYVAoe
 312MntazkTj3FxD0YhgPpUg5GdjLKnGNfEHr4BDOghh7JIkz4kbLeN8mnCJNCgRTlzdwiW/I0
 FvD6x3bzo3I+JLMqyFRo2mrzwjNS2LlbocmjArtBguCgI+EbcTY9CmiPj3M3tVikHEJyC0vQU
 wGq+SHAb9fMtJ8bgJZzg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_005333_654863_ACDCCD14 
X-CRM114-Status: GOOD (  17.02  )
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

On Thu, Jul 21, 2022 at 11:58 PM Stafford Horne <shorne@gmail.com> wrote:
> On Thu, Jul 21, 2022 at 12:37:33PM -0500, Bjorn Helgaas wrote:

>
> Thanks, you are right, I think some of the earlier functions may have needed it,
> which is why I had it earlier.  But now that we have removed those we should be
> able to remove this.
>
> That said, I think some of the architecture includes could also be removed.  On
> OpenRISC we are able to get away with only having the global asm-generic/pci.h
> so we don't need a wrapper pci.h header at all.
>
> However, I don't have everything setup to build all of those architectures so I
> was being a bit conservative to remove headers.  I'll see what I can do in the
> next version.

No need to worry about linux/types.h, this is pretty much included everywhere
already and neither the risk of extraneous includes or missing ones is
something to worry about. I'd just remove it if you do another respin, or
we can leave it in if Bjorn wants to just apply the v5 version.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
