Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CD6C43610
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76AE20854
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uvkm051C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="0AHnMo35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C76AE20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nc41dSocklRlzuLEYIhAKYzhWIf7IK3HZ78tUeQgC9M=; b=uvkm051CMqtZWl
	L0lq4hXQ1Tbzzvc8rosYe5hqF0CEVCYj9caA4MSUO3FaRK21iglQB4DanNwMZBYqqVH0v/OZS+5CO
	svzp7zrCq8uFGPnCKrkK3RZU2/4BI5cNJjOdjGOBFq4+HCHj03xgOCusMv1690VU+RNPDD8vbbBWi
	N3fRnCse6s3Cbdi8hn7JNw9KDIoilJyVHHIBVjF+9U0Hz8eYj/63Zudd53coQ3EvF1Mb+CzLLcgk4
	D9qocVT7O4pPmqlS1+03zE0eMC0X57EjaiywZILwiMhL1UpZzm2z6McN7SMPFuMD/BOUQ/y10O1ho
	maXi44m2D+zd+uIfzL0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXGz-0005Qz-UP; Sat, 10 Nov 2018 17:42:17 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXGw-0005QM-Mi
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:42:16 +0000
Received: by mail-it1-x142.google.com with SMTP id m34-v6so7367354iti.1
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aZTlrFuBCQ0IqovWd+IYxQGwpyr5PrFzXU5r9xLY1co=;
 b=0AHnMo35ww3Kix6pb+fq/3v8h62QOyb4Vs9Qf+oyWjSk9HpsvIyFbVCjqEVqJ3Bce8
 t579lgzaI5opQhzN8J3NEM0YT9RGzI62qAmMwmwZvIV1FyJNZcyikksr7z1JRuug5SlH
 sMUVkCjzsBKl8PDPq/C05XXG4spslae6vOwWm99mfPGHTyY/w/Nyz6KXDelTSWl8/Hdq
 1Su9LcOr9qQxotAHUZ+/h+42T6c5tVm/d6yOWozNd55ircwPRbHqHcKZqhBGJaMqW7L9
 GPgVxLJ1u8T6IQTieJ6R1UkMLuHXMOBvMtRPv7YJvdYsFj24MtS/P49OS7lIShRvC9+B
 t3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aZTlrFuBCQ0IqovWd+IYxQGwpyr5PrFzXU5r9xLY1co=;
 b=BXEB9So2qNSdVgf+jNSHVNM47GGiuIqaxPVVVcu0YkR0zDUGttPR27iouTTfpW2Gq5
 1hYGGiwddwo9MioMajWbbD+ZG+jx/mU7S5HOizJfDGWBihzOH+NzCnIvvpkimeVTpMlu
 4Homq3OCc5YQ9CNfeUDnVERzR3hXYhp2uZbX76eo7dTszea0GJQ7iJiTfNjMRi64gIBB
 uWod0d/2Yl9qRncu1YVX/xRN4M2bPNXher15P2lGyisdna2CiE9LxMjbrMtSQxLfClqt
 UfmCaGotSD/9+xjL7urE9MpnCA1uZvb5rGPUri8qsojeYp5LCZ1UFzAtHwpT5BgVAuuQ
 HKxw==
X-Gm-Message-State: AGRZ1gLg1Aj/1+6esXkuyyEwMXKvDNEDfQHFEfwS/IyxdAGO66pDLJ6Y
 9x+/IBm1rIjym7FSuBgwB2kxN8oMDLU+UrVfphdDig==
X-Google-Smtp-Source: AJdET5dBg529iiLm7cSqcWRkNYRl21s/N/J4lQmIg90H6ayoL75b40y6C5urKCJvRaWQq2LvzB71zma9zFC83gXZPts=
X-Received: by 2002:a24:70ca:: with SMTP id
 f193-v6mr6132551itc.59.1541871723569; 
 Sat, 10 Nov 2018 09:42:03 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
In-Reply-To: <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 10 Nov 2018 09:41:51 -0800
Message-ID:
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: rminnich@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_094214_741341_59A8AFAE 
X-CRM114-Status: GOOD (  21.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Damien.LeMoal@wdc.com, olof johansson <olof.johansson@gmail.com>,
 alankao@andestech.com, abner.chang@hpe.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, atish.patra@wdc.com, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 lkcl@lkcl.net, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110174151.oj9KXzn9rPoPJTqr4FJULynTndq2zDOj_paDBg75L1Y@z>

On Sat, Nov 10, 2018 at 8:46 AM ron minnich <rminnich@gmail.com> wrote:
>
> At Google and other places, we've been struggling now for years with
> overly complex firmware that is implemented incorrectly, enabling
> exploits and other bad things. The list of things vendors get wrong in
> firmware, both enabling exploits and enabling others to enable
> exploits, is long and it continues to this day. There is an
> unbelievable amount of money out there all involving firmware
> exploits, very little of it involving nice people.
>
> I'm currently working on deleting all use of the x86 version of M
> mode, i.e. SMM. There are many proposals out there for deleting SMM
> from the architecture. I've also shown at a talk in 2017 how we could
> redirect SMM interrupts back into the kernel. We're also removing all
> use of callbacks into UEFI on x86. We're almost there.
>
> Which is why I'm a bit unhappy to see this (to me) cancerous growth in
> proposals for M- mode code. PPP in firmware? Really? multiple serial
> devices? really? We've been here before, in the 1970s, with something
> called the BIOS. If you're not familiar with it, go take a look, or
> you can take my word for it that these proposals implement that idea.
> We spent over 20 years freeing ourselves from it on x86. Why go back
> to a 50 year old model on a CPU designed to be in use for 50 years?
>
> My early understanding of M mode was that it was an Alpha PALCode like
> thing, enabling access to resources that were behind a privilege wall.
> I did not like it that much, but I was OK: it was very limited in
> function, and the kernel could replace it, or at least measure it. I
> also accept that every cpu vendor uses m mode like things (e.g. ARM
> TF) for reasonable purposes and also (let's be honest here)  for
> dealing with chipset mistakes. But that does not mean you need to
> recreate BIOS.
>
> The SBI should be hard to add to, deliberately. It should be used only
> when there are no possible alternatives. It needs to be open source
> and held in common. It should be possible for a kernel to replace or
> at least measure it. And, further, there needs to be some work done on
> why you add to it, and why you don't, with bias against adding to it.
> This proposal works against those ideals, as it explicitly enables
> vendor-specific forks of the SBI. Sure, this can happen, but why make
> it so easy?

There's a tension between letting people do the messy things that real
hardware sometimes needs without polluting higher layers in the
software stack, and letting them do too much of things that _should_
be handled in the upper layers. I have yet to find a solution that
doesn't need tweaking over time, the pendulum tends to swing back and
forth into "too far" in both directions sometimes.

The case of console is in this case pretty simple: It's intended for
early boot for very simplistic environments (before the rest of the
kernel is up, etc). Keeping the SBI console around beyond early boot,
and somehow trying to optimize for it for those use cases is a
misdirected effort; that's what native drivers are for.

Having to do fine-grained arbitration of device ownership between
firmware and kernel at runtime is usually error prone and awkward and
best to avoid.


> p.s. For interleaving debug and console output firmware, use the
> oldest trick in the book: ASCII is 7 bits. Since console out is 8
> bits, reserve 128 values for console out, and 128 for debug stream,
> and if the debug stream needs 8 bit for some words, you know what to
> do. It's very easy and doesn't require that we add multiple UART
> support to SBI.

Sure, it helps for 2 channels. And then beyond that you need a more
complex protocol. Either way, it's not a problem we need to solve here
and now.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
