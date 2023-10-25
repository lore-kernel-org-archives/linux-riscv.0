Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD825C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77iK9bC4A1JAiry7x+OEud6YXheLQmp78b+0Fw1+2FQ=; b=UN1zYh1EuF2K+t
	dzRAf7NU7a6gDMlcV0nOfcL3On4WQlA2JbdQfrZ/QXzkeoiDzDw6YFY+Yy0YkUQD+8PX4dvWRMKWE
	FJmLB6dokn+h/mbM3TXexMVBMx0cupRBQgfJqQU3pHLpG83wWzXG5KWqu3NFu1pRgaqpOxejJ4d5t
	oDCaeY0LibqpmTC3+sNqZ2ws3+NAzYP7Rf2kuvs9nD8b8KjLHyQdJl1+35dkHgsr3gpxiNio9wwMk
	WbUe0t+yezdyxy1Qa+EOul5reoSTBNHiOQfNvmjOJhgUnnsFMZ6myi8TTB9G9zy8Du2NrHbE7s1wP
	pFLz+d/cIe7N56TRv0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdT4-00CLyj-13;
	Wed, 25 Oct 2023 12:58:38 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdT2-00CLxd-0J
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 12:58:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-27d3ede72f6so4953267a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698238715; x=1698843515; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RXdPX/Ew6vUAH8RT3E33QyyRiIgHD1/PeR48oEvaIy0=;
        b=jah2YwLkNA+BZqGm0IgJGWVQEZUcxX2paSMc8hCzqbes0PS6QJNoPLsnRFxXoiGC1O
         rboBbKFYQA3ZwohgKQ16Pm0AXDOluv+E573Ox3WzRoarB2upy9rVd2vg7UWiv1wox3ky
         xGlyXSAb5ry9SP++/Ld8XXtxC14kNwxaCPg0Ojki+CLAVIrJ7iN80fFkvw7vQqaJL44S
         LqshZfOmojVKfI47XVC/hv9fCqYEd9mYA4n7JK6O+Ztm3Fe20qUfeZ2lHUkP8uQc1WS/
         RD0x2/+WhhqT5Op125sFHvyJEhJHKAmLCGTvnCmmIhEIUfsDk/lkALr/W0JDEc/KioOL
         HirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238715; x=1698843515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXdPX/Ew6vUAH8RT3E33QyyRiIgHD1/PeR48oEvaIy0=;
        b=DxA5cAyegh0HQyo1SyhUAiR2hdYUOKxzIJRb8xwVvy53pwnKVrElt844RFVolVjkF6
         fgIM5AfFvzLGyREP8jq4GI74mBMVrgLDw8KosCgwEY9PGGaowxKBvh0Dp3kqCPpSCZla
         kdPwv1IZU5184glaJ4hkOwq/w2WFZsZR34BglFSdSqnC+xLfben1eHfxVt910LY8uCza
         tAEnxNYVTxFnDvaewmC96MWczZxHRC9VWML3N0j85eK4Ljor0P2xeg+X7hj+XInx22UW
         hU9AxnKR6bRwe3fJh1sAZ+kJqaPEWzZL773jcBLMLCnsrEao6USJ0prWQopl2yZNRlrW
         vshw==
X-Gm-Message-State: AOJu0Yx3yp+uVgp7LQV/toTGp6lUmfi57jZlnKUlKbmr1ZCGpoNEgjNx
	nXrR9jCVaHqNwSWx0ZMifKcn9Cv13PlyG79pOyk37Q==
X-Google-Smtp-Source: AGHT+IHmoJ9xE85jGvst0QuZ8mIaONL518f/RiO/u3OpvoeRZ4onqE5R7ha2FlOK0X/zBrOO+EbV/QXuM3FR8wyWxTg=
X-Received: by 2002:a17:90a:f312:b0:27d:2cc3:c805 with SMTP id
 ca18-20020a17090af31200b0027d2cc3c805mr15222491pjb.46.1698238715427; Wed, 25
 Oct 2023 05:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-6-vincent.guittot@linaro.org> <20231025125151.GF31201@noisy.programming.kicks-ass.net>
In-Reply-To: <20231025125151.GF31201@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Oct 2023 14:58:24 +0200
Message-ID: <CAKfTPtAb-9VcNKNf1HJOi83STrC_eNRD1Qf0Ra2fm6qspqme7w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] cpufreq/cppc: set the frequency used for computing
 the capacity
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_055836_138321_BF1BE734 
X-CRM114-Status: GOOD (  17.81  )
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

On Wed, 25 Oct 2023 at 14:52, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 18, 2023 at 06:25:39PM +0200, Vincent Guittot wrote:
> > Save the frequency associated to the performance that has been used when
> > initializing the capacity of CPUs.
> > Also, cppc cpufreq driver can register an artificial energy model. In such
> > case, it needs the frequency for this compute capacity.
> > We moved and renamed cppc_perf_to_khz and cppc_perf_to_khz to use them
> > outside cppc_cpufreq in topology_init_cpu_capacity_cppc().
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/acpi/cppc_acpi.c       |  93 ++++++++++++++++++++++
> >  drivers/base/arch_topology.c   |  15 +++-
> >  drivers/cpufreq/cppc_cpufreq.c | 141 ++++++---------------------------
> >  include/acpi/cppc_acpi.h       |   2 +
> >  4 files changed, 133 insertions(+), 118 deletions(-)
>
> Perhaps split this patch into code movement and actual change for ease
> of review? As in, I'm having trouble finding the actual changes ;-)

yes, I can split it.

The actual change is located in drivers/base/arch_topology.c

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
