Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72ABC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jan 2022 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDLw8okRt4CgSpG12fmxvGePUF3T9yTGF6LAYIRZNeA=; b=edk+ARKdYYLz1s
	9oTJL7o0YxOXdA6c+9hufT3/Bx9VxbPuQnAZmZw5fRqvb23gBQAupdTkERHWShdFHFNEUs/Fw/3Vb
	VpCwTmhtBYEtbbrvwWCOrdTDmiND2srV66E5pjlBPs5lJyN5pF/XfHFv2ci08t1y1ToGbvoU2+wQb
	EAwlnxFkEYaXG6B2UrBzfrX2djtJtXdh5AJ0lYQ1vNBQYVTHVwVtQRH2PJR/ufixyQzBLxyFjdd/S
	oWn/aZq/NRUWhm+5yweWOEE0LgqIxncsZJl57cBEFA3EhuIGp4YNY3nSisAUxB5bxIuszUiuER5fx
	t2VYwz5arQYgrAN3RBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4jqW-00BVbn-L5; Tue, 04 Jan 2022 13:27:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4jqU-00BVar-Eb; Tue, 04 Jan 2022 13:27:23 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1n4jqN-0004e6-TR; Tue, 04 Jan 2022 14:27:15 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atishp@rivosinc.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 1/5] RISC-V: KVM: Mark the existing SBI implementation
 as v01
Date: Tue, 04 Jan 2022 14:27:14 +0100
Message-ID: <8323751.1mJVJdxAKN@diego>
In-Reply-To: <6615284.qex3tTltCR@diego>
References: <20211118083912.981995-1-atishp@rivosinc.com>
 <20211118083912.981995-2-atishp@rivosinc.com> <6615284.qex3tTltCR@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_052722_511955_C85AF6E4 
X-CRM114-Status: GOOD (  16.00  )
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

Am Dienstag, 4. Januar 2022, 14:19:41 CET schrieb Heiko St=FCbner:
> Hi Atish,
> =

> Am Donnerstag, 18. November 2021, 09:39:08 CET schrieb Atish Patra:
> > From: Atish Patra <atish.patra@wdc.com>
> > =

> > The existing SBI specification impelementation follows v0.1
> > specification. The latest specification allows more
> > scalability and performance improvements.
> > =

> > Rename the existing implementation as v01 and provide a way to allow
> > future extensions.
> > =

> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> =

> > diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> > index eb3c045edf11..32376906ff20 100644
> > --- a/arch/riscv/kvm/vcpu_sbi.c
> > +++ b/arch/riscv/kvm/vcpu_sbi.c
> > @@ -1,5 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > -/**
> > +/*
> >   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> >   *
> >   * Authors:
> =

> This got already fixed by [0]
> commit 0e2e64192100 ("riscv: kvm: fix non-kernel-doc comment block")
> so this patch doesn't apply cleanly anymore.

hmm, just found Anup's "I've queued this..." message after
writing my reply, so scratch the above ;-) .

@Anup: I've looked at git.kernel.org but didn't find a tree
there, can you tell me where this did go to?

Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
