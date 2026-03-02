Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6359EB3625
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 17:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afTm1b7o25ACtjl6cvdJhSzWUO/Xsg5WOM36Dfgtcxo=; b=krivfw/biRElf0
	x8mqlo2+ElCu8bT1vLS/CL/fF1pz47fYrPP+B77QXUtxxckecydbJT971yk/Wp+k4GOSgaN+2ptVA
	CyMBtYn3wRt13UiZV8Pckhvp9uSkJNPFgAlUUtwVS1KwCY7v4Cfl4VWEpw1vcbnH9CysZo9jPj2os
	Mv6SD7RgFhczMVChd2lbnwsHmgy0VXuUuy8q3B+xLGJzV0btLQpigKrD8x9FVARMV+fpE/gKsMhg7
	sm0m0ng7r/7YhRaJIF+grDoJ9tnodIRe9hspGa65HrZ9ZVcwEUP9en2aDndmCBxoS+5kJo+twefpF
	EMyeRma9tHYwlFM/k9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx70m-0000000DaP1-1V5Z;
	Mon, 02 Mar 2026 17:24:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx70k-0000000DaOC-2mAd
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 17:24:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b934fdced05so629592866b.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 09:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772472288; x=1773077088; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=;
        b=L8fF39lVtfjudgCnRed1AalCSs1DU2u7mok1bKS6g16hZtbXDv5saD1ZFEqCGzZN5e
         VzC+rHju64ykcZu3k2OxQv7SkGP7YhtaCvsKqwkjMlxJNrA1ciHHW8FjxAevRwPbDtqc
         WIkHlr6ctHEr4Nv4TY/CM05ASfZDa+AAdGJbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472288; x=1773077088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=;
        b=YOoCz0gyruX5ZED4f/bi4HNdLteIKOku/nBlGLJaB0xOfoj7oyvorSZQN+OaVYdbg8
         PKcyTxln28p2rmf+F0Ijob1rl4AqjL1/jAuOwb+F50sdXweKDTEus6Xqs1pJEQOmXkkr
         0V7LuTKVvS1QQZV3U7gNRt5IMNhH+tGWFvduh4Oj+1diwRHhyN6tHtzDa/lJvTFxEo2m
         JyoAv3rvRNSkXnDCFDcUtSDQn/qLmN3b9t/mgeGeX2YoPq1Wc4d5c36E3QNg5mOe+doq
         zbSMza0xsGhd8Yo3L5uss83omoQ17Fa1JVxPARJvsn6WrJDtsDL6xQXcaNHEW18CsrhP
         dagQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo4Rj29TkdIK/InryaCwn5R8OGkYzDy3F/HIyc0LBrRwQY+KSFIirO4z9NQoWIWAoqyWsJ1rdkILZCMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPMdUeQpHXSTHUz4YAZ4T+3WltsYo1FFz3si6tX3duk89DdJU4
	/ELnyBkYQoyViELj+bxPiP0IU3VCkqcHCZLqml63y3N57oJfvm7kI3fIWDGbPxs0fVeunVbRTdq
	wZtkYFFEqyQ==
X-Gm-Gg: ATEYQzwdQ2sZgqLmJduy4mBKpiDJO8zMze/xrL6CRcj6jOk4o8cjfZ7/BgDiyoBcl35
	dtX8FR7iS9YNQK0dbIbJiU2VikmWbP/p9s2Zsrbx72hxWdoC4A0fxlTebZg3sG2byb1Ww3aXOYO
	pzN4s1XC4hReChk08efFSqcgqgYjxmJ7GVyVdX79V3ybknUf6tRm6AvTsCOLveF9uNqHv4+U9QM
	eymxGA69uVZSJ47OTb9Xztx6Hpw1kbOAW7G6KAUvlaQGNr/KBK138o/VgJP/P1zOl4qA5xYikbe
	Akm0Y0b11G0ssMiJspIbvshaXerkzpiuTRkqfDSmx92U3FYFIkOl9Y3e2iOUo45Xlaz4X8jKWqK
	uvgauyINBo0KXG7E3i+PUCXJDkSPxYY9F5i73HBrZEwBr2IqXGl5XQOn5/hkH7iOqs9ypgQXvOR
	e3KQwyBmJGDNZw1No74r6/yxao+T+RPKL6AyZPeDsup5BYL4eRLbvCEDkdvAiRzX1ylb0/a/Go
X-Received: by 2002:a17:907:97c6:b0:b8a:f9d7:1afe with SMTP id a640c23a62f3a-b93765c84d6mr948759766b.57.1772472288348;
        Mon, 02 Mar 2026 09:24:48 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm492144066b.44.2026.03.02.09.24.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:24:48 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8f992167dcso488318666b.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 09:24:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUx0WXuA72EDKTmJobqs7A1ltnxwBWuVbcZcSLCzVpcRL7eAGMHLYAUjSrOUk56NZdP+nzy8X4+9CgxhQ==@lists.infradead.org
X-Received: by 2002:a17:907:25c2:b0:b8e:7dcb:7f1b with SMTP id
 a640c23a62f3a-b93763af8f8mr867609766b.21.1772471885098; Mon, 02 Mar 2026
 09:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20260302132755.1475451-1-david.laight.linux@gmail.com> <20260302132755.1475451-5-david.laight.linux@gmail.com>
In-Reply-To: <20260302132755.1475451-5-david.laight.linux@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Mar 2026 09:17:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whaR_ujJvWGTe_fZxg_d2YSORZWnXwHLa5Gao+x136pYA@mail.gmail.com>
X-Gm-Features: AaiRm52ly83FU0bUfVtu2Rv39h3JOZJTzcdxMzg3AYFviKySZcFGK5yhPqg6aWc
Message-ID: <CAHk-=whaR_ujJvWGTe_fZxg_d2YSORZWnXwHLa5Gao+x136pYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] uaccess: Disable -Wshadow in __scoped_user_access()
To: david.laight.linux@gmail.com
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andre Almeida <andrealmeid@igalia.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>, 
	Julia Lawall <Julia.Lawall@inria.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_092450_708940_6FBD787A 
X-CRM114-Status: GOOD (  11.75  )
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

On Mon, 2 Mar 2026 at 05:28, <david.laight.linux@gmail.com> wrote:
>
> From: David Laight <david.laight.linux@gmail.com>
>
> -Wshadow is enabled by W=2 builds and __scoped_user_access() quite
> deliberately creates a 'const' shadow of the 'user' address that
> references a 'guard page' when the application passes a kernel pointer.

This is too ugly to live.

There is no way that we should make an already unreadable macro even
worse just because somebody - incorrectly - thinks that W=2 matters.

No - what matters a whole lot more is keeping the kernel sources
readable (well, at least as readable as is possible).

Because W=2 is one of those "you get what you deserve" things.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
