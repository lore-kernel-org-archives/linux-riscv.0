Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CCBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 23:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A971761350
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 23:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A971761350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w6XurrgaDpFrLJVtymaa0l8ItMezyzUTV+paZM643g=; b=Lygwytgx7umv4Y
	sWdXMqWjiL8d+L2gSfuwA3GNb4yE+62UYB1arGgNpgzezzkW66mcykX5w+Bpf4zUeaHntH95/xeXN
	hPEoruoa8M3agaWFXG9ugk8a6ZJ1Ga7tR3IU5/xDPD02OKzvGO2aevqADbi+gn9VUibHmsrS3yKsm
	gpD3CHkOQ4inZC87v4wZaMlAjdlJAvO4mXSt9aHJGJpL1EhObe2psy0yhicDKsOqAobQ8147RGvej
	4SYQQPUrAH80kmYeLaNLX9KThrrl1+YBABE242qeN+ErEfRz8C9Bzl4knoFAXWSXkMULEhKpeuH4l
	yKQKLqCbSKQ6LrT+WMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mViib-00CZow-5H; Wed, 29 Sep 2021 23:10:29 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mViiZ-00CZnx-3i
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 23:10:28 +0000
Received: by mail-pg1-x52b.google.com with SMTP id g184so4293103pgc.6
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 16:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aI/ouOII6CJjBOkddynqFqEUpoEDYOKQCNZi7fDl2EE=;
 b=VSQ018jC6qTgHIau1QRTnTodwijVCmralRN9fgDiBIeacF49JRsX9nwdaRGov2W45Z
 Wy+M5+L4KO+HmwabrN4YtS8Cl9AyP2CMw+UiJRSYwHlncurAgHBGnkAiyjiSOeVQBWSa
 ikc6wX7yBW/i3FUnCULlToPllc9632H2aOQSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aI/ouOII6CJjBOkddynqFqEUpoEDYOKQCNZi7fDl2EE=;
 b=NUaF7cBObK6Ket/MmJjo8vxPgueTpEwOhvDUmnhxZeus9OUSAan+7KYa4Ix9qlMN5o
 ZTC2gXDkSsS6P/QdECSRvnMYlm7Sb9vRZ+Wj1nNQcVs1CQV8McalndZaoi9KnmELB8DT
 zqxtKZHY7mJbfemmPBSzrTspca9b8mXnBbGhUpAJk7J7FXoOdvv3IpniS7ntx+G0pGot
 5MgFB8hcinKBLdme0ksPD2XxAH84Mu+LFqpSv75SHVqxGJBxKxqhhL2d4EgnQhKhHBjo
 5d368qhzu+B/Na0LkijYRw71ESgnGSEhY8gnRZoURL4Mgd+L9CRxsu7+upmkYv1VJT15
 VnYw==
X-Gm-Message-State: AOAM530PVZB3w7xuG967MSAV+X8EobkTc1YHbNfJZv41GuzKbFUXoSKE
 gHKE0vuWhrLIvzSVMyMP1K/ivg==
X-Google-Smtp-Source: ABdhPJzdhyqm0dfgODuwIED6/X8gNqLcW4VX+6LUmwnQa2guV3xeth3+9Or0kqN52antddtK95SaVQ==
X-Received: by 2002:a65:6389:: with SMTP id h9mr2112359pgv.83.1632957025919;
 Wed, 29 Sep 2021 16:10:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f16sm602774pjj.56.2021.09.29.16.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 16:10:25 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:10:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:S390" <linux-s390@vger.kernel.org>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
Message-ID: <202109291609.BC02B39AFF@keescook>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au>
 <87pmst1rn9.fsf@mpe.ellerman.id.au>
 <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
 <878rzf0zmb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878rzf0zmb.fsf@mpe.ellerman.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_161027_206529_E92D87CE 
X-CRM114-Status: GOOD (  29.90  )
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

On Thu, Sep 30, 2021 at 08:46:04AM +1000, Michael Ellerman wrote:
> Ard Biesheuvel <ardb@kernel.org> writes:
> > On Tue, 28 Sept 2021 at 02:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>
> >> Michael Ellerman <mpe@ellerman.id.au> writes:
> >> > Ard Biesheuvel <ardb@kernel.org> writes:
> >> >> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
> >> >>>
> >> >>> The CPU field will be moved back into thread_info even when
> >> >>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
> >> >>> of struct thread_info.
> >> >>>
> >> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >> >>
> >> >> Michael,
> >> >>
> >> >> Do you have any objections or issues with this patch or the subsequent
> >> >> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
> >> >> that he was happy with it.
> >> >
> >> > No objections, it looks good to me, thanks for cleaning up that horror :)
> >> >
> >> > It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
> >> > git tree with the dependencies I'd be happy to run some tests over it.
> >>
> >> Actually I realised I can just drop the last patch.
> >>
> >> So that looks fine, passes my standard quick build & boot on qemu tests,
> >> and builds with/without stack protector enabled.
> >>
> >
> > Thanks.
> >
> > Do you have any opinion on how this series should be merged? Kees Cook
> > is willing to take them via his cross-arch tree, or you could carry
> > them if you prefer. Taking it via multiple trees at the same time is
> > going to be tricky, or take two cycles, with I'd prefer to avoid.
> 
> I don't really mind. If Kees is happy to take it then that's OK by me.
> 
> If Kees put the series in a topic branch based off rc2 then I could
> merge that, and avoid any conflicts.

If that helps, yeah, I can make a separate stable branch. Thanks!

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
