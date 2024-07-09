Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1C7C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBVcqd6kEvDrgPuQVIhGfNinihayg+AKGlqm63vNqvY=; b=aMnfRG/1gsMTfN
	eDDF13DFreWmdKMI3Cw4OuGfmGk7Kbrxquyn7BF+iQeDPtS5JBAZOQdlWgN93PN+uqRsJXjkS+pcu
	YdKhGwXgRoxcO3ESfSXnoPefVWsi0FqoeGimmBKB40Plw3W+6zx37bEu5Z/xgb9RF+cLqYXX5X9HU
	JdtYxX/P3lKRpV1hcTurE7i6RSlEBdeE5aR04fLRiIkAyh3kn/8/SCNBwh3Tb1vanRCurWGDv/n3Y
	peYxIbX5R7i2Kzsh/HYSyFeZOJ9fFfxHVMcjAhRQ6DbIOhai6qTgOBdH37epeZl64KcZferaIbso/
	HEUtKpr3jnGU8BtdYT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRKYt-00000008uJz-2tw4;
	Tue, 09 Jul 2024 23:47:55 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRKYp-00000008uJ8-3bog
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 23:47:53 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so61398321fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 16:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720568869; x=1721173669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mq/A9aOkBamVBWV7aSMjKHp0LFUAAImFzSMnmFWp048=;
        b=g60ks0tMNk4aKY7DSImANOq2NBtJZRc2mHk5dkv1KVrBw9Pxl28+9OkaUo8Xerui9F
         9n1JsjdYNOjHTPeTmYPvtmkutunzQZx7/RwH8hVm2wI7QEH7rdnPLXUw1UFBdA/n9z3z
         Npb1qbwShPkY3gZLQXCZMwYHYZq3nDZeDRdkKrZe1gv0Vw1HNZ5ywI4jrauOJXcv6WXt
         dkf+pWTkB4clHas8feEmEqrwonqLICgSOldVtBSGDSrUv0RVHL6nMywj4OWlKwHTzmI1
         AVqf44cv1ot/AhrzxptMG+IzcxntvliQPGT05hJRFPxjMS/Zxn8Xo1pidFNjDyw7j6QM
         R7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720568869; x=1721173669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq/A9aOkBamVBWV7aSMjKHp0LFUAAImFzSMnmFWp048=;
        b=Ep2HvFUz6I1YSfWwzEVsM+QeqXhbR5zBz2x5mkMifosRuBdMnHIciaB0PxMg2AvgRe
         9fH0HwGwr8zyLtCcGYjqDWu3eESBAGFqq4LuYpd8ZIyWsxvtQcWbQzd9K18xLsvjBlsF
         XSexUgFCgZpNcMu+CR7PcTSBnKaIWySftb6bFwJDcW96jtAWZNs3deIqRqu8BsdmpzMc
         Ebz8NuOrSbMw6rFfMJj0nouNIZE0yHKu9oZUsXwb3gm21Bc9dSC/a306NIBs93HiRllh
         1mT/w/Jc82oPSyBLrJKlk/+irIp2b6RjrYuS7wt0Ce9OBWh2Nj/1QSCNIPmu2D/+/a7h
         aR9w==
X-Forwarded-Encrypted: i=1; AJvYcCW6Pgc7wlDxsrY6IsAaxrdMIa6bHgSdyQFQqGCh/eo82x8aBtIoGM0agOG+jNA4YCDvxIp9jZbvTjt1/wqwfoHpvPtR7NMpFgvangAnWdXH
X-Gm-Message-State: AOJu0Yx9+W5ynhxW9vKM4tDBdxlgY7VrNS+YNxfi4zqjCMQMAUZGmDE4
	g5ybtwenRXmHdn4RzCoZdjR8OrGpozlFW1rtoBCgWqKAyOwycrYZ
X-Google-Smtp-Source: AGHT+IFR1lSNlGa657B6x4/YQYbJFtspl99U97GZRVKphke00G2h1klOiEvAgjx1eDOhCLqCcJHV1w==
X-Received: by 2002:a2e:3608:0:b0:2ec:4428:b6fd with SMTP id 38308e7fff4ca-2eeb30ba12dmr23925291fa.9.1720568868822;
        Tue, 09 Jul 2024 16:47:48 -0700 (PDT)
Received: from andrea ([84.242.162.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd45a1b6sm1563341a12.60.2024.07.09.16.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 16:47:48 -0700 (PDT)
Date: Wed, 10 Jul 2024 01:47:43 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <Zo3MH8idihW4o+6Z@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-2-alexghiti@rivosinc.com>
 <Zn1Hwpcamaz1YaEM@andrea>
 <4008aeca-352f-489e-ba07-7a11f5ab7ccb@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4008aeca-352f-489e-ba07-7a11f5ab7ccb@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_164751_921996_8DB5858A 
X-CRM114-Status: GOOD (  19.59  )
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

> > Is this second IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check actually needed?
> > (just wondering - no real objection)
> 
> To me yes, otherwise a toolchain without zacas support would fail to
> assemble the amocas instruction.

To elaborate on my question:  Such a toolchain may be able to recognize
that the block of code following the zacas: label (and comprising the
amocas instruction) can't be reached/executed if the first IS_ENABLED()
evaluates to false (due to the goto end; statement), and consequently it
may compile out the entire block/instruction no matter the presence or
not of the second IS_ENABLE() check.  IOW, such a toolchain/compiler may
not actually have to assemble the amocas instruction under such config.
In fact, this is how the current gcc trunk (which doesn't support zacas)
seems to behave.  And this very same optimization/code removal seems to
be performed by clang when CONFIG_RISCV_ISA_ZACAS=n.  IAC, I'd agree it
is good to be explicit in the sources and keep both of these checks.


> > Why the semicolon?
> 
> That fixes a clang warning reported by Nathan here:
> https://lore.kernel.org/linux-riscv/20240528193110.GA2196855@thelio-3990X/

I see.  Thanks for the pointer.


> > This is because the compiler doesn't realize __ret is actually
> > initialized, right?  IAC, seems a bit unexpected to initialize
> > with (old) (which indicates SUCCESS of the CMPXCHG operation);
> > how about using (new) for the initialization of __ret instead?
> > would (new) still work for you?
> 
> But amocas rd register must contain the expected old value in order to
> actually work right?

Agreed.  Thanks for the clarification.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
