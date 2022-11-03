Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF8BC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UU2O197w/uB8QNkrb0Zxw4Rka4L5Z/4lz/7OREDD0to=; b=yoXvZH5+4617Fv
	60eC3q2x6Cal98bQe9stHixbf7snIF75awfen4FfG9fs3pGC6xgY1ZUR71kVMvCM7MhwHZYPWZ/6Z
	9W9vwAh0p+/0OVrl+GqOVXP13uWJbOLqvrMbhWzcdBc9jpx/uGaA8lsT0rjGoG0DzzHnMiu+SA3fv
	x47p5LgWZaTAgz11EG0t4X3c+zs7XI08JI4KX3r1aGU2yPG3XeTqYyAsqbAJIuaKDFRy2RqsfIm75
	zDME11YTnNg2QJ0P/k5yoioab598xtCR9bmbBcWkA1aHQJROKhCxg9Ki48EeXvjqIgxzJHxYY9y6A
	84onj3wGJIaPyTJavzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUNX-00GNtC-7W; Thu, 03 Nov 2022 07:11:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUNU-00GNrr-HW
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:11:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso529562wmp.5
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvhsZshQWEcVMeUTUtOp+ihfqDRpu56SkXuVG8Len34=;
        b=kHZDPyIo8df19dqlQHWniGoyDch8A+hISU8X6gd7fp1VbScHETGhbytjJYmkhLQHKf
         fwi1nthEtQPwse9uctHll81mNdW31rmNNRadEcJOVs4CiYzIp2cFwfJ+eDzavRkFrV7o
         df5jmaTAaQvLc9v1sSmbABx4C5Rzw1nTgw7iXi1sO9xpDPFNsNp3LKzpz90wTIQNwZ1t
         Ho+YhWAPx1xMmOMWNMoEs/sIV1YU/vXuH0Fvy5rAwr8dsko79NvLMAybJkyUdKsceRMO
         iXCBxeebKyqxkZinLCfgL7TweGZd1asuEGHKg2vBla0voczqpexKdljfuec7O93BtHaM
         wjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvhsZshQWEcVMeUTUtOp+ihfqDRpu56SkXuVG8Len34=;
        b=MiojaBBYx+BIRwKed9RWhdjTAWHXrCbL0bD/MyML8nXGqkVVcqPCf6riGVgURNqMe5
         d5HQQ6hw83eM/h+BkN1OdAPkZv4bTV+0rk/3pc8ZUO0zNZ6vSW8YzV01/yiTVl/kB+fG
         kO4vZV92RM1lsIOpUm6FWGrEUnKjnKe64JeagYNO5D3NmRL0ddfMwVs0jKWjXI53S0qN
         Ahd+SYiwMYXhZPbyMyevMQfiQ8892/LbSgHtIE9GFTFVjnvtPCbGqOe5WNeMr9OPRba2
         bdY5xLHl/j3PxU+6vnWHg6sNzS8Q18SfuXlSap77k8+RfDH4v55yMYJDLezS5tca25qS
         IA+A==
X-Gm-Message-State: ACrzQf3AN+zNbBoogMUifhck5/L2KPCW4vkGgbH105Nt0RTtLnqFfMyp
	A5Ea/fZvgLGLk0LOW6dkiBb50A==
X-Google-Smtp-Source: AMsMyM6OzoP+QUJ8ptlTPBD8IHWudpkYNFjUBgo6cbOLfKoB/+Q6j9ksVTjQt2XeCIsVj6BjOQ3zrw==
X-Received: by 2002:a05:600c:1:b0:3c6:c456:f07a with SMTP id g1-20020a05600c000100b003c6c456f07amr18797697wmc.158.1667459461681;
        Thu, 03 Nov 2022 00:11:01 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id y16-20020adff6d0000000b0023647841c5bsm17017wrp.60.2022.11.03.00.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:11:01 -0700 (PDT)
Message-ID: <e844905b-3775-b89d-8b19-0a1c2e916432@linaro.org>
Date: Thu, 3 Nov 2022 08:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 20/44] KVM: MIPS: Setup VZ emulation? directly from
 kvm_mips_init()
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
 <20221102231911.3107438-21-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-21-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_001104_587188_2B5ECB49 
X-CRM114-Status: UNSURE (   9.56  )
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

T24gMy8xMS8yMiAwMDoxOCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBJbnZva2Uga3Zt
X21pcHNfZW11bGF0aW9uX2luaXQoKSBkaXJlY3RseSBmcm9tIGt2bV9taXBzX2luaXQoKSBpbnN0
ZWFkCj4gb2YgYm91bmNpbmcgdGhyb3VnaCBrdm1faW5pdCgpPT5rdm1fYXJjaF9pbml0KCkuICBG
dW5jdGlvbmFsbHksIHRoaXMgaXMKPiBhIGdsb3JpZmllZCBub3AgYXMgaW52b2tpbmcga3ZtX2Fy
Y2hfaW5pdCgpIGlzIHRoZSB2ZXJ5IGZpcnN0IGFjdGlvbgo+IHBlcmZvcm1lZCBieSBrdm1faW5p
dCgpLgo+IAo+IEVtcHR5aW5nIGt2bV9hcmNoX2luaXQoKSB3aWxsIGFsbG93IGRyb3BwaW5nIHRo
ZSBob29rIGVudGlyZWx5IG9uY2UgYWxsCj4gYXJjaGl0ZWN0dXJlIGltcGxlbWVudGF0aW9ucyBh
cmUgbm9wcy4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0KPiAg
IGFyY2gvbWlwcy9rdm0vbWlwcy5jIHwgNiArKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
