Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751A9C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 20:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD8F20700
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 20:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bKmfqvZ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ccoBiJs8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD8F20700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=X4m9q+/5um7Hm3BTk0WysAYdkLKT0P5GZN6PWq1hcrs=; b=bKmfqvZ/fOqF+V0CRZ7ZgpMyP
	1YMBsWksS82FIEb9j3WaS3krdvgO3i9SDjMdnNUi610xa6PbN92yS8gPylnBLFR8sng8fPv6v09nd
	s5Q3QHG/1FV5BN2smIFud7m14gv3skgF+PeAkSjCCm1E5ZRy66f3wGq8nZZmtbQTP2IT9ZFb/8BOa
	8i/FHkIpndtl6H0zUvcKzpyG0HKyS38bEJA2MJS1MNekKZiJIcz3ImAr9s89mwcJUwHHIdY23kpHN
	TbX6/IOtLy+mwEoT2jY56Hd+bjUtBYd8qGo253UhuC7apB8JfxGXQp30TbPNiLKrrq3Rz6+R/cBSh
	p7cZVx09A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggxoU-0005DN-3Y; Tue, 08 Jan 2019 20:17:26 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggxoQ-0005Ct-5T
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 20:17:24 +0000
Received: by mail-pf1-x443.google.com with SMTP id r136so2452697pfc.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 12:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NHq73EOC6P/EZP1zXEp3GS6Y59Bi8cZdKMfq30ztJos=;
 b=ccoBiJs8wGFBxd3eVhWoT4x7W5UbDJzMJjhybyEKr3HV1C9N5aoNa+32WD/aAozvRY
 HUhoWeV5zUkRnhZQujj3dHj/700AzDITCf91nEy9Pet1C+UOkZUuUPa52DfRyW78wKEq
 bIZK8K3yaNa9ZqBhmdwnUSrZ95OUhnGWjl7RmWodjmb8sDMNvloCJqrVbFuuYFeDeN6n
 wvUY85xIaj7QieU9Qchaj1J1Kkr2R219UI/gxiSw3CcHxyg1pNjpdiWcrwugg2feZi8g
 MjWJ+Jaq9Uh9NpShSUAAAmYeD7NlnPxAbnVUqHcahXYE2vnuzjfQjcX6uwy7C+bDOb0c
 4+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NHq73EOC6P/EZP1zXEp3GS6Y59Bi8cZdKMfq30ztJos=;
 b=Xy9zksi+fiHbGJ/8tkD3GFDKk9T5slW3kwDuPueUaMr391fYAnQuqZcE4uy04iPa3K
 5ccQy00STqkdU2ATTqCOoOqQavujM9U89fxi17CCEA44b0Pb3UyMExb94Wywepb+2hpA
 j0nqROg9hCTPQhEddYKYzyWCGXjY81wtbZJDHhgQG5keFBHRIvogCmfnX8uStihmgMnn
 0NSAhauTy0a0x+6K8vc7MUOwujXRcEdgFFA5axhCgXGZlVkoCJPIxmlCaV9+wTm+s/nH
 /aqJ7hy9BdWEn5qATkqC2cw4ehWdWMheXnMONT1FzjCPrdDtulSDEaI8DjINsPx1tJ2A
 jt9Q==
X-Gm-Message-State: AJcUukeNqoUOrND/zxRymCcluJ77KzdyhEGXxvZ+BLvCVjBCxTMC/p7s
 mSV3s2P28+eOXLgaCE5gAAgQzQJcHgw=
X-Google-Smtp-Source: ALg8bN72u4US66UDBZ4SNoRsySPsovguRSvPDE066b/Oi8EEF/GdrakryNTJZhCRogu2wmpDuElM3g==
X-Received: by 2002:a63:5455:: with SMTP id e21mr2814758pgm.316.1546978640863; 
 Tue, 08 Jan 2019 12:17:20 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i72sm104704585pfe.181.2019.01.08.12.17.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jan 2019 12:17:19 -0800 (PST)
Date: Tue, 08 Jan 2019 12:17:19 -0800 (PST)
X-Google-Original-Date: Tue, 08 Jan 2019 12:16:42 PST (-0800)
Subject: Re: [PATCH] riscv: remove redundant kernel-space generic-y
In-Reply-To: <CAK7LNAT+5eOFc64SG2SKCOThVVsz6S2NPBpemdcjCcZX_zds2Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: yamada.masahiro@socionext.com
Message-ID: <mhng-aacb9594-f17b-4728-91f7-e2804e6a3dbc@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_121722_237789_CF5C935F 
X-CRM114-Status: GOOD (  16.54  )
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
 geert@linux-m68k.org, deepa.kernel@gmail.com, linux-riscv@lists.infradead.org,
 Jim Wilson <jimw@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 04 Jan 2019 07:03:20 PST (-0800), yamada.masahiro@socionext.com wrote:
> On Fri, Jan 4, 2019 at 11:16 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Sun, 16 Dec 2018 06:11:11 PST (-0800), yamada.masahiro@socionext.com wrote:
>> > This commit removes redundant generic-y defines in
>> > arch/riscv/include/asm/Kbuild.
>> >
>> > [1] It is redundant to define the same generic-y in both
>> >     arch/$(ARCH)/include/asm/Kbuild and
>> >     arch/$(ARCH)/include/uapi/asm/Kbuild.
>> >
>> >     Remove the following generic-y:
>> >
>> >       errno.h
>> >       fcntl.h
>> >       ioctl.h
>> >       ioctls.h
>> >       ipcbuf.h
>> >       mman.h
>> >       msgbuf.h
>> >       param.h
>> >       poll.h
>> >       posix_types.h
>> >       resource.h
>> >       sembuf.h
>> >       setup.h
>> >       shmbuf.h
>> >       signal.h
>> >       socket.h
>> >       sockios.h
>> >       stat.h
>> >       statfs.h
>> >       swab.h
>> >       termbits.h
>> >       termios.h
>> >       types.h
>> >
>> > [2] It is redundant to define generic-y when arch-specific
>> >     implementation exists in arch/$(ARCH)/include/asm/*.h
>> >
>> >     Remove the following generic-y:
>> >
>> >       cacheflush.h
>> >       dma-mapping.h
>> >       module.h
>> >
>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> > ---
>> >
>> >  arch/riscv/include/asm/Kbuild | 26 --------------------------
>> >  1 file changed, 26 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
>> > index 6a646d9..f7068f3 100644
>> > --- a/arch/riscv/include/asm/Kbuild
>> > +++ b/arch/riscv/include/asm/Kbuild
>> > @@ -1,5 +1,4 @@
>> >  generic-y += bugs.h
>> > -generic-y += cacheflush.h
>> >  generic-y += checksum.h
>> >  generic-y += compat.h
>> >  generic-y += cputime.h
>> > @@ -7,18 +6,12 @@ generic-y += device.h
>> >  generic-y += div64.h
>> >  generic-y += dma.h
>> >  generic-y += dma-contiguous.h
>> > -generic-y += dma-mapping.h
>> >  generic-y += emergency-restart.h
>> > -generic-y += errno.h
>> >  generic-y += exec.h
>> >  generic-y += fb.h
>> > -generic-y += fcntl.h
>> >  generic-y += hardirq.h
>> >  generic-y += hash.h
>> >  generic-y += hw_irq.h
>> > -generic-y += ioctl.h
>> > -generic-y += ioctls.h
>> > -generic-y += ipcbuf.h
>> >  generic-y += irq_regs.h
>> >  generic-y += irq_work.h
>> >  generic-y += kdebug.h
>> > @@ -27,34 +20,15 @@ generic-y += kvm_para.h
>> >  generic-y += local.h
>> >  generic-y += local64.h
>> >  generic-y += mm-arch-hooks.h
>> > -generic-y += mman.h
>> > -generic-y += module.h
>> > -generic-y += msgbuf.h
>> >  generic-y += mutex.h
>> > -generic-y += param.h
>> >  generic-y += percpu.h
>> > -generic-y += poll.h
>> > -generic-y += posix_types.h
>> >  generic-y += preempt.h
>> > -generic-y += resource.h
>> >  generic-y += scatterlist.h
>> >  generic-y += sections.h
>> > -generic-y += sembuf.h
>> >  generic-y += serial.h
>> > -generic-y += setup.h
>> > -generic-y += shmbuf.h
>> >  generic-y += shmparam.h
>> > -generic-y += signal.h
>> > -generic-y += socket.h
>> > -generic-y += sockios.h
>> > -generic-y += stat.h
>> > -generic-y += statfs.h
>> > -generic-y += swab.h
>> > -generic-y += termbits.h
>> > -generic-y += termios.h
>> >  generic-y += topology.h
>> >  generic-y += trace_clock.h
>> > -generic-y += types.h
>> >  generic-y += unaligned.h
>> >  generic-y += user.h
>> >  generic-y += vga.h
>>
>> Thanks.  These just sort of collected there because I hadn't trimmed them.  Is
>> there a script that checks these?
>
>
> No script is available for now, but
> I'd like to turn on warnings to catch some cases:
> https://patchwork.kernel.org/patch/10746823/
>
>
> BTW, can I apply this to my tree
> along with other cleanups?

Acked-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
