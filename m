Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF37C77B7D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 14:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlD18MCAVWV7NHPKFCvVWl0/x7UlZ//etVHKvUziiGY=; b=dM8a+jciASrc4k
	n/KFGta0EcjYqDHkI8DdOW5NHwxY2hHsthUSUX/hh+7340SxCrdvozIctXXUYT4nEEuc0jk+aLIK/
	Khow61FF6OVWPJ3DVZJnbD36vQslP/dlG0u6BtU9own/HNGuYe5pxGbU+D1ODX5LqJjdyUsqXdsoe
	tQb9YX+gjqf/w+z4ZLwH56KcyHtZ4vU6kOvw/cfRwjcRnHKxVx7VHzQzZdT4FBv8nA20uGd2JhxUo
	n/NKWa3pR8pHLZSvhFZLEJVi+8oaiXFnZH28G1l10NDyokDBpbAvtfg95zzxSKCRJQj2yRFEeFpMA
	fMOIhydnB6nfGgaM+qOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0NL3-001em7-0Q;
	Sat, 20 May 2023 14:13:41 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0NL0-001elG-27
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 14:13:40 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34KEDW6v027662;
	Sat, 20 May 2023 16:13:32 +0200
Date: Sat, 20 May 2023 16:13:32 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, aou@eecs.berkeley.edu,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/nolibc: Fix up compile error for rv32
Message-ID: <20230520141332.GB27611@1wt.eu>
References: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
 <20230520120254.66315-1-falcon@tinylab.org>
 <20230520133237.GA27501@1wt.eu>
 <d98dfd41-8938-4388-90f0-38199d2f0574@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d98dfd41-8938-4388-90f0-38199d2f0574@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_071338_999376_000D0FBC 
X-CRM114-Status: GOOD (  27.38  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, May 20, 2023 at 04:07:34PM +0200, Thomas Wei=DFschuh wrote:
> Hi Willy!
> =

> On 2023-05-20 15:32:37+0200, Willy Tarreau wrote:
> > Thomas, Zhangjin,
> > =

> > I've merged your latest patches in my branch 20230520-nolibc-rv32+stkp2,
> > which was rebased to integrate the updated commit messages and a few
> > missing s-o-b from mine. Please have a look:
> > =

> >    https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
> > =

> > However, Thomas, I noticed something puzzling me. While I tested with
> > gcc-9.5 (that I have here along my toolchains) I found that it would
> > systematically fail:
> > =

> >   sysroot/x86/include/stackprotector.h:46:1: warning: 'no_stack_protect=
or' attribute directive ignored [-Wattributes]
> >      46 | {
> >         | ^
> >   !!Stack smashing detected!!
> >   qemu: uncaught target signal 6 (Aborted) - core dumped
> >   0 test(s) passed.
> > =

> > The reason is that it doesn't support the attribute "no_stack_protector=
".
> > Upon closer investigation, I noticed that _start() on x86_64 doens't ha=
ve
> > it, yet it works on more recent compilers! So I don't understand why it
> > works with more recent compilers.
> =

> _start() not having the attribute is indeed an oversight.
> No idea how it worked before.

No problem, I preferred to mention it anyway.

> > I managed to avoid the crash by enclosing the __stack_chk_init() functi=
on
> > in a #pragma GCC optimize("-fno-stack-protector") while removing the
> > attribute (though Clang and more recent gcc use this attribute so we
> > shouldn't completely drop it either).
> =

> I would like to first align x86 to __attribute__((no_stack_protector))
> for uniformity and then figure out on how to make it nicer.

I agree.

> > I consider this non-critical as we can expect that regtests are run with
> > a reasonably recent compiler version, but if in the long term we can fi=
nd
> > a more reliable detection for this, it would be nice.
> > =

> > For example I found that gcc defines __SSP_ALL__ to 1 when
> > -fstack-protector is used, and 2 when -fstack-protector-all is used.
> > With clang, it's 1 and 3 respectively. Maybe we should use that and
> > drop NOLIBC_STACKPROTECTOR, that would be one less variable to deal
> > with: the code would automatically adapt to whatever cflags the user
> > sets on the compiler, which is generally better.
> =

> That sounds great!
> =

> I explicitly looked for something like this before, dumping preprocessor
> directives and comparing.
> It seems the fact that my compilers enable this feature by default made
> me miss it.

Hmmm that's indeed possible. With -fno-stack-protector it should disappear:

  $ gcc -fno-stack-protector -dM -E -xc - < /dev/null |grep SSP
  $ gcc -fstack-protector -dM -E -xc - < /dev/null |grep SSP
  #define __SSP__ 1
  $ gcc -fstack-protector-all -dM -E -xc - < /dev/null |grep SSP
  #define __SSP_ALL__ 2
  $ clang -fstack-protector-all -dM -E -xc - < /dev/null |grep SSP
  #define __SSP_ALL__ 3

> I'll send patches.

OK thanks. Just be aware that I'll be less responsive this week-end from
now on.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
