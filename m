Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A91DC3DA79
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbcYUXHk5aybRgPqIpoohhQtLLvKfQQp7X15Ci8a+rI=; b=hT55LSejOcoZIJ
	8K94pu6bheeFcpP0mM+Vwa0J7KlfY7amxx6X+Ti2oUxlZ8Zp0aUSNnuyZWEgHoWQm5fOO2b97jsJ/
	RXsThCrtylzuK4sv+bTDK/24GciQpsaoTzF2SZSzPk+izIDuRSlpcu79VGF83uVvdMEiJ1yp9WCub
	p0i2HMy0jt3NgpXWPT9GD4IBLrZSLIov0h8zXXr7pV6fXhF4NRW6YG7S3Y3VhUeVu5wI0c2e0gP7V
	Fmr3llRN7HhtnLHJsY1NOYMJr/upjCXAbI4+yzi0TcI/EcP7Bhv+cSMUCSzQDBmUCLoviJifEksTE
	5vu7/O0EZOVEN472Wpeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAztH-001xjh-EJ; Thu, 29 Dec 2022 20:52:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAztB-001xfp-In
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 20:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672347150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeG05ASAQvY/FceYSGJdKCGQ3OFwx25lz4jlpRPWbnU=;
	b=QJH//pN0eriMw29BgTFdy3xXOZkd0KsWLZc0RKSSyhIp9aCQ/1/l6acP4s75XKeOi3Q8b6
	/LUt1hGUVVxOba69F3in9Evnw6L0yYqMaNV4LnLOQDGQiB5uBhucyx2x5sNMmL3jRIncOp
	hi7zJCrusT0uso7jtPKm/f8qw9n9L/E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-14-cHQDCbUHM42QoKw3cG7JLA-1; Thu, 29 Dec 2022 15:52:27 -0500
X-MC-Unique: cHQDCbUHM42QoKw3cG7JLA-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640240d400b0047028edd264so13603622edb.20
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 12:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeG05ASAQvY/FceYSGJdKCGQ3OFwx25lz4jlpRPWbnU=;
        b=sq/gy695Pr6ugxfTaKXMebTlY6h51j4qn9UQ4SdbTVpm94mlh8D0iLZTZa1O2T1x/H
         yrEo7mCpc6qY0USAtPiZ/ERItLrwJLBo81xMYkn+tKeIayyZxQjOGXgUdtgQAmIP08GU
         7iIz6QWxa0u9S8bvgMiLUmpjnTDDgRBRHR509eSMjiyanOYXX0preEvLQ84QomFhLiY2
         yoF1ecTKnZOVb1zEtzD4Z+RM2cChmH9au/5UB9gBrwY5hbl5+uQxLNbgHo4DTIP6xFKo
         eqjpuqbkFshERcZBKmwDT2s8d1xIEzTTUW1kbNIhKuc8aYnDrv3dh4tSWzphjJZmaKSU
         X1UQ==
X-Gm-Message-State: AFqh2kpVsMJd4yVkQY+nZ2/a7I93NB0bItR3zbqAIqNWbho3Wd6r31vZ
	3Tl7WwZimYBV/yguyyeaOSbwGR3YkAz3g7z1PvH/c2XZkcMDKvGcIF1HQqyPih9opRIIIwTZAZ1
	mCZDYCY2MkgzaY3saCeojCwB2v4VH
X-Received: by 2002:a17:907:6f09:b0:7c1:37:6d5e with SMTP id sy9-20020a1709076f0900b007c100376d5emr4872290ejc.2.1672347146350;
        Thu, 29 Dec 2022 12:52:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuAZx8SHyajJmJ++QT23AGJAvs5IxosEfN11APvih7Pbj5KPIpkonmPHiwyMLfqMEbO8Dqn3Q==
X-Received: by 2002:a17:907:6f09:b0:7c1:37:6d5e with SMTP id sy9-20020a1709076f0900b007c100376d5emr4872244ejc.2.1672347146101;
        Thu, 29 Dec 2022 12:52:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312::529? ([2001:b07:6468:f312::529])
        by smtp.googlemail.com with ESMTPSA id 23-20020a170906301700b0084c90164a56sm1096571ejz.29.2022.12.29.12.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 12:52:25 -0800 (PST)
Message-ID: <4d73d1b9-2c28-ab6a-2963-579bcc7a9e67@redhat.com>
Date: Thu, 29 Dec 2022 21:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata
 <isaku.yamahata@intel.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>,
 Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20221227130249.1650197-1-pbonzini@redhat.com>
 <9acea262dec3511e9cf63081506f0bd7@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9acea262dec3511e9cf63081506f0bd7@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_125233_906612_71DE362B 
X-CRM114-Status: GOOD (  11.25  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMjgvMjIgMTI6MjIsIE1hcmMgWnluZ2llciB3cm90ZToKPiAKPj4gUXVldWVkLCB0aGFu
a3MuwqAgSSB3aWxsIGxlYXZlIHRoaXMgaW4ga3ZtL3F1ZXVlIGFmdGVyIHRlc3RpbmcgZXZlcnl0
aGluZwo+PiBlbHNlIGFuZCBtb3ZpbmcgaXQgdG8ga3ZtL25leHQ7IHRoaXMgd2F5LCB3ZSBjYW4g
d2FpdCBmb3IgdGVzdCByZXN1bHRzCj4+IG9uIG90aGVyIGFyY2hpdGVjdHVyZXMuCj4gCj4gQ2Fu
IHlvdSBwbGVhc2UgbWFrZSB0aGlzIGEgdG9waWMgYnJhbmNoLCBhbmQgaWYgcG9zc2libGUgYmFz
ZWQKPiBvbiBhIHJlbGVhc2VkIC1yYz8gSXQgd291bGQgbWFrZSBpdCBhIGxvdCBlYXNpZXIgZm9y
IGV2ZXJ5b25lLgoKVGhpcyBpcyBub3cgcmVmcy9oZWFkcy9rdm0taHctZW5hYmxlLXJlZmFjdG9y
IGluIApodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vdmlydC9rdm0va3ZtLmdpdC4KClRo
ZSBjb21taXRzIGZvciB0aGlzIHNlcmllcyBzdGFydCBhdCBoYXNoIGZjNDcxZTgzMTAxNi4KClBh
b2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
