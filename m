Return-Path: <SRS0=aLlD=DX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE60C433E7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 18:24:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8832220848
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 18:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tw3oJjJo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="tfke49wM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8832220848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1xcAfrK9eN93qy1M9oNTP5OXcqkRqxVVExI4jD2zBg=; b=tw3oJjJobwpXPmOhTrxo4ZtAX
	SwtPsc+w7t18H1AF36BPmniUYuknK6zCzamIsFtJvKtFAOsEcqIUNe+JdyJSFwXcXx/cAKVs31cJS
	pTy3YEN7U3J7aO2mcbsGtCAhm8p438nGD8D8kp5HCFKg31hl/rlG6jr2/qeZeuFwp3ITnxZrJ1YzD
	I5Ux/3nS0070y3S3nxPnzOMJZ0USTkGJqr1ZDqtm8bNB+rxvAkc43r+bW8cXyxtOfKPBxIaJ2JSyL
	5KUe/8N1PNCG+Lje3OCPnyuzvpQJk5ricBB6fukoleJ27qDrZ3Ptg5K/a+thqJm8toCLtoWfx0FpO
	TkWPRW2rA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUP4-00062E-B5; Fri, 16 Oct 2020 18:24:34 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUP2-000618-J3
 for linux-riscv@lists.infradead.org; Fri, 16 Oct 2020 18:24:33 +0000
Received: by mail-io1-xd44.google.com with SMTP id n6so4948692ioc.12
 for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2020 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D5NngvCZlpVByT++f7qE91SLdHEnOV1NRAu0YOMS/Lo=;
 b=tfke49wMmVeEHZ47+rOE8ezeTppkX/1ALYR5HM/MCTLUJU9PtwVpKQm+5LKx1H5t/A
 Z1S0sAV3EEiyUj8D4lhzFhbkIdluNTU3MSW1j3yUhcXDhmGfD6Pt8yGXs5WX5/rFoeRL
 LPyZYHdK4082r/fSC2bXOL/TjzC+EK8fnWigQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D5NngvCZlpVByT++f7qE91SLdHEnOV1NRAu0YOMS/Lo=;
 b=ToX6G1IqIwE4rdknwJXg95aOiFeX8617IBicrLI4LBTPw2/MP+S0Ou/BdXJoRdzHuQ
 gSk5RzESghO7/X4SZENW6pu6iLonr73OmXz1GXwxOZlsZYbcsml914Yrf/9i+ZAnyOzy
 yK1PLoQJANHdsbnJWZwQAzDWQ4U9n5zAKq24ItUwYiHHrXPm3Xduls2BEf12I/TigeKz
 NDXsyEDVUvbaFjLLGoaJChpk9kBq98e4p9hKDzdZQXQhGXQhTWAp16tT/wNJWNlGd6ap
 l3AGv8aAQixCVPuCeTTOOslm60xnCxPhMw5taqP+mkqU2lqgZOKaYFPK3uy+lx+o+WWU
 /9nQ==
X-Gm-Message-State: AOAM531oq778Vjd9Qt682oRnCO8vOhdXIBxeJQMRF9am007eEPOWlhfT
 qgFAop0w0fHZyMuqU/e3myg5Gitjg4XoCtOS4JTs
X-Google-Smtp-Source: ABdhPJxp/UIgSj0aDdvVfswZDSxjOZfD1HWCnBxkYKJwU/swpzjmfUCncgyzEmR83S4Y4o6+E5hxvOhG/KuGSjsc9Uc=
X-Received: by 2002:a02:6952:: with SMTP id e79mr3738592jac.24.1602872667636; 
 Fri, 16 Oct 2020 11:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201009211344.2358688-1-atish.patra@wdc.com>
 <20201009211344.2358688-5-atish.patra@wdc.com>
 <CAHCEehJvMv=CYD1+QXb0uB36Hv4pvO36BAKSLOcxTXvmADZFbA@mail.gmail.com>
 <CAOnJCUKPjkm_=5eHn6=GjVGr67okZkVzqP7-ciphn986BQoc9w@mail.gmail.com>
 <CAOnJCULZMRu+sHmnjoBwtvaB3BjmCiZLzYxNOeWZmoYLKG+wTw@mail.gmail.com>
 <CAHCEehJJmLQ6W5AdH+hEZSJxpDC8HG0UN=EGt9M0Tp5NTfQnaw@mail.gmail.com>
 <CAOnJCUJN-XMZ+N5w+RbVhJag9D_dey7DAopb0Q35GDfXptyMjA@mail.gmail.com>
 <CAFyWVaYORWYZTXyXOWiY6xK-SFTvsUxDNDqKQnhVUwzc5N045Q@mail.gmail.com>
 <CAOnJCU+3xFyFW4ATCdYAv5zVyBSLE0mTevrJLCXW7HDgy4D4EQ@mail.gmail.com>
In-Reply-To: <CAOnJCU+3xFyFW4ATCdYAv5zVyBSLE0mTevrJLCXW7HDgy4D4EQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 16 Oct 2020 11:24:16 -0700
Message-ID: <CAOnJCUJWf9Hu4frFOJGQLUZ2BQ8qHBd7mvspgvfM1k6e4z5CcA@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: Protect .init.text & .init.data
To: Jim Wilson <jimw@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_142432_630016_AD1001F3 
X-CRM114-Status: GOOD (  24.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>,
 Kito Cheng <kito.cheng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 10:24 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Oct 13, 2020 at 6:21 PM Jim Wilson <jimw@sifive.com> wrote:
> >
> > On Tue, Oct 13, 2020 at 3:25 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > This happens only when copy_from_user is called from function that is
> > > annotated with __init.
> > > Adding Kito & Jim for their input
> > >
> > > @kito, @Jim: Please let me know if I should create a issue in
> > > riscv-gnu-toolchain repo or somewhere else.
> >
> > I can't do anything useful without a testcase that I can use to
> > reproduce the problem.  The interactions here are complex, so pointing
> > at lines of code or kernel config options doesn't give me any useful
> > info.
> >
> > Relaxation can convert calls to a jal.  I don't know of any open bugs
> > in this area that can generate relocation errors.  if it is a
> > relaxation error then turning off relaxation should work around the
> > problem as you suggested.
> >
> > A kernel build problem is serious.  I think this is worth a bug
> > report.  FSF binutils or riscv-gnu-toolchain is fine.
> >
>
> I have created an issue with detailed descriptions and reproduction steps.
> Please let me know if you need anything else.
>

It may be a toolchain issue. Here is the ongoing discussion in case
anybody else is interested.

https://github.com/riscv/riscv-gnu-toolchain/issues/738

> > Jim
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
