Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE9BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 00:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iuYONgQvIuV1kGDWJ+BeIqt6fw7Ip2+8fnTVu9FafY=; b=phIOptTYVEXzUp
	YFlCdsPmUUDp6Dz9rfGjVYT9XeDFTkHIvWaOnpG/uvuhfMt9CEgfKd8mMSo3dSBfTAiX1/tquh+s9
	BDvlKr3tA+pLi+qgLqtUx+6EsZJVlu25zjtVK4f/Qind0ir8I0WEearQAc1Gp1iRZvnC8RvCo8ajA
	23jJxT/ZfZoWsJh+ypJPH53dIuW9ymsL9SXAyfdAeZxQr293bLv7ErHyNPPNylWLz5SIxR2Xdqr6D
	iqH3z+0do7iC6/9VopCL3d1NQwGPgoIOXBC9jJMQjcSA6QmQeY6C74VrgXadoXaJeqy7XAyM0+muN
	MVN9NO0P8secGRqkhJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mww9g-00C6YT-4n; Tue, 14 Dec 2021 00:58:56 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mww9c-00C6Xo-Of
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 00:58:54 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id v203so42554580ybe.6
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 16:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DK6zjNxaM56y08cW9l0/eZH6KA52RZRKXCnMSTZm6GQ=;
 b=r4oUCYh501EXd/gZuQfYAt0s2rTbK6MmxmU3077cEJ1QHC/9Gnc5rm5+B0cI19otfG
 uVgz8H2hl5oDWhbF3NXerx7LUMB2Y2uYgCgXHFW0tY14V8dXov1MN5y4lr5rt6DTzhzq
 zxZhoRvI5m0wJa7ptIO44i1Gv/VsIG2lUEAmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DK6zjNxaM56y08cW9l0/eZH6KA52RZRKXCnMSTZm6GQ=;
 b=Ny1CXN7L6Bf1dGaPV6gx9Uw/0Zfwp11JKi9kSFRJPLZv/jnJN/uEEf/xCMkWHtnVIV
 JjEuK69nLDTcGBnAH7rJWNYvvwf0RMW8amyIRfR/K6AtbPvVufGU4jBl7qi15DTGnx1W
 x/jzPBkt7iH2LcWbbGv382MICH4MXF03ZJYFTiEc/CEGzIQpxgP+zgHjsDOL7BNdZ4N2
 bOeGcP8vOWnKNzsiarOkHkSAdNql58dBnB45PB68iSixtKoZo6zTVX0P6TjceCJ/Cgro
 ZGSLFGzKYxXJQQA4K0+JdO8ZfJQvbHGp6sXvYuIV6orQyk+55Sep3yqXyYTG+7Qze2aA
 zoag==
X-Gm-Message-State: AOAM5304pmYQ0Rd26L0GHckvCDZgiHooQNk/JjFjdNVnMui/Mi7bmACN
 h4ZWQqF0Xq6Ru/yM7N9IM106RspyAPRWL+U2nig1
X-Google-Smtp-Source: ABdhPJzA01obrLKIOu5kQ51Q+3jIBhNOiwn4TybiXernS3MqCho7FRBxYDqhPVkB86beDZQMZo7IJ5Kw9mvGTIVLh7Y=
X-Received: by 2002:a25:2412:: with SMTP id k18mr2267818ybk.121.1639443531041; 
 Mon, 13 Dec 2021 16:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <Ya4sDX974/dVEOQw@robh.at.kernel.org>
 <CAOnJCUKcYeWaDXY6OxQPrNwKV=4t9zbpSjfQLsL70P+3GE7F7A@mail.gmail.com>
 <CAL_JsqL_DXTJMdUGVwa1T9HqzcJkae=PS12dBbhFS9A22XK6=w@mail.gmail.com>
In-Reply-To: <CAL_JsqL_DXTJMdUGVwa1T9HqzcJkae=PS12dBbhFS9A22XK6=w@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Dec 2021 16:58:40 -0800
Message-ID: <CAOnJCU+3cxXDZcnzFpXb+2CLYk7=0aiD6zyCU5=SCWMCFLKPzw@mail.gmail.com>
Subject: Re: [RFC 0/6] Sparse HART id support
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>, 
 Guo Ren <guoren@linux.alibaba.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Ingo Molnar <mingo@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_165852_881727_385AF272 
X-CRM114-Status: GOOD (  27.57  )
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

On Mon, Dec 13, 2021 at 3:11 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 13, 2021 at 3:27 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Mon, Dec 6, 2021 at 7:28 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Dec 03, 2021 at 04:20:32PM -0800, Atish Patra wrote:
> > > > Currently, sparse hartid is not supported for Linux RISC-V for the following
> > > > reasons.
> > > > 1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
> > > >    which is an array size of NR_CPUs.
> > > > 2. During early booting, any hartid greater than NR_CPUs are not booted at all.
> > > > 3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
> > > > 4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
> > > >    generating hartmask.
> > > >
> > > > In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
> > > > which was logically incorrect anyways. NR_CPUs represent the maximum logical|
> > > > CPU id configured in the kernel while the hartid represent the physical hartid
> > > > stored in mhartid CSR defined by the privilege specification. Thus, hartid
> > > > can have much greater value than logical cpuid.
> > >
> > > We already have a couple of architectures with logical to physical CPU
> > > id maps. See cpu_logical_map. Can we make that common and use it here?
> >
> > Yes. We can move the cpu_logical_map(which is a macro) &
> > __cpu_logical_map(actual array with NR_CPUS size)
> > to common code so that all the architecture can use it instead of
> > defining it separately.
>
> IIRC, the macro is what varies by arch and I would move to static
> inlines rather than supporting:
>
> cpu_logical_map(cpu) = 0xdeadbeef;
>

Sounds good.


> >
> > > That would also possibly allow for common populating the map from DT.
> > >
> >
> > I didn't understand this part. The mapping is populated at run time
> > [1] as the boot cpu can be any hart in RISC-V.
> > That booting hart will be mapped to cpu 0. All others will be mapped
> > based on how the cpu node is laid out in the DT.
> > Do you mean we can move the 2nd part to common code as well ?
>
> Yes, as the DT platforms just loop thru the cpu nodes and fill the
> logical map based on 'reg', I don't think that needs to be per arch
> once we have a common map. But not asking for that now.
>

It would make sense to keep them together in a series. I can take a stab
at it once this series is merged so that we don't end up in
conflicting changes between
two series.

> Rob



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
