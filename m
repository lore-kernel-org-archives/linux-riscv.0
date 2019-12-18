Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15097C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 06:23:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB65F20717
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 06:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n8M6VUcN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qh94WHFK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB65F20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83wGPErMOeYaxiZ5aYYnzkstX9KM8EIS3DlEeudi+x4=; b=n8M6VUcNooN3e4
	ADteWZGJJKguKljIgwkrO94ZpaPDsT7LyGHdaUDWxctARKtwOAkAjgb3ppX3QUiyCM/iK5wTPHKBM
	m3eRsXdcBZSjhugEqSzv0aY2L5m76uXqWF+t0ZrYHTeGhN34rwn7W86qFG6odKcEAgat89sEU72iF
	39qSAuagD7BrZoqCRljJ+F++bIrVZiR2FMH5++ZWIsZHQsrdfMoQ+XelbCu2+y/KPjejE5NsqhiTk
	jrtCLKMgYS4fr+Os3U2MetN+kNxQO6drt1ZERn4JoW8Cbsr1txmHQFU7LCOCmBG01QNwKQ8cJx1cn
	ydlveZEUfShTF+OMn43Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihSkT-0000vJ-LN; Wed, 18 Dec 2019 06:23:53 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihSkQ-0000uu-IQ
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 06:23:51 +0000
Received: by mail-qv1-xf44.google.com with SMTP id y8so327489qvk.6
 for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2019 22:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=83wGPErMOeYaxiZ5aYYnzkstX9KM8EIS3DlEeudi+x4=;
 b=qh94WHFKzmWpOxhmketEE7Bcbpa1s0QhiE1e3Qx9PHPiLcQ4E0y0krG98X82gLG23p
 FRLD+hPKlMgLE7hP6CsUUgo+iplVG/ueVq5KfRUXSQpwW5ogwEEIGPLxXVrnIEdH/aEK
 pjs6MVNs3ZO5tsITEsyw1kZAFHNdrgxkNgk5uzIDu1tnceatAMZ5XUVYu74SGfKPGQKM
 O6ldB+SvuJLGM+4UmdI6If2GJ3nRfVtUAUo+RsdymGhyN0bqLoz+ZHiWfhGDnkJHRK0w
 a6Fi2pa+E7rDhsac0BYM7dBiucckRkx+Zya67gB/jGN4zESpaO2JQXNkNI+EHCsXCUOL
 QJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=83wGPErMOeYaxiZ5aYYnzkstX9KM8EIS3DlEeudi+x4=;
 b=rxZQ4fuiR3YIl7g6AfE4p20GkidUohaIibe2ScFH7mAvqcCvy4+48LykJjNF/y3HZr
 m9FqZ2GBUOpW0ZUL4HenzmMoQdHCoA+C2pQPYkp7/hr6h8qYq1Bm0/R38+6my31W27y4
 o+HyE/8trN6T6+KNHtWzNmfOgCBJtfhvZ0vdh19zXlKXgeEwC9bnhstVTOaEAaETannA
 HYGK7c5ViNBhCAK2SNJTftoB7W5Tsr46S2kEWhJjQFETRVBHimtzHXESHXSiKX0B6sJZ
 o7RLJ/JK/cbsc9S8lp3pskqK3rWgK3gu0hgWLmQyxtQ6hUivKHJApJkawXf33ztoEGqC
 tqEg==
X-Gm-Message-State: APjAAAUov0j/0fgQeVbMqEpGyDvi5X7yjzfANHrLcOeAVm5IFtLUIiJM
 Dw4Zy7wSwJHp3xPZ8jmPxub0HEDBU70hXWEiHQM=
X-Google-Smtp-Source: APXvYqzCoubsE/pqnJpJe9yVYRDL5Gr4QuWbyeNA0WlAk62SYVgn1sd70PuYLh+olS29TI2VUwq/WC8BX8MFBLXslrE=
X-Received: by 2002:a05:6214:707:: with SMTP id b7mr811157qvz.97.1576650229139; 
 Tue, 17 Dec 2019 22:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20191216091343.23260-1-bjorn.topel@gmail.com>
 <20191216091343.23260-7-bjorn.topel@gmail.com>
 <7ceab77a-92e7-6415-3045-3e16876d4ef8@iogearbox.net>
In-Reply-To: <7ceab77a-92e7-6415-3045-3e16876d4ef8@iogearbox.net>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 18 Dec 2019 07:23:07 +0100
Message-ID: <CAJ+HfNgmcjLniyG0oj7OE60=NASfskVzP_bgX_JXp+SLczmyOQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 6/9] riscv, bpf: provide RISC-V specific JIT
 image alloc/free
To: Daniel Borkmann <daniel@iogearbox.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_222350_610593_F8F99F2B 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org,
 bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Dec 2019 at 16:09, Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 12/16/19 10:13 AM, Bj=C3=B6rn T=C3=B6pel wrote:
> > This commit makes sure that the JIT images is kept close to the kernel
> > text, so BPF calls can use relative calling with auipc/jalr or jal
> > instead of loading the full 64-bit address and jalr.
> >
> > The BPF JIT image region is 128 MB before the kernel text.
> >
> > Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com>
> > ---
> >   arch/riscv/include/asm/pgtable.h |  4 ++++
> >   arch/riscv/net/bpf_jit_comp.c    | 13 +++++++++++++
> >   2 files changed, 17 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/=
pgtable.h
> > index 7ff0ed4f292e..cc3f49415620 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -404,6 +404,10 @@ static inline int ptep_clear_flush_young(struct vm=
_area_struct *vma,
> >   #define VMALLOC_END      (PAGE_OFFSET - 1)
> >   #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> >
> > +#define BPF_JIT_REGION_SIZE  (SZ_128M)
> > +#define BPF_JIT_REGION_START (PAGE_OFFSET - BPF_JIT_REGION_SIZE)
> > +#define BPF_JIT_REGION_END   (VMALLOC_END)
> > +
>
> Series looks good to me, thanks; I'd like to get an ACK from Palmer/other=
s on this one.
>

Palmer/Paul/Albert, any thoughts/input? I can respin the the series
w/o the call optimizations (excluding this patch and the next), but
I'd prefer not given it's a nice speed/clean up for calls.

