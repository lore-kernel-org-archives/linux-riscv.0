Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E6C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnF+crR8CFvxFpRBUSivPKYx1vQd5Kh2F/EtzWWpqkY=; b=2YioHDUTDeOjvK
	gYWBkxB3ZWZqeXy1LHKIio63rDzWlWBK8nDvP0ye4j9uTzwcV6VTtLoiqnlz6apOTchxRKq9CI5an
	oDbNtgMOfSvC0Vd+LRhcCDGXLkUbGeOyQPHb2qWnrTW0+Q/Y845M2/Nmd7S2Y2h0dXEKZwy0WTupW
	7Cp1Qb5GxFg1uPPfxhKi9xXvwhu22FJ+4M8QaaXOyzb6a6QiplKtDREtjcnwULmuHUNdQmPOSa0hP
	xkDC6XcaqCjp0I3id9jjc7dKKXDlQ4H171w5BczuovdOukHI3lj+X0oc47jtJ2drtxqcwAa2N/LG2
	2JwGyJR+S0ztQjufj0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzkS-000000002bA-3pMk;
	Thu, 22 May 2025 06:49:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzkP-000000002a3-3vN6
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 06:49:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso59677985e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747896584; x=1748501384; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSfZsD4God9Ts/HLONlfHOWEtM7BhkFonFKtAqIE5Mk=;
        b=Bw9Jdxj6B+LzCqUlCkEMkcwwYnYDjEd31bpFFD5oTFxtDydXy4MMHnE4mfMSden1Fa
         2neDAENnNvRCbC4TmH6K2f7U5uHdjvj2skQcxIRAFfGewqkZHqb+t7wXfIw+XC8VRWHD
         eGjYdwhy4s4AB2DwY8fBRSPXgotl1EecMM1LH64AECfeieIEmNCktEvY3eFSE2S9YPRg
         m8AmTl0No5eXdgYxyoxc9/k5PxA6aL3BuCSk5Rr1mi2l7CXsFOrJWaOB4Ns7yIauT6yd
         LjGeexiyOujOJMw+M9AMbgCB8qncJktI8he5vm2NPN6YMMYTu2WPhK7g98himBNs2PXu
         FE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747896584; x=1748501384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSfZsD4God9Ts/HLONlfHOWEtM7BhkFonFKtAqIE5Mk=;
        b=XTmuh0PrlNtmwHmf6MTxUJhJvoU4COTIS9D6T8rLknK8gZWSNdyfrcKMhdQ3c49cBs
         XvILSmRMSTWcS1uDYO9BJJYIntGDVkTY7RFdhsymU2nx3FkgOztow//EdpAvXoOOnOkc
         wAB+PVfqeh1BmEeKYPhp3L9ZKGz0jZqAZQ7aYdCEf3FB6Y2OOYtmZbwDuPnl/GpuJqZn
         UGeIvFgPERGxRDecEJtfQmVBLqDRiTKDSWMOmr9x4uF4M0LglJAJvrAL9k7R60UBjYHK
         qLad1orwkq8ysciwVxPKDAOErVZVD0RejtQ32eQPn1/Z1nYTeMLsscHeU0Kxa4vMXD/J
         6B3w==
X-Forwarded-Encrypted: i=1; AJvYcCWSj2inXN4ZT5RVvH2X1a7KM2aD0g2ReDkyjEul7mvV6nw2YlQvjaLjyX7ujWAdPWEl4db7hSfK0XlCVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYNyxyPTOI5E2AtsCKpjSytoAY3p7ZDiGSVRzP0VEm9nUQtfjc
	YsRsccnWJL4iVgB/OcMrtLFom9teQ4TZH53W6X9JCmW474E4Y3UxFmLPZ+gjBhHO4Z4=
X-Gm-Gg: ASbGncsxCUAzyGsFvC6Mic8kaWyD4KD6Ags3RXW2UyLd+q4jbc4b1iHPFKxeHpjOlGb
	8VFQqCCL7oqufzGi0jeOs4Fi4Q9/e03N+P0v071+YTOjh0jsfhQAi5CVOyc10JDvOdnh9bN6ySt
	pXDUUzctrzeR2SOhvfh/NEee3XN0RORB3sT9Otgi6nlGxkl+9s/igHb5idLswR+QbHkNVebWS2O
	lcJ8if3WbQ8VY/iJ6rLYpTTZGVODCFl0FDI9Xy0uUR0/2/eEOVQpT6Hg8CrG7BB9VvLM8j+xoJB
	HMPhd9Jg+QLJKhWJwWeDUnf+849p7zIMTC0TBnE6fbrm7/yvT23TA8EQCF4h/hUSez91s/PzKVt
	iDczd+8aXtABK6W/C3coI
X-Google-Smtp-Source: AGHT+IHcBrXU/Fz3UA3Men54JBGMvR7rPmgEKbKc+z1Guu78ah8GEwVQySPOphDeLouhsLRO/zwPHg==
X-Received: by 2002:a05:600c:3c87:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-442fefd5f98mr249592835e9.2.1747896583771;
        Wed, 21 May 2025 23:49:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78b2f19sm90646175e9.32.2025.05.21.23.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:49:43 -0700 (PDT)
Message-ID: <957c479e-6233-4294-ac03-ac20b87dfacd@rivosinc.com>
Date: Thu, 22 May 2025 08:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com> <aCu_ce-kVQsyjrh5@ghost>
 <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com> <aCy3A6uUbnWoO9uC@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <aCy3A6uUbnWoO9uC@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_234946_212560_C289FCD9 
X-CRM114-Status: GOOD (  27.97  )
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

CgpPbiAyMC8wNS8yMDI1IDE5OjA4LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gVHVlLCBN
YXkgMjAsIDIwMjUgYXQgMTA6MTk6NDdBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
Pgo+Pgo+PiBPbiAyMC8wNS8yMDI1IDAxOjMyLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBP
biBUaHUsIE1heSAxNSwgMjAyNSBhdCAxMDoyMjoxMEFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIg
d3JvdGU6Cj4+Pj4gU3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkg
b2YgbWlzYWxpZ25lZCBhY2Nlc3Nlcwo+Pj4+IHBlcmZvcm1hbmNlIG9uIGFsbCBjcHVzIGZyb20g
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpCj4+Pj4gdG8gaXRzIG93
biBmdW5jdGlvbiB3aGljaCB3aWxsIGJlIHVzZWQgZm9yIGRlbGVnYXRpb24gY2hlY2suIE5vCj4+
Pj4gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Pj4+IC0tLQo+Pj4+ICBhcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyMCArKysrKysrKysrKysrKy0tLS0t
LQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4+PiBpbmRleCBlNTUx
YmExN2Y1NTcuLjI4N2VjMzcwMjFjOCAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMKPj4+PiBAQCAtNjQ3LDYgKzY0NywxOCBAQCBib29sIF9faW5pdCBjaGVja192
ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQo+Pj4+ICB9Cj4+
Pj4gICNlbmRpZgo+Pj4+ICAKPj4+PiArc3RhdGljIGJvb2wgYWxsX2NwdXNfdW5hbGlnbmVkX3Nj
YWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKPj4+PiArewo+Pj4+ICsJaW50IGNwdTsKPj4+PiAr
Cj4+Pj4gKwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKPj4+PiArCQlpZiAocGVyX2NwdShtaXNh
bGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KSAhPQo+Pj4KPj4+IG1pc2FsaWduZWRfYWNjZXNzX3Nw
ZWVkIGlzIG9ubHkgZGVmaW5lZCB3aGVuCj4+PiBDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdO
RUQuIFRoaXMgZnVuY3Rpb24gc2hvdWxkIHJldHVybiBmYWxzZSB3aGVuCj4+PiAhQ09ORklHX1JJ
U0NWX1NDQUxBUl9NSVNBTElHTkVEIGFuZCBvbmx5IHVzZSB0aGlzIGxvZ2ljIG90aGVyd2lzZS4K
Pj4KPj4gSGkgQ2hhcmxpZSwKPj4KPj4gbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5l
ZCBpbiB1bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgd2hpY2ggaXMKPj4gY29tcGlsZWQgYmFzZWQg
b24gQ09ORklHX1JJU0NWX01JU0FMSUdORUQgKGRpdHRvIGZvciB0cmFwX21pc2FsaWduZWQuYykK
Pj4KPj4gb2JqLSQoQ09ORklHX1JJU0NWX01JU0FMSUdORUQpCSs9IHVuYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQubwo+Pgo+PiBIb3dldmVyLCB0aGUgZGVjbGFyYXRpb24gZm9yIGl0IGluIHRoZSBoZWFk
ZXIgY3B1LWZlYXR1cmUuaCBob3dldmVyIGlzCj4+IHVuZGVyIGEgQ09ORklHX1JJU0NWX1NDQUxB
Ul9NSVNBTElHTkVEIGlmZGVmLiBTbyBlaXRoZXIgdGhlIGRlY2xhcmF0aW9uCj4+IG9yIHRoZSBk
ZWZpbml0aW9uIGlzIHdyb25nIGJ1dCB0aGUgaWZkZWZlcnkgc291cCBtYWtlcyBpdCBxdWl0ZQo+
PiBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZCB3aGF0J3MgZ29pbmcgb24uCj4+Cj4+IEkgd291bGQg
c3VnZ2VzdCB0byBtb3ZlIHRoZSBERUNMQVJFX1BFUl9DUFUgdW5kZXIKPj4gQ09ORklHX1JJU0NW
X01JU0FMSUdORUQgc28gdGhhdCBpdCByZWR1Y2VzIGlmZGVmIGluIHRyYXBzX21pc2FsaWduZWQg
YXMKPj4gd2VsbC4KPiAKPiBIZXJlIGlzIHRoZSBwYXRjaCBJIGFtIHVzaW5nIGxvY2FsbHkgZm9y
IHRlc3RpbmcgcHVycG9zZXMsIGJ1dCBpZiB0aGVyZQo+IGlzIGEgd2F5IHRvIHJlZHVjZSB0aGUg
bnVtYmVyIG9mIGlmZGVmcyB0aGF0IGlzIHByb2JhYmx5IHRoZSBiZXR0ZXIgd2F5IHRvIGdvOgo+
IAoKSGkgQ2hhcmxpZSwKCkkgaGF2ZSBhbm90aGVyIHdheSB0byBkbyBzbyB3aGljaCBpbmRlZWQg
cmVkdWNlcyB0aGUgbnVtYmVyIG9mCmlmZGVmL2R1cGxpY2F0ZWQgZnVuY3Rpb25zLiBJJ2xsIHN1
Ym1pdCB0aGF0LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gRnJvbSAxOGY5YTA1NmQzYjU5NzkzNGM5
MzFhYmRmNzJmYjZlNzc1Y2NiNzE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gRGF0ZTogTW9uLCAxOSBNYXkg
MjAyNSAxNjozNTo1MSAtMDcwMAo+IFN1YmplY3Q6IFtQQVRDSF0gZml4dXAhIHJpc2N2OiBtaXNh
bGlnbmVkOiBtb3ZlIGVtdWxhdGVkIGFjY2VzcyB1bmlmb3JtaXR5Cj4gIGNoZWNrIGluIGEgZnVu
Y3Rpb24KPiAKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwg
MTIgKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+IGluZGV4IGYz
YWI4NGJjNDYzMi4uMTQ0OWM2YTRhYzIxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwo+IEBAIC02NDcsNiArNjQ3LDEwIEBAIGJvb2wgX19pbml0IGNoZWNrX3ZlY3Rvcl91
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4gIH0KPiAgI2VuZGlmCj4g
IAo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVECj4gKwo+ICtzdGF0aWMg
Ym9vbCB1bmFsaWduZWRfY3RsIF9fcmVhZF9tb3N0bHk7Cj4gKwo+ICBzdGF0aWMgYm9vbCBhbGxf
Y3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCh2b2lkKQo+ICB7Cj4gIAlpbnQg
Y3B1Owo+IEBAIC02NTksMTAgKzY2Myw2IEBAIHN0YXRpYyBib29sIGFsbF9jcHVzX3VuYWxpZ25l
ZF9zY2FsYXJfYWNjZXNzX2VtdWxhdGVkKHZvaWQpCj4gIAlyZXR1cm4gdHJ1ZTsKPiAgfQo+ICAK
PiAtI2lmZGVmIENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAo+IC0KPiAtc3RhdGljIGJv
b2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5Owo+IC0KPiAgc3RhdGljIHZvaWQgY2hlY2tf
dW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh2b2lkICphcmcgX19hbHdheXNfdW51c2VkKQo+ICB7
Cj4gIAlpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+IEBAIC03MTYsNiArNzE2LDEwIEBA
IGJvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCkKPiAgCXJldHVybiB1bmFsaWduZWRf
Y3RsOwo+ICB9Cj4gICNlbHNlCj4gK3N0YXRpYyBib29sIGFsbF9jcHVzX3VuYWxpZ25lZF9zY2Fs
YXJfYWNjZXNzX2VtdWxhdGVkKHZvaWQpCj4gK3sKPiArCXJldHVybiBmYWxzZTsKPiArfQo+ICBi
b29sIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQp
Cj4gIHsKPiAgCXJldHVybiBmYWxzZTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
