Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E03C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFRnH6k+vAQUOlvAShEFO1exzPdMs4YlSwpKbwAnD48=; b=Ko5nvcfzX/I9Oy
	tXi+3DSY0wRr6CFyYpv8UrtHusKZLPblcrltbmqKf6R2kF1ewoSGWzPwaTZYu7hb5hs7vxqB2uE7Q
	xEquVlb0p4vUxhkfIGuTRZq0NGqkwOdAaExrRyiiemzgFu+SknrBSEaIuaNTvn589P63CmzyXeQMm
	Nf8aaTsoJoWF38weYWhrbGm1XGB2eDT9I5OXGPbtfpGOy+tpn3gHHSU05szU8jSIhzl9pdKFU3FO3
	Br3I6cycvMH+ECLlGyw4xRAYSM3dY7DW1sIP/lZDOhen5LvKcraZFwk0iX31bwEsAIxe+++ZR8naf
	jk7Ob0o7iIhsES1gJ0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf70-0000000BwXA-1HZ7;
	Mon, 06 Jul 2026 08:55:34 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf6x-0000000BwWi-0rOc
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:55:32 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1433387a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783328130; x=1783932930; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3v+HDjcgZfmVu7uYp2p3M9sp3YfufYRorQ2bJY9UiY=;
        b=XR4yS43mqnvA/xqtrD15vLczDjMuP1Wc4UTKtL1bqFaBrlsKB9dfcpsMGjVK23MuOl
         v5qZaLlSfdm++d9avrLcbJj8lJeA5d+37mnnlPGeUMmAKiacRDY2I5E7P45hZAgyH1Nk
         5fvmzEwkvt7KXSaWHO9UszC6Qoc+a0FXYR7Px/MH8rTIzBlcGNSN9qaXomJGLc2aV+c5
         BcrZVU+iFBAP2C2UWyVcm6imIDBztGZdquZdhw5Sq7nFCRxHR8xZaekg59X/2QumV3Gy
         e86h/3nEUXYfCOlQKdjyWlHu2Rp0f2i3L9JCdBZgqGHqaJ9JtE96cAe93XGSUCB4UvB6
         vHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328130; x=1783932930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3v+HDjcgZfmVu7uYp2p3M9sp3YfufYRorQ2bJY9UiY=;
        b=Jtu9sIIvvx8h7/6wkR95LgD7luKrcRFNwz4gYgTFzVhKiJuGFMKKyk0rxrvgyqM4CZ
         V0eSKi83bAGKPfAZW4XzEE9pXzz2wrRNx15+6c3WygSv9cMVWHQ3nhxpkQzi6RTB6LRg
         Io7+PdLiIWzt8Lb5/JDukSTIlPacFY9bWWnEbHvRHc1l7i86wnTAwKR+f5piulSWTpMj
         gs0/1iqOP0HH2gZCkNuT3nNephI5ethpJJ2pCTE3Sk/em29GVA/NxsUPXfMUwNZKA9hh
         +nZxyYaqFMmrp7Hg8cTsrUsPa0RouL9b3E8ktGI2/boRClJSpeMWp/ZHiWdbAY8LdwuM
         JiCg==
X-Forwarded-Encrypted: i=1; AHgh+RqUcx9xXShHdNXHADLUERpSNy1enh3EEupT38PonOn28nkC1DV01uxvsl3UeUwW69ed/4ALIsCbUZ12tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylJvSjPaB1vt/snvPWEPvnx/mykuDH6OeAh6bwzGisDxIhy/OC
	zyxuT5pHSS+tozjJodqYh9hW6IytfRCrZg1cFMARSZVMwXVL73YWeXxl
X-Gm-Gg: AfdE7clLFcOr0+yWpFLPKnxVDCbCgUHnYA3ccqtTK7S7bQeTn3cPRkgowkfriGJxiYx
	nNRsR60T9FWA0cmPpzbjPoqqbTA3F+OVsF3jwE9sQ9GSdILy3VJNZyK71R7W5MCmjnDYcrNVv8C
	sdEjIqagJR3NDRkyIbYkK8MrOs2msncycSSJpC9pjdJMrL3Pqv4VaWREM1Gh0fLAieS+FNbFvf3
	0YFXCwy8HDG8mH9hIeJYmcz56UUSXfp1t5CyykHxT4Ce5hnMutJlwRJWY/HJiwpF6rYXWp0bg7B
	907eScEKH6eipgB6Q7fnjmGAbF2QHx0Hp9+Zgs6gP6jaiAghYiOyXByrS+YzH/jz6NskKSHqX/B
	DBJnojhnRlPzKFh6UAaUaMV4Infp3fYVMfhcYtYZCsr9yy+uIEuQaLT6xzGuviW2L0oykOzCDmr
	OlT1ENY2Kwz0DdPVzmnrZ//++PV1l/lE7IasN0tjAnJSFDzHIGzYuifHL9Kw==
X-Received: by 2002:a05:6a21:32a3:b0:3b4:b24e:27b4 with SMTP id adf61e73a8af0-3c03e1ff0b4mr11851439637.1.1783328130255;
        Mon, 06 Jul 2026 01:55:30 -0700 (PDT)
Received: from computer ([2405:201:d015:d26b:41c5:151e:6e02:36c7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm79992955c88.9.2026.07.06.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:55:29 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:25:19 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, pulehui@huawei.com,
	alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	puranjay@kernel.org, shuah@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 3/3] riscv, bpf: Remove BPF exceptions from
 BPF CI denylist
Message-ID: <akttdwZOqvgj4h39@computer>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
 <20260628081710.113333-4-varunrmallya@gmail.com>
 <878q7yy28o.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878q7yy28o.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_015531_246667_2F3E2AA2 
X-CRM114-Status: GOOD (  18.23  )
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

On Sun, Jun 28, 2026 at 11:00:07AM -0700, Bj=F6rn T=F6pel wrote:
> Varun R Mallya <varunrmallya@gmail.com> writes:
> =

> > This patch removes BPF exceptions from riscv64 denylist on
> > BPF selftests since support for exceptions has been added now.
> >
> > Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> > Reviewed-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >  tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testi=
ng/selftests/bpf/DENYLIST.riscv64
> > index 4fc4dfdde293..9268351ce4c1 100644
> > --- a/tools/testing/selftests/bpf/DENYLIST.riscv64
> > +++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
> > @@ -1,3 +1,2 @@
> >  # riscv64 deny list for BPF CI and local vmtest
> > -exceptions					# JIT does not support exceptions
> =

> Hmm, reading your cover the kselftest run still says "#113
> exceptions:FAIL", so from a CI perspective this is not much help. ;-)
> Can we restructure/split so that we're not bitten by the lack of
> BPF-to-BPF calls and tail calls?

Yeah, that was pretty foolish of me. My next version won't include a
denylist change, but if [1] lands, then we won't have to
worry about this anymore!

[1]: https://lore.kernel.org/bpf/bf647816-d292-419c-b79f-fc048122aebc@huawe=
icloud.com

> =

> Thanks,
> Bj=F6rn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
