Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8652BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 07:27:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D4F260FE3
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 07:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D4F260FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSU5DuJYLkkKTGVYZ/fTRUN7Xd4xMj95XcxRkbzZVko=; b=JziS7JiWvetX+d
	PeEazl7haz0RrqCMPszi6fI/qVhCxjAaECM/jz6z7lg2tjp6JfxpQdY39J+QSSM1p3P8y23DTKiPg
	adTSWNrhqg3W5iY0PKQgW5D3r9uNI3i2J6A9EKMCQt4pqaQwM9QAN3lBu1Q9ZHOyUtmg0zhVLSNdp
	e/TCPTd24FMzhvW0X+UD8bFEbQ/y/FCJlGfraJWg1rE3FTGDYNeN2AmUsgYytW5eSmzFIiPNFfdxV
	V+IdZu+yqwjg3UAE2ll3ufxhMvGGFFALmlh+6+A94/YY/E/TbCdpoCflG7TNza+uFK8/jZvlX5DmP
	4VgruybxDMZkFjBXeNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml4UR-007Nwv-F5; Thu, 11 Nov 2021 07:27:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml4UF-007NtU-JZ
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 07:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636615626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKrJW8F5NToX1nYO957BayIs9Dq3P1qwVdj4d8BfHuc=;
 b=QjLv7DwqTsjQ1yr2pA6vcGfb2LecNiowMjmgJAl1BdZHcY1XOBowLjQGpz38H4NIiE0KPD
 K5B5Z9ZkvWskToGKQ9WlayXLeqV47j8XvHFK7caT7/yjYuBntGub49wmnwWkvjhS0tSHK8
 l66VH2zRs4WNLYfZRG0ey2ar3J4EPAg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-XCRIN4LDPUW4XbSjZkffYQ-1; Thu, 11 Nov 2021 02:27:03 -0500
X-MC-Unique: XCRIN4LDPUW4XbSjZkffYQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z1-20020a05640235c100b003e28c89743bso4580333edc.22
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 23:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kKrJW8F5NToX1nYO957BayIs9Dq3P1qwVdj4d8BfHuc=;
 b=Rh6rPhZwxXWVoOLlPAd/JofFGDzhOhYRbFxlgUZCME+z9Xu6IETuzHJS4m+evf/6uN
 QT17sSNQgVPgFfU7FS2E0SAekr0wi6W+sfPu0NJbZmCIKKho+kmsqqJ5E59iC9Ld3zJG
 Yl3sXF4ZcqE5JMpR9D6bqBtvEeQZK3YpKgcT47QKn0N+gSkE980fKf1Qgu+VH2K53IKZ
 klPAZtsT++LjLhwiS+yXr3qC21EauIQ30Qd0VaLdBC2/x9dxwFOkP+a8GYfP5x2EkDIk
 tGN16DPnq+RKnpnn2OQj1vWiX9w5xzATqbLeX5sYwvsOa5Jf1VhOWVVRVpzlk43gIGpL
 9WjQ==
X-Gm-Message-State: AOAM530PZRpEq/wWnXCEOAbK+8L1aUfinYtMxdj35oUYpRIRQ7Kx4j6+
 3BYZXG68X73jdbPs+f85MaUw5ouhw4zrSsSaa44nce7SWjxaJyiDpWAfwRaPrSKy/lbd14S8qhp
 QRc2EcEb4Cws5NRvvNnYglqBqkrur
X-Received: by 2002:a05:6402:4403:: with SMTP id
 y3mr7124357eda.163.1636615622066; 
 Wed, 10 Nov 2021 23:27:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTpHPtJJgKdf3a1EjIi+ncJMYWN6M7NH5BDLr0bfrPMJpGogO5RDb023uvqL0d//3hxKxDnQ==
X-Received: by 2002:a05:6402:4403:: with SMTP id
 y3mr7124294eda.163.1636615621811; 
 Wed, 10 Nov 2021 23:27:01 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r22sm821651ejd.109.2021.11.10.23.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 23:27:01 -0800 (PST)
Message-ID: <d784dc27-72d0-d64f-e1f4-a2b9a5f86dd4@redhat.com>
Date: Thu, 11 Nov 2021 08:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/17] perf: Protect perf_guest_cbs with RCU
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-2-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211111020738.2512932-2-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_232707_749124_90376405 
X-CRM114-Status: GOOD (  25.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/11/21 03:07, Sean Christopherson wrote:
> Protect perf_guest_cbs with RCU to fix multiple possible errors.  Luckily,
> all paths that read perf_guest_cbs already require RCU protection, e.g. to
> protect the callback chains, so only the direct perf_guest_cbs touchpoints
> need to be modified.
> 
> Bug #1 is a simple lack of WRITE_ONCE/READ_ONCE behavior to ensure
> perf_guest_cbs isn't reloaded between a !NULL check and a dereference.
> Fixed via the READ_ONCE() in rcu_dereference().
> 
> Bug #2 is that on weakly-ordered architectures, updates to the callbacks
> themselves are not guaranteed to be visible before the pointer is made
> visible to readers.  Fixed by the smp_store_release() in
> rcu_assign_pointer() when the new pointer is non-NULL.
> 
> Bug #3 is that, because the callbacks are global, it's possible for
> readers to run in parallel with an unregisters, and thus a module
> implementing the callbacks can be unloaded while readers are in flight,
> resulting in a use-after-free.  Fixed by a synchronize_rcu() call when
> unregistering callbacks.
> 
> Bug #1 escaped notice because it's extremely unlikely a compiler will
> reload perf_guest_cbs in this sequence.  perf_guest_cbs does get reloaded
> for future derefs, e.g. for ->is_user_mode(), but the ->is_in_guest()
> guard all but guarantees the consumer will win the race, e.g. to nullify
> perf_guest_cbs, KVM has to completely exit the guest and teardown down
> all VMs before KVM start its module unload / unregister sequence.  This
> also makes it all but impossible to encounter bug #3.
> 
> Bug #2 has not been a problem because all architectures that register
> callbacks are strongly ordered and/or have a static set of callbacks.
> 
> But with help, unloading kvm_intel can trigger bug #1 e.g. wrapping
> perf_guest_cbs with READ_ONCE in perf_misc_flags() while spamming
> kvm_intel module load/unload leads to:
> 
>    BUG: kernel NULL pointer dereference, address: 0000000000000000
>    #PF: supervisor read access in kernel mode
>    #PF: error_code(0x0000) - not-present page
>    PGD 0 P4D 0
>    Oops: 0000 [#1] PREEMPT SMP
>    CPU: 6 PID: 1825 Comm: stress Not tainted 5.14.0-rc2+ #459
>    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
>    RIP: 0010:perf_misc_flags+0x1c/0x70
>    Call Trace:
>     perf_prepare_sample+0x53/0x6b0
>     perf_event_output_forward+0x67/0x160
>     __perf_event_overflow+0x52/0xf0
>     handle_pmi_common+0x207/0x300
>     intel_pmu_handle_irq+0xcf/0x410
>     perf_event_nmi_handler+0x28/0x50
>     nmi_handle+0xc7/0x260
>     default_do_nmi+0x6b/0x170
>     exc_nmi+0x103/0x130
>     asm_exc_nmi+0x76/0xbf
> 
> Fixes: 39447b386c84 ("perf: Enhance perf to allow for guest statistic collection from host")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

One nit:

>   EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
>   
>   int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>   {
> -	perf_guest_cbs = NULL;
> +	if (WARN_ON_ONCE(rcu_access_pointer(perf_guest_cbs) != cbs))
> +		return -EINVAL;
> +
> +	rcu_assign_pointer(perf_guest_cbs, NULL);
> +	synchronize_rcu();
This technically could be RCU_INIT_POINTER but it's not worth a respin.
There are dozens of other occurrences, and if somebody wanted they
could use Coccinelle to fix all of them.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
