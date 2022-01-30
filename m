Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB085C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPn+hYOyM/Jfgk8eqUmpc/HPmqCwGLojQLtKvI2Bqak=; b=O1XLUdqM8oIlY1
	FPPqPks/5EDQWHOITnvMfYcqHtWUItbbpCZSNgl+MxWlA8d24E8i2ckotUYlV0f9HYm6qg+nSnAtn
	jlSxUdZ38+1B3CkUfEubU0cXzh7C9QbWJy9mE45V8p1RInyazZSdrp+j5Hj/9ZV6LXFwnwlzUXXwh
	vlKaLdDP8ggPfpTBZ0vIX33fdnC7eUps5nbfBesY7a7//njCde3ekz4m88C89pnT148VRHpmIrVMF
	P4Oun1/4wF7Z1AGSP/M4Vx1WggSSS1Itosg2a/BsudAB9ls4qY1ZyKeRkCkah0qoQ2esbvCSMsD+q
	vwmEsJPdfh7IfteVvlwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBhN-006nwW-Ox; Sun, 30 Jan 2022 15:01:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBds-006mCk-Le; Sun, 30 Jan 2022 14:57:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9BD0B8294B;
 Sun, 30 Jan 2022 14:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99649C340EB;
 Sun, 30 Jan 2022 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643554641;
 bh=JxoHCxPtVM6TBwNWYVTkv4xgv4xXqSSrocAD8RhKPvQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kos3V8Vk5hA0UEtlbCmKfvDbCn6hgvFJPW0hutP471S22DT8zQZjqZYl8oPtPERRN
 mHTKJGaAu0B69fJNmAFmItV05nnqnnpRKb/kYsBaVswrhiA3ecXak702UJ1xD+aRyO
 Cyu417cH+tx6RjZLY1F4C0+gldC8KeEtNsbWOyaylils+pWq32+O/qNqqF6K8vS+Qa
 DU2SBhQ6eWn63e/dlaU9XUJXP5eg51s3F1n6055BcvsAgOgE2YRIXu5gQZ14MzwtZF
 RJhpqwiYSrbL56M0Y1luR1ep1hIfdzFS7gAvAKX1Hfe2YnV2vSbhGb9SEapKZC8pBf
 gYvL1GNaKIrpg==
Received: by mail-vk1-f181.google.com with SMTP id z15so6752429vkp.13;
 Sun, 30 Jan 2022 06:57:21 -0800 (PST)
X-Gm-Message-State: AOAM530/Ln46Og5n2dxCeaeD1pbLz73sO5RcH20RzSwOEhGnpPrRSj05
 x9WVO7PcEM+KNtaMygfNUMEo1USwoeCpoDIsFBE=
X-Google-Smtp-Source: ABdhPJwXaD5cftVV1gTUpOLnxRw19SJ6xh2ZrT8jBGfIh39KXnRkloqQEHlrygYgN8HHE2HZ4UXsJQOHGX4lm9oymh8=
X-Received: by 2002:a05:6122:1c5:: with SMTP id h5mr6907805vko.2.1643554640709; 
 Sun, 30 Jan 2022 06:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
 <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
 <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
 <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
In-Reply-To: <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 22:57:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSULHYYvAjfDvHiD-rJFsOy0-x58AKcD2upzpxaVf5sZQ@mail.gmail.com>
Message-ID: <CAJF2gTSULHYYvAjfDvHiD-rJFsOy0-x58AKcD2upzpxaVf5sZQ@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065725_019917_F05D421B 
X-CRM114-Status: GOOD (  20.13  )
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

On Sun, Jan 30, 2022 at 7:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Jan 30, 2022 at 6:54 AM Guo Ren <guoren@kernel.org> wrote:
> > On Sun, Jan 30, 2022 at 6:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > I would make these endian-specific, and reverse them on big-endian
> > > architectures. That way it
> > > should be possible to share them across all compat architectures
> > > without needing the override
> > > option.
> > I hope it could be another patch. Because it's not clear to
> > _LITTLE_ENDIAN definition in archs.
> >
> > eg: Names could be __ORDER_LITTLE_ENDIAN__ CPU_LITTLE_ENDIAN
> > SYS_SUPPORTS_LITTLE_ENDIAN __LITTLE_ENDIAN
> >
> > riscv is little-endian, but no any LITTLE_ENDIAN definition.
> >
> > So let's keep them in the patch, first, Thx
>
> The correct way to do it is to check for CONFIG_CPU_BIG_ENDIAN,
> which works on all architectures. Since nothing else selects the
> __ARCH_WANT_COMPAT_* symbols, there is also no risk for
> regressions, so just use this and leave the #ifndef compat_arg_u64
> check in place.
Okay, got it.

>
>       Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
