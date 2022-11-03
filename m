Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8D0C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6lNvYJcK1GM20E207URIwrSBUUb5dDP5OeGnwjXr1k=; b=miCr8mNoaQg0aG
	40u3akXx9D/1hFnmCOJHEERUHg4aJwYkff1cGmx3N7CPdSv9nn0NJuxpGlsFPeOfersOTTi/KKyJI
	duBvHRoPHedATx60AlS3Ey5SZB3YsldSBtFluIQtXsGurvECetNmeLiSBHerS2yV8ZXgcirGnytwR
	wU6DxKK0iWChgeHroJAwIVIBcbvcxLBzEXGut1Y4fVuz6zysZ5lPejWJZhquJrErfe79c9eVnqQri
	5+kWMdrYVTUX9FVCWVix2aBVbh38w1YWR1tvPY1kzZIEoIpaCIixuLtNpqY0ZG8Qz//fa6jLG13t9
	82GOlgfJ/FACQMGu3CBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUWV-00GR3o-Oo; Thu, 03 Nov 2022 07:20:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUWJ-00GQyR-8y
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:20:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id j15so1322671wrq.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWamQQEiXwuUaXnbl6PlP555HrcaEY3+l7Gw0jB534c=;
        b=eMrmoHwsidAITYv+vZDTWUffj0xdVr6f9Irj4fYthgmDb2BtaKGEsFELQu2H6bnkWP
         kvYw40kYqV8j7+KID6Jv8TSwG2Jdrk3L2i6NZZnW1qKtWYQv3oDxv2zGF+cGC9qJEynl
         Q3HGYurZ4Dh8OnDMCMVGhftsWYYclQysAxS0McddFHROl75oHtCo1tssLi3inAUUaVcx
         fUR6nDRn+ryNrHgMilhwWNuUUGNT/fA+7xVLj81AQOwbU9CL+I5tsAtyXoOgw2iEFCeq
         61/G+FvjBXJZUKkwTCZRxbrU1QIQmLSBOvOReMSizUzMvu13QKzBhMJ0mgPECH0jRV1d
         jpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWamQQEiXwuUaXnbl6PlP555HrcaEY3+l7Gw0jB534c=;
        b=X/OBBR4VFDUkON8A905bxt89K1+XiEUkuF4aysBKHoXstR4e3P22BqrZlqeFjbj4Fe
         gV/inpWEyykqvi75GfxHi5PtJTsIDcEylS1wW2ovJ4DIydMVUEP5coHVA9VLjuxSafKe
         9zmfpLOE5kMRwfftskBjUq7SxexyCvnar6HD4CbdJMgvElz1wMUkNBqb5jbFT5LUihs4
         f5WFfYgmkWuE+UcaKn/BiX/NshpB7HdqKWE3nm7WpQhe+brT9B+nEwYkEo3A2KEDkeOw
         hV1d1PepqSSyvzOWUaJBkA2iahDVUmTYFH+U3WLVPHVxJtoqo/4sJjVzCyBFz6U01YEE
         U4mA==
X-Gm-Message-State: ACrzQf31YMC+nwEMYllAi5qy429Opj6BR4kZJO2YU6HKxfxrcs7swQNE
	SbW1rlBqwxA3H16V2+0+5Qe7bA==
X-Google-Smtp-Source: AMsMyM6CSjH/RTBpmDd/QhMZZkOx7oc3nNeJrTJLnMoKwCsW0evNR4jvL0bJpuI6uqT433DOly9rxA==
X-Received: by 2002:a5d:5744:0:b0:236:5c21:177f with SMTP id q4-20020a5d5744000000b002365c21177fmr17331121wrw.449.1667460007685;
        Thu, 03 Nov 2022 00:20:07 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id fc19-20020a05600c525300b003cf57329221sm5884991wmb.14.2022.11.03.00.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:20:07 -0700 (PDT)
Message-ID: <3a2d1d5e-b105-11ed-413b-4ad2dbba058e@linaro.org>
Date: Thu, 3 Nov 2022 08:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 30/44] KVM: Drop kvm_arch_check_processor_compat() hook
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
 <20221102231911.3107438-31-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-31-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_002011_324911_88597DA7 
X-CRM114-Status: UNSURE (   8.02  )
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
cmNoX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQoKSBhbmQgaXRzIHN1cHBvcnQgY29kZSBub3cgdGhh
dCBhbGwKPiBhcmNoaXRlY3R1cmUgaW1wbGVtZW50YXRpb25zIGFyZSBub3BzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+
ICAgYXJjaC9hcm02NC9rdm0vYXJtLmMgICAgICAgfCAgNyArLS0tLS0tCj4gICBhcmNoL21pcHMv
a3ZtL21pcHMuYyAgICAgICB8ICA3ICstLS0tLS0KPiAgIGFyY2gvcG93ZXJwYy9rdm0vYm9vazNz
LmMgIHwgIDIgKy0KPiAgIGFyY2gvcG93ZXJwYy9rdm0vZTUwMC5jICAgIHwgIDIgKy0KPiAgIGFy
Y2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMgIHwgIDIgKy0KPiAgIGFyY2gvcG93ZXJwYy9rdm0vcG93
ZXJwYy5jIHwgIDUgLS0tLS0KPiAgIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAgICAgIHwgIDcgKy0t
LS0tLQo+ICAgYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jICAgfCAgNyArLS0tLS0tCj4gICBhcmNo
L3g4Ni9rdm0vc3ZtL3N2bS5jICAgICB8ICA0ICsrLS0KPiAgIGFyY2gveDg2L2t2bS92bXgvdm14
LmMgICAgIHwgIDQgKystLQo+ICAgYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgfCAgNSAtLS0t
LQo+ICAgaW5jbHVkZS9saW51eC9rdm1faG9zdC5oICAgfCAgNCArLS0tCj4gICB2aXJ0L2t2bS9r
dm1fbWFpbi5jICAgICAgICB8IDI0ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMTMgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
