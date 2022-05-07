Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E0FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  7 May 2022 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+FErtUzs/1NXA+easT/pcOESXlLqZPI8HRvQly+8nQ=; b=hmS+MSAO122Jz+
	GYXUW+BvScTEfXcG/CmRWStWtY1QA1DL4i2NizG0fWK/tk4F3g8kRRdHT770+A5XG7KvS3eFPg77Y
	CYhghIite0/GoUJdD6O9ye1KlZWWUe4JjLBmwKR+c8EnSKP2Ube8n4GwrlzsK2dzjRHu7+XCeZX/+
	LB9kCoOVHsztrFCt9lmO4MqCfbO5M3AB1EmkN2gAM7BAM2wm5cTSuxWy5seBMp6IhTemfbgMC30zr
	Eask+0+EK78F6K4/ljR3EZrcjhMF5fn2xHrmnQsB4r4efnsTU1lMkqtqzq6gLxjEPh9svZbkAje+3
	XBlDPSvzkBbOMlAwxzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnLyQ-007U5d-1s; Sat, 07 May 2022 15:03:58 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnLyF-007U1m-5B; Sat, 07 May 2022 15:03:48 +0000
Received: by mail-io1-xd30.google.com with SMTP id z18so10975879iob.5;
 Sat, 07 May 2022 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CnjdUOz3duiKD1Uau0ijtSb5UBL+OJmQOYvavWmoZQ0=;
 b=Goshd/Luda+YskWKjL4mFxR2CewMKg4Ngp0zTFvr681Uze/6UoYKLSsCuvwyykKdoV
 eJgShn/IfVaDwDxxqtuVaiypmwMCNkgs3U7eD/IHcA+NTKJnwNJDfV75hCAxJn6fhlbn
 65xdlhRV1o+T88gQd3VVfV6lPkB4h/kQdWVILeyrrRGThVgkiWqwoup9fFr2v39EUzxX
 2bCMEg8qAMivg4zNvG6un1RFKMTRIwY+K2H9Et54yjnONGwjlXCMIgrhaWsbrSHJ3CbF
 dLPxj2t56sOAmQTcpErCwm8om2QTvopW9vHpR2ZQYiHU3j7DhQkX5H4ADEhJCh74VYJo
 UmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CnjdUOz3duiKD1Uau0ijtSb5UBL+OJmQOYvavWmoZQ0=;
 b=ho4tTmdACSOkbMBmA0FtFjte+590eIcevxNL51FxlSVHE+BJTz/cypuk8hoJgnlWn8
 cyMhAWidl6YdFt+nTEP4L+XuvsfUFinBPw2yejdCcWyNVCBOotzcuOedqWz8cbM5cHQZ
 3axLWXhmGq3grHoU6NQQNtMze4mDLjPUnPknqmWQjFQmH+BQD6lnZ7muI6U/RZ995AyD
 dnkof6QvbeNswX/WF6aqWbDoO10/P3TgSBWdx5hdjsSOsLQJa64wTOL11ZYwFM0Au4Qz
 3Frs2uwI6SwDt5P1rahlsngRTzoGadIX4o6GxT57fSXfr1gUGOy5e+/mBurukgyo+fzX
 55Zg==
X-Gm-Message-State: AOAM5322YkmZ1WcauEsPDrN7bV+QFo8Nl1huhFCjJThN+I0V4Y38oVDP
 olTMMeBKlTH/bgaW+Sw3iQ6DdQMJd/WXDSVVW/4=
X-Google-Smtp-Source: ABdhPJyqVxv4uPynhji9t5jG0pJBv2D9XRWPEuRPww2y6vJC30NvmsubB9I6YkkamF8cCOWGkn9Xe0Ihs9a1gxmTp/4=
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr3321613iow.172.1651935822769; Sat, 07
 May 2022 08:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org>
 <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
In-Reply-To: <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 May 2022 17:03:31 +0200
Message-ID: <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
Subject: Re: [PATCH v6 00/23] Rust support
To: David Gow <davidgow@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, 
 KUnit Development <kunit-dev@googlegroups.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, live-patching@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_080347_258579_773ADE40 
X-CRM114-Status: GOOD (  25.66  )
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

Hi David,

On Sat, May 7, 2022 at 11:29 AM David Gow <davidgow@google.com> wrote:
>
> It's great to see some KUnit support here!

Thanks!

> It's also possible to run these tests using the KUnit wrapper tool with:
> $ ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y
> --make_options LLVM=1 --arch x86_64 'rust_kernel_doctests'
>
> That also nicely formats the results.

Indeed!

    [16:55:52] ============ rust_kernel_doctests (70 subtests) ============
    [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_12_0
    [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_55_0
    ...
    [16:55:52] [PASSED] rust_kernel_doctest_types_rs_445_0
    [16:55:52] [PASSED] rust_kernel_doctest_types_rs_509_0
    [16:55:52] ============== [PASSED] rust_kernel_doctests ===============
    [16:55:52] ============================================================
    [16:55:52] Testing complete. Passed: 70, Failed: 0, Crashed: 0,
    Skipped: 0, Errors: 0

> That all being said, I can't say I'm thrilled with the test names
> here: none of them are particularly descriptive, and they'll probably
> not be static (which would make it difficult to track results /
> regressions / etc between kernel versions). Neither of those are

Yeah, the names are not great and would change from time to time
across kernel versions.

We could ask example writers to give each example a name, but that
would make them fairly less convenient. For instance, sometimes they
may be very small snippets interleaved with docs' prose (where giving
a name may feel a bit of a burden, and people may end writing
`foo_example1`, `foo_example2` etc. for each small "step" of an
explanation). In other cases they may be very long, testing a wide API
surface (e.g. when describing a module or type), where it is also hard
to give non-generic names like `rbtree_doctest`. In those kind of
cases, I think we would end up with not much better names than
automatically generated ones.

The other aspect is that, given they are part of the documentation,
the prose or how things are explained/split may change, thus the
doctests as well. For instance, one may need to split a very long
`rbtree_doctest` in pieces, and then the name would need to change
anyway.

So I think we should avoid asking documentation writers to add a
manual name, even if that means a bit ugly test names. Also this way
they are consistently named. What do you think?

One idea could be giving them a name based on the hash of the content
and avoiding the line number, so that there is a higher chance for the
name to stay the same even when the file gets modified for other
reasons.

> necessarily deal breakers, though it might make sense to hide them
> behind a kernel option (like all other KUnit tests) so that they can
> easily be excluded where they would otherwise clutter up results. (And

Currently they are under `CONFIG_RUST_KERNEL_KUNIT_TEST` -- or do you
mean something else?

> if there's a way to properly name them, or maybe even split them into
> per-file or per-module suites, that would make them a bit easier to
> deal.) Additionally, there are some plans to taint the kernel[1] when

Yeah, splitting them further is definitely possible. We are also
likely splitting the `kernel` crate into several, which would also
make the suites smaller etc. so perhaps further splits may not be
needed.

> Regardless, this is very neat, and I'm looking forward to taking a
> closer look at it.

Thanks again for taking a look and playing with it, I am glad you
liked it! (even if it is just a first approximation, and only supports
the `kernel` crate, etc.).

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
