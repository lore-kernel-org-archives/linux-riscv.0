Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFD9C282C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E46A02171F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUEQ1I39";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyrLkHB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E46A02171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXgkcGWkUVE6+YNbkZ6m88HT/egGXqEHQrlBdBJrx4U=; b=MUEQ1I39C9xGK1
	H/11lIkVTv2BHM8ti43dBPGru1SgCw84SVMLoRqzrjwkdwgthWMDKAQbnEYqPZzc1luEG6Y34Ay43
	5oaJODJeXO7Tx6Y33T+OF3nHaR1Oe30tczL4nMRcrtTCmETVepRzYb7xwOEoUcsq4WWzi5EQXRhYt
	GEVQ10uQHQvZDEde61vMohpMXSMoLCMBW2Vs0EyDnSDaXIPHey6cf/LOvJRVJolJwllx/eiK8Sgsv
	krPfH1sZMpZARDJDOt898zzaFDoZckeaNsPzxTiNe24db8gdY+ugLMXGFWHRSRTFc8DQ+3WE0YnmH
	W3r5mGDnQHr0V1GTAToA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goCm5-0004zm-Hd; Mon, 28 Jan 2019 19:40:53 +0000
Received: from mail-it1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goCm1-0004zH-TE
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 19:40:51 +0000
Received: by mail-it1-x12d.google.com with SMTP id h193so313018ita.5
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cjniSVNAIH0Bp44bZFzERQC1aQN+fCT8Nuklq+0L5MI=;
 b=nyrLkHB4cg5fEIgOQl9jx1hr2Mk6RUtwV0MVmCyLdj/WjMJOrn4cWjHZ9StCTcZr3R
 UlZ3tETD3kMw+dpCnpaCfxBqm7D6DOXPNW7glJ06J7AkL0XZkQxR6uF9zNG/IFeQRV5n
 Zccae37Dypl3wllNX6zXZKmxfOysAf5PUlNJgz7Mfw+u/bKrVOMRdrYuxglB0nrAsj3a
 z0iXOHbo2Hv5S0Vv+YSa3pA18rX7A76+1UbUoME++GrBI3FoY6cY/ta2AFlLPF7tVdR/
 QZxWIK7LtamfKrsIFVn9KkUSFPfHfgtf/cnjAdWGozefEG2vbXWJmG5JwkIxsRB2PDkg
 7gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cjniSVNAIH0Bp44bZFzERQC1aQN+fCT8Nuklq+0L5MI=;
 b=Cl+crGhymeWxRaPQgA7WR/DL4D0KLe/Ff4n2WOvgNNWAzNBQwcrPfmIK8pRNyWAxUd
 CVjiycbraZEUG9Hok3b3cet4MhMSKYYFUETccR2jh/Munc9Yj038WoOXkaMMnOTzw4+J
 KzAC3M7zVB3vlg1i6kvN4ToJEyDBWHUIsxJfk3iTFB70qDejWjyJpNlD6b0+tKJ0iDOz
 HqMgmbOp9Svyxhi4DRZVscJLnV5UhW6ma81RJ5rWA8YKX5ILh2o2kJOi3uLwfKnCmfkp
 veuvUeTY9fQ1g0EmlnZC4B9o0inNsbAZbqbn3MJTNdUefBylfjR7F57p7U28uzaauLDj
 kd7g==
X-Gm-Message-State: AHQUAuYN2eGtzaVGlCHJOf6S7Xb8nQ2WPieixcJMSO6irIMXhgjcuYUu
 fvSGCJomECvMMKDtRUBQf7voEF12G+BUNhy7lmo=
X-Google-Smtp-Source: AHgI3IaDjKS8j/BhuZLXkQM28h2V3A3SBpQz1t0HP6Uo3Xpbdg0uDqBZIK3kSkq9ZTbE4cWp4JpW0+7TioOkcjG9a3c=
X-Received: by 2002:a24:9646:: with SMTP id z67mr1372376itd.153.1548704448323; 
 Mon, 28 Jan 2019 11:40:48 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
In-Reply-To: <033872b8-49d5-2731-118f-967488f4763f@suse.de>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 28 Jan 2019 11:40:36 -0800
Message-ID: <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Alexander Graf <agraf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_114049_966904_9B50AD11 
X-CRM114-Status: GOOD (  23.07  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, "zong@andestech.com" <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Those of us working on the linuxboot and heads projects for the last
few years have reached a few conclusions in this area. The big one --
vendors can not get firmware right, period. The set of bugs we've hit
in the x86 world alone in the last two years is just amazing, given
that the UEFI community has had 20 years to get this stuff right and
still don't seem to be able to do it. What's more amazing is how
trivial they are. Do you want to disable UEFI mechanisms for detecting
ROM image corruption? It's easy on many systems. Corrupt the ROM
image. Achievement. as well as the ROM, unlocked. I'm not making this
up; it's several CVEs at this point.

We've learned that blindly  trusting firmware is always a bad idea.
Assuming that it should have higher privilege, and trust, than the
kernel is, similarly, a bad idea. In general, kernel code is far
superior in quality to firmware, and is certainly better tested. Why
is firmware higher privilege, when it's not as well written or
trustworthy? That makes no sense. It's the assumption RISCV is making.

Maybe the most important thing we now believe is that firmware should
be measurable by the owner, i.e that an end user or system needs to be
able to see what's there. Following on that, it's most desirable if
firmware functions can be disabled and in some cases the firmware can
be completely replaced, post boot, by the kernel, with something it
can trust. The M mode, conceptually, is just a different type of trap
handler. This is a lot like the work I did a few years back to vector
SMM traps to the kernel, not buggy vendor SMM code.

From that perspective, the "M mode bug" was never a bug -- I never
agreed with Don on this one -- because it guaranteed a kernel could
measure, disable, and replace firmware. And that's important, because
firmware that is more powerful than the kernel should be easier to
change out than the kernel. And that's another thing vendors keep
screwing up. There is a recent proof of concept that installs UEFI on
vulnerable x86 systems and then sets the one time fuses in such a way
that the firmware can not be replaced unless the CPU is too. I'm not
making this up either, and it's due to a screwup in the manufacturing
flow of some ODMs, who left those fuses open. There are exploits in
the wild that are only resolved with a chipper.

Short form: if the PMP makes it impossible to measure, disable and
replace firmware from the kernel, then PMP is a bug, not a feature.

I just now had a conversation with a friend from chromeos firmware
team and he is similarly dismayed with the directions riscv is taking,
especially as regards runtime firmware. When I mentioned PSCI he
looked sad.

I understand the motivation to fit a new architecture into old
firmware clothes. It's just that the clothes are motheaten and out of
style and never looked good when new. We're going to need to have an
escape hatch for organizations looking for newer, better ways of doing
things.

One possible way out at some point might be to define an SBI interface
and operating mode that is responsive to concerns about firmware
security, and avoiding the mistakes of the past. This does mean that
there will not be "one SBI", which in turn means different kernel
configurations, but I don't see much option. The concept of a "single
SBI" was always going to be hard, and I expect at this point it will
never happen.

ron



On Mon, Jan 28, 2019 at 8:38 AM Alexander Graf <agraf@suse.de> wrote:
>
>
>
> On 28.01.19 17:33, Luke Kenneth Casson Leighton wrote:
> > ---
> > crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
> >
> > On Mon, Jan 28, 2019 at 12:44 PM Alexander Graf <agraf@suse.de> wrote:
> >
> >>> If Risc-V wants to avoid fragmentation, it should simply keep a firmer
> >>> reign in what is allowed in an implementation and keep a lid on such
> >>> horrid ideas as vendor specific userspace ISA extensions.
> >>
> >> I tend to agree here. I think a global identification scheme is
> >> reasonable. But can't we just live with a single global spec that people
> >> contribute to?
> >
> >  unfortunately, alexander, the RISC-V Foundation has chosen to exclude
> > people from the discussion, by choosing an ITU-style ("Cartelled")
> > secretive standards development process.
> >
> >  so as an "outsider" who for whatever reason cannot join that closed,
> > secretive process (for example a strategically-critical u-boot or
> > linux kernel developer with decades of relevant experience but who is
> > under contract) even if you wanted to contribute to a single global
> > spec, you can't.
> >
> >  the reasons why the ITU-style Cartel was set up have been discussed
> > and made clear (patents); the justifications were knocked down; there
> > was no response.
>
> I can see why you want to have a process like that in place for the ISA
> itself, but the SBI spec really should not have anything "innovative" or
> patentable. At the end of the day, it's a communication mechanism.
>
>
> Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
