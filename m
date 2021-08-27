Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFBDC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B61D60F92
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B61D60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf0whM7yqT8c6WwyjFyXy5Y8yM0JV0qDDC9j5bz8QDw=; b=lp0CDkP2diubLS
	xtdokfDyy61swa/RiMSMQwyfgZOSUMJCcZjBhcdG0b2eRoJSLh/6IsGa9BkMMYINArZDBMBE7xN82
	ReWOq269yhfv8YKubP42Lq5gfdNpFoGccIA5YVo4EVBjfaeme5QIoLmoaPV1ELaRU/7kRsUt3chqo
	JeCYskMMUPEEF7JTbfEDqnTTqaJCjZUdr1S0m/x2TKnej6lWpwQ4CGtBL2VhW32gvSs17hkOMXkYS
	Jz73iNmEOOBdFZzYf72XSYO0/miwBfvVMOOQiX0kcq823jfh3FG+ZG/cPYW4bpkwMe9awfdO/8uZ0
	5bt8U4xidEk+i5NNoG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJW6c-00BosG-UC; Fri, 27 Aug 2021 07:16:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJW6S-00Bor9-1K; Fri, 27 Aug 2021 07:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZQ3CU43IWogsKyG+uqc1TCqPH8QEEhdztK1oMhkx3lw=; b=UEWQ5QT1Y91/ArLjsjiq9W9wMI
 4duU1mRjJn7JeeiAF847EnVYvfwy4Rfpdir+x9o7riPAQa7etq+VNF8POzrhtbCqJR9z1sDHo+02+
 HbRjsvwxweLsyjOac0MdoWbdd7InTqsNF0dlSuTIm9XrvQy3b/4YvfSEiVegiut0LsQRQ6jPkb8bY
 IfuvY98Og8QSy5GUJ7lJvsT1gSp6DIN+Jh1ydVw5QcNhrxKH4onHt1u2fN6HncmwxCS76O+WauSkn
 5Gg/ot5B8Psq7tBf27BAosAhcGQs4x7CwCAan6H6s6t6hdJz/pw7lyH6HaF3gC9dwlVv0nm5ojf50
 S3+xyWHg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJW5C-00EFBb-NY; Fri, 27 Aug 2021 07:15:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 915013001CD;
 Fri, 27 Aug 2021 09:15:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 708F32C597E4C; Fri, 27 Aug 2021 09:15:17 +0200 (CEST)
Date: Fri, 27 Aug 2021 09:15:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
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
Message-ID: <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-6-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827005718.585190-6-seanjc@google.com>
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

On Thu, Aug 26, 2021 at 05:57:08PM -0700, Sean Christopherson wrote:
> Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
> the callbacks more precisely and avoid a lurking NULL pointer dereference.

I'm completely failing to see how per-cpu helps anything here...

> On x86, KVM supports being built as a module and thus can be unloaded.
> And because the shared callbacks are referenced from IRQ/NMI context,
> unloading KVM can run concurrently with perf, and thus all of perf's
> checks for a NULL perf_guest_cbs are flawed as perf_guest_cbs could be
> nullified between the check and dereference.

No longer allowing KVM to be a module would be *AWESOME*. I detest how
much we have to export for KVM :/

Still, what stops KVM from doing a coherent unreg? Even the
static_call() proposed in the other patch, unreg can do
static_call_update() + synchronize_rcu() to ensure everybody sees the
updated pointer (would require a quick audit to see all users are with
preempt disabled, but I think your using per-cpu here already imposes
the same).



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
