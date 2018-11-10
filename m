Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701DFC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 462B220858
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q7CjsCdZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UK2FdpV4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="JZY3iVzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 462B220858
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1K0E0DWo1KwPBzLwOj5Q3D0YjxoV+JN5nxC1bYwi/c=; b=Q7CjsCdZ4l2wyF
	K2HlEQmeF/GQ1a5nxzd9F+NqycvxmVNDEAIJ/Atd4jhfDVv7ubRFoPU334qiGuvrsZPal8r6kn544
	NKKr1YUCD/nPPEEC0CsQ7SvId/MZ4B+Kju6aJoV0oWB0yRiCNU4qpvz1KaUV4jJombqQON8PJobU4
	Fl2mxggy+AjtlDSYRWtpDvHrUP1GnH8hYF1akUpqOKXFyjSq/EkkXoKDm3gQNLVzaKP4qLYXY31gM
	7r20QeVw9j2DYeNXX86+2wYwapzSag7p7vwPXOeBbg90K3FVrB3sJlFWvECGsTQyh7hrcLQDq6Lsm
	5T9hwoYFYtkmOJBU6hAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXFe-0005Mj-Ct; Sat, 10 Nov 2018 17:40:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXFc-0005MM-VJ
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 17:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6laoh2WdRsY7u4IG8QO68K5XcJCumLS6z5g++TSLco=; b=UK2FdpV4oyUZVvuT1+VBbAZuT
 juQdFqKFU/GUagonaSHXzeO4TvmxZ9ouLIeI0yQ1q65B171eG/PekSEgXYVaV2emTXUoV5PP+P6H8
 zQDg0qMVm4vBSX38BvvCk7Pa6Uw1HaEmL26ECQhmjHkpImIlB4Z038njo/BhsTvjT4Dx4QBb3IsKy
 o7d5+TiMZyEiyu56pD0X0Ilj+DdE9laRhipG6Enybkpn6aQpxXHrjIF9b/GxlVojVOx3UdOaOhQ7N
 7IV5FDCuSfIdJGDR03oWNW+z98GjoImggTd5K3nFqXhWHBos8vl1/qkKMHtl8gLSgpvq8qz8F6x06
 QZvlSyC5g==;
Received: from lkcl.net ([217.147.94.29])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXFZ-0001EV-Kg
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=Q6laoh2WdRsY7u4IG8QO68K5XcJCumLS6z5g++TSLco=; 
 b=JZY3iVzopExUBWAEEzFTK2RWIdYkcT0N6aaIOtKlwLWIqD3qi/dUXNryvZfKo/QwzTyMAaEtIJAziItv7hr9HkqmppKbyOUi0clGc3qpNpgDwCnHg/15okWMpN2s4HoC2R/42uh9oCHnku9RZ9Sz+ssJC4/axrXID/yls82mxZc=;
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLXFN-0008BT-2Z
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:40:37 +0000
Received: by mail-lj1-f173.google.com with SMTP id s15-v6so4228556lji.3
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:40:21 -0800 (PST)
X-Gm-Message-State: AGRZ1gI1srW5oVmGfvvU6O7UQJi9AZPAeI2WrcBSZj2tFt36uWS3V3V7
 a7hjFMpSanKJ4r6yd16XmcCsb4dcmPgmWWE16Hc=
X-Google-Smtp-Source: AJdET5cOo1cCRfRMTJ0L5TikxQ8tAwe+NPFlxJBqNAmIAqCnD+WTsTKaxO/rZZBoYsvMuACuikaHLXwZ77OVXkcmNqM=
X-Received: by 2002:a2e:197:: with SMTP id
 f23-v6mr8559294lji.144.1541871615499; 
 Sat, 10 Nov 2018 09:40:15 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
In-Reply-To: <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 17:40:03 +0000
X-Gmail-Original-Message-ID: <CAPweEDyumVztVzFpx_05i2Qjc8YhzXOKKRkmDNqEOKuxZcr99Q@mail.gmail.com>
Message-ID:
 <CAPweEDyumVztVzFpx_05i2Qjc8YhzXOKKRkmDNqEOKuxZcr99Q@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_174049_688461_3ECEB354 
X-CRM114-Status: GOOD (  16.71  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, atish.patra@wdc.com, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110174003.ZSslxsvF_Ig7KnBLaf62ZOKcjiv0mFy1QxEqchLDiV8@z>

On Sat, Nov 10, 2018 at 4:46 PM ron minnich <rminnich@gmail.com> wrote:

> Which is why I'm a bit unhappy to see this (to me) cancerous growth in
> proposals for M- mode code. PPP in firmware?

 no, ron, absolutely not, that would not make any sense at all:
getting what is otherwise a userspace pppd into firmware would be a
nightmare as it would require a huge amount of POSIX support dragged
in with it.

 it would be ppp running in spike userspace (buildroot in an
initramfs), where the linux kernel would have absolutely standard ppp
modules compiled up, the serial data drops down to spike over the
proposed modified SBI, which, on having support for the proposed
addition, will take an extra command-line option "spike
--serial-line-0-redirect-cmd='pppd'" which gets it into the host, and
the guest spike OS gets network in a dead straightforward fashion, for
very little in the way of code and ABI modifications.

 it's a cut/paste job, for goodness sake, in the pre-existing SBI
implementations, just adding an extra argument.

 it's real simple, and has absolutely nothing to do with the [crazed!]
idea of porting a userspace ppp POSIX daemon into u-boot/coreboot.  i
mean, you *could* do it but you'd be insane to consider it, and there
are better options for the more complex systems... which don't *have*
to use the proposed idea.

 the alternative to achieve the same desired goal is to re-wire all of
the u-boot/coreboot source code and use some form of serial line
"framing" protocol, to emulate multiple virtual serial lines over the
single SBI console.  and rewrite openocd to support it.  and. and.
and. and.

 that's a lairy nightmare waiting to happen, and, on early debug of
real silicon where you're hand-programming the PLL and the serial
port's outputting crap because you've no idea of the baud rate, you
wouldn't see ASCII characters if you got it right, you'd see framing
crap instead and couldn't plug in simple minicom, it'd have to be a
*modified* version of minicom.  etc. etc. etc. etc.


> p.s. For interleaving debug and console output firmware, use the
> oldest trick in the book: ASCII is 7 bits. Since console out is 8
> bits, reserve 128 values for console out, and 128 for debug stream,
> and if the debug stream needs 8 bit for some words, you know what to
> do. It's very easy and doesn't require that we add multiple UART
> support to SBI.

 naah.  see above.  it's a lot more complex and fragile than that.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
