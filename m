Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5051C433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 16:06:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 758172065C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 16:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ykkjCdo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 758172065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=muGq7QsEnbdE8aOuLbCxKQ6s1r6ALDYALelkBufFy3U=; b=2ykkjCdo9D1iOBrfyLqduW8R0
	eur90JKkwB5964RwWaO7e6mZgIxbB1pNUkBp8Vg8dUS2cBcVcisL9qS0tiqRdKmyuP3WrmmbbG1lf
	02+fasbdcpvPfeJSb0ltdi8E8VLfrep2jJxqY2drHRjz93ko5cDROiPKki0dTApoctVW3GHlgHaDg
	+E6WdkkZ10ca/iw++67TNrfxCyUTa8diOBlzDi2Ty70ea6LWVgi7LZ9y7QOTKA5XAVQoo/rTUnESn
	McVOS9+mUa+/SdGLZnrlen2YCuUDo2WovBbzMj3QLTDz6WxhQK2dIniJOkl0ZN9y8s9QWWKZVoUVc
	wTy+Pr6DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0S7l-0001U9-SO; Tue, 28 Jul 2020 16:06:41 +0000
Received: from sym2.noone.org ([2a01:4f8:120:4161::3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0S7j-0001TB-Kk
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 16:06:40 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BGM4F19GRzvjc1; Tue, 28 Jul 2020 18:06:36 +0200 (CEST)
Date: Tue, 28 Jul 2020 18:06:36 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH RESEND] riscv: don't specify -mno-save-restore when
 building with clang
Message-ID: <20200728160636.bqgeckpy6dzuj5b7@distanz.ch>
References: <20200728131252.15407-1-tklauser@distanz.ch>
 <mhng-73766461-0f04-474e-a416-4597b879dbdf@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-73766461-0f04-474e-a416-4597b879dbdf@palmerdabbelt-glaptop1>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_120639_798216_2377AC2E 
X-CRM114-Status: GOOD (  19.59  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-07-28 at 17:20:45 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Tue, 28 Jul 2020 06:12:52 PDT (-0700), tklauser@distanz.ch wrote:
> > Clang doesn't support -msave-restore and -mno-save-restore. This avoids
> > the following message emitted by clang:
> > 
> >   '-save-restore' is not a recognized feature for this target (ignoring feature)
> > 
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> > Resent due to infradead.org mailing list issues.
> > 
> >  arch/riscv/Makefile | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index fb6e37db836d..cd3720bc45e8 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -44,7 +44,9 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> >  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> > 
> > +ifndef CONFIG_CC_IS_CLANG
> >  KBUILD_CFLAGS += -mno-save-restore
> > +endif
> >  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
> > 
> >  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> 
> Thanks, this one didn't make it the first time.  Is there a reason we can't use
> cc-option here?  IIRC that's what we use for the other compiler options that
> may be unimplemented, and it has the advantage of avoiding encoding specific
> compilers into the build system.

Thanks for the hint. I don't know how I could've overlooked cc-option.
Will send a v2 using cc-option.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
