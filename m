Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1DEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHGDYRCz8uagqB6ihDFTI4hQXI8gTQkKm9/ZFyT7K1M=; b=3XCbpb59esHZIs
	HUFteFhF4IHgrPACV/YSVYJOT7UR5U2ZyO5z4hKcjhS9Nx0aLdmkbVg4KaBl4bdO9ftquJoVHVhkz
	x5mUJrXvV1zuhHZrs5dYhPZ7p2KJzwH/m+eT07J0YY9qR+CRawqCWEVUdS/zI6S/JL1exaA3oHqRX
	rkv9WM/l4fFJK7mMk4ZK+8sH7AEtLm2oXl9YHO3iKZFNzHBF0ktlrl5ss0TXgdYfH4IwYPbTv2KBG
	jFwM70vhsN5wEJ9BufrDh5CLZ5pXXtf18QaZVDIxpU5F65g6S93i2KhZ0Mgd8/Tl240sIT7aQ6F4A
	f5s/b6ZGbHHcgdUqfoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAtN-007PJz-UA; Thu, 10 Nov 2022 16:59:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAtK-007PHD-Fc
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 16:59:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id j12so1883449plj.5
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 08:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=++qaNnNL5OJX09F4SmymJbSNGTe4YNGKf8knlNeZLIM=;
        b=LnpIznW50UbJYIR0PEtWeJYNJ+5rH6MIlZozMzFMTwSQvTcP33ucW9c9lQSevvLDXI
         QyB5+yXhMZUDNlkwdSbDFjM7JR9S8ttOodJeLQApsp/g1X2g7iaiRMpztbbtLirGmHXP
         Ok5MPlCZ4tZXNzdoN/5EaAFNU5i/kMEU+Pj6UbsvHwVNko95a9bIdjWXiNhQrkyCMZcF
         1gbXxHeTac5BLcvPalQHTWFwjbFrO0re69/ZDM4/c7ATiGknmYZEnSteDE0eFOsuiUGv
         o02wNWrUZNQBtGle02WgOsPhE6Inb5/XeEtyenAcor9m9bnEppDYL8UdqJt6p1agDB2o
         ED2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++qaNnNL5OJX09F4SmymJbSNGTe4YNGKf8knlNeZLIM=;
        b=bE7prkfuaaZ7dOFDegWAJoo5rTRNWRYLueORshzhcb9B7O4Nmho50R4CAGfhJTwmWw
         Vfs+Bxn39AT4BcCwH6eQ2hCovIBYx1s1H++tIGvRqSfRxHhtToXIQNgYMHs2GnbXKkFh
         +Doib0A1tnwemr84yHE5QoJG4Si9nqixxGD2ACIZYQJk7wRYQdHwGFfdkxURlrsmkLAA
         75TtrJokCZ3hU8dHzroyj0B0n6BF8/3PiscIuRnx1eJ7g4gviBZgoM80Fy4qTvKDrXm0
         wD6QNON7W7O84uh2YcX7HcbF1uwWHv0vz1MH7lImMwI31nyHE2tB0BJDgbyqVq5MCA+G
         k1gg==
X-Gm-Message-State: ANoB5pmgWYMHbhUDOQCtBGHsX5M5+kVDsLHRr0p8RmT1iaLkYOslQi+B
	B+LbdzcVjim7WKIAaFMc88EUjA==
X-Google-Smtp-Source: AA0mqf4HLI0425WgRwXjVOczy7lGJ1ZoFRhJMikRvyU6kmBBe6o5W1MVmVmeziJeqm75+QzM+47Lew==
X-Received: by 2002:a17:902:6aca:b0:188:736c:befa with SMTP id i10-20020a1709026aca00b00188736cbefamr1100928plt.8.1668099540938;
        Thu, 10 Nov 2022 08:59:00 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a5ac500b00200461cfa99sm3302123pji.11.2022.11.10.08.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:59:00 -0800 (PST)
Date: Thu, 10 Nov 2022 16:58:56 +0000
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
Message-ID: <Y20t0AMNqvtyOwp2@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-39-seanjc@google.com>
 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_085902_540867_9DF15D54 
X-CRM114-Status: GOOD (  23.09  )
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
> =

> So WARN_ON(!irqs_disabled() && cpu_active(cpu)) looks reasonable.  Sorry =
for the
> noise.  Just needed some time to connect the comment with the code.

No worries, more than once while working through this code, I've considered=
 setting
up one of those evidence boards from the movies with string and push pins t=
o help
connect all the dots.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
