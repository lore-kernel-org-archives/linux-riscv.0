Return-Path: <SRS0=s7xG=NB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A172C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 00:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D3B61004
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 00:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16D3B61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMA8feYx0os51QOxiKz08e2NqUoIWDUv2lSIOydkPOg=; b=ILGigIBJXnLH+c
	q7VqXzYO5elAZ9ReeNOkHHI11O7CMA0SvcJlzEUnaANP/wiB2jzovBFv+v4O/Y+o0BevwhlVx5rn8
	L1jOAzBo0CzTKgg/89pRXLh/aUCJZwhwE+MDFySrBCfaQVQ2l0zMrXP4tXOXiskvP0pCNIZ9XE5Xu
	2HGeFPyNWmpL41rjgtHh+thNTzWW9Tgt7I6qIV60CMVZgz3ymUpM+SuRRroIOlELD0cOfTc+nMIyu
	4zlJGH935LtfKRWKsT1q07K9kpAVJGCKMC+7+kO9Qe2pmIy96z4ZlPRZOurJLbowud/NV4aEUxgl7
	hQ1MrGAngijY6KfFXhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDFIV-0029cm-CX; Tue, 10 Aug 2021 00:07:11 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDFIQ-0029bR-3D
 for linux-riscv@lists.infradead.org; Tue, 10 Aug 2021 00:07:10 +0000
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 17A06ZQL013748
 for <linux-riscv@lists.infradead.org>; Tue, 10 Aug 2021 09:06:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17A06ZQL013748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1628553996;
 bh=JjfxB/NWBg6Ktsgql9hFjDsswtW13cjHVcXKJN/HvB8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L8nrKPMiFzkWiSZ1GVQYdzO47hlpkYHhAspKesCgblfesCiZAt/K0aUt84N2jrK2u
 xPkcmooAFQczDF9yGo/PXMWGlkisP3ici1IeTadRa6I9KKK+nAfrGQPuG0KGxwtZEz
 Ds8ClTxNga+xFcM4H6lsL7GYpuSRlUx7ftXrbur2PG4zXfF0IzCkrbKkGV+ryMs/de
 ENP07lym8+xJuE7Lb9LuYJcIJAkw1s1NkdMWNLvXlfY0eOZ7H48/KnRadgtJtUi8G/
 Dibhn9Hv5bW4OiGI5LKNT+trSkEQEvtZyvxKQOjfkrPAquo+OvXkI1otuqPuJbESiM
 Odo/M9aBB3XaQ==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id c16so18527247plh.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 Aug 2021 17:06:36 -0700 (PDT)
X-Gm-Message-State: AOAM530S/6S1q8n5f6S5qXWBIsnQ7Ccflip9GS3t/xHtaToimmYsIzgJ
 tXpq9gWhFEkCn+HNZOGcVQkCmdls07Bu35P7n/w=
X-Google-Smtp-Source: ABdhPJx9ClJ+m1I4D4HsYDac1G2c1fRVRcLzTQ2DLoTRMnDzgs2C1ORwZqwvUlYi2Sd+H4wsQ6FQxBTe4HKJCajO5eA=
X-Received: by 2002:a17:90a:7384:: with SMTP id
 j4mr24142360pjg.153.1628553995364; 
 Mon, 09 Aug 2021 17:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210805150102.131008-1-masahiroy@kernel.org>
 <59ce441e-8deb-39ff-700f-4e1c4e871177@kernel.org>
In-Reply-To: <59ce441e-8deb-39ff-700f-4e1c4e871177@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Aug 2021 09:05:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+7y+uNXKfTfW7HpQa1mVt0nuKHFPMQ3tMhjJrKt0v7Q@mail.gmail.com>
Message-ID: <CAK7LNAT+7y+uNXKfTfW7HpQa1mVt0nuKHFPMQ3tMhjJrKt0v7Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_170706_412742_6CE72270 
X-CRM114-Status: GOOD (  23.12  )
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

On Fri, Aug 6, 2021 at 3:46 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 8/5/2021 8:01 AM, Masahiro Yamada wrote:
> > LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
> > and it should be used only for that purpose.
> >
> > LLVM_IAS is checked in some places to determine the assembler type,
> > but it is not precise.
> >
> >   $ make CC=gcc LLVM_IAS=1
> >
> > ... will use the GNU assembler since LLVM_IAS=1 is effective only when
> > $(CC) is clang.
> >
> > Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
> > sense, but the build system can be more robust against such insane
> > input.
> >
> > Commit ba64beb17493a ("kbuild: check the minimum assembler version in
> > Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
> > because Kconfig checks the version string from the assembler in use.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>





Applied to linux-kbuild.




> > ---
> >
> >   Makefile            | 2 +-
> >   arch/riscv/Makefile | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 4ab151060931..8b56c9692c3c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -844,7 +844,7 @@ else
> >   DEBUG_CFLAGS        += -g
> >   endif
> >
> > -ifneq ($(LLVM_IAS),1)
> > +ifndef CONFIG_AS_IS_LLVM
> >   KBUILD_AFLAGS       += -Wa,-gdwarf-2
> >   endif
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index bc74afdbf31e..dcfbd2a87d41 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -41,7 +41,7 @@ endif
> >   ifeq ($(CONFIG_LD_IS_LLD),y)
> >       KBUILD_CFLAGS += -mno-relax
> >       KBUILD_AFLAGS += -mno-relax
> > -ifneq ($(LLVM_IAS),1)
> > +ifndef CONFIG_AS_IS_LLVM
> >       KBUILD_CFLAGS += -Wa,-mno-relax
> >       KBUILD_AFLAGS += -Wa,-mno-relax
> >   endif
> >



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
