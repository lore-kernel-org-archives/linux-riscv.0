Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292D2EF99FD
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 04:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIq4MSGJG+cv/R6W8Y8KfirEoQS2DsEM1HND5SOlhZw=; b=auQ+3tAfbod9Zv
	oJG1vDXihUvhNsD3JW+HieXLP6MnAyCMfZKZtGE7PA5JhdH6KrZnUNGL3Ca+BKYLbfLWd66dNrybz
	7f7mYUHAquF8pls1s+ArbLJqUx6d7P5jL7oWhaGSWkERokZAuhWhdSP5gekrueSYefFUqMMBxUO9u
	YEKT9s0NGrqERepjqokchhtX6nIb1dmueNDT4fRM7rqRdsbTqFxQaas378jc5QDkbz+Bmni0hRnxp
	EM6p/0Os+qPAcrc+b7nra+HhtMuEGQ8JSv4QlznpXx/2DNPU7oPp8Up2GzZRRwqqCCqsfYrbF6dDn
	FMnqkt4dofne/m94c3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr73W-00000004EAr-3cmc;
	Sat, 14 Feb 2026 04:14:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr73T-00000004E9f-2INM
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 04:14:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-65a35fc8007so2615656a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Feb 2026 20:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771042489; x=1771647289; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/O7203x9jfqS7fuIF925ZayuCW24iW6Rua5PCjlltp0=;
        b=MWfeDoEeS8/vJ5L6ueWueO/lyQ/3TWfLJl6qTBJ5y69iLgIeDg7IG2IWHCrq2WMrAu
         ekWsZx8qXRJNR8GtURq8GTfBKpMTqvb/iMBjZ+q9LlhH6LSEk/wPlctd5fhxXtRqjjCs
         dp5AkOkjYLKxvAV4hjk+Nh/hYFkSTniLYHa4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771042489; x=1771647289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O7203x9jfqS7fuIF925ZayuCW24iW6Rua5PCjlltp0=;
        b=RaApzk/nkRJfXwQ4psDIZ1Hsjxko8mQkrZYNclJwedKpoIMO4xnxu2ijRGtL72E7+M
         THLd1wCvurTzKELfXc1pL87VSHMGKSvyNk9mM33zfkaNgpH2R+UfLUnq3Q2ZdPYf6zNS
         ZsART8k/OmSAY9YZV6RoiT4A/7XAtqqv438709aLPI+ba5ZITuKppybGikSEaUBbfMMM
         p0Ukf3xK7synubuZufz4/Kl0e/+9Hze0fa//zX23IwT1Be/sjfP+aLPXvO1ONG0Bzqcl
         Ri3P/jjAWruLZL/tupiVvKV5R881NKxoaPNljq/kQu6dI1YRO0qR499RvNttu3HMvkpP
         ZRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjBcfhgq1RAEv3rbiGm1Jde2HYo0Mg1gboQvWOSpcEWZiI6185qeH+CWT6p5pKbAQ6zkL0amx+pfS7eg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgkhb0/xs5AaUzOPltMX56mz/l0FReYm9rjTcxl3vyfuYG/oKq
	Oqbl0opAv5xDu66amSxhWUAK6Vd5qFeaESrawHfIT4QM/NhsTAkOXtKF0ERaZpI6C18DCjzOcCt
	2bPKwxtQ=
X-Gm-Gg: AZuq6aJ0CftvPlHstIC5wkCSCRlw0CDy/XYQGgqt8sqZdWijUkwgw5ill2/fdXOxENm
	gTART4Pqrt40Lgl3rzPt7K1avt+L6gBhaNTnlVyrITL4JoVDdOHxjjwMURJ6qjNYKDc8nFBtVhL
	wXS5wCyQRMXomI1Vnil9/XsmojwAnGBeRCFYgsIFkh0OwY5X39EWiB7c620aO71tsL3P+LEfS8A
	LfUfjzC0/QEIZ7nRC4h1XWG0ar0SDduYg7ZvXisEi57r2TkYR+J4vbECMsGwuuATwg7sZjR0znw
	rM8elNsm/TVw+B81FbbWQbgxf44EbmTDNIk4iRLYyBRY2pAeKrLwsgnufj5fyq1VHSwvC49m8y+
	rimD8D1S2x4FzZhoQYH+VgmJAufN4ih0KJs3OVVEg0Jw+TI4qGx9TP/Pl9REkq5t9QMvecbZKop
	dSFXg7Fhyz9otyI+uAR3au2gtGMZQWeHZ3X3hbg/ctSOJmEIQ60m9noy1KpwoNNuogjkrsiDNfU
	VWDWdihnNw=
X-Received: by 2002:a17:907:97c7:b0:b87:10fd:b590 with SMTP id a640c23a62f3a-b8fb4548c42mr221552666b.60.1771042488915;
        Fri, 13 Feb 2026 20:14:48 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769437bsm31177866b.61.2026.02.13.20.14.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 20:14:48 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a380b554bso2497221a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Feb 2026 20:14:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxOXUY/2hfiB6zwWYyyubylKKEP5dXkoSYc2rajqdyJjbje5fkXTRgag87hh9LUQgagFz0VpfkW0bMHw==@lists.infradead.org
X-Received: by 2002:a05:6402:518b:b0:659:5c7b:bb6b with SMTP id
 4fb4d7f45d1cf-65bb1156686mr1912602a12.10.1771042487928; Fri, 13 Feb 2026
 20:14:47 -0800 (PST)
MIME-Version: 1.0
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com> <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
In-Reply-To: <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Feb 2026 20:14:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com>
X-Gm-Features: AaiRm52-_fknN9kPLOnEd_MW5oSx-ank15bplR0n4M8C4XAL3BAje6zR0Ud5fd8
Message-ID: <CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
To: Paul Walmsley <pjw@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	broonie@kernel.org, debug@rivosinc.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_201452_046705_F6648784 
X-CRM114-Status: GOOD (  22.47  )
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

On Fri, 13 Feb 2026 at 16:23, Paul Walmsley <pjw@kernel.org> wrote:
>
> > I think it probably is shorthand for "lpad", which is RISC-V thing.
> > Which is complete nonsense for something that is documented to be
> > architecture-neutral.
>
> RISC-V didn't invent that term; here are some earlier CFI-related uses:
>
> * ARM (2019): https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/Learn%20the%20Architecture/Providing%20protection%20for%20complex%20software.pdf
> * LWN (2022): https://lwn.net/Articles/900099/
> * FineIBT (2023): https://cs.brown.edu/~vpk/papers/fineibt.raid23.pdf
>
> If you're okay with keeping the term "landing pad," we could get rid of
> the "LP" and use something like "branch_landing_pad" instead.

Oh, ok. "landing pad" makes sense. "lp" didn't.

I absolutely detest the industry practice of making crazy acronyms
that make no sense - and then every company makes their *own* crazy
acronym to make things worse.

Please just write it out. It's a few extra characters, but maybe it
then makes people understand what it is all about.

When it's called "indir_br_lp", it's just line noise. The most
understandable part of that line noise is "indir", but that's also the
least relevant - noody does this all for direct branches anyway, so
the "indir" part is arguably the least useful part of it.

So yeah, something like "branch_landing_pad" at least sounds like it's
meant for human consumption.

I would have expected there to be some industry standard naming for
this, but if there is, I sure can't find it. Everybody carves out
their own small space of "control flow integrity" and gives it a TLA.

So I can only find letter jumbles that are all different for different
architectures. Oh well.

I do wonder if we should do something like the existing speculation
control prctl does: we have a notion of "prctl_spec_ctrl", and it then
has "subcontrols" for the individual parts (ie PR_SPEC_STORE_BYPASS /
PR_SPEC_INDIRECT_BRANCH / PR_SPEC_L1D_FLUSH).

Although it looks like only PR_SPEC_STORE_BYPASS ends up being
somewhat cross-architecture.

IOW, I get the feeling that we should have a "control flow integrity" prctl.

Because arguably the shadow-stack feature would have fit under that
umbrella - instead of us now having multiple different prctrls.

One subcontrol of that that control flow integrity prctrl to be set
(and queried, and locked) would then be that "branch_landing_pad" bit
(aka arm64 BTI, x86 IBT, and apparently Zicfilp if you're a RISC-V
person).

I guess with names like "Zicfilp" - it really rolls off the tongue,
doesn't it - the notion of "human readable" might be a foreign concept
to some RISC-V designers. They really took that "TLA's are bad" as a
challenge, went "hold my beer", and came up with an even *worse*
industry practice.

Can we please be a force for good in the industry, and try to use
names and identifiers that make sense to humans?

And maybe be a bit forward-thinking so that the *next* time somebody
wants to do a prctrl for some flow control setting, we already have
the infrastructure in place?

                  Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
