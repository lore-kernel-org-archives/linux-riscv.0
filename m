Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A2CC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzPikdAdaKpDdn/CWdlgAWDP7gCBdVv1kehDlQSX4yU=; b=aWXrg0nNL/iDPR
	Up9LdtpmUmwj+6GyJTyTCiHaGlEm3qNjP8jaG7uWGrnGa+BZC+2cYakyPtwsWmkejmTXYIb7JXCPc
	e+d9u7EK7wQRHkeYmE2O7PpezDzv+HEHY/rMPc2PIfVyF1cVIGzTXcfhXfbGKSNbjWsBzpKx/Ez8i
	Lc2AWVTc/LxqcJlv+4nn1JU6SiMy65LIKzb3HQx1h6woS3UoZ7em30vgbEz555xXEejFolc4SOa+u
	OeFvFKijF6drsNlYDMIkAtkPMOogqoRb9mUWDrwTrHa90CLPfnP3pol3eseQqvtJGkoMpy6J5cnYU
	zw7ENVWlCytrKpkR8+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDjr-009KBY-0A;
	Tue, 24 Oct 2023 09:30:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDjn-009KAQ-2A
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 09:30:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32da42b8225so889610f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698139810; x=1698744610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epBSW7d/Y73fuCPm0yJqVjtBNeGFhQxq0MaplKN63vg=;
        b=wUu36xlRBhavMy+/dbLbw3z36Ao0SZ8kHoNTj8oyHIgsG+fPirxyXtfmcDP161d69E
         NmD7mZgfHwr6ohDmTBLDyQa0n5BGGfAqsjZJ/zKBHLnANHjcnntNqUOKVr9TS1G05F4/
         uT1aH/7cC4Z7D2NLiLyDah+hrUV8FO24XJ4AwYD7z578Elzn0jLLqsItfhiML0gq9bq4
         0Ri5tINg/I3FnksoZlSt43ob4x2BjpZcgC0ycZ5PnNUWkYQRM7HqUbBAbBjTIakHUu8H
         A/6e9s5IQn54axx5PGGe9GqGaalczHqzQkFNFMz5j0SGlAohmbzcIyYdLTiHTYzphl7l
         JKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698139810; x=1698744610;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epBSW7d/Y73fuCPm0yJqVjtBNeGFhQxq0MaplKN63vg=;
        b=MQPJ+LD2VYpPq7dfiZiersroEsVVtBoHNfyn90SyThqLNkYPbWkwjhbd1XXC5w5AXV
         q6eCtKsnP9Ha8hjizPNL+UefC2rmzU356emvcEvWOV5DB2Xj56iJIef10jgFGIisSmJu
         hNbBY+O43FfLpAsEouQFTqNaN4YrBeYgYFEshr1mfOdNoAoI+PDsIZlFZNKAe6WmhRAk
         DRxHvPQWLOG8pTqpmNbVXrU8OwLUhtXg8vpdnfdrcziFj004JZ4Un+icsmZwFuyi1HCp
         iIPeD6vGJHG8L4b/kWnSvt/Aiuzrcpc3GqVZuSY3EaZU1hjrxiL0OsRQqZuKlqVc5e9L
         jxuA==
X-Gm-Message-State: AOJu0YzoyNRBbtwVmvSHmgJjQu5pyzqpKfDuQneUeDw/Sg1FnumgOl4C
	vgpi6VfAqLD2eE2k2vjWOn3iSg==
X-Google-Smtp-Source: AGHT+IFm/o5S53urNBlHODYQKB9HRkQDLb5L5tdDg3p22JIkoo7vc0CsuA6eRfMc1YyYbUFwwXSiVg==
X-Received: by 2002:adf:a48f:0:b0:32d:d9a8:53df with SMTP id g15-20020adfa48f000000b0032dd9a853dfmr8334091wrb.3.1698139809733;
        Tue, 24 Oct 2023 02:30:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:597d:e2c5:6741:bac9? ([2a01:e0a:999:a3a0:597d:e2c5:6741:bac9])
        by smtp.gmail.com with ESMTPSA id dj18-20020a0560000b1200b0032d96dd703bsm9574187wrb.70.2023.10.24.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:30:09 -0700 (PDT)
Message-ID: <56f6af04-bdf4-4b85-99dc-9eb4f391d7ad@rivosinc.com>
Date: Tue, 24 Oct 2023 11:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar
 crypto
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-3-cleger@rivosinc.com>
 <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
 <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com>
In-Reply-To: <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_023011_933895_C3BBE166 
X-CRM114-Status: GOOD (  16.10  )
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

CgpPbiAyNC8xMC8yMDIzIDA5OjE4LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gCj4gCj4gT24g
MjMvMTAvMjAyMyAxODoyMSwgRXZhbiBHcmVlbiB3cm90ZToKPj4gT24gVHVlLCBPY3QgMTcsIDIw
MjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3Jv
dGU6Cj4+Pgo+Pj4gRnJvbTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4+Pgo+Pj4g
VGhlIFNjYWxhciBDcnlwdG8gc3BlY2lmaWNhdGlvbiBkZWZpbmVzIFprIGFzIGEgc2hvcnRoYW5k
IGZvciB0aGUKPj4+IFprbiwgWmtyIGFuZCBaa3QgZXh0ZW5zaW9ucy4gVGhlIHNhbWUgZm9sbG93
cyBmb3IgYm90aCBaa24sIFprcyBhbmQgWmJrLAo+Pj4gd2hpY2ggYXJlIGFsbCBzaG9ydGhhbmRz
IGZvciB2YXJpb3VzIG90aGVyIGV4dGVuc2lvbnMuIFRoZSBkZXRhaWxlZAo+Pj4gYnJlYWtkb3du
IGNhbiBiZSBmb3VuZCBpbiB0aGVpciBkdC1iaW5kaW5nIGVudHJpZXMuCj4+Pgo+Pj4gU2luY2Ug
WmtuIGFsc28gaW1wbGllcyB0aGUgWmJrYiwgWmJrYyBhbmQgWmJreCBleHRlbnNpb25zLCBzaW1w
bHkgcGFzc2luZwo+Pj4gInprIiB0aHJvdWdoIGEgRFQgc2hvdWxkIGVuYWJsZSBhbGwgb2YgWmJr
YiwgWmJrYywgWmJreCwgWmtuLCBaa3IgYW5kIFprdC4KPj4+IEZvciBleGFtcGxlLCBzZXR0aW5n
IHRoZSAicmlzY3YsaXNhIiBEVCBwcm9wZXJ0eSB0byAicnY2NGltYWZkY196ayIKPj4+IHNob3Vs
ZCBnZW5lcmF0ZSB0aGUgZm9sbG93aW5nIGNwdWluZm8gb3V0cHV0Ogo+Pj4gInJ2NjRpbWFmZGNf
emljbnRyX3ppY3NyX3ppZmVuY2VpX3ppaHBtX3pia2JfemJrY196Ymt4X3prbmRfemtuZV96a25o
X3prcl96a3QiCj4+Pgo+Pj4gcmlzY3ZfaXNhX2V4dF9kYXRhIGdyb3dzIGEgcGFpciBvZiBuZXcg
bWVtYmVycywgdG8gcGVybWl0IHNldHRpbmcgdGhlCj4+PiByZWxldmFudCBiaXRzIGZvciAiYnVu
ZGxlZCIgZXh0ZW5zaW9ucywgYm90aCB3aGlsZSBwYXJzaW5nIHRoZSBJU0Egc3RyaW5nCj4+PiBh
bmQgdGhlIG5ldyBkZWRpY2F0ZWQgZXh0ZW5zaW9uIHByb3BlcnRpZXMKPj4+Cj4+PiBDby1kZXZl
bG9wZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
Pj4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+Cj4+IE15
IHRyZWUgbWlnaHQgYmUgb3V0IG9mIHN5bmMsIGJ1dCBpbiBteSBzZWFyY2ggZm9yIHJpc2N2X2lz
YV9leHQsIEkKPj4gYWxzbyBmb3VuZCBhIHVzZSBpbiBwcmludF9pc2EoKSAoY3B1LmMpIHdoZXJl
IHdlJ3JlIHJlYWNoaW5nIGludG8KPj4gcmlzY3ZfaXNhX2V4dFtdLmlkIGFuZCBhc3N1bWluZyBp
dCdzIGFsd2F5cyB2YWxpZC4gSWYgdGhhdCdzIHN0aWxsIGluCj4+IHRoZXJlIHdlJ2xsIHdhbnQg
dG8gZml4IHVwIHRoYXQgc3BvdCB0b28sIHNpbmNlIG5vdyB3aXRoIGJ1bmRsZXMgLmlkCj4+IG1h
eSBvciBtYXkgbm90IGJlIHZhbGlkLgo+IAo+IE9oIGluZGVlZCwgdGhlIGFycmF5IGlzIHZpc2li
bGUgb3V0c2lkZSBvZiB0aGlzIGNvbXBpbGF0aW9uIHVuaXQgOi8uCj4gSSdsbCBjaGVjayB0aGF0
IGJlZm9yZSBzZW5kaW5nIFYzLgoKQWZ0ZXIgbG9va2luZyBhIGJpdCBtb3JlIGF0IHRoYXQsIGl0
IGFjdHVhbGx5IHNlZW1zIHRoYXQgaWQgaXMgdXNlZCBpbgpjcHVpbmZvIHRvIGRldGVybWluZSB3
aGljaCBleHRlbnNpb25zIGFyZSBwcmVzZW50IHdoaWNoIG1lYW5zIHlvdSBhcmUKcmlnaHQsIGJ1
bmRsZV9zaXplIG5lZWRzIHRvIGJlIGFjY291bnRlZCBmb3IuCgpMb29raW5nIGF0IGl0IGFsc28g
cmFpc2VzIHRoZSBxdWVzdGlvbiAoYWdhaW4pIG9mIGV4cG9zaW5nIHRoZSAiYnVuZGxlcyIKZXh0
ZW5zaW9ucyB0aGVtc2VsdmVzIG9yIG5vdCBpbiBjcHVpbmZvIG91dHB1dC4gV2l0aCB0aGUgY3Vy
cmVudCBzZXR1cCwKdGhlIGJ1bmRsZXMgZXh0ZW5zaW9ucyB3b24ndCBiZSB2aXNpYmxlIGluIGNw
dWluZm8gb3V0cHV0LiBGb3IgaW5zdGFuY2UKaWYgWmsgd2FzIGluIHRoZSBpc2Egc3RyaW5nLCB0
aGVuIGl0IHdpbGwgbm90IGJlIHZpc2libGUgaW4gdGhlIGNwdWluZm8Kb3V0cHV0LCBvbmx5IHRo
ZSBjaGlsZCBleHRlbnNpb25zLiBPbmUgc29sdXRpb24gd291bGQgYmUgdG8gYWx3YXlzIGhhdmUK
YSB2YWxpZCBpZCBmb3IgZWFjaCBleHRlbnNpb24uIFNvIHdlIHdvdWxkIGhhdmUgb25lIGZvciBa
ayBmb3IgaW5zdGFuY2UuCgpXZSB3b3VsZCB0aGVuIGhhdmUgYSBzaW1pbGFyIHNldHVwIGZvciBh
bGwgImJ1bmRsZXMiIG9yICJzdWJzZXQiCmV4dGVuc2lvbnMsIHRoZXkgd291bGQgaGF2ZSBhIGlk
IGZvciBhbGwgb2YgdGhlbS4gRm9yIGluc3RhbmNlLCBaayB3b3VsZApiZWNvbWU6CgpfX1JJU0NW
X0lTQV9FWFRfREFUQV9CVU5ETEUoemssIFJJU0NWX0lTQV9FWFRfWkssIHJpc2N2X3prX2J1bmRs
ZWRfZXh0cykKClNhbWUgd291bGQgZ28gZm9yIHp2YmIgKHJpc2N2X3p2YmJfc3Vic2V0X2V4dHMg
d291bGQgb25seSBjb250YWluIFp2a2IpOgoKX19SSVNDVl9JU0FfRVhUX0RBVEFfQlVORExFKHpr
LCBSSVNDVl9JU0FfRVhUX1pWQkIsIHJpc2N2X3p2YmJfc3Vic2V0X2V4dHMpCgpGb3IgdGhlIHNh
a2Ugb2YgY29tcGxldGVuZXNzLCBJIGZlZWwgbGlrZSBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUg
YWxsCnRoZSBleHRlbnNpb25zIChidW5kbGVzIG9yIG5vdCkgdmlzaWJsZSBpbiB0aGUgcmlzY3Zf
aXNhX2V4dC4KCkFueSBvYmplY3Rpb24gPwoKQ2zDqW1lbnQKCj4gCj4gQ2zDqW1lbnQKPiAKPj4K
Pj4gLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
