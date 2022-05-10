Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75640C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 04:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yec7YT5JInoXfpja45FCkT3nT2jJZ2daFWIyr3OzztE=; b=o9Mo8OiG2APuJv
	WvdPtkJdPSvf6c++V+NtqBacylp27yGiPuxs1a/8iiQ4e9NkO/GpEazEl7gbFbQ5UYi6E20qXzl3x
	YN/+g3sZXNXZJliX/uzv8m0eizfe/WCG1FAhhDYDkFgAXQi+VC8JJ/QkXhqijX4NZlYlCkkOVNNis
	BgEFVvzn/WJ6c1BWPx/p5bptmCI+OIv5lOa4khNdFjTpmqvvS7R0tfJkzwvvqV4REY9YAmQYhSI4c
	kKipz8SybXRz5zvEwC9i2B+4qbwCOhwOPPAsQUnh7p8pAhprZYHJ5QsldSKXsmYXNcjUf4VDjKCVj
	iLLPLlg3R/f8XMY8leVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noHkP-00HWNE-4I; Tue, 10 May 2022 04:45:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noHkK-00HWJl-8y
 for linux-riscv@lists.infradead.org; Tue, 10 May 2022 04:45:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id e2so22037608wrh.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 21:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9s1dagxJlyBeoN8vXdOpsPpdS8AD1RWVJWE0n8ehmas=;
 b=OrctmfTVDCxyYdwcxCtO+PuFgHBDMDC7Bjk3TGUWyuOKGBhKLCCiUkxtYUOPWSujka
 /OoqstAYhrGXcYieyOQKBFbwQ9tdHrrlfAgfjS6rNqvPEA5JdQz3D4E5NS7VzL5WOf+E
 ppcl6vbGTOThxdSbDLD0FF3VNmQjZYs0YaRKW2LrfcKbI7iiYsOvdodP6Nf3qoZXPgQF
 Um1ef/9fJDTkVoHV63EAahHnEkdwxgxf/Hc8y1wACrWcQPfhb2xVBIshPVinpye5CGSN
 DoHok7Lf+NgFTiQMqtYLLj/aSoKi0RaOM3+EWbBDgDeG8Kjhw/dRvI6d3AEZbIIqfLAr
 UHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9s1dagxJlyBeoN8vXdOpsPpdS8AD1RWVJWE0n8ehmas=;
 b=j04SViYBNUNG9Mh//0IW0oUAUcy9xYk4s8X4bQZJyCI492aIti1Nm65/441XX9KxEh
 +zIOydIWk2z4+dHbBnLIMwXAt2ctkroPUNIg9nVhVck5avbSFsG+Bi0z0sFLoPwcFWOX
 Q0cUQnfw1p51gxLrnVc1YGBNOnaSf6slgoo+C1PoGjlau9nCnA6sKMm7S5peO6FzG4jm
 ah9cs9i0gZdAX4vsNSmlifYMUKXA9cdpdUV19Ysen2pKC08Ffb3lz4kt68sk2j0U/u8i
 sxHrAi/5EUwhH1vLXF8LDeiK7OUTjvYTjqPULsSko/BhOCz1jc1VVxOmo7kHTz3klKNm
 fQJw==
X-Gm-Message-State: AOAM530HmA7vEsUqkwiIHVsjwdnDmykO9TqKTuWgZyVosY+hTubNb9vU
 eesDDUk9OCiGpESRZfIkcGhOiIrhOMLSxUenHcbdYg==
X-Google-Smtp-Source: ABdhPJzfNwaPy5xjCTvC86K51nEH3yemeJZ1erUUa4xvtvCZqXN7MOjD5hnH0ntxxTlSOXapkot4g5ZMqXe6px9AH2Q=
X-Received: by 2002:a5d:4806:0:b0:20a:da03:711b with SMTP id
 l6-20020a5d4806000000b0020ada03711bmr16582569wrq.395.1652157908998; Mon, 09
 May 2022 21:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org>
 <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
 <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
In-Reply-To: <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Tue, 10 May 2022 12:44:57 +0800
Message-ID: <CABVgOSkrvfvA7Ay4GC5wg64S1gibvm5_U5VGBog3sw4_UFo8Cg@mail.gmail.com>
Subject: Re: [PATCH v6 00/23] Rust support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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
X-CRM114-CacheID: sfid-20220509_214516_343283_70F350BE 
X-CRM114-Status: GOOD (  44.01  )
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

On Sat, May 7, 2022 at 11:03 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi David,
>
> On Sat, May 7, 2022 at 11:29 AM David Gow <davidgow@google.com> wrote:
> >
> > It's great to see some KUnit support here!
>
> Thanks!
>
> > It's also possible to run these tests using the KUnit wrapper tool with:
> > $ ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y
> > --make_options LLVM=1 --arch x86_64 'rust_kernel_doctests'
> >
> > That also nicely formats the results.
>
> Indeed!
>
>     [16:55:52] ============ rust_kernel_doctests (70 subtests) ============
>     [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_12_0
>     [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_55_0
>     ...
>     [16:55:52] [PASSED] rust_kernel_doctest_types_rs_445_0
>     [16:55:52] [PASSED] rust_kernel_doctest_types_rs_509_0
>     [16:55:52] ============== [PASSED] rust_kernel_doctests ===============
>     [16:55:52] ============================================================
>     [16:55:52] Testing complete. Passed: 70, Failed: 0, Crashed: 0,
>     Skipped: 0, Errors: 0
>

I've just sent out a pull request to get this working under UML as
well, which would simplify running these further:
https://github.com/Rust-for-Linux/linux/pull/766

> > That all being said, I can't say I'm thrilled with the test names
> > here: none of them are particularly descriptive, and they'll probably
> > not be static (which would make it difficult to track results /
> > regressions / etc between kernel versions). Neither of those are
>
> Yeah, the names are not great and would change from time to time
> across kernel versions.
>
> We could ask example writers to give each example a name, but that
> would make them fairly less convenient. For instance, sometimes they
> may be very small snippets interleaved with docs' prose (where giving
> a name may feel a bit of a burden, and people may end writing
> `foo_example1`, `foo_example2` etc. for each small "step" of an
> explanation). In other cases they may be very long, testing a wide API
> surface (e.g. when describing a module or type), where it is also hard
> to give non-generic names like `rbtree_doctest`. In those kind of
> cases, I think we would end up with not much better names than
> automatically generated ones.
>
> The other aspect is that, given they are part of the documentation,
> the prose or how things are explained/split may change, thus the
> doctests as well. For instance, one may need to split a very long
> `rbtree_doctest` in pieces, and then the name would need to change
> anyway.
>
> So I think we should avoid asking documentation writers to add a
> manual name, even if that means a bit ugly test names. Also this way
> they are consistently named. What do you think?

Yeah, these are all fair points: particularly for small doctests.

Maybe having an optional name, which more significant tests could use
to override the file:line names? That could be useful for a few of the
larger, more often referenced tests.

> One idea could be giving them a name based on the hash of the content
> and avoiding the line number, so that there is a higher chance for the
> name to stay the same even when the file gets modified for other
> reasons.

Ugh: it's a bit ugly either way. I suspect that file:line is still
probably better, if only because we need some way of looking up the
test in the code if it fails. I'd hate for people to be randomly
hashing bits of just to find out what test is failing.

> > necessarily deal breakers, though it might make sense to hide them
> > behind a kernel option (like all other KUnit tests) so that they can
> > easily be excluded where they would otherwise clutter up results. (And
>
> Currently they are under `CONFIG_RUST_KERNEL_KUNIT_TEST` -- or do you
> mean something else?
>

Oops: I missed that (one of the issues with testing this on a
different machine which had a rust toolchain). Looks good to me.

> > if there's a way to properly name them, or maybe even split them into
> > per-file or per-module suites, that would make them a bit easier to
> > deal.) Additionally, there are some plans to taint the kernel[1] when
>
> Yeah, splitting them further is definitely possible. We are also
> likely splitting the `kernel` crate into several, which would also
> make the suites smaller etc. so perhaps further splits may not be
> needed.

Ah: I didn't realise the plan was always to have crate-specific
suites, and possibly to split things up.

The KTAP output specification does actually support arbitrary nesting
(though KUnit itself doesn't at the moment), which would potentially
be an option if (e.g.) providing the complete module nesting made
sense. I'm not convinced that'd make things easier to read, though.

> > Regardless, this is very neat, and I'm looking forward to taking a
> > closer look at it.
>
> Thanks again for taking a look and playing with it, I am glad you
> liked it! (even if it is just a first approximation, and only supports
> the `kernel` crate, etc.).
>
> Cheers,
> Miguel

Thanks,
-- David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
