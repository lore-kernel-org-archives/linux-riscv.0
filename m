Return-Path: <SRS0=hxmM=NT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC619C432BE
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 19:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD10606A5
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 19:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AD10606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7rNKmTdTs5zGsgENl2V6tMT1aBxY/Hm0JHjxWLRdjI=; b=TR395tRrFhtXs4
	TNV0EmgGDUymMXjFadZgHyTGt6Js1+Ym17nyGM6/UAhjmSM3V/dnPYMtuTZKjnNYHzl75jgc5BNw5
	0OLUi939ysDSSqIn5gUBqKbtmfMVLbvswreGu/Fb4Yoqd7Qgc/7s/bua+kPNROs0Fv0U5XbN+CZb1
	VDn4UCWMRbaR5hp66QaPTYcMtxHLGOKM0sYxGleJy1HIZPUXduxvNZv05m5Y3gJtb4HlVkR8/q8lA
	8ezdEIR5GPQl6hMWockAghPplOpx0iXK3l52kWxonRDrmKNYK+alwFKro9WC9cVo3e46BcRd6lVW2
	oHVTNIGHrQ1Oxjt2ozaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK4K7-00EdnG-Bh; Sat, 28 Aug 2021 19:49:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK4Jv-00Edm2-Mq; Sat, 28 Aug 2021 19:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EvpUBX0kQkaSDPnQxMYWZGVN6zhrAsMhEqKxCVzwc4o=; b=pllg0gE0w02xyjMldZ9HnPVzqu
 ta11OtXd1Bso4ilrEuT55ps2xPl2CjYBACyXlwdXXUeIjxslwwfUq6OAyrihSvrjzRr3JtkoSpE8r
 nxY3yx+Fd/3UG041LWAE2YseMLAeONAzBfACBCXTK1UhZW2z6qWvQfm+cZtswlyfd2HomsjEMhaGO
 AlA/8iv9N9xdUC/3HvjDZZKrjX+uYcxwdDOcFci5wDFWFUa+LVkIxA0cauQXcKJeC0qgJePnlirYy
 P7fXACdPsEL7EzZFzKGU7caOwmwQc2FcxEl7F6m9RiEDfUUOmMpAmYquJxamu8c1pYg7LLIf/dgFH
 3zfeLNxg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK4J0-00Fo0r-RS; Sat, 28 Aug 2021 19:48:02 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1F90798679D; Sat, 28 Aug 2021 21:47:52 +0200 (CEST)
Date: Sat, 28 Aug 2021 21:47:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
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
Subject: Re: [PATCH v2 05/13] perf: Force architectures to opt-in to guest
 callbacks
Message-ID: <20210828194752.GC4353@worktop.programming.kicks-ass.net>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828003558.713983-6-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828003558.713983-6-seanjc@google.com>
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

On Fri, Aug 27, 2021 at 05:35:50PM -0700, Sean Christopherson wrote:
> diff --git a/init/Kconfig b/init/Kconfig
> index 55f9f7738ebb..9ef51ae53977 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1776,6 +1776,9 @@ config HAVE_PERF_EVENTS
>  	help
>  	  See tools/perf/design.txt for details.
>  
> +config HAVE_GUEST_PERF_EVENTS
> +	bool
	depends on HAVE_KVM

?

> +
>  config PERF_USE_VMALLOC
>  	bool
>  	help

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
