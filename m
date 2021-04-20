Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01A9C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 01:23:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E18A8613AE
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 01:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E18A8613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3YSa1lp09PDINryo/2jXZZon+NPICt7RSqbtswMN05Y=; b=DN8EB5eDHtFy2klOmUaezzIBy
	gPc1WZJ6SIfjpHhri36+I0Zpwhi76vJPNuE22Tegs6yRsUYltnTN2OHnCpcppj5hFD41A02x/6mHp
	Gczv9bMhm+EAx46dtXO6pROgTEPbKaT6IVp6NsJR47Rm26qn64loLI0lMYU4m8tciGy+1WQku2arF
	FBANr/QyumRhkq84oJXxWZM3xarxCkbbYkdPO4E/asPlGz9DANB008eSh21CUzH2PSeD+zDBU872L
	fjXNBAcA/cC5032qayI2qnQh1PYtM8oXn2XvMHeA9lyzzbAomOhYykduYNL/ZWVsEVuczlBHRZO2c
	248jH5flA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYf6L-00AvLU-3a; Tue, 20 Apr 2021 01:22:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYf6I-00AvK9-P3
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 01:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IOaXcUaN8iTL1wxrVQ29ZfH4c3agkafIU5YemfCtJek=; b=qBEhVvXK0u4XJWYBGBQgTv5WvT
 4N/7Cl2ogt/4lEulKPL0RJ10ndsLwvgDWfpzFbAE7iwUfirrYGAmMHPqTQ1yFA0oXYel33d//1XKS
 JvUaiNRqG1GhJmZpqVdQ7iZNO+o5cSIV3p2VGiJO1QbJQAsp9f1IiMJMw/ryV75SwQCIRRCZYkfZ4
 X2sA2wgaa0M4ng+tTHCrfrbSw+eWuoNpk9RXdkTRSnwWFkapf4HRpQfQibAty3Upt/XHJ6jXi66HF
 VajjvtO97KZx4YRHaAtvor/PzZfwSXg8IaKXdBe0GykrxIGbuZGdspQVSYAj34D60OKUpkOGYUnrv
 O2G5yhLA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYf6G-00Bkro-6N
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 01:22:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9632B613B2
 for <linux-riscv@lists.infradead.org>; Tue, 20 Apr 2021 01:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618881766;
 bh=SSh/fCkAeoAWllWsDSR3ydZ10BhcC+iH1ETqUqxNxqY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AtKaVklDeGRTzVhY+VZa+8zYM1l1j0puh23Gm/qFyb/1hzEamHdxXSx4RBkYqz0j3
 T6WRibKOcfZlWhyy2CAcH1Os5dO5W/II8O93C6xbXCtVHB0lX7sxl9rBFPfbsk50kp
 DNaGI/T4WKpUxdUlt+6h3jEAeDD2u6ivUsQUzoMyXWW7WqKa5ROPBND8YoJVEcSMOH
 nuW5KPzInhdvVotlFS3lab8wVXAhNLVRA+WidkMd2L+Ln/vPjTwgc4FdnvlI1kzbly
 eZCIOD88XVEtZLTFDqIWODgMaY3sfbOUYHbDzCpbuEwWP1Av1/JL/VH9NAwA43gOeq
 mDxqzPgZ2IfOg==
Received: by mail-lf1-f41.google.com with SMTP id n138so59074458lfa.3
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 18:22:46 -0700 (PDT)
X-Gm-Message-State: AOAM531we7NcWrWcK9YySzcfwDa8hsCnCz/es0JTiGdGnhJIFEI3hW7K
 bbSkBBe4BxAtpdWmGjEdQMLDpBPREs9VaZZrIZ8=
X-Google-Smtp-Source: ABdhPJyNkQ4waQWIRsWkLecTECs70MszIvNEP1jOKg4Id9kxfy7inXyBd0MPgLbxDuc0+3tpeauHn3eDAQDDCpZY2gY=
X-Received: by 2002:a05:6512:3050:: with SMTP id
 b16mr6731861lfb.24.1618881764817; 
 Mon, 19 Apr 2021 18:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <1618634729-88821-1-git-send-email-guoren@kernel.org>
 <1618634729-88821-2-git-send-email-guoren@kernel.org>
 <CAK8P3a1ygwS7jTXqYXCfppEEonCASqG_5GM9O_AtE9YgdgNqVQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1ygwS7jTXqYXCfppEEonCASqG_5GM9O_AtE9YgdgNqVQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Apr 2021 09:22:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRkWD6NcfriQhLBYL0eBafNmLx1Kw_Rmaex3851SzVBWQ@mail.gmail.com>
Message-ID: <CAJF2gTRkWD6NcfriQhLBYL0eBafNmLx1Kw_Rmaex3851SzVBWQ@mail.gmail.com>
Subject: Re: [PATCH v2 (RESEND) 2/2] riscv: atomic: Using ARCH_ATOMIC in
 asm/atomic.h
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_182248_280281_289D803B 
X-CRM114-Status: GOOD (  18.76  )
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

On Mon, Apr 19, 2021 at 7:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Apr 17, 2021 at 6:45 AM <guoren@kernel.org> wrote:
> > +#define arch_atomic_read(v)                    __READ_ONCE((v)->counter)
> > +#define arch_atomic_set(v, i)                  __WRITE_ONCE(((v)->counter), (i))
>
> > +#define ATOMIC64_INIT                          ATOMIC_INIT
> > +#define arch_atomic64_read                     arch_atomic_read
> > +#define arch_atomic64_set                      arch_atomic_set
> >  #endif
>
> I think it's a bit confusing to define arch_atomic64_read() etc in terms
> of arch_atomic_read(), given that they operate on different types.
>
> IMHO the clearest would be to define both in terms of the open-coded
> version you have for the 32-bit atomics.
Okay:

 +#define arch_atomic64_read                     __READ_ONCE((v)->counter)
 +#define arch_atomic64_set
__WRITE_ONCE(((v)->counter), (i))

>
> Also, given that all three architectures (x86, arm64, riscv) use the same
> definitions for the six macros above, maybe those can just get moved
> into a common file with a possible override?
I'll try it with a separate patch.

>
> x86 uses an inline function here instead of the macro. This would also
> be my preference, but it may add complexity to avoid circular header
> dependencies.
>
> The rest of this patch looks good to me.
>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
