Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D10C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E6960F92
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 07:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5E6960F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcCvoAPvVB1nxBB8DyqjMeg5Zg0lE3/VnPlOH1lMSh4=; b=c40+w29P60eh5W
	65HPgcVEp+5durv+TStYN1sOVkFR3ontw4i6DUcht3D4SPpCoDqDsYAuQwQUle/I+RqEwYJC8sQLu
	hdt6UBXYVCGVUIgAA62cCTxQ17LJCplJhSzkc2pJMlHAhMSWxRggX7OmtMTzMnRt4+gW1Zv2r7eY/
	rIOakbazn/GRcu9caWgKOdvoVKtCX62yTpDbIxllrVPe/Hx6arUoRuv3X1vPZaLGnqsZw/dGWYQ7O
	nyeS1Cj0rP6WrhyW9y2NB/PabOq7g/7idOckO891MAgqupxKaEt+fjXUlnNGcR7cz+xDVNmxtI3Gg
	F078YBmV+xx1joTZIxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJWOL-00BrKd-HJ; Fri, 27 Aug 2021 07:35:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWO9-00BrJP-6z; Fri, 27 Aug 2021 07:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=izDnqED+aJquV8WBbT3PBDJAf7VsEW4nw5GoC1n7INc=; b=UOw1aDagqxomBMB4/E9tMZZeGZ
 A/CYxlrxnk/GSFFTbkLbsgVxAuCRJ0uxvjo85Tp7zy3Yucv+ZpTHwn2CnmihrOCVC9Yk2QeIxRvll
 8MnpnhG7WUlGGdapVfBrt4tzxXst/XpS+6PVp1qeaC1d0oim3gjAqiP/J5cmTZJlCyx1iWNeP4Wlf
 Z5XcBWL/yaYx+cHADlH6fZPiBRXj4hqI2YfdR4gAT6GCyITtnmu8zkenZdgkEqz4Y+YyeesKIgXPY
 axH5wRDh5FK6agDysTznL69fRm4hurQ8dCd9r5S54VhnaYDGtyqnIDvt5i5hP/qBNuObffeCu3FEh
 v14rcs9Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWNp-00DRSP-E8; Fri, 27 Aug 2021 07:34:39 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CFD57300DEF;
 Fri, 27 Aug 2021 09:34:35 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B14D22C6670EA; Fri, 27 Aug 2021 09:34:35 +0200 (CEST)
Date: Fri, 27 Aug 2021 09:34:35 +0200
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
Subject: Re: [PATCH 11/15] KVM: x86: Move Intel Processor Trace interrupt
 handler to vmx.c
Message-ID: <YSiVi+jxNpFLE4gn@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-12-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827005718.585190-12-seanjc@google.com>
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

On Thu, Aug 26, 2021 at 05:57:14PM -0700, Sean Christopherson wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 13c4f58a75e5..e0b1c9386926 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5498,6 +5498,7 @@ void kvm_set_intel_pt_intr_handler(void (*handler)(void))
>  {
>  	kvm_guest_cbs.handle_intel_pt_intr = handler;
>  }
> +EXPORT_SYMBOL_GPL(kvm_set_intel_pt_intr_handler);

This is another one of those broken exports.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
