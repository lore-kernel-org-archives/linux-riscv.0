Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E78C001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1Hy/TwznsPU7Ea7FyQImgMB16efTbMS+lknf+dCgXY=; b=Z4goHtHZrTwc3R
	MpuDSCHLfmlbQSGF7DJG/PozKuE88hFOV2ep/g4U4Fm9PdOjfOADhmHc/0GbJlpGtROJhHZRAWCNc
	HVi1okDDQVrGNEZkiFsT1PfSZfWMxWjyNT8TgrJhTDdV7m/3clFSh5aJSIFQ9ixccskrKsOqOEWPp
	s/lbzt7sbxAVExCqAYz0M+ZTFjPQZS3OQLPK9ZRr/lps3toQq1yL51p/D9UAuxlNVx6zkloJbJR8L
	Cj3okemSB63GC2ARGisz5UdSgiATsleJOtkZc3B3dKK6VYAhXdovg+XE6jonjlroSnTgQhGDzID5C
	9qjTlDqXF6rsAy9Os7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8fJ-000dIU-0w;
	Thu, 27 Jul 2023 21:36:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8fF-000dHi-0h;
	Thu, 27 Jul 2023 21:36:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5B0861EBB;
	Thu, 27 Jul 2023 21:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D72AC433C8;
	Thu, 27 Jul 2023 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690493811;
	bh=duAwVmFYmsUINs8hFVbW/zohvuZX6TUh3Gnxn1i9JaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VnkrMICyDKHI52bpNsVeWb1AIXCLlOc90Zm+WJzG7JhU/D/eh32guTyhJs9VbOXeY
	 VLunSyQzAZmzTpbjTD0/0bwVy6AP11F0L45gerinT+7xNzw+bUWgc1NJDEOd0uEw7k
	 0oizeR8ID0C2ayjOTINy9zIDUAhG5c3tNnJg2rSvPeFBObmg5Lisx+nvXBwG4+Xl67
	 qM9qBKsNHyW1L5vzqBQ1hNJg2A3IUp0YOwTv0VvVK+IsuC1joDQwV/a5XSzbXqGwPQ
	 WEEaOEhQLooEPvMJ6QS2mIGeMoxc3tmMofUdWTZQq7jpKKXznadVu7vzJ5i57P+phO
	 A0wy5jcHn6vKQ==
Date: Thu, 27 Jul 2023 14:36:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 1/2] asm-generic: Unify uapi bitsperlong.h for arm64,
 riscv and loongarch
Message-ID: <20230727213648.GA354736@dev-arch.thelio-3990X>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
 <1687443219-11946-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1687443219-11946-2-git-send-email-yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_143653_363915_0388BCB0 
X-CRM114-Status: GOOD (  19.51  )
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

Hi Tiezhu and Arnd,

On Thu, Jun 22, 2023 at 10:13:38PM +0800, Tiezhu Yang wrote:
> Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
> in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
> usable, it is probably fine to unify the definition of __BITS_PER_LONG as
> (__CHAR_BIT__ * __SIZEOF_LONG__) in asm-generic uapi bitsperlong.h.
> 
> In order to keep safe and avoid regression, only unify uapi bitsperlong.h
> for some archs such as arm64, riscv and loongarch which are using newer
> toolchains that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
> 
> Suggested-by: Xi Ruoyao <xry111@xry111.site>
> Link: https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/linux-arch/a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com/
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/arm64/include/uapi/asm/bitsperlong.h          | 24 ----------------------
>  arch/loongarch/include/uapi/asm/bitsperlong.h      |  9 --------
>  arch/riscv/include/uapi/asm/bitsperlong.h          | 14 -------------
>  include/uapi/asm-generic/bitsperlong.h             | 13 +++++++++++-
>  tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 ----------------------
>  .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
>  tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -------------
>  tools/include/uapi/asm-generic/bitsperlong.h       | 14 ++++++++++++-
>  tools/include/uapi/asm/bitsperlong.h               |  6 ------
>  9 files changed, 25 insertions(+), 102 deletions(-)
>  delete mode 100644 arch/arm64/include/uapi/asm/bitsperlong.h
>  delete mode 100644 arch/loongarch/include/uapi/asm/bitsperlong.h
>  delete mode 100644 arch/riscv/include/uapi/asm/bitsperlong.h
>  delete mode 100644 tools/arch/arm64/include/uapi/asm/bitsperlong.h
>  delete mode 100644 tools/arch/loongarch/include/uapi/asm/bitsperlong.h
>  delete mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

I think this change has backwards compatibility concerns, as it breaks
building certain host tools on the stable releases (at least 6.4 and
6.1, as that is where I noticed this). I see the following error on my
aarch64 system:

  $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- mrproper defconfig prepare
  In file included from /usr/include/asm/bitsperlong.h:1,
                   from /usr/include/asm-generic/int-ll64.h:12,
                   from /usr/include/asm-generic/types.h:7,
                   from /usr/include/asm/types.h:1,
                   from tools/include/linux/types.h:13,
                   from tools/arch/x86/include/asm/orc_types.h:9,
                   from scripts/sorttable.h:96,
                   from scripts/sorttable.c:201:
  tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
     14 | #error Inconsistent word size. Check asm/bitsperlong.h
        |  ^~~~~

A reverse bisect of 6.4 to 6.5-rc1 points to this patch. This Fedora
rawhide container has kernel-headers 6.5.0-0.rc2.git0.1.fc39 and the
error disappears when I downgrade to 6.4.0-0.rc7.git0.1.fc39. I have not
done a ton of triage/debugging so far, as I am currently hunting down
other regressions, but I figured I would get an initial report out,
since I noticed it when validating LLVM from the new release/17.x
branch. If there is any additional information I can provide or patches
I can test, I am more than happy to do so.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
