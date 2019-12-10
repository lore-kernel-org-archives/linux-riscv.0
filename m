Return-Path: <SRS0=1Sxd=2A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66DFC2D0C5
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2019 09:36:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA3F207FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2019 09:36:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hrm8SmG9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA3F207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=orange.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mgAZ5+aB/GvC0mnzXTVn3f/oGiktcBasZAmAbLkZ9JE=; b=Hrm8SmG9nkhhMk1CzmIDLuAgb
	zt47xvv6j439QuERsCU8U4DQuo6JnYiKjcOrxgkgIBj2i6AYk0FsaXcix3p7PKaFqHBlNaVyRRJlZ
	6z+PlQVLr2ibvyZBA0E8Zov+ej6vbVAP9VEDmsb+bifVJylxswVc04+5I6Ipzs+sTCOS2wudkj7uB
	hNP4DA1tWQOJljkOcqMVJOdv4A97xB4x7r2nthFpE4FP2TBHe6vh4PRzUrqG+Kcgtoa1KH/xwj4+t
	R1sp65aqpU+zBS9KIZcau+a85BIFl1NKGWazcxQQu3tXBH1nGWp2MSWXZI1h9UYONA34pnscq6JGa
	d8xOTzb0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iebwC-0006mc-ET; Tue, 10 Dec 2019 09:36:12 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iebw9-0006le-FU
 for linux-riscv@lists.infradead.org; Tue, 10 Dec 2019 09:36:10 +0000
Received: by mail-wr1-f66.google.com with SMTP id c9so19199032wrw.8
 for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2019 01:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mgAZ5+aB/GvC0mnzXTVn3f/oGiktcBasZAmAbLkZ9JE=;
 b=eTfg5cqbhKBt1wOB0+l3x5MO7zJXygvKbavTIK+KC1YsbeztuEFIgKPTwpPupHFTQA
 mE3vh63pScY/ZB6zoxi/D7piCQx+pg08ap2HE26b0/Zr8pHRtgrbr4FOqjwbWJ/S3mK0
 46zG/XSMQ1TqEt6IbUmQFRjtMUfeflkGu9Yjvz6uNFx2qTuAcFyNoq+j+OmFkvIgu4zs
 2BppbRn1MTpP8fMEd6vvZytxs2MLv1JnNW33evT7gih9819H/sfVQSG4fbBfn81/h+R5
 Z6bNdFvabGxOC6b5qCFAJeEeC+fOM1fa/aQNrJFtRAqJkAxtTKsczqitzFQuodSdtB5h
 zwgQ==
X-Gm-Message-State: APjAAAU5iQYV0cxzPQcM/L1JGCZorIahXs4EoIfACvL39i9+RKJgdrn9
 lXHWkqr28BpFwJcmTM+Emj8qJHWWg5E=
X-Google-Smtp-Source: APXvYqw6FVjHfOx8q4A7LdcghN9XlvKV2lcjY8QJoImoDiAVgnjuYhzenEbMcT7oIrBlD+tcehYX5g==
X-Received: by 2002:a5d:6349:: with SMTP id b9mr2137418wrw.346.1575970567440; 
 Tue, 10 Dec 2019 01:36:07 -0800 (PST)
Received: from Nover ([161.105.209.130])
 by smtp.gmail.com with ESMTPSA id m10sm2609149wrx.19.2019.12.10.01.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 01:36:06 -0800 (PST)
Date: Tue, 10 Dec 2019 10:36:06 +0100
From: Paul Chaignon <paul.chaignon@orange.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf, riscv: limit to 33 tail calls
Message-ID: <20191210093605.GA31145@Nover>
References: <cover.1575916815.git.paul.chaignon@gmail.com>
 <966fe384383bf23a0ee1efe8d7291c78a3fb832b.1575916815.git.paul.chaignon@gmail.com>
 <CAJ+HfNgFo8viKn3KzNfbmniPNUpjOv_QM4ua_V0RFLBpWCOBYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+HfNgFo8viKn3KzNfbmniPNUpjOv_QM4ua_V0RFLBpWCOBYw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_013609_523163_EB86F2A1 
X-CRM114-Status: GOOD (  16.54  )
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Paul Burton <paulburton@kernel.org>, paul.chaignon@gmail.com,
 Netdev <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <kafai@fb.com>,
 Yonghong Song <yhs@fb.com>, Mahshid Khezri <khezri.mahshid@gmail.com>,
 Andrii Nakryiko <andriin@fb.com>, bpf <bpf@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 09, 2019 at 08:57:27PM +0100, Björn Töpel wrote:
> On Mon, 9 Dec 2019 at 19:52, Paul Chaignon <paul.chaignon@orange.com> wrote:
> >
> > All BPF JIT compilers except RISC-V's and MIPS' enforce a 33-tail calls
> > limit at runtime.  In addition, a test was recently added, in tailcalls2,
> > to check this limit.
> >
> > This patch updates the tail call limit in RISC-V's JIT compiler to allow
> > 33 tail calls.  I tested it using the above selftest on an emulated
> > RISCV64.
> >
> 
> 33! ICK! ;-) Thanks for finding this!

Actually, Mahshid found it during her internship because she wanted to
check that the number of tail calls was limited.  And now I feel so
naive for trusting the doc...

> 
> Acked-by: Björn Töpel <bjorn.topel@gmail.com>
> 
> > Fixes: 2353ecc6f91f ("bpf, riscv: add BPF JIT for RV64G")
> > Reported-by: Mahshid Khezri <khezri.mahshid@gmail.com>
> > Signed-off-by: Paul Chaignon <paul.chaignon@orange.com>
> > ---
> >  arch/riscv/net/bpf_jit_comp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
> > index 5451ef3845f2..7fbf56aab661 100644
> > --- a/arch/riscv/net/bpf_jit_comp.c
> > +++ b/arch/riscv/net/bpf_jit_comp.c
> > @@ -631,14 +631,14 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
> >                 return -1;
> >         emit(rv_bgeu(RV_REG_A2, RV_REG_T1, off >> 1), ctx);
> >
> > -       /* if (--TCC < 0)
> > +       /* if (TCC-- < 0)
> >          *     goto out;
> >          */
> >         emit(rv_addi(RV_REG_T1, tcc, -1), ctx);
> >         off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
> >         if (is_13b_check(off, insn))
> >                 return -1;
> > -       emit(rv_blt(RV_REG_T1, RV_REG_ZERO, off >> 1), ctx);
> > +       emit(rv_blt(tcc, RV_REG_ZERO, off >> 1), ctx);
> >
> >         /* prog = array->ptrs[index];
> >          * if (!prog)
> > --
> > 2.17.1
> >

