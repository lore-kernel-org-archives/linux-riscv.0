Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD12C48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 380D061245
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 380D061245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1ACFPJDA5d4jGLc8li7XDgaYgWAeiDvTr3HvJFz1Xc=; b=LDlypkmWK78hZD
	4oX/a1NdkQtpJ1L8nH6Cti8oJuptU9mQGHUTcvgxrsz9LdD+vEnmcf/20n/7jYwlBxExXQos1nLpu
	ukAWaquzgU5siLmNxcqqeOoroSXoioxw9V8trN3ZyVXbF+B+FLFbznjniVYoFtByzyWFrdVbyZ54j
	Vl/wpfRt24m7uVYtf9bQ8WLEri5TYZ4zQnqtcigZaHZpjpDT2n/2y8x2obWzeK50/P1ECykCzF3BY
	kuUhDrhsaHRDWVlboQ8DPvTp8rlL37rPmubPY+Y3zFW+e5GCcyjDqVeENtSVBfH5cSbRdDeWlcoL6
	T7eZDu0AL/O0eOhkBpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltSij-005mQq-0z; Wed, 16 Jun 2021 10:24:29 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltSig-005mPO-7a
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 10:24:27 +0000
Received: by mail-qk1-x735.google.com with SMTP id u30so1987901qke.7
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzHc6WO6mMVE18e1Hu2zXOuCxvYGCISfnNTTpoaRCjc=;
 b=Uup97+GxFYt+JQByLgZDSW9o+/Jhq71m8xhCP9Bp/8PH7UKYzpJpXtT42tLm6oPvsR
 KInCZq3j1fKVvceYabwXSkv/UybGqPOL0UhNikwQmQ4JAiYTO3uC6g+VxIwAHhnOG92r
 JUGlk84b1KkYs/vtg0wbhuSYvzNMqKQK2NtKmcP7upRoeswAA9xkzb/lxfJSNx7dMdVM
 /1rjhDvSE8IKyfP+bEaNoYWhlHldQ130ZDvhDftNiO4sxl/pos3KDWeCQrHRjGIWtH5m
 NQa8vyfMLiUfp4ELLJELboD/odTzjJiTVBEUKgj5U4g/mHU8kA2myCK836JAKvBNXh4X
 5OmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzHc6WO6mMVE18e1Hu2zXOuCxvYGCISfnNTTpoaRCjc=;
 b=ISNMD36pDGQET/rf/3R77ILjkIptGGGs5KFHAgYx/pF+5ERPCXsP+UUUM1XSaiM4t6
 F751LCKig8+7kaVJm0Jl3128e918oP9hGvNoNzuIN+AeYgLpGRL++AycXTkjwCX8BWPi
 Z+bWj+xiGf8MsrubSMGbnyAZJH9Jg2J4tDAEYLCy33tx/E4mmy4n6u2g9uBM42lYPmLF
 zPuOBOVuEM/NtheisnTmcXoi964GpusKEDTe20zpKoXPiBSzn0cwRHY0bhRXHWgX/JzK
 CghwVWaU0+hlZabSkUr16bPOfAioeZ0ukq7tb1Xg3Mb0tr1NmnVYHCtmzQc+tcSfehaa
 oiWA==
X-Gm-Message-State: AOAM5327f0YIXbhlaf0ZOWPfSqBgVsW//ZO2v3zVmuWDETkq8MvB99N/
 TIl6vRzQEO3fJBaIH3/JBvDkUI9CCrls2b4OgzA=
X-Google-Smtp-Source: ABdhPJxTd4Y6r8mDxcDh6ZxSoxhyILfYmP6R8v6TCCUjFva4m9WBJcCzXn3KkEZ6wswT7e41iPGzLzwgc938AAiN1tM=
X-Received: by 2002:a37:f50d:: with SMTP id l13mr4398441qkk.298.1623839064737; 
 Wed, 16 Jun 2021 03:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <67dab8dc517f4add8b0c29074a6b3f06@AcuMS.aculab.com>
 <mhng-e4f1484c-052f-4981-83f9-3884ee4d5ea0@palmerdabbelt-glaptop>
 <de82d455e12e44898a6f14a3885d9f0c@AcuMS.aculab.com>
In-Reply-To: <de82d455e12e44898a6f14a3885d9f0c@AcuMS.aculab.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Date: Wed, 16 Jun 2021 19:24:12 +0900
Message-ID: <CACuRN0MhtaR+_zngS1WpNSBq2soJpMgLTWmWLSQoq=FN97AVeg@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: prevent pipeline stall in
 __asm_to/copy_from_user
To: David Laight <David.Laight@aculab.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gary@garyguo.net" <gary@garyguo.net>, 
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "nylon7@andestech.com" <nylon7@andestech.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_032426_316223_183592EB 
X-CRM114-Status: GOOD (  37.20  )
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

On Sat, Jun 12, 2021 at 9:17 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Palmer Dabbelt
> > Sent: 12 June 2021 05:05
> ...
> > > I don't know the architecture, but unless there is a stunning
> > > pipeline delay for memory reads a simple interleaved copy
> > > may be fast enough.
> > > So something like:
> > >     a = src[0];
> > >     do {
> > >             b = src[1];
> > >             src += 2;
> > >             dst[0] = a;
> > >             dst += 2;
> > >             a = src[0];
> > >             dst[-1] = b;
> > >     } while (src != src_end);
> > >     dst[0] = a;
> > >
> > > It is probably worth doing benchmarks of the copy loop
> > > in userspace.
> >
> > I also don't know this microarchitecture, but this seems like a pretty
> > wacky load-use delay.
>
> It is quite sane really.
>
> While many cpu can use the result of the ALU in the next clock
> (there is typically special logic to bypass the write to the
> register file) this isn't always true for memory (cache) reads.
> It may even be that the read itself takes more than one cycle
> (probably pipelined so they can happen every cycle).
>
> So a simple '*dest = *src' copy loop suffers the 'memory read'
> penalty ever iteration.
> At out-of-order execution unit that uses register renames
> (like most x86) will just defer the writes until the data
> is available - so isn't impacted.
>
> Interleaving the reads and writes means you issue a read
> while waiting for the value from the previous read to
> get to the register file - and be available for the
> write instruction.
>
> Moving the 'src/dst += 2' into the loop gives a reasonable
> chance that they are executed in parallel with a memory
> access (on in-order superscaler cpu) rather than bunching
> them up at the end where the start adding clocks.
>
> If your cpu can only do one memory read or one memory write
> per clock then you only need it to execute two instructions
> per clock for the loop above to run at maximum speed.
> Even with a 'read latency' of two clocks.
> (Especially since riscv has 'mips like' 'compare and branch'
> instructions that probably execute in 1 clock when predicted
> taken.)
>
> If the cpu can do a read and a write in one clock then the
> loop may still run at the maximum speed.
> For this to happen you do need he read data to be available
> next clock and to run load, store, add and compare instructions
> in a single clock.
> Without that much parallelism it might be necessary to add
> an extra read/write interleave (an maybe a 4th to avoid a
> divide by three).

It is becoming like a computer architecture discussion, I agree with David's
simple interleaved copy would speed up with the same hardware
reason.
I used to get this kind of confirmation from cpu designers when they were
working on the same floor.
I am fine either way. I used the simple unrolling just because all other
existing copy functions for riscv and other cpus do the same.

I am lazy of porting C version interlive memcpy to assembly.
I wrote in the cover letter for using assembler inside uaccess.S is
because the
__asm_to/copy_from_user() handling page fault must be done manually inside
the functions.

Akira


>
> The 'elephant in the room' is a potential additional stall
> on reads if the previous cycle is a write to the same cache area.
> For instance the nios2 (a soft cpu for altera fpga) can do
> back to back reads or back to back writes, but since the reads
> are done speculatively (regardless of the opcode!) they have to
> be deferred when a write is using the memory block.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
