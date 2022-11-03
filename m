Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E4CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qm+CX2AtPqIUL1qWn12KJr46W8CQ0BwL70Yq+O74Hn4=; b=P23JAN1RHNVqC0
	Wwu6/aJBle2hJs7vidITSABwIkv2jPx2+1hxqysQ6NZBMgbj5BDMCSvqC56EVUWq2DhA2m00uwYKc
	ZZNwAIwmhWJf4hd1ZkQogroYoul1V+iYYhTPEda3vMMYToUxA8h36ENqOLn+aX4fpLbFQmmT9YP9K
	m7nwJ0WOKlwdUQX0VyFhU9TqBc/D3j5iJ8XEVj+7wifK7ddMYL6rIikYUPRPLWejZqDjjOT92xlyu
	mK84E+nILKdJRVWtoc9J4LfjKaYLQysKNUIcMrqIzkYW0xQs6rTneA8GAJHhXEMO0D+1NQeFTQIQm
	ILISW8P8+siQIAY6OIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUQq-00GPCR-Na; Thu, 03 Nov 2022 07:14:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUQe-00GP6m-1U
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:14:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id t1so497956wmi.4
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pdpi+9UoXFmBx6WS1nIzeC5GAA4ErfSd67Sd5AqWcg=;
        b=H1aAZTt5omn1creuvv0ovxmACFg4pOnVWmYHZn4E4lfgT71L/+bkBqMdS2VJqi5qOj
         YmATL6SnR5o+XQBpr5Zki/b3eg+7a33Y6+MAjm8hsgmFIym9xbyYuh0hkg0prpG2xE5F
         PuLR8pBfv6BBbgXz9sU9CedCiJ2OZly1K4pMrBC8+JOwPT599bO9tsyb8SJGk4MzThPL
         1kCqwm334cbHc7nOfuU0bDlyQDVQIepbwXFRhrNPfzdSZaSvyNIoq33No6jykj/v3m8W
         r8ppiNCB0xs+LOISHZCIqL+1GiXCOzslnZH2Bev57sQnF5H5kmf2+UwyKku2qWO1cQWO
         MoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pdpi+9UoXFmBx6WS1nIzeC5GAA4ErfSd67Sd5AqWcg=;
        b=WgwYg2r2gJRn2Ke8DsiOkOYkyvSAzp34Xv8dVphAhFpafcPNEXFL51X0ezmcm2Uhc0
         ls1tQOSrjCKKALXk04K/SaFfvJ63+xwqcCW84A+CtZYzpz+ulE+ukfIu1TC8Cq5rk0cQ
         Paf4JlUghmdLilVc+PKpdneuxRs3VNyydKGHng3e1sdoIb12JxNBwVlJuO6Ncurvr6F3
         sm881FuMwGvBSoTHeqyqQjkWwiK8yEvFIv2d7y/SfKc08YgKs3VO9XBFPHScxstUFKKC
         4I42BWPn6332Bd8IUMmMy2/E45ngd1JpBlio50OXjNRSDbVqDNI7bAm/2rfAnyDoEFAa
         nFxQ==
X-Gm-Message-State: ACrzQf0lMvEoPombeRqlINx7SJ8chwJ6fko0qbpAaElcfQzhLLxTA5x5
	Qq115K12knxly0MZXpeEhZjmrQ==
X-Google-Smtp-Source: AMsMyM5MQbAO6gubSSNJTg2fBstLeZi84Spz6yMzRnw+j7KRE9PRabE8XztmxDtlM/M+GTvsQ9gWSw==
X-Received: by 2002:a05:600c:5127:b0:3c6:47ff:5d33 with SMTP id o39-20020a05600c512700b003c647ff5d33mr19212651wms.68.1667459657899;
        Thu, 03 Nov 2022 00:14:17 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5007000000b00236644228besm34910wrt.40.2022.11.03.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:14:17 -0700 (PDT)
Message-ID: <cb935198-e2f3-bc9e-a13c-2fa2bf8ea46b@linaro.org>
Date: Thu, 3 Nov 2022 08:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 22/44] KVM: RISC-V: Do arch init directly in
 riscv_kvm_init()
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
 <20221102231911.3107438-23-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-23-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_001420_104520_CEB2D4C5 
X-CRM114-Status: UNSURE (   9.96  )
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

T24gMy8xMS8yMiAwMDoxOCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBGb2xkIHRoZSBn
dXRzIG9mIGt2bV9hcmNoX2luaXQoKSBpbnRvIHJpc2N2X2t2bV9pbml0KCkgaW5zdGVhZCBvZgo+
IGJvdW5jaW5nIHRocm91Z2gga3ZtX2luaXQoKT0+a3ZtX2FyY2hfaW5pdCgpLiAgRnVuY3Rpb25h
bGx5LCB0aGlzIGlzIGEKPiBnbG9yaWZpZWQgbm9wIGFzIGludm9raW5nIGt2bV9hcmNoX2luaXQo
KSBpcyB0aGUgdmVyeSBmaXJzdCBhY3Rpb24KPiBwZXJmb3JtZWQgYnkga3ZtX2luaXQoKS4KPiAK
PiBNb3Zpbmcgc2V0dXAgdG8gcmlzY3Zfa3ZtX2luaXQoKSwgd2hpY2ggaXMgdGFnZ2VkIF9faW5p
dCwgd2lsbCBhbGxvdwo+IHRhZ2dpbmcgbW9yZSBmdW5jdGlvbnMgYW5kIGRhdGEgd2l0aCBfX2lu
aXQgYW5kIF9fcm9fYWZ0ZXJfaW5pdC4gIEFuZAo+IGVtcHR5aW5nIGt2bV9hcmNoX2luaXQoKSB3
aWxsIGFsbG93IGRyb3BwaW5nIHRoZSBob29rIGVudGlyZWx5IG9uY2UgYWxsCj4gYXJjaGl0ZWN0
dXJlIGltcGxlbWVudGF0aW9ucyBhcmUgbm9wcy4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBp
bnRlbmRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3Yva3ZtL21haW4uYyB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFy
by5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
