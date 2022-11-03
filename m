Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0D2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRzLMgmJxOfdian07iP8wHW/TrF00h06XXNbzLeU4lY=; b=RdNaYmFKk82pyS
	Z9fPOSap4Vi8Mp7QY/czC5NvTGBAvbxLW9N1IPpCfL8S/lxoQo0UqoQ/3KL/xs7ZM3uljaDaOpmD2
	NLdJW7tsImZy/FRx+yvUaaIv9hAQHHoUgCbAQqTO2x2aoy0EbMdoHbIKxlRk78tO65UqxF/7utj1H
	p4PBFLDPmO9Bue+1LGhQXxJTLkYUJmv5Fxhwq3usznh6/MzK6WROPdmC+ur1Unb0kHR5WDSo3DmD4
	Vo9dEJTTZqzLi8zFkwlxTZkY1ZXBkiT3ubjlSEbmsbJf5CdCIl/OGe1PzMPCMCNEdRs1Ni9jM09XQ
	Ra8G18P6nJCBwOkVo5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUUX-00GQNW-07; Thu, 03 Nov 2022 07:18:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUUT-00GQLp-UW
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:18:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o4so1299442wrq.6
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/SNnecemsjQs+W90QUlkgsOD/Rjb4+lDkgjOjEDTCQ=;
        b=jw3d99cvMg52Lg1tLW9BuRNFr97hU8VbjiyM8gochZWG1eGvxYgj4JDJfCZnnjS66j
         2lDmaY49Y9gNXV+0NqqYMPompzAvLelDDyxTDyv63Mzv1FpaKJ2B9UYwTxwc6+9E1fj5
         FJhI1fX/X/YYeQJFY71s0y5YmCRlxUG6ujCNUlpLlY/mY+G8+yumC0FbiEGwNFo+LVFU
         bsVfMxNPq9XriX8IesQE+M4MIPqclT9ZI+C/ooGdqt08Ib6SHWOMYVtcjCYmkNt5Y22V
         kEpFY0C9GTT/VRjoVENUsza65QqqGrehKGm4P0CKYdVEVtyKJm9XwB/y8pqmKkigPrlA
         3XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/SNnecemsjQs+W90QUlkgsOD/Rjb4+lDkgjOjEDTCQ=;
        b=tEjCpq3P/mwKl6oWnh6j/YNMFwQQ9w4FqLYInq40T0DQ+E2YGZ0En3jlMuQClVj1zU
         V2RY4P3lSfHRqNKkJWzBQAZfQqFc2Smzvqxn9yaU13MfSm2kQIqVDEr6kMfC0njF/lmM
         VMcx+lxCicdpufQgh4d+ld+f37emj7PMdoDVFulchMp9QT61/IeL/ZOfpnk4eoJqsP/k
         3i7sf+8rlI8JMO+dDO+ljeGyxNBRZmqBouOr0cF2LfH/OCrZwGoRc0ZKQGEzITQaDuYt
         FiA+bLOy4y4YTXwMuolrxwPzr5llI1ZG6+fqu8WKHEfc4OeE6y3o2s9i8V7xP+nMSYhI
         T4dw==
X-Gm-Message-State: ACrzQf0+sLtEveq5Z7z0l3XeYOEI+thrfIJrf2lV37mfbp9LK/wId+lv
	utEsYpO8yADkJYIQKt9TCly4TEz6XZX7gg==
X-Google-Smtp-Source: AMsMyM6jhYnE/aEjYcHXapzofavAu7pX7ddMD038s2P34j/GAHoNYKyfFysuRe52YUvpGlRBEmTO3A==
X-Received: by 2002:a5d:42c7:0:b0:236:4ddd:3576 with SMTP id t7-20020a5d42c7000000b002364ddd3576mr17938354wrr.289.1667459896483;
        Thu, 03 Nov 2022 00:18:16 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b477532e66sm6341187wmq.2.2022.11.03.00.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:18:15 -0700 (PDT)
Message-ID: <1da0b1fa-ca20-4370-26b4-9f18ab8ac95d@linaro.org>
Date: Thu, 3 Nov 2022 08:18:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 27/44] KVM: Drop kvm_arch_{init,exit}() hooks
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-28-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-28-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_001818_010194_B9AC725C 
X-CRM114-Status: UNSURE (   8.68  )
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

T24gMy8xMS8yMiAwMDoxOCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBEcm9wIGt2bV9h
cmNoX2luaXQoKSBhbmQga3ZtX2FyY2hfZXhpdCgpIG5vdyB0aGF0IGFsbCBpbXBsZW1lbnRhdGlv
bnMKPiBhcmUgbm9wcy4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAt
LS0KPiAgIGFyY2gvYXJtNjQva3ZtL2FybS5jICAgICAgICAgICAgICAgIHwgMTEgLS0tLS0tLS0t
LS0KPiAgIGFyY2gvbWlwcy9rdm0vbWlwcy5jICAgICAgICAgICAgICAgIHwgMTAgLS0tLS0tLS0t
LQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMSAtCj4gICBhcmNo
L3Bvd2VycGMva3ZtL3Bvd2VycGMuYyAgICAgICAgICB8ICA1IC0tLS0tCj4gICBhcmNoL3Jpc2N2
L2t2bS9tYWluLmMgICAgICAgICAgICAgICB8ICA5IC0tLS0tLS0tLQo+ICAgYXJjaC9zMzkwL2t2
bS9rdm0tczM5MC5jICAgICAgICAgICAgfCAxMCAtLS0tLS0tLS0tCj4gICBhcmNoL3g4Ni9rdm0v
eDg2LmMgICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvbGludXgv
a3ZtX2hvc3QuaCAgICAgICAgICAgIHwgIDMgLS0tCj4gICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAg
ICAgICAgICAgICAgICB8IDE5ICsrLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDkgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA3NiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
