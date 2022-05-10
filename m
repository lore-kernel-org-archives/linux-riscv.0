Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2615FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+xKZaEQid6hlNg2mEEmzgUnN0y9W+mZGo3tf4M9xDU=; b=pz7rFkubTOp4lq
	ElsRExUqk+pg03433isVjS0MAGqfo2HnmT0FC6Xye3mWuF5J7NvnMvTjcm1cJlxg4K0K4EEZqetdx
	XVkWZAsVeRGdGJOHwV86xaFJYiv/u0zrEDdwtNc6P5xAZLwzXbl3KM/C+vP6cCdRDQ9AqV2aMRZXQ
	JnN+9Rkb8UKoXZnlwAQNB714u7R7c6xVTrSfY2cu2j95swrskoTs8yF5ZOvMiaBlI5MdyhpWGexhU
	gqcAhPhRZJ4M7USq7Za4VfUszZQNTwkzYsf8Emy/1G7e0qIB6xT9AN2ZLKEzkR5iRMZHokMie+ZoQ
	B+pCivgKmmLRu9l5QLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noOBh-001cx4-ST; Tue, 10 May 2022 11:37:57 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noOAE-001cEN-B8; Tue, 10 May 2022 11:36:29 +0000
Received: by mail-io1-xd2b.google.com with SMTP id z26so18168565iot.8;
 Tue, 10 May 2022 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4EZpR3qbj2OiB8Rs7HNB/ykkYoIogT5opUzlrLNV8YI=;
 b=VoJKpqMfxxTPHvVta4VrHB92nXtrqsdoFMCKO72GGQiiTNlssKn+AXRFv2R0zA/qJl
 ctxf5yvCTzchX0hBX89nV/pbn8AMQXcZyobufzGfOBQSZx6nhMaYwA+R8ZttLsdM8Xl+
 rpydufKYD/6bVeUkxjjhLcjOQR0qGg0c2UaMnbMITS+RV4LBbE8poluGb/ji6ozV4ggX
 2ZOwstsWV1YYyBdttQncwLva3BWyKTcGbQP+6PrGtjhkepSKztq/WSV1uGa3OR1zPmHp
 fWEbAq+8c6Bu4dtUV2ivF9jPrKCiNZQT0HzmRt0DR1EBUHs6Rmtmvgahn+B8mMcFvjaB
 CbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4EZpR3qbj2OiB8Rs7HNB/ykkYoIogT5opUzlrLNV8YI=;
 b=4GaP/Mf9uwD0bw6v7e8DiCVI1Od0BycM/WiIzRJgfiJ5IL0jjf4JmSNhXymJxOEjXj
 KnF96dtxvCCvCIi7laaDkY5ESajlTWrASLrx1Ejik5keCW0i/U8UQAKM4J1NGhMgX3HF
 MiPb2HiEb+rObU0dHNbDP/mCz20SVCPIONmu+NQimMvpkYR/g0dYc9vR40w8LhuWi1ia
 aThh/MhDmHdhqKcG2p8wS2TMl6T7Cexc0xP45YnbP5rwZpGduzf4jxApKD8hE7vCLDsG
 PHiqfVqeEcj1PbjTsZzHq7fpnDyYXwWNUhc3OpC98ivh2rT79rXIAN0WjO6/JFFWgeFE
 7qhw==
X-Gm-Message-State: AOAM5320vqzVYwibEoZvZT5mFI8Myu+lIE9TiQIiIE1DUtPh4iczrq1L
 jjTJLs6ByF9flblG3uGGa1q6/s5Wnl4KoPZfhkY=
X-Google-Smtp-Source: ABdhPJxse48OZESZFthVDv8nUynrMkvM0JCiuRjG7/tN4zNaiseDCEGjt9o4QzkyV4Z20WHbORCpQublLG3V37jZ2Dg=
X-Received: by 2002:a02:8624:0:b0:32b:397d:eeb1 with SMTP id
 e33-20020a028624000000b0032b397deeb1mr9940559jai.264.1652182582955; Tue, 10
 May 2022 04:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org>
 <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
 <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
 <CABVgOSkrvfvA7Ay4GC5wg64S1gibvm5_U5VGBog3sw4_UFo8Cg@mail.gmail.com>
In-Reply-To: <CABVgOSkrvfvA7Ay4GC5wg64S1gibvm5_U5VGBog3sw4_UFo8Cg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 May 2022 13:36:11 +0200
Message-ID: <CANiq72mcvKDW6qO=1PzYR_U0tAwVLyCWFZjFVLL81znWDSYq7A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220510_043626_445133_07F8EED4 
X-CRM114-Status: GOOD (  25.00  )
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

On Tue, May 10, 2022 at 6:45 AM David Gow <davidgow@google.com> wrote:
>
> I've just sent out a pull request to get this working under UML as
> well, which would simplify running these further:
> https://github.com/Rust-for-Linux/linux/pull/766

Thanks a lot!

> Yeah, these are all fair points: particularly for small doctests.
>
> Maybe having an optional name, which more significant tests could use
> to override the file:line names? That could be useful for a few of the
> larger, more often referenced tests.

Sounds reasonable. I can add support for that.

> Ugh: it's a bit ugly either way. I suspect that file:line is still
> probably better, if only because we need some way of looking up the
> test in the code if it fails. I'd hate for people to be randomly
> hashing bits of just to find out what test is failing.

One redeeming quality is that the assertion prints the line/file
number in the generated file, so it would still be possible to check
where it came from:

    [13:13:43] # rust_kernel_doctest_str_rs_somehash: ASSERTION FAILED
at rust/doctests_kernel_generated.rs:2209
    [13:13:43] Expected 2 > 3 to be true, but is false
    [13:13:43] not ok 43 - rust_kernel_doctest_str_rs_somehash
    [13:13:43] [FAILED] rust_kernel_doctest_str_rs_somehash

Another alternative is to keep the file:line information around
without embedding it into the test name, e.g. in a TAP comment or a
mapping file (which `kunit.py` could read).

But, yeah, before doing hashes or things like that, I would just go
for simplicity and keep things as they are unless some use case really
needs doctests to be stable.

> Oops: I missed that (one of the issues with testing this on a
> different machine which had a rust toolchain). Looks good to me.
>
> Ah: I didn't realise the plan was always to have crate-specific
> suites, and possibly to split things up.
>
> The KTAP output specification does actually support arbitrary nesting
> (though KUnit itself doesn't at the moment), which would potentially
> be an option if (e.g.) providing the complete module nesting made
> sense. I'm not convinced that'd make things easier to read, though.

That is useful to know in case we need it, thanks!

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
