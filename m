Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4189CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 09:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aMhOZYPOPal9SHMVwu7j5Z7Ydytm48yfq9OHMbdljs=; b=N7FJNTVjyOjQqC
	T2voKSzRlGGextvcxR9oXDNIST9afFxnv2cpa2ktgRg4mjAb4SEq7r7Ffu9Yb2EUTGF//1Tg5/lqd
	lG8X+8umFcsz5T3EbSh680jg6DZWe4KtggeuEYOksW59KEU+wDK19SCrWEeLzll5U9VHxokSzbdqO
	3sw7ntUYRuOA1wMOBmvzoP0C3eQi5jK3b9YAI05qRH2+xPUQ89+UOUeAXQ2fdSouwLfs7VboSROmG
	q07cBlM/LB/PdLgG2vdzaItmmeqfzpyCyV3oaTxxetkPyNzxM4nu63zoPrAb39pH5ymJgxCSHpb/Q
	OEf0/q4V5lJSINOjKFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51tU-00Eu4d-LU; Tue, 13 Dec 2022 09:48:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51tR-00Etx5-Rq
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 09:48:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bx10so15031040wrb.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 01:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kjr0P8P3evTsHtv0kx5R0LLm1BjbVlP2JBqTHfgIEU=;
        b=wxREDceclsVP4jxePxvte5FDBoV8oOTQ+kk6QFnlyxJvqYJlw6q99Pp1nurNiEIDcM
         9/QhIdsqo/Mvmd0D1NOjeYmiTaUYd27+N8bXw7PgG1XVqeuHvL0gucTFuUCy0TiqiLnY
         cJGcXgCzKmAfB+NHUwBa04Ks9c6wflPCLOsAECG/QjplFaeuNUn2phsb6D3wu+2hEwsu
         84WblEtk36HvUMtvdeu9efTCSwNFLmaTDZ8ypqla1IRKx/eWU0SU7u2K0C26EvvPsz9i
         fQ3rQMJDeLJobD49zJBFgCw9BxJVhEqU4EgqX+/2ZBjH0vLq+9zvQwzpZ3qp6a0lyLlu
         Xprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kjr0P8P3evTsHtv0kx5R0LLm1BjbVlP2JBqTHfgIEU=;
        b=5uWGfmZV+vUMlFgh1z6k6g7NI+h5zbVZhz6WgLn4i7liXxC6JHmQtS2Y0vzcvQhf2J
         BC7+jcsMavVl0KQ+qgszclUc65CkAy62vdgl2tZs/BG+AhRZPvqALZu/zHMBHSJQY5Ne
         yeqbpX07sgahs2py7cd+xuonFq3TnK37SmA/NYlbtvKIIuYmLr2zGe639RtmzOnFWDf1
         /1ySO14NMF56qwn92yxym90YSPrfliSfy5uQ8F2yHLq8NBARVpg6dZouSkpoRBYBqGsq
         9RCL4izf/EMC/+JrnP6O58ROcT3dk0iSnIIxC71wk/GrzET0Sjppc+gA06olnIv9fyt/
         qyWw==
X-Gm-Message-State: ANoB5pnrYgt/436o8drBMyVEEXLlCD9FUCTBiO7QLCgAPj5Oi3+A4wpd
	iZa6FYbH0CtfuAPuSpVyfxTs/w==
X-Google-Smtp-Source: AA0mqf7qf8gp5KDq16JqrUroPUpREMH1ONeNa3KMxmeoce64zNsGbHFkbza+M0tQPkVeVr4/pP6aWw==
X-Received: by 2002:a5d:490d:0:b0:242:fa5:ce83 with SMTP id x13-20020a5d490d000000b002420fa5ce83mr14631600wrq.37.1670924882743;
        Tue, 13 Dec 2022 01:48:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d5687000000b002365730eae8sm11005215wrv.55.2022.12.13.01.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:48:02 -0800 (PST)
Message-ID: <ba1760b7-3153-d761-d0aa-3bf321f2f682@linaro.org>
Date: Tue, 13 Dec 2022 10:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 07/14] KVM: selftests: Use proper function prototypes in
 probing code
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
 Aaron Lewis <aaronlewis@google.com>,
 Raghavendra Rao Ananta <rananta@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-8-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213001653.3852042-8-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_014809_941797_ECC0823A 
X-CRM114-Status: UNSURE (   8.23  )
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

T24gMTMvMTIvMjIgMDE6MTYsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gTWFrZSB0aGUg
bWFpbigpIGZ1bmN0aW9ucyBpbiB0aGUgcHJvYmluZyBjb2RlIHByb3BlciBwcm90b3R5cGVzIHNv
IHRoYXQKPiBjb21waWxpbmcgdGhlIHByb2JpbmcgY29kZSB3aXRoIG1vcmUgc3RyaWN0IGZsYWdz
IHdvbid0IGdlbmVyYXRlIGZhbHNlCj4gbmVnYXRpdmVzLgo+IAo+ICAgIDxzdGRpbj46MTo1OiBl
cnJvcjogZnVuY3Rpb24gZGVjbGFyYXRpb24gaXNu4oCZdCBhIHByb3RvdHlwZSBbLVdlcnJvcj1z
dHJpY3QtcHJvdG90eXBlc10KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29u
IDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9NYWtlZmlsZSB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQGxpbmFyby5vcmc+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
