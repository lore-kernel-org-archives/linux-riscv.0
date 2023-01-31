Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF56C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBu7iBspLbrqO0r1mojJy71WzdcAanpz24aC255X3MY=; b=VZiHfP9qyREs6v
	x+lYP2uqfFSdv/nfBtN2f/AUghvxqZzW92/5M1cggE/GiBE3z8+MfjXUmdMKD9ny+mf0rDkJHe/do
	uy255mxZGE7qacViy/ijibsKG322zPj0fOhYSIC3w8OESmBdHdcfveCf7rplF5e67MMKjJrc/aHwb
	ox6a6Hd8JmdpPmSiAfrd6xI8cGF1KbZ1jEwu89ZSVHNVhXMwXSILfdK53ZCs06N5i8dEIqSKfVYE5
	tg5a2k2u31uFlPIiaoFHqxGCs2CFERnIhOUbKxTQ+MVRGke+6cKGIn0ksgWJop0R+2U1skkfUfkS3
	aclB6CRmbAMUVr8kU/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqco-0084uI-Ei; Tue, 31 Jan 2023 13:24:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqcR-0084kZ-LC
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 13:24:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2FC46150B
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5A3C433AC
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675171453;
	bh=BWyo85S31f1UQsUNQTKebmZ46eBrrXm1tWKRlYhorI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uVsX2vLNW0uN243oQHh+8TZbhhHi1hwcc954Z7dNzUkxM09LgVGVGmECZQScBKbkR
	 bPW0VvBkWOwk9OEkIKRPnSKXVtsM/FXUXw4+lSTtEzNoETFEXsHlX5gjXI5jdeAUlA
	 gbSZCIs/s8bSTYpxnPkM/3sgV05JqGaxgv+kV+2OuW3KJT2PgbLPcAqPF30jpOgRhy
	 AfMZgqOBBJbKUJttfPI3HpMMCjOYrFnqjuR+erh4mfYcU9gqGYKO7GYGvItsmK0MfX
	 f/3iWfod9jgGlUVUPIkLNeaH809CuNCmNxSdCivgD3QUQoMGh53nYRnRUApD1Z54HP
	 M0vlwAiQrOwFQ==
Received: by mail-ed1-f47.google.com with SMTP id v13so14353243eda.11
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 05:24:13 -0800 (PST)
X-Gm-Message-State: AO0yUKXHMwuh9rRpdSKNzUBCeOKZmlDY93edWHY/NhgFx6VVhzDqVYeq
	cNILN6KzGdoufOGRxNR6ygHybNKHBL64s0qg8VU=
X-Google-Smtp-Source: AK7set9Otp07JUTr42TmNzrRx4W4b+aOce1FsAQZXhWJMe2XWMax3Bb02kt6uZnvwzr3iW49fdfxJCnT+VkzrGeNVic=
X-Received: by 2002:a05:6402:291:b0:4a2:1776:631b with SMTP id
 l17-20020a056402029100b004a21776631bmr3944330edv.30.1675171451223; Tue, 31
 Jan 2023 05:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
 <87ilgntdef.fsf@all.your.base.are.belong.to.us> <CAJF2gTTaartwjVdmtmsm1FqmYVuAq5_nGYU5zc6nkdTtCm200A@mail.gmail.com>
 <Y9jz+zUDebQ4VLlF@andrea>
In-Reply-To: <Y9jz+zUDebQ4VLlF@andrea>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 21:23:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQsRcUpMk8nvFkEsz_fpVV+v6tpUDcPzaNjqfj+i_VvXA@mail.gmail.com>
Message-ID: <CAJF2gTQsRcUpMk8nvFkEsz_fpVV+v6tpUDcPzaNjqfj+i_VvXA@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: Andrea Parri <parri.andrea@gmail.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	"liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	mhiramat@kernel.org, conor.dooley@microchip.com, penberg@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052415_828551_9D59782D 
X-CRM114-Status: GOOD (  18.27  )
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

On Tue, Jan 31, 2023 at 6:57 PM Andrea Parri <parri.andrea@gmail.com> wrote:
>
> > > It's the concurrent modification that I was referring to (removing
> > > stop_machine()). You're saying "it'll always work", I'm saying "I'm not
> > > so sure". :-) E.g., writing c.ebreak on an 32b insn. Can you say that
> > Software must ensure write c.ebreak on the head of an 32b insn.
> >
> > That means IFU only see:
> >  - c.ebreak + broken/illegal insn.
> > or
> >  - origin insn
> >
> > Even in the worst case, such as IFU fetches instructions one by one:
> > If the IFU gets the origin insn, it will skip the broken/illegal insn.
> > If the IFU gets the c.ebreak + broken/illegal insn, then an ebreak
> > exception is raised.
> >
> > Because c.ebreak would raise an exception, I don't see any problem.
>
> That's the problem, this discussion is:
>
> Reviewer: "I'm not sure, that's not written in our spec"
> Submitter: "I said it, it's called -accurate atomicity-"
I really don't see any hardware that could break the atomicity of this
c.ebreak scenario:
 - c.ebreak on the head of 32b insn
 - ebreak on an aligned 32b insn

If IFU fetches with cacheline, all is atomicity.
If IFU fetches with 16bit one by one, the first c.ebreak would raise
an exception and skip the next broke/illegal instruction.
Even if IFU fetches without any sequence, the IDU must decode one by
one, right? The first half c.ebreak would protect and prevent the next
broke/illegal instruction. Speculative execution on broke/illegal
instruction won't cause any exceptions.

It's a common issue, not a specific ISA issue.
32b instruction A -> 16b ebreak + 16b broken/illegal -> 32b
instruction A. It's safe to transform.

>
>   Andrea



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
