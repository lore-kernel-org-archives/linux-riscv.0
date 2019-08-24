Return-Path: <SRS0=SIOo=WU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D51EC3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2019 01:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64FF92173B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2019 01:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgPpzAn8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="E0CEXHhi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64FF92173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTgdss7uJ5kBj510C7UV20XjvJBvvA+RKAo3ct+zdYM=; b=rgPpzAn8iPwp89
	ealfL4Uh+v71JbzQB9rMRJgxSq3Z7axgMwMUea95QwkeSDUClqD8lE6ovWfXDSY6AL9wr/nKnYhdr
	2dT7XxmEUUvBtwWhVpnE1QEP57oEcFLC95DYFvl6+KvlBo4rlwq3FW+D4ePBZDYB1SaPwaCHR7Gvt
	wXSYlXCd9pq8gJxF0DQsB0Wtjl3H1Fbqfqmfi/8id6kP3qT4aGYq8+vmJZAh2/vRgzOAtOFaBJAmt
	rdrRKHgAvscKSkl+yeWy2SVEJLP3TM+A3AyYgyAvZMF/ZqBWjkpUT14TlarhN/lAtgw/47fqPceT4
	KW/8zhBu4Vzl6dn7FDFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1KhC-000896-5W; Sat, 24 Aug 2019 01:18:22 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Kh9-00088h-6j
 for linux-riscv@lists.infradead.org; Sat, 24 Aug 2019 01:18:20 +0000
Received: by mail-pg1-x542.google.com with SMTP id n4so6737629pgv.2
 for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2019 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=hFC89CjETE6kSjgcVSwHDSYQXSiMoiEBQa3e+HIYt4Q=;
 b=E0CEXHhixhPPnduz4oCvzrE4SYv5LhBG86wlPOFAaizB/7Pzj9s3MqGo3cOQiKxH2H
 WMYn5lQwwEBQZbEaeBAENQsk/YFrhXIrg0RzuZMLncZ02XfQwLbYWYR9rt3b/takcJhE
 aSXhDyTFtKSGnsa2qZk6RJyQxRh2sPqWCqyGT3lBAIH99Hqpr3Pp4LuQHYrpj1T7RfKD
 NxtKlXH80DwCrwLgtye00jD3r875YOCXbKImkxbcOtaKojLdfF0B3pPECxdxWzjFWKZR
 a9AcMclmd+i08OU7h4fTOBV/Ey/MmTbLs2v1E5yu8DxLZcGN2G9BtmB5htE9RbR0cpgD
 S6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=hFC89CjETE6kSjgcVSwHDSYQXSiMoiEBQa3e+HIYt4Q=;
 b=dgAYR9JymhPu7xfdVR+xzhZFrL69HCOs11hmrrj1sLVednzoZYxF5XI3ZX2lxDw4vX
 khlEHfKH9QwqEtLrAxwQoSkrtj3jNNy0qUK9Cq6vGJHjlAYGYGhwtCLd/mxsETxUeX14
 j2ZSrEPmgRRy1GY0uUj0m26s/xgqHL6ydDXKd2jTdpgua7gGXwLBJV1lRAjgljHPFc9+
 xxwo6Xo/OYcJHXzZ5lqfu7sRkr3hBqDJAzEjy00fxsNHFzS5cxEOaR0sSxpTCdAkJDco
 e/jEnUykq/bXcpIMYvaXshcWBq5HCHu9yNM55gDCLcYVdBbcANqnO+ni4n3k7s89ihsz
 Uggg==
X-Gm-Message-State: APjAAAUZWVCePqlKiMq9DyKmy07VTClmwuEi/pT1L4HoBSRmeIVlE/MR
 3sDIsGsZvqWhtsXFJf5V22/iDg==
X-Google-Smtp-Source: APXvYqwuX2JonhdUQesJbI454z6VwBTbUlXdP9d0uxq5+0I9DCD2aD552ligSdNeFL7iVFwXuBSZOw==
X-Received: by 2002:a17:90a:b890:: with SMTP id
 o16mr5418766pjr.41.1566609497976; 
 Fri, 23 Aug 2019 18:18:17 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g2sm8023188pfq.88.2019.08.23.18.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 18:18:17 -0700 (PDT)
Date: Fri, 23 Aug 2019 18:18:16 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v2] riscv: add support for SECCOMP and SECCOMP_FILTER
In-Reply-To: <CAEn-LTp=ss0Dfv6J00=rCAy+N78U2AmhqJNjfqjr2FDpPYjxEQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908231816500.18210@viisi.sifive.com>
References: <20190822205533.4877-1-david.abdurachmanov@sifive.com>
 <alpine.DEB.2.21.9999.1908231717550.25649@viisi.sifive.com>
 <CAEn-LTp=ss0Dfv6J00=rCAy+N78U2AmhqJNjfqjr2FDpPYjxEQ@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_181819_253180_2794D265 
X-CRM114-Status: GOOD (  13.93  )
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
 Oleg Nesterov <oleg@redhat.com>, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Tycho Andersen <tycho@tycho.ws>, Daniel Borkmann <daniel@iogearbox.net>,
 Yonghong Song <yhs@fb.com>, me@carlosedp.com,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Will Drewry <wad@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>, netdev@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Vincent Chen <vincentc@andestech.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 23 Aug 2019, David Abdurachmanov wrote:

> On Fri, Aug 23, 2019 at 5:30 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> > On Thu, 22 Aug 2019, David Abdurachmanov wrote:
> >
> > > There is one failing kernel selftest: global.user_notification_signal
> >
> > Is this the only failing test?  Or are the rest of the selftests skipped
> > when this test fails, and no further tests are run, as seems to be shown
> > here:
> >
> >   https://lore.kernel.org/linux-riscv/CADnnUqcmDMRe1f+3jG8SPR6jRrnBsY8VVD70VbKEm0NqYeoicA@mail.gmail.com/
> 
> Yes, it's a single test failing. After removing global.user_notification_signal
> test everything else pass and you get the results printed.

OK.

> Well the code states ".. and hope that it doesn't break when there
> is actually a signal :)". Maybe we are just unlucky. I don't have results
> from other architectures to compare.
> 
> I found that Linaro is running selftests, but SECCOMP is disabled
> and thus it's failing. Is there another CI which tracks selftests?

0day runs the kselftests, and at least on some architectures/Kconfigs, 
it's succeeding:

https://lore.kernel.org/lkml/20190726083740.GG22106@shao2-debian/

https://lore.kernel.org/lkml/20190712064850.GC20848@shao2-debian/

https://lore.kernel.org/lkml/20190311074115.GC10839@shao2-debian/

etc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
