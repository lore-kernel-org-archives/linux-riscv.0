Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CE6C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/udYITMRXc3aikaIcA4nACXds0djCD7XkUZOr65JciY=; b=1GLjhSPj/spvOY
	N5N7HkEhPV16Mb8urNDS+iD6jDEj+81n84qHS/wte60bMf1jLCG2LmH4kGTbdvAZxwpFBt0f5xG6Z
	xIQmIhpD6NxBJEwjGJso2i42G6LH4XGmxCz8ARqjSuatNiq+4MDTbudTuqcr2FRtTPloeloRVkwRO
	+h9yLSUPkJCovnfLvaHgC8R12Kgxmfo39STZczSpkmnDSJAF3WAFQG1mcV/m0MUX99vAWznJ69P6v
	QALrdRiXuZyvGQLojM+QSPxlRH0IIp0H1Qljc29Ilfty+1yLiqg3BaOs+23bVnr5yPk/leqpx1+1O
	O//Em7kDAJv306HES0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1pWK-000000074Q8-3442;
	Tue, 30 Apr 2024 15:35:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1pWG-000000074LW-1eE9
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 15:35:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-34a42d6e216so1300122f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714491338; x=1715096138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKIJbDUVjXcCbxtnsr2n+MGPFjkYZK2XnzHwiA9YwSY=;
        b=zHlX7oKSxVlRSe8rhmXQTsHRzOZMCia0zV2SlUJcF9uHA9FpMGkeeQOKvFrYLJvmlU
         B50W3E6Pm/D8O2umiTaSVMiGwk0GUp4/eF4zhpnMzVPUvggyiupUS/cgM8BMVamhP2zT
         +lTgtBP03+9lZkLSJOZhaG8zdK0XYi8UsC4kiI3UqOZmDr57FCRxDt5x0UuX1uamx5qB
         hwqb0FaTa4/HSQXWpcbEM2krj084i6YjelA5dmYNPrnYNO0u1VxsCAowLxeKB3EniQZu
         DrCY62wV6prKlrmXxNBHg6iARCulAoTSf8TE5k1x40x8HqBRPamvBDHsb44m/kO6+427
         npSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714491338; x=1715096138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKIJbDUVjXcCbxtnsr2n+MGPFjkYZK2XnzHwiA9YwSY=;
        b=t9GfCNV7jZ5+LOVY3xdiIuDksXm1ofyPKN8NjaYjy5+KuIYpC8BgitrkdZQ9VpsoOq
         Rb8/u10bMPPEOeHrliamD40VGf+fPd3PhRo1Tq8ZNsmCAIbIAvKxYYyLyzmjQiK7xHh2
         A5onsxrX7uIAvqjtTno4vIpnE+QfxHFPVwtQUD+qCRWr1d1ZGAKnpa5IJwc272jDjgYx
         pldYl41nDt45bQklmkQ/vLlF58hR30JaUz+Ds2JSSTybMwDsLTjIRHARFVQl5iO+SOgz
         1g+gPf/baLDAS2fUj3RG4n0LD0uH39xBPaMfoVpWvigW4gRLqGUi8OyQ/lTvtRfUOgwB
         kTXw==
X-Forwarded-Encrypted: i=1; AJvYcCXA1muUn/J3XqiSEgAx9ub7zK3PKEh1fRCylTZJg90H8wVbrl1vlqNaIO3ZSOeeIowUbgNA76vPiIayb3eNlBdC38HzLxaFyq+4HDum29jh
X-Gm-Message-State: AOJu0YwFg6SXM/PoxzV3bNVGWROBMqBPS3gVyuPYjJQNtN/pmtY/kha4
	Ax0sJ6HbKTHvCu8+FKFzdjTG8V8GJirk0Kk9dSKXtZeJZIYC1FWRucNnK5xuNEA=
X-Google-Smtp-Source: AGHT+IG/6WtaAQPF462A9lDDrfPcBnLbUoVX6HNrNaquPuIq1fx7JA2M96lwMw2ZYh9NFqb4zyLJTg==
X-Received: by 2002:adf:ed4b:0:b0:34d:a29d:a8d5 with SMTP id u11-20020adfed4b000000b0034da29da8d5mr19585wro.4.1714491337672;
        Tue, 30 Apr 2024 08:35:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:c21b:67fd:90ab:9053? ([2a01:e0a:999:a3a0:c21b:67fd:90ab:9053])
        by smtp.gmail.com with ESMTPSA id r30-20020adfb1de000000b00343e392829dsm32637498wra.97.2024.04.30.08.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:35:37 -0700 (PDT)
Message-ID: <b4228cda-b072-479d-bce0-3af42ce49811@rivosinc.com>
Date: Tue, 30 Apr 2024 17:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] RISC-V: KVM: add support for double trap
 exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-8-cleger@rivosinc.com>
 <ZixV3lCe3jYQN3Qx@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZixV3lCe3jYQN3Qx@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_083548_619365_DA1804DF 
X-CRM114-Status: GOOD (  14.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyNy8wNC8yMDI0IDAzOjMzLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+IC8qKgo+PiDCoCog
a3ZtX3Jpc2N2X3ZjcHVfdHJhcF9yZWRpcmVjdCAtLSBSZWRpcmVjdCB0cmFwIHRvIEd1ZXN0Cj4+
IMKgKgo+PiDCoCogQHZjcHU6IFRoZSBWQ1BVIHBvaW50ZXIKPj4gwqAqIEB0cmFwOiBUcmFwIGRl
dGFpbHMKPj4gwqAqLwo+PiAtdm9pZCBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGlyZWN0KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGt2bV9jcHVfdHJhcCAqdHJhcCkKPj4gK2ludCBrdm1fcmlzY3ZfdmNwdV90cmFwX3Jl
ZGlyZWN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBrdm1fY3B1X3RyYXAgKnRyYXApCj4+IHsKPj4gwqDCoMKgwqB1bnNp
Z25lZCBsb25nIHZzc3RhdHVzID0gY3NyX3JlYWQoQ1NSX1ZTU1RBVFVTKTsKPj4KPj4gK8KgwqDC
oCBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJjaC5pc2EsIFNTREJM
VFJQKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHZzc3RhdHVzICYgU1JfU0RUKQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4ga3ZtX3Jpc2N2X2RvdWJsZV90cmFwKHZjcHUsIHRy
YXApOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBTZXQgRG91YmxlIFRyYXAgYml0IHRvIGVu
YWJsZSBkb3VibGUgdHJhcCBkZXRlY3Rpb24gKi8KPj4gK8KgwqDCoMKgwqDCoMKgIHZzc3RhdHVz
IHw9IFNSX1NEVDsKPiAKPiBJIGRpZG4ndCBnZXQgaXQuCj4gV2h5IGRvIHRoaXMgd2l0aG91dCBj
aGVja2luZyBpZiBjdXJyZW50IGNvbmZpZyBhbGxvd3MgdXMgdG8gZG8gc28gPwo+IEkgYW0gaW1h
Z2luaW5nIHdlIGRvIHRoaXMgb25seSB3aGVuIGhlbnZjZmcgZm9yIGN1cnJlbnQgdmNwdSBzYXlz
IHRoYXQKPiBEVEU9MQo+IGZvciB0aGlzIHRoaXMgZ3Vlc3QsIHJpZ2h0PwoKV2UgYWN0dWFsbHkg
ZG8gbm90IHJlYWxseSBjYXJlIHNpbmNlIGlmIG5vdCBlbmFibGVkLCB0aGlzIGJpdCB3aWxsIGJl
Cm1hc2tlZCBieSB0aGUgaGFyZHdhcmUgd2hlbiB3cml0aW5nIGl0IHRvIHRoZSBDU1IuIEkgY291
bGQgaW5kZWVkIGFkZCBhCmNoZWNrIGZvciB0aGF0IGJ1dCBpbiB0aGUgZW5kLCBpdCB3aWxsIHlp
ZWxkIHRoZSBzYW1lIHJlc3VsdC4gSW4gdGhhdApjYXNlLCBqdXN0IE9SaW5nIGl0IHdpdGggdGhl
IHZhbHVlIHNlZW1zIG1vcmUgZWZmaWNpZW50IHRoYW4gYWRkaW5nIGFuCiJpZiIgdG8gY2hlY2sg
aWYgdGhlIGV4dGVuc2lvbiBhbmQgRFRFIGlzIGVuYWJsZWQuCgpDbMOpbWVudAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
