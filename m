Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296F6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 11:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E505B611F2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 11:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E505B611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKSrORuh2oiPmBPYYeOAGcYMHlbNTm3zNNyQHWrDkZA=; b=qUk5UMp9q9LdLX
	pycWbPjk4W4KpgCHqEKSntc2I0GKsfU5qjajKCJ9qY8+FiFiDwDu1gmRJDtWnO+VOgzkYYNpxAedJ
	a6n7zgYtHW/SZmXzK9a4nudk0EENmxGsnpLae0rQBPZFgHsl6J1wwb8yem1dZEci4UhEAp4Dkda/P
	ni769ii5Mm7mRN6FnKtnGwzlDLz/Fg41Qv8fxT/7tcSYZKLomx0dEcefB9gcjM8GXCqlVwjPjOh+k
	uG7eT2HDOSpvps5mwtey/0u/etDUyXmDxtptXxJzgy7B7qyzARv4G2FNKsU/EfKmBCQODr9p6RBen
	wUa3A0VsaMhPgM1S1xhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml87W-007mVr-Af; Thu, 11 Nov 2021 11:19:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml87K-007mUk-R5; Thu, 11 Nov 2021 11:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Rwfbmkoas7VebHdsAPeFky9gQjs68+546BvuzLh8KOw=; b=nYW2D8WwDzTJBO/3hqaCnKl+rG
 Juv9WqI4u6yj05w2X63ioSsTn5cEdV6jDA351V4/q9yydOsa7FW1hSEMYTFCpYM+34h+eLD05vIuf
 aJw4KwauVgbsmZhkliH2C6iKJqojPUXuWEPcd38B1dtT88o84f5Sp/oMWfV8h9DaHJOesh+0xGqtP
 n4R4aYuGwPrCobAnDwuTl24Bkv/pjQsvWW5g0gG3sYG1rBE7VdaHTNsjeZ1KJKR5jtxxyS54nzBQU
 j+XeoDvq2JxdCtTPVCSG+YQMQo1n/omY8trwJKb2fdS0v2mWaEEA6whxFBt8nI2ZCCfGYmM487YiO
 s2UIUTPg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml873-002g98-8m; Thu, 11 Nov 2021 11:19:26 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 627DF3000D5;
 Thu, 11 Nov 2021 12:19:22 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 304F0201EC1CF; Thu, 11 Nov 2021 12:19:21 +0100 (CET)
Date: Thu, 11 Nov 2021 12:19:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
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
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v4 00/17] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YYz8OTWtkcFUkvbZ@hirez.programming.kicks-ass.net>
References: <20211111020738.2512932-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
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

On Thu, Nov 11, 2021 at 02:07:21AM +0000, Sean Christopherson wrote:

> Like Xu (1):
>   perf/core: Rework guest callbacks to prepare for static_call support
> 
> Sean Christopherson (16):
>   perf: Protect perf_guest_cbs with RCU
>   KVM: x86: Register perf callbacks after calling vendor's
>     hardware_setup()
>   KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
>     guest
>   perf: Stop pretending that perf can handle multiple guest callbacks
>   perf: Drop dead and useless guest "support" from arm, csky, nds32 and
>     riscv
>   perf: Add wrappers for invoking guest callbacks
>   perf: Force architectures to opt-in to guest callbacks
>   perf/core: Use static_call to optimize perf_guest_info_callbacks
>   KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
>     variable
>   KVM: x86: More precisely identify NMI from guest when handling PMI
>   KVM: Move x86's perf guest info callbacks to generic KVM
>   KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
>   KVM: arm64: Convert to the generic perf callbacks
>   KVM: arm64: Hide kvm_arm_pmu_available behind CONFIG_HW_PERF_EVENTS=y
>   KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c
>   perf: Drop guest callback (un)register stubs

Thanks!, I'll queue them up and push them into tip/perf/core once -rc1
happens.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
