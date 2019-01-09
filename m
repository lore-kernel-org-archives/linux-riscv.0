Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA39C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 15:16:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56545206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 15:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n499UrvH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="CcynShqy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56545206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBQz0elq+ZcqD1gJmqpTwdg5FfctuuIsaEHx+XLSHfM=; b=n499UrvHrQiLOA
	3CYyEfFH6o1Y7iH50s3ubN/9GrH4M0po32s2eAD++YwT1Rq6cxM3SXG/VL/6Ae9JIc7bRBZhSEw+1
	hCAaFGvvW/M45YF+k5em5W3r7dlCw3WHD0YXGSihPjc2w1jZ4tejPa+vqCa9AfFgcnOTqMrXhoKBS
	Fy/5veVB//1iGB3AEnV93bDRPMvkdhcdz7kjeX1FmlF0vpfQgoUm4JfO44V777V8s2TmZiG87G2rT
	Ho/0oKyjKl9aRSEZcORwfkEqSV1Egr4CgciTPMbnCnhOCyfq+qtf5ttN0ntpC4u5hbHNPmaqoWMtq
	92XlcP3puIMuHnqWkxBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghFb1-0007ZC-3S; Wed, 09 Jan 2019 15:16:43 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghFax-0007Yi-Au
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 15:16:41 +0000
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x09FGHVH032053
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jan 2019 00:16:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x09FGHVH032053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1547046978;
 bh=CMBcGzQwmWu36K540QIdLA4arIn9ojOmjuSY185U9iU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CcynShqyfBbcXvGHzR1MyIU/c//1TLk71mFq2JONBRu7riNX/kwmQVV4n/eE5aoao
 HIHPyaUz6KSwQPHs/GWqibqlYy3lv3rX0BDqXcz+ebbXmegQ6E763JsZF7QUM5JfHF
 xgcVCWrr15slJuL5HBq8oQ9RWRg7vm4YTOR0dFVYcerKpwAqbSPcoeWNwTr8ObMYyv
 MfzT+nruVRbG8POcz6b0Th8s3om2yC8ohcfBzRBvcDbNbLp9I/4rG3m0sBy2mEOAVJ
 xRm+hizmZHAN/++pRAW2o8Ck7+N28LGaTcMwWqZkMYdSU9liKGJFzr+BfL1+coPVy0
 ZgDpnLRncAa6Q==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id z3so4950228vsf.7
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jan 2019 07:16:17 -0800 (PST)
X-Gm-Message-State: AJcUukfmZ3EfXiuQ33DBC1ShXevPGBVnUVgZhSH+ZcvAFw3pNaWlli2g
 7e8f5dgooHLQVfK1+C+PNJP2yInrmlCmCZiYucQ=
X-Google-Smtp-Source: ALg8bN4AXTo93OV06vwo+E6tmBjBdLLRlv9t97lYLFaYBzUU0gpiKlEg3ryroeqWCdkCOobg6y3htQ9UAA5JO1oTsEo=
X-Received: by 2002:a67:5f03:: with SMTP id t3mr2644042vsb.155.1547046976689; 
 Wed, 09 Jan 2019 07:16:16 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAT+5eOFc64SG2SKCOThVVsz6S2NPBpemdcjCcZX_zds2Q@mail.gmail.com>
 <mhng-aacb9594-f17b-4728-91f7-e2804e6a3dbc@palmer-si-x1c4>
 <mvmd0p5g9ot.fsf@suse.de>
In-Reply-To: <mvmd0p5g9ot.fsf@suse.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 10 Jan 2019 00:15:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWOPhAJ1_xRj5A5mgEFp-V2rVtRu7ZDGEJwTE4iVAK0w@mail.gmail.com>
Message-ID: <CAK7LNASWOPhAJ1_xRj5A5mgEFp-V2rVtRu7ZDGEJwTE4iVAK0w@mail.gmail.com>
Subject: Re: [PATCH] riscv: remove redundant kernel-space generic-y
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_071639_704612_E417F289 
X-CRM114-Status: GOOD (  16.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, alankao@andestech.com,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Deepa Dinamani <deepa.kernel@gmail.com>, linux-riscv@lists.infradead.org,
 Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 12:01 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jan 08 2019, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> > On Fri, 04 Jan 2019 07:03:20 PST (-0800), yamada.masahiro@socionext.com wrote:
> >> On Fri, Jan 4, 2019 at 11:16 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>>
> >>> On Sun, 16 Dec 2018 06:11:11 PST (-0800), yamada.masahiro@socionext.com wrote:
> >>> > This commit removes redundant generic-y defines in
> >>> > arch/riscv/include/asm/Kbuild.
> >>> >
> >>> > [1] It is redundant to define the same generic-y in both
> >>> >     arch/$(ARCH)/include/asm/Kbuild and
> >>> >     arch/$(ARCH)/include/uapi/asm/Kbuild.
> >>> >
> >>> >     Remove the following generic-y:
> >>> >
> >>> >       errno.h
> >>> >       fcntl.h
> >>> >       ioctl.h
> >>> >       ioctls.h
> >>> >       ipcbuf.h
> >>> >       mman.h
> >>> >       msgbuf.h
> >>> >       param.h
> >>> >       poll.h
> >>> >       posix_types.h
> >>> >       resource.h
> >>> >       sembuf.h
> >>> >       setup.h
> >>> >       shmbuf.h
> >>> >       signal.h
> >>> >       socket.h
> >>> >       sockios.h
> >>> >       stat.h
> >>> >       statfs.h
> >>> >       swab.h
> >>> >       termbits.h
> >>> >       termios.h
> >>> >       types.h
> >>> >
> >>> > [2] It is redundant to define generic-y when arch-specific
> >>> >     implementation exists in arch/$(ARCH)/include/asm/*.h
> >>> >
> >>> >     Remove the following generic-y:
> >>> >
> >>> >       cacheflush.h
> >>> >       dma-mapping.h
> >>> >       module.h
> >>> >
> >>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>> > ---
> >>> >
> >>> >  arch/riscv/include/asm/Kbuild | 26 --------------------------
> >>> >  1 file changed, 26 deletions(-)
> >>> >
> >>> > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> >>> > index 6a646d9..f7068f3 100644
> >>> > --- a/arch/riscv/include/asm/Kbuild
> >>> > +++ b/arch/riscv/include/asm/Kbuild
> >>> > @@ -1,5 +1,4 @@
> >>> >  generic-y += bugs.h
> >>> > -generic-y += cacheflush.h
> >>> >  generic-y += checksum.h
> >>> >  generic-y += compat.h
> >>> >  generic-y += cputime.h
> >>> > @@ -7,18 +6,12 @@ generic-y += device.h
> >>> >  generic-y += div64.h
> >>> >  generic-y += dma.h
> >>> >  generic-y += dma-contiguous.h
> >>> > -generic-y += dma-mapping.h
> >>> >  generic-y += emergency-restart.h
> >>> > -generic-y += errno.h
> >>> >  generic-y += exec.h
> >>> >  generic-y += fb.h
> >>> > -generic-y += fcntl.h
> >>> >  generic-y += hardirq.h
> >>> >  generic-y += hash.h
> >>> >  generic-y += hw_irq.h
> >>> > -generic-y += ioctl.h
> >>> > -generic-y += ioctls.h
> >>> > -generic-y += ipcbuf.h
> >>> >  generic-y += irq_regs.h
> >>> >  generic-y += irq_work.h
> >>> >  generic-y += kdebug.h
> >>> > @@ -27,34 +20,15 @@ generic-y += kvm_para.h
> >>> >  generic-y += local.h
> >>> >  generic-y += local64.h
> >>> >  generic-y += mm-arch-hooks.h
> >>> > -generic-y += mman.h
> >>> > -generic-y += module.h
> >>> > -generic-y += msgbuf.h
> >>> >  generic-y += mutex.h
> >>> > -generic-y += param.h
> >>> >  generic-y += percpu.h
> >>> > -generic-y += poll.h
> >>> > -generic-y += posix_types.h
> >>> >  generic-y += preempt.h
> >>> > -generic-y += resource.h
> >>> >  generic-y += scatterlist.h
> >>> >  generic-y += sections.h
> >>> > -generic-y += sembuf.h
> >>> >  generic-y += serial.h
> >>> > -generic-y += setup.h
> >>> > -generic-y += shmbuf.h
> >>> >  generic-y += shmparam.h
> >>> > -generic-y += signal.h
> >>> > -generic-y += socket.h
> >>> > -generic-y += sockios.h
> >>> > -generic-y += stat.h
> >>> > -generic-y += statfs.h
> >>> > -generic-y += swab.h
> >>> > -generic-y += termbits.h
> >>> > -generic-y += termios.h
> >>> >  generic-y += topology.h
> >>> >  generic-y += trace_clock.h
> >>> > -generic-y += types.h
> >>> >  generic-y += unaligned.h
> >>> >  generic-y += user.h
> >>> >  generic-y += vga.h
> >>>
> >>> Thanks.  These just sort of collected there because I hadn't trimmed them.  Is
> >>> there a script that checks these?
> >>
> >>
> >> No script is available for now, but
> >> I'd like to turn on warnings to catch some cases:
> >> https://patchwork.kernel.org/patch/10746823/
> >>
> >>
> >> BTW, can I apply this to my tree
> >> along with other cleanups?
> >
> > Acked-by: Palmer Dabbelt <palmer@sifive.com>
>
> arch/riscv/include/asm/dma-mapping.h no longer exists.
>
> In file included from ./include/linux/skbuff.h:34,
>                  from ./include/net/net_namespace.h:36,
>                  from ./include/linux/inet.h:46,
>                  from ./include/linux/sunrpc/msg_prot.h:204,
>                  from ./include/linux/sunrpc/auth.h:16,
>                  from ./include/linux/nfs_fs.h:31,
>                  from init/do_mounts.c:22:
> ./include/linux/dma-mapping.h:261:10: fatal error: asm/dma-mapping.h: No such file or directory
>  #include <asm/dma-mapping.h>
>           ^~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.build:277: init/do_mounts.o] Error 1


Looks like you tested v1,
which I sent before c5cd037d1c8044fbd131c57822a67a1576eb16e9 was applied.


I picked up v2:
https://patchwork.kernel.org/patch/10746819/

Now, it is already in Linus tree.
8c4fa8b8d48326353afaf6934edd5f1cc49ee90b




--
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
