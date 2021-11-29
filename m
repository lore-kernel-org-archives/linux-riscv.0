Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AA3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Lf7JDYvSym/WCHQGXEk+e1DBdudj3EdZddNJ//bOG4=; b=YkzeDhZyV2ifr9
	vQOyra/luFz+IvutcM/fYqPnHQ4CHhGZZzaJ6PAwKRSPLCwvAQNcDkO7h9OUWOK5pXLXac16qqAX5
	HkJUulgm+aPgYhh3X+pPmfVGuZu+iBUTigLMZONNX3el+97DwBZqoBJf1xy595RM4+BMWRy0Y14Ic
	+PI3jBiH82B5mbddSZZwZ22DlxBeRDk0WP10eW85BDzooGx8XY4UAzL3aLanz58v/JwdCoRXkj2at
	EHWaEhlNQMYaFVw44C5Tgv4govU+dkc3nlwCSRHFj6BSzbZRavzOnkJ//GJQ4vS9Z0phI9uaCvB9O
	OEAh/YUOzrN2e1KzxPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrlsu-001xFR-Vo; Mon, 29 Nov 2021 19:00:17 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrlo8-001vUn-4d
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 18:55:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso15047628pjb.2
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TYbgQqCpCmOsVo/Ud6S4W0dWbGKnEHCC/sbfSrxRU2Q=;
 b=V9NdrM9IGQ8TORtVAjZzUck1RI7UtY24/5ryhbIDx46VwTLIEKKddxeNbMrV6TQpIl
 KTCIPozOyBw/wCgOEJPsKU3C9LENDNILuHldgqEm6W55x2AEOVy9zbC+oB0Q8kNXcib2
 utENfqKkezcYzZnD0pmUAjWeJ/cGQai7wseSy0Tb7+ezAyGs24Tiec69FywheOS97WPw
 hiOKPwklIAtqAAVwW+TVa82nOI4oJHItJIs2sHILKArSIy33/Br5zlJSRUemG17TIymQ
 2z90v41HGfafPsWOqjYsVFIk8gpVXUcAMJTfJevG+nopt2huTRvy9U+7v5siSDcfSs81
 05ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TYbgQqCpCmOsVo/Ud6S4W0dWbGKnEHCC/sbfSrxRU2Q=;
 b=YujT4ALRNn3k26hhlEjzu5KNUO9A1nD55IvPXF6Kq8/x3uMLrZKZa15xldLA0EaScC
 xdRl1ZwXWnAasQnuO/0c+KFksz2OzFXpxdkbZ0g2ZRQfEyHB3cZPICwWQMGzq8m/cUPv
 vdJzdoDdT5dOrrHIrNkGTRlR+rr4Y/GTj6cWGoNmHvrS18DMgSJpuWE3zDGteAC3MM7D
 lFtTRHJlLB/mj2Qf3ASKUuvKLVVVSGVr7AVo0AV69VDU1YLH4BdoXg02sMZiE5hab0O5
 5plzQyvFYan9RhVDMYdAuBGwwegUr2uXiNkbFjKJlqHhtBZBl+Ko6bPwlRXn3yKh5ueH
 Nf+g==
X-Gm-Message-State: AOAM53112/UT0O+ViJDF9ijTj9FazDFUTw83tB4nxT9D7e44wQ7WCvRM
 VyT7VSONzB1GZWlCFR8o9NQVpw==
X-Google-Smtp-Source: ABdhPJzGwlSa9NgpBenMt4CKt9Ftf4k4qsHL0lT0KjuZVEYivrfeFPAQn3AoVSiAs1eAB5ezweh9DQ==
X-Received: by 2002:a17:90b:2251:: with SMTP id
 hk17mr189639pjb.31.1638212118683; 
 Mon, 29 Nov 2021 10:55:18 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id d17sm17979027pfj.215.2021.11.29.10.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 10:55:18 -0800 (PST)
Date: Mon, 29 Nov 2021 18:55:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
Message-ID: <YaUiEquKYi5eqWC0@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_105520_235038_00039BE8 
X-CRM114-Status: GOOD (  15.87  )
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

On Mon, Nov 29, 2021, Paolo Bonzini wrote:
> On 11/29/21 18:25, Sean Christopherson wrote:
> > If a posted interrupt arrives after KVM has done its final search through the vIRR,
> > but before avic_update_iommu_vcpu_affinity() is called, the posted interrupt will
> > be set in the vIRR without triggering a host IRQ to wake the vCPU via the GA log.
> > 
> > I.e. KVM is missing an equivalent to VMX's posted interrupt check for an outstanding
> > notification after switching to the wakeup vector.
> 
> BTW Maxim reported that it can break even without assigned devices.
> 
> > For now, the least awful approach is sadly to keep the vcpu_(un)blocking() hooks.
> 
> I agree that the hooks cannot be dropped but the bug is reproducible with
> this patch, where the hooks are still there.

...

> Still it does seem to be a race that happens when IS_RUNNING=true but
> vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to
> trigger because it moves IS_RUNNING=false later.

Oh!  Any chance the bug only repros with preemption enabled?  That would explain
why I don't see problems, I'm pretty sure I've only run AVIC with a PREEMPT=n.

svm_vcpu_{un}blocking() are called with preemption enabled, and avic_set_running()
passes in vcpu->cpu.  If the vCPU is preempted and scheduled in on a different CPU,
avic_vcpu_load() will overwrite the vCPU's entry with the wrong CPU info.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
