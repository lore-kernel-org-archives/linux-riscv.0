Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAA0C3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 22:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEECE217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 22:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCB656l3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0zMmyWB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEECE217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2p/4XsTe7EqacdXEpHRhSRtUtI7WO47cOJBtvz7Ico=; b=gCB656l3xCxh5H
	4BpJwqb0OGW/w1Yw/rFOYSVfbspd3xMrq734X3vJxtiy1qRitEiU/ZyuIlzMp03P1SaxCyRbxUT1z
	lIeYgsB5uUJEe8RyfXe9bCbfIm71iCu7b/dE+G4OfDEDSBfJOoxoFjwwv5Lqqaoua9CDcOuG0tEYf
	IVgse8XD1p/aXwnx2XZSQFluW/oNpkxLmwuvQb6NX7ASUwbKbqC+Ye/R8Ivl6vtUOuAvKvwi7uWqs
	dRUhax5+1jgXTy0hD22ZAAEzXRMmaleE7NKyxUvW3DDQYyPs3hT1eXrYSD3qpmjepoiGZnSXT2Ts0
	aRRqQ5PO3v+IHS8Vfy8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2NQf-0006yB-Pi; Mon, 26 Aug 2019 22:25:37 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2NQR-0006io-7F; Mon, 26 Aug 2019 22:25:24 +0000
Received: by mail-pg1-x542.google.com with SMTP id m3so11403583pgv.13;
 Mon, 26 Aug 2019 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NdrKt952AuvDe+QMynjr4iuarcTkuNP/kAs8J0u4A+s=;
 b=a0zMmyWBK90UYJtyoqynyxpcCWQ63iFelFOAu2wf9q+P7tEGrAMDTLQ7ns9kTHCAvV
 zOtTYGjAxNvaMG4PH070aBsaBC17H9ftkGmoEi1jbpZFGywLt3QZL7gqqDvhtYn2QJAj
 HSQU1nyy/xAx7EGwqSnb5+oUhOiY0vilM355IeRksUhMIXlBU+ac4G4LkEY6hh/lQJqH
 TCnArxvquzzcbANPftPtDewlrkSUrPpD/afdr91bwf897Kd0DnHeETaJ3blnDHKXuHRK
 pv4PbuZrnheVZVo5X1lDBWaTzlVchp+wBfR+mBKzN+vI9AKQDusQD89Py284sXkk9381
 0sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NdrKt952AuvDe+QMynjr4iuarcTkuNP/kAs8J0u4A+s=;
 b=jUCsiaWMcm+069XA7+ZGNm6wbXohnm0/0Kfthsq38Zj2+efXd0OHOyj95EdjUqB4E0
 6qUQNF8hxprvPF2JQHjw0Jr4B1RtOGODIGXmWdszP5sk89e/3BwBymUhOCqgWtcfU1Ld
 s11Xgtb8CPv1NJ+xXkxIgHQYnQvTi5tLh+HuZeP6uZOz6Sq0IOdRWD/Zb7b7jrywsdHv
 zInaGOHB21l+0m0LLtng1iINRApKHaUnZEQ9KPmBb8DpOdp3bu08TBwVJBLbtqcDQ5BB
 3hjOBD1cGuzRyd9SyiI4hR/EmOovTOoMZI4lMqzY/sGI6DfouGc+EezT+NRC9vQr6P0k
 FTww==
X-Gm-Message-State: APjAAAUYVpu/8nUHpc9rLsRS0qkH7MA45jnYwCwyQtpVwewYEerqwdnu
 epOvcqAQHvvw0daBtVoxI0g=
X-Google-Smtp-Source: APXvYqy681ZUL1/GOI1ZqNuttC4tPBoxw38R2Hiki+GEnFDGGEOPoegEj5VFS0OPFx5JUD/3pSIIpA==
X-Received: by 2002:a65:6108:: with SMTP id z8mr8200381pgu.289.1566858322037; 
 Mon, 26 Aug 2019 15:25:22 -0700 (PDT)
Received: from mail.google.com ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id t6sm449041pjy.18.2019.08.26.15.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:25:21 -0700 (PDT)
Date: Tue, 27 Aug 2019 06:25:12 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 03/11] asm-generic: add generic dwarf definition
Message-ID: <20190826222510.6m2k3puwflnr52b7@mail.google.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
 <20190825132330.5015-4-changbin.du@gmail.com>
 <20190826074215.GL2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826074215.GL2369@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_152523_266328_24603679 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-mips@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Peter,

On Mon, Aug 26, 2019 at 09:42:15AM +0200, Peter Zijlstra wrote:
> On Sun, Aug 25, 2019 at 09:23:22PM +0800, Changbin Du wrote:
> > Add generic DWARF constant definitions. We will use it later.
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  include/asm-generic/dwarf.h | 199 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 199 insertions(+)
> >  create mode 100644 include/asm-generic/dwarf.h
> > 
> > diff --git a/include/asm-generic/dwarf.h b/include/asm-generic/dwarf.h
> > new file mode 100644
> > index 000000000000..c705633c2a8f
> > --- /dev/null
> > +++ b/include/asm-generic/dwarf.h
> > @@ -0,0 +1,199 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * Architecture independent definitions of DWARF.
> > + *
> > + * Copyright (C) 2019 Changbin Du <changbin.du@gmail.com>
> 
> You're claiming copyright on dwarf definitions? ;-)
> 
> I'm thinking only Oracle was daft enough to think stuff like that was
> copyrightable.
> 
ok, let me remove copyright line. I think SPDX claim is okay, right?

> Also; I think it would be very good to not use/depend on DWARF for this.
>
It only includes the DWARF expersion opcodes, not all of dwarf stuffs.

> You really don't need all of DWARF; I'm thikning you only need a few
> types; for location we already have regs_get_kernel_argument() which
> has all the logic to find the n-th argument.
> 
regs_get_kernel_argument() can handle most cases, but if the size of one paramater
exceeds 64bit (it is rare in kernel), we must recalculate the locations. So I think
dwarf location descriptor is the most accurate one.

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
