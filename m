Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616CFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 14:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E65C206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 14:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EmtAh3qn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E65C206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V79eSXhDB9z2cur7yNjWS1HU0sVIOlal74hJ53jsoBY=; b=EmtAh3qnDZseID
	imA2rkfLclHeJ1gMH6DO1vl2muuvc88HW706quaXPu38xedm4r8EIkoU8a/JThrp6K1Rglt1F2Wrg
	pEs7qO12RAnAdjYBN+rBFWEPBnQGMAvqCBzev8uCl0im2foA4R87CMviwDbp/JeoAbrrEcU98X40B
	Y92AePhnFOyuyR4GyzOq6HO4NZgdRO3WxfI/v7qhAeXKPQKV5gGJ2veN3PvCOXND4o36vM6ZdQdrq
	d4JOo+yu6JWnQZYJfFEH91lvXyk0qGXUyIDO62Q4KSW+ZXwsiYzk/EzPMKKUDAxMNdbyp0csf05uq
	Y8uPhGDDcyML9+nd9szA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghFIy-00084X-C7; Wed, 09 Jan 2019 14:58:04 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghFIv-00083m-Hq
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 14:58:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E36F4AE0F;
 Wed,  9 Jan 2019 14:57:57 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] riscv: remove redundant kernel-space generic-y
References: <CAK7LNAT+5eOFc64SG2SKCOThVVsz6S2NPBpemdcjCcZX_zds2Q@mail.gmail.com>
 <mhng-aacb9594-f17b-4728-91f7-e2804e6a3dbc@palmer-si-x1c4>
X-Yow: ...Just enough time to do my LIBERACE impression...
Date: Wed, 09 Jan 2019 15:57:54 +0100
In-Reply-To: <mhng-aacb9594-f17b-4728-91f7-e2804e6a3dbc@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Tue, 08 Jan 2019 12:17:19 -0800 (PST)")
Message-ID: <mvmd0p5g9ot.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_065801_879428_82CEC014 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: aou@eecs.berkeley.edu, alankao@andestech.com, linux-kernel@vger.kernel.org,
 yamada.masahiro@socionext.com, geert@linux-m68k.org, deepa.kernel@gmail.com,
 linux-riscv@lists.infradead.org, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jan 08 2019, Palmer Dabbelt <palmer@sifive.com> wrote:

> On Fri, 04 Jan 2019 07:03:20 PST (-0800), yamada.masahiro@socionext.com wrote:
>> On Fri, Jan 4, 2019 at 11:16 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>>
>>> On Sun, 16 Dec 2018 06:11:11 PST (-0800), yamada.masahiro@socionext.com wrote:
>>> > This commit removes redundant generic-y defines in
>>> > arch/riscv/include/asm/Kbuild.
>>> >
>>> > [1] It is redundant to define the same generic-y in both
>>> >     arch/$(ARCH)/include/asm/Kbuild and
>>> >     arch/$(ARCH)/include/uapi/asm/Kbuild.
>>> >
>>> >     Remove the following generic-y:
>>> >
>>> >       errno.h
>>> >       fcntl.h
>>> >       ioctl.h
>>> >       ioctls.h
>>> >       ipcbuf.h
>>> >       mman.h
>>> >       msgbuf.h
>>> >       param.h
>>> >       poll.h
>>> >       posix_types.h
>>> >       resource.h
>>> >       sembuf.h
>>> >       setup.h
>>> >       shmbuf.h
>>> >       signal.h
>>> >       socket.h
>>> >       sockios.h
>>> >       stat.h
>>> >       statfs.h
>>> >       swab.h
>>> >       termbits.h
>>> >       termios.h
>>> >       types.h
>>> >
>>> > [2] It is redundant to define generic-y when arch-specific
>>> >     implementation exists in arch/$(ARCH)/include/asm/*.h
>>> >
>>> >     Remove the following generic-y:
>>> >
>>> >       cacheflush.h
>>> >       dma-mapping.h
>>> >       module.h
>>> >
>>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> > ---
>>> >
>>> >  arch/riscv/include/asm/Kbuild | 26 --------------------------
>>> >  1 file changed, 26 deletions(-)
>>> >
>>> > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
>>> > index 6a646d9..f7068f3 100644
>>> > --- a/arch/riscv/include/asm/Kbuild
>>> > +++ b/arch/riscv/include/asm/Kbuild
>>> > @@ -1,5 +1,4 @@
>>> >  generic-y += bugs.h
>>> > -generic-y += cacheflush.h
>>> >  generic-y += checksum.h
>>> >  generic-y += compat.h
>>> >  generic-y += cputime.h
>>> > @@ -7,18 +6,12 @@ generic-y += device.h
>>> >  generic-y += div64.h
>>> >  generic-y += dma.h
>>> >  generic-y += dma-contiguous.h
>>> > -generic-y += dma-mapping.h
>>> >  generic-y += emergency-restart.h
>>> > -generic-y += errno.h
>>> >  generic-y += exec.h
>>> >  generic-y += fb.h
>>> > -generic-y += fcntl.h
>>> >  generic-y += hardirq.h
>>> >  generic-y += hash.h
>>> >  generic-y += hw_irq.h
>>> > -generic-y += ioctl.h
>>> > -generic-y += ioctls.h
>>> > -generic-y += ipcbuf.h
>>> >  generic-y += irq_regs.h
>>> >  generic-y += irq_work.h
>>> >  generic-y += kdebug.h
>>> > @@ -27,34 +20,15 @@ generic-y += kvm_para.h
>>> >  generic-y += local.h
>>> >  generic-y += local64.h
>>> >  generic-y += mm-arch-hooks.h
>>> > -generic-y += mman.h
>>> > -generic-y += module.h
>>> > -generic-y += msgbuf.h
>>> >  generic-y += mutex.h
>>> > -generic-y += param.h
>>> >  generic-y += percpu.h
>>> > -generic-y += poll.h
>>> > -generic-y += posix_types.h
>>> >  generic-y += preempt.h
>>> > -generic-y += resource.h
>>> >  generic-y += scatterlist.h
>>> >  generic-y += sections.h
>>> > -generic-y += sembuf.h
>>> >  generic-y += serial.h
>>> > -generic-y += setup.h
>>> > -generic-y += shmbuf.h
>>> >  generic-y += shmparam.h
>>> > -generic-y += signal.h
>>> > -generic-y += socket.h
>>> > -generic-y += sockios.h
>>> > -generic-y += stat.h
>>> > -generic-y += statfs.h
>>> > -generic-y += swab.h
>>> > -generic-y += termbits.h
>>> > -generic-y += termios.h
>>> >  generic-y += topology.h
>>> >  generic-y += trace_clock.h
>>> > -generic-y += types.h
>>> >  generic-y += unaligned.h
>>> >  generic-y += user.h
>>> >  generic-y += vga.h
>>>
>>> Thanks.  These just sort of collected there because I hadn't trimmed them.  Is
>>> there a script that checks these?
>>
>>
>> No script is available for now, but
>> I'd like to turn on warnings to catch some cases:
>> https://patchwork.kernel.org/patch/10746823/
>>
>>
>> BTW, can I apply this to my tree
>> along with other cleanups?
>
> Acked-by: Palmer Dabbelt <palmer@sifive.com>

arch/riscv/include/asm/dma-mapping.h no longer exists.

In file included from ./include/linux/skbuff.h:34,
                 from ./include/net/net_namespace.h:36,
                 from ./include/linux/inet.h:46,
                 from ./include/linux/sunrpc/msg_prot.h:204,
                 from ./include/linux/sunrpc/auth.h:16,
                 from ./include/linux/nfs_fs.h:31,
                 from init/do_mounts.c:22:
./include/linux/dma-mapping.h:261:10: fatal error: asm/dma-mapping.h: No such file or directory
 #include <asm/dma-mapping.h>
          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.build:277: init/do_mounts.o] Error 1

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
