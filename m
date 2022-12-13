Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88044C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wetk+6fgH8scoh6xdXgUpDDwvzSmJNMl2Pr3U5+EXzA=; b=f9+N+rO/NPKJwg
	SBZzgcG+n69VYk5yGv7PbtH8vpCL2vIeJsf0gV2l9dRxc3YRQOIoMd6NIoXGTmEU1nvN/bdMz/96b
	N+rYiAp/CycYEa2MZxNVgQvmWt1I97ImHsVeHaQLwcBWuwZyH0yFbtq2VBhynSkim540UX9wev+iV
	eJsz3nHVrnXGN4Yv+wZCzPg9kgMYR8JIlBFaz7Hwsgu/Lw5OWfh2rMqNfj8DVIE7R/Zz31OlLgv5G
	9BEdQVvJaYTfXa51sav932ePchesmyC/9H3WDD5JPMftMTm9jyg/CgkZLJGnePEPCirT/ubhHT04k
	wgabuvvzK2Exl97tCzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51xQ-00F3J2-Nj; Tue, 13 Dec 2022 09:52:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51xD-00F2rJ-OS
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 09:52:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id i7so386312wrv.8
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 01:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5puRTi/aBwHreExscKf/w+BThNFn9mhIDV4jDBOxJ4=;
        b=cX9OvtSSUPl2VjlUMxN9wkJTxjF4VMryEK2+74/Jcp2+VxH/7zdJAOksUNssIxTm51
         zg9bgDUDeJ1da0Q996JdsUZgJPySpalntdnf95UOKKDwkbLVqfZrmNUqAsJxl8FWHMCo
         iy42JdAmC96Wf8DLM5Sr75akb1KR+vn97tncFrPZBcvjFGsoCr31lDbd1B+K+87hjvvn
         J6OXoKWzFDZwo6PVBpAVoy279lQ0QJaFjVIq0qJgY5lAWSUvA0Y+b8aCIhtTQTKtfXNx
         h4SjEkvduYcq4V2JhT/HRFFC/rhUGSGHW5+soZiuFIjG+etlAVkEl6tT5ICKi8K/z2Ab
         cL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5puRTi/aBwHreExscKf/w+BThNFn9mhIDV4jDBOxJ4=;
        b=KEB2vloPewB2LBwfy4PmdJr1lz1r9jCVLznl3U1qHec6fdzklYhzXXk+qMxWOYtphG
         hZCYhlyXoL7Cb1B1XpH1pkn6xBU4W5NooBgfCyO6ZModTgIJN/fWbwbOqRllwYW9gRRb
         baAmHYNL41Yx5i74BUu3K0kIvZPSmBY2fG2mRLidXrE/5ghR+yYr8VY/fLHmhY1Wsbs6
         0/UxlhYLSl6BYCZmbyyTRUDY0PqZ5TksXSqulUtBVd7SA4vGgIdSxaOSxTiXzJk00BCs
         Dc7t5N+9MMnGhJRokdL2lBbycUpRXwKYiqCCOasZYGclfwh1SY/r7oyF5WGWpl3bF6qF
         hiwg==
X-Gm-Message-State: ANoB5pnSIWnbpmxG1z0+JSKNYeg8wyR/ZZ1EaSy9EiqDTKn95g326WZ7
	jPk++r7+ctbsqPkVBQGv7+KjLA==
X-Google-Smtp-Source: AA0mqf4PMHJopL+j1/FAA6cNdu0WvhJE91YQY4pXO/EmIJ2pu66aV5lVRtcU7SIMWuMwfp4CKKKVmw==
X-Received: by 2002:adf:d22f:0:b0:242:1fb8:1ca9 with SMTP id k15-20020adfd22f000000b002421fb81ca9mr10116658wrh.37.1670925120065;
        Tue, 13 Dec 2022 01:52:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id y5-20020a5d4705000000b00241f029e672sm10620076wrq.107.2022.12.13.01.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:51:59 -0800 (PST)
Message-ID: <f32e0526-2c67-0962-52c8-27d02439fbc2@linaro.org>
Date: Tue, 13 Dec 2022 10:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 01/14] KVM: selftests: Define literal to asm constraint in
 aarch64 as unsigned long
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
 <20221213001653.3852042-2-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213001653.3852042-2-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_015203_818099_0CEA531E 
X-CRM114-Status: UNSURE (   9.35  )
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

T24gMTMvMTIvMjIgMDE6MTYsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gRGVmaW5lIGEg
bGl0ZXJhbCAnMCcgYXNtIGlucHV0IGNvbnN0cmFpbnQgdG8gYWFyY2g2NC9wYWdlX2ZhdWx0X3Rl
c3Qncwo+IGd1ZXN0X2NhcygpIGFzIGFuIHVuc2lnbmVkIGxvbmcgdG8gbWFrZSBjbGFuZyBoYXBw
eS4KPiAKPiAgICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vYWFyY2g2NC9wYWdlX2ZhdWx0
X3Rlc3QuYzoxMjA6MTY6IGVycm9yOgo+ICAgICAgdmFsdWUgc2l6ZSBkb2VzIG5vdCBtYXRjaCBy
ZWdpc3RlciBzaXplIHNwZWNpZmllZCBieSB0aGUgY29uc3RyYWludAo+ICAgICAgYW5kIG1vZGlm
aWVyIFstV2Vycm9yLC1XYXNtLW9wZXJhbmQtd2lkdGhzXQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIDo6ICJyIiAoMCksICJyIiAoVEVTVF9EQVRBKSwgInIiIChndWVzdF90ZXN0X21lbW9yeSkp
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9hYXJjaDY0L3BhZ2VfZmF1bHRfdGVzdC5jOjExOToxNTogbm90ZToKPiAg
ICAgIHVzZSBjb25zdHJhaW50IG1vZGlmaWVyICJ3Igo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICJjYXNhbCAlMCwgJTEsIFslMl1cbiIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJXcwCj4gCj4gRml4ZXM6IDM1YzU4
MTAxNTcxMiAoIktWTTogc2VsZnRlc3RzOiBhYXJjaDY0OiBBZGQgYWFyY2g2NC9wYWdlX2ZhdWx0
X3Rlc3QiKQo+IENjOiBSaWNhcmRvIEtvbGxlciA8cmljYXJrb2xAZ29vZ2xlLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0K
PiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L3BhZ2VfZmF1bHRfdGVzdC5j
IHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3Jn
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
