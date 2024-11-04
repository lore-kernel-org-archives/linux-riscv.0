Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F245D132B5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXL42/GjNPJMUMkl7jAMi6kidLTRYSp8V8btQp4TIqI=; b=04tX/zdytXQ+cZ
	k/xS6shWerOWM1ri+tYwvYMHqtfmGh2X5Ge7a3KyJTOhFcEKO7vyJSYBRrY6gVVjokXan89SnsE6F
	cxK4cozN7OlzeH6edHjZ7/z/TKEx+J61jBubTIQtKa5hcbAt/Wb2tBwdZVJ06RbCNQh5QWTJ6wtua
	p5LlnfDz4arjuqIbm1VtayjWkYQiUouQzSHHooMVb6ZjA1NEf/0xqTv3YVVfEiZKKHqyKVGOGNbSo
	pGt9LHkNNnlAudurYpYDxD5IMdvypb3XQ2guho6S4zLRuX2kyh4TNKec1ZcosGco3/D17eKrjqD9V
	CQwr7EjEpWdHnyjaux+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w4s-0000000DgJn-1VOP;
	Mon, 04 Nov 2024 12:21:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vvZ-0000000DefB-2Kq1
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Nov 2024 12:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TZ56fmXjiTYLxN4xJpDGh5ZMZmSWUVoHQN6nZMrXMmc=; b=DZQdJnG2JqQquo6b1vvu9mQYRD
	L4CMy+xnZ/YUqNXUXF4SrBVw+Fa8NkOBwZu+MIvG6XUV0CuHsat6szgVo+oZBWNrDCUqPaJ2lWrA4
	ltev7G2KvxCsqv7QzjvL4NiggUM3JgWbfoVxbq+i/9qmmuW8oedUcec3EJkLt55HQyZGPzAVcXM40
	WOhlqDbuVUMLgAID4JQsiWS7LaO2CbUD05tEsU+Te7LiVR5qbMC/MoJPirJz9jeUM4en8FMf5Zs6R
	3ntCFrHUzOCzTdwvkq9h2ylNeEGoYtqNHv8IcjA6pdyp1hsePW0E1xhLS5UQTri56T7p0hPIsiVEa
	60HZ2a4A==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vvW-0000000BJcQ-0owh
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 12:11:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso31938655e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 04:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730722279; x=1731327079; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZ56fmXjiTYLxN4xJpDGh5ZMZmSWUVoHQN6nZMrXMmc=;
        b=Iq9PlP+Gv457od9esSMcSXhFaV3JX31HaEnHOly0Wzk6o5I2DJ2yCxdKAlHE/OV1bz
         EPVLjLje20hvZL4bdJ+Be2n4a7urXHC4sO/SBHqZkXOoWvW8/Q4YMzUCTAQAEFa5gg82
         sMIkvDEaIrDlGgcAueN3efmGDqG4B0E9ULN3g9+TH1fkEZkTdSy9BXlJyOcuK5JfLw36
         Mn1aZ1Qt5cgApbdS4nB+XyKY1Aso/rkWqjbpgKj3aWDD08uVZp9ds6bEPl6KCZtZGXd1
         mfpgsifvnR1ABdJsGLIeCllI8WLhAKRPmjr8gAZwSZmyD5eUC+Gtfwrr3eoWpjPtkZAb
         mREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730722279; x=1731327079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ56fmXjiTYLxN4xJpDGh5ZMZmSWUVoHQN6nZMrXMmc=;
        b=KU2Y9rm0AyKUCVHBkyvXXwVSM/rkdRT9FAqGfo4kUuVV7KS0EoMROYuUr5qLJxe7B/
         rX8p1f+yFZi2DHVfEtSbwJrOurjUXLazN++GTfddFhNh/RjixXjsIN2/1l3uG0jP05K7
         JuL0PUJTacixpCUw9QAZCYbVqQEkCY0kNUBQcU59nwyQex+nzO6/umB4ZVw/w+1Iy4eA
         qKcT8T40VFPNMnlx8C4nAcN8OMjZuQ9T2D8yMutJr0cj1kJ1+Oedt1njnclVINUfAWSj
         a8D7dyNmRPlxd0sV/GF7VSClKFnWKyIuxM39Ls5r+Diqf0oQzx1w6HT6FeblQZqZGXWz
         yvaw==
X-Forwarded-Encrypted: i=1; AJvYcCUaZYYhTgn5BY78gLXTU7pWCzyowSV4ODwo3GilfCQAXnX7Dsy9ZPeUie7N7ndZDaV+vSExAB3cffSYyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZV+rlPx50RqYME45NxJsDR76tMiOUKkzCe0Kp8qTv+IUlCz2t
	3YNuWD6kFb5q7lWdq8qZOR/ECfd6c8owYvU3SDh/lS+96It4tnR3bDzaVvzesiw=
X-Google-Smtp-Source: AGHT+IG0KNeictXp2keg0xKTrwSw2dpZ3byLRxQUDBWwUtsFo73cuCa8JZLWaGjBv/Dn/iKV+Gzl5g==
X-Received: by 2002:a05:600c:1f0e:b0:431:5ba2:2450 with SMTP id 5b1f17b1804b1-4319ad253ecmr271545645e9.33.1730722278899;
        Mon, 04 Nov 2024 04:11:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d698144sm156541575e9.39.2024.11.04.04.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:11:18 -0800 (PST)
Message-ID: <b823ad91-af5c-43a7-bf16-78d683937e0e@rivosinc.com>
Date: Mon, 4 Nov 2024 13:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: hwprobe: export bfloat16 ISA extension
To: Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andybnac@gmail.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20241103074959.1135240-1-inochiama@gmail.com>
 <20241103074959.1135240-4-inochiama@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241103074959.1135240-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_121122_509314_80F2F836 
X-CRM114-Status: GOOD (  15.38  )
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

CgpPbiAwMy8xMS8yMDI0IDA4OjQ5LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IEV4cG9ydCBaZmJt
aW4sIFp2ZmJmbWluLCBadmZiZndtYSBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9iZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMTIgKysrKysrKysr
KysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgMyArKysKPiAg
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8ICAzICsrKwo+ICAzIGZpbGVz
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0Cj4gaW5kZXggODViNzA5MjU3OTE4Li44YzMwZGQwNmYzYzAgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gQEAgLTIzOSw2ICsyMzksMTggQEAgVGhlIGZvbGxv
d2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ICAgICAgICAgcmF0aWZpZWQgaW4gY29tbWl0IDk4OTE4
Yzg0NDI4MSAoIk1lcmdlIHB1bGwgcmVxdWVzdCAjMTIxNyBmcm9tCj4gICAgICAgICByaXNjdi96
YXdycyIpIG9mIHJpc2N2LWlzYS1tYW51YWwuCj4gIAo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfRVhUX1pGQkZNSU5gOiBUaGUgWmZiZm1pbiBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFz
Cj4gKyAgICAgICBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBmcm9t
IGNvbW1pdCA0ZGMyM2Q2MjI5ZGUKPiArICAgICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0byBC
RjE2IikuCj4gKwo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRkJGTUlOYDog
VGhlIFp2ZmJmbWluIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKPiArICAgICAgIGRlZmluZWQg
aW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDRkYzIzZDYyMjlk
ZQo+ICsgICAgICAgKCJBZGRlZCBDaGFwdGVyIHRpdGxlIHRvIEJGMTYiKS4KPiArCj4gKyAgKiA6
YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZGQkZXTUFgOiBUaGUgWnZmYmZ3bWEgZXh0ZW5z
aW9uIGlzIHN1cHBvcnRlZCBhcwo+ICsgICAgICAgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBt
YW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgNGRjMjNkNjIyOWRlCj4gKyAgICAgICAoIkFkZGVk
IENoYXB0ZXIgdGl0bGUgdG8gQkYxNiIpLgo+ICsKPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9LRVlfQ1BVUEVSRl8wYDogRGVwcmVjYXRlZC4gIFJldHVybnMgc2ltaWxhciB2YWx1ZXMgdG8K
PiAgICAgICA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfTUlTQUxJR05FRF9TQ0FMQVJfUEVS
RmAsIGJ1dCB0aGUga2V5IHdhcwo+ICAgICAgIG1pc3Rha2VubHkgY2xhc3NpZmllZCBhcyBhIGJp
dG1hc2sgcmF0aGVyIHRoYW4gYSB2YWx1ZS4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3By
b2JlLmgKPiBpbmRleCAxZTE1M2NkYTU3ZGIuLjk1ZDAwYTA2NWI0ZSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IEBAIC03Miw2ICs3Miw5IEBAIHN0cnVjdCByaXNj
dl9od3Byb2JlIHsKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNGCQkoMVVMTCA8PCA0
NikKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNNT1AJCSgxVUxMIDw8IDQ3KQo+ICAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQVdSUwkJKDFVTEwgPDwgNDgpCj4gKyNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pGQkZNSU4JKDFVTEwgPDwgNDkpCj4gKyNkZWZpbmUJCVJJU0NW
X0hXUFJPQkVfRVhUX1pWRkJGTUlOCSgxVUxMIDw8IDUwKQo+ICsjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aVkZCRldNQQkoMVVMTCA8PCA1MSkKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tF
WV9DUFVQRVJGXzAJNQo+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9X
TgkoMCA8PCAwKQo+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJ
KDEgPDwgMCkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiBpbmRleCBjZWEwY2EyYmYyYTIuLmRl
MTk2NmJkMTc3NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IEBAIC0xMzEsNiArMTMx
LDggQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAq
cGFpciwKPiAgCQkJRVhUX0tFWShaVkU2NEQpOwo+ICAJCQlFWFRfS0VZKFpWRTY0Rik7Cj4gIAkJ
CUVYVF9LRVkoWlZFNjRYKTsKPiArCQkJRVhUX0tFWShaVkZCRk1JTik7Cj4gKwkJCUVYVF9LRVko
WlZGQkZXTUEpOwo+ICAJCQlFWFRfS0VZKFpWRkgpOwo+ICAJCQlFWFRfS0VZKFpWRkhNSU4pOwo+
ICAJCQlFWFRfS0VZKFpWS0IpOwo+IEBAIC0xNDcsNiArMTQ5LDcgQEAgc3RhdGljIHZvaWQgaHdw
cm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiAgCQkJRVhUX0tFWSha
Q0QpOwo+ICAJCQlFWFRfS0VZKFpDRik7Cj4gIAkJCUVYVF9LRVkoWkZBKTsKPiArCQkJRVhUX0tF
WShaRkJGTUlOKTsKPiAgCQkJRVhUX0tFWShaRkgpOwo+ICAJCQlFWFRfS0VZKFpGSE1JTik7Cj4g
IAkJfQoKCkxvb2tzIGdvb2QgdG8gbWUgIQoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
