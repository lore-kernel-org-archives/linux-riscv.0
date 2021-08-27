Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A083C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 14:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44CBB60F4C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 14:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44CBB60F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1B6UMHF+vbN1K+1tiDDcVgzkDFihLaojUSkZYZro+2A=; b=iVi01ndx14dhZH
	Xavkyyd8N7YW4cGsaKG4/n1ZlkW/pNkHij2S5z7OHhymCJ/6A4c5ZwOi2Qs5aRQAJsWv7KCyPz8iE
	C9BNhdOLFmJYvOysrsCGTluATiBgrkm4GbFwjPnhFE+YCXFhj3wk753zRp1UddmtrHyGfNxSFUhZP
	djkeYsB3qT76LoZbt4bti4W8kI+qARBhMSynJQwIwWQctG5l/uPUuYH6xPXUHjh5DMtwMLBe4nxMf
	g8gdIT8dqk6c/fwk5LUozAZxEoNhs5EjMXcsfEX4EkFlTCpolHSgUbHBiy4G6ZYLC02Ni7HjwqELS
	S7lkC/uiv05A/FG65nYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJdBJ-00Ca0I-35; Fri, 27 Aug 2021 14:50:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJdB5-00CZxx-RL
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 14:49:57 +0000
Received: by mail-pj1-x102e.google.com with SMTP id mq3so4681758pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 27 Aug 2021 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=14M76fSGlvACgnYuGU3A/x3DEJPAcKiBE8JXzhdP/4U=;
 b=pLAL3YBvEH241wYB1s4aywKaz7QeJRhSbGv+nktb/1x+GCOg0VVDMExMGUZWmZPsDc
 NVzspVTDa3lSW0dyJijr23zu+7tSFARHT4kxKiTs7I83HrgoOR9ZjAM+CS/Hri3F1VJJ
 2cgbzigcjgD1FFxs8iuFU4QSJYpY905pXBKXs7PumwcHwyCCbOr2tLcIMDqqbkJHwm7W
 OY/wxvG8MYV6F0/ygGfrV94k17Tq04+ngUI3kmNaGgMrAB+BvHmQiIoMrL8UQ47WIDLc
 HbsUHl+jyqAkK128CP0oKREgIRQL0mf5zrS45lyHYrnz5h3QUE60Siq/ksEiSLoHHDKJ
 dUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=14M76fSGlvACgnYuGU3A/x3DEJPAcKiBE8JXzhdP/4U=;
 b=ip0WKv8GJZIbjlmaxKjxU/TQh8UWKzgG50UL5fk1YIHtncupSnDaY7gYm/CM28p9wi
 9TU+CvUJXdQl/ewtvfi5wPOEjiGhZTmyQQRmDVCs7JucQMXWRSFjm0YX2c/9hmvB64LK
 3DxB39fZAbxTJza1/MWnhpufsPn7SiWzJW7buJdLZv7JHQj1X2OiqrYvYCLaJctdBfOb
 jYAnqcdFFw860mhwFOC/A8LzxSTZCS1Rzqutb+dezcHvS39vxikCRb2PzCiQvlUC1TLN
 7/cJC9yvjj75r4D0ZxHwgK5hVRh5W2OK4tKkCh/7KBhTWfSBi02o5WQN4maacludkukS
 AEHA==
X-Gm-Message-State: AOAM533Au8X1gtaxs+H6K48Z/3a599EZg/GcwL9j7gAeaE16R2dJFbeM
 4Qlyre7XjRm5srW//Hk9hmyWkg==
X-Google-Smtp-Source: ABdhPJwNNMMmz636sWquZ+PrJBprWwR45xsHh4a4A1+VNHMucrkqN70WbnI4m5X0u5NEISGgHsWDDA==
X-Received: by 2002:a17:90a:1b0d:: with SMTP id
 q13mr23772297pjq.217.1630075794782; 
 Fri, 27 Aug 2021 07:49:54 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id x4sm6940653pff.126.2021.08.27.07.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 07:49:54 -0700 (PDT)
Date: Fri, 27 Aug 2021 14:49:50 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: Re: [PATCH 05/15] perf: Track guest callbacks on a per-CPU basis
Message-ID: <YSj7jq32U8Euf38o@google.com>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-6-seanjc@google.com>
 <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_074955_997712_8D7F5F2B 
X-CRM114-Status: GOOD (  22.72  )
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

On Fri, Aug 27, 2021, Peter Zijlstra wrote:
> On Thu, Aug 26, 2021 at 05:57:08PM -0700, Sean Christopherson wrote:
> > Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
> > the callbacks more precisely and avoid a lurking NULL pointer dereference.
> 
> I'm completely failing to see how per-cpu helps anything here...

It doesn't help until KVM is converted to set the per-cpu pointer in flows that
are protected against preemption, and more specifically when KVM only writes to
the pointer from the owning CPU.  

> > On x86, KVM supports being built as a module and thus can be unloaded.
> > And because the shared callbacks are referenced from IRQ/NMI context,
> > unloading KVM can run concurrently with perf, and thus all of perf's
> > checks for a NULL perf_guest_cbs are flawed as perf_guest_cbs could be
> > nullified between the check and dereference.
> 
> No longer allowing KVM to be a module would be *AWESOME*. I detest how
> much we have to export for KVM :/
> 
> Still, what stops KVM from doing a coherent unreg? Even the
> static_call() proposed in the other patch, unreg can do
> static_call_update() + synchronize_rcu() to ensure everybody sees the
> updated pointer (would require a quick audit to see all users are with
> preempt disabled, but I think your using per-cpu here already imposes
> the same).

Ignoring static call for the moment, I don't see how the unreg side can be safe
using a bare single global pointer.  There is no way for KVM to prevent an NMI
from running in parallel on a different CPU.  If there's a more elegant solution,
especially something that can be backported, e.g. an rcu-protected pointer, I'm
all for it.  I went down the per-cpu path because it allowed for cleanups in KVM,
but similar cleanups can be done without per-cpu perf callbacks.

As for static calls, I certainly have no objection to employing static calls for
the callbacks, but IMO we should not be relying on static call for correctness,
i.e. the existing bug needs to be fixed first.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
