Return-Path: <SRS0=1JfK=DV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AF7C433E7
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2020 01:21:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA4821D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2020 01:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H7aXE+EQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OlSx2JyL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA4821D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Y4NRBozX3j503qeZ2hVZbD0D6pZb4E1m9slTT7IUto=; b=H7aXE+EQl2EAZuIPFEDSA+Rlk
	t1I31qcnCu/EoUxo3t++uM1fNuxPFcTM+TT3DtDCdfppE6vHOWc9wB8zlCnd705CEls3Xx9+ueLpd
	wx/2sTa/Oim9reEhSee31+8t6kw0Q9zXPn2Eey907ewar9LHOVLAO1OtU12UqDhdiolVRHAm7EAZQ
	oUCQF/cwygxASO1lEwRbCA2mIo9XlYLL4eqhrVIkqbIrCnRha5ul6LPo+pqcQdpbZAjZzV3WNQuaF
	L8Sn/3rMF2PjAO1Un5FQetpQprY0+bXTBcbGfqmO3QXYFB9CNtIlFAQ4PyZBUv58hHMzWGtXN0pGJ
	DzX63OwzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSVTa-0005M9-N4; Wed, 14 Oct 2020 01:21:10 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSVTU-0005Ld-UT
 for linux-riscv@lists.infradead.org; Wed, 14 Oct 2020 01:21:09 +0000
Received: by mail-ej1-x641.google.com with SMTP id u21so2470980eja.2
 for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2020 18:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXuyKKLXCqER0qiq8dEKjvLqiC2JwcKFo8wUFhLVXXU=;
 b=OlSx2JyLc3ZRSaS4Ush40RMl6iu1oAuZL44sPnos7VI6GgTpIlVBcu4SeP04Wb00iP
 fjmZElvM54tmZk76lQJRvczhdM9Ynjtx+kdckBXgqP0tGfLDsdkXMM45PsJWyh3GZA0E
 Ee3o/wZP1eWqCAXlOdn9kDOOVqLYYxtPiROehkrcCsPAAm09cZutlXA9BwpCPEkZtSVL
 MIBilxrb4v4MR5ExbSAdNrTMNw/Mv5Y3+lEHaAuT7uUprXPRq1QjzTfv91klKRsesQjF
 SYFI/UkKVWDwYSY2zms4LlEdsutRZjgb0VB5hZnN4m7RNQFTuq6wBmhdD2DZ18FiG4PA
 UMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXuyKKLXCqER0qiq8dEKjvLqiC2JwcKFo8wUFhLVXXU=;
 b=BrbyOzIS074dytHtP1ZFTo47KfXFmj74m8Wlt6ea/9ye759ShJsMHamd1wxI66mULz
 h/PzRtiMQ3/AeOyoNpm3C9/uEa8QY9sj21JRQVcmhtKvk8ztJN0w4NTHXT8auTUYghLX
 CpKqiEH0w2m6gFWryw5J/LZbNWpCQ2aUO9k5j2HAMu4EdM6QjBkk9oGYfk1dGRD9638c
 pj6Vl30NvybLojHS2/XLSxurirmIHXKPJkYsOp83/7IQmgosTdx8VhYUZdSJ5wvXuR4p
 gxqq0LXymCaw29COQFix/1iKzPrQC+7gD0YZ+3BQ14OdsKgGMsjrqy8MRdvuhaDPkOKC
 vM5Q==
X-Gm-Message-State: AOAM532I6jpPDogJFLfyxGMLFkyAv+97a17YqAJeesVL/S4nmia34kd2
 YZYyaO+9fKNK2OoGf9zaeRzhpEpGc1rWPlHKxmNcvg==
X-Google-Smtp-Source: ABdhPJxOLC3V5GhsZMjTnGSD3kKfhedcEUNthv9S6Bb6G58zxDEcxUDNyO0K2ysIawYcu27qC5i1mFEmxzBFOyDQ9VA=
X-Received: by 2002:a17:906:9396:: with SMTP id
 l22mr2751325ejx.36.1602638460222; 
 Tue, 13 Oct 2020 18:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201009211344.2358688-1-atish.patra@wdc.com>
 <20201009211344.2358688-5-atish.patra@wdc.com>
 <CAHCEehJvMv=CYD1+QXb0uB36Hv4pvO36BAKSLOcxTXvmADZFbA@mail.gmail.com>
 <CAOnJCUKPjkm_=5eHn6=GjVGr67okZkVzqP7-ciphn986BQoc9w@mail.gmail.com>
 <CAOnJCULZMRu+sHmnjoBwtvaB3BjmCiZLzYxNOeWZmoYLKG+wTw@mail.gmail.com>
 <CAHCEehJJmLQ6W5AdH+hEZSJxpDC8HG0UN=EGt9M0Tp5NTfQnaw@mail.gmail.com>
 <CAOnJCUJN-XMZ+N5w+RbVhJag9D_dey7DAopb0Q35GDfXptyMjA@mail.gmail.com>
In-Reply-To: <CAOnJCUJN-XMZ+N5w+RbVhJag9D_dey7DAopb0Q35GDfXptyMjA@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Tue, 13 Oct 2020 18:20:49 -0700
Message-ID: <CAFyWVaYORWYZTXyXOWiY6xK-SFTvsUxDNDqKQnhVUwzc5N045Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: Protect .init.text & .init.data
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_212105_247274_29D704AD 
X-CRM114-Status: GOOD (  14.60  )
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

On Tue, Oct 13, 2020 at 3:25 PM Atish Patra <atishp@atishpatra.org> wrote:
> This happens only when copy_from_user is called from function that is
> annotated with __init.
> Adding Kito & Jim for their input
>
> @kito, @Jim: Please let me know if I should create a issue in
> riscv-gnu-toolchain repo or somewhere else.

I can't do anything useful without a testcase that I can use to
reproduce the problem.  The interactions here are complex, so pointing
at lines of code or kernel config options doesn't give me any useful
info.

Relaxation can convert calls to a jal.  I don't know of any open bugs
in this area that can generate relocation errors.  if it is a
relaxation error then turning off relaxation should work around the
problem as you suggested.

A kernel build problem is serious.  I think this is worth a bug
report.  FSF binutils or riscv-gnu-toolchain is fine.

Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
