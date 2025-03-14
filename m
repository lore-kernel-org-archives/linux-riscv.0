Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C542C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCveO1pmpCwUXGPV9mHzMLNRIYuOA9CKRpU2uziZAxQ=; b=f2/mTg+gRk9aex
	vKzwa7QfXxdR7j5Hj7SvLgkKfwVhOPrqWVng/IOPnMAAhkj+hegVODGCe1ecmhNboy+XQsUkKzMKT
	GWICkMNF+dFCbiYjSe1kADrIfcGfr+ozRFDYSEEHk4swYEXD8JcLzQ1Dr/WS+xLTEKpdiru8F+n0u
	0v5UiztdY9SCLELHGO+rWUAYdh7XO4vcEWDlk5blrTbBi+Ph2mVWniY3rQro7kpSZD2Fp2aSwzXPY
	kVNeyvAk9ZSpPKIVSOCwLag5ywJBQVlotWJrgkm2qG6qK54FKCUnCUwucqF9C/YTdCeibx9YUIYXc
	tKnCYPydUxEuhiYFs2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt44a-0000000E9C7-0KGc;
	Fri, 14 Mar 2025 12:23:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt44W-0000000E97R-3PsB
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 12:23:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so13593545e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741955007; x=1742559807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WP6+QPN2p5r500R0hJqs0tnx9bBYWE9RADg1EjXw61M=;
        b=a5EYMQWCwRkVXcg0G9hjVe/af9P5p0cQAlNMLam48oRu/qqQbi9hFrSy0yymD1PA+o
         0yvnx0azrPpBMO6J+/HF0kK3qT0mhg62a+GtuIoZevuiub2QBZs9eK6eniSZ8sGXn6Ep
         e72Wg5NX/jGKD9XeDD0QNlZKvEkv+K2xVVhrbhcJub0/Z7Y+iBbqjamBpageigizhFtC
         kP8JAu9ZTYtx7mnQpbEJxoBXv9eVnkksXm9reeZs1jTMavvvDbXIX1g5pIeNltyR9Zct
         PwG3qd9Qs2p3NousoBEBdQTolJH3ypNOf8IgTl8xChBI+o7XjPiOIolj8zVQ9OEoe3gq
         K1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741955007; x=1742559807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WP6+QPN2p5r500R0hJqs0tnx9bBYWE9RADg1EjXw61M=;
        b=EnIICGTvlenCc8vqrUvS8t1zu9ASzSWblWkg6CLiJ/ZG/4CJcTazgBx4XB/MKG9ZPy
         RpKgxBmcUAZuiRZ0jfCcGxpMX4Dcz+cVUnQ1QF+SNvoqeGy0N5g4heDRMusoFrvIt0Uq
         WhpdkkuxviFDFeP1KIkJ2MANYSOIKfzO8eivzEnClIsJ5vg9yVGhPxuj2ILbs/6Kp77f
         GzoMsW++9STxU1oj8q0ijxWbd2aYsZV9QtW/cr41aMVeKEIsKqCgY2qHd0UZZlnl002w
         QIjof8k7soWvp8ENXfVjMExL6auwkVSJuhbLfApN6i/EGznwm8L3TPV1r0o9n9c4wAmL
         uoWA==
X-Forwarded-Encrypted: i=1; AJvYcCW5EuaTW2peRcb5I7LTR/HzTrwB2TCVmlZXBd2VpLtHbG73dtd1F39Jcz8IjAgyyVY1hrUMdr0Pi5SvXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw++dscdVXyNrrDJwPTPkun8a+iQ3iGuO2utNn87HJCwMSFUaGE
	i9T2WgrXhz9MhGbDFQMWP4lSi1+PZNGs7KYuUpk5nmDEhPugpI8QY7ud3CV5hu4=
X-Gm-Gg: ASbGncucbkqEwrQDSz3yOTSydjm+Neco0IHRvyR2s6rBsPY6U9sqsoT0VcWrzVMGhtr
	6VwW8cqXHMpImYaXPe49ryGHOiRzHxREPk3iOAZVuuvv5BOb0nC0TzcREujLZbCOmTM+qixL3Yd
	ZOpa7cvkfkId/PUo+FavYx3y1oflF98YIfC03kdABtNJiWWVTDy6bSVXpIn1t7T0zct1x+V65c4
	cSwLxMcJvzQMK+ACVngZaD/G4ZN4LdxeDE5qQ6RcpcEkL3bhdotkBdcUCn+glNFvi7heCwW/RN4
	Op2uqpSvett4EntXlvoBo1/1/R9MB5LIkl9Z6VqQrbRkecpJtJKBcZruXQo+RI/+8z0QwvrI+d+
	8cx71dXaW+0/T+Q==
X-Google-Smtp-Source: AGHT+IECzef4MEIZSEOP5RVqxJ+PV0zddyhXW52CcNjDzrN5wKIHRVBzHv0+gxm6G7pjP8xbxVlCBQ==
X-Received: by 2002:a05:600c:218b:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43d1ef4a5bbmr28499645e9.13.1741955007236;
        Fri, 14 Mar 2025 05:23:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe60b46sm15737925e9.32.2025.03.14.05.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 05:23:26 -0700 (PDT)
Message-ID: <8990d87e-b46e-4c1e-b337-a954563f6474@rivosinc.com>
Date: Fri, 14 Mar 2025 13:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-3-cleger@rivosinc.com>
 <20250313-5c22df0c08337905367fa125@orel>
 <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>
 <20250314-10d8d58329aceac21e727ebe@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250314-10d8d58329aceac21e727ebe@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_052328_859176_4C4AD9F8 
X-CRM114-Status: GOOD (  27.95  )
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

CgpPbiAxNC8wMy8yMDI1IDEzOjAyLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBNYXIg
MTQsIDIwMjUgYXQgMTI6MzM6NTVQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxMy8wMy8yMDI1IDEzOjM5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBNb24s
IE1hciAxMCwgMjAyNSBhdCAwNDoxMjowOVBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4gVGhpcyBTQkkgZXh0ZW5zaW9ucyBlbmFibGVzIHN1cGVydmlzb3IgbW9kZSB0byBjb250
cm9sIGZlYXR1cmUgdGhhdCBhcmUKPj4+PiB1bmRlciBNLW1vZGUgY29udHJvbCAoRm9yIGluc3Rh
bmNlLCBTdmFkdSBtZW52Y2ZnIEFEVUUgYml0LCBTc2RibHRycAo+Pj4+IERURSwgZXRjKS4KPj4+
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KPj4+PiAtLS0KPj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8ICA1ICsrCj4+
Pj4gIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgfCA5NyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygr
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+Pj4gaW5kZXggYmIwNzdkMGM5MTJmLi5mYzg3
YzYwOWMxMWEgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+
Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4+PiBAQCAtNTAzLDYgKzUw
MywxMSBAQCBpbnQgc2JpX3JlbW90ZV9oZmVuY2VfdnZtYV9hc2lkKGNvbnN0IHN0cnVjdCBjcHVt
YXNrICpjcHVfbWFzaywKPj4+PiAgCQkJCXVuc2lnbmVkIGxvbmcgYXNpZCk7Cj4+Pj4gIGxvbmcg
c2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0KTsKPj4+PiAgCj4+Pj4gK2ludCBzYmlfZndmdF9h
bGxfY3B1c19zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxv
bmcgZmxhZ3MsCj4+Pj4gKwkJCSAgYm9vbCByZXZlcnRfb25fZmFpbHVyZSk7Cj4+Pj4gK2ludCBz
YmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKTsKPj4+PiAraW50
IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQg
bG9uZyBmbGFncyk7Cj4+Pj4gKwo+Pj4+ICAvKiBDaGVjayBpZiBjdXJyZW50IFNCSSBzcGVjaWZp
Y2F0aW9uIHZlcnNpb24gaXMgMC4xIG9yIG5vdCAqLwo+Pj4+ICBzdGF0aWMgaW5saW5lIGludCBz
Ymlfc3BlY19pc18wXzEodm9pZCkKPj4+PiAgewo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+Pj4gaW5kZXggMTk4OWI4
Y2FkZTFiLi4yNTY5MTBkYjEzMDcgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2JpLmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+Pj4+IEBAIC0yOTksNiAr
Mjk5LDEwMyBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3Ry
dWN0IGNwdW1hc2sgKmNwdV9tYXNrLAo+Pj4+ICAJcmV0dXJuIDA7Cj4+Pj4gIH0KPj4+PiAgCj4+
Pj4gK2ludCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+
Pj4+ICt7Cj4+Pj4gKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gKy8q
Kgo+Pj4+ICsgKiBzYmlfZndmdF9zZXQoKSAtIFNldCBhIGZlYXR1cmUgb24gYWxsIG9ubGluZSBj
cHVzCj4+Pgo+Pj4gY29weStwYXN0ZSBvZiBkZXNjcmlwdGlvbiBmcm9tIHNiaV9md2Z0X2FsbF9j
cHVzX3NldCgpLiBUaGlzIGZ1bmN0aW9uCj4+PiBvbmx5IHNldHMgdGhlIGZlYXR1cmUgb24gdGhl
IGNhbGxpbmcgaGFydC4KPj4+Cj4+Pj4gKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSB0byBiZSBz
ZXQKPj4+PiArICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKPj4+PiArICog
QGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCj4+Pj4gKyAqCj4+Pj4gKyAqIFJldHVybjog
MCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KPj4+
PiArICovCj4+Pj4gK2ludCBzYmlfZndmdF9zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcg
dmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4+Pj4gK3sKPj4+PiArCXJldHVybiAtRU9QTk9U
U1VQUDsKPj4+PiArfQo+Pj4+ICsKPj4+PiArc3RydWN0IGZ3ZnRfc2V0X3JlcSB7Cj4+Pj4gKwl1
MzIgZmVhdHVyZTsKPj4+PiArCXVuc2lnbmVkIGxvbmcgdmFsdWU7Cj4+Pj4gKwl1bnNpZ25lZCBs
b25nIGZsYWdzOwo+Pj4+ICsJY3B1bWFza190IG1hc2s7Cj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICtz
dGF0aWMgdm9pZCBjcHVfc2JpX2Z3ZnRfc2V0KHZvaWQgKmFyZykKPj4+PiArewo+Pj4+ICsJc3Ry
dWN0IGZ3ZnRfc2V0X3JlcSAqcmVxID0gYXJnOwo+Pj4+ICsKPj4+PiArCWlmIChzYmlfZndmdF9z
ZXQocmVxLT5mZWF0dXJlLCByZXEtPnZhbHVlLCByZXEtPmZsYWdzKSkKPj4+PiArCQljcHVtYXNr
X2NsZWFyX2NwdShzbXBfcHJvY2Vzc29yX2lkKCksICZyZXEtPm1hc2spOwo+Pj4+ICt9Cj4+Pj4g
Kwo+Pj4+ICtzdGF0aWMgaW50IHNiaV9md2Z0X2ZlYXR1cmVfbG9jYWxfc2V0KHUzMiBmZWF0dXJl
LCB1bnNpZ25lZCBsb25nIHZhbHVlLAo+Pj4+ICsJCQkJICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
cywKPj4+PiArCQkJCSAgICAgIGJvb2wgcmV2ZXJ0X29uX2ZhaWwpCj4+Pj4gK3sKPj4+PiArCWlu
dCByZXQ7Cj4+Pj4gKwl1bnNpZ25lZCBsb25nIHByZXZfdmFsdWU7Cj4+Pj4gKwljcHVtYXNrX3Qg
dG1wOwo+Pj4+ICsJc3RydWN0IGZ3ZnRfc2V0X3JlcSByZXEgPSB7Cj4+Pj4gKwkJLmZlYXR1cmUg
PSBmZWF0dXJlLAo+Pj4+ICsJCS52YWx1ZSA9IHZhbHVlLAo+Pj4+ICsJCS5mbGFncyA9IGZsYWdz
LAo+Pj4+ICsJfTsKPj4+PiArCj4+Pj4gKwljcHVtYXNrX2NvcHkoJnJlcS5tYXNrLCBjcHVfb25s
aW5lX21hc2spOwo+Pj4+ICsKPj4+PiArCS8qIFdlIGNhbiBub3QgcmV2ZXJ0IGlmIGZlYXR1cmVz
IGFyZSBsb2NrZWQgKi8KPj4+PiArCWlmIChyZXZlcnRfb25fZmFpbCAmJiBmbGFncyAmIFNCSV9G
V0ZUX1NFVF9GTEFHX0xPQ0spCj4+Pgo+Pj4gU2hvdWxkIHVzZSAoKSBhcm91bmQgdGhlIGZsYWdz
ICYuIEkgdGhvdWdodCBjaGVja3BhdGNoIGNvbXBsYWluZWQgYWJvdXQKPj4+IHRoYXQ/Cj4+Pgo+
Pj4+ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4+ICsKPj4+PiArCS8qIFJlc2V0IHZhbHVlIGlzIHRo
ZSBzYW1lIGZvciBhbGwgY3B1cywgcmVhZCBpdCBvbmNlLiAqLwo+Pj4KPj4+IEhvdyBkbyB3ZSBr
bm93IHdlJ3JlIHJlYWRpbmcgdGhlIHJlc2V0IHZhbHVlPyBzYmlfZndmdF9hbGxfY3B1c19zZXQo
KSBtYXkKPj4+IGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyBvbiB0aGUgc2FtZSBmZWF0dXJlLiBB
bmQgaGFydHMgbWF5IGhhdmUgaGFkCj4+PiBzYmlfZndmdF9zZXQoKSBjYWxsZWQgb24gdGhlbSBp
bmRlcGVuZGVudGx5LiBJIHRoaW5rIHdlIHNob3VsZCBkcm9wIHRoZQo+Pj4gd2hvbGUgcHJldl92
YWx1ZSBvcHRpbWl6YXRpb24uCj4+Cj4+IFRoYXQncyBhY3R1YWxseSB1c2VkIGZvciByZXZlcnRf
b25fZmFpbHVyZSBhcyB3ZWxsIG5vdCBvbmx5IHRoZQo+PiBvcHRpbWl6YXRpb24uCj4gCj4gQXQg
bGVhc3QgdGhlIGNvbW1lbnQgc2hvdWxkIGRyb3AgdGhlIHdvcmQgJ1Jlc2V0JyBhbmQgaWYgdGhl
cmUncyBhIGNoYW5jZQo+IHRoYXQgbm90IGFsbCBoYXJ0cyBoYXZpbmcgdGhlIHNhbWUgdmFsdWUg
dGhlbiB3ZSBzaG91bGQgY2FsbCBnZXQgb24gYWxsCj4gb2YgdGhlbS4gKFdlJ2xsIHByb2JhYmx5
IHdhbnQgU0JJIEZXRlQgZnVuY3Rpb25zIHdoaWNoIG9wZXJhdGUgb24KPiBoYXJ0bWFza3MgZXZl
bnR1YWxseS4pCgpPaywgdGhlbiBJIGNhbiBwYXNzIGEgY3B1X21hc2sgYXMgd2VsbCBzbyB0aGF0
IGNhbGxlciBqdXN0IGhhdmUgdG8gcGFzcwpvbmxpbmVfY3B1cygpIGlmIHRoZXkgd2FudCBpdCBv
biBhbGwgY3B1cy4KCj4gCj4+Cj4+Pgo+Pj4+ICsJcmV0ID0gc2JpX2Z3ZnRfZ2V0KGZlYXR1cmUs
ICZwcmV2X3ZhbHVlKTsKPj4+PiArCWlmIChyZXQpCj4+Pj4gKwkJcmV0dXJuIHJldDsKPj4+PiAr
Cj4+Pj4gKwkvKiBGZWF0dXJlIG1pZ2h0IGFscmVhZHkgYmUgc2V0IHRvIHRoZSB2YWx1ZSB3ZSB3
YW50ICovCj4+Pj4gKwlpZiAocHJldl92YWx1ZSA9PSB2YWx1ZSkKPj4+PiArCQlyZXR1cm4gMDsK
Pj4+PiArCj4+Pj4gKwlvbl9lYWNoX2NwdV9tYXNrKCZyZXEubWFzaywgY3B1X3NiaV9md2Z0X3Nl
dCwgJnJlcSwgMSk7Cj4+Pj4gKwlpZiAoY3B1bWFza19lcXVhbCgmcmVxLm1hc2ssIGNwdV9vbmxp
bmVfbWFzaykpCj4+Pj4gKwkJcmV0dXJuIDA7Cj4+Pj4gKwo+Pj4+ICsJcHJfZXJyKCJGYWlsZWQg
dG8gc2V0IGZlYXR1cmUgJXggZm9yIGFsbCBvbmxpbmUgY3B1cywgcmV2ZXJ0aW5nXG4iLAo+Pj4+
ICsJICAgICAgIGZlYXR1cmUpOwo+Pj4KPj4+IG5pdDogSSdkIGxldCB0aGUgYWJvdmUgbGluZSBz
dGljayBvdXQuIFdlIGhhdmUgMTAwIGNoYXJzLgo+Pj4KPj4+PiArCj4+Pj4gKwlyZXEudmFsdWUg
PSBwcmV2X3ZhbHVlOwo+Pj4+ICsJY3B1bWFza19jb3B5KCZ0bXAsICZyZXEubWFzayk7Cj4+Pj4g
Kwlvbl9lYWNoX2NwdV9tYXNrKCZyZXEubWFzaywgY3B1X3NiaV9md2Z0X3NldCwgJnJlcSwgMSk7
Cj4+Pj4gKwlpZiAoY3B1bWFza19lcXVhbCgmcmVxLm1hc2ssICZ0bXApKQo+Pj4+ICsJCXJldHVy
biAwOwo+Pj4KPj4+IEknbSBub3Qgc3VyZSB3ZSB3YW50IHRoZSByZXZlcnRfb25fZmFpbCBzdXBw
b3J0IGVpdGhlci4gV2hhdCBoYXBwZW5zIHdoZW4KPj4+IHRoZSByZXZlcnQgZmFpbHMgYW5kIHdl
IHJldHVybiAtRUlOVkFMIGJlbG93PyBBbHNvIHJldHVybmluZyB6ZXJvIHdoZW4KPj4+IHJldmVy
dCBzdWNjZWVkcyBtZWFucyB0aGUgY2FsbGVyIHdvbid0IGtub3cgaWYgd2Ugc3VjY2Vzc2Z1bGx5
IHNldCB3aGF0Cj4+PiB3ZSB3YW50ZWQgb3IganVzdCBzdWNjZXNzZnVsbHkgcmV2ZXJ0ZWQuCj4+
Cj4+IFNvIHRoYXQgbWlnaHQgYWN0dWFsbHkgYmUgbmVlZGVkIGZvciBmZWF0dXJlcyB0aGF0IG5l
ZWRzIHRvIGJlIGVuYWJsZWQKPj4gb24gYWxsIGhhcnQgb3Igbm90IGVuYWJsZWQgYXQgYWxsLiBJ
ZiB3ZSBmYWlsIHRvIGVuYWJsZSBhbGwgb2YgdGhlbSwKPj4gdGhlbSB0aGUgaGFydCB3aWxsIGJl
IGluIHNvbWUgbm9uIGNvaGVyZW50IHN0YXRlIGJldHdlZW4gdGhlIGhhcnRzLgo+PiBUaGUgcmV0
dXJuZWQgZXJyb3IgY29kZSB0aG91Z2ggaXMgd3JvbmcgYW5kIEknbSBub3Qgc3VyZSB3ZSB3b3Vs
ZCBoYXZlIGEKPj4gd2F5IHRvIGdyYWNlZnVsbHkgaGFuZGxlIHJldmVydGlvbiBmYWlsdXJlIChl
eGNlcHQgbWF5YmUgcGFuaWNraW5nID8pLgo+IAo+IEhvdyBhYm91dCBvZmZsaW5pbmcgYWxsIGhh
cnRzIHdoaWNoIGRvbid0IGhhdmUgdGhlIGRlc2lyZWQgc3RhdGUsIGFsb25nCj4gd2l0aCBjb21w
bGFpbmluZyBsb3VkbHkgdG8gdGhlIGJvb3QgbG9nLgo+IAo+IFRoYW5rcywKPiBkcmV3CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
