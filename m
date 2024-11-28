Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE61D690E3
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Mn6636NRROERNeMgBUDvFk5L3rFohkzNb+cnL8MrpI=; b=Um2kExuaZwKI9b
	1vWA8sDeKkxAtnwYp1haRJaMtRX0LKRFkSjEXDGGMoO0PZDxkchTzTXuUXqQzXTOdql8MTaIzFmmx
	edirN9sh4K0ksH82j7LyWY3D29HcmBI6INx0k2dz4X/2XYrOV4+JdAqDHmzs73fUOAwAv6rfDWpUt
	s8datkBJVhkSUOD6W1ojJIGbRe2bq2r/ywvmuQ1qFdckXTpC7dyQ5KP9vqKEBNBZoM8JueiTU6ncz
	cDJn4NsQPtFNS3XPpFDgiNBJ0QVXJ0fr80Tg6Y+42Nc97JWQ8kGvnV2G6tZHzn2zC2ihiTzYfu2qt
	m/5BRTnxodLfEXfyS82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZ4M-0000000EtSW-3R44;
	Thu, 28 Nov 2024 07:36:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZ4J-0000000EtS4-2Ibs
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 07:36:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3823eb7ba72so353542f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 23:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732779366; x=1733384166; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnP0d5lLaGKuLe5nnz6rtVePQG9JUXHbtqcoMrzTGKk=;
        b=k8htuccCRnJjvbLlUVHqdwfI85XTFwIbc76xhmk2BDrH+5V+i4LchGAU5TcQqd4/CO
         5PxQPm8GV/L68X9zHR9zcODBjqqVwxG6lqHbQXebKsHRG/yY1dZkGQi0u+6w7DWHqNpF
         uVpmErqYru33dMerK++MupPYmzjmFYNiAOSssUZoVZgXEO7MgWHnXmoKTnCXyw9IgATY
         6ZnPazNtkNmR76S0dC+ECoHIONPMlTC9w0A9kLzmjX52tE+3kIvOoR6hUz0m72s0Rwfn
         yJ09JtjxUBDFxEZI5AC7Fz+c7u24VoObrxTXO8w19MmyxsxrvOHKXNPVcWHNrx/van8L
         9a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732779366; x=1733384166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnP0d5lLaGKuLe5nnz6rtVePQG9JUXHbtqcoMrzTGKk=;
        b=VUlVoPRH/+4F2JAkdVtBcKI+Hjdqsdt+cPgYxB1ekUgwNjV/PBAEIspRmF0YhjbijR
         dnxCV0tVB9c2iE450aHCwvVj01ETJPT4pTIGhb1PY2eV+CoylbTGJvTtV3LWeEK3eAnT
         uaLoTtidser8apaVt2+kESj8SM9RxyJBRieyOW1viExH2rud3Bia/1ilM8jM1jkGS31Z
         nm8CZOuQZWi0wBhqaUwqwEDjIUvuTXlx35hrUFsZrDtoB0wtACGwvHuaG8syB6vBxkMu
         gx3TlvxIVWiL3VVCUSe6Wm4O0SA2XzT9tSQ6RbWV74LfYQKxUhe5cGOLD2JC8Pf5kNnc
         tIIw==
X-Forwarded-Encrypted: i=1; AJvYcCXM07TQRa7WkrlA3mVSYAt1rAvfdrl6DubXDe8ubaEdEXMKnCZWv8Y7CbMb8uax9MxRpDHM5ihk6s6bog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzJuzkbX99xtWOOjUuIluF4JXSyvkn/IQHBvZhNNuXzljOOB1x
	OTM4dtsrpLDXtbzyxPCMKVLBkJz0j7Borab+AxgGsmytrj6ZnUr89EudVv1rv3k=
X-Gm-Gg: ASbGnctRwY89/XoySq2QfIbSVJGR2uziAsToSqOTX28eSZlMMS/4NsWv8s2SojgWRSa
	Owi2zKXmOVFGN7NM5Fw62kJt9JLxC5uf6U20xtqj5mj2lDCOsLMkMmIbO9wtn6V2dxb+6BJ2OsK
	Ukgqrflna26rDHbsfoV37DzGY8VhJE+aKDxe6DXJ6AgoB86Fy9Khrki+FjZc/vAewXW9KBtB7HK
	YuP6CJqZQOM0qp46Fr9/3QrWU1KJxZwiCrIDB7nI6ezIqidAtuSnAn4l9tiCIheEdQOc9we5GwE
	hx2YgNY3LmvXhtMWPA4=
X-Google-Smtp-Source: AGHT+IF3J7odguyMKE1/ovbU5qS7/OmybMDWgQ8ajnj5B4Q2mJyalCBlUl0W8XhZiD/NB2/U6PEc/Q==
X-Received: by 2002:a05:6000:1865:b0:382:4a3b:5139 with SMTP id ffacd0b85a97d-385c6ef598emr4607072f8f.59.1732779365868;
        Wed, 27 Nov 2024 23:36:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d22d4sm43904045e9.27.2024.11.27.23.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 23:36:05 -0800 (PST)
Message-ID: <ba0f252c-345e-4988-8d4f-36116708f19e@rivosinc.com>
Date: Thu, 28 Nov 2024 08:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: module: use a plain variable for list_head
 instead of a pointer
To: laokz <zhangkai@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20241127142519.3038691-1-cleger@rivosinc.com>
 <980b98978ab4ee912b37cb101ad43bce20b56dcb.camel@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <980b98978ab4ee912b37cb101ad43bce20b56dcb.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_233607_796289_58CC0C75 
X-CRM114-Status: GOOD (  18.87  )
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

CgpPbiAyOC8xMS8yMDI0IDAyOjAxLCBsYW9reiB3cm90ZToKPiBPbiBXZWQsIDIwMjQtMTEtMjcg
YXQgMTU6MjUgKzAxMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4gcmVsX2hlYWQncyBsaXN0
X2hlYWQgbWVtYmVyLCByZWxfZW50cnksIGRvZXNuJ3QgbmVlZCB0byBiZSBhbGxvY2F0ZWQsCj4+
IGl0cyBzdG9yYWdlIGNhbiBqdXN0IGJlIHBhcnQgb2YgdGhlIGFsbG9jYXRlZCByZWxfaGVhZC4g
UmVtb3ZlIHRoZQo+IAo+IE9oIG15IHBvb3IgRW5nbGlzaC4gT0ssIGl0J3MgbW9yZSBiZXR0ZXIg
dGhhbiBqdXN0IGFkZCB0aGUgbG9zdCBrZnJlZS4KPiAKPj4gcG9pbnRlciB3aGljaCBhbGxvd3Mg
dG8gZ2V0IHJpZCBvZiB0aGUgYWxsb2NhdGlvbiBhcyB3ZWxsIGFzIGFuCj4+IGV4aXN0aW5nCj4+
IG1lbW9yeSBsZWFrIGZvdW5kIGJ5IEthaSBaYW5nIHVzaW5nIGttZW1sZWFrLgo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgWmhhbmcK
PiAKPiBCVFcuIERvZXNuJ3QgaXQgbmVlZCBhIGZpeGVzIHRhZyBsaWtlIHdoYXQgeW91IHN1Z2dl
c3RlZD8gKFRoZSBidWcKPiBtaWdodCBjb21lIGZyb20gNi43KQoKSGV5IEthaSwKCkFwb2xvZ2ll
cyBmb3IgbWlzc3BlbGxpbmcgeW91ciBuYW1lLCBJJ2xsIGZpeCB0aGF0ICEKClRoYXQncyBhIGdv
b2QgcXVlc3Rpb24sIEkgZ3Vlc3MgSSBjb3VsZCBoYXZlIGFkZGVkIGl0IGluZGVlZCBidXQgc2lu
Y2UKaXQgd2FzIHJhdGhlciBhIHJld29yaywgSSBsZWZ0IGl0IG91dC4gQnV0IGl0J3MgcHJvYmFi
bHkgYmV0dGVyIHRvIGFkZAppdCBhbnl3YXkuIEknbGwgc2VuZCBhIFYzIHdpdGggdGhlIEZpeGVz
IHRhZyBhcyB3ZWxsIGFzIGZpeGluZyB5b3VyIG5hbWUKc3BlbGxpbmcuCgpUaGFua3MsCgpDbMOp
bWVudAoKPiAKPj4KPj4gUmVwb3J0ZWQtYnk6IEthaSBaaGFuZyA8emhhbmdrYWlAaXNjYXMuYWMu
Y24+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Cj4+IC0tLQo+Pgo+PiBWMjoKPj4gwqAtIEFkZCBLYWkgUmVwb3J0ZWQtYnkKPj4gwqAtIFJld29y
ZCB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIChBbmRyZXcpCj4+Cj4+IC0tLQo+PiDCoGFyY2gvcmlz
Y3Yva2VybmVsL21vZHVsZS5jIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tCj4+IMKgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5j
Cj4+IGluZGV4IDFjZDQ2MWYzZDg3Mi4uNDdkMGViZWVjOTNjIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUu
Ywo+PiBAQCAtMjMsNyArMjMsNyBAQCBzdHJ1Y3QgdXNlZF9idWNrZXQgewo+PiDCoAo+PiDCoHN0
cnVjdCByZWxvY2F0aW9uX2hlYWQgewo+PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGhsaXN0X25v
ZGUgbm9kZTsKPj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IGxpc3RfaGVhZCAqcmVsX2VudHJ5Owo+
PiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbGlzdF9oZWFkIHJlbF9lbnRyeTsKPj4gwqDCoMKgwqDC
oMKgwqDCoHZvaWQgKmxvY2F0aW9uOwo+PiDCoH07Cj4+IMKgCj4+IEBAIC02MzQsNyArNjM0LDcg
QEAgcHJvY2Vzc19hY2N1bXVsYXRlZF9yZWxvY2F0aW9ucyhzdHJ1Y3QgbW9kdWxlCj4+ICptZSwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbG9jYXRp
b24gPSByZWxfaGVhZF9pdGVyLT5sb2NhdGlvbjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHJlbF9lbnRy
eV9pdGVyLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVsX2Vu
dHJ5X2l0ZXJfdG1wLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZWxfaGVhZF9pdGVyLQo+Pj4gcmVsX2VudHJ5LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAmcmVsX2hlYWRfaXRlci0KPj4+IHJlbF9lbnRyeSwKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhlYWQpIHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGN1cnJfdHlw
ZSA9IHJlbF9lbnRyeV9pdGVyLT50eXBlOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVsb2NfaGFuZGxlcnNbY3Vycl90
eXBlXS5yZWxvY19oYW5kbAo+PiBlcigKPj4gQEAgLTcwNCwxNiArNzA0LDcgQEAgc3RhdGljIGlu
dCBhZGRfcmVsb2NhdGlvbl90b19hY2N1bXVsYXRlKHN0cnVjdAo+PiBtb2R1bGUgKm1lLCBpbnQg
dHlwZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIC1FTk9NRU07Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+PiDC
oAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVsX2hlYWQtPnJlbF9lbnRyeSA9
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga21hbGxv
YyhzaXplb2Yoc3RydWN0IGxpc3RfaGVhZCksCj4+IEdGUF9LRVJORUwpOwo+PiAtCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJlbF9oZWFkLT5yZWxfZW50cnkpIHsKPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJlZShlbnRy
eSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga2Zy
ZWUocmVsX2hlYWQpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRU5PTUVNOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
fQo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJTklUX0xJU1RfSEVBRChy
ZWxfaGVhZC0+cmVsX2VudHJ5KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoElO
SVRfTElTVF9IRUFEKCZyZWxfaGVhZC0+cmVsX2VudHJ5KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZWxfaGVhZC0+bG9jYXRpb24gPSBsb2NhdGlvbjsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJTklUX0hMSVNUX05PREUoJnJlbF9oZWFkLT5ub2RlKTsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWN1cnJlbnRfaGVhZC0+Zmly
c3QpIHsKPj4gQEAgLTcyMiw3ICs3MTMsNiBAQCBzdGF0aWMgaW50IGFkZF9yZWxvY2F0aW9uX3Rv
X2FjY3VtdWxhdGUoc3RydWN0Cj4+IG1vZHVsZSAqbWUsIGludCB0eXBlLAo+PiDCoAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWJ1Y2tldCkg
ewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKga2ZyZWUoZW50cnkpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJlZShyZWxfaGVhZC0+cmVsX2Vu
dHJ5KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGtmcmVlKHJlbF9oZWFkKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVN
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4+
IEBAIC03MzUsNyArNzI1LDcgQEAgc3RhdGljIGludCBhZGRfcmVsb2NhdGlvbl90b19hY2N1bXVs
YXRlKHN0cnVjdAo+PiBtb2R1bGUgKm1lLCBpbnQgdHlwZSwKPj4gwqDCoMKgwqDCoMKgwqDCoH0K
Pj4gwqAKPj4gwqDCoMKgwqDCoMKgwqDCoC8qIEFkZCByZWxvY2F0aW9uIHRvIGhlYWQgb2YgZGlz
Y292ZXJlZCByZWxfaGVhZCAqLwo+PiAtwqDCoMKgwqDCoMKgwqBsaXN0X2FkZF90YWlsKCZlbnRy
eS0+aGVhZCwgcmVsX2hlYWQtPnJlbF9lbnRyeSk7Cj4+ICvCoMKgwqDCoMKgwqDCoGxpc3RfYWRk
X3RhaWwoJmVudHJ5LT5oZWFkLCAmcmVsX2hlYWQtPnJlbF9lbnRyeSk7Cj4+IMKgCj4+IMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gMDsKPj4gwqB9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
