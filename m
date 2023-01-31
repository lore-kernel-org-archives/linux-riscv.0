Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023A3C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 21:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjWv+b9gSfJ6sT2zw2hdZ2TxHpfjDMuOnGsMHFcHrwg=; b=Eo1ZRgbGUADzFu
	CRxyX98uRhAPfA1LOVlxUapsUvJCoW1PxZvtxyTXfkTo1y5EqDKxT1sGNGG2IMUeBrnpMPuuC2UZ4
	nH5T4mwEKUs1006Xm5t7cDOn7PH/ZsJroDgu9d8FK/pD4JuiGJ781JYll2wJ495hFbJuGe4LEoXKj
	9yFT3aWdU6FUHRBRNYwfixHfOKqhNqMHH3REl9n/s3NLlqUL2k3zprX8j5Qu1BhduWLfgD9ckJ8/z
	2SL5el9Q0UPQBntieqw+iSab/XqelqmV8vLlk4wnrSCAqOUiSu+KV21Oca+W91ik93lekq8mIKwt5
	PSi0w88kOhJwRb5duGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMy3D-009Ocn-II; Tue, 31 Jan 2023 21:20:23 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMy3A-009Obp-1D
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 21:20:21 +0000
Received: by mail-ej1-x635.google.com with SMTP id m2so45106334ejb.8
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=Dpi5P8qHqM77HLr6Rm7qlkY2hnNNuC+GOleUP2NCen/4mi28taFHpUtYN0cOaJeZqx
         TB+exnjSVIKaLaZsJwKH3MCWKlHsO2N7zm25f17K7ur8C/IEegLECG6U0Z6AXLDaZrfK
         1kGvyREHSxwc1BrFIiYNgaqGXrqrtBtRmci5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=PnaHewRSjTgnL36hS6b7q7MoF3huoZBqwlVVKmlYjV3VGG9B4+3lbHnR1m4wpqY6V4
         0GWgT1/mpiFNk8M4fFVo2gahSPH3He8wQQZ9yeCAla3d+LYij0eo8opbPnKEDupxaKCW
         ZKNA9C9TAbGhsUC3vlYCRQHZC4m+WFYx10EbHWXZw2qSD5ZxcP7aBUpmfJCoeiNvYeSr
         K8YCd7QgeqSd1KYnZ3pFPHQz4FamosIBa/f2ps340KxrLEuGrp0fLMv8CwnPf4GLVrXW
         7reEAIuprzJPuRqXsz2bwka4QPFFXu59eqC7dfXeNG9WFLR02akCPqshcs1BYb+zhBrr
         OyFg==
X-Gm-Message-State: AO0yUKXSKFJWaf9cDxp/BfvWFcY5uMIz6cCbXsVNvMv3FgEpTH43+BI2
	e7rP8K/ogTac47Fg66Dl4i9yWr+XFotMpDt67io=
X-Google-Smtp-Source: AK7set8BrpSniLDV79uv14hmzQk0WarPU6ZZ49nXMppgIjTmnintFfdi9lU8ooXtcT1Rnjl0g4Snmw==
X-Received: by 2002:a17:906:d8ce:b0:87b:f7dd:792f with SMTP id re14-20020a170906d8ce00b0087bf7dd792fmr4526039ejb.8.1675200017225;
        Tue, 31 Jan 2023 13:20:17 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id ov9-20020a170906fc0900b0087bdae9a1ebsm7414662ejb.94.2023.01.31.13.20.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 13:20:16 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id hx15so26031542ejc.11
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:20:16 -0800 (PST)
X-Received: by 2002:a17:906:1e94:b0:889:2908:a9c8 with SMTP id
 e20-20020a1709061e9400b008892908a9c8mr2233010ejj.82.1675200015978; Tue, 31
 Jan 2023 13:20:15 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
In-Reply-To: <Y9mD1qp/6zm+jOME@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Jan 2023 13:19:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_132020_102800_8F0B9E42 
X-CRM114-Status: GOOD (  14.03  )
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

On Tue, Jan 31, 2023 at 1:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  What about the semantics of get_user() of unmapped address?
> Some architectures do quiet EFAULT; some (including alpha) hit
> the sucker with SIGBUS, no matter what.

I think we should strive to just make this all common.

The reason alpha is different is almost certainly not intentional, but
a combination of "pure accident" and "nobody actually cares".

> Are we free to modify that behaviour, or is that part of arch-specific
> ABI?

I'd just unify this all, probably with a preference for existing
semantics on x86 (because of "biggest and most varied user base").

That whole "send SIGBUS even for kernel faults" is certainly bogus and
against the usual rules. And I may well be to blame for it (I have
this memory of disliking how EFAULT as a return code didn't actually
return the faulting address). And realistically, it's also just not
something that any normal application will ever hit.  Giving invalid
addresses to system calls is basically always a bug, although there
are always special software that do all the crazy corner cases (ie
things like emulators tend to do odd things).

I doubt such special software exists on Linux/alpha, though.

So I wouldn't worry about those kinds of oddities overmuch.

*If* somebody then finds a load that cares, we can always fix it
later, and I'll go "mea culpa, I didn't think it would matter, and I
was wrong".

         Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
