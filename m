Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06166C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 15:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B7660EE5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 15:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5B7660EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSWLR6CIAlPB9JyG2Cbc+KjPWIGtEWi03T2nZ2FwSEk=; b=PDSkmX7fBV879b
	cD12dP1OO3jAiZ/SUv3m7VFwZBN3a0j3LG961EM9ulF9DAlXkZwnWKRBCRkm/sAv5UfR9crt+f5KQ
	/p48lD9LMLGJQpQX3R/xLSu8mL0vi0ByJ8mqDSk+/CcMw4ZfB/hKjKssWiuuZds3XqD+kFKyJ6gPC
	u8mZlg6RRBXDsJZNvjj2GwlhLKrb5kVD54YKxb6Z1qQSY9lp/LgFJeJr4cnQErW7JAo3DyYOkfMmd
	IGItTOs5yvS8dHy6e77Jb4CIjDd49Svk5aON3p5UfrIe+Tcy8y9Fo1ErttxE4NgXMY02Wpk4OxLfZ
	H8IfhDnmktahGKbNdloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJdgp-00CfsA-5S; Fri, 27 Aug 2021 15:22:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJdgl-00CfqZ-HS
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 15:22:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id 2so5954112pfo.8
 for <linux-riscv@lists.infradead.org>; Fri, 27 Aug 2021 08:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QatDM27fKYA9pWDzVSAqlJ2DDoFQbm13fmaaMfb9ulg=;
 b=LbfQeRJPD2tlThKAHYznAy0sM0IgIfh1wTpRJBZ2a8T56zVu98PuMUUVUbHs4fqFWr
 6+86/kLM/nQLlWQf9dDa+no5hVa+6sXIHhmX9R3rM1SD9hRro8HWA2j/NGyx2O8VrgV+
 oGP6lA9WOmK8FVw2oSIVs+avOR5GJ+s6JTH9S2ut8a2dmjwSmakGT8siao8WSM0rYY/D
 l8AtqZP9IsjFRz1XRX7SFZjz8ry7nluU0QO8loudJxQXIIhTLPgOJCI+sU7b8vw4rsbo
 7ceZSl6gyIwnJ0+ZB+tg2Cex82NuQqvIiek/SOq2xNCKjHmmV/miz2C81kIq6WQooMor
 pjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QatDM27fKYA9pWDzVSAqlJ2DDoFQbm13fmaaMfb9ulg=;
 b=NZJn7Gtbkt65PY33LpcwHzjjEwYA56fpDkMKyBqf4g7rVgv40ApmHn9kQOIybf58bS
 JNiDTBLheoVPe+APRDHjgCYcBV/TGHPa0RLs/qkb6thesTDSPgRhfgrE07bc0TPZMtBd
 FDYtnMWUgsW1nYMqFiXeWjEfjxOx7bydy7wcMAp+iqI0NI0WKOGVEUXetVXj0mA3mEj+
 +XCPqh/p9YgCHbFvOp/GTOJol60+5QBlXGe4JsIfHmH+F94FTDjMJh33NHX7+/xhWJeo
 zLsKCLusy2cufTMLtWTZuyRE7WZVAisN66SFg4D+f5xask87ETLPu2gTq/VNbs2ygd/7
 acPw==
X-Gm-Message-State: AOAM531Svdy7A0c0+WBAp7c4dfDaGjrnvCTtN28uRfs6nPWOZT3zicHq
 ZFLZdj8RDgd9xz94aDJUKaAC2A==
X-Google-Smtp-Source: ABdhPJzEumx17gqrFfS4IgX2tHxkXDWTQYfyqElR8d63vRz/R/VGX/kHlh1uWjTReV2Ta0/ixjnVag==
X-Received: by 2002:a05:6a00:26f6:b0:3ed:834e:153 with SMTP id
 p54-20020a056a0026f600b003ed834e0153mr9605926pfw.53.1630077758383; 
 Fri, 27 Aug 2021 08:22:38 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id q3sm7448697pgf.18.2021.08.27.08.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 08:22:37 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:22:33 +0000
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
Message-ID: <YSkDOWze5dBHkJnA@google.com>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-6-seanjc@google.com>
 <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
 <YSj7jq32U8Euf38o@google.com>
 <YSj9LQfbKxOhxqcP@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSj9LQfbKxOhxqcP@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_082239_646362_4428CEF4 
X-CRM114-Status: GOOD (  28.66  )
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
> On Fri, Aug 27, 2021 at 02:49:50PM +0000, Sean Christopherson wrote:
> > On Fri, Aug 27, 2021, Peter Zijlstra wrote:
> > > On Thu, Aug 26, 2021 at 05:57:08PM -0700, Sean Christopherson wrote:
> > > > Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
> > > > the callbacks more precisely and avoid a lurking NULL pointer dereference.
> > > 
> > > I'm completely failing to see how per-cpu helps anything here...
> > 
> > It doesn't help until KVM is converted to set the per-cpu pointer in flows that
> > are protected against preemption, and more specifically when KVM only writes to
> > the pointer from the owning CPU.  
> 
> So the 'problem' I have with this is that sane (!KVM using) people, will
> still have to suffer that load, whereas with the static_call() we patch
> in an 'xor %rax,%rax' and only have immediate code flow.

Again, I've no objection to the static_call() approach.  I didn't even see the
patch until I had finished testing my series :-/

> > Ignoring static call for the moment, I don't see how the unreg side can be safe
> > using a bare single global pointer.  There is no way for KVM to prevent an NMI
> > from running in parallel on a different CPU.  If there's a more elegant solution,
> > especially something that can be backported, e.g. an rcu-protected pointer, I'm
> > all for it.  I went down the per-cpu path because it allowed for cleanups in KVM,
> > but similar cleanups can be done without per-cpu perf callbacks.
> 
> If all the perf_guest_cbs dereferences are with preemption disabled
> (IRQs disabled, IRQ context, NMI context included), then the sequence:
> 
> 	WRITE_ONCE(perf_guest_cbs, NULL);
> 	synchronize_rcu();
> 
> Ensures that all prior observers of perf_guest_csb will have completed
> and future observes must observe the NULL value.

That alone won't be sufficient, as the read side also needs to ensure it doesn't
reload perf_guest_cbs between NULL checks and dereferences.  But that's easy
enough to solve with a READ_ONCE and maybe a helper to make it more cumbersome
to use perf_guest_cbs directly.

How about this for a series?

  1. Use READ_ONCE/WRITE_ONCE + synchronize_rcu() to fix the underlying bug
  2. Fix KVM PT interrupt handler bug
  3. Kill off perf_guest_cbs usage in architectures that don't need the callbacks
  4. Replace ->is_in_guest()/->is_user_mode() with ->state(), and s/get_guest_ip/get_ip
  5. Implement static_call() support
  6. Cleanups, if there are any
  6..N KVM cleanups, e.g. to eliminate current_vcpu and share x86+arm64 callbacks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
