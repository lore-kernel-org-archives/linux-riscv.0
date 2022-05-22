Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC9AC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55s7nmBDFwP9gDHvzYOIRF/0ddlOmD9WcaARv0hOZQE=; b=D4oFX8+OAxdaZx
	XtgYQ2MtH6jKEi/qcdxGZ5gfnuTGZpmFnDrR5SLkJONRGx2XFjIM1+xqc8MzPYen6n4rEySyCCgxR
	1SGzIuKt1k3mXO0/v2dIl3HIynMLNsdlriNXDYJXPRAHyxCKJTqcAvvifwwWtZdUjld5FcOdmuP1o
	GeYa4scYBPtKLRI0xV26dAOdSuSpsebkh8061z/xQ6Q0PJxi63QcVWuB0lYAmyo7gb8R/n9gG8e90
	ze+B8dbMDgXk8yAmkH8oBh31oMkHkKlty58gN5t28iPKG40Oq0kgTgeZCZmTDFZelpqenYs/N0tRH
	84OEJK2WDoDwMhEjUtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsn8p-001X1m-Uw; Sun, 22 May 2022 15:05:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsn8m-001X1A-P6
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 15:05:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8434B80AC0;
 Sun, 22 May 2022 15:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5691BC385AA;
 Sun, 22 May 2022 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653231905;
 bh=KniY7pvwgyzzI8U0IRj4T1voF2HIUSR1WmeVb4knjw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ORx7IJg7vRBKv36vpBlMw6Gw3Zaq/16KO5WX1O6GtP3G6iw2Gm0BxSXK18OHw2qdc
 tpizCbodNYk87YkBONv4aviQOq4+cENYki8qpn50J5YRC/B7EUEaDEhfJKjjpj4I/e
 ELz1ReGl9hilTupJLZ/7J9zVu3XDs1x2n0gp9z8J8pHgyyVHnOxl5gslijBPl6fTjb
 Uux9QDDFzX/Np8078IoJdv5JY1VLVkc8PbyM5TBEohhivPlCh20fCedkMGvVmmJpcM
 g+avP6xAsp9WPdgfcsUfV5znwHS9D7iWBEvqeEh7JaYabNQ8Jdk0WWQFHf7m1rOH6/
 eR96ZUvC3RtBQ==
Date: Sun, 22 May 2022 22:56:25 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] riscv: introduce unified static key mechanism for
 ISA extensions
Message-ID: <YopPGSboPkZbbbGD@xhacker>
References: <20220517184453.3558-1-jszhang@kernel.org>
 <20220517184453.3558-2-jszhang@kernel.org>
 <CAOnJCU+aRoLRUjbum3o8N8J63vW+Y2974TjBueE__7PQAeJCQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+aRoLRUjbum3o8N8J63vW+Y2974TjBueE__7PQAeJCQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_080509_153366_DADD0F72 
X-CRM114-Status: GOOD (  32.81  )
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

On Sun, May 22, 2022 at 12:33:12AM -0700, Atish Patra wrote:
> On Tue, May 17, 2022 at 11:53 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Currently, riscv has several extensions which may not be supported on
> > all riscv platforms, for example, FPU and so on. To support unified
> > kernel Image style, we need to check whether the feature is supported
> 
> /s/suportted/supported

Thanks, will fix it in v2 soon.
> 
> > or not. If the check sits at hot code path, then performance will be
> > impacted a lot. static key can be used to solve the issue. In the past
> > FPU support has been converted to use static key mechanism. I believe
> > we will have similar cases in the future.
> >
> > this patch tries to add an unified mechanism to use static keys for
> > some ISA extensions by implementing an array of default-false static keys
> > and enabling them when detected.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 40 ++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c |  7 ++++++
> >  2 files changed, 47 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 0734e42f74f2..b0433d2b880d 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -12,6 +12,7 @@
> >  #include <uapi/asm/hwcap.h>
> >
> >  #ifndef __ASSEMBLY__
> > +#include <linux/jump_label.h>
> >  /*
> >   * This yields a mask that user programs can use to figure out what
> >   * instruction set this cpu supports.
> > @@ -55,6 +56,16 @@ enum riscv_isa_ext_id {
> >         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> >  };
> >
> > +/*
> > + * This enum represents the logical ID for each RISC-V ISA extension static
> > + * keys. We can use static key to optimize code path if some ISA extensions
> > + * are available.
> > + */
> > +enum riscv_isa_ext_key {
> > +       RISCV_ISA_EXT_KEY_FPU,          /* For 'F' and 'D' */
> > +       RISCV_ISA_EXT_KEY_MAX,
> > +};
> > +
> >  struct riscv_isa_ext_data {
> >         /* Name of the extension displayed to userspace via /proc/cpuinfo */
> >         char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> > @@ -62,6 +73,35 @@ struct riscv_isa_ext_data {
> >         unsigned int isa_ext_id;
> >  };
> >
> > +extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
> > +
> > +static __always_inline int riscv_isa_ext2key(int num)
> > +{
> > +       switch (num) {
> > +       case RISCV_ISA_EXT_f:
> > +               return RISCV_ISA_EXT_KEY_FPU;
> > +       case RISCV_ISA_EXT_d:
> > +               return RISCV_ISA_EXT_KEY_FPU;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +}
> > +
> > +/*
> > + * @num must be a compile-time constant.
> > + */
> > +static __always_inline bool riscv_isa_have_key_extension(int num)
> > +{
> > +       if (RISCV_ISA_EXT_ID_MAX <= num)
> > +               return false;
> > +
> > +       num = riscv_isa_ext2key(num);
>  > +       if (RISCV_ISA_EXT_KEY_MAX <= num || num < 0)
> > +               return false;
> > +
> 
> Why do you need the additional check in the hot path ?
> riscv_isa_ext_keys array can be directly accessed at the caller
> instead of calling this function.

directly accessing the keys can make the code simpler, thanks for
the hint.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
