Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF804C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRxMR8/PDdtoM2CtZXavMWVUS7XCTp6FO6y02ma577I=; b=B6C8VW0yR+Ktni
	D+x0RsFxbI6DegOIWtVDIc5NupgDG3Aqs2Snz0l05k7ohp5hUykszK8SjaQzcsbFiOb41HIc6JbK3
	OafOyYpBbgP5f7f4dmuz/pfXyZz2gxkucrQQoDPPEnRWblAbzHjAouqisGl3S5sZjtwSX+KjLkEhT
	sCrdPLPHCvlKfQO1jozepVTyu2WfT7DIpCgMTP5yL1w4H7rnDwZBTpzjFhmfOJyvJN5UatKTGA2Ej
	vrMV4owbNsyYLmwXkG7cZxQ9tI9aOmjn++7tISmcPCLUrNi+fbYLvBiBL36qjz+X8+lAfYOBf99/R
	irVJM5juW7QTAvcDRjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcbk-00000008Jw1-2YMm;
	Tue, 17 Jun 2025 20:08:36 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcbh-00000008Jub-3QJk
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 20:08:34 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo11922600a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 13:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750190912; x=1750795712; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=EYMPUU3jNga59IOuKfsfRdwKCCyCoojdV7sj5Ce1gVF2RempFIG0XiSzOg/V0OS6S/
         yJv4zjc78R6G0vovHeA7YbVQKLVpbHtBP1DtnOZeVAzvkZyA7ChPnwfDYKt95xjqIeaf
         73+iBjiWlRsm0uNJdFvHkFVH+cwaPZ0edX0F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190912; x=1750795712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=Kv3d+dRsbQJBfnzTCsLe0K7BIzHcR+RH3RBVlsWWRM5qQTrYxsI20p455FpvGW7E3H
         We2xTDsJIL120dceWVoH6O11xSSyGErTQ/tZhYTnIpycw/ggLxkhrr3RcEqQNbR3H5P4
         UDrf2w+Z5m+sePAGSzo7Gjf+qB4GFAEbhWngQJ/e9ch4Lni/tAPsskcCVJCQgdApjFe0
         DQRiyZeIHBt1PY509ibbo6TyRzJPXhO5R9MDQTE9rs30xX1mNMBgY42YV/XDr4/Pgo2e
         a2RZqJyd3FKmtvl9QbcHtCtI3Yn3K63OkbeLClVN84fj0KHhYMtJ4bb3S6yYBPrZgofx
         gQEA==
X-Forwarded-Encrypted: i=1; AJvYcCVXQg5J2KYYpdQjqs99BRDCQmOjoc1VYSqtf6BCVbUybk5KXLorJTNGX6awMpgpCj/j315cGZV5iQe3Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1w+VJcGyhsPIK8hghLocXbHZtE3/S7dNYQSJ29IJMP2WeuQSr
	0sEcDz7deCyhaDoaQqOE9es1CU+AAV/gvG9Kz1u/96mbdqjHCpGXl6ywQGf58AXa+A1aSq0yKSH
	WhHpZNPc=
X-Gm-Gg: ASbGncuNIfrQ4A0eYmCYjhZoZLYw24kibEdkz+OynXPzhJ2d4i9qsLQv22o2O/qLBpk
	8FXPADTNULcy2ZxaTDRJesq4p0nyFVGzwKQtJGtXATfcAgH0cZgFAUErHR2hl+VMrWgspzliBow
	+Ev7kto1iZSKGKqWp5JPwlIcTXvYFWrOepJxxcmFNV0R0jQQN8bkcAz//SvACSM8O1Xza5LazHb
	xEE8I9ZZcJBc+mIoXycpewSInGtj7+O7vOXRJkf2eCA1ofL9ZVbqQBF36t2UgxpR14nivFnBxY2
	APl9HRScU5Jfe/+q3TBlHnmA+URjBDpen9k74EAWtXINZbVNCdJ9YH282jwdEanvz9gUkp7Jhce
	rC8NBajDwDy7YnnyZXAiw0TbyjsLaE5d63Me+
X-Google-Smtp-Source: AGHT+IH4XCyl/056OTehwnNMI1jG/k7xaxN32PeOuAdXLN5Mg+KaMcp94q9Ku6hIhu5blBQk0kYpVw==
X-Received: by 2002:a17:906:f5a3:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-adfad53058cmr1371221966b.55.1750190911626;
        Tue, 17 Jun 2025 13:08:31 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfa7435a1dsm769952466b.110.2025.06.17.13.08.30
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so9403734a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1f1UNawgNMWS3CNg84TI7R9AQxYDMOGP8MFfACoMi+wFoRN7hLvaK8KH0QfUFNoS6rMVFpxN45+vDwg==@lists.infradead.org
X-Received: by 2002:a05:6402:2550:b0:5f3:857f:2b38 with SMTP id
 4fb4d7f45d1cf-608d0948ae9mr13954090a12.17.1750190910438; Tue, 17 Jun 2025
 13:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol>
In-Reply-To: <20250617195858.GA1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 13:08:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
X-Gm-Features: AX0GCFuoL7ATRJ2CnwP4RNLTBvlSmkXnXI8fTIZk-24R8V3-BYf3WTK_tAsCN-o
Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_130833_878732_2663C494 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Tue, 17 Jun 2025 at 12:59, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Again, the tests depend on the code they test being added first.

Sure, and that's fine. We have lots of "this depends on that".

> I could do two pull requests, the first with all non-test code and the second
> with all test code, where the second depends on the first, i.e. it will have the
> last commit of the first as its base commit.  Is that what you want?

Yes.

Or if one single pull request, split out the diffstat with the
explanation (that's the "Or at the very least spell things out *very*
clearly" option). But two separate pull requests would actually be my
preference.

          Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
