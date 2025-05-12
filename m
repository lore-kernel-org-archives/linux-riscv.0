Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F031C3ABCC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5246SU1JBQ/rYD4YnxiRX/YbwTD86S9f78oiEmKjLI=; b=L5tYWa1TEFaUVf
	SBxPk6KYv8kmdLAfI7hAgAGnhlP8of7bfI5fUCNcA5Z3M1TYlwEDw0XrrLOxco8+AFSBh9gVegn22
	1UUEhR2v5lejMQJ4VVdiVxQtCjX1ty3H4O9sShSSM95wHQEDV/X9xb9kL/3a9YFe9DTUCrEir6ibW
	WOj7ymU/Pa7Ai0/V8Ns/bBLbQoMwUYLMOyA/SXyHoa0seit955PZnomtF0cMt8eZWNQIBfBgElj/d
	/ACOFcur0Nzjb8aVSdsmq6mR+oSPsFz0ROaVH32Ts6zpHTXKoTFAXjuieqD6mW6ZAn5UZN2dJYIme
	UvxLjW+ZPVCXr7mnVSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOUd-00000008k8s-0JEd;
	Mon, 12 May 2025 08:26:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOJ4-00000008iGO-1OqY
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:14:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a20257c815so1338122f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747037677; x=1747642477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUWtnXREtfU0bglSJPdPg3dSI06mpwAnzzgVNIScr4k=;
        b=sKpo0ptHGKx/cM7N8fNYXMuzhs2n/kJrAG8liCvs60vf0sfEBJCMGxu9dsUDFIWrL9
         RYilV/djuzUbOgpHKwG9o6458TPc4e22oI6e7GpgECd7Aio1BM/pHZHe2V5yqjKxsFiC
         nb2vtpXdeaMTSzSLrRcshIB2TU6jni4IannL3pzoLbsRTy72nU737sZwq1Uwt/s4Fsy5
         mBWyFJ2DHmFYcxPe+XkxEVuohjUXWtCYIJZYD+eM+LSPI0VlcvfuXWcZObkrOGtWdLHy
         3e4sVpywqKBdgAb4QgWbS+S6kVWLms+A6u7xAGO3AWWrr4lieAaV09edQ1AeHoO+egSI
         T30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747037677; x=1747642477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUWtnXREtfU0bglSJPdPg3dSI06mpwAnzzgVNIScr4k=;
        b=msj736h7W8vdlhtB7/u7XvL3ezdGCARTN/PoZc22fOK0uy6qfZgLgZt87JGqjcfbMM
         OZgjH8B8dE6o0Slomobdm8MPLCPWbTdHMs+kOtd6jWJiGUZ+N+iy1r5j2KZefuTKAjR6
         8mm9eM5IRTQLpoIQ87vF6hhh/v9K8wMKmKSNXvWMgOPJwfDoDiEFWQdSw4NC9XMDuu4y
         IZq0IUKUI9Hr7DEt8LEy4THsXaJH5CKEwccZIswiKT45x65e2MxcHrJbUoxQUSSNJPCM
         tAE1G1uOLseiSVow7fm7Fx+HBSlhKmG2PUBCKB0hBghnGM+O+8pczIRUgG6QBsQX/k3m
         563g==
X-Forwarded-Encrypted: i=1; AJvYcCW0h3gguYP+O4DhI3w3jNLCHC3iS067jYE+a8B1Ii21oaLabJSFInlzSLuHRJhPI+18YVuo4aBhRjQnLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLrz5IFVeGrN0ty2cMNqzn3hsLENlsXkJgkcWSd8wQTICqSiGC
	IVxcPEwGSyG7jzwO4IyUfIseLTJQ0GegWDw7vc83k9vkMWHxJhT0aLqlwOkVouL6+WfR3+UItCm
	avZM=
X-Gm-Gg: ASbGncvLuBTneIpqT5W5epG9uSaLjO+vGWgI2sKISBLBxK+8dD5SDCkVq+Zs0b1dmj1
	cV0n9lAWkkva94BrcR94ZJbgg9RDESPb9RIlOJVRsB7kx1ZPtAxwuOGmevs57KKSSXZzx9CFG2T
	5ZdWTe02bOcGKSOUPClX+JjzudK8xr45xcCqskvleBXmUTD4vxnKnFhKHaHd2A0bkzSVzoDhRei
	izD+q6ymBu6zmY7U7yEsQw5Nn5I7NZdRqLzYUk2D5AtxAgxVu+d8gRecVgnGF+Plj1iYsEoz3az
	7T4ohnomjpAx85jKOTCROnypPWUgV4rGDg+5I+SUpdmSDrgz5+LfjUkQrgLTTuxqkSxRACN1SER
	6a1P5D76I4BDHiuqXkIqn
X-Google-Smtp-Source: AGHT+IF5FdpyihNwkP+pz8qwsSi03YYChIIL/diT4CyeFnMpdYT9qUG8HkxnvNgaNA1vzLlpCGu/5Q==
X-Received: by 2002:a05:6000:186f:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a1f643acbemr9221007f8f.9.1747037676817;
        Mon, 12 May 2025 01:14:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf43sm11626947f8f.70.2025.05.12.01.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:14:36 -0700 (PDT)
Message-ID: <fe9d801b-007d-476d-97fe-96d0f3d218cd@rivosinc.com>
Date: Mon, 12 May 2025 10:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/14] riscv: sbi: add FWFT extension interface
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
 <20250424173204.1948385-5-cleger@rivosinc.com>
 <1c385a47-0a01-4be4-a34b-51a2f168e62d@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <1c385a47-0a01-4be4-a34b-51a2f168e62d@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_011438_384279_95D8C84D 
X-CRM114-Status: GOOD (  17.61  )
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

CgpPbiAwOS8wNS8yMDI1IDAyOjE4LCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiA0LzI0LzI1IDEw
OjMxIEFNLCBDbMODwqltZW50IEzDg8KpZ2VyIHdyb3RlOgo+PiBUaGlzIFNCSSBleHRlbnNpb25z
IGVuYWJsZXMgc3VwZXJ2aXNvciBtb2RlIHRvIGNvbnRyb2wgZmVhdHVyZSB0aGF0IGFyZQo+PiB1
bmRlciBNLW1vZGUgY29udHJvbCAoRm9yIGluc3RhbmNlLCBTdmFkdSBtZW52Y2ZnIEFEVUUgYml0
LCBTc2RibHRycAo+PiBEVEUsIGV0YykuIEFkZCBhbiBpbnRlcmZhY2UgdG8gc2V0IGxvY2FsIGZl
YXR1cmVzIGZvciBhIHNwZWNpZmljIGNwdQo+PiBtYXNrIGFzIHdlbGwgYXMgZm9yIHRoZSBvbmxp
bmUgY3B1IG1hc2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwg
MTcgKysrKysrKysrKysKPj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmPCoMKgwqDCoMKgIHwg
NTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgNzQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4gaW5kZXggN2Vj
MjQ5ZmVhODgwLi4zYmJlZjU2YmNlZmMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+PiBAQCAt
NTAzLDYgKzUwMywyMyBAQCBpbnQgc2JpX3JlbW90ZV9oZmVuY2VfdnZtYV9hc2lkKGNvbnN0IHN0
cnVjdAo+PiBjcHVtYXNrICpjcHVfbWFzaywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBsb25nIGFzaWQpOwo+PiDCoCBsb25nIHNiaV9wcm9iZV9leHRlbnNp
b24oaW50IGV4dCk7Cj4+IMKgICtpbnQgc2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25l
ZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nCj4+IGZsYWdzKTsKPj4gK2ludCBzYmlfZndmdF9z
ZXRfY3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0dXJlLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpOwo+PiArLyoqCj4+ICsgKiBzYmlfZndmdF9zZXRfb25saW5lX2NwdXMoKSAtIFNldCBhIGZl
YXR1cmUgb24gYWxsIG9ubGluZSBjcHVzCj4+ICsgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgdG8g
YmUgc2V0Cj4+ICsgKiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAo+PiArICog
QGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCj4+ICsgKgo+PiArICogUmV0dXJuOiAwIG9u
IHN1Y2Nlc3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+PiArICov
Cj4+ICtzdGF0aWMgaW5saW5lIGludCBzYmlfZndmdF9zZXRfb25saW5lX2NwdXModTMyIGZlYXR1
cmUsIHVuc2lnbmVkIGxvbmcKPj4gdmFsdWUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzKQo+PiArewo+PiArwqDCoMKg
IHJldHVybiBzYmlfZndmdF9zZXRfY3B1bWFzayhjcHVfb25saW5lX21hc2ssIGZlYXR1cmUsIHZh
bHVlLCBmbGFncyk7Cj4+ICt9Cj4+ICsKPj4gwqAgLyogQ2hlY2sgaWYgY3VycmVudCBTQkkgc3Bl
Y2lmaWNhdGlvbiB2ZXJzaW9uIGlzIDAuMSBvciBub3QgKi8KPj4gwqAgc3RhdGljIGlubGluZSBp
bnQgc2JpX3NwZWNfaXNfMF8xKHZvaWQpCj4+IMKgIHsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4gaW5kZXggMWQ0NGMz
NTMwNWE5Li5kNTdlNGRhZTdkYWMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Ni
aS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+IEBAIC0yOTksNiArMjk5LDYz
IEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihpbnQgZmlkLCBjb25zdCBzdHJ1Y3QKPj4g
Y3B1bWFzayAqY3B1X21hc2ssCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gwqAg
Ky8qKgo+PiArICogc2JpX2Z3ZnRfc2V0KCkgLSBTZXQgYSBmZWF0dXJlIG9uIHRoZSBsb2NhbCBo
YXJ0Cj4+ICsgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgSUQgdG8gYmUgc2V0Cj4+ICsgKiBAdmFs
dWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAo+PiArICogQGZsYWdzOiBGV0ZUIGZlYXR1
cmUgc2V0IGZsYWdzCj4+ICsgKgo+PiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFwcHJvcHJp
YXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+PiArICovCj4+ICtpbnQgc2JpX2Z3ZnRf
c2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdz
KQo+PiArewo+PiArwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4gK30KPj4gKwo+PiArc3Ry
dWN0IGZ3ZnRfc2V0X3JlcSB7Cj4+ICvCoMKgwqAgdTMyIGZlYXR1cmU7Cj4+ICvCoMKgwqAgdW5z
aWduZWQgbG9uZyB2YWx1ZTsKPj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiArwqDC
oMKgIGF0b21pY190IGVycm9yOwo+PiArfTsKPj4gKwo+PiArc3RhdGljIHZvaWQgY3B1X3NiaV9m
d2Z0X3NldCh2b2lkICphcmcpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGZ3ZnRfc2V0X3JlcSAq
cmVxID0gYXJnOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBzYmlf
ZndmdF9zZXQocmVxLT5mZWF0dXJlLCByZXEtPnZhbHVlLCByZXEtPmZsYWdzKTsKPj4gK8KgwqDC
oCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgYXRvbWljX3NldCgmcmVxLT5lcnJvciwgcmV0
KTsKPiAKPiBXaGF0IGhhcHBlbnMgd2hlbiBjcHVYIGV4ZWN1dGVkIGZpcnN0IHJlcG9ydGVkIGFu
IGVycm9yIGJ1dCBjcHVZCj4gZXhlY3V0ZWQgdGhpcyBmdW5jdGlvbiBsYXRlciBhbmQgcmVwb3J0
IHN1Y2Nlc3MuCj4gCj4gVGhlIGVycm9yIHdpbGwgYmUgbWFza2VkIGluIHRoYXQgY2FzZS4KCldl
IGFjdHVhbGx5IG9ubHkgc2V0IHRoZSBiaXQgaWYgYW4gZXJyb3IgaGFwcGVuZWQgKGNvbnNpZGVy
IGl0IGFzIGEKc3RpY2t5IGVycm9yIGJpdCkuIFNvIGlmIENQVXkgcmVwb3J0cyBzdWNjZXNzLCBp
dCB3b24ndCBjbGVhciB0aGUgYml0LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+ICt9Cj4+ICsK
Pj4gKy8qKgo+PiArICogc2JpX2Z3ZnRfc2V0X2NwdW1hc2soKSAtIFNldCBhIGZlYXR1cmUgZm9y
IHRoZSBzcGVjaWZpZWQgY3B1bWFzawo+PiArICogQG1hc2s6IENQVSBtYXNrIG9mIGNwdXMgdGhh
dCBuZWVkIHRoZSBmZWF0dXJlIHRvIGJlIHNldAo+PiArICogQGZlYXR1cmU6IFRoZSBmZWF0dXJl
IElEIHRvIGJlIHNldAo+PiArICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQK
Pj4gKyAqIEBmbGFnczogRldGVCBmZWF0dXJlIHNldCBmbGFncwo+PiArICoKPj4gKyAqIFJldHVy
bjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4K
Pj4gKyAqLwo+PiAraW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFz
aywgdTMyIGZlYXR1cmUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKPj4gK3sKPj4gK8KgwqDC
oCBzdHJ1Y3QgZndmdF9zZXRfcmVxIHJlcSA9IHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5mZWF0dXJl
ID0gZmVhdHVyZSwKPj4gK8KgwqDCoMKgwqDCoMKgIC52YWx1ZSA9IHZhbHVlLAo+PiArwqDCoMKg
wqDCoMKgwqAgLmZsYWdzID0gZmxhZ3MsCj4+ICvCoMKgwqDCoMKgwqDCoCAuZXJyb3IgPSBBVE9N
SUNfSU5JVCgwKSwKPj4gK8KgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqAgaWYgKGZlYXR1cmUgJiBT
QklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsKPj4gKwo+PiArwqDCoMKgIG9uX2VhY2hfY3B1X21hc2sobWFzaywgY3B1X3NiaV9md2Z0
X3NldCwgJnJlcSwgMSk7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gYXRvbWljX3JlYWQoJnJlcS5l
cnJvcik7Cj4+ICt9Cj4+ICsKPj4gwqAgLyoqCj4+IMKgwqAgKiBzYmlfc2V0X3RpbWVyKCkgLSBQ
cm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4KPj4gwqDCoCAqIEBzdGltZV92
YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZlbnQgc2hvdWxkIGZpcmUu
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
