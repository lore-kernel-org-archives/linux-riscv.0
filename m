Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F1EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D1720858
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rvpou1KO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EotiCOHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D1720858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMjnm5OW06dhZSRCejzTaTE3kmbz/0ZfkymgAOjsSjo=; b=Rvpou1KO/eEepI
	pcou71FoWPmEA5VLv+L1Ozry5FjteDOcdjjyrzz8tyRvstbl/QuLRyDvlGhh2n0zaFPN9OmyhnsEv
	/J+/U/myJ1o8t5CTXNfqUp8yDaCMS2Os0WfcM3OsVtgGvAsBeGcF7x/4ovVBm+Zu1bzWhj16gQA3c
	aLbm9Bk1HYPmJNeLfsKz29y3oeSa01scyfxf6/XDWeRWKMmstk7xNFJJNdamZvtEXggiFrH0hk5RK
	VN36ey1SLbwjIrLe5aoEYzdzDmrDfspmLiigJNk0pqHdVIsCQ5ycQKQTJov3TCNkzScUwnEubeh/d
	l0wHwQeIHk97sPwHtqWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXEB-0003y8-7C; Sat, 10 Nov 2018 17:39:23 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXE8-0003xa-96
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:39:21 +0000
Received: by mail-vs1-xe42.google.com with SMTP id v205so2896962vsc.3
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/Nu6Uu69rKY8m/RAgmjarf0BbJUdiGwrMcat7ciKLk=;
 b=EotiCOHoENEBqL6ZSjxg0W3t9QjVW/y5pwr+pW/7NWI6rwAZDu0/q5ny1+7rXVg5Px
 ShZd39zwwOVoLBrZrDO2MxXXPjXjEHNrc3wZdfQltK+g3KsGV7nJNk+hA81o0p390n2m
 U1NLFPOcwRIso19eQMqJWZlH/NFuMvLilYfABdlb3Q69k3fjUe0n1Zg9g64lIVsBDEUl
 u98Jdi7f2PjitGNA7C5HRG0SarijJG5l4n5Wv3NCmXRLeWOhbYzHPUPH6dhQvt1lJltj
 Gfxc9oAniZ5xJ4JeUZ8A5Oa0knOjZhvK2qqubDqdi4M2nEtsHiZXtK2SkWwhEdGSbxnP
 ZLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/Nu6Uu69rKY8m/RAgmjarf0BbJUdiGwrMcat7ciKLk=;
 b=hQ7NTfM1Ripaspa8J7FGN1Rm0ag6I2gxt8PuldgSZpO09LWnKTGhi0gjFYL0a3C5M/
 y9V3+z0uiFHaz9ZTPI98OzchcVjoNrkRHuOWequQ/t3+e5u7USbzlyclS7CRQfOm+krt
 3x3EiUq/FH/USv++zy4wlKoOXYoIM/rOreQTtUEn0s/t0BCL/U+AG51p6SNkrgcJhSQQ
 Ezbm2ksertvvSqHl5D95sbyn7Db6iM6eObv21H3I00ZCkHR7j6AM8e16YU1iMFg2gZ3U
 U1A6VPChr+XRsqdkTPydNjChkhpaliHMg8LM0GgGdRTvKv89pr2jyiZga3vdG9MqO6UW
 eUmQ==
X-Gm-Message-State: AGRZ1gIxXDz86Klq+TkHy1CHwSYmywig3Z6RSSgDBYeca5Esb5h68nbE
 sm2ykOvTgOWJTyoby3ofHZBh5XohAZYQDgxfH3E=
X-Google-Smtp-Source: AJdET5cJn0DKyeKUnkxtKTZwoED0BjriMGJJj+dJjYh7r1QJ5eAUzs/9Fu36w8WBxkwfonNYPrup6L4faQxfG5/Qh78=
X-Received: by 2002:a67:7993:: with SMTP id u141mr5972278vsc.119.1541871548370; 
 Sat, 10 Nov 2018 09:39:08 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
In-Reply-To: <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
From: Samuel Falvo II <sam.falvo@gmail.com>
Date: Sat, 10 Nov 2018 09:41:47 -0800
Message-ID:
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_093920_346467_49F50FAF 
X-CRM114-Status: GOOD (  19.75  )
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
 olof.johansson@gmail.com, alankao@andestech.com, "Chang,
 Abner" <abner.chang@hpe.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, agraf@suse.de, zong@andestech.com,
 atish.patra@wdc.com, sw-dev@groups.riscv.org, paul.walmsley@sifive.com,
 mick@ics.forth.gr, Alistair.Francis@wdc.com,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110174147.BU3CkVRgleHMYYeEJf0ieMiIT1J3wUHqzVzhzf5-qY4@z>

on sat, nov 10, 2018 at 8:46 am ron minnich <rminnich@gmail.com> wrote:
> which is why i'm a bit unhappy to see this (to me) cancerous growth in
> proposals for m- mode code. ppp in firmware? really? multiple serial

i'm inclined to agree with the overall sentiment of the concerns
raised herein (omitted for brevity), but i feel that it might go a bit
too far.

the bios has its roots with cp/m, i think we all can agree with this,
and there the bios was well-matched to its task: booting cp/m.
nothing more, nothing less.

you had i/o routines for teletype output, keyboard input, paper tape
input, and punch output.  as well, you had basic primitives for
reading and writing sectors on mass storage devices.  and, unless you
were porting cp/m itself to a completely new platform, you never had
to *really* worry about the physical constraints of those mass storage
devices.  maximum number of sectors and tracks were about the extent
of things.  you never had to call back into anything, either.

in other words, bios was a *library*, not a *framework.*  it was
*deliberately* designed and scoped to just deal with booting into a
cp/m environment.

originally, the pc bios was built the same way -- it was what you used
to boot pc-dos (nee ms-dos).

only *later* did massive api changes get lumped into the bios.  things
like protected memory support, acpi power mode settings, etc. all but
required changing the bios away from being a library and into more of
a framework/miniature os unto itself.

i think the real lessons to be learned here are:

1) the bios interface was dictated by the demands of booting and
running a preferred (though not the only) os.  in other words, the
*os* dictated the bios interface.  bios literally was what one would
call a "hal" (hardware abstraction layer) these days.  the fact that
others have technically used bios to boot into other, non-sanctioned
oses over the years is, technically, an abuse of the interface that
just happens to work.

2) bios was strictly a library.  the maximum extent to which bios was
a framework stopped firmly at loading in the master boot record and
dispatching control to it.  from then on, you were utterly on your
own.  note: no security hoo-haw here.  no signed anything.  no pe
executables.  no rom-filesystems.  no dedicated uefi partitions.  et.
al.  just read in 512b to 1kb of raw binary blob, and run it.  that's
it.  from then on, bios was a library first and always.  anything we
come up with for an sbi must, in my opinion, behave the same way.

oh, btw, before people get the idea that uefi allows per-partition
filesystems, please note that os/2 used "micro-filesystem drivers" to
achieve this same effect with nothing more sophisticated than the
partition table located in a dos 3.3 mbr.  don't drink the uefi
kool-aid.

3) corrallary to (2): because bios was just a library, you could throw
it away en mass at any time (and after booting into the os of your
choice, it frequently was).  you could, if you were clever enough with
page tables and the like, even replace the bios with your own image if
you wanted to.  this speaks to what ron has discussed in prior threads
over the concerns of not being able to replace m-mode software.

4) support for multiple devices is not necessarily a bad thing; just,
don't go hog wild with it.  there's no need to support 256 possible
serial ports, for example.  ok, you have a debugger interface, a
resident console, and maybe one more for auxiliary purposes (for
example, my kestrel-3 design so far needs *two* serial interfaces to
the host pc, one which is the user's console, and one which is used to
access mass storage).  each of these devices should have their own
read/write interface, thus making it impeccably clear in the source
code what it is you're trying to do.  no need to "open" things.

my point here is, going back to the needs of the *os* and not the bios
for bios' sake, the interface exposed by the bios should match the
overall expectations of the os you're booting.  in my case, i *need*
two serial interfaces for my prototype computer to function: ergo, it
makes perfect sense for my firmware to provide support for two serial
interfaces.  for the linux, this need not be the case; maybe only one
interface is required.

> the sbi should be hard to add to, deliberately. it should be used only
> when there are no possible alternatives. it needs to be open source
> and held in common. it should be possible for a kernel to replace or
> at least measure it. and, further, there needs to be some work done on
> why you add to it, and why you don't, with bias against adding to it.

i'm reposting this block of test because i agree completely with it,
and want to point out that it doesn't contradict what i wrote above.

> p.s. for interleaving debug and console output firmware, use the
> oldest trick in the book: ascii is 7 bits. since console out is 8
> bits, reserve 128 values for console out, and 128 for debug stream,
> and if the debug stream needs 8 bit for some words, you know what to
> do. it's very easy and doesn't require that we add multiple uart
> support to sbi.

another option is to use escape sequences preceding each output.
escape byte 1 would mean "future bytes are sent to the debugger",
while byte 2 would mean "future bytes are intended for console
output."  this gives you support for all 8-bits (if your debugger
interface happens to be binary), with the occasional overhead of
escaping escape bytes.

trivial to implement both on the receiving and transmitting sides,
possibly even simpler than the bit-7-target-address approach above.
the only disadvantage is that it's stateful; but if you have a serial
connection reliable enough to use with a binary debugging interface,
it'll almost certainly be reliable enough for this too.

-- 
samuel a. falvo ii

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
