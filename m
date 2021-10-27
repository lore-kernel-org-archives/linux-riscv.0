Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E23FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 22:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C5FE60E75
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 22:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C5FE60E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmSkob7EcEGXD0/0vnTxDNFFs5QHhgbjwC4CJGNPrk8=; b=juP1wXX0hH7bKR
	WZ1bqLQ0IcoNHLtpF7yvR+iYO6uud/zZRX0hdXPGLiMWOYuKyDO57CAgBoAdhG34Z97gmLuYDU6Qs
	Kk/PDcHQ0U6fPil4o2DHL59d/gFjV7tOeBDj8AzqAfjn4OuY599IbpdR1FgOtBtSXW0zKi2oAC9RZ
	CFQHiAAq9tnBr2EA+xD1Z9itbSsZsdfD1S5Y5VWiOfQe3r9ynZHUAs4yKnBqklhEZVvrHohPkkIas
	T9ymgvjVKLx85iahL5jmHIk93bd5ZnPdpC+9mJI8wNYwECjiT6xfnXffZ9YMm0w37xRZU0cgG6WRW
	8c9D01qXSeK9yqepFpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfr7U-006NNN-60; Wed, 27 Oct 2021 22:10:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfr7E-006NKB-Eo
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 22:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635372586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPTDsq9RY16fTCCoMhEcqKhkYxR/hT5AGgzHMhJ6ojY=;
 b=IAMcVO2ZcNaowSZesQXSUgOlxjCPhD3/D2HXDPcFh1EopPVgQ9wn/KzZ5ozVodm9vqYUFk
 TLB0aam8jfFrNaskFFG31AK/zseq6GosXpGUChclsiesCnNx+uv9OssMo6XO+h+p4p+Dyi
 8CR1nGCKg1wkY2PNBXQg3WXk38p5uNQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-U1HHjXwmPRScZwNrXBh2yA-1; Wed, 27 Oct 2021 18:09:45 -0400
X-MC-Unique: U1HHjXwmPRScZwNrXBh2yA-1
Received: by mail-ed1-f70.google.com with SMTP id
 g6-20020a056402424600b003dd2b85563bso3656251edb.7
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 15:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vPTDsq9RY16fTCCoMhEcqKhkYxR/hT5AGgzHMhJ6ojY=;
 b=VzH79m4/XBIGyudo/bcbuoA5LdcsiAKUQnQ/1xLoeOfvIeDv7Wms9Au9ZTiZ1uvMNM
 PgoG6TEmOnbwuwL0Rb+VtKFq4MnNAlzFm+jJQmeIxqO+M6SpVWRAEX0vMVxqfpINrw/Q
 gmHG715g7h8wyMPe7ohRxPESn92eGQDlZ5q6XfupAQ9QHXZK1iMHh5fzVjjWpDijJcEk
 Fk/ctV9t1qJDGTAys4ZN3NMlFLxOjlzD3uM9GIs1Nef7Dd4vjwJIAC+dgXQL3/L6OPcb
 Hqq6MfvtxP2WXPUjJIKcaIetTrgXjQZE4q4defj4cePdnhDFNnccQmQJg31/cnykQgDN
 LGJg==
X-Gm-Message-State: AOAM533rNiPYK4NEU6qjs1KhV17m6hvBjS7exXyi+JQU+QXKRBGsEQRG
 XpFt3SrEvtMjxL83h5P+Kg+H+KNeRJpneM4+uXSgcezLCsK58zwugMB4o+mosiBah+biSt+MyBw
 q5UHzK6zqanupWWXhJKKyMWKPo3Mq
X-Received: by 2002:a17:906:3f95:: with SMTP id
 b21mr341867ejj.368.1635372584308; 
 Wed, 27 Oct 2021 15:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoBx4vKjR30o+Kgjfdb4KsDUE6yjTUINxxdU8F5+6sRGk01DyvRy4bEl13EnJPgWSCV29mNQ==
X-Received: by 2002:a17:906:3f95:: with SMTP id
 b21mr341810ejj.368.1635372584078; 
 Wed, 27 Oct 2021 15:09:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a9sm675279edm.31.2021.10.27.15.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 15:09:43 -0700 (PDT)
Message-ID: <fdf90c2f-81c8-513b-2e06-a90959f4cd89@redhat.com>
Date: Thu, 28 Oct 2021 00:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
To: Sean Christopherson <seanjc@google.com>
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
 <20211009021236.4122790-40-seanjc@google.com>
 <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
 <YXl4mK7CyUBnPaQV@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXl4mK7CyUBnPaQV@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_150948_644651_71DFFC5A 
X-CRM114-Status: GOOD (  10.38  )
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

On 27/10/21 18:04, Sean Christopherson wrote:
>>> +		/*
>>> +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
>>> +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
>>> +		 * is guaranteed to see the event request if triggering a posted
>>> +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
>>
>> What this smp_wmb() pair with, is the smp_mb__after_atomic in
>> kvm_check_request(KVM_REQ_EVENT, vcpu).
>
> I don't think that's correct.  There is no kvm_check_request() in the relevant path.
> kvm_vcpu_exit_request() uses kvm_request_pending(), which is just a READ_ONCE()
> without a barrier.

Ok, we are talking about two different set of barriers.  This is mine:

- smp_wmb() in kvm_make_request() pairs with the smp_mb__after_atomic() in
kvm_check_request(); it ensures that everything before the request
(in this case, pi_pending = true) is seen by inject_pending_event.

- pi_test_and_set_on() orders the write to ON after the write to PIR,
pairing with vmx_sync_pir_to_irr and ensuring that the bit in the PIR is
seen.

And this is yours:

- pi_test_and_set_on() _also_ orders the write to ON before the read of
vcpu->mode, pairing with vcpu_enter_guest()

- kvm_make_request() however does _not_ order the write to
vcpu->requests before the read of vcpu->mode, even though it's needed.
Usually that's handled by kvm_vcpu_exiting_guest_mode(), but in this case
vcpu->mode is read in kvm_vcpu_trigger_posted_interrupt.

So vmx_deliver_nested_posted_interrupt() is missing a smp_mb__after_atomic().
It's documentation only for x86, but still easily done in v3.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
