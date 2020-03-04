Return-Path: <SRS0=FYYd=4V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC22BC3F2D1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2020 10:22:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900872166E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2020 10:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GTS6Tht8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBPRt+y4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900872166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I473f1xOp0xcoMWJcjpZgjb3E6lfpmms9lzoIFvnCxw=; b=GTS6Tht839l4Vv
	MtQIvDNcYJuW/d8pjUq9JsV9bDDk6Dd7NfaLrMMHmWHutWdcAyH6Mpoe41aPEsYO68n5AXN3gPi5q
	h3Op2VMCksqE2jWTnvYAlec7y2QR5tQ3dgCCMVkPrhwcAt1AXDxgdqYwZEp2a5hYDMX8Z6O+PPN2E
	re8gNFFeY18d5AXKB1YBxSI6BrPBsxQIgtuoR6XXOkgTAOIzdfmwuF2vkNrvdpwk848wmNME0spMj
	rNlOtr1AHDTSBVw8Rxj1oA1LWwFQevSJ6HwzeyEE/uRfZTyCUtgwGHyCh1+/U04xgXmPaTDe5aHjj
	Ek7Im5mmhF37ViOAs0fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9RAB-0008Bv-Dd; Wed, 04 Mar 2020 10:22:03 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9RA8-0008BS-KZ
 for linux-riscv@lists.infradead.org; Wed, 04 Mar 2020 10:22:02 +0000
Received: by mail-pg1-x542.google.com with SMTP id b1so777927pgm.8
 for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2020 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I473f1xOp0xcoMWJcjpZgjb3E6lfpmms9lzoIFvnCxw=;
 b=oBPRt+y4oU6gnbNSeAk4XBIEVcAjxjMq228H+/Kf1FVzxqZPtbXDx2lA2jlKcj/biY
 fG/RGMGcmrEFCg9dDC7ty3/HE0WtyL19YMCDaBKexJvIsCgBtG6nDkvJMeA0UcAa4Yat
 mlT8AjN/Ihe6sSztMgQILbSACeIXn0r4gKZbjjQxtn4uKXukNLwGp2cIHOB4tQMWi1O8
 /q5EcQTNJfhWWrmLgM+tfHSDgF1zxInkynQDfYwyiI+Jfuv7S9MpK/hMrxKPsooH7ES9
 l9OR5F3KSOAuQxuGccvg9gZxHVJspJxKWvjARF6aTmNR/nHxtUUSX8a1rY+uIlnzblVe
 cqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I473f1xOp0xcoMWJcjpZgjb3E6lfpmms9lzoIFvnCxw=;
 b=PCr8OA2DyHRZumz5T+jyqGBSnmqzBPvvPdi1R9V5TqeUPRw3bPGealXFCbSm4NELqL
 GcgGYxA7CLRRRqXzWyfHklBvdVXzgyQ9d7wxnLsfYEhZlgU+1bCWDUg9MVHLJR5yUD1j
 RDwlbj6m7CngTaeW4VVRQCKjR2hp4HGx4au+vRwjr0/THzJV6RgVSzafmV4g36Vfz4CH
 6+r7d8N2QM9GiXY5AhfaHvMpxAyFdhXvh//5NBK4QhhHTKz1PQWYfkL12UOCOyZupL0l
 4O4GlUZx9L7zXRjUQMfLVibOoFko2Ge5TM0tsyHX1w3F/kNzqGrsdkpheOfqnVlt7EvM
 ZxqA==
X-Gm-Message-State: ANhLgQ2fLSj66B+Gh90zPe45LIE7ZR3qEhnuYKktoxctgswFnSyc9WKA
 MNp9cJ9BGN1aZfMix/2FaXAwbJGPiMC13nDHv8o=
X-Google-Smtp-Source: ADFU+vsSfrM9BQwFeyP+XfNzdF7yaI72ARkLmWTSOk+5nI1rJvvwH2iEy8/o/nVhEv9EKoIYE2/Tn2seuagHTt0BorI=
X-Received: by 2002:a63:1246:: with SMTP id 6mr1947203pgs.4.1583317319277;
 Wed, 04 Mar 2020 02:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20200303005035.13814-1-luke.r.nels@gmail.com>
 <20200303005035.13814-5-luke.r.nels@gmail.com>
 <20200303100228.GJ1224808@smile.fi.intel.com>
 <CADasFoCq7S2KRYg+ghAKt1e+hELzEMJaNH74sGdjM7E=z3KcnQ@mail.gmail.com>
In-Reply-To: <CADasFoCq7S2KRYg+ghAKt1e+hELzEMJaNH74sGdjM7E=z3KcnQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Mar 2020 12:21:51 +0200
Message-ID: <CAHp75VezOTk4kURAkS6OQqPjdiYsPE292ix+WHAPvs8vGpCfGg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 4/4] MAINTAINERS: Add entry for RV32G BPF JIT
To: Luke Nelson <lukenels@cs.washington.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_022200_679498_D3607942 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: Song Liu <songliubraving@fb.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alexei Starovoitov <ast@kernel.org>, Netdev <netdev@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Luke Nelson <luke.r.nels@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bpf <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 4, 2020 at 4:34 AM Luke Nelson <lukenels@cs.washington.edu> wro=
te:
> On Tue, Mar 3, 2020 at 2:02 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > > -BPF JIT for RISC-V (RV64G)
> > > +BPF JIT for 32-bit RISC-V (RV32G)
> > > +M:   Luke Nelson <luke.r.nels@gmail.com>
> > > +M:   Xi Wang <xi.wang@gmail.com>
> > > +L:   bpf@vger.kernel.org
> > > +S:   Maintained
> > > +F:   arch/riscv/net/
> > > +X:   arch/riscv/net/bpf_jit_comp.c
> > > +
> > > +BPF JIT for 64-bit RISC-V (RV64G)
> > >  M:   Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com>
> > > -L:   netdev@vger.kernel.org
> > > +L:   bpf@vger.kernel.org
> > >  S:   Maintained
> > >  F:   arch/riscv/net/
> > > +X:   arch/riscv/net/bpf_jit_comp32.c
> >
> > Obviously this breaks an order. Please, fix.
> > Hint: run parse-maintainers.pl after the change.

> Thanks for the comment!
>
> I'll change the entry names in v5 to be "BPF JIT for RISC-V (32-bit)"
> and "BPF JIT for RISC-V (64-bit)", similar to the x86 JIT entries.
> This will pass parse-maintainers.pl and the entries are still in
> order.

Thank you!

--=20
With Best Regards,
Andy Shevchenko

