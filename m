Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32286C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PS72q4LL6d49QVz9i6KAIx6vUIFMkazOXbNKx9Zip4=; b=jGie1xZoQvTdA5
	E18MFNKptMBjNglNiI1Cgah691vxuZ/mTGxwwiEVLfz1g7yi4P8t+M4l6BtFUghxaERlhdmZ6F5Ed
	xWTj452PukS8y9swZGfE1wcrfoe9XpODSA4Y3KTclVyxf/yNHvDQZI9NTVjOcuJ46xO7tdPdfKkCm
	6CG335FfBqbXDw/arZ9Ill3cJZr/Mw00vGodZQCUWcb2vCdBZKZiokt4QO9dOTzwxXmWoIGrvfhl8
	Wg5igeStxhWBf67prydCXpZneq4vsBHnEDyEg2R7M7aWSAVwhi//5YOIXyErNpY9lKoVIeqCMh05F
	zH8/5sERlqW5I5+cJwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwuTx-00Bvtr-C8; Mon, 13 Dec 2021 23:11:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwuTq-00Bvs3-V9; Mon, 13 Dec 2021 23:11:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBD41612B4;
 Mon, 13 Dec 2021 23:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9FDC3460F;
 Mon, 13 Dec 2021 23:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639437096;
 bh=PEAcjN37oxZX/9iYX69bn4bF0yxfwXfCPZeIHGvag1o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WGgkedP1ZGyFUChVrHAG2xisYq1ae4jaEMuEDN8TPsxg4A+2nNp8IA7HpBLt4Pg/y
 NppgwW/qXmVl/19MDI+RwV9i6+Jk/1DU3BiKT0BLrQ+Cmxl7JkRMmHWIEZ7ebVrRtJ
 3OOZIET6UL2kKjt5bCiTjHct1vj0O/D2kxOdtXQvrSBt83AaTZ7jSZZsDeeLajkdtF
 hBcCoOXoc00p7c5R5B3zORKpXuI+ea5BF9SQNww8Ep+uYm170K+aLZ5zlm1WKGb4FU
 LuVNHCTA9Z3bCb/19fFwYWLdBC+YMSU96WUoKyIlTArJo52YroV4lAnjJS6A1r9Jtg
 0qLPmFu2w+hIw==
Received: by mail-ed1-f53.google.com with SMTP id x15so58170016edv.1;
 Mon, 13 Dec 2021 15:11:36 -0800 (PST)
X-Gm-Message-State: AOAM531nvddoSKl8r6NQXO+mdFbm0/jcwm+flxGkZNgsGRSQ+kXGFOCf
 ohn+H7sDYwdHc3mzAwmYStQUr0vm1GlMlchiDw==
X-Google-Smtp-Source: ABdhPJwWE2mZhgSkGIpbmG4K7J0EkVEt1f+A9VeATTghLyvHR5AeReFxWiF3WIzNM5rkdd1zS1o+iWUBbFMYvX58O/0=
X-Received: by 2002:a17:907:94c2:: with SMTP id
 dn2mr1439977ejc.325.1639437094406; 
 Mon, 13 Dec 2021 15:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <Ya4sDX974/dVEOQw@robh.at.kernel.org>
 <CAOnJCUKcYeWaDXY6OxQPrNwKV=4t9zbpSjfQLsL70P+3GE7F7A@mail.gmail.com>
In-Reply-To: <CAOnJCUKcYeWaDXY6OxQPrNwKV=4t9zbpSjfQLsL70P+3GE7F7A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Dec 2021 17:11:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL_DXTJMdUGVwa1T9HqzcJkae=PS12dBbhFS9A22XK6=w@mail.gmail.com>
Message-ID: <CAL_JsqL_DXTJMdUGVwa1T9HqzcJkae=PS12dBbhFS9A22XK6=w@mail.gmail.com>
Subject: Re: [RFC 0/6] Sparse HART id support
To: Atish Patra <atishp@atishpatra.org>
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
X-CRM114-CacheID: sfid-20211213_151139_145000_3FCA3FF6 
X-CRM114-Status: GOOD (  25.40  )
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

On Mon, Dec 13, 2021 at 3:27 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Dec 6, 2021 at 7:28 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Dec 03, 2021 at 04:20:32PM -0800, Atish Patra wrote:
> > > Currently, sparse hartid is not supported for Linux RISC-V for the following
> > > reasons.
> > > 1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
> > >    which is an array size of NR_CPUs.
> > > 2. During early booting, any hartid greater than NR_CPUs are not booted at all.
> > > 3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
> > > 4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
> > >    generating hartmask.
> > >
> > > In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
> > > which was logically incorrect anyways. NR_CPUs represent the maximum logical|
> > > CPU id configured in the kernel while the hartid represent the physical hartid
> > > stored in mhartid CSR defined by the privilege specification. Thus, hartid
> > > can have much greater value than logical cpuid.
> >
> > We already have a couple of architectures with logical to physical CPU
> > id maps. See cpu_logical_map. Can we make that common and use it here?
>
> Yes. We can move the cpu_logical_map(which is a macro) &
> __cpu_logical_map(actual array with NR_CPUS size)
> to common code so that all the architecture can use it instead of
> defining it separately.

IIRC, the macro is what varies by arch and I would move to static
inlines rather than supporting:

cpu_logical_map(cpu) = 0xdeadbeef;

>
> > That would also possibly allow for common populating the map from DT.
> >
>
> I didn't understand this part. The mapping is populated at run time
> [1] as the boot cpu can be any hart in RISC-V.
> That booting hart will be mapped to cpu 0. All others will be mapped
> based on how the cpu node is laid out in the DT.
> Do you mean we can move the 2nd part to common code as well ?

Yes, as the DT platforms just loop thru the cpu nodes and fill the
logical map based on 'reg', I don't think that needs to be per arch
once we have a common map. But not asking for that now.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
