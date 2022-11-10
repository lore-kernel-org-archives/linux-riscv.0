Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAEAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCgGDIKSPoFuF+//wZnSSXlCbPEhhZXC1enpX1fODA8=; b=E03gl/NeVcubHY
	TGghRp56i308r+QYA3czCJELt5Yubji4q0bZwg+Wl2WJni+rUqAfSZLDmwkj8EF/TdQaDVuqcgLeE
	gSdIM5g5VtpMV3f7KcleP9sy5X1/1JBNZfYJBsjY2/E+Igvxo8wtGrsLd69wM1tegleHSiNZw2/4s
	N83XgDerR2mZ+RFq5HE/qKrp/hu4xo9sSGfmvRL9qrbOXdr0JUEMfi8vbzzdM+jZZIGed8WtLKHB7
	+CBIVELq83YziADEmx+jDZ49oeK9rpZMLCUKYqZCD+N1JiruW4P3g51xqxsi/BxmXZyHnwL8roQkm
	g6XHvs97duvgI7jDEQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAkD-007JzI-QI; Thu, 10 Nov 2022 16:49:37 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAkB-007Jwu-Gu
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 16:49:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so2025929pjd.4
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPjVc+C4keVB9JNeySRKdiTbUPe13351AhOJe9TtZf8=;
        b=OOR4bwRUplBbyMMh2BEwu+86VP3qxijSJnezQ7clymoLz9HUcLonm3WyVFc88kB5fY
         O/E+L3vna3lCH6PwuGGALEpEbdqf//FCQPJXnQH0fruVZmuKpiXxpksMlHLNli5FBIVk
         yHcqF3ftlcFWSWpaRO18yKIRlZ4MLKYwLTrjNA/qL4cv528Rj8wkmrotYw4AfXaxmJus
         pcCX78Uh4a0+xqNPkY5yiRwsOaQfBATcwvX2XL8kq2aQkn5xXT0ESqE2s4sWnkM2XUP1
         lN0YUhWFEsDiU77d2rUZObTRDQeLPD96HT9QdyztVtB+kfc9jl7KnKnrsPBskzRSRVH/
         XRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPjVc+C4keVB9JNeySRKdiTbUPe13351AhOJe9TtZf8=;
        b=nD8efhsqXir6RNj0IlwPF1mV/Qos1crYzicBZJ8IIuUthU5qVDlrIYXSgDGfUmaEya
         HGNHI2dunr9MJnBgT4LrXqTalDhGx9nPuk010sajFOgerFdmuc9P6iPPMcAmgXT/MC4t
         QMsS2uL47Ngt9jKVUgCJDdy0t2Pxd7+HSGCpa5QIZalHBu39whQDmSUTHqIQ/jKlVt0/
         0Vw9PkNwC3+YWMOXkWP5E/oVfmAh7sb2qPFTauRsAimDbKa4CLu5dgJaDuP5nFCzoWY1
         q+8w/NA1K+s5zbNpScIpxLFdLtK63lWDPPfzb1QBf6JkAzdT1DR9bUZGsYk0GIjmLuml
         pulg==
X-Gm-Message-State: ACrzQf1jmpQW0PkZnUfz+SUC8Q0ce7Bx15CoX50G3YUOIwjB4+CuP4L1
	q7lWVMFgse8ac1Kep9vc9X1GVg==
X-Google-Smtp-Source: AMsMyM7nQN/gdgW0z481CkQ/WjHrrL4d++/kzaSXhuKO9UuGt09a3AowKSZBoBJ0HDICWxNrCbdrGA==
X-Received: by 2002:a17:902:d50c:b0:187:460:bf9c with SMTP id b12-20020a170902d50c00b001870460bf9cmr65545589plg.4.1668098974180;
        Thu, 10 Nov 2022 08:49:34 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090a020300b00205d85cfb30sm3288107pjc.20.2022.11.10.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:49:33 -0800 (PST)
Date: Thu, 10 Nov 2022 16:49:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
Message-ID: <Y20rmaU14rZFFCZI@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-38-seanjc@google.com>
 <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_084935_612680_2CF2BDAD 
X-CRM114-Status: GOOD (  12.85  )
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

On Thu, Nov 10, 2022, Robert Hoo wrote:
> > -static int kvm_starting_cpu(unsigned int cpu)
> > +static int kvm_online_cpu(unsigned int cpu)
> >  {
> > +	int ret = 0;
> > +
> >  	raw_spin_lock(&kvm_count_lock);
> > -	if (kvm_usage_count)
> > +	/*
> > +	 * Abort the CPU online process if hardware virtualization
> > cannot
> > +	 * be enabled. Otherwise running VMs would encounter
> > unrecoverable
> > +	 * errors when scheduled to this CPU.
> > +	 */
> > +	if (kvm_usage_count) {
> > +		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
> > +
> >  		hardware_enable_nolock(NULL);
> > +		if (atomic_read(&hardware_enable_failed)) {
> > +			atomic_set(&hardware_enable_failed, 0);
> 
> I see other places using this hardware_enable_failed with atomic_inc(),
> should here use atomic_dec() instead of straightly set to 0?

Meh, both options are flawed.  E.g. if hardware_enable_failed was left dangling
(the WARN above), then atomic_dec() won't remedy the problem and KVM will reject
onlining CPUs indefinitely.  Forcing the atomic back to '0' will remedy that
particular issue, but could lead to problems if there are other bugs.

> Though here is embraced by spin_lock, hardware_enable_nolock() can be
> invoked in other places in parallel?

Only because of a KVM bug, which gets fixed in the next patch:

  KVM: Disable CPU hotplug during hardware enabling

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
