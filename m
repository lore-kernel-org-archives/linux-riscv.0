Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0F4C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 08:29:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D5BB206D4
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 08:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="piw5HrfR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D5BB206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tPMFFhkB1JZAxSFVdjWO9q5xAjAKvDnhof2hK1sLPXg=; b=piw5HrfR+JFTcP3qweIMlndSx
	KS38dlyZ5nArftzZy7RZWRdI+32rJBnSNvLv/YLeIlao0J82t00PqcHON2/11pziCb3iYCGLMb608
	WN9oMjMMbdZRMvazveWIn6/MK6E9VtSabQG1Rle3G1J8eA2+7AGR1S3N7/vEX+zNR3VeDKX95Syy7
	9BmFLr8vhE6AmdhyUhYrNYLAUViH+zVGPZ2Ppux0h1PJdumyroNx4XxKsy7kfHtMLWx2HppJPPikl
	PFXZSTN3lJSpVBJi2mwuSYpLG9vYr0o8Zrct8hmNnw52+lTSK9iPPcE5pHfrE5WT6Uo2VMWX/D31s
	7Xyzj52kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hSY-0005vQ-UU; Wed, 29 Jul 2020 08:29:10 +0000
Received: from sym2.noone.org ([2a01:4f8:120:4161::3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hSV-0005su-VR
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 08:29:09 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BGmss0QVVzvjc1; Wed, 29 Jul 2020 10:29:04 +0200 (CEST)
Date: Wed, 29 Jul 2020 10:29:04 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Jerome Forissier <jerome@forissier.org>
Subject: Re: [PATCH RESEND] riscv: don't specify -mno-save-restore when
 building with clang
Message-ID: <20200729082903.6ix42nylg2e36lh6@distanz.ch>
References: <20200729044143.tzok6p3nctqzms4w@distanz.ch>
 <20200729080811.12111-1-jerome@forissier.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729080811.12111-1-jerome@forissier.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_042908_167060_0B1C88BA 
X-CRM114-Status: GOOD (  28.19  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-07-29 at 10:08:11 +0200, Jerome Forissier <jerome@forissier.org> wrote:
> > On 2020-07-28 at 18:06:36 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
> > > On 2020-07-28 at 17:20:45 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > > On Tue, 28 Jul 2020 06:12:52 PDT (-0700), tklauser@distanz.ch wrote:
> > > > > Clang doesn't support -msave-restore and -mno-save-restore. This avoids
> > > > > the following message emitted by clang:
> > > > > 
> > > > >   '-save-restore' is not a recognized feature for this target (ignoring feature)
> > > > > 
> > > > > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > > > > ---
> > > > > Resent due to infradead.org mailing list issues.
> > > > > 
> > > > >  arch/riscv/Makefile | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > > index fb6e37db836d..cd3720bc45e8 100644
> > > > > --- a/arch/riscv/Makefile
> > > > > +++ b/arch/riscv/Makefile
> > > > > @@ -44,7 +44,9 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> > > > >  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> > > > >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> > > > > 
> > > > > +ifndef CONFIG_CC_IS_CLANG
> > > > >  KBUILD_CFLAGS += -mno-save-restore
> > > > > +endif
> > > > >  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
> > > > > 
> > > > >  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> > > > 
> > > > Thanks, this one didn't make it the first time.  Is there a reason we can't use
> > > > cc-option here?  IIRC that's what we use for the other compiler options that
> > > > may be unimplemented, and it has the advantage of avoiding encoding specific
> > > > compilers into the build system.
> > > 
> > > Thanks for the hint. I don't know how I could've overlooked cc-option.
> > > Will send a v2 using cc-option.
> > 
> > Looks like it's a bit more complicated:
> > 
> > Using just cc-option still leads to the warning being emitted, so I
> > think the CONFIG_CC_IS_CLANG check is still needed (checked using clang
> 
> Shouldnt cc-option be fixed instead? The warning effectively means the option
> is not supported, so why should cc-option pretend it is?

The problem is that clang somewhat handles the option, i.e. doesn't
treat it as an unknown option like others and thus doesn't exit with
non-zero, like it does for other options only available for gcc. This is
what cc-option relies on.

Like mentioned in the follow-up patch [1] clang 11 will handle
-m{no,}save-restore correctly, so we need to address that case as well
(which [1] does). Unfortunately, I currently see no other way than using
these ifeq's to fix this.

[1] https://lore.kernel.org/linux-riscv/20200729044428.32460-1-tklauser@distanz.ch/T/#u

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
