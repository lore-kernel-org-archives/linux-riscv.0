Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8878AC531DF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqzljcJ+cwtH0m49Gj3rmFEBAK/uKvyltUXcdE8Glpk=; b=NE8Q6qCFpbc143
	5X1YClIm9t2h7DkHtgv0w5SaVwykdd+PnE2CpR4hnVVyWQwbKn3X56QeOtKAuM9aPig8zYyhxq6FQ
	NtHSJoxbz4SnbKU+UvWDr0IhYcm3zmI6klM4lUS5mR28qe2CjawJjb7et2A+erQXbcoLOxqG9Jval
	EIDU/y2FWuTMew0CKzKUY0z+RjHCvJkfXePVIcx0TyU8LusNlbL0fV77UDRSEitwS5iBPkntCNJUq
	5V9g1byz8iFSJ3URZCpgXSy9zkTnEBR7wCpJIngLeft19YH1paVflP4LdLP+7lpNU7JSq0JFkl+nN
	IVFABEaRLDiOfeMnn0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMaN-00000004vrY-3iW3;
	Tue, 20 Aug 2024 10:59:35 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMXu-00000004vUF-2lKE
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 10:57:05 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-8223685fbe9so263115739f.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 03:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724151421; x=1724756221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9KVEQdhyyAo4Un7hmmWmcdbUoZrm1lWEAKevA08iqI=;
        b=VjTttwCuUd96wdt3gYG9emhls23db52tXwhdJBArKqfj0dWo9bO55UGSxpfavZ1Dyb
         wNNTCGYBT2o1YohXDkCXPC099c4lBEZWus+ufTTUpkWEcwrn+ZUiYf4TGvDicJr0jkJM
         stjmcZ2LXayXUI3bFjnFKO3JpLKWBvV7sh5gRjePDTg89LX8kCJKd3htstPzI0aIoeFD
         ZQMy1auU0yBGD0/q6ms0vgzbTgZ5B/eEomD2hcjeMHPsXB3vRufzWn3HQ6cf3KpGAJNJ
         uTe/sbwB76zDjdm2TB8+KqlWzftKyjvOxaOCmFLnOL5nFjNZVHZo+Vo7Swu1yOsK1Iy0
         JTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724151421; x=1724756221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9KVEQdhyyAo4Un7hmmWmcdbUoZrm1lWEAKevA08iqI=;
        b=kXpy6Wg5DHDneoCBEXUxf46vZ9TLpexGhON0FYqToo8XRloNBHu9ImDo2JmBVO1K7u
         CnOWN+D6brzOtd32lH0SUTKja2fd8arYcL5tY1d5S80AIvQyCKWaAffuZRU0tF6xualR
         j8eTEX9v7O+15WVKcp9mjDNntpCvdaSX/FCwaCLSf4dGAc8pGCrUriWjxUfvCudVyRVh
         AP90/DrV+VCnW/invWpNRQ0SqyoxzwjD6BzuYWiPmqsORVTjuxSYydZuRSFuWWxpi+69
         iRcvejU2S2N0T3W/sUTrJSVclGuSdTmGAqpSVnrrwCOFzRqqp8jFpNvqDvjYaV1Vzlmk
         bpwg==
X-Forwarded-Encrypted: i=1; AJvYcCU4aN7l3eASd8sJCQHAlyCX0rLks8iAL/9ux+CYxWQdeB4cWyWmQjZENgf65tRYjyqsqbgALOr3wfQz0M0yrttAL39bkLvDSbdRMdRuN2a5
X-Gm-Message-State: AOJu0Ywk//A4VnU5xoPKneQCZLXpTTpTGc7CJgaNkRoy7GvLhNF3U1cu
	aXx5ozz8RdyzojSB2FYg47cpjBUvTuIIn1nqhInrnSKBmy9dLsVTSjI104uW4dzvR0KQhak3Z0S
	GbXnE2yZn+hy6NdmIyQDw44mUiqS+mPc12lkOzQ==
X-Google-Smtp-Source: AGHT+IF2qDXSD4GVokjV6QN9az33dHDjsKXPFgDYvoXoazydu4xSf7m7DCbKo2VqzmL8osOIuRjyhQlDzHCItoRiOOw=
X-Received: by 2002:a05:6e02:1986:b0:39d:637f:97cd with SMTP id
 e9e14a558f8ab-39d637f9a2cmr5860365ab.0.1724151421518; Tue, 20 Aug 2024
 03:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240820094023.61155-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240820094023.61155-1-krzysztof.kozlowski@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 16:26:49 +0530
Message-ID: <CAAhSdy3S_QTBzCNtj8kKDpzxtoeyKWvGLtjgSTViieWimpP-JA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cpuidle: riscv-sbi: Use scoped device node
 handling to fix missing of_node_put
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_035703_115666_06BD672A 
X-CRM114-Status: GOOD (  20.18  )
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMzoxMOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUd28gcmV0dXJuIHN0YXRl
bWVudHMgaW4gc2JpX2NwdWlkbGVfZHRfaW5pdF9zdGF0ZXMoKSBkaWQgbm90IGRyb3AgdGhlCj4g
T0Ygbm9kZSByZWZlcmVuY2UgY291bnQuICBTb2x2ZSB0aGUgaXNzdWUgYW5kIHNpbXBsaWZ5IGVu
dGlyZSBlcnJvcgo+IGhhbmRsaW5nIHdpdGggc2NvcGVkL2NsZWFudXAuaC4KPgo+IEZpeGVzOiA2
YWJmMzJmMWQ5YzUgKCJjcHVpZGxlOiBBZGQgUklTQy1WIFNCSSBDUFUgaWRsZSBkcml2ZXIiKQo+
IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+CgpMR1RNLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+
Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYyOgo+IDEuIFJlLXdyaXRlIGNvbW1pdCBtc2csIGJlY2F1
c2UgdGhpcyBpcyBhY3R1YWxseSBhIGZpeC4KPiAtLS0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlk
bGUtcmlzY3Ytc2JpLmMgfCAyMSArKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRs
ZS1yaXNjdi1zYmkuYwo+IGluZGV4IGE2ZTEyM2RmZTM5NC4uNWJiMzQwMTIyMGQyIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gKysrIGIvZHJpdmVy
cy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiBAQCAtOCw2ICs4LDcgQEAKPgo+ICAjZGVm
aW5lIHByX2ZtdChmbXQpICJjcHVpZGxlLXJpc2N2LXNiaTogIiBmbXQKPgo+ICsjaW5jbHVkZSA8
bGludXgvY2xlYW51cC5oPgo+ICAjaW5jbHVkZSA8bGludXgvY3B1aG90cGx1Zy5oPgo+ICAjaW5j
bHVkZSA8bGludXgvY3B1aWRsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvY3B1bWFzay5oPgo+IEBA
IC0yMzYsMTkgKzIzNywxNiBAQCBzdGF0aWMgaW50IHNiaV9jcHVpZGxlX2R0X2luaXRfc3RhdGVz
KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgewo+ICAgICAgICAgc3RydWN0IHNiaV9jcHVpZGxlX2Rh
dGEgKmRhdGEgPSBwZXJfY3B1X3B0cigmc2JpX2NwdWlkbGVfZGF0YSwgY3B1KTsKPiAgICAgICAg
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqc3RhdGVfbm9kZTsKPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqY3B1X25vZGU7Cj4gICAgICAgICB1MzIgKnN0YXRlczsKPiAgICAgICAgIGludCBpLCBy
ZXQ7Cj4KPiAtICAgICAgIGNwdV9ub2RlID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+
ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpjcHVfbm9kZSBfX2ZyZWUoZGV2aWNlX25vZGUp
ID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+ICAgICAgICAgaWYgKCFjcHVfbm9kZSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4KPiAgICAgICAgIHN0YXRlcyA9IGRl
dm1fa2NhbGxvYyhkZXYsIHN0YXRlX2NvdW50LCBzaXplb2YoKnN0YXRlcyksIEdGUF9LRVJORUwp
Owo+IC0gICAgICAgaWYgKCFzdGF0ZXMpIHsKPiAtICAgICAgICAgICAgICAgcmV0ID0gLUVOT01F
TTsKPiAtICAgICAgICAgICAgICAgZ290byBmYWlsOwo+IC0gICAgICAgfQo+ICsgICAgICAgaWYg
KCFzdGF0ZXMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gICAgICAgICAv
KiBQYXJzZSBTQkkgc3BlY2lmaWMgZGV0YWlscyBmcm9tIHN0YXRlIERUIG5vZGVzICovCj4gICAg
ICAgICBmb3IgKGkgPSAxOyBpIDwgc3RhdGVfY291bnQ7IGkrKykgewo+IEBAIC0yNjQsMTAgKzI2
Miw4IEBAIHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVfZHRfaW5pdF9zdGF0ZXMoc3RydWN0IGRldmlj
ZSAqZGV2LAo+Cj4gICAgICAgICAgICAgICAgIHByX2RlYnVnKCJzYmktc3RhdGUgJSN4IGluZGV4
ICVkXG4iLCBzdGF0ZXNbaV0sIGkpOwo+ICAgICAgICAgfQo+IC0gICAgICAgaWYgKGkgIT0gc3Rh
dGVfY291bnQpIHsKPiAtICAgICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsKPiAtICAgICAgICAg
ICAgICAgZ290byBmYWlsOwo+IC0gICAgICAgfQo+ICsgICAgICAgaWYgKGkgIT0gc3RhdGVfY291
bnQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+Cj4gICAgICAgICAvKiBJbml0
aWFsaXplIG9wdGlvbmFsIGRhdGEsIHVzZWQgZm9yIHRoZSBoaWVyYXJjaGljYWwgdG9wb2xvZ3ku
ICovCj4gICAgICAgICByZXQgPSBzYmlfZHRfY3B1X2luaXRfdG9wb2xvZ3koZHJ2LCBkYXRhLCBz
dGF0ZV9jb3VudCwgY3B1KTsKPiBAQCAtMjc3LDEwICsyNzMsNyBAQCBzdGF0aWMgaW50IHNiaV9j
cHVpZGxlX2R0X2luaXRfc3RhdGVzKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgICAgICAgIC8qIFN0
b3JlIHN0YXRlcyBpbiB0aGUgcGVyLWNwdSBzdHJ1Y3QuICovCj4gICAgICAgICBkYXRhLT5zdGF0
ZXMgPSBzdGF0ZXM7Cj4KPiAtZmFpbDoKPiAtICAgICAgIG9mX25vZGVfcHV0KGNwdV9ub2RlKTsK
PiAtCj4gLSAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICBz
dGF0aWMgdm9pZCBzYmlfY3B1aWRsZV9kZWluaXRfY3B1KGludCBjcHUpCj4gLS0KPiAyLjQzLjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
