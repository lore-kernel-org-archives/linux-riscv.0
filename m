Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ED4C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNIGx3R6iZDh7DNDHEjHAtFj7PBWfSTzqH//6f2ja74=; b=WQ96Bw+OZHOeCu
	bBY2QcHCAwsSiK7al4saj5kb6Xqdkzdx/Ztv7/LRd3DsUWTM+ttI6MsxVQ+297qWzGzxTRhhACdf6
	1naFV+/h1U2l2Bb9JSL73SySKmjAVXlLYkxVUydWy+41eQkbmBswSvJWExxwk0uastLV0jghHyTdC
	l0PcQpI48UQDFvyU6L5yW/SaJ+zdObuSq/PXj+Frcc4sSWXIs2sK9/OmX0v9QrUYXkl+uKIRKEe3E
	D5ws0RsYKHkl2pNeIF2pNAej//vNyaSshaOL80px3nmhZF0tQX48++/OwoL55FiiErq6ntjawEPUo
	mFnxJe8a3qWiK0acbWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxES3-008fbO-Qc; Fri, 03 Jun 2022 21:03:23 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxES0-008fZz-Ln
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 21:03:22 +0000
Received: by mail-lj1-x22b.google.com with SMTP id g12so9675602lja.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jun 2022 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opFA97GGrUrFUT9SvfZGm6iux5I1umYstFz0GJmvO1s=;
        b=jOMm80if0JHj8ErxTGfdh03GdgfvdFKd6Rm1alGSNt5XLLhAvf+YxjFXlBjrOPM+IH
         Bqw7cj6W6JWPuTAHSqT8gS9wHeRaefNGImH/RqKb2oufhCm81PGpOqFMpqe2tNbHIm0J
         7zlfwHc8fYGAs/0Ckmg+fGFHk05ZmM4j08cerriR96KFSyR04OgiYMva6Mp2mHLqLMfS
         j//3vwk/QUFUaP7pn0C3CHL9FMbRoL8KozrVyh9d60Dj1+/BpipN+SD6BOoCXt85vwql
         i+uKT08GonypnGrT7ceT0R5CYHMyfes2Oxln2HFd5Ag3DlumcUWfuaI4Jc1agK7EbgdW
         4tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opFA97GGrUrFUT9SvfZGm6iux5I1umYstFz0GJmvO1s=;
        b=ohHvwSKkwhtVotJ6eg02zRM8wif34pN3FkbXzUX/8OKTUdvUCuwEHjvf33y9YaJE/M
         jvFTNvAus0o/CZzOzcljyGaSPLexK+xLmhzxjc3oThnumHcgmFRpg+8oBjCIVwHk1Dj7
         q1EFVkLkV8xDXsTwwJllFRfPthVm/d6Oer0dqugFk2Ah8EhNblcUmC0Ht1/ijsyQAdS2
         WFpRPydEAI2Gx48nyiuKrHKpd7HijC3eR9I5rGL5cnz9aI+As/q2x9tOQX46adf5a1bI
         3furdWdcWrn6wGqIZc3zuT/w6C+0DjivsHfpnzNWOHYGOCcNaRja5PRGlykdS2+QML/Z
         US7Q==
X-Gm-Message-State: AOAM533DMecxt2QZOb3f1R+MXVmCs6JX6dTYlYsooH+j7PaZk1F1W/qP
	2TAfF1rJOJOeu95UVQZ9vsobEtc4xwbqse2Onrw=
X-Google-Smtp-Source: ABdhPJzmpEZzWq0TOpHSFyPqm8mLnO15YE4hqSuCFi23XZFXNjH9RoA689fYNyTFgdEhQVBfT9Zar6dctkoGXtjQjo8=
X-Received: by 2002:a2e:1f12:0:b0:255:67ae:b655 with SMTP id
 f18-20020a2e1f12000000b0025567aeb655mr10080273ljf.303.1654290197923; Fri, 03
 Jun 2022 14:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220530092815.1112406-1-pulehui@huawei.com> <20220530092815.1112406-5-pulehui@huawei.com>
 <a31efed5-a436-49c9-4126-902303df9766@iogearbox.net>
In-Reply-To: <a31efed5-a436-49c9-4126-902303df9766@iogearbox.net>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 3 Jun 2022 14:03:06 -0700
Message-ID: <CAEf4BzacrRNDDYFR_4GH40+wxff=hCiyxymig6N+NVrM537AAA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/6] libbpf: Unify memory address casting
 operation style
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Pu Lehui <pulehui@huawei.com>, bpf <bpf@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, Networking <netdev@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140320_757243_19BC6D1B 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, May 30, 2022 at 2:03 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 5/30/22 11:28 AM, Pu Lehui wrote:
> > The members of bpf_prog_info, which are line_info, jited_line_info,
> > jited_ksyms and jited_func_lens, store u64 address pointed to the
> > corresponding memory regions. Memory addresses are conceptually
> > unsigned, (unsigned long) casting makes more sense, so let's make
> > a change for conceptual uniformity.
> >
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >   tools/lib/bpf/bpf_prog_linfo.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/lib/bpf/bpf_prog_linfo.c b/tools/lib/bpf/bpf_prog_linfo.c
> > index 5c503096ef43..7beb060d0671 100644
> > --- a/tools/lib/bpf/bpf_prog_linfo.c
> > +++ b/tools/lib/bpf/bpf_prog_linfo.c
> > @@ -127,7 +127,8 @@ struct bpf_prog_linfo *bpf_prog_linfo__new(const struct bpf_prog_info *info)
> >       prog_linfo->raw_linfo = malloc(data_sz);
> >       if (!prog_linfo->raw_linfo)
> >               goto err_free;
> > -     memcpy(prog_linfo->raw_linfo, (void *)(long)info->line_info, data_sz);
> > +     memcpy(prog_linfo->raw_linfo, (void *)(unsigned long)info->line_info,
> > +            data_sz);
>
> Took in patch 1-3, lgtm, thanks! My question around the cleanups in patch 4-6 ...
> there are various other such cases e.g. in libbpf, perhaps makes sense to clean all
> of them up at once and not just the 4 locations in here.

if (void *)(long) pattern is wrong, then I guess the best replacement
should be (void *)(uintptr_t) ?

>
> Thanks,
> Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
