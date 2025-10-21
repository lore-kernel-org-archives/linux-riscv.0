Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C483CCD1BC
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 20:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l42uU6nmSbYU0pVTIlR4NVZTdnOqQ7VQKdYuGWSZOEc=; b=lYtOdWT8PpM/Iw
	aTyv8Cjm392z46p3esk2FT8oTyv7DhdAZGw5P84XQOpd1C9+fHh12nDrW2o61O6HAAGe6SbPRMMqr
	FlXMYM2MnAcPPHxlPoqDASNAE8lAt5AOq/+9qrE989jRGHaTXFAzCj2l72m/m/IQBlaDiRijF9TAB
	J4bI2xSJaRN1oL5tdy/Lu5/Blhtf8QpIoag2Hpgo55AhNElOHqJxJLQ7/7LGCVOw7prPY/kK39k3P
	XErIsapEbKmyXovJttuPvgeKEaUmTueb/u4Q/vG2GQYWTcXX3p/YxJBx6BhyULI0LsPVlQ9wwXKlT
	yVg0LJNRFxvZvlMadyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJLs-00000000dq7-1Exu;
	Tue, 21 Oct 2025 20:53:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJLo-00000000dmy-3fRk
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 20:53:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47106fc51faso71605245e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761079979; x=1761684779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=;
        b=EitVobE1VU54q0w8+NZypQVqSZUhkmIY0i0CIGKlhamOHBsPy4DFVdnbWCCDs+EwIG
         WPHypLYHlUi4umSBbGk3zQQdiJknc0XyzUWJtA12j7QnmWbeODFWX5ywwQiRaWGOD6ha
         5+MvOZI5doOtX6TwTh0bnbdDRf10lBtYPOhi7uQEv9Fzc9me7qdLMIv4XmIZBIAyxD9L
         QYZYRF5y0fiHnAjRuC8TvCaJHvNlWmEGzeGiJiB+UMsA7fmLiTI9tmb59uugrdg1Jmge
         4+sl3GUB5sV6hTuPX26+WgBct88n0swcy2VNRJtgLSv7MLPclFDwlnxc+D40tIMfCbBm
         bLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761079979; x=1761684779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=;
        b=ZCuPgcsweeDxxr0O7esH2r9sbBZ1rdKv4NxYmvhVkDztQwvC57FX0dkt0tNSWHoQqh
         +4TkI7jVtcZOrTktwCBRwMXd6Tjm2sju8fyXwsFx+dFAKhwlv0U07mM5qmU6uxnGAIft
         ++UNQg+YPQAmpZDkNbjPWn1tUB4SLFmUPgYHV5o185gz0cqZJTh8av9q6sSBEpkaZM8y
         675nVINhdx+RFk2JLxbFy2WWfJVdcfbawYduKs5xRcxRCOLx/iM0YkkeFGcEq2k6qu80
         Kz79uUqYq77tDXxK7cfiDqGiltBrceKtmMilAIWdNLLE6vw7njMEVflIfJBQ5UNMpV3o
         cCFw==
X-Forwarded-Encrypted: i=1; AJvYcCXLZrXkefHfm02dCQeNGFvzQ/7JQAsqxpi1KtTUu/aj8FrfK/Bje27bnuolDtKllAhUEi7DL1weDZGN/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx43kbA6/XUEgOl8cENrJtnfIqITDU0V4fly0Vb39ukEUxBXwIC
	zomyGAbfkxEOgcGwdnV/bwaqsy/rgKS9nYplWIc9XyiJUenUL8MWS/4F
X-Gm-Gg: ASbGncu1LQ5sfxWnTnZ3ao6PbOO+pN5QiC77L/qK4qo7cWKDtNlIrxwVxGl/HnHJzGZ
	2gZ7ySdy7caAUDZNry4vIawpqFHN2pPPGiLkPfPSLSRKBcbXWpQ37yyEseLsgU7AD64Y2Z/KaiM
	5UqUkYYzHLTi/JJA8GqMxRQzVTJWNE4vrAiRB+8lH3d8EykpF9WxlTgxmPAKk9T9nLor8s8IZT0
	WCeqFYmPPefgFDdaT36s9F+EejlVe4C7wwRpHuXBTEPFP03K4JMXnXNTTcbkKyg+BOgOd2bU/IS
	+6XjCyZ/q8m3OGt5l1T6LUZjroQjFWSQw301kuYPp4UcdTs5iouf4ilU7SKio/42a9ZGx64yTmc
	H3kXEM9A1hUKVAQ5d+cbhfIZ5iKx8Rn7vnxs8gqcqFmpfAhKWj5PTs0u43LNVd2des9/abC5viI
	J6kcuAoCZ37JsjjMvPoi3Iie/4KxOCmtnhCG0mcVwU/4MBTZ9KzN1T
X-Google-Smtp-Source: AGHT+IG48cx6eMc3yWVGBT0daBkOovb/80ZhUVtFTOZrtyO8Rw6UMLlSBk12jg9YEQoOEfu4lRZoog==
X-Received: by 2002:a05:6000:240c:b0:3fc:c90d:9957 with SMTP id ffacd0b85a97d-42704d6c585mr13473049f8f.16.1761079978558;
        Tue, 21 Oct 2025 13:52:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a797sm21895076f8f.27.2025.10.21.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:52:58 -0700 (PDT)
Date: Tue, 21 Oct 2025 21:52:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251021215254.673dbd35@pumpkin>
In-Reply-To: <874irsz581.ffs@tglx>
References: <20251017085938.150569636@linutronix.de>
	<20251017093030.253004391@linutronix.de>
	<20251020192859.640d7f0a@pumpkin>
	<877bwoz5sp.ffs@tglx>
	<874irsz581.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_135300_941320_EB8A335F 
X-CRM114-Status: GOOD (  27.28  )
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

On Tue, 21 Oct 2025 16:42:22 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, Oct 21 2025 at 16:29, Thomas Gleixner wrote:
> > On Mon, Oct 20 2025 at 19:28, David Laight wrote:  
> >> There is no requirement to do the accesses in strict memory order
> >> (or to access the lowest address first).
> >> The only constraint is that gaps must be significantly less than 4k.  
> >
> > The requirement is that the access is not spilling over into the kernel
> > address space, which means:
> >
> >        USR_PTR_MAX <= address < (1U << 63)
> >
> > USR_PTR_MAX on x86 is either
> >             (1U << 47) - PAGE_SIZE (4-level page tables)
> >          or (1U << 57) - PAGE_SIZE (5-level page tables)
> >
> > Which means at least ~8 EiB of unmapped space in both cases.
> >
> > The access order does not matter at all.  
> 
> I just noticed that LAM reduces that gap to one page, but then the
> kernel has a 8EiB gap right at the kernel/user boundary, which means
> even in the LAM case an access with less than 8EiB offset from
> USR_PTR_MAX is guaranteed to fault and not to be able to speculatively
> access actual kernel memory.

It wouldn't be a speculative access, it would be a real access.
But 4k (eg a single page) is plenty for 'reasonably sequential'.

Pretty much the only thing that has to be disallowed is a reverse
order memcpy() (or one that accesses the last bytes first) for
copy_to/from_user() if the length parameter is ignored completely.
Linus wasn't brave enough to remove it from the current version
of access_ok().

I do wonder if any other cpu have the same architectural issues
that required the guard page between user and kernel on 32bit x86.
(One is a system call at the end of the last page.)

LAM is one reason why 'masked_user_access' is such a bad name.

	David 

> 
> Thanks,
> 
>         tglx


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
