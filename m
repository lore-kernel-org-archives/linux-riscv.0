Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EE6C87FCF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GKF4mVRp7F+xk91zdwZEdaPjLghu7lW+vi4spFhfMMU=; b=ZElSUUBaduW1O4cACB9tmXDo+z
	58+bK47xRYoGnYfTxyNcQJcjNyOmYPnx0OeO7vqP1PSNKCvBqvtY0bcX411tArnY2UjVarKYvXT4j
	6TYq4zZkF20dvYPGO27MBfs7BxbZq3ApXto2HLKo1i/b17mNdmfj8LaKVMINhRji1uPtK/CRGQvKd
	MEzPVmvTwe0bsAZjp5MLcbxKF9JBr2H/qZpaqNoSDxt2NYLdap5vZCANvXEDhhy6rNNUaV/iDIuhM
	JyuwcrdC3Dkbse79Y8mC1fAoZNzitw9QjaIHi3jjV1jwExhp1CozLA7NZ8NNxuglOzNSp+/NyBU76
	HP4Lwrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukm91-00000004faU-1VVv;
	Sat, 09 Aug 2025 16:10:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukm8y-00000004fa5-1qAt
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 16:10:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76c3607d960so3354520b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 09 Aug 2025 09:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1754755803; x=1755360603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vm111q7HEdqrlcr65H+xqM79ZO22buScjk8C2vfUtAU=;
        b=MKawuxKqqheTXDNL+icHbOhyb0XYaisMndGST6Mvs8DhCctjmcAGfuK305IwB0qqUK
         hD5dYPzDazhOnqXzSXasXEyKjFz3wlCf8Bwq9KrZ4YxHKJpvmzvlry7i8wlJrUxdLZNA
         tXIdh3aI6k4JPp1EjYZlgiVQ8cFAAyqXzbrEVjKnbPRuvMyHCHUCRNuYAV9mTzfLoiia
         ZT5Q/vFsvm8QFy+KwsiQI3Akoem/mrvpGuPkYD3S1QDAgQcITTttbg49juN+9qhWniNl
         WSMBWfdjQBRxyWaDPpku+E9r8VUBayh++s+icHFoeFoCNQFJrnDCehzKUfCXZmwpQcmQ
         1nAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754755803; x=1755360603;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm111q7HEdqrlcr65H+xqM79ZO22buScjk8C2vfUtAU=;
        b=V9QvL/x3krlIvCofCSiv1CYi8Gj0/NZB91vXYd76gihTzi5CMRcGk2sG4Rmy9VlDvd
         TDWmJtQKCdk/AUYi+6XD90/jJ8e1CaG86gzQuK23J9AYdjgkVRe4j8ukGbW/XtPmG08C
         3PLRhMaaceQx0DkQ8rHjDOS/5bi8HE1USeqnPQDNcw34bFlo3JmygoslAKkKKaXwsVWN
         7gl+ImdVEGDRXdRsuPkQn1/7xdjvHDuAE5qLLo0Z1Dd0w23GLVt0ruJwucF/JXo6q7rd
         ZEll3FDZAFPN/I5gktzBW+4BxMihRs8IdFzID5shXYNaTWqcEV7FLwrZUs8PYd4/lJo7
         aT4g==
X-Gm-Message-State: AOJu0Yy1KEcusdSfCoSQTD4/eAIKcWMRcYi64856OmKR7DC0NYKS6VfY
	qG9C71L9kkYHzPlFkJR104OPpMnp5HgsxLJNll5x1l0ZnGWUi7po1wBKrbaBhM+A+dl+iBjUXw0
	XJGInH8E=
X-Gm-Gg: ASbGncvq57GOzgBKCSGcmSAUCTnu0gy59Z0CvN1rKKZ0Oz/gSM0P0SNaKZtAXii7TNL
	PB2+h9LNqpdsGexsxi7vEhSQXim2JVcwE3wn67/t3GhyOGI2WKXPrt2sFlMGCQj6YX9Q+DQNAyC
	labPmkDMcn1VKfL+wqkzvZeJ2ZF8UvSOf8Ozkq2w9EcL/NKszoEectcsUpmH8O5fMgtoGpbl3u+
	F8CGww9hJnN+/SWkCasmTLtwb7MBpOm51ZS1lBeac5NSCbRF/pqXoLeAAhiZkTKt1iTlYDH5wj0
	Lc8pVW3varjb270jP0MTdFAAFtBfZEVBAMZ/29ceTJACQj2KUz9Bqt4hiYS45lYY9Nfy+auBdWx
	poiIogJIhPwhZ5M2azMYFwp3QWSYx6JRnuIA=
X-Google-Smtp-Source: AGHT+IHIz6p0J1AiyXsleLuls77tX/jAJ92HSf9ZGsUP8iZXambPb+8il8tsfWkoH0Y+WW/deM2Rhw==
X-Received: by 2002:a05:6a21:329f:b0:224:c067:66f8 with SMTP id adf61e73a8af0-240551d6a9cmr10697755637.37.1754755803063;
        Sat, 09 Aug 2025 09:10:03 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31f63da6249sm27246362a91.3.2025.08.09.09.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 09:10:02 -0700 (PDT)
Date: Sat, 09 Aug 2025 09:10:02 -0700 (PDT)
X-Google-Original-Date: Sat, 09 Aug 2025 09:09:59 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.17 Merge Window, Part 1
In-Reply-To: <CAHk-=wjLCqUUWd8DzG+xsOn-yVL0Q=O35U9D6j6=2DUWX52ghQ@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-655602B8-F102-4B0F-AF4A-4AB94A9F231F@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_091004_723794_F0E70007 
X-CRM114-Status: GOOD (  27.99  )
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

On Fri, 08 Aug 2025 21:58:32 PDT (-0700), Linus Torvalds wrote:
> On Fri, 8 Aug 2025 at 21:19, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> RISC-V Patches for the 6.17 Merge Window, Part 1
>
> No. This is garbage and it came in too late. I asked for early pull
> requests because I'm traveling, and if you can't follow that rule, at
> least make the pull requests *good*.
>
> This adds various garbage that isn't RISC-V specific to generic header files.
>
> And by "garbage" I really mean it. This is stuff that nobody should
> ever send me, never mind late in a merge window.
>
> Like this crazy and pointless make_u32_from_two_u16() "helper".
>
> That thing makes the world actively a worse place to live. It's
> useless garbage that makes any user incomprehensible, and actively
> *WORSE* than not using that stupid "helper".
>
> If you write the code out as "(a << 16) + b", you know what it does
> and which is the high word. Maybe you need to add a cast to make sure
> that 'b' doesn't have high bits that pollutes the end result, so maybe
> it's not going to be exactly _pretty_, but it's not going to be wrong
> and incomprehensible either.
>
> In contrast, if you write make_u32_from_two_u16(a,b) you have not a
> f%^5ing clue what the word order is. IOW, you just made things
> *WORSE*, and you added that "helper" to a generic non-RISC-V file
> where people are apparently supposed to use it to make *other* code
> worse too.
>
> So no. Things like this need to get bent. It does not go into generic
> header files, and it damn well does not happen late in the merge
> window.
>
> You're on notice: no more late pull requests, and no more garbage
> outside the RISC-V tree.
>
> Now, I would *hope* there's no garbage inside the RISC-V parts, but
> that's your choice. But things in generic headers do not get polluted
> by crazy stuff. And sending a big pull request the day before the
> merge window closes in the hope that I'm too busy to care is not a
> winning strategy.
>
> So you get to try again in 6.18. EARLY in the that merge window. And
> without the garbage.

OK, sorry.  I've been dropping the ball lately and it kind of piled up 
as taking a bunch of stuff late, but that just leads to me making 
mistakes.  So I'll stop being late, and hopefully that helps with the 
quality issues.

>                 Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
