Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E345BC47404
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 17:20:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49EC20872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 17:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eH5t2Rhu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LkvK4hE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49EC20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1weT0AVSM1IJztULXvJVlmvbLweI91OIngu82imWis=; b=eH5t2Rhu9Gc4KZ
	mihH+sRmvXZlRSiDPIQkMXSxm6+590zJPr1JJNjYcQc6Vdh6/nBbmC7tY+uzsFb9FEGGPpyXKEFy2
	b3gCzQW1ckpEBULRDwU7U6bgfVmMY7JOufI2g/Jf1tgTcRDovTNfbK6gyOhh0n5Iw+Yr6UtLdvvDt
	CkOWLU3HrBLgJmeIVHQAxRm0ISaPWWS0CKIXbjbinVsUMiiBU+a1jpoXc8ZaITpb/yaaAa7COVYEb
	E/whQtV78Q2HPiHtmRxTVe6SoQMGf/e5L2F/pH6m9MHn86WxjX2ZJKxpkHHVj0Je3cuvugJPzx8Oy
	d4d5qQPBrQIyvuoIzphw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDtuk-00024i-LS; Fri, 27 Sep 2019 17:20:18 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDtui-000241-A2
 for linux-riscv@lists.infradead.org; Fri, 27 Sep 2019 17:20:17 +0000
Received: by mail-lj1-x242.google.com with SMTP id v24so3267012ljj.3
 for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2019 10:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O/eekwhhc/lEaErl1cWQvuZyKqEyMda5rbusW6YMK7I=;
 b=LkvK4hE626X9t4s92tPCDu4GVP+JW+rdiOHfvNh9N4jF4NJ9fWlvc7td1nIDU+CA3n
 PEztECpiktmStFqQ0huvXxeFoYFnurGmt4lmEj4thS8is9bkVhtTwcYhaFJXZOE0CtAy
 FW3A90ZFOAblRyxevEgwyKNwOoEO9RZOQsrxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O/eekwhhc/lEaErl1cWQvuZyKqEyMda5rbusW6YMK7I=;
 b=fGctUGzuajHksHBhrZo9k3HJoM75g6hhKdut3jV1pn0grwkbnwC+QWtdHftthwK9PF
 HWJCstcA2O5xhmHqpsPVXcpFoeK21lTqbgtCz1m+ZdjoSlTWM0ITDNPt3KrYQio0wets
 S9s46wnejVMkenIKzd/hbVHlEapgo5D1nKU+2IEfWeuQyOdaHSV19l+rTou+YL5enXO5
 wmUjYhiwawFcnTDQBm0fevd/QV6AUWoPdyDi3JB9i+LkGHU+29Ie/bsxkSZYKNMfTZNR
 6SdQE9x7oH3lL6ukuXjlGdOgUPQu47wwsw5vYeq/7OeNBS7CysOu153YE2F/+62db918
 t7Ew==
X-Gm-Message-State: APjAAAV7MXpJ+oqEb6MFRkSaocvhSvbHAyEVjGxRsAYNwK4idS/gLEdb
 HE2HYzv2Bm2QWxSPG5ffsA2JgazxV+BeQ1BZ3+Z0sQ==
X-Google-Smtp-Source: APXvYqwQ0sJhbgkRNydnIi4RrSi/dFi7mwr/zU4s+w0Ydcubj32ElrELRy3PvgOlQ56qXz+SBC5iH82TlZ2DYY/65VY=
X-Received: by 2002:a2e:5d17:: with SMTP id r23mr3716224ljb.229.1569604813845; 
 Fri, 27 Sep 2019 10:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190822205533.4877-1-david.abdurachmanov@sifive.com>
 <alpine.DEB.2.21.9999.1908231717550.25649@viisi.sifive.com>
 <20190826145756.GB4664@cisco>
 <CAEn-LTrtn01=fp6taBBG_QkfBtgiJyt6oUjZJOi6VN8OeXp6=g@mail.gmail.com>
 <201908261043.08510F5E66@keescook>
 <alpine.DEB.2.21.9999.1908281825240.13811@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1908281825240.13811@viisi.sifive.com>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 27 Sep 2019 10:20:02 -0700
Message-ID: <CAJr-aD=UnCN9E_mdVJ2H5nt=6juRSWikZnA5HxDLQxXLbsRz-w@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add support for SECCOMP and SECCOMP_FILTER
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_102016_372236_F7DA2C7E 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: Song Liu <songliubraving@fb.com>, Alan Kao <alankao@andestech.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Tycho Andersen <tycho@tycho.ws>, Daniel Borkmann <daniel@iogearbox.net>,
 Yonghong Song <yhs@fb.com>, me@carlosedp.com,
 Albert Ou <aou@eecs.berkeley.edu>, Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Will Drewry <wad@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Network Development <netdev@vger.kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>,
 Vincent Chen <vincentc@andestech.com>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 28, 2019 at 6:30 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> On Mon, 26 Aug 2019, Kees Cook wrote:
>
> > On Mon, Aug 26, 2019 at 09:39:50AM -0700, David Abdurachmanov wrote:
> > > I don't have the a build with SECCOMP for the board right now, so it
> > > will have to wait. I just finished a new kernel (almost rc6) for Fedora,
> >
> > FWIW, I don't think this should block landing the code: all the tests
> > fail without seccomp support. ;) So this patch is an improvement!
>
> Am sympathetic to this -- we did it with the hugetlb patches for RISC-V --
> but it would be good to understand a little bit more about why the test
> fails before we merge it.

The test is almost certainly failing due to the environmental
requirements (i.e. namespaces, user ids, etc). There are some corner
cases in there that we've had to fix in the past. If the other tests
are passing, then I would expect all the seccomp internals are fine --
it's just the case being weird. It's just a matter of figuring out
what state the test environment is in so we can cover that corner case
too.

> Once we merge the patch, it will probably reduce the motivation for others
> to either understand and fix the underlying problem with the RISC-V code
> -- or, if it truly is a flaky test, to drop (or fix) the test in the
> seccomp_bpf kselftests.

Sure, I get that point -- but I don't want to block seccomp landing
for riscv for that. I suggested to David offlist that the test could
just be marked with a FIXME XFAIL on riscv and once someone's in a
better position to reproduce it we can fix it. (I think the test bug
is almost certainly not riscv specific, but just some missing
requirement that we aren't handling correctly.)

How does that sound?

-Kees

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
