Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA34C41604
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 16:55:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC669206DD
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 16:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7yJYsGq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+wsizep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC669206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vUkJM5WFc1oKO6rbvk+cPR4ewD3QKoMOYNZPJIVN2Sk=; b=q7yJYsGq4oDeZ9kNfx0DLE5zM
	VCBeJyzLTuIP+rbz+NjgYTuaQ8ht4fqMMQIg42o2XJo6zAqU4AlJeh+pLnGF4vEw9C5oXQTArDTpp
	ap4NPYqzR/iVO9kk471Y/IjSCkXrioK89IozqNaUwqmCyVMe3KduagjUEkS4l2c+osx9l8DbkedBf
	tnDWkfRlczXbHr56CH4z+prvFyIdXxzuVxNHoHBaVt8te36Xy0aG/GfPBOuHXhKzvNG1TBN0D3RU/
	2LcJPJHpd1vGYQwCGy5iyGT+j37qoUFIq6HSr+tbaYVjyFXO5oYx4G8CkNKWCJcY3kxxCasNEblDF
	XfJtEBmgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPqFM-0001Ro-61; Tue, 06 Oct 2020 16:55:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPqFJ-0001R8-Ii
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 16:55:26 +0000
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FA922075A
 for <linux-riscv@lists.infradead.org>; Tue,  6 Oct 2020 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602003325;
 bh=pzBiZFeYHRuM1MF/EG+vEY3UU0+WKZ5gBUmlAf1fZk8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p+wsizep1tpsNCv0UU0tD/SPcXCwTlcFK+FUqCnKk7fr+pu9UtVtfXz1IWM3qEzaa
 y0Fk5u/7eFsRCZRnpExTDNzfNK8cM4b4eLkJppmqJLItT1eNgpHRq+gXi4S9CcR3by
 LudgPKIwsY5MEcDwD+TKgpZhPREmC+Wp1lmlAk1o=
Received: by mail-lj1-f172.google.com with SMTP id r24so11669933ljm.3
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 09:55:24 -0700 (PDT)
X-Gm-Message-State: AOAM530RNyHGnNOz06kz/s5C8Mmb7NuAYGUBKBxTs9ewmvg+IFinOqhY
 8uGjE//9JKfwaGGFPlKfdbrKZunvsZfpSgCq170=
X-Google-Smtp-Source: ABdhPJwhosMAr3iuJ1VKbEhFgz81Oros95KFySfs0kYUf49Z0cZexyRx4rKaRWsJf3NtGFrsN2s70CEiJegChyU1d9U=
X-Received: by 2002:a2e:86c2:: with SMTP id n2mr2048844ljj.346.1602003322919; 
 Tue, 06 Oct 2020 09:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <87lfglt6z1.fsf@igel.home>
 <mhng-847e71cf-64bc-464b-8d09-3bcec40aa491@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-847e71cf-64bc-464b-8d09-3bcec40aa491@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Oct 2020 00:55:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRuQpwHvyZVjab+RMgx9BMR8gjcnGSgeP3a7L=dCcNqAg@mail.gmail.com>
Message-ID: <CAJF2gTRuQpwHvyZVjab+RMgx9BMR8gjcnGSgeP3a7L=dCcNqAg@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_125525_698837_F993AE9A 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Andreas Schwab <schwab@linux-m68k.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 6, 2020 at 12:39 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Mon, 05 Oct 2020 01:25:22 PDT (-0700), schwab@linux-m68k.org wrote:
> > On Sep 14 2020, Aurelien Jarno wrote:
> >
> >> How should we proceed to get that fixed in time for 5.9? For the older
> >> branches where it has been backported (so far 5.7 and 5.8), should we
> >> just get that commit reverted instead?
> >
> > Why is this still broken?
>
> Sorry, I hadn't seen this.  I'm not seeing a boot failure on 5.9-rc8 with just
> CONFIG_HARDENED_USERCPOY=y in addition to defconfig (on QEMU, though I doubt
> that's relevant here).  It looks like the fix is to essentially revert this,
> which I'm fine with, but I'd prefer to have a failing test to make sure this
> doesn't break again.
>
> Guo: I don't see an actual patch (signed off and such) posted for this, do you
> mind posting one?  Otherwise I'll take a crack at constructing the revert
> myself.

Please have a look:
https://lore.kernel.org/linux-riscv/1602002973-92934-1-git-send-email-guoren@kernel.org/T/#u

The only revert couldn't solve the static_obj problem.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
