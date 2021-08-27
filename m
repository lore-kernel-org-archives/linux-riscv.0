Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253D2C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 14:57:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC77460524
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 14:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC77460524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyORib2/hntytEKUSK03AX/wX3OmCkiSAV0iVaWO0u0=; b=z6ym+h0zRjdpuK
	SE5JxLzRonOR7XV4SgvjKHAWWYFzEr1Od+fPgimnL0Z/vH+ZQivIGqy6ycfn8xba8AgK18GgP8Mkk
	jBnYG/aNe7clTwvgNYQSzGnyIMNvNpX8SqVFQH15ytIr7dO4xGa3/ox8iUGEuLRmhrspnB0cDdmAD
	jKHpqzQ2FsNTRnZk4kilHrmC14b2JRwYUo3dF2tIHtVai0xgo8ou8aqNwn/nv6ZV9fpGagkV4mjJb
	Gdbhu7h9lRTAwGxacPMA6C8ikxeaba+oiPDGD/KK0CQ9+PuF5pVpodvFV8/h49YjYb9BBbQTCY3NR
	wYGuyDlTQRGmsjcS9vnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJdI7-00Cb22-Lz; Fri, 27 Aug 2021 14:57:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJdHw-00Cb0l-4r; Fri, 27 Aug 2021 14:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NSdJTnTrDORwb+LwDd1YsYwMgPCJRxx0pXYK8FlAauE=; b=Fa7lAXZuZMGlhMkvCLlAaInQ0M
 LvZMAI9dgp92KcFz4u2w541+/Nu67i2Ea3rAZpKD6Q1P9ILjKx8E7vJPC9Yy4BHzufUafcmzb+2zu
 XEqetUQrDWVmWgUJbeWVLi3VrFACkcynBo/GAIrkEDlonwYXZkgrnKNPnvuRXhzSenXsmorxKXv3b
 UaLmP8193HgPXArb5Wp1c/mrxTLlf/21JEFOup9O58miZONiwbcuapmO9GWG87OVfsWhj7CHiSkGX
 N5n6bqMpN0VhS93yWvq33V/48j5w+oHy6eCsh396wVtLrGJfjfA+JtKu/NF0o3UbeTizVS7b6v5Pe
 Ifw0PqQQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJdHk-00DX6q-CH; Fri, 27 Aug 2021 14:56:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 06096300DEF;
 Fri, 27 Aug 2021 16:56:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DA39829CFAC0B; Fri, 27 Aug 2021 16:56:45 +0200 (CEST)
Date: Fri, 27 Aug 2021 16:56:45 +0200
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
Message-ID: <YSj9LQfbKxOhxqcP@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-6-seanjc@google.com>
 <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
 <YSj7jq32U8Euf38o@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSj7jq32U8Euf38o@google.com>
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

On Fri, Aug 27, 2021 at 02:49:50PM +0000, Sean Christopherson wrote:
> On Fri, Aug 27, 2021, Peter Zijlstra wrote:
> > On Thu, Aug 26, 2021 at 05:57:08PM -0700, Sean Christopherson wrote:
> > > Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
> > > the callbacks more precisely and avoid a lurking NULL pointer dereference.
> > 
> > I'm completely failing to see how per-cpu helps anything here...
> 
> It doesn't help until KVM is converted to set the per-cpu pointer in flows that
> are protected against preemption, and more specifically when KVM only writes to
> the pointer from the owning CPU.  

So the 'problem' I have with this is that sane (!KVM using) people, will
still have to suffer that load, whereas with the static_call() we patch
in an 'xor %rax,%rax' and only have immediate code flow.

> Ignoring static call for the moment, I don't see how the unreg side can be safe
> using a bare single global pointer.  There is no way for KVM to prevent an NMI
> from running in parallel on a different CPU.  If there's a more elegant solution,
> especially something that can be backported, e.g. an rcu-protected pointer, I'm
> all for it.  I went down the per-cpu path because it allowed for cleanups in KVM,
> but similar cleanups can be done without per-cpu perf callbacks.

If all the perf_guest_cbs dereferences are with preemption disabled
(IRQs disabled, IRQ context, NMI context included), then the sequence:

	WRITE_ONCE(perf_guest_cbs, NULL);
	synchronize_rcu();

Ensures that all prior observers of perf_guest_csb will have completed
and future observes must observe the NULL value.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
