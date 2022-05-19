Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B89C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+cosnI70nCdXuWhD+ODzzFB1ujptTws8fvBTRKiiow=; b=NYrh7xHFR883jh
	EwsrzhQQ7X2EcEw9hVZ37qHrd1uYlOX7jJUGGD2Y9mour9GSY56i7J7CutLudteAitKIcYswTkCpu
	Szxl3/t0X6js/0f4On2XbkWfJGgw4qki/VY3QWINfEm/Bz+GlKRqO3v6xam+hI5YzNgAai1MeAbCV
	NVdEX6m8JdLjQ7xBM3/nxu1XXxGGsZKxdT2rwzZ3SaaPiJLFGT+2606Dpa9j/b9JIj1lCSuI4VXaQ
	EGzO+ALkMJJGmMRXsro79iaV5sE4EHWZ7lwUVcUcqp/oJYCcYnel9MyacoTsP+c1hJPuYAvkYwRHB
	bbv/WN/6GUPsN2jYsctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrk6u-008eRw-HO; Thu, 19 May 2022 17:38:52 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrk6e-008eL4-R6; Thu, 19 May 2022 17:38:38 +0000
Received: by mail-yb1-f181.google.com with SMTP id i11so10246994ybq.9;
 Thu, 19 May 2022 10:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/4Y5SexZH4Q61j2eqy5fN+0Vz4/ulgakGP6fRmNC5Y=;
 b=CITsD4ymWvw2+bDTjcDu3i7wQWN7Wa5aRlDXEr52iaiKhrwYu4dDFToZJMUQn8QlT2
 EGfA+40rUi+dPSyIi0olrcb/G9qZ934vC4Jz8dXFUXYnsp3XAnAYELOKWS04AnDasXOx
 wywJE9zGkZiKvqFOyspJeEjGp0CBr7HHzm9E/aAsDredEAq5T1GvJrtHi5xxVwR+j8ue
 mkZgnCHFsc7RKsgxogqwOgYmmLHKRYldrUwj2qPPIrD/z8o+3+M2KmNLOIsnUVhye4Ng
 kcZ2OyPXJXUDBlPo06L2qy1zMwyjPxwyQv2EQdsRAyYSPMVcnRMIB8HzrMvG8A8Ney1B
 XD1g==
X-Gm-Message-State: AOAM532QssmBdRqnTUfT5ltoDUAzR6kV2tAT+CxEyrvXmq5bl81HQowe
 a9dcmvhX6XgKKtcTNcZIKBaesHpkLlj1Gu20je05knBD9hQ=
X-Google-Smtp-Source: ABdhPJxHYFAlbY4jjEvyBbq9j4RtDnQblrvomR9PFYZ1UexBxXux8tAij6JeBGq/iQ5vj9VW43XCIneKGjxsk0rT8ME=
X-Received: by 2002:a25:3302:0:b0:64a:df5b:d08 with SMTP id
 z2-20020a253302000000b0064adf5b0d08mr5295724ybz.81.1652981914465; Thu, 19 May
 2022 10:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220514152032.758738-1-ulf.hansson@linaro.org>
 <CAAhSdy3m3FzbkL-On5kPtrZgyO4x=6onr6mXi_=te5B=m_n8GQ@mail.gmail.com>
 <CAJZ5v0i+RR2nK8gew9tbnO_VVU3YUx2JgdRTBW07EPrB3UK87g@mail.gmail.com>
 <CAPDyKFrcWBL=7enQ3FJO7pFqv465-Nb3UWZm3faGYe5kG+Mjaw@mail.gmail.com>
In-Reply-To: <CAPDyKFrcWBL=7enQ3FJO7pFqv465-Nb3UWZm3faGYe5kG+Mjaw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 19 May 2022 19:38:23 +0200
Message-ID: <CAJZ5v0jLH2cmy_vUoyg_4eumUif0csrsvg3_ATY0MEDmVr5nFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: psci: Fix regression leading to no genpd
 governor
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, 
 Maulik Shah <quic_mkshah@quicinc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_103836_947167_DAF966AC 
X-CRM114-Status: GOOD (  15.16  )
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

On Thu, May 19, 2022 at 3:01 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 18 May 2022 at 20:50, Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Sat, May 14, 2022 at 6:49 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Sat, May 14, 2022 at 8:50 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > >
> > > > While factoring out the PM domain related code from PSCI domain driver into
> > > > a set of library functions, a regression when initializing the genpds got
> > > > introduced. More precisely, we fail to assign a genpd governor, so let's
> > > > fix this.
> > > >
> > > > Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from PSCI domain driver")
> > > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > >
> > > Looks good to me.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > >
> >
> > Ulf, do you want me to take this lot or is it going to be handled elsewhere?
>
> I appreciate it if you can pick both this and the second patch.

Both applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
