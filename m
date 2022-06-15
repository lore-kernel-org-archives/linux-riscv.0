Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9152C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTKO/TrH9EMC1GmVaBclugKh8sQsrs2CSNG9DW1KUTc=; b=WqFYGvhqIOm0sf
	rzqXryXC6kTm0zNPuZgT6z7WepKmnGBTlISurqV1weVIzxM4Js75q4co1tXPipO4ijHRCc5YK4ECn
	/vhc7N0Mwm2msPKKDAsRETbDZLp9H72SGxsSjPbrRes39oFWSVaAuSX+ZyLyCyvLunn8S2cyHzGtG
	6XqmdQ8kg2ciAdzGecK0YUslKdhz/I60PVfixWLhY7+wIH6toiV6v/Ozrc2znoWgAthgvM5UCNVlD
	f54vkf5y9PvZ0tMIS15WOsnJRh+hdaU1/6Yoi8kJYojQN+7V3/rkC9EFA3+GmrzUmcMoVwCalsekj
	52SgHfvo2vsft4LKrGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Q4s-00Dkw0-IW; Wed, 15 Jun 2022 10:16:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Q4O-00DkiL-TQ; Wed, 15 Jun 2022 10:16:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5F180B81C62;
	Wed, 15 Jun 2022 10:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1BBC3411C;
	Wed, 15 Jun 2022 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655288174;
	bh=LzuKKmeaKzYyf1F4EGCFzObtFswa551XpejD5PM/0gU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V2e4eedCwuT64uSq8EWZIlqOealrKlJhOjYwUPwzUjmJe3h1gZVozcylD0pHKd3xB
	 Ak6Oc8tweWPYhMTh9H3oadcrNqf+QiU9LPyAX/6yzLb9dednhlxc8YlZ9ce8PuC1Ja
	 NHZaZBVX97va3bcZW8Ev5S8x4pj3H+aSGwSujEXKe2YYokqjbd8o8kqjr+IR6la6s3
	 b+BdazS+sViwet2f8F/vjuwIdaqpG4Joh9L6TTujDPf1UclgVXVsul3UoHplJbGy38
	 U2r67XkRS9chQDQXsUdeJiHunFShBZ/xGbDIlCLcdCYRVMWuiRl/HXRfVkZxuaPp3H
	 f3taqgo3g7DTQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-fe15832ce5so15851101fac.8;
        Wed, 15 Jun 2022 03:16:13 -0700 (PDT)
X-Gm-Message-State: AJIora9F7pi4DWQ4GYH7qE3oq1W9nFQUAsEpj2Tk/b/KKQNR3Z2HfCrs
	1gUHlQ7QYITdlHhGyqgddbz/kvItCkV1r8Zu1HY=
X-Google-Smtp-Source: AGRyM1uN/3D1+5Ut4Xt2mabIT0hR6gzAEW7Im9WVGqBeGn3OnhJh0XIUKAqRs97/yUL1cD2/EM5eYL4/9b9oQIafJWE=
X-Received: by 2002:a05:6871:5c8:b0:f3:3c1c:126f with SMTP id
 v8-20020a05687105c800b000f33c1c126fmr5067969oan.126.1655288162336; Wed, 15
 Jun 2022 03:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220614092156.1972846-1-mawupeng1@huawei.com> <YqmQIpQ8hzxYkMv2@kernel.org>
In-Reply-To: <YqmQIpQ8hzxYkMv2@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 15 Jun 2022 12:15:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGytXz7VZh3xR=Vj-Mo7q+Wu3NUsqU9MFhPStm2=c9khw@mail.gmail.com>
Message-ID: <CAMj1kXGytXz7VZh3xR=Vj-Mo7q+Wu3NUsqU9MFhPStm2=c9khw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] introduce mirrored memory support for arm64
To: Mike Rapoport <rppt@kernel.org>
Cc: Wupeng Ma <mawupeng1@huawei.com>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Kees Cook <keescook@chromium.org>, songmuchun@bytedance.com, 
	Randy Dunlap <rdunlap@infradead.org>, damien.lemoal@opensource.wdc.com, 
	Stephen Boyd <swboyd@chromium.org>, Wei Liu <wei.liu@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Hildenbrand <david@redhat.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, gpiccoli@igalia.com, 
	Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, vijayb@linux.microsoft.com, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_031617_242079_667310B9 
X-CRM114-Status: GOOD (  20.40  )
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

On Wed, 15 Jun 2022 at 09:54, Mike Rapoport <rppt@kernel.org> wrote:
>
> On Tue, Jun 14, 2022 at 05:21:51PM +0800, Wupeng Ma wrote:
> > From: Ma Wupeng <mawupeng1@huawei.com>
> >
> > Patch #1 introduce mirrored memory support form arm64.
> > Patch #2-#4 fix some bugs for arm64 if memory reliable is enabled.
> > Patch #5 disable mirror feature if kernelcore is not specified.
> >
> > Thanks to Ard Biesheuvel's hard work [1], now kernel will perfer mirrored
> > memory if kaslr is enabled.
> >
> > [1] https://lore.kernel.org/linux-arm-kernel/CAMj1kXEPVEzMgOM4+Yj6PxHA-jFuDOAUdDJSiSxy_XaP4P7LSw@mail.gmail.com/T/
> >
> >
> > Ma Wupeng (5):
> >   efi: arm64: Introduce ability to find mirrored memory ranges
> >   mm: Ratelimited mirrored memory related warning messages
> >   mm: Limit warning message in vmemmap_verify() to once
> >   arm64: mm: Only remove nomap flag for initrd
> >   memblock: Disable mirror feature if kernelcore is not specified
> >
> >  arch/arm64/mm/init.c            |  2 +-
> >  arch/x86/include/asm/efi.h      |  4 ----
> >  arch/x86/platform/efi/efi.c     | 23 -----------------------
> >  drivers/firmware/efi/efi-init.c |  1 +
> >  drivers/firmware/efi/efi.c      | 23 +++++++++++++++++++++++
> >  include/linux/efi.h             |  3 +++
> >  mm/internal.h                   |  2 ++
> >  mm/memblock.c                   |  7 +++++--
> >  mm/page_alloc.c                 |  2 +-
> >  mm/sparse-vmemmap.c             |  2 +-
> >  10 files changed, 37 insertions(+), 32 deletions(-)
>
> For the series: Acked-by: Mike Rapoport <rppt@linux.ibm.com>
>


Thanks all, I've queued these up now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
