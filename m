Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE203EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZTSjh/zbCG+gkHpHxx0R65MTJvXQLbRGDif0eAxyf0=; b=3tRMFn7rEX41CB
	IoXY4EMt3rNdwS1s+rXN0a9THKTehNxUp8xHKEBvN0x8Dl3A+oDoEQySHiQEZv0K5Fg3I6VbSVgwR
	VhdT3uaALPKdLc0yILNzRYWTsAEs8QTxyWs5RLtbHpYe3sWg6/GPmPpEU2usafpddy0OkcOJVSliN
	dFOClW/X1veRisxL4GmogZYJXlhiMfSe+UrUFicqLfNawGsWUpCa3nq6xl5mYGEzd0yTmo+2LBf5T
	PVV9K0GbfciQA4T34drtVPgJ7Tbst9Wy1Kp/5qq1XRqrD381sjJm5ONPdrb1RJ+GyUgtZdeFAXaLh
	sRA5e6Xgd3HDDZ+hpKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJCU-003OWM-1W;
	Mon, 17 Jul 2023 08:03:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJCG-003OST-28
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:03:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so31862845e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580985; x=1692172985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdeNKisayMSQ5sRs+4YAy9k9XF+keSCX7tWfhBgjHBA=;
        b=um1dfAWYF83hCHFDWU9q5X16U0ZkvtAllcHfOYPsPJVj4C/XZqrYon4dhclBWO3wCi
         OU8TnrvH1BCSWKz64AQFwd9kkEj/rhGV1pVCS4QtvkSRIgCiFVLMEdJwk7uaao3Q3EP1
         kKbMkCyGitGdz6FaCwZSwCGBBVuPdN/wMEX1mtah8IlPAejb0iQpAlIC1RrlBQdsIij3
         6BV6QydUZdZGWXOpy7zWgl0nx9rFoclww9ntKxptH1m5vLHUvET5KwFqWgvG0Ex6nEcI
         H3MEfjcK2Ra6FSFOYYsLWX8sRpwnFC9+8D+b5AWUbigWk0r23HEc/XHm3k4zPdhrtKDx
         oXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580985; x=1692172985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdeNKisayMSQ5sRs+4YAy9k9XF+keSCX7tWfhBgjHBA=;
        b=cQwspem1QtwJDsCFbjzzQcbOc0daP5jRJYb1eOOKm6zzmuCA4C43OKFnTNVG0MWtid
         yM1tSnrk/RlHBWXJX3lCMw7wd6z8pjAXHz3NdUR0njcWnSMnSBYDjnNJIv3yuatu4N1K
         7k2xCy2GENkoCocP52JferUKIDsjpFoiNxfkHIyYB0NEYQKNSGtwCTYZu/f6YFXYuolS
         i7eCZNtBMDMErEtZE9SRzqY2avlymmBjgPOO6EhjSZMtSGZBOF2XxZz+hJEhMb68a+lh
         fRv+E8vISpvt/QYXfWrPxYZbaBgTQsnLEv34yEaGb0MIDhrDxVDdqPFBrdyXGrE8u0Fw
         D38A==
X-Gm-Message-State: ABy/qLb6RcjwZOoyn4LxY8wCX1V/8djyUSbqSeMX2i8/VCx1Eu7qIKDW
	8RWziTowYwBU9fmAtabbDIA1lg==
X-Google-Smtp-Source: APBJJlHp2U3lsNaGg3z+QFZ4SFIvM4GFG/+ypv5OlkRYMQGlqT7WeNQn71m1g9Emo2JuD0aRaeXNrg==
X-Received: by 2002:a5d:4389:0:b0:314:11e6:da8a with SMTP id i9-20020a5d4389000000b0031411e6da8amr6847696wrq.1.1689580985136;
        Mon, 17 Jul 2023 01:03:05 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.144.39])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d490e000000b0031423a8f4f7sm18387745wrq.56.2023.07.17.01.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 01:03:04 -0700 (PDT)
Message-ID: <606c6242-3585-0a8d-8257-c185c89e800e@linaro.org>
Date: Mon, 17 Jul 2023 10:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v6 01/11] KVM: Rename kvm_arch_flush_remote_tlb() to
 kvm_arch_flush_remote_tlbs()
Content-Language: en-US
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>,
 David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-2-rananta@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230715005405.3689586-2-rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_010308_723064_DBCACE0A 
X-CRM114-Status: GOOD (  10.20  )
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

T24gMTUvNy8yMyAwMjo1MywgUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSB3cm90ZToKPiBGcm9tOiBE
YXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgo+IAo+IFJlbmFtZSBrdm1fYXJjaF9m
bHVzaF9yZW1vdGVfdGxiKCkgYW5kIHRoZSBhc3NvY2lhdGVkIG1hY3JvCj4gX19LVk1fSEFWRV9B
UkNIX0ZMVVNIX1JFTU9URV9UTEIgdG8ga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoKSBhbmQK
PiBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMgcmVzcGVjdGl2ZWx5Lgo+IAo+IE1h
a2luZyB0aGUgbmFtZSBwbHVyYWwgbWF0Y2hlcyBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoKSBhbmQg
bWFrZXMgaXQgbW9yZQo+IGNsZWFyIHRoYXQgdGhpcyBmdW5jdGlvbiBjYW4gYWZmZWN0IG1vcmUg
dGhhbiBvbmUgcmVtb3RlIFRMQi4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFAZ29vZ2xlLmNv
bT4KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiAtLS0KPiAg
IGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgNCArKy0tCj4gICBhcmNoL21pcHMv
a3ZtL21pcHMuYyAgICAgICAgICAgICB8IDIgKy0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmggIHwgNCArKy0tCj4gICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICB8
IDQgKystLQo+ICAgdmlydC9rdm0va3ZtX21haW4uYyAgICAgICAgICAgICAgfCAyICstCj4gICA1
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKClJldmlld2Vk
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
