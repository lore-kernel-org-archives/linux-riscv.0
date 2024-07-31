Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B3C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 10:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPN5gOQ4jB5YBHXUnFfoS/hS6o4648PGoa3CPsO9b3o=; b=fN7JK6Qzo1CXDB
	NwI1NPe1RTdvBZdKDso5vS+HMDb3kz/iV1RmL3oufTYzFRLXmCbIQkMkDC/Lbz1K5LoETRXm4EGH7
	7qLU0wAhRldRshuSk9ipyJU5CJCnhwAuFsMzcukkgBXda5jMf2JkFccDWW1uhQOfcXPDzA1IWvqHW
	u/cIMWzcJ6ZW9HkxX52vxzJx1hDp8gGAFky8YcvdABYYhNSIObuvzWyNORwcbG1aujDDy0uFeJs0S
	BHo1kvZtO3qm0u2mKQhe+VnqbCMzmOj6YcMx/sMmU+J1gxroHrlWeKY7RFIwlKuD1JYbSJwnCUPBx
	ujrvSMfuF+Knw6D8KDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6JF-00000000gDy-2u5b;
	Wed, 31 Jul 2024 10:11:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6Il-00000000g3t-3x6J
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 10:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722420682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tVOY32nDLXc6iJSQkl0LgklBYr2OAHTjSvree4scyEk=;
	b=VniCP4ZNwErRrbyjKp30rItzUtd28UUNLiAhX7U5EYvz08PSwqBimcIBmQWiUJ6nyb1UXa
	hsN13xib7/B3LF4osYsx/q680kVrJC4WaXDTZ+hUszrLSNyC6FUuwIOY9Ft2/BY7+9FWum
	qJCFId/1lxXoJmI58Yv11VVu6SmeZtM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-A8BrCx0LN2SG5F_xWbvdcg-1; Wed, 31 Jul 2024 06:11:21 -0400
X-MC-Unique: A8BrCx0LN2SG5F_xWbvdcg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5a45054aa03so2097812a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 03:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722420680; x=1723025480;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVOY32nDLXc6iJSQkl0LgklBYr2OAHTjSvree4scyEk=;
        b=rFQVYR0pGs+48aRo3YgaWkIlNhp48seX7n6ULCJETUeu5pgTZ3ERPJlW5RZcd/krKy
         2NRFDiqX0jL2fZtPotgWz2UggQOOFgUZheI9lJQcwnZ5gbhTXTlS05zhMReUpBjwbhQT
         WrxqFcvSdH2QgV5pICsxwltDHDxNbHbroB2Fo9FwMVUSnFADA+uO20RlnQMR2jQ/bFfR
         UNJQtUx67IHtv0yTkjYcDPVl0BasUn/PoQlQZZIX1XCQr1BnfCtfC9ZnKf3hv02xgSOg
         1yubDucsETmqJhjiCZgz2zb/KG8rF0Uv38UZn8jYjtzK5tS/s1WiGaAaR/ip21XJsBZx
         vB4w==
X-Forwarded-Encrypted: i=1; AJvYcCWWP17pt0JcaQ8S7nY486gA3nv2fQdZnbhGdutTAJFwhVI76J82WAxoP4Ni2CKgNWwMf43udqeVATjTkQvd2FvDQsuTlKa+axXzA6r9Hxhc
X-Gm-Message-State: AOJu0Yxb8ISMtSZHQGhcCI145S1pCBuMZlddChGR9eQC1hXXNpQKUdcl
	UXPLMapJCEjiYlY/e3qW8wjE4xUn1NZuVO9nALBVRPLg48fG5j3Hkq2CJmvrZ0pDrmClguunDos
	D9cbOKUpblQsRm7nyj7I05DIy93FziMsVclrokY3N/70t9OcoJVqvma2IFMGsOKTWMw==
X-Received: by 2002:a05:6402:1e93:b0:5a2:97d7:c728 with SMTP id 4fb4d7f45d1cf-5b01d84be21mr14060530a12.0.1722420680270;
        Wed, 31 Jul 2024 03:11:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ltltaZS4FNkIqSYTQjIEvClgTY8vCephyRSRLNCT8UhCNDO85YiJ57LsvbZOjsbL8Hv0Cg==
X-Received: by 2002:a05:6402:1e93:b0:5a2:97d7:c728 with SMTP id 4fb4d7f45d1cf-5b01d84be21mr14060501a12.0.1722420679761;
        Wed, 31 Jul 2024 03:11:19 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5af3ad32a9bsm7111674a12.53.2024.07.31.03.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 03:11:19 -0700 (PDT)
Message-ID: <a0418ced-260b-4b14-9124-c94ce46a0944@redhat.com>
Date: Wed, 31 Jul 2024 12:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-35-seanjc@google.com>
 <63c41e25-2523-4397-96b4-557394281443@redhat.com>
 <ZqlJxJyOdsR206Zc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZqlJxJyOdsR206Zc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_031124_091511_A7AEF1D4 
X-CRM114-Status: GOOD (  20.24  )
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

On 7/30/24 22:15, Sean Christopherson wrote:
> On Tue, Jul 30, 2024, Paolo Bonzini wrote:
>> On 7/27/24 01:51, Sean Christopherson wrote:
>>> Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
>>> gfn=>pfn mapping without the caller getting a reference to any underlying
>>> page.  The API will be used in flows that want to know if a gfn points at
>>> a valid pfn, but don't actually need to do anything with the pfn.
>>
>> Can you rename the function kvm_gfn_has_pfn(), or kvm_gfn_can_be_mapped(),
>> and make it return a bool?
> 
> Heh, sure.  I initially planned on having it return a bool, but I couldn't figure
> out a name, mainly because the kernel's pfn_valid() makes things like
> kvm_gfn_has_valid_pfn() confusing/misleading :-(
> 
>> (As an aside, I wonder if reexecute_instruction() could just use
>> kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of going
>> all the way to a pfn.  But it's ok to be more restrictive).
> 
> Heh #2, I wondered the same thing.  I think it would work?  Verifying that there's
> a usable pfn also protects against retrying an access that hit -EHWPOISON, but I'm
> prety sure that would require a rare race, and I don't think it could result in
> the guest being put into an infinite loop.

Indeed, and even the check in kvm_alloc_apic_access_page() is totally 
useless.  The page can go away at any time between the call and 
vmx_set_apic_access_page_addr() or, for AMD, the #NPF on 
APIC_DEFAULT_PHYS_BASE.

Yes, it's verifying that the system isn't under extreme memory pressure, 
but in practice a 4K get_user_pages is never going to fail, it's just 
going to cause something else to be swapped.  I'd just get rid of both 
of them, so there's no need for kvm_lookup_pfn().

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
