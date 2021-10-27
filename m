Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84856C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 11:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4557F6109E
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 11:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4557F6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYOITfdpL/mbzX/c5LPMy96VI+TEXnVNTMl0W/Z7onU=; b=iSyq3kM7tVtpO8
	e037+U8NsQyDogB03mfBl957N0RDwwgYZ7IvTHB6d2qs185ksEXJlxKRZpshAfVrP6fqV3WOUW0xE
	LCsQgUsjG8B3FG/vXW9wJL/Rsp/H1phBy2WKlKaFlWHcRU0jwPsUTRuKRJB6pdycfPS4iiscfV6Qe
	txVW9DjdnGbUKy8Qtf0JvJyY3G8CCE3UB5q/flz5/rWwqJOny7dlKcr1cA2RXS2Vah+dqq4NYQuKK
	xnOIap4kZIFuykMYjwWbTigI4XQuAdEGxiJidShq8GP3sFasChu3pZTkyTUwnLq97AYuGYZkgiTbh
	nLEZk2FWdps3U2K2qwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfh8K-004iO4-2x; Wed, 27 Oct 2021 11:30:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfh8H-004iMk-GO
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 11:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635334212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6755i8Ev1p/V649+fKWbCguz7hafsCtx6KF7gf1uorY=;
 b=TX/V5o7c9HZn0ZYo1Stbn5UuRW1GQ4TLUWo1UuB7pNERiGnFNu87TCgocVolnSwZws3Ly0
 McB8kWSV8zufJ0S2j5l9cGSYABg9A2udHCTxhp7HgKb+bsB9vhLVkYGONA5Vah5BRrPu9j
 lvJFsPddbHDevsHwOr3pgLk5y/5Y4Gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-SCV0Ypy_PSae9_O3yFoh6Q-1; Wed, 27 Oct 2021 07:30:07 -0400
X-MC-Unique: SCV0Ypy_PSae9_O3yFoh6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14A3100C66D;
 Wed, 27 Oct 2021 11:30:03 +0000 (UTC)
Received: from starship (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A291C101E591;
 Wed, 27 Oct 2021 11:29:47 +0000 (UTC)
Message-ID: <62231cec8a62db6bf2baba24cc55e0ec2515d0b1.camel@redhat.com>
Subject: Re: [PATCH v2 07/43] KVM: Reconcile discrepancies in halt-polling
 stats
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, Anup
 Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng
 Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,  Joerg
 Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu,  linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, Oliver
 Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
Date: Wed, 27 Oct 2021 14:29:46 +0300
In-Reply-To: <20211009021236.4122790-8-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-8-seanjc@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_043013_680939_A0AC0EC6 
X-CRM114-Status: GOOD (  26.28  )
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

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Move the halt-polling "success" and histogram stats update into the
> dedicated helper to fix a discrepancy where the success/fail "time" stats
> consider polling successful so long as the wait is avoided, but the main
> "success" and histogram stats consider polling successful if and only if
> a wake event was detected by the halt-polling loop.
> 
> Move halt_attempted_poll to the helper as well so that all the stats are
> updated in a single location.  While it's a bit odd to update the stat
> well after the fact, practically speaking there's no meaningful advantage
> to updating before polling.
> 
> Note, there is a functional change in addition to the success vs. fail
> change.  The histogram updates previously called ktime_get() instead of
> using "cur".  But that change is desirable as it means all the stats are
> now updated with the same polling time, and avoids the extra ktime_get(),
> which isn't expensive but isn't free either.
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4dfcd736b274..1292c7876d3f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3204,12 +3204,23 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
>  static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
>  					  ktime_t end, bool success)
>  {
> +	struct kvm_vcpu_stat_generic *stats = &vcpu->stat.generic;
>  	u64 poll_ns = ktime_to_ns(ktime_sub(end, start));
>  
> -	if (success)
> -		vcpu->stat.generic.halt_poll_success_ns += poll_ns;
> -	else
> -		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
> +	++vcpu->stat.generic.halt_attempted_poll;
> +
> +	if (success) {
> +		++vcpu->stat.generic.halt_successful_poll;
> +
> +		if (!vcpu_valid_wakeup(vcpu))
> +			++vcpu->stat.generic.halt_poll_invalid;
> +
> +		stats->halt_poll_success_ns += poll_ns;
> +		KVM_STATS_LOG_HIST_UPDATE(stats->halt_poll_success_hist, poll_ns);
> +	} else {
> +		stats->halt_poll_fail_ns += poll_ns;
> +		KVM_STATS_LOG_HIST_UPDATE(stats->halt_poll_fail_hist, poll_ns);
> +	}
>  }
>  
>  /*
> @@ -3230,30 +3241,16 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	if (do_halt_poll) {
>  		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
>  
> -		++vcpu->stat.generic.halt_attempted_poll;
>  		do {
>  			/*
>  			 * This sets KVM_REQ_UNHALT if an interrupt
>  			 * arrives.
>  			 */
> -			if (kvm_vcpu_check_block(vcpu) < 0) {
> -				++vcpu->stat.generic.halt_successful_poll;
> -				if (!vcpu_valid_wakeup(vcpu))
> -					++vcpu->stat.generic.halt_poll_invalid;
> -
> -				KVM_STATS_LOG_HIST_UPDATE(
> -				      vcpu->stat.generic.halt_poll_success_hist,
> -				      ktime_to_ns(ktime_get()) -
> -				      ktime_to_ns(start));
> +			if (kvm_vcpu_check_block(vcpu) < 0)
>  				goto out;
> -			}
>  			cpu_relax();
>  			poll_end = cur = ktime_get();
>  		} while (kvm_vcpu_can_poll(cur, stop));
> -
> -		KVM_STATS_LOG_HIST_UPDATE(
> -				vcpu->stat.generic.halt_poll_fail_hist,
> -				ktime_to_ns(ktime_get()) - ktime_to_ns(start));
>  	}
>  
>  

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
