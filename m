Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC585C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9146060EB1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9146060EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3ppaMe2HniQ8mYkSXvewljovTtFuJe8HidTaX2ApGo=; b=qbFGICiSULz15I
	Tg8hWPnMpAte3ArGYfo4HFkbuSfTk2bi9jJ988jRtBX5KFYXng+oZu20xdYwDCH0DtV4ZVwuKIwBp
	ucosaf36LhbjHBQTfMvxYf/lyMOmSw4Mo9cenRY2PeF9/CWkIYO7gszzhT4nAg+CyKE1a638dU0oY
	+2nz8D+54LGEpbAH6j7tzI7IFBs//BuF3fDwwIGXOZWE0lSGYyX4h53nEUwPr5P7Un/8mAa35vsd3
	ffbesCslzqEadWeDFDgc5BGKF7Fnammu0gYTxDce1ajfI7HGhw2Aw/GRCSJbAS1pTtiw9fGzda4+c
	t9IlRMBlDY3rnmH/7i0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwZg-009oNa-Db; Mon, 11 Oct 2021 14:46:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwZU-009oM2-2R
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 14:46:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id y7so5493905pfg.8
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DBJ7ew0y4wvSmKi4WuGSAOH7oUWp7VGZaMnxUGUZnug=;
 b=WUgGM/f+tuPQ7vGNX0cNBBwPv0afu/Zf4dQxhALEj1CWce6SG/QX3MDYljf0Gbuor/
 sj1ONxiUie1VuDLeZqyzP3U8wgCb5jI5/lPjBFHrG3lQw2dxyh3W+h6mZVvyEvJz8G7y
 1nEPJR+H3CxD/4MNWxAGoi6oKI9swc9dOAfsAmuD9ToN3kvenxSiEM2lWlzMHV2o9VoH
 KyJiDN0gZI6nT02ZPzo0daWaK+RTn7Ob4pOSdy5AEMo6f68pgZs/vQbuhgd7TqLjMpzx
 27dHqDzBC8kH05vyX+/CHU4byC6ZoMfjoSir4u7rmWajgW3NJ9i2O+wJZUYyUoDZl7A9
 85aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DBJ7ew0y4wvSmKi4WuGSAOH7oUWp7VGZaMnxUGUZnug=;
 b=e5Upy6U08o4wNfLcEO8LvLgZz4E0KsZavZTqmVuCjoN/+hAf+0U48dAUfK73/eBURs
 8hhyzq50+wiSLEFPLNtl52oQF8l3ZR9xQZiEoHih9Ri7sMJphXCBaix7ZqYjBpr1lmvF
 +qEZJB5zlU5eAjUd9Ffa7+FW5dCavY7K6L74+14dIGtYaqKifDerubPRvjcgmiJRpNS9
 5gkX2Nx55gurn+oebOVPbroSwe7e/ff9ussBevb2V5nsw9SOb1YGq5xuRlxZnH/te65n
 832JQdW+i6sIcMq+Z8KQnyIOe87w/cdX0EKc2q9znHyoRR+4oxqW8ZRlOJiDiIzigjBV
 m9Iw==
X-Gm-Message-State: AOAM531CR+Tr+lxuX03zAhR/SwnWSHAlu9FNvCF7gcCL1BKa8Td555vH
 RYJXdIKTBjWcambYGri0H5NSAA==
X-Google-Smtp-Source: ABdhPJy9JeaIFsaMhzjKrm4gRLnqTQlHrSTvgGmlHsrREml2i4T5hhC4ZlLxJitHkoHCOL8HD11SpQ==
X-Received: by 2002:a63:c:: with SMTP id 12mr18698297pga.477.1633963591022;
 Mon, 11 Oct 2021 07:46:31 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id x129sm8062008pfc.140.2021.10.11.07.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 07:46:30 -0700 (PDT)
Date: Mon, 11 Oct 2021 14:46:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v3 12/16] KVM: Move x86's perf guest info callbacks to
 generic KVM
Message-ID: <YWROQSGPuPf3wfC9@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-13-seanjc@google.com>
 <87wnmjq4y3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wnmjq4y3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_074632_123963_736DAF52 
X-CRM114-Status: GOOD (  13.91  )
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

On Mon, Oct 11, 2021, Marc Zyngier wrote:
> On Wed, 22 Sep 2021 01:05:29 +0100, Sean Christopherson <seanjc@google.com> wrote:
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index ed940aec89e0..828b6eaa2c56 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -673,6 +673,14 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
> >  void kvm_perf_init(void);
> >  void kvm_perf_teardown(void);
> >  
> > +#ifdef CONFIG_GUEST_PERF_EVENTS
> > +static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
> 
> Pardon my x86 ignorance, what is PMI? PMU Interrupt?

Ya, Performance Monitoring Interrupt.  I didn't realize the term wasn't common
perf terminology.  Maybe kvm_arch_perf_events_in_guest() to be less x86-centric?

> > +{
> > +	/* Any callback while a vCPU is loaded is considered to be in guest. */
> > +	return !!vcpu;
> > +}
> > +#endif
> 
> Do you really need this #ifdef?

Nope, should compile fine without it, though simply dropping the #ifdef would make
make the semantics of the function wrong, even if nothing consumes it.  Tweak it
to use IS_ENABLED()?

	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
