Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAEFC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xix3jPkTeMEyYH5XQxH89GUiYFlhXNHGn0hXnrDiUNo=; b=ofb+m74iIz7KCF
	WMoLOj711Drp1iizz+xKI4MiLJPoLB1mpFXgUR4k/fNpMUASfqo4B/vkOssoJgFOPjaYFHd+SlFhL
	m7Npnr0bLP5G3mva9KrXW/2RLrQ8+q7/fGVcYNKFxoEwFHUaGIIb8HPrVc72QDEfb9l9yz2XWh7jk
	xbOj/zgcyi48XYKqBvgPbb5lxTUiLG5SLrnhS/kukLQE4RiuymE/Xd72wVZSUzVmzTGHzWebSSo6Q
	vSUnkjFYojhzrkiHoZSHbTjLTl6SrVXiYAmcJlhkurYUwM+xuwEjYgR0vebxAYfvx8DDVRXUmQ6WZ
	MChrirJz4182gdO7D7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRJ2-004HRn-2U;
	Fri, 28 Jul 2023 17:31:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPRIz-004HPs-2s;
	Fri, 28 Jul 2023 17:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E19D86218C;
	Fri, 28 Jul 2023 17:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F788C433C8;
	Fri, 28 Jul 2023 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690565466;
	bh=NXz5tKNsoYH5b9t6PkGaSvdNnq8EVbDx7LLDtyBWDIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEKS+ghKaHqzJ/CeAVUmffgp1syROs6M7poM0tlpzGzihFWzpmfvi2K85PgFarbuo
	 RkBcIe75tLMn7XoYUUPhEjXBxGbvzFW6xn32Qzg/SEPgRlqNJ7ZV00NbZfU5yRRyZa
	 jn3bpdlEYETGcDum4z742lJd6KwcgDw+lIfr6otYHl7RO8ePAuI1taZ3cPwmxE/PwJ
	 wKJJvTonQcslSnqjiqKIy+MtAH0nqvGjUK5Hyzlni78cWnO89ixENQFj5Bae9AcGEH
	 K6Fi4h9QSZCy9nrcmCfp6Y1ClZF8Pg2Q4KYKwIAlrtDzm85paoRya48V4qF09hybvv
	 7Sg5khTe78XFA==
Date: Fri, 28 Jul 2023 10:31:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	Linux-Arch <linux-arch@vger.kernel.org>, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 1/2] asm-generic: Unify uapi bitsperlong.h for arm64,
 riscv and loongarch
Message-ID: <20230728173103.GA1299743@dev-arch.thelio-3990X>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
 <1687443219-11946-2-git-send-email-yangtiezhu@loongson.cn>
 <20230727213648.GA354736@dev-arch.thelio-3990X>
 <1777400a-4d9c-4bdb-9d3b-f8808ef054cc@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1777400a-4d9c-4bdb-9d3b-f8808ef054cc@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_103110_016040_C7996F84 
X-CRM114-Status: GOOD (  37.22  )
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

On Fri, Jul 28, 2023 at 01:00:30PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 27, 2023, at 23:36, Nathan Chancellor wrote:
> > Hi Tiezhu and Arnd,
> >
> > On Thu, Jun 22, 2023 at 10:13:38PM +0800, Tiezhu Yang wrote:
> >> Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
> >> in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
> >> usable, it is probably fine to unify the definition of __BITS_PER_LONG as
> >> (__CHAR_BIT__ * __SIZEOF_LONG__) in asm-generic uapi bitsperlong.h.
> >> 
> >> In order to keep safe and avoid regression, only unify uapi bitsperlong.h
> >> for some archs such as arm64, riscv and loongarch which are using newer
> >> toolchains that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
> >> 
> >> Suggested-by: Xi Ruoyao <xry111@xry111.site>
> >> Link: https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
> >> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> >> Link: https://lore.kernel.org/linux-arch/a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com/
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> 
> >
> > I think this change has backwards compatibility concerns, as it breaks
> > building certain host tools on the stable releases (at least 6.4 and
> > 6.1, as that is where I noticed this). I see the following error on my
> > aarch64 system:
> >
> >   $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- 
> > mrproper defconfig prepare
> >   In file included from /usr/include/asm/bitsperlong.h:1,
> >                    from /usr/include/asm-generic/int-ll64.h:12,
> >                    from /usr/include/asm-generic/types.h:7,
> >                    from /usr/include/asm/types.h:1,
> >                    from tools/include/linux/types.h:13,
> >                    from tools/arch/x86/include/asm/orc_types.h:9,
> >                    from scripts/sorttable.h:96,
> >                    from scripts/sorttable.c:201:
> >   tools/include/asm-generic/bitsperlong.h:14:2: error: #error 
> > Inconsistent word size. Check asm/bitsperlong.h
> >      14 | #error Inconsistent word size. Check asm/bitsperlong.h
> >         |  ^~~~~
> 
> Thanks for the report. I'm still struggling to figure out what
> exactly is going wrong here, and if this is a bug in the patch
> I merged, or an existing bug that now causes a build failure instead
> of some other problem.

Totally understandable, I was really confused at first too.

> > A reverse bisect of 6.4 to 6.5-rc1 points to this patch. This Fedora
> > rawhide container has kernel-headers 6.5.0-0.rc2.git0.1.fc39 and the
> > error disappears when I downgrade to 6.4.0-0.rc7.git0.1.fc39. I have not
> > done a ton of triage/debugging so far, as I am currently hunting down
> > other regressions, but I figured I would get an initial report out,
> > since I noticed it when validating LLVM from the new release/17.x
> > branch. If there is any additional information I can provide or patches
> > I can test, I am more than happy to do so.
> 
> One thing I think is going wrong here is that scripts/sorttable.c is
> meant to run on the host (arm64) but includes the target (x86)
> orc_Types.h header and the kernel-internal asm/bitsperlong.h instead

Right. I will note sorttable is not the only utility that has this
issue, I see the same problem coming from several files in
tools/lib/subcmd when building several different architectures and
arch/x86/entry/vdso/vdso2c.c at the very least.

> of the uapi version. The sanity check in the kernel-side header
> is intended to cross-check the CONFIG_64BIT value against the
> __BITS_PER_LONG constant from the header.
> 
> My first guess would be that this only worked by accident if the headers
> defaulted to "#define __BITS_PER_LONG 32" in and #undef CONFIG_64BIT"
> when include/generated/autoconf.h, but now the __BITS_PER_LONG value
> is actually correct.

That seems like a reasonable theory. I am still busy looking into other
things today but I can try to double back to this on Monday if you don't
make any progress.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
