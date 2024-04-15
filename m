Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116AC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpCfsTE6MGqtwstzTevIdBjIiIaZZGT0VgoyOSN/4UA=; b=c1BO7Z7FLgw88o
	MFtjGip1jHQ9bh91kmGQq6XJlLcayyxfQLbOo+le9p1GgK1zAlx5yE119adM9kWKkhpSqpVmKCA6v
	kXWEJZsWfBCBK5/sz8l/KzVSSr4thODC85Us3rUYeR1DiY5oFP8smOXLtVa1M84TwaT3VwjEoVrtv
	uRKGrreouEU7T+XMWxLP+4xm6dx//cBQbF8hoLBq0jl7LmXSsk6j4jkIF6y3cUqhJkE2U/eGhiV7L
	3qrJR1wErIcVfDn2c92VOECfiS03xGFO6QnB3D7IBv/zlOigBWutjpAN2gMGSIZwJJ1PyZjTsIcWg
	z6Y8AdnTsMZcligIedWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIME-00000007f4O-22JH;
	Mon, 15 Apr 2024 09:10:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIMA-00000007f3F-3FPl
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 09:10:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-343d32aba7eso926753f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713172226; x=1713777026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMipTzrco8cuX1DyV3x6d9zPt5GQCAGmWbkRX0s3Bkk=;
        b=IjVdNSpXeplAKCI9GDjlVFE0IlKEmU3+9Baz6cgmn14BOzS2F+qS0E1nyOTEYNw4Si
         FzxP6vkaBSnzAa1M2lTfi33Q1o/DcSEZceyqW6Y09GJnKR7uOhoTR5giBDa+ZKykTRKR
         myimhjZ4cyJFE6pyoAI4mUpJXpJqpV8xXrjN9RMb1YHWPv7TMNpGqkk5veQ7yinbVcwB
         X25DY+JN8JoR47GLaa+UE+IZrQLYHWDTBDc+JII7MMu7darQQLUKvUu460/e/WypKWLQ
         6Yo8W6QI+HJtvQxD53Jq+gLj2hzqqMkThNGEQxKQj9eRqXJ1BB3PETwNTlhIxAoNy9dg
         1ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713172226; x=1713777026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMipTzrco8cuX1DyV3x6d9zPt5GQCAGmWbkRX0s3Bkk=;
        b=f0zfbtXwA7og+ieRFx2vqGjmzdYLJAp7VhsCcK1iTG8pUabGPgChCcGpcAXya42rgC
         jJhbPFDInQUy9MtSxVQrijcdXHcKFDPuUPeOtwYo0eB07zDcZNSAi7h6EdgU2J67iBZ+
         GLccx+nKSm9gdhw7Cw9HMuClgbkdDyjhEJxJxO94CekQRBwHiU4ofnfP26Qwnb16WWDW
         DP/tIV1LBSzuDHnTRvF/zR9dfBCY4mgSAKWToxkhScxJHtWFuOycjV+mFd8K+R+qKDzv
         4wjR4NTC4Nuh/8CyOFTSgCqZrkUd9Ilnj6t+i74c0nuhddYfpKy2j1R5m6jRIGc07jsk
         W+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXa5pzgUFp6mkL7iOhNZtIVm8LKAnmVAwbW9gmcfnx+1lgZof8DPieIo1763sz1kW5+YnDIbaC0hdjnzgzt5v/eYg19BtrxrsubE1XOitZt
X-Gm-Message-State: AOJu0YwuyJrl3hT9l1zNyj7MrxLbFDy+3sk6OHKkGd9LTHsvvIMQgmC9
	50P7mwmoU3zkoIjwNsJvTcfP7CVPnBJZd6kaHaA9Dy1ZkNqSEk58D0NagRfreds=
X-Google-Smtp-Source: AGHT+IFOI8wiMfFK+eh+wkDTy9pH4EpksT9wRNII+klZpSBWS3ghE8Ipz2Lv/Q5ZldsUWaH3Q3GfEg==
X-Received: by 2002:a05:600c:3b1f:b0:416:7b2c:df05 with SMTP id m31-20020a05600c3b1f00b004167b2cdf05mr6832257wms.1.1713172226355;
        Mon, 15 Apr 2024 02:10:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:b1f5:d56c:abf9:b394? ([2a01:e0a:999:a3a0:b1f5:d56c:abf9:b394])
        by smtp.gmail.com with ESMTPSA id gw7-20020a05600c850700b004146e58cc35sm18937831wmb.46.2024.04.15.02.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 02:10:25 -0700 (PDT)
Message-ID: <5eda3278-24bc-4c17-a741-523ad5ff79f7@rivosinc.com>
Date: Mon, 15 Apr 2024 11:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
 <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
 <20240411-backwater-opal-00c9aed2231e@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240411-backwater-opal-00c9aed2231e@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_021031_000285_B23855D8 
X-CRM114-Status: GOOD (  21.90  )
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

CgpPbiAxMS8wNC8yMDI0IDEzOjUzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTEsIDIwMjQgYXQgMTE6MDg6MjFBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pj4+
IElmIHdlIGNvbnNpZGVyIHRvIGhhdmUgcG90ZW50aWFsbHkgYnJva2VuIGlzYSBzdHJpbmcgKGll
IGV4dGVuc2lvbnMKPj4+PiBkZXBlbmRlbmNpZXMgbm90IGNvcnJlY3RseSBoYW5kbGVkKSwgdGhl
biB3ZSdsbCBuZWVkIHNvbWUgd2F5IHRvCj4+Pj4gdmFsaWRhdGUgdGhpcyB3aXRoaW4gdGhlIGtl
cm5lbC4KPj4+Cj4+PiBObywgdGhlIERUIHBhc3NlZCB0byB0aGUga2VybmVsIHNob3VsZCBiZSBj
b3JyZWN0IGFuZCB3ZSBieSBhbmQgbGFyZ2Ugd2UKPj4+IHNob3VsZCBub3QgaGF2ZSB0byBkbyB2
YWxpZGF0aW9uIG9mIGl0LiBXaGF0IEkgbWVhbnQgYWJvdmUgd2FzIHdyaXRpbmcKPj4+IHRoZSBi
aW5kaW5nIHNvIHRoYXQgc29tZXRoaW5nIGludmFsaWQgd2lsbCBub3QgcGFzcyBkdGJzX2NoZWNr
Lgo+Pgo+PiBBY2tlZCwgSSB3YXMgbWFpbmx5IGFuc3dlcmluZyBEZWVwYWsgcXVlc3Rpb24gYWJv
dXQgZGVwZW5kZW5jaWVzIHdydCB0bwo+PiB1c2luZyBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQo
KSB3aGljaCBkb2VzIG5vdCBzZWVtcyB0byBiZSByZWxldmFudAo+PiBzaW5jZSB3ZSBleHBlY3Qg
YSBjb3JyZWN0IGlzYSBzdHJpbmcgdG8gYmUgcGFzc2VkLgo+IAo+IEFoaCwgb2theS4KPiAKPj4g
QnV0IGFzIHlvdSBzdGF0ZWQsIERUCj4+IHZhbGlkYXRpb24gY2xlYXJseSBtYWtlIHNlbnNlLiBJ
IHRoaW5rIGEgbG90IG9mIGV4dGVuc2lvbnMgc3RyaW5ncyB3b3VsZAo+PiBiZW5lZml0IHN1Y2gg
c3VwcG9ydCAoQWxsIHRoZSBadiogZGVwZW5kcyBvbiBWLCBldGMpLgo+IAo+IEkgdGhpbmsgaXQg
aXMgYWN0dWFsbHkgYXMgc2ltcGxlIHNvbWV0aGluZyBsaWtlIHRoaXMsIHdoaWNoIG1ha2VzIGl0
Cj4gaW52YWxpZCB0byBoYXZlICJkIiB3aXRob3V0ICJmIjoKPiAKPiB8IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+
IHwgaW5kZXggNDY4YzY0NjI0N2FhLi41OTQ4Mjg3MDBjYmUgMTAwNjQ0Cj4gfCAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gfCAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4gfCBAQCAtNDg0LDUgKzQ4NCwyMCBAQCBwcm9wZXJ0aWVzOgo+IHwgICAgICAgICAgICAg
IFJlZ2lzdGVycyBpbiB0aGUgQVg0NU1QIGRhdGFzaGVldC4KPiB8ICAgICAgICAgICAgICBodHRw
czovL3d3dy5hbmRlc3RlY2guY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9BWDQ1TVAtMUMtUmV2Li01
LjAuMC1EYXRhc2hlZXQucGRmCj4gfCAgCj4gfCArYWxsT2Y6Cj4gfCArICAtIGlmOgo+IHwgKyAg
ICAgIHByb3BlcnRpZXM6Cj4gfCArICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9uczoKPiB8ICsg
ICAgICAgICAgY29udGFpbnM6Cj4gfCArICAgICAgICAgICAgY29uc3Q6ICJkIgo+IHwgKyAgICAg
ICAgICBub3Q6Cj4gfCArICAgICAgICAgICAgY29udGFpbnM6Cj4gfCArICAgICAgICAgICAgICBj
b25zdDogImYiCj4gfCArICAgIHRoZW46Cj4gfCArICAgICAgcHJvcGVydGllczoKPiB8ICsgICAg
ICAgIHJpc2N2LGlzYS1leHRlbnNpb25zOgo+IHwgKyAgICAgICAgICBmYWxzZQo+IHwgKwo+IHwg
Kwo+IHwgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gfCAgLi4uCj4gCj4gSWYgeW91IGRv
IGhhdmUgZCB3aXRob3V0IGYsIHRoZSBjaGVja2VyIHdpbGwgc2F5Ogo+IGNwdUAyOiByaXNjdixp
c2EtZXh0ZW5zaW9uczogRmFsc2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93IFsnaScsICdtJywgJ2En
LCAnZCcsICdjJ10KPiAKPiBBdCBsZWFzdCB0aGF0J3MgcmVhZGFibGUsIGV2ZW4gdGhvdWdoIG5v
dCBjbGVhciBhYm91dCB3aGF0IHRvIGRvLiBJIHdpc2gKClRoYXQgbG9va3MgcmVhbGx5IHJlYWRh
YmxlIGluZGVlZCBidXQgdGhlIG1lc3NhZ2VzIHRoYXQgcmVzdWx0IGZyb20KZXJyb3JzIGFyZSBu
b3Qgc28gaW5mb3JtYXRpdmUuCgpJdCB0cmllZCBwbGF5aW5nIHdpdGggdmFyaW91cyBjb25zdHJ1
Y3RzIGFuZCBmb3VuZCB0aGlzIG9uZSB0byB5aWVsZCBhCmNvbXByZWhlbnNpdmUgbWVzc2FnZToK
CithbGxPZjoKKyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIHJpc2N2LGlzYS1l
eHRlbnNpb25zOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjZgor
ICAgICAgICAgIG5vdDoKKyAgICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgICBjb25z
dDogemNhCisgICAgdGhlbjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIHJpc2N2LGlzYS1l
eHRlbnNpb25zOgorICAgICAgICAgIGl0ZW1zOgorICAgICAgICAgICAgYW55T2Y6CisgICAgICAg
ICAgICAgIC0gY29uc3Q6IHpjYQoKYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBp
LWQxLWRvbmdzaGFuLW5lemhhLXN0dS5kdGI6IGNwdUAwOgpyaXNjdixpc2EtZXh0ZW5zaW9uczox
MDogJ2FueU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgogICAgICAg
ICd6Y2EnIHdhcyBleHBlY3RlZAogICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCgpFdmVuIHRob3VnaCBkdC1i
aW5kaW5ncy1jaGVjayBwYXNzZWQsIG5vdCBzdXJlIGlmIHRoaXMgaXMgdG90YWxseSBhCnZhbGlk
IGNvbnN0cnVjdCB0aG91Z2guLi4KClRoYW5rcywKCkNsw6ltZW50Cgo+IHRoZSBmb3JtZXIgY291
bGQgYmUgc2FpZCBhYm91dCB0aGUgd2FsbCBvZiB0ZXh0IHlvdSBnZXQgZm9yIC9lYWNoLwo+IHVu
ZG9jdW1lbnRlZCBlbnRyeSBpbiB0aGUgc3RyaW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
