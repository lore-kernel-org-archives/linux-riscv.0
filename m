Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D51BC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221E16101B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221E16101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0V5IdASRJUPSU8fSNOyVj5sNG73SRAhZHMuYFuMjHA=; b=Xx8fGZ9+gm3hlZ
	cxetwJV6MA9iHNueIpGQPm343OC0xM044nvpv1EYc8RSZAr1CmxpnmIbdIRVd34mZ7zWrBSnXcXOD
	nyeIgItu+lZ/ZU2/IvT+by5Q5riUK4CvI8CGT6Whag/sL/Hd7jObVl7SARmLwWcKpkZSoTRcdssyE
	H8tUF9CmwKYYV4aZp5Gnwz/fAFjAMa8ecWD2rmJMj/04RQYk40j51AKiTh6crGDRIcnDY99tss06d
	3Z//Opc8iRolroquKcVZoLs230F+Fx55yXDmZ62sYZQ+W0hgW0VLPKZFRCO9B0LJHF52Uhl0IoD+g
	XPc2bPNUvXAt3ofQKYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltST6-005iBa-DK; Wed, 16 Jun 2021 10:08:20 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltST3-005i9v-Q6
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 10:08:19 +0000
Received: by mail-qk1-x731.google.com with SMTP id g19so1991308qkk.2
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wcF1KIN/sST+nKRNaO+sXfmpTGCVE77zQuH/o+QoKck=;
 b=civo79LBCVjD8HaawhbWNgTNs5SepV68owTaENJLtEdCBQ6nY/IvmZd4GGH5SNb69A
 5CilidPV7dJ9U3uf4KKw6d33QonWx4MgSzb0xSxqzxBHr8Bo224YkhU5mrV2An7+gJui
 u2KoGkg4ktDfGJMfa0RXiTdLVcBuwlOZ/vBKnR4OphSDgoqjZsJlpLNzm26/vVsUnk+i
 z4bMwP+0LS6fV6f+3hcaIlMS1D7L9EiQ0hyt8t5BxCrjFgAKQuipzA6G4UhhK5FAIg30
 8dHuyDKTws3WLO6rHznKXHbqxoqY4WQQ07nAg2rPZOTxzASkFKZNi7mW3azn7fUIK3bT
 rTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcF1KIN/sST+nKRNaO+sXfmpTGCVE77zQuH/o+QoKck=;
 b=IGlQjGxsMc5bf7FA2E/3CfiKgcoOcMaGZvyYF6PMB6bZZ5dPvJ/Q6sYZlfBEFR70xf
 f4ngE+WyrTIFaFRxvCJBbZab144iFcKj95tDCA/tTtLu3dxHAdBGKj1E/2bHuKxwx9yg
 ktn85HVZstr7lOVbkw6jJenvhUNpS1j0NEVP1jQPt8RG1KyhXbO+B4AunqZR5vgzQS+6
 RhmEpTl4oXRlBHyX/Kk8qL5VPb55rQxSXetoy70m/JC16nodoVFy48uhAITFE3tDEAmc
 DVky5ewVX283+gmK/0eLBK2Er0dNNqG015X3+ozsGUtLz402sqt+OwOzGVNWlrSNLsVz
 XU8g==
X-Gm-Message-State: AOAM532KlxDWnsxB78133DrjMloxhSlfoT08Eplyi0KddWg4fkVsMJYW
 y6PwY3IfbAX2Xa8ShDMHN0Xsg7fptY09kVuj/Rg=
X-Google-Smtp-Source: ABdhPJys78nF5ZRX7kVKSBbb9l4KBV4jYchnx3SG9sfQe1ZJ4yLjRb5K9kDLn8mpAtsC8bxcRklMNAmPtsgOf2aoXxU=
X-Received: by 2002:a37:f50d:: with SMTP id l13mr4331301qkk.298.1623838096013; 
 Wed, 16 Jun 2021 03:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <67dab8dc517f4add8b0c29074a6b3f06@AcuMS.aculab.com>
 <mhng-e4f1484c-052f-4981-83f9-3884ee4d5ea0@palmerdabbelt-glaptop>
In-Reply-To: <mhng-e4f1484c-052f-4981-83f9-3884ee4d5ea0@palmerdabbelt-glaptop>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Date: Wed, 16 Jun 2021 19:08:03 +0900
Message-ID: <CACuRN0MK4Em7+5EpPcwCs1q01oHcpALTZWY4PrSDTFFQC2LX-Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: prevent pipeline stall in
 __asm_to/copy_from_user
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: David.Laight@aculab.com, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 Nick Hu <nickhu@andestech.com>, 
 Nylon Chen <nylon7@andestech.com>, linux-riscv@lists.infradead.org, 
 Linux kernel mailing list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_030817_906949_E2AD0620 
X-CRM114-Status: GOOD (  26.76  )
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

On Sat, Jun 12, 2021 at 1:05 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 08 Jun 2021 04:31:40 PDT (-0700), David.Laight@ACULAB.COM wrote:
> > From: Akira Tsukamoto
> >> Sent: 04 June 2021 10:57
> >>
> >> Reducing pipeline stall of read after write (RAW).
> >>
> >> These are the results from combination of the speedup with
> >> Gary's misalign fix. Speeds up from 680Mbps to 900Mbps.
> >>
> >> Before applying these two patches.
> >
> > I think the changes should be in separate patches.
> > Otherwise it is difficult to see what is relevant.
> > It also looks as if there is a register rename.
> > Maybe that should be a precursor patch?
>
> Yes, and I'd also prefer the original patches.  This also doesn't apply.
>
> > ...
> >
> > I think this is the old main copy loop:
> >>  1:
> >> -    fixup REG_L, t2, (a1), 10f
> >> -    fixup REG_S, t2, (a0), 10f
> >> -    addi a1, a1, SZREG
> >> -    addi a0, a0, SZREG
> >> -    bltu a1, t1, 1b
> > and this is the new one:
> >>  3:
> >> +    fixup REG_L a4,       0(a1), 10f
> >> +    fixup REG_L a5,   SZREG(a1), 10f
> >> +    fixup REG_L a6, 2*SZREG(a1), 10f
> >> +    fixup REG_L a7, 3*SZREG(a1), 10f
> >> +    fixup REG_L t0, 4*SZREG(a1), 10f
> >> +    fixup REG_L t1, 5*SZREG(a1), 10f
> >> +    fixup REG_L t2, 6*SZREG(a1), 10f
> >> +    fixup REG_L t3, 7*SZREG(a1), 10f
> >> +    fixup REG_S a4,       0(t5), 10f
> >> +    fixup REG_S a5,   SZREG(t5), 10f
> >> +    fixup REG_S a6, 2*SZREG(t5), 10f
> >> +    fixup REG_S a7, 3*SZREG(t5), 10f
> >> +    fixup REG_S t0, 4*SZREG(t5), 10f
> >> +    fixup REG_S t1, 5*SZREG(t5), 10f
> >> +    fixup REG_S t2, 6*SZREG(t5), 10f
> >> +    fixup REG_S t3, 7*SZREG(t5), 10f
> >> +    addi a1, a1, 8*SZREG
> >> +    addi t5, t5, 8*SZREG
> >> +    bltu a1, a3, 3b
> >
> > I don't know the architecture, but unless there is a stunning
> > pipeline delay for memory reads a simple interleaved copy
> > may be fast enough.
> > So something like:
> >       a = src[0];
> >       do {
> >               b = src[1];
> >               src += 2;
> >               dst[0] = a;
> >               dst += 2;
> >               a = src[0];
> >               dst[-1] = b;
> >       } while (src != src_end);
> >       dst[0] = a;
> >
> > It is probably worth doing benchmarks of the copy loop
> > in userspace.
>
> I also don't know this microarchitecture, but this seems like a pretty
> wacky load-use delay.
>
> Can we split out the misaligned handling fix to get that in sooner,
> that's likely the more urgent issue.

Sure, just give me a few days.

Akira

>
> >
> >       David
> >
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> > Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
