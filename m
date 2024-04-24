Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482FCC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mrvPHdhF1n6EFUVeNE5WKOKuuwfLENF47NkzEgia8BU=; b=uYw1kCdShZq4mbMWTWjpmLazam
	O2guAg9if0lRKd3DMw7g10w5ThAuKsUaQJkzlyxdiYQTzD1KuPqv2uB/T3q/U7poda4QSu/2BW7AJ
	aMh9/niFlfxw1XQB+/W8FErl3SnhCo83NRUcYh7NJzTbvbC6756jW7eqTVjsOSKos9JAUvDt7Jh3G
	yWVAgWJQrNXZbUNeAVvFl4Su36jlZxMTdXhs2Qxf9aKRsBSA+drQznkLE8l4Q+UXuFi0PbHBE1hgs
	Hli9AGNLmR/fOrKeZtSLCeCSfIohZfL1ebQh5h7wf/nNpHns02ZA2xBp6drLA0jgqApfco4uL356r
	X0zsOFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbfZ-000000043Fv-2gEo;
	Wed, 24 Apr 2024 12:24:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbfV-000000043E7-3fZn
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 12:24:12 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9C6E73FA77
	for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713961447;
	bh=kP7Qj5CwpDA66Gz8AB4puXE6Tb6dE/jjDd5MukJFIok=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wO5BzGQ4d6RXf/3FcAD805WFsf4pbPMUDA5s1EVxjzSAlDPPbQL3ajmyS5aJjST30
	 WGh5Orp0Zz7L6u3ib1ZU5rio7BnQXc1xdB0EPdsNhDy6hRt8yCZlIk3gI91vThWN9Z
	 W50yqA1IlZu/tDyoxq8CfwyUiNGNGyK4dAsDDSaOWShx2TQPyVuYbi27vq22g3HmbQ
	 MEG9MKqJ1r60zNX/RSIc/rIUWrA/XQODPU6ZKIymG/qIEqnIcGDLUoy2IQvt1IoCj6
	 pgaZByQfc5lwv++OcINbs5IKEkadGA/atza5c99ZeN2JOEoJLmaERt7F6HSigjzTzb
	 nwAraJFracLqw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-43473ded688so102265761cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 05:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713961446; x=1714566246;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kP7Qj5CwpDA66Gz8AB4puXE6Tb6dE/jjDd5MukJFIok=;
        b=ZSJq9fdiGlDOBMCC9r9pXqjaGWQ8yVnQ2kgsv7Q83GIP0s19keyCVmj2hn8gwpZ7JS
         RHxBliNOe0DyiUVZNQIXNPSOl/CRYaQ46NDMKwwLMcFVH69vV3kBIpZGijh6GtTsPFx6
         hVbGw9c6lrLW+CH7SBaaP4iuvjWTaq2oLAhzflA1WZPSc+kvlFi7iNAFtOOA7i6oZ7Xq
         KpVMeZogOcj/2d5nzw/rTfBBLhzNNAdjqk+ku3+qjw5qzLFiy/BgZ7x4O+1Ui6WNfq7v
         aERrC/YNByEJMnK17JgA2PIDhbHrsD4lsOyaz/JLaKrYtNRXLRUQ8PmF/U/MIDVvayh4
         64xA==
X-Forwarded-Encrypted: i=1; AJvYcCWXlAAoJZqD9Kz2k+pds2fkY4QJ3BgcWF/Hw4hAfovtWJUgETViSsEPG7kDXLKoMWn0/wUa6PAjnnMPqwE6XbJy1YbTrNxC7CL866jR2fKi
X-Gm-Message-State: AOJu0Yxo+YdNIL/Q1O3669ePqjBjWznFspbxQFTpZDL9UxosJrUGVleR
	BxGL/OLctynCCD0E29wM/Ua2DjQ4XMNV6Dzq2FpLLkrD0u7RN4NI9ikTcKMLqjloeSVhnLApDoq
	jWAKxWvn9kfUn8jTgdAQGdBLZPkqggtqnyELyGasW0G0NDDADGPe/xTxW4Q6ZxJKxWOdPzwB1wd
	UY94tHDS1Kr4Q1xJacBLOARc6/p47bn4s4sDhneXl3kpSV0PqJo2n7Fv6t
X-Received: by 2002:a05:622a:c3:b0:439:ff39:eda5 with SMTP id p3-20020a05622a00c300b00439ff39eda5mr2850163qtw.46.1713961446654;
        Wed, 24 Apr 2024 05:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE9LSddkv0aBFD9sD7nfjwgf9rCGcKJnWtVWsbq4dHYSmThicP0HSvR1y+4PaXDdyrxJ35vOBfb5XosrnnuVc=
X-Received: by 2002:a05:622a:c3:b0:439:ff39:eda5 with SMTP id
 p3-20020a05622a00c300b00439ff39eda5mr2850143qtw.46.1713961446367; Wed, 24 Apr
 2024 05:24:06 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Apr 2024 12:24:05 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240424-cost-monkhood-14ab2a933bb5@spud>
References: <20240410142347.964-1-jszhang@kernel.org> <20240410142347.964-3-jszhang@kernel.org>
 <20240424-cost-monkhood-14ab2a933bb5@spud>
Mime-Version: 1.0
Date: Wed, 24 Apr 2024 12:24:05 +0000
Message-ID: <CAJM55Z9E7GnacYhQHcYmHKur6kD155d6C-xkORaEfxS9JxLFxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/timer-clint: Add T-Head C9xx clint
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_052410_332617_9DCE7F47 
X-CRM114-Status: GOOD (  28.84  )
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

Conor Dooley wrote:
> On Wed, Apr 10, 2024 at 10:23:47PM +0800, Jisheng Zhang wrote:
> > To use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need to take
> > care two points:
> >
> > 1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
> > implement such support.
> >
> > 2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
> > add a quirk for lacking mtime register") of opensbi:
> >
> > "T-Head developers surely have a different understanding of time CSR and
> > CLINT's mtime register with SiFive ones, that they did not implement
> > the mtime register at all -- as shown in openC906 source code, their
> > time CSR value is just exposed at the top of their processor IP block
> > and expects an external continous counter, which makes it not
> > overrideable, and thus mtime register is not implemented, even not for
> > reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
> > extended CSR, these systems still rely on the mtimecmp registers to
> > generate timer interrupts. This makes it necessary to implement T-Head
> > C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
> > reading mtime register and falls back to default code that reads time
> > CSR."
> >
> > So, we need to fall back to read time CSR instead of mtime register.
> > Add riscv_csr_time_available static key for this purpose.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/clint.h    |  2 ++
> >  arch/riscv/include/asm/timex.h    | 18 +++++++++---
> >  drivers/clocksource/timer-clint.c | 48 +++++++++++++++++++++++++++----
> >  3 files changed, 59 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
> > index 0789fd37b40a..c6057a182c5d 100644
> > --- a/arch/riscv/include/asm/clint.h
> > +++ b/arch/riscv/include/asm/clint.h
> > @@ -10,6 +10,7 @@
> >  #include <asm/mmio.h>
> >
> >  #ifdef CONFIG_RISCV_M_MODE
> > +#include <linux/jump_label.h>
> >  /*
> >   * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
> >   * any overhead when accessing the MMIO timer.
> > @@ -21,6 +22,7 @@
> >   * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
> >   */
> >  extern u64 __iomem *clint_time_val;
> > +DECLARE_STATIC_KEY_FALSE(riscv_csr_time_available);
> >  #endif
> >
> >  #endif
> > diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> > index a06697846e69..007a15482d75 100644
> > --- a/arch/riscv/include/asm/timex.h
> > +++ b/arch/riscv/include/asm/timex.h
> > @@ -17,18 +17,27 @@ typedef unsigned long cycles_t;
> >  #ifdef CONFIG_64BIT
> >  static inline cycles_t get_cycles(void)
> >  {
> > -	return readq_relaxed(clint_time_val);
> > +	if (static_branch_likely(&riscv_csr_time_available))
> > +		return csr_read(CSR_TIME);
> > +	else
> > +		return readq_relaxed(clint_time_val);
> >  }
> >  #else /* !CONFIG_64BIT */
> >  static inline u32 get_cycles(void)
> >  {
> > -	return readl_relaxed(((u32 *)clint_time_val));
> > +	if (static_branch_likely(&riscv_csr_time_available))
> > +		return csr_read(CSR_TIME);
> > +	else
> > +		return readl_relaxed(((u32 *)clint_time_val));
> >  }
> >  #define get_cycles get_cycles
> >
> >  static inline u32 get_cycles_hi(void)
> >  {
> > -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> > +	if (static_branch_likely(&riscv_csr_time_available))
> > +		return csr_read(CSR_TIMEH);
> > +	else
> > +		return readl_relaxed(((u32 *)clint_time_val) + 1);
> >  }
>
> None of the else branches here need to actually be an else, since the
> other branch returns. Otherwise, looks aight to me, thanks for the
> update.

Also the static key is initialized to false and the commit message says only
the C9xx cores need to use the CSR_TIME, so shouldn't it be

  if (static_branch_unlikely(&riscv_csr_time_available))

instead, or am I reading this wrong?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
