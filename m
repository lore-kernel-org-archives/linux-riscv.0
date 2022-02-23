Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AD5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxJxjQVgYBSqg9zRY1j6mlKXPbxiYISkNhmTbEDrUmI=; b=gGNsqwV3iYUYsC
	D0D5TfWEO94XTbyHLtu+55w1/FtFuqPRO7exlYpwYXUNCm3mqu+06mTneIrAhTLen9wWB+kasGOwp
	dQ1nXzzN4RfFs2R4nehsl9XoHBiu7PxOA9kb3hMzKX3rgzbMQnfOjQc+ayQ/iwXnYECmlypd1nMES
	GKfCw9oz2qoR6yCgeZ2OPhGALE8n5ha6l3LMzRxR1YcuJQEwPF9hDRGT0TmFWNRpGD3ad4aA/Ejdo
	UqixexowOH31w/aFezuVK30ZR5PVbYeqI1cLjJaMl6aOpXMz9tXqLf1uTryRHlWoksei8zcaofKCX
	c2iDLzjwyQQRsfPHS1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMxtJ-00FyF5-Sh; Wed, 23 Feb 2022 20:05:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMxtH-00FyE4-6F
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 20:05:37 +0000
Received: by mail-ed1-x52b.google.com with SMTP id m3so39980914eda.10
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+S6BFzj6o5ckty5iXSThNrfkPsdFE94/fVb8NP4+aFs=;
 b=F/2f/aEUKxSuzDdCknAbug+t8clrlE0v7gj9NkhphhHftuFg6XGIjvpJXVx+ZHKhn9
 jOIdz4l7lK+/F1JhXkxR/PARyehOhzu1/S93ijWQKe7fGKOKTiRs9R81aIq3OYNVOgnf
 G4UcKLBEtMgH8cssPIzV42vV3R64/Z0YRVhdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+S6BFzj6o5ckty5iXSThNrfkPsdFE94/fVb8NP4+aFs=;
 b=Tji7cEzv/NNvIud/8w4OKsSayaS2nspW4r3kwyllcpjdtus1A/aHffbV36NkZlDLPU
 XC2V5woiq80sGqFLOUvfA4vLGlRqeAf8VQjp8C1MaWpyUpaJQhUJkCKMuRSYVgFAUPrJ
 nI+W4b5UYWRiIMnohFVg1xl11cpNLpqLV6jnfO45T2i+nfACKXwYPdcrV7SacYyZJyNi
 EzsykmpP94oQBs+XdW8sSpRfkhLqsBZLCfSpJjKcI/jjI86gKUdvjXr8Sb+2GeWjzW48
 hadrrV4pC1fYzPoatHr+n+LBVJ4eEy9gixL7SWwLqwIghzolABR/eu97YY0lp7gOZMd5
 fAcQ==
X-Gm-Message-State: AOAM533ni2Q6DeqVSdG0AGzg99qDJQ00ZWA09vqHLawdwstWvI91GXsH
 3fK9sgXlRviobAaCYFrD8O5M2fF8k+Xam0huyHc=
X-Google-Smtp-Source: ABdhPJyeXnRgiLFGpwrLkIloeKq678RGnZvfpnGhPU5PxdOihUF5nKPseqixBsBny2GBF1Ou3XdtQg==
X-Received: by 2002:a05:6402:90b:b0:412:a7cc:f5f9 with SMTP id
 g11-20020a056402090b00b00412a7ccf5f9mr1046280edz.136.1645646733051; 
 Wed, 23 Feb 2022 12:05:33 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id l2sm325892eds.28.2022.02.23.12.05.30
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:05:31 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id d3so25798456wrf.1
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 12:05:30 -0800 (PST)
X-Received: by 2002:a05:6512:130b:b0:443:c2eb:399d with SMTP id
 x11-20020a056512130b00b00443c2eb399dmr822016lfu.27.1645646720244; Wed, 23 Feb
 2022 12:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
In-Reply-To: <20220221132456.GA7139@alpha.franken.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Feb 2022 12:05:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjdHz6OU3M9T5zE9Fc9SNdDs52iOE+eVn-wuUT6UDpBLg@mail.gmail.com>
Message-ID: <CAHk-=wjdHz6OU3M9T5zE9Fc9SNdDs52iOE+eVn-wuUT6UDpBLg@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Al Viro <viro@zeniv.linux.org.uk>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@codeaurora.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, 
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org, 
 linux-hexagon <linux-hexagon@vger.kernel.org>, linux-ia64@vger.kernel.org, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 linux-parisc <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-sparc <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_120535_240994_B455E27A 
X-CRM114-Status: GOOD (  19.39  )
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

On Mon, Feb 21, 2022 at 5:25 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> With this patch
[ .. snip snip ..]
> I at least get my simple test cases fixed, but I'm not sure this is
> correct.

I think you really want to do that anyway, just to get things like
wild kernel pointers right (ie think get_kernel_nofault() and friends
for ftrace etc).

They shouldn't happen in any normal situation, but those kinds of
unverified pointers is why we _have_ get_kernel_nofault() in the first
place.

On x86-64, the roughly equivalent situation is that addresses that
aren't in canonical format do not take a #PF (page fault), they take a
#GP (general protection) fault.

So I think you want to do that fixup_exception() for any possible addresses.

> Is there a reason to not also #define TASK_SIZE_MAX   __UA_LIMIT like
> for the 32bit case ?

I would suggest against using a non-constant TASK_SIZE_MAX. Being
constant is literally one reason why it exists, when TASK_SIZE itself
has often been about other things (ie "32-bit process").

Having to load variables for things like get_user() is annoying, if
you could do it with a simple constant instead (where that "simple"
part is to avoid having to load big values from a constant pool -
often constants like "high bit set" can be loaded and compared against
more efficiently).

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
