Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C324EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD7A60720
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AD7A60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0/tgo9oZ0R4ubCZGy07lZphxuWyfh/LNNMqSJo6L2o=; b=OTV2QBeTTiJFQG
	op4qx3a5yLsaM618LRz3QLgbZPDchZwfmy4HTv1I+UsvIYuLM3/AIbHnxJYRZALDChTNbYeuxRDYJ
	CTFw/xzeORGxkebjGKswKpVTKs1oEoolx/ZwcS7+mn0fZfBRtAXv6ff+XTR1P7DIniqXqK4Bq2125
	0aGB4pSY7f7S4hzJjbEBV5h1Mk8GWXqhtyoZuu1H+Ctn3H0fUyrEuCxlEtEqQjKTgRaD6NjxDF8Se
	ReoSgjF/n3Vkwk5p2ouybZMnCnb2JRUtVxW2OiVoTCbDTEyl6XT7YUS6Mg9WQBQaNFQP00TlwgtsE
	KzdLwc2Vldx4jQ+GqxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf141-00GiRJ-Ki; Mon, 25 Oct 2021 14:35:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf13y-00GiQ0-5J
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635172497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyRr+oxbdq+D1XVZyshzBJhdWV6eJMpRCL2oDxsSBbM=;
 b=SQBkGLBaOxog2hLaf6YXCS+UY/ndEWjokIqxk8Ws8KqvyTEE0Co3Z7LtBTIp697U1HlcgV
 DbTijGyr0ZSgkptCt4zGUrPXkUOcf8Ijn+i1BCLw8Bp7+I2iJW+Lhv0qI9q2PEV85OkVUT
 aMLTaFhNymZBkzU0xhx83l44CfHd3SE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-WKlQVSmUP_K_gcCq2_cwEw-1; Mon, 25 Oct 2021 10:34:56 -0400
X-MC-Unique: WKlQVSmUP_K_gcCq2_cwEw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so10158363edx.3
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gyRr+oxbdq+D1XVZyshzBJhdWV6eJMpRCL2oDxsSBbM=;
 b=CIDlaDt6EQtKSQCQUl8hs5TES3s2kebzgQlcjh8q4g6iXfWvVnKCe9ck4l/HfTgScz
 3h2Mk48dapSSe9/wDJQuWFTqNGJB5jMHjut60Y47AEqx9eitZwWQQwVMULI6jgds68uO
 yOIdbDv3c9A6twRWJuCIhA1NmMwycCniF3vdou4CCk0rUmhl7VSCfiGAQnqTyeNGHAW8
 VVEVWyXE9wd/hMBq0VKRQ3MIEi6bD0CiJdgqVLAI3IVbpJkJfRuBLNhICuf6qQKJF8FB
 YQw7TluluA8le/vlRl4UF7EnbMdxd0I/xDAS/POYO8yftcAM5jvOlE0PA9OMD66yjh5o
 ctcw==
X-Gm-Message-State: AOAM532VKa0HOjZVKSS3RYxnGqmxOwVrMCBrluXka/6bhZgEnc1NiA8Q
 VtaPr/4ASJ4ALmG8eAFFBmyqWkY8UBXHU4shqVJhBz50sxUyYgvA4fpZM9H1XG20TuuAUIYrWI+
 INhLIlZd6c3JXWbNhOtcoPESSS3D6
X-Received: by 2002:a05:6402:5112:: with SMTP id
 m18mr26543462edd.101.1635172494815; 
 Mon, 25 Oct 2021 07:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1PVpqtFTaT+fZx+ngmF47w1xHlBRHe6pB6EMZ006WM53WXRFnHCfF7AOxx4PQB6o6e4saOQ==
X-Received: by 2002:a05:6402:5112:: with SMTP id
 m18mr26543421edd.101.1635172494578; 
 Mon, 25 Oct 2021 07:34:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m15sm10124432edd.5.2021.10.25.07.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:34:53 -0700 (PDT)
Message-ID: <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
Date: Mon, 25 Oct 2021 16:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>,
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
 <20211009021236.4122790-40-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-40-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_073458_316231_94CD5B4C 
X-CRM114-Status: GOOD (  12.01  )
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

On 09/10/21 04:12, Sean Christopherson wrote:
> +		/*
> +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
> +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
> +		 * is guaranteed to see the event request if triggering a posted
> +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.

This explanation doesn't make much sense to me.  This is just the usual 
request/kick pattern explained in 
Documentation/virt/kvm/vcpu-requests.rst; except that we don't bother 
with a "kick" out of guest mode because the entry always goes through 
kvm_check_request (in the nVMX case) or sync_pir_to_irr (if non-nested) 
and completes the delivery itself.

In other word, it is a similar idea as patch 43/43.

What this smp_wmb() pair with, is the smp_mb__after_atomic in 
kvm_check_request(KVM_REQ_EVENT, vcpu).  Setting the interrupt in the 
PIR orders before kvm_make_request in this thread, and orders after 
kvm_make_request in the vCPU thread.

Here, instead:

> +	/*
> +	 * The implied barrier in pi_test_and_set_on() pairs with the smp_mb_*()
> +	 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU is
> +	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
> +	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> +	 */
>  	if (vcpu != kvm_get_running_vcpu() &&
>  	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
> -		kvm_vcpu_kick(vcpu);
> +		kvm_vcpu_wake_up(vcpu);
>  

it pairs with the smp_mb__after_atomic in vmx_sync_pir_to_irr().  As 
explained again in vcpu-requests.rst, the ON bit has the same function 
as vcpu->request in the previous case.

Paolo

> +		 */
>   		kvm_make_request(KVM_REQ_EVENT, vcpu);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
