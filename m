Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74302C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLfpXbTF6ot5hUYymidHfub0zCe5wIcGu8dmDQ6mTOU=; b=c1DGWcnajjbIHV
	96YzfpIPv2tWP2wzxkW7809NrpdmqCWM8oIM/Bg+Hg7hweg++BsiN9sh/6ggLeD9qpAQHWhEGNoaZ
	8Vg/QpjDuO+X5LcFBDEuiMKvQ0gcNIuRVClSMdisOclh3JDLTcPrei2SkOUq7M0blLLTK8Xkh2we6
	Qmrctn9Hv+dHlnVyReP/5Cx7zSAbxVTonIaQ1CWQCaWuAIdOzyVr9ME71Nip2txYcvvu7hx2QE/p6
	gMXntrtjG3SpMPB2HoDx0ukgMoPS3ZbN4fJQe1B2Fi1nGUQ3C0Fs0S3pA/f1zcmVHq3YgskaCVQ/J
	H6B3cDoPxYITgxuaV/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOb1-00000008lT9-38bF;
	Mon, 12 May 2025 08:33:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOW4-00000008kUX-189P
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:28:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-441ab63a415so40965285e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747038482; x=1747643282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GHu16VagS4Zo0QZx5ctfJMlX1e+tH9PDkYdamiUkNk=;
        b=1zxHXBx0HYLmiTCfDXi8mIKmKHvQltDxwyCPQweIWG3UgHyYg7U43yeh45WnBj1GOm
         VfvL2qBTg6mTfjoHRZDE63cYVnme7G0+1kNAzhDEIuB8FyuksHXuMciCbBEv6chG4gvA
         B5aVakIZwhB3n7wEPUcqkB8biiO24sgosyQ3YLauCIp/XSgLHBGwSU7krzUsLfQZa69l
         YWjiTFwvccyJ3Q+efZvJuQBE9d6GlRLRuS1lsmbg0/Q5AxHEYKZs7PR+e5OIwT9Jx9cV
         XKN+55dSfyGIVw6syLyePklapf31Mo7S9pU8cQ6zKyaoi51diXrvhZH6j13ywaarLZhu
         qAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038482; x=1747643282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GHu16VagS4Zo0QZx5ctfJMlX1e+tH9PDkYdamiUkNk=;
        b=VQJsmSXm5wkxoGprY4ZE+sgkT2t4LqNJiyIcbfqmTkKZYNDrlwMSq4UZ27So4jgBK5
         tMyOij6cH+dwjgRPdAGMi8EvbFT1yZBYhBaDLshktBtoiAu3lY2luyZvxI2kSvxfTkyj
         NpVvW0gfTp2tPq3OC0U1As2Z8SYkUwLFNj29dH5BAU0AyE+wnFeST11RvQzRoldqQJR0
         Aq0N7gnYL7F8D/+tWeVXrX6Tjd6kyidhP3IMGkInmtZY0fZb6nERuya2DVBKXk7M2wY3
         pSZBesbY9+0YkCOgo5OEtzn5wEa2UPGwZlhFIQlgRysRx7alqi+CCziPKyIbqbdi1mC+
         ieoA==
X-Forwarded-Encrypted: i=1; AJvYcCWAQHpV92BxJUeoYOzIZcpmUMBaJYuN7QWykR/GGzsxraTBGjmKIEjmZqGtjXaiOXKd2PtMVtW9Bs3tcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDQDI1wkjH4RCdLaZMl71KAr6ZkmHfrTk45Wb+WXhryHtsagpp
	Xc1YiL2WXmKQib2osFR3qfkzB7pZq6QasWpFxrF7u/8Q/Rsxv1ZqT9lTIgveCJ0=
X-Gm-Gg: ASbGncv4liSFqq3flk0kEd3lEt8MtSNf7LBzlN48EKUX5QY5aHtrz8snV81PEmVwjp4
	5FhyZolyd/qHp/RO6vAdfATBj6/xFh9TCvkuGDXsW7VXbzhDJtDSRxBRhOvqPA5cdBIDxvSVyKI
	G9t5GF2B6ruWEQnDw1OljEuUIA7tZDLZHjk0HTg790vrN5k5FSW1pAkHWbGvQ9NcHRg5XfduRGX
	Tmu8QAOgpE+zM3X7Bi5lWZzwbM1izVOOL53iAMwJKq+th+ExfVs0rAzoe1tknjFs3TAN0wbXdtT
	3q4GQPcYUUg4xghM6lOaTQCTCcvYM5ap0alg5B8j0VjgkTqRKaoOS+W/s0azmwJ6PS201iy9pxc
	kD2PIZYuNCtg4TLvyb7+4
X-Google-Smtp-Source: AGHT+IF3cuftk1+itln34hyUlsyO+lAZrtrkx94Wsxfu0ogw4IibSZyT4oEk1i1ctGEF1Ke0Xxw6Ig==
X-Received: by 2002:a05:6000:2410:b0:3a0:7a5d:96f6 with SMTP id ffacd0b85a97d-3a1f64b5850mr10211716f8f.38.1747038482577;
        Mon, 12 May 2025 01:28:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2ab2sm11460379f8f.46.2025.05.12.01.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:28:02 -0700 (PDT)
Message-ID: <67896719-5cbc-4bf6-8b00-3b785940952f@rivosinc.com>
Date: Mon, 12 May 2025 10:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: Atish Patra <atish.patra@linux.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
 <20250424173204.1948385-15-cleger@rivosinc.com>
 <87b2eade-acda-428e-81af-d4927e517ebe@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <87b2eade-acda-428e-81af-d4927e517ebe@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_012804_511727_0F3C1C46 
X-CRM114-Status: GOOD (  17.17  )
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

CgpPbiAwOS8wNS8yMDI1IDIwOjA5LCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiA0LzI0LzI1IDEw
OjMyIEFNLCBDbMODwqltZW50IEzDg8KpZ2VyIHdyb3RlOgo+PiBTQklfRldGVF9NSVNBTElHTkVE
X0RFTEVHIG5lZWRzIGhlZGVsZWcgdG8gYmUgbW9kaWZpZWQgdG8gZGVsZWdhdGUKPj4gbWlzYWxp
Z25lZCBsb2FkL3N0b3JlIGV4Y2VwdGlvbnMuIFNhdmUgYW5kIHJlc3RvcmUgaXQgZHVyaW5nIENQ
VQo+PiBsb2FkL3B1dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgo+PiBSZXZpZXdlZC1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAzICsrKwo+PiDCoCBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCAzNiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwg
MzkgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4+IGluZGV4IDU0Mjc0N2UyYzdmNS4uZDk4ZTM3OTk0
NWMzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCj4+IEBAIC02NDYsNiArNjQ2LDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1
X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCB2b2lkICpu
c2g7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2gu
Z3Vlc3RfY3NyOwo+PiArwqDCoMKgIHN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1
LT5hcmNoLmNmZzsKPj4gwqAgwqDCoMKgwqDCoCB2Y3B1LT5jcHUgPSAtMTsKPj4gwqAgQEAgLTY3
MSw2ICs2NzIsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnN0dmFsID0gbmFjbF9jc3JfcmVhZChuc2gs
IENTUl9WU1RWQUwpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3NyLT5odmlwID0gbmFjbF9jc3Jf
cmVhZChuc2gsIENTUl9IVklQKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnNhdHAgPSBu
YWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX1ZTQVRQKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGNmZy0+aGVk
ZWxlZyA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSEVERUxFRyk7Cj4+IMKgwqDCoMKgwqAgfSBl
bHNlIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnNzdGF0dXMgPSBjc3JfcmVhZChDU1Jf
VlNTVEFUVVMpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3NyLT52c2llID0gY3NyX3JlYWQoQ1NS
X1ZTSUUpOwo+PiBAQCAtNjgxLDYgKzY4Myw3IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wdXQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3NyLT52c3R2YWwgPSBj
c3JfcmVhZChDU1JfVlNUVkFMKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+aHZpcCA9IGNz
cl9yZWFkKENTUl9IVklQKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnNhdHAgPSBjc3Jf
cmVhZChDU1JfVlNBVFApOwo+PiArwqDCoMKgwqDCoMKgwqAgY2ZnLT5oZWRlbGVnID0gY3NyX3Jl
YWQoQ1NSX0hFREVMRUcpOwo+IAo+IENhbiB3ZSBhdm9pZCBzYXZpbmcgaGVkZWxlZyBpbiB2Y3B1
X3B1dCBwYXRoIGJ5IHVwZGF0aW5nIHRoZSBjZmctCj4+aGVkZWxlZyBpbiBrdm1fc2JpX2Z3ZnRf
c2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbi4KPiAKPiBXZSBhbHJlYWR5IHVwZGF0ZSB0aGUgaGVk
ZWxlZyBpbiB2Y3B1X2xvYWQgcGF0aCBmcm9tIGNmZy0+aGVkZWxlZy4KPiBJZiB0aGUgbmV4dCB2
Y3B1IGRpZCBub3QgZW5hYmxlIGRlbGVnYXRpb24gaXQgd2lsbCBnZXQgdGhlIGNvcnJlY3QKPiBj
b25maWcgd3JpdHRlbiB0byBoZWRlbGVnLgoKWWVhaCB0aGF0IG1ha2Ugc2Vuc2UsIEknbGwgbW9k
aWZ5IHRoYXQuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBUaGlzIHdpbGwgc2F2ZSB1cyBhIGNz
ciByZWFkIGNvc3QgaW4gZWFjaCBWTSBleGl0IHBhdGggZm9yIHNvbWV0aGluZwo+IHRoYXQgaXMg
cHJvYmFibHkgY29uZmlndXJlZCBvbmNlIGluIGd1ZXN0IGxpZmUgdGltZS4+Cj4+IMKgwqDCoMKg
wqAgfQo+PiDCoCB9Cj4+IMKgIGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS8KPj4gdmNwdV9zYmlfZndmdC5jCj4+IGluZGV4IGIwZjY2
YzdiZjAxMC4uZDE2ZWU0NzcwNDJmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9md2Z0LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+IEBA
IC0xNCw2ICsxNCw4IEBACj4+IMKgICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4+IMKg
ICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaD4KPj4gwqAgKyNkZWZpbmUgTUlTX0RF
TEVHIChCSVRfVUxMKEVYQ19MT0FEX01JU0FMSUdORUQpIHwKPj4gQklUX1VMTChFWENfU1RPUkVf
TUlTQUxJR05FRCkpCj4+ICsKPj4gwqAgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJlIHsKPj4g
wqDCoMKgwqDCoCAvKioKPj4gwqDCoMKgwqDCoMKgICogQGlkOiBGZWF0dXJlIElECj4+IEBAIC02
OCw3ICs3MCw0MSBAQCBzdGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51
bQo+PiBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKPj4gwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2Rl
bGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdAo+PiBrdm1fdmNwdSAqdmNwdSkKPj4gK3sKPj4gK8Kg
wqDCoCByZXR1cm4gbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUoKTsKPj4gK30KPj4gKwo+
PiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3Ry
dWN0IGt2bV92Y3B1Cj4+ICp2Y3B1LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZhbHVlKQo+PiArewo+
PiArwqDCoMKgIGlmICh2YWx1ZSA9PSAxKQo+PiArwqDCoMKgwqDCoMKgwqAgY3NyX3NldChDU1Jf
SEVERUxFRywgTUlTX0RFTEVHKTsKPj4gK8KgwqDCoCBlbHNlIGlmICh2YWx1ZSA9PSAwKQo+PiAr
wqDCoMKgwqDCoMKgwqAgY3NyX2NsZWFyKENTUl9IRURFTEVHLCBNSVNfREVMRUcpOwo+PiArwqDC
oMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07
Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gU0JJX1NVQ0NFU1M7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRp
YyBsb25nIGt2bV9zYmlfZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1f
dmNwdQo+PiAqdmNwdSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4+ICt7Cj4+ICvCoMKg
wqAgKnZhbHVlID0gKGNzcl9yZWFkKENTUl9IRURFTEVHKSAmIE1JU19ERUxFRykgPT0gTUlTX0RF
TEVHOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIFNCSV9TVUNDRVNTOwo+PiArfQo+PiArCj4+IMKg
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsK
Pj4gK8KgwqDCoCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTQklfRldGVF9NSVNBTElHTkVE
X0VYQ19ERUxFRywKPj4gK8KgwqDCoMKgwqDCoMKgIC5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zZXQg
PSBrdm1fc2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4gK8KgwqDCoMKgwqDC
oMKgIC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4gK8Kg
wqDCoCB9LAo+PiDCoCB9Owo+PiDCoCDCoCBzdGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25m
aWcgKgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
