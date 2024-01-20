Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76154C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=67ajlGMSFe1d2mKhkEYgnAkM+GYixfkGXBafoB4nXts=; b=h5Vji/Iy2gRFJGqq+UwOiIpC1D
	BgN7RkC50KovIHnKlezXTPjQn8MCrvBE6d6Cw2tOco28t93eVixj7iIA1iBmaQYmbFHuOUtItlW8c
	Ea/87dwqLpfr6v7gKPfFGjbUGsj//9toQL0cZP8JWZ90n9+hoNAgmvHEKa+narZt6RkrqhNCme2Wg
	UX9t8Mh1lzQwEx7BUTtCdZ6LQ5ag3lWO5/cHtUh638mQwqzho6q2o+hSCGKHtfmzffjB201qWIHui
	96K7dJD4uhTjZ9TBUQqBpTAonwJSj08e9aO/19uh/d4tuVN5K9ZP5S7HY+gQ3acj/Y0eGgIM4KrSh
	v6G+eWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRFvI-008Cd1-32;
	Sat, 20 Jan 2024 18:18:28 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRFvF-008CcQ-1N
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 18:18:26 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6dd8cba736aso1223142a34.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 10:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705774643; x=1706379443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMn1BToJweaOcxOlaPFoVzSkf5fWzkYqaJwxOtEOARU=;
        b=t6TGKbyIayasmdjhplAGUgbhEyAtD33LUuKc44k8bQMSeDuMNb+dG721YrQFTe4MtD
         FHkctWIFTcn4JKFuBHC076iYdJbAP6qhYjdwiVOxurme5zZg8J0bRHkPumvg3NFuO3EW
         mU3zVGYMlhNcgbQ0d2aoJ+5iBJZEfTfaeMIsCG7yT2QqtUZvn6lpu4NnieSAkiPf8aUn
         kcSnY+VqFK9Gv8od91OaCuI0LK4QIdUQ6RbtZ6uQstCt65EYJ47082b8w47OYuu7C/og
         6VSeuUAHN2IpGSqiO1ihX0RzgFAHVq3zzTwYmNbnRd9kcSvjs0D9+lrmy6xQ3qRtykUF
         TujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705774643; x=1706379443;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMn1BToJweaOcxOlaPFoVzSkf5fWzkYqaJwxOtEOARU=;
        b=fMvZOwHEAhPzteCpqBbgeH1IVI0v+1nFCmQlOeFv5ntL+NOiOujgt97yy49eyJRh/1
         k6ti3Cpw680Fw6E0P4omCXCU5pTPEi8v0doWcMjm/ovDF7c7h89yp7TOBFcK4QkQ2Vd1
         8oJEIwMmcHvX3aATMfgMGUVo9pIswlzsWImz/8pSIuE3wkM3Z2eg4uGFEV0ykAwx3Sx4
         TNZ9+ysUPAti12QHdBF34R5WrhSX7wJOcwGaqY6DadCqfd7ZiPGY8sEJnNZ4ukw0i7Qn
         ZcDgkElAuvyBcZTBa0YtjmcHl/w4txD1WDeubHt0/vvLqTld2NPRnq4edh1udcftjSSH
         VfYA==
X-Gm-Message-State: AOJu0YyHf4X2TaidAPquuxwEV4QSbjsYP5xVabqlWw5GegK7EqxpxkFv
	iHEIQej/bvP5pEcqWYhUEerBWhLLUWz9hLH1198tZ4KapHp/IXOq0BdOAvfI/SJkljqNiMxYPK+
	U
X-Google-Smtp-Source: AGHT+IEum8xz+FQyjPn5YMF2KgAk6IYGtXt+WEaAbqQ608bG4G6PJg/dlD4Iy3ZTC8KPmWj5nOaw5Q==
X-Received: by 2002:a05:6808:2227:b0:3bd:99d1:e22c with SMTP id bd39-20020a056808222700b003bd99d1e22cmr2077156oib.26.1705774643490;
        Sat, 20 Jan 2024 10:17:23 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id sl7-20020a17090b2e0700b0028bbf4c0264sm6339947pjb.10.2024.01.20.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 10:17:22 -0800 (PST)
Date: Sat, 20 Jan 2024 10:17:22 -0800 (PST)
X-Google-Original-Date: Sat, 20 Jan 2024 10:03:11 PST (-0800)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 3
In-Reply-To: <CAHk-=wimDL8m=hETgzazd4W23PtBQ_K=E80mkuqhx0H=8BpWQA@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-14d0b845-9a7e-49aa-b151-7f123a51e0db@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_101825_463980_3E31E023 
X-CRM114-Status: GOOD (  25.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[Moving this back to linux-kernel@vger.kernel.org, for some reason I changed my
alias to linux-kernel@subspace.kernel.org which doesn't actually exist.]

On Sat, 20 Jan 2024 09:42:08 PST (-0800), Linus Torvalds wrote:
> On Sat, 20 Jan 2024 at 06:52, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The last one is particularly clunky, as I've just squashed the fix into a merge
>> from your tree.
>
> _Please_ don't use back-merges to pre-merge things before sending me a
> pull request.
>
> Just let me know about the semantic conflict, and send your tree as it
> works for you. Then, as I merge your tree, I can take care of the
> actual conflicts.
>
> IOW, I really _really_ want developers to worry about *their* changes.
>
> Yes, linux-next is then there to give a heads-up about how these
> changes end up interacting, and you should be aware of it enough to
> send me a heads-up. But that's literally all - you should *not* then
> merge in other peoples changes into your tree.
>
> IOW, a conflict with other trees that got noticed in linux-next should
> just result in that note to me about the conflict once you send your
> tree to me.
>
> Not a random merge of a random commit that came in through another random tree.
>
> One result of that random merge is then your messy diffstat. Your pull
> request claims this:
>
>  443 files changed, 7415 insertions(+), 4420 deletions(-)
>
> but that's literally because you got that random noise from pulling in
> the state from the tty tree that had *nothing* to do with your RISC-V
> changes. The real diffstat if you don't have that last merge is
>
>  71 files changed, 2678 insertions(+), 215 deletions(-)
>
> and ends up looking much saner (ie it actually lists just arch/riscv/
> and the incidental changes around selftests etc that actually happened
> in your tree).

OK, sorry for that.

> So please send a new pull request where you just have *your* tree
> changes, not a random back-merge.

I think it's actually pretty simple for this one, I'm just backing up to 
the previous commit (as that nasty merge was at the tip of the tree).  
So I've set along 
https://lore.kernel.org/r/mhng-878cc879-7aa0-473f-91e4-8288072cdd4e@palmer-ri-x1c9/ 
, which doesn't have the merge and instead just calls out the diff in 
the comment.

>
>               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
