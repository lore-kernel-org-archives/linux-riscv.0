Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF02C3DA7C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 11:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyYdbz1ZidATmbAtJYSkUS1pY8BKnEe43NVmYRGRf04=; b=wr+6osi0CquFhn
	DCYpuPZhgeZJ8R+BhVRpFF/52iXy8NN4IIPe3M/HY3HzAs6O4Of4o6vezcKNLjhX2stTL21ZFyOKR
	nQdjY/AUkIBlEODLmehbPoZ/9Q9H9SbXrC4ePIYYOQjx3fjm+c1Z9XSnusuWf76a0fKjuRYyxZTiC
	/9pmMu78egAI5iREAHfkEm53JmlAA4vKxu3qZQPDCbdp6pJKXc7I7JBt0Pyt4nyVwWYBeFfciPw8S
	Oy6vGJxBR4f/HUfSIslq0quwDV3BWUT/Jv+92dHmjSCLS8E7jUewooqrcJQ4sckZ6RqbjfIB70cdl
	1JPhiVWuKGYLKheTdipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAV5J-004bMM-SK; Wed, 28 Dec 2022 11:59:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAV54-004bEg-6t
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 11:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672228721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KYdiyUW7v3jDVb1QwzZWNab9jTsMpMxmysun3BoXT8E=;
	b=BUmrbtzLHXKgoS2cqq0PXGvKWAC5e997bHYtEwEZOPPY6zk7DsT/+SPsXE6A6fPtiiXYhA
	uyHReXcNu9XqL42bARoWjCMgaenQqa8jNDHYzG9cijSu0VK/eSeq7ZmFHbXk8Cha1R6yly
	zEs0Zs6zSvzH6xkrIgVz+EL76A54CIw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-vMnXM29QO4iXedAEbsF31g-1; Wed, 28 Dec 2022 06:58:39 -0500
X-MC-Unique: vMnXM29QO4iXedAEbsF31g-1
Received: by mail-ed1-f72.google.com with SMTP id y20-20020a056402271400b0046c9a6ec30fso10948136edd.14
        for <linux-riscv@lists.infradead.org>; Wed, 28 Dec 2022 03:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYdiyUW7v3jDVb1QwzZWNab9jTsMpMxmysun3BoXT8E=;
        b=OXLdzJFeOpqlrpGFb6oZfT2TRAHfucbMiqAG4cmzhT4NHz37b2UPXNKqwNasM2rGh2
         kHsezjyBuI8uDtRZmxxwyXn1dc+JC//dPOut3zLncY+pq2My95IpdxMRZGBzQOJmhmD4
         isTvIOLUwjOR9Kp/BJaL4v+mT9bHkLDVzGSScr6CVpr3/X4B7ot2naJu+1isMwLHKYzI
         Z3GOSGFajM0Km+QgLKq5zuLsPJsxyAO3ZU69gyBEmxFbTgeNJH4PyIK5HEtuTmX33wo8
         iTgJQx6TRuJgsgH+5YleE+S3DBVhLd9DbDX3E+kyd2L9AdoEWkjRD6ClE3Z4c50a1J9h
         c5sw==
X-Gm-Message-State: AFqh2kqiK63DsWNU+s/43LDj1J49sU1ktsoVSpyftSSSDS6zWaAsb6EZ
	hz+3+MRjotU/wKvnW/+9CQiS9DBSRNFqxylybz60g4LIi1R58bIUl4hNlOak7YdKtOe6/N8HWjf
	3BFCc0SCmc7oJNN8F0jzf8jD43Xnz
X-Received: by 2002:aa7:de15:0:b0:483:30d7:f9ac with SMTP id h21-20020aa7de15000000b0048330d7f9acmr12028253edv.19.1672228718727;
        Wed, 28 Dec 2022 03:58:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtrIO5srJBbY8oizuyf5Q39Hr1tveD2PqIx/4KuqYlJNhV9zI7izo96N6ps5dxKil3bsWjXNA==
X-Received: by 2002:aa7:de15:0:b0:483:30d7:f9ac with SMTP id h21-20020aa7de15000000b0048330d7f9acmr12028204edv.19.1672228718422;
        Wed, 28 Dec 2022 03:58:38 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id h25-20020aa7de19000000b00463b9d47e1fsm7031261edv.71.2022.12.28.03.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 03:58:37 -0800 (PST)
Message-ID: <55a31d67-b9d0-1a62-1c60-f86b48a34a8b@redhat.com>
Date: Wed, 28 Dec 2022 12:58:33 +0100
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
X-CRM114-CacheID: sfid-20221228_035846_358491_DFAA2225 
X-CRM114-Status: GOOD (  10.79  )
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
IGV2ZXJ5b25lLgoKWWVzLCBJIHdpbGwgKGl0IHdpbGwgYmUgYmFzZWQgb24gNi4yLXJjMSArIHB1
bGwgcmVxdWVzdCBmb3IgcmMyIHRoYXQgSSdtIApwcmVwYXJpbmcgKyB4ODYgY2hhbmdlcyB0aGF0
IHRoaXMgY29uZmxpY3RzIHdpdGgpLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
