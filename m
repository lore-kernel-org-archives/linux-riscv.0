Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E9BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:56:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6279C20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mszftleK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nKA6W7r9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="ABrLBQ9w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6279C20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCUaCqsMzS73RuoS93rashbWOTgqyltDRwrHAGQsDiY=; b=mszftleKHmWZck
	KB0F5RXrW0ahMC1p0TTqwoaNPR5W10SEtechWwC7WK6MudzmZZCu608clbwc1BzCPgNbyBT1/zGxb
	upQzu2Q0g9gUExS3sl59kAEm3x9zsk0b9NYQG/mgsGHCr98PI63b9gCaHuWYkjY+0yVQUJmLhSY0e
	JEVbNHVSawzigVaRg+/r7raX9FShjhfSkWgHIEwPcywgoWmOit//VnYslsdjR48W2evdISC4FGGKD
	evufAZcKL51Bx868Hr5q4pf059Pv0LD5Nhh8pZDJMZlPqt4aiiR+CFGPnywNvdXj0yKENQwoBG2zJ
	nMaGwNqwsvW7RqoY7PGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXUG-00036s-Cp; Sat, 10 Nov 2018 17:56:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXUE-00036C-W7
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 17:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gLiQaqpzy2ttb25rHJXGFECYnqPRNYDH8ZECLe68QNI=; b=nKA6W7r9FFoM45R3b7oeVZBBr
 MpfjzPEae6FmehYr6w/43ChlONyvcE6T4+I/I5am+lcIolcAFBUc0r5Q1KH6EoUaDADj1dyntmRr2
 JNO4MgdNl+5BAsVXij1/RfvPhNjZVhSj5hL84jSkM7y/Kk9I+hDVygwHA6M9UlgUtg0rRuaAheDyB
 BVgFyBkLIAYi828muhscO5wYiPXTS6kC5mIXpB9oBBcug1vuuPU5lyTI/NHHHoLgTKl90StB/3Xhk
 /PyJp00Dg4HzE/BN1bNQG4txe81NjVy2rVYbeVpTAEy09Lo6cvmLdsH5Gs3pIbnrtLlevF6b2r6Ly
 39sBnbVOw==;
Received: from lkcl.net ([217.147.94.29])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXUC-0001hE-7a
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=gLiQaqpzy2ttb25rHJXGFECYnqPRNYDH8ZECLe68QNI=; 
 b=ABrLBQ9wBbswYISkbuOyse0TU8080PT1YjwSBTsTZmYvKP2m7pkBT9sEUqGaDPITZrV3Fz86CW/2nIVCIEEip+yYOJE6pAlWqzhl7t9mZEBZecSKou37kBsLuc7MuZz5sFCBs26UzL0POTUuQEo4wDtI7PdO6TD3q7xFunHmAWU=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLXU4-0008GN-Hr
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:55:48 +0000
Received: by mail-lf1-f41.google.com with SMTP id u18so3499878lff.10
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:55:24 -0800 (PST)
X-Gm-Message-State: AGRZ1gI59fwdRMmM9/aIlDt6xlM8aWmSyZPimjjJo1fEG19xIWTEC2a6
 Qk2RXjqCMGNpPEw8Cw/edhPM7abnWlK6kYAYfog=
X-Google-Smtp-Source: AJdET5coGXX2KK55XWAISz7MJUlJjEtJhYUGMJ+uu/f8enwhNgSnS8LJ9l8UUbO2iFDaX8BknQsDn7dvIwuadPOKlx4=
X-Received: by 2002:a19:4f0c:: with SMTP id d12mr7749969lfb.121.1541872519117; 
 Sat, 10 Nov 2018 09:55:19 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
 <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
 <CAEz=songRyvbEgYfxKP0WyuAdZnKsqfrCk8CCxSsCGGHeUFixA@mail.gmail.com>
In-Reply-To: <CAEz=songRyvbEgYfxKP0WyuAdZnKsqfrCk8CCxSsCGGHeUFixA@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 17:55:07 +0000
X-Gmail-Original-Message-ID: <CAPweEDw=5sy5d-LA5hLQEu+oyf9T5GCkMxDEut9q06zff_-9qQ@mail.gmail.com>
Message-ID:
 <CAPweEDw=5sy5d-LA5hLQEu+oyf9T5GCkMxDEut9q06zff_-9qQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Samuel Falvo II <sam.falvo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_175556_279131_FFBD1277 
X-CRM114-Status: GOOD (  11.03  )
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
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110175507.u7Jx-2JiQ1cHm8ha9xHmdRWq0qYRcqKS-8QOooaos5k@z>

On Sat, Nov 10, 2018 at 5:48 PM Samuel Falvo II <sam.falvo@gmail.com> wrote:

> On Sat, Nov 10, 2018 at 9:43 AM Luke Kenneth Casson Leighton
> <lkcl@lkcl.net> wrote:
> >  it's also not an appropriate argument.  nobody sensible would port a
> > POSIX pppd from userspace into boot-level firmware.  the argument also
> > ignores the dozens of other advantageous potential use-cases.
>
> Regrettably, if it's one thing we've all learned from PC clone
> manufacturers and BIOS vendors, it's that they're not sensible.
> They're not reasonable.  And they're anything but sane.
>
> Servers designed for use in data centers are on the market right now
> with adapters fully equipped with TCP/IP stacks in firmware *just* to
> give a remote operator control over a computer's PS/2 or serial ports,
> for instance.
>
> You can bank that it'll happen with RISC-V as well.

 *snort* yeah.  is that a good enough reason to terminate all and any
discussion of enhancing a general-purpose generic API that has several
other beneficial use-cases?  reminds me of the adage "guns don't kill
people: people kill people".

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
