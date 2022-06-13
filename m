Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E845C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 01:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BlxSlBZungH/9D15X6tvyI88ohSHD3CEK+naKIYcdA=; b=2BKYvh+muVoY6j
	eNSSHKPWGGIZCf5ZQZUaFImnfTlC5dNI5xoypC8kr5W1LIreCTgQGHBtnpian8u/EqeoNWQD951vy
	uxRW7XahgBW9N4bi+hE69uSR/DmnX2kFYePpr/yKEuRxJlSYmN3SoFOXprxbvgnaR+vyuJUp7ADJ6
	+OB0cQMUjaTTCEgcbL93p6pqKqfctVar5ozDrVQC+R5kV1mRBXBmZxDNBHDccGVV85Z3TGbd5koeS
	HoziesQlI6yMHK2xhF3bd3RPYwpUmeBjhLQgvbA/Omgahl7y0LohxEtdUuuG+na7C88rOgLNZXcpS
	8IN27eNgflynEL659CcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0Ygh-000imS-EA; Mon, 13 Jun 2022 01:16:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0YgW-000iit-1U; Mon, 13 Jun 2022 01:16:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B71F0B80D22;
	Mon, 13 Jun 2022 01:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681F3C341C0;
	Mon, 13 Jun 2022 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655082960;
	bh=T/oPYXJvfTUUTAn3CsqoozPh9/pXSGnZmlhYNE8gbWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PxWK/9l6TdsQa77yV2AJPnGPvbYWhjRLP+wFfrNAXLjgtstoiHZXCMoo8B2IqcL7y
	 rJYzFIT+mHg3ZKrHvaheUxROxBUNvqFs2qlykv4MpcQSZOCcE5InVYzVY9gAedqrzl
	 FnuwwSzIfvkZHuyrFJ7SxGf5qezL+KsNEXhVx5VKfPjeumd7apyl49oYKlxtRU1zpg
	 GDBh5Hgh8YUFAxR7RJZPuea54fZ5P93OWebgMT4J8xA0g1zF/FoCx8KzlVZ5id19aY
	 dSaS71/WhW/0o+WHBrRP1zFeukLpZRbthXoRShYwKaOPOzZU843Ve5m0UWJoV8qtRs
	 VsQDIkfPoli1Q==
Received: by mail-ua1-f47.google.com with SMTP id 63so1644077uaw.10;
        Sun, 12 Jun 2022 18:16:00 -0700 (PDT)
X-Gm-Message-State: AOAM532Gz7pF4pwdPnF9SR3/1HuKR+71MU835JAKKd0q4RY4+F/Qi4aF
	u89cSj2DcRB9XJ3iKL2zGEvUKjdzemGcFx1YRKo=
X-Google-Smtp-Source: ABdhPJy022BVkvpX4bwvrgAxTSG7Jz6gfQIdan6W4shKCc4lN35Y4ktHFEjUhhT0WI19MsTm4e13W+ximSNeINXMAlQ=
X-Received: by 2002:ab0:3459:0:b0:378:ec81:4a8b with SMTP id
 a25-20020ab03459000000b00378ec814a8bmr14374212uaq.83.1655082959409; Sun, 12
 Jun 2022 18:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220405071314.3225832-1-guoren@kernel.org> <20220405071314.3225832-3-guoren@kernel.org>
 <20220608094108.GA18122@asgard.redhat.com>
In-Reply-To: <20220608094108.GA18122@asgard.redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Jun 2022 09:15:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQhFbN3mK0jco=NAKZr4qCgvX4zkw3h6jdffr66Rz7REQ@mail.gmail.com>
Message-ID: <CAJF2gTQhFbN3mK0jco=NAKZr4qCgvX4zkw3h6jdffr66Rz7REQ@mail.gmail.com>
Subject: Re: [PATCH V12 02/20] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64
 in fcntl.h
To: Eugene Syromiatnikov <esyr@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Parisc List <linux-parisc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	ldv@strace.io
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_181604_410224_9CFFB53C 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Jun 8, 2022 at 5:41 PM Eugene Syromiatnikov <esyr@redhat.com> wrote:
>
> On Tue, Apr 05, 2022 at 03:12:56PM +0800, guoren@kernel.org wrote:
> > From: Christoph Hellwig <hch@lst.de>
> >
> > Note that before this change they were never visible to userspace due
> > to the fact that CONFIG_64BIT is only set for kernel builds.
>
> > -#ifndef CONFIG_64BIT
> > +#if __BITS_PER_LONG == 32 || defined(__KERNEL__)
>
> Actually, it's quite the opposite: "ifndef" usage made it vailable at all times
> to the userspace, and this change has actually broken building strace
> with the latest kernel headers[1][2].  There could be some debate
> whether having these F_*64 definitions exposed to the user space 64-bit
> applications, but it seems that were no harm (as they were exposed already
> for quite some time), and they are useful at least for strace for compat
> application tracing purposes.
>
> [1] https://github.com/strace/strace/runs/6779763146?check_suite_focus=true#step:4:3222
> [2] https://pipelines.actions.githubusercontent.com/serviceHosts/e5309ebd-8a2f-43f4-a212-b52080275b5d/_apis/pipelines/1/runs/1473/signedlogcontent/12?urlExpires=2022-06-08T09%3A37%3A13.9248496Z&urlSigningMethod=HMACV1&urlSignature=fIT7vd0O4NNRwzwKWLXY4UVZBIIF3XiVI9skAsGvV0I%3D
>
Yes, there is no CONFIG_64BIT in userspace, we shouldn't limit it with
(__BITS_PER_LONG == 32 || defined(__KERNEL__)) to break the
compatibility. Just export F_*64 definitions permanently.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
