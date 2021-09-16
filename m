Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E39EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 21:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0867361206
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 21:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0867361206
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnpBrTCNtAEFSV4gly7XTa+TgFwi838x8Duxjxsolvw=; b=xJuqjzXE+0SS36
	I+eUyXXPeLskCcHeVspV2dPKDnn/V67TSsDRrdhkPk5AyTAp2DhXJzo9UasvyhctTbfOmSZXVdbbA
	mQnvXnPg3qSNwFm9td1LDyRp3IWL6Cvc6MugjkwLIioGEW+5zE8Gh/6RvEnwQhLtNjuUp+iuk70R3
	qD1IxbnX5bHAo6fv7fF3YbKNAalMe2/iEFgvVvpDiG8SHjaLbmj0SNykfWBkIc4R1NswJog5p88dl
	PRK8fBkoYdZ7p/6snliV50eD27X4/GmNL0mBSgAQ8yOTapWp0nR0Mxo23XBFzTipynoctTOlPafxO
	iOdQgfx5CAVKDu1lvhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQz82-00CQzH-2Q; Thu, 16 Sep 2021 21:41:10 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQz7z-00CQxX-KF
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 21:41:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id v1so4758832plo.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 14:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H6MB2ODxA8ncTb3aji91NU1uUQ9q1AebxOl6ENeKyck=;
 b=MXQC+ZfLxlKAl3MhEJW1BaTu7x3eZBr25vDIOP4P1K/hKKNsBxR9bYAbQrcXeqx0IT
 UwrZDJawrFH60RbkF94BswFhIwo0cou0aN+gLacubbeU6IcTTMJrkdfHEYWn3Q3CVBfY
 FWOlqrCFMP2DA28EATBAk/sg6Cxl8pCwP9qJHgGrwzQTOnAwwW0mxDrD/8RBAtDi8Sen
 7O4AbiMouCC1KnoWzOLrohcS9Vtb2Dd0sBl4eKlMlTi8+NrzRnGujJOfnGMsmwaTYUXB
 tHZDCMU2HvcsbXJF8DOiqaPVnBEOB3kiFk+1tNf5dSr4/Tt9/mMCbKmuD1xBAf0iTv/g
 rERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H6MB2ODxA8ncTb3aji91NU1uUQ9q1AebxOl6ENeKyck=;
 b=CcPQO2zI/k2/x6whxXgttsyFOxBhY0kRfsog82IV+/XJ+6w1ZNlgKfYOHJc099GQRY
 50WzmATjbAGgXAWa1rhVpJRwtDZDcJ+63fT2BNWblzrtrhd2NW8kJZLW9zI0ANNMKguP
 TfVNMXUTD/ryb6Iaf3w/qI9u56Q2fzH7THU3I/5mxA8aS8Hi7hlA6/2uq4fLGqjLkp1e
 SvsPb+bXKPT2aQrkADQEiKrr9yPk2+nz29nZUGljN5n7q2mB7bWO3h3L9YNMgdL5dHIw
 FLX1ukm2PfifkFF0s/lC8nvoyVFrBwL6OUilHXhPnvkf2cksfoIHSqgP/Y1+JY/oQUsl
 LqJQ==
X-Gm-Message-State: AOAM533zUzQe98Bl46zGarEweJrFPUXng1oRagTxZOYgdbQBifyCT0iT
 OJ+nLAiiG+coRZLh9/Mny2qgfw==
X-Google-Smtp-Source: ABdhPJyEB8CLbdwiUNdfZdvrZtOKbQbkduopskaqSrtZd3BkA7cXNgyeY28844ULJzTSWyVMUXnICw==
X-Received: by 2002:a17:903:244e:b0:13c:802d:92c with SMTP id
 l14-20020a170903244e00b0013c802d092cmr6486996pls.78.1631828465371; 
 Thu, 16 Sep 2021 14:41:05 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id z11sm4163558pff.144.2021.09.16.14.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 14:41:04 -0700 (PDT)
Date: Thu, 16 Sep 2021 21:41:01 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v2 01/13] perf: Ensure perf_guest_cbs aren't reloaded
 between !NULL check and deref
Message-ID: <YUO57TlEGlUk2Q03@google.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828003558.713983-2-seanjc@google.com>
 <20210828194421.GB4353@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828194421.GB4353@worktop.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_144107_698102_9FCBAD7C 
X-CRM114-Status: GOOD (  17.06  )
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

On Sat, Aug 28, 2021, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 05:35:46PM -0700, Sean Christopherson wrote:
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 464917096e73..2126f6327321 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -6491,14 +6491,19 @@ struct perf_guest_info_callbacks *perf_guest_cbs;
> >  
> >  int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> >  {
> > -	perf_guest_cbs = cbs;
> > +	if (WARN_ON_ONCE(perf_guest_cbs))
> > +		return -EBUSY;
> > +
> > +	WRITE_ONCE(perf_guest_cbs, cbs);
> > +	synchronize_rcu();
> 
> You're waiting for all NULL users to go away? :-) IOW, we can do without
> this synchronize_rcu() call.

Doh, right.  I was thinking KVM needed to wait for in-progress NMI to exit to
ensure guest PT interrupts are handled correctly, but obviously the NMI handler
needs to exit for that CPU to get into a guest...

> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
> >  
> >  int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> >  {
> > -	perf_guest_cbs = NULL;
> 
> 	if (WARN_ON_ONCE(perf_guest_cbs != cbs))
> 		return -EBUSY;
> 
> ?

Works for me.  I guess I'm more optimistic about people not being morons :-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
