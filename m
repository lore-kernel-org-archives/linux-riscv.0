Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8A3C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaKBWyap2AGPlrEseGmeAQFqUDJJSjTMgz5CDjbLQhE=; b=1AeCsUyz2AZpWD
	0aLaXu5UH/Nf/ioVPIwkxxVvsCgsM1nbLiSuB0CEEhFqkKb9QcxBCRWtRCSeXURYLN/RYW/h2o1h1
	UmvS20rp0bfjA3l1SnYXM+EWqt7xWN42mfwLhHu+e/fYIlHLd1NeiCaxgx6VaQu+8r+6YKKuLPmYG
	P7j9xEsT8eNAyn9gaAvv3SGP38mxetYKe0RseS/T+vwRhyH6e4SpjOKIiVgquX4OZ7eOQ5AaBn6C/
	ojxWpinzHEj+kYTcNLmhl51ezX2wzZBgSTQsz9tG43sC8x3lTirrUBHCHAndqg57YvBLLbUUn67SA
	npN6U3gpdx6iK3ION4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2M5-00EVwG-3l; Tue, 15 Nov 2022 20:16:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Lu-00EVsa-8m
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 20:16:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d20so14152804plr.10
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 12:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7LP3RGpmdXiMN5KPTn9/IO+rih2AglOTsvbEdRvS1Q=;
        b=CuhvpEh+MwcQ8DdyO2LHPKc75+Mh4Tt/SrTxun8SjsbCLbKA/uujVn75/hrSWRbq3P
         pp681Bo0ABWoVlpW4KZ12uslMC8XMyFowDj24K4rvmpM/9YujrW27P9Vv5MLxt+ZIfOV
         Jm6zqwFB/7ZHai0ByGJfyD247/5LpCxHhMpkaFu377RaNtmMs+gPLXFcf0G1yQbvs+Rs
         EYu+becUwCm5WaK54RGM6rYBIysavORuhi+fV9JxKIFpQITo1Jz1JNtjUgO7b5R2U1/e
         xEGMqJLbi5RxqShnMYvwl9BbYi//M2ZHV0GVHxnWgbMAYD9A/uq/G/wppECfL4cNv6ol
         hTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7LP3RGpmdXiMN5KPTn9/IO+rih2AglOTsvbEdRvS1Q=;
        b=m1lggBhHYoVVn43dihWLYv4LUhqyhdYwKVIhWq+n/EYiQ5L4lI/U4GJWLoWNeDWf4t
         ydWz0tYIbrm4t+JiEIkzrw8CncB6HjnW0HCwaNUE+W5eZ3CdgT9hHYmRdHmLYBa/P5XB
         r/cD6MfZBWWCGra7PiUNoAoG5vo7mIeBWdToLzXxyZPOQjCDUdwRhq76aw7OjlS8gFFv
         UEieMq1R6Cv+zv4jt0l2M/lkzYal6tsMlV7x6dJa3NJuY+6bnWCbOuXyDAGWpt9i8O5r
         sAqVOo0lsrUPqnp2aDhMvqSIvrG6oQkcfjLE3gI4ewlW6voq/tFqQW8xbnj3Rvfdz12U
         /+XQ==
X-Gm-Message-State: ANoB5pniN9bI5OHRzHQom+v9+NMcJAYg3EVDDRSK+EvxxU2BBJ+ZTpcS
	qNQcA8TOZRXPtU1g6MNhHOd3oA==
X-Google-Smtp-Source: AA0mqf58/qb3pHX8jXG9rQwsI0kWr5CgUXW3YysHviPdV0VVEN3OAELl4gQs2//98Y2csv6jhLKLCw==
X-Received: by 2002:a17:902:e8d5:b0:181:6c64:6dd3 with SMTP id v21-20020a170902e8d500b001816c646dd3mr5671131plg.123.1668543368117;
        Tue, 15 Nov 2022 12:16:08 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b0056c08c87196sm9173979pfa.48.2022.11.15.12.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:16:07 -0800 (PST)
Date: Tue, 15 Nov 2022 20:16:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "farman@linux.ibm.com" <farman@linux.ibm.com>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"david@redhat.com" <david@redhat.com>,
	"Yao, Yuan" <yuan.yao@intel.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"Gao, Chao" <chao.gao@intel.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Message-ID: <Y3PzhANShVlTXVg1@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-39-seanjc@google.com>
 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_121614_319269_927E638C 
X-CRM114-Status: GOOD (  23.74  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 10, 2022, Huang, Kai wrote:
> On Thu, 2022-11-10 at 01:33 +0000, Huang, Kai wrote:
> > > @@ -9283,7 +9283,13 @@ static int
> > > kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
> > > =A0	int cpu =3D smp_processor_id();
> > > =A0	struct cpuinfo_x86 *c =3D &cpu_data(cpu);
> > > =A0
> > > -	WARN_ON(!irqs_disabled());
> > > +	/*
> > > +	 * Compatibility checks are done when loading KVM and when enabling
> > > +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> > > +	 * compatible, i.e. KVM should never perform a compatibility check
> > > on
> > > +	 * an offline CPU.
> > > +	 */
> > > +	WARN_ON(!irqs_disabled() && cpu_active(cpu));
> > > =A0
> > =

> > Also, the logic of:
> > =

> > 	!irqs_disabled() && cpu_active(cpu)
> > =

> > is quite weird.
> > =

> > The original "WARN(!irqs_disabled())" is reasonable because in STARTING
> > section
> > the IRQ is indeed disabled.
> > =

> > But this doesn't make sense anymore after we move to ONLINE section, in=
 which
> > IRQ has already been enabled (see start_secondary()).=A0 IIUC the WARN_=
ON()
> > doesn't get exploded is purely because there's an additional cpu_active=
(cpu)
> > check.
> > =

> > So, a more reasonable check should be something like:
> > =

> > 	WARN_ON(irqs_disabled() || cpu_active(cpu) || !cpu_online(cpu));
> > =

> > Or we can simply do:
> > =

> > 	WARN_ON(!cpu_online(cpu) || cpu_active(cpu));
> > =

> > (because I don't know whether it's possible IRQ can somehow get disable=
d in
> > ONLINE section).
> > =

> > Btw above is purely based on code analysis, but I haven't done any test.
> =

> Hmm.. I wasn't thinking thoroughly.  I forgot CPU compatibility check also
> happens on all online cpus when loading KVM.  For this case, IRQ is disab=
led and
> cpu_active() is true.  For the hotplug case, IRQ is enabled but  cpu_acti=
ve() is
> false.

Actually, you're right (and wrong).  You're right in that the WARN is flawe=
d.  And
the reason for that is because you're wrong about the hotplug case.  In thi=
s version
of things, the compatibility checks are routed through hardware enabling, i=
.e. this
flow is used only when loading KVM.  This helper should only be called via =
SMP function
call, which means that IRQs should always be disabled.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
