Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D7BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E24860F11
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E24860F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29chUazaphSdQ29HXxB8BCb9TmeodibpRAYQmdbExW8=; b=t1p65W8c5BcsOW
	9PuLOZD/Q6KCOupWrCw7hMRvwQdZiaNjsKyn1Lm6QW5xS+JWSlVbhhgW+Uv/X7295M4mHGQWK5KRg
	vtnn1g65TcWFvFcZ5NXvrOvgW5yALzAEg2nc7fG5Rb6/iiQE/B2e9MqKL++tlc/uyzf5y5NnogrdY
	g1YbdlcVHZQ0O96cuohJNjbNYiVUIhFJ3FFoUv4wLjixBqRnMGwiSG4JRDbfdAzhtx7ggKtkNXvpR
	G3kTOmtzEoHbFhhzdyYjqIO24wPsUcw0lDyeBTxf1CGi7Pf/G4Wvlh2A361SJefhb+JuG9PJUc8MN
	X7v2x4mL2/rQwtm2MBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAkZ-006Iy7-ST; Tue, 14 Sep 2021 15:53:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAkM-006Iuv-Fa; Tue, 14 Sep 2021 15:53:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D7A461247;
 Tue, 14 Sep 2021 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631634802;
 bh=SyILGKt3RsxWQZLKn6wlRw/UVoEX8mvp4miVI+z/vYo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=airnI9zw0Et1SHOS66sORqbLf+N+oqN4rYm/YB48KbiMRB+iDVAXgT2kvAxvuoZvl
 gF4rPe6TgbvgeS/L3eEJrlXtd49evF3OKXJoaG2QWwmMLr3w/YNQaguD2T5lJtSUu2
 3pey3WNXDlIzYjE9nUNnhN8DuNDvNhwc21qudCfatYJ6ncOBbYwWjJoIBfBf/yU0VR
 Wvgl6GxjjXC84PQtjgOTQWOpBT2YqateJCzyyzYuius8TLusfX6lXiqDM6crRnITDW
 rV1s7brSWDaHYzKJSOMB6VfzDS4NWfbG6WsyW+TVjA6eJs7UuUpuziYdN1QheiWlMS
 uOmX4ftZ6o1Nw==
Received: by mail-yb1-f170.google.com with SMTP id s11so29171593yba.11;
 Tue, 14 Sep 2021 08:53:22 -0700 (PDT)
X-Gm-Message-State: AOAM531fXh5lm8tvfceGzH4Xq4rEsl55kvRqcJEwl+QGljPR+HDJlfWC
 LLrxJQNsqesP0vQM1+3FEhrpVZHdD2t1QB5scGw=
X-Google-Smtp-Source: ABdhPJyDFc9VSO5h/RiqccbxZgmZOWSklBB73HxlIVY43T/ttJWTuXgDpoHxXQAJINO0RmpPM1mGY0nlklwutQHfE4k=
X-Received: by 2002:a4a:c904:: with SMTP id v4mr14629736ooq.26.1631634790945; 
 Tue, 14 Sep 2021 08:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
 <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
In-Reply-To: <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Sep 2021 17:52:59 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
Message-ID: <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, 
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_085322_601084_DD48FD1C 
X-CRM114-Status: GOOD (  15.42  )
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

On Tue, 14 Sept 2021 at 17:49, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 5:11 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> >  static inline unsigned int task_cpu(const struct task_struct *p)
> >  {
> >  #ifdef CONFIG_THREAD_INFO_IN_TASK
> > -       return READ_ONCE(p->cpu);
> > +       return READ_ONCE(p->thread_info.cpu);
> >  #else
> >         return READ_ONCE(task_thread_info(p)->cpu);
> >  #endif
>
> Those two lines look different, but aren't.
>
> Please just remove the CONFIG_THREAD_INFO_IN_TASK conditional, and use
>
>           return READ_ONCE(task_thread_info(p)->cpu);
>
> unconditionally, which now does the right thing regardless.
>

Unfortunately not.

task_cpu() takes a 'const struct task_struct *', whereas
task_thread_info() takes a 'struct task_struct *'.

Since task_thread_info()-><foo> is widely used as an lvalue, I would
need to update task_cpu()'s prototype and fix up all the callers, some
of which take the const flavor themselves. Or introduce
'const_task_thread_info()' which takes the const flavor, and cannot be
used to instantiate lvalues.

Suggestions welcome, but this is the cleanest I could come up with.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
