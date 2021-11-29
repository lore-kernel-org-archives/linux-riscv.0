Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42539C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esqNsUhqT9iMQ+hpOXMdPXJYEQZ3z2BYBKnJDejQ93c=; b=BBs6obEAVVvlaG
	eCsDbvtwpAIZwjbxZoeBDdl5Pju1Yac79KjdLN+e3/KNNWEeH+6In+ukB/yYesnt5RoUladrDqTah
	IoTAKezBWMFL+yP6xd6V+ztpBVS20bisnuLXrn4LfZHdho1wNOdWBPbgvkhlSWobJlsJScPd9Jgcb
	5TpHbtdfqj29zkEE5Ug7KOWeIxdm2Mq2q5oeww9qLeKhPVagaDMMYm5aJ1Je4a4Fe60SCEudYYRAk
	3saP+e5nd6lpETHsN0FGn+p/E+LJ9l3XhUds2zZeTTZ//9mIkzh6gHOuoUDC9lBGWJwZYiFFpw/M+
	b+uLrdg+1ILc5eoYIIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrkr3-001euA-Nf; Mon, 29 Nov 2021 17:54:17 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrkqj-001enN-Jl; Mon, 29 Nov 2021 17:53:58 +0000
Received: by mail-ed1-x533.google.com with SMTP id r11so75534086edd.9;
 Mon, 29 Nov 2021 09:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1y5DEAA90y8cYxRCLd33wqhLVpAEzLmdNKss0/RInBo=;
 b=E58dL1Cy0ML/Fq7U+4vMD/XpyhySESNFxGtsJEr0iGA5QuLlhcOX/A4/jdDRZEzDIQ
 fPsLvJxXz3PX63V9su/FgauAMqwxco+y+olI1dCd3mpfxLlYlBPlhWOjrxeLq9guNxSM
 eEfi9IneXptokJh8diXl/ugbj5GCH/6ELhKn4aofNdddGLZ+OqUWg1z9TxLUnKXffmNg
 lUaqpY0k7AwGkJ3OL2ZtKNoHyBmTZ4KtwmtpxoPlTCt2JnQOPjXQ7vH4M7rfgBjlRgND
 uViwUXN3LorpSW+ON86lkQL5g7/VvacQD/GzeWK08eJHfKwJKQfnwt7i4lLeeVe5Mvw/
 ad3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1y5DEAA90y8cYxRCLd33wqhLVpAEzLmdNKss0/RInBo=;
 b=vfu4Cd9k4+GzLcR8vil0uS88vqzqNb0IhlbcqRNGz47rNIE+IQic4kH7Z8XFNL55XR
 4N6y/tmeY45kJwM5gABP7zz0Hsv5V2bf1CLqkXr/cTg8Spznr7zCPBiDVfJ+uzgR94+N
 hzQSJ9OXD4RiDAvZTiEFYB9rMVPqIr1SQ55RQweT54aSYtLXxK7O10Jqs4ooAhcrLO2P
 +QGA8ZiXNzEts/i/ia2cHJK1bhsxa09VKjf58yp2CahDShNfts8eDx41OLolo7YEEo66
 rhKTiuA7zSO8bOkrb/q2gEFqMXs4d0BYh5QGK0ZhyXIKeifmpzqLvfo+LvfX3apSvXN1
 SpAQ==
X-Gm-Message-State: AOAM533VGROaEQ3ehp7UPucbAUz4QKE47cBmvHafL0sXg4rT642dAdZN
 uNPKc2EUV76G6F81JmeRbJs=
X-Google-Smtp-Source: ABdhPJyEFZTCnn35jIBM5GkhncH3CSPbL5gmVmWsUh9Tr+ztH5c8bc9QO9Acd3UAKwaA5P3qYhybfg==
X-Received: by 2002:a05:6402:2744:: with SMTP id
 z4mr77472004edd.310.1638208434290; 
 Mon, 29 Nov 2021 09:53:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id gt18sm7974997ejc.46.2021.11.29.09.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 09:53:53 -0800 (PST)
Message-ID: <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
Date: Mon, 29 Nov 2021 18:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YaUNBfJh35WXMV0M@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_095357_694018_D65BB557 
X-CRM114-Status: GOOD (  13.53  )
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

On 11/29/21 18:25, Sean Christopherson wrote:
> If a posted interrupt arrives after KVM has done its final search through the vIRR,
> but before avic_update_iommu_vcpu_affinity() is called, the posted interrupt will
> be set in the vIRR without triggering a host IRQ to wake the vCPU via the GA log.
> 
> I.e. KVM is missing an equivalent to VMX's posted interrupt check for an outstanding
> notification after switching to the wakeup vector.

BTW Maxim reported that it can break even without assigned devices.

> For now, the least awful approach is sadly to keep the vcpu_(un)blocking() hooks.

I agree that the hooks cannot be dropped but the bug is reproducible 
with this patch, where the hooks are still there.

With the hooks in place, you have:

	kvm_vcpu_blocking(vcpu)
	  avic_set_running(vcpu, false)
	    avic_vcpu_put(vcpu)
	      avic_update_iommu_vcpu_affinity()
	      WRITE_ONCE(...) // clear IS_RUNNING bit

	set_current_state()
	  smp_mb()

	kvm_vcpu_check_block()
	  return kvm_arch_vcpu_runnable() || ...
	    return kvm_vcpu_has_events() || ...
	      return kvm_cpu_has_interrupt() || ...
		return kvm_apic_has_interrupt() || ...
		  return apic_has_interrupt_for_ppr()
		    apic_find_highest_irr()
		      scan vIRR

This covers the barrier between the write of is_running and the read of 
vIRR, and the other side should be correct as well.  in particular, 
reads of is_running always come after an atomic write to vIRR, and hence 
after an implicit full memory barrier.  svm_deliver_avic_intr() has an 
smp_mb__after_atomic() after writing IRR; avic_kick_target_vcpus() even 
has an explicit barrier in srcu_read_lock(), between the microcode's 
write to vIRR and its own call to avic_vcpu_is_running().

Still it does seem to be a race that happens when IS_RUNNING=true but 
vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to 
trigger because it moves IS_RUNNING=false later.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
