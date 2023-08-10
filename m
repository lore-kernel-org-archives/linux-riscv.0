Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70586C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6jaNoLhlPI+vjWtWuIUcqOiWgtoMGpt0A2uA8rnY6w=; b=Hj96F1NnqL3JzB
	As+KmAWG6gjXKsvWC+GxQjvKmpbrPge+2XZmXGg7tBnf+8HgmWCyG/zDdZcsWvGec6scbC1B7wDiY
	tdI9l6SCbTyHJDfZE6aPZeq7rjDbKjMW6fSatwZWmrVGOvWsdw6urP4+cUbJ5RukK7KXzH3582anx
	PD/Mj6VV2a8PQ9J8EKMcem19dEL+6PQZ/FHUP/oka6oHy1SQ3RUY5Wy9fqeMJBMGZCbx2YFpEJz9v
	9B6zDR/HOwPVv0ZNfq6LDdiqyuhF/dRF1E8XSbWKpLUUleosBBGBW30vqBMwqu0gN2xDZ0OQULf5j
	oUD/5PEXcd0W+FGJ/32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ak-006vdt-0n;
	Thu, 10 Aug 2023 09:04:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ah-006vbx-2q
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 09:04:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe4b95c371so3535885e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 02:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691658258; x=1692263058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRRGt270hpgqI4zE1zgSatf0+H4Bh/F+VZZfxHZMxJQ=;
        b=oAEb/UVBkppyVSOHobReOPQ5YTJ38GSYmmwnXKvWBacyY35eiBK3BbweF9r2wySUml
         MEcisqaWbMu75RD/yi2+TApQnL2dFNUOP3LxnRpHcOKij/GZo0w0ruS8u+2sRfizq7K0
         RXpbZa5ou88CCBGxGOuZX1JLIdZicfZdY/CT8cY9pTtnS0KjgGk4/lotdDB2sxhQlLsF
         KS8SGcoWUwYCt9WiECBncj/W3XO/pC9wzUYaNE5W9koIsUJNRDyCxnF+WlJ36Zyyu8gs
         E3wn44pqQEnSVjV3WUZmbwDcfSycWhFbxh8XhXu2aO73sGromowt+6Napedljzo4dNil
         4yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658258; x=1692263058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRRGt270hpgqI4zE1zgSatf0+H4Bh/F+VZZfxHZMxJQ=;
        b=O5TJh1bP4AsGJsR4UwSBxc9oFQRdQkdjzKRPw0wT4qpwxGqa0ngKCS+1o1HmAANBix
         0y5lWH4Zst7fiOrp0V04Nw7uSYZCoAbFeYILS7xSHj3upIhnwRALaT+M5XVOS1bRRyL3
         vJjCRoF8c6RCZdMbDobvyuL1oYRoWl49fqcPKe0e3ViEa0IQVs8BUd0dmr6uPk4pVg3F
         K9d3YuAU0QR6x1UmYVs37ca6kDCnUBMFJpZlUr11ol9QK/hoX03PV1vwo/9FHsBSGrh6
         MB8rH4xFgy6ylTvn/6BaX7SfZ6L/QRZAuQTVFMkZ6/y88ZFFFlsK4IHUFT3oTPmW4V1D
         z73g==
X-Gm-Message-State: AOJu0YxzkN+nopNLfjlx27Tc9/EEktq2P+a/aqTW5azc6VKGbPFxEnzE
	v0BHTGkfjTDtcAFswX2+0EDHVg==
X-Google-Smtp-Source: AGHT+IEiyf6YzfxC02ypY0/hlAu3sZVgflth6mGPBaBQxUAqtG6jM0o50UoMEa2Wxjr8BGf/HBWSdg==
X-Received: by 2002:a05:600c:4fc8:b0:3fe:2120:eb7c with SMTP id o8-20020a05600c4fc800b003fe2120eb7cmr1225438wmq.0.1691658258110;
        Thu, 10 Aug 2023 02:04:18 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.65])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003fe2696ccfcsm1464479wmi.23.2023.08.10.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 02:04:17 -0700 (PDT)
Message-ID: <a645ce3e-dd24-8c06-5898-76f78828b608@linaro.org>
Date: Thu, 10 Aug 2023 11:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v8 04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
Content-Language: en-US
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>,
 Colton Lewis <coltonlewis@google.com>, David Matlack <dmatlack@google.com>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Shaoqin Huang <shahuang@redhat.com>
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-5-rananta@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230808231330.3855936-5-rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_020423_920404_328812A9 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

T24gOS84LzIzIDAxOjEzLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+IGt2bV9hcmNo
X2ZsdXNoX3JlbW90ZV90bGJzKCkgb3IgQ09ORklHX0hBVkVfS1ZNX0FSQ0hfVExCX0ZMVVNIX0FM
TAo+IGFyZSB0d28gbWVjaGFuaXNtcyB0byBzb2x2ZSB0aGUgc2FtZSBwcm9ibGVtLCBhbGxvd2lu
Zwo+IGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBjb2RlIHRvIHByb3ZpZGUgYSBub24tSVBJIGltcGxl
bWVudGF0aW9uIG9mCj4gcmVtb3RlIFRMQiBmbHVzaGluZy4KPiAKPiBEcm9wcGluZyBDT05GSUdf
SEFWRV9LVk1fQVJDSF9UTEJfRkxVU0hfQUxMIGFsbG93cyBLVk0gdG8gc3RhbmRhcmRpemUKPiBh
bGwgYXJjaGl0ZWN0dXJlcyBvbiBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIGluc3RlYWQg
b2YKPiBtYWludGFpbmluZyB0d28gbWVjaGFuaXNtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWdo
YXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNo
YW9xaW4gSHVhbmcgPHNoYWh1YW5nQHJlZGhhdC5jb20+Cj4gLS0tCj4gICB2aXJ0L2t2bS9LY29u
ZmlnICAgIHwgMyAtLS0KPiAgIHZpcnQva3ZtL2t2bV9tYWluLmMgfCAyIC0tCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
