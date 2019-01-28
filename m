Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16792C282CD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 20:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D657E2171F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 20:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q1xlUhZl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6UyzaqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D657E2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPpfegtUQJkUZjICH7+d7xltzVFIguZ/eTYGaCR6C3w=; b=q1xlUhZlR6v3K6
	YL1PT0/8Kt149uxqtSh6rOYKz6sQ9N9yhhy8CA+BzEVRVnjpkZXhj3ONQA/f974tEB7LJ0iZY/6kh
	XbJBoIbauvIqZl1hjslCAQErGiDJrRzT/AhpbgsLQTXsimQdasl+FXgKgSRgesDSDioNolxtcYFYR
	mab0YKuPIGuRCmMQKg3dQQIrCKaG0IrjtywaY83+yXih2PC7ev9GCRpUi0SEFpPq5avIXJ9/mVnsV
	SOlF2I9oq1ZUJqLEXKHoUXs0pBMADtaeTEaugAeUe4pgTkYCl5iUoI1PZaD+iQhKROxWzoEA9IRgn
	cw4hvNSlfWFheB3IBm9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goDML-0001Wm-4Z; Mon, 28 Jan 2019 20:18:21 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goDMH-0001Vx-Il
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 20:18:19 +0000
Received: by mail-io1-xd44.google.com with SMTP id x6so14603212ioa.9
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 12:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1imR5lRCEX76TYUTwGfOvnflfu36mi5Fd/Xs7uSzoX4=;
 b=B6UyzaqP4XfpHPJ5S1gfaTg9uj3OgWz6LYxycBynyAG8j5oYkAku6pQ2yaxegZwaDR
 J7YbvoJInOi/BnFRvf/wLllMnt2RW6bZRzUsbfejmnRj2Q/fpjXrMyv3CQeX5wj0QqrR
 K6AtHG7YfkvaWb90wwWOVgbuFAgHteZz6+CCbAz9mBvCDpOJBH5bL5GH81/Xir/XG30Y
 bHXIYhdsCMkJWfjIwymRmfffzxoPCdgs3bk1KDFpClMoxjNs28Q3PqVRF9dumzAXkJVy
 bDAUfdlCkLEMEzISEZpaqhInJFbpSBHl718H9hSDxQuKwZ9bIAVjMbUt14LwCSMDKJOT
 oB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1imR5lRCEX76TYUTwGfOvnflfu36mi5Fd/Xs7uSzoX4=;
 b=EjNwoNJr2gUV8YkJLhez/aYOH1ZbUVn9N1aBroODK6DP4UabyaeTVusQZH2l4Sw3X/
 DgYMFZQp7OAHwrdQn4BcOEhPtm6KpZFya9xb6DKxdzHsiZH70ilLKay3qEhi6C42kc1p
 sz6QGRjNuf0r+GjOpDToBgD14Eyeypvlfr7PD3Mt3lENmbxzEriLjEv/iYJD+cXE+ZAW
 KsTw+NfFSwZ63LHZctujZPcMg5aimM8+tm4SjfqAOpKWorylUmeKm1cUhcCsXRVynqMX
 UV7lhkfyeOOosXDgaS3ldaREdU4BPw0Or6eXDEZOAnFnNzCjt2b+J5hTH+KfE22xP/rw
 +6zw==
X-Gm-Message-State: AHQUAuZS/UMjlxhZhYxBtlK0QMQEdfZn8RizbZLOpoHYLgcSx9q13yuP
 OSU6yi775HyH2GNoGk4itp7ldcO7Ibm9vBoM7CU=
X-Google-Smtp-Source: ALg8bN7X034naY0XLmuQbiYIpAi7Rv+WVXs+3/hggliXMVH7IXsX6Wl5vP8zMDd8PzNMqeObBY9V1zTuJuFfCD6EUZY=
X-Received: by 2002:a6b:cb08:: with SMTP id b8mr12944430iog.200.1548706693996; 
 Mon, 28 Jan 2019 12:18:13 -0800 (PST)
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
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <aadef824-7c76-5784-0ec8-de4344158c15@suse.de>
In-Reply-To: <aadef824-7c76-5784-0ec8-de4344158c15@suse.de>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 28 Jan 2019 12:18:02 -0800
Message-ID: <CAP6exYJttZXUp=NAikvQ-9Orj-Ptpj4=Pnj30GN90Rzt_Rvvyg@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Alexander Graf <agraf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_121817_661217_1CD64805 
X-CRM114-Status: GOOD (  13.06  )
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

On Mon, Jan 28, 2019 at 11:55 AM Alexander Graf <agraf@suse.de> wrote:

> You're mixing up 2 things (which is a pretty common fallacy I've come
> across people who worked too much with x86 firmware): Design and
> implementation.

uhm, alex, I worked on or started the coreboot ports to
arm
arm64
ppc
riscv
alpha

I've been working on various non-x86 firmware for over 40 years,
starting in 8 bit days.

You should probably not assume too much about people.

> The conclusion that runtime firmware is a bad idea IMHO is wrong though.

We can agree to disagree. But please don't start by stating things
about my background; you don't know me and you're wrong.

Runtime firmware is acceptable *if and only if* the kernel can measure
it, disable it all or in part, or replace it.
That's a different statement than what you just said. I don't like
runtime firmware, but of course on RISCV there are few options
for some registers. But it is a very rare runtime firmware that is
implemented correctly or even well.

There is one company that is so concerned about M mode they are
implementing a RISCV CPU without it.

> Now, if the firmware development model is so broken but at the same time
> such firmware gives us the ability to abstract interfaces better, what
> is the solution?

you give me the information I need to write a driver. Done. That's
known to work. And for linuxboot systems, that's the only way it
works.That way, we have one driver to deal with, not two. Server
systems that work this way are being deployed today.

> You obviously need to apply the same standards as you do for the OS to
> firmware. It's why open firmware is so important.

Sure. It'd be nice if that worked, but it's essential to ensure it's
the only thing that works. It's important not to enable architecture
features that can be used to make open source firmware
difficult or impossible. PMP is one such feature, since it allows
firmware to lock down regions of memory and make them inaccessible to
the kernel.

In general, however, vendor firmware is extremely poorly written, and
I don't expect that to change.

> But putting everything into Linux instead really is not the answer. The
> only thing it does is break forward compatibility and bloat code size.

I am, today, fitting a linux kernel and full Go userland into about 3M
in SPI. For reference, this is smaller than the audio codec firmware
on some chipsets.

I don't agree with your claim.

That said, RISCV will have the SBI, and there is no getting around it
for certain purposes, but there's no reason to encourage growth.

ron

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
