Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF675606A33F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jOLFsZVu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mTHM99gb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x62sQsxai+KApQA4ZcSWsVwUmE10ENxCMev/2FS82LI=; b=jOLFsZVuFa1GZaKDFxugWTYqfo
	6qLuDTJan1bmsYFbDpOTj6isGdswpn42jRxM1ZAQdw0/XMAz5JpVn1XoWquk4+3QLIXLrlLVlBQYs
	6SRyp36W2bD1DerHHBJ6blkNn6I/r2t5W3uXTSbCVNPyrN5VGyrjO1bybiMyZdSAmtEsDe6/RAFBF
	PX4umqnQh+3Aymo0d7G5punAANsulVxuZ5lmcxpSFlM+uQ82cpdrImnT8DCCsJ6tOLx/1b+kibAnR
	Si8lUX9jsAn1ipzR5jd4Ny4AO+yuEizEzqs4AYmRng00lNijqFXWUfw19P5lPqvgtKuqEyqeRFzRw
	YRsEVvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjy9-0000000Bhl1-2jXs;
	Fri, 13 Nov 2026 05:37:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjy7-0000000Bhjv-1Isi
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 05:37:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so195742f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 21:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548217; cv=none;
        d=google.com; s=arc-20260327;
        b=ocJe8OUEOBIoDqYmymJ7HCVFY5ohzr7+lPpJ9rPY4a1MauTMzqWVNvK9o6lhHghOfl
         hBtoGy9KqWOljwyg7piDG2NIRO4nrCeWBmYOZR2kDljnLqaD6BH4H8+lk3AafJx2vEda
         +swoA7SMogytmK/LxzPxS1+Uja9EDviw8ZYQAxDCsYPq6vnD796DRfK2Rk2356T0PGCh
         ud7c6zBuumKDfy08NM7Q34IRYpD41FuhobaYXzfHlltBLbRuiWsacJXf5k7AVJrp5Saw
         jTeUSWA33bq7XULok9O0eh6RclGvuEcK2SYz+jsKUfMPg2UldhnbAU3pjqiJozOSqNCH
         OqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2Ks1icqV7sc4HD6DCoye7tArv6/S0Ygu8r9B8v/4m4=;
        fh=qqrix2H5SvqPLjOmt53gJk7Vq+gDSc1wXz+Qw0CkL7c=;
        b=D80OPELeECPn3xz4+TnOhBTEqAZIIEVL4Z6dgV0Gq+cDTihBnIH14L9oPRS5U6lahM
         bjdYmPNW0VtE3eV8BlfnWaJn19ZFAVNuUsYaNBvMwGvhoEQ79xoGyWBjtygENXpNqAX2
         nQ+Mi2ioCuY1dgsi7TJsBYdMB17bI9WpTQ3Oxihs34+CPoYXkBR1b9fwX8I6MnA0pg4Y
         A9lVkCZWRvAh1jzWX3WR49+SNzhkasjVz0jnNdml98ry4JFuBdHy+/IwSqjKRgCwJmVP
         O+3E9f2wnTH8xw8Wr5wgJyYmqrp8a0KkE72Zt/aZhMfAqbzwCyLXuMwr6UBL6WMLwmwt
         0oAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794548217; x=1795153017; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2Ks1icqV7sc4HD6DCoye7tArv6/S0Ygu8r9B8v/4m4=;
        b=mTHM99gbpTHg6R8clZT5Lysb6P2aTLdYlFIpJkStwA7Y9Mg1ZSZhn0Juc5wc/ToJxr
         WJ+EY3jvaXq0R16/jehspLl2sDRJPY1P8r6a8RWslCp/gsiaqS097tc8rnFI7Hcwao6F
         I0w66yQB7R3XXVq7fuA/MdYFxmlpLUsMB8mL681S2Z0Y2nasW3shSPEMer4+GE3GOg8d
         SyMQLzEjfYe0tU4oRXGQoHsYj1Ap/CnDNM6/t3AN9XE0btZk7kLLuJiOCmoGTwdb4hfV
         yZrKtjg8yUQhsfD7vRn8N7O6XiVpTmPceyIz4NpJVi3qC8bnj/M5+Enf8mVUFW5Ou+Mf
         td3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548217; x=1795153017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Ks1icqV7sc4HD6DCoye7tArv6/S0Ygu8r9B8v/4m4=;
        b=R6P15F1Ka184R1QraxZtQnnlMtLDjwGQ70wg7JRSfLDWaB0ZNIv1FuxKwG1fXwnMkp
         1Psi0NIwsQCGmwyTXh9yZFZ/KKimagh+PhF0nn1yoK7B/b3+cN2Xd40baICEOx03sBpw
         EqTNbnF4pY7H/QR/cU3uZpj5HUNR4SxlydWuknM/d1LdalAXGcU4eazSPn5c7+FCoXHP
         2N2N5ImZATWeZLbcMMBEL+Wdo9srJBKsFPdLfVcLXJX7yUG8y3gHveMzLlp3siwcSy99
         3rRrgJ8/X6rm1NaBFFLbX4Lz3Ml0sSjsS1pivdN6c2L53sdBhXN2qCXK6kgT6owjVvmz
         5+Rg==
X-Forwarded-Encrypted: i=1; AL+hErHSjw9h9aBXxasFYOX/yO+G+QEh+3DibBjv0UAzO6vu8ZeB2LuFNcLMrRKsQ9fAxiPgutftbCde220Hzg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+umvv0eaFaJ2tqgpomu7QVUoc2384Euma9834PDM/Rq/7JAAaG
	hbpUu6gI9H4j9g+sF5EAH9knsjPhezTMIGE9WvLa8x+O/x2/iAQBnpYKRFyFKdvOJhi91vreLmT
	se7MyhO/KdQKtC/a6Z0QVWOaiaJwdzhMJbLOfs9G/1g==
X-Gm-Gg: AYBFou2nS2HCuhaEihZRq1b/OLme7zIDelTpYmhPyusoUdWFefZTRx45KGH4f0+DZCk
	kYNpuDHyJZkyUa1LRbpsaeYBZHJJlsaU/pPxhoJvWTrUiNzwgtqUJdm1iy7YgJL0LRjUeTMHq8k
	LPBVV/ft9Mx9bza61XU39qfg7DQqPTHrp6uZuKv8NwPednbYneqRL+BA+xeddWRYBIn4BHqG39N
	tOFVb7cdO8DuqBPEwAfi+hxTobbusKajaxhum7owCHoVM2RoAiy6EwRkC47jB1b2YK/VtYTVkfm
	9Fa7HMTyc6rilOe1Za0qoSYVCrzFvwe/Nx9g4If+aPHZirksnjIRu9+KUSPSdSI0iV28Kr4t80Q
	DP8wUdYE1eaROPVPtMqzPm1welWhZOge/4VvmQxWwB/BLFSfVdwbNsVFb7g3u0bNpnW5VKFcPSb
	e+Cpa6zMaXyz6EhGu57TTKu6UX52/NNk70MMjidEy6Hqe1TV1ZUv3QUOOwwA==
X-Received: by 2002:a05:6000:25ec:b0:490:83b9:7888 with SMTP id
 ffacd0b85a97d-49c74959580mr2860493f8f.52.1794548217360; Thu, 12 Nov 2026
 21:36:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1789872556.git.hppiscas@163.com> <3046cfd67c5f962014cd38e49a0e8bf28b6fb53f.1789872556.git.hppiscas@163.com>
In-Reply-To: <3046cfd67c5f962014cd38e49a0e8bf28b6fb53f.1789872556.git.hppiscas@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:06:45 +0530
X-Gm-Features: AclHuK9biTLZxhI1tcdlqfU4imHZdhgp5Hgs9a4lcq-e0JhTebZNZ8Ov0xT5swk
Message-ID: <CAAhSdy3-ArOtVWGzzpM3pxi7_+8bhD5L-_WvGL-MFwRLH1xzAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Validate AIA MMIO address ranges
To: Pengpeng Hou <hppiscas@163.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, 
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213659_391530_711C3FC3 
X-CRM114-Status: GOOD (  25.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBTZXAgMjAsIDIwMjYgYXQgNjozOeKAr1BNIFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNA
MTYzLmNvbT4gd3JvdGU6Cj4KPiBUaGUgQUlBIGFkZHJlc3Mgc2V0dGVycyBjaGVjayBhbGlnbm1l
bnQgYnV0IG5vdCB0aGUgY29tcGxldGUgZml4ZWQtc2l6ZQo+IEFQTElDIGFuZCBJTVNJQyBNTUlP
IHJlZ2lvbnMuIEEgcmFuZ2UgY2FuIHRoZXJlZm9yZSB3cmFwIHdoZW4gaXRzIGVuZCBpcwo+IGZv
cm1lZCBvciBleHRlbmQgYmV5b25kIHRoZSBzZWxlY3RlZCBndWVzdCBwaHlzaWNhbCBhZGRyZXNz
IHNwYWNlIGJlZm9yZQo+IGl0IGlzIHJlZ2lzdGVyZWQgb24gdGhlIEtWTSBNTUlPIGJ1cy4KPgo+
IENoZWNrIHRoZSBjb21wbGV0ZSByYW5nZSBpbiBib3RoIHNldHRlcnMuIFJldHVybiAtRUlOVkFM
IGZvciBhbGlnbm1lbnQKPiBvciBhcml0aG1ldGljIG92ZXJmbG93IGFuZCAtRTJCSUcgZm9yIGEg
cmFuZ2UgYmV5b25kIHRoZSBzZWxlY3RlZCBHUEEKPiBsaW1pdCwgZm9sbG93aW5nIHRoZSBhcm02
NCBWR0lDIGFkZHJlc3MtdmFsaWRhdGlvbiBjb252ZW50aW9uLgo+Cj4gUmVjaGVjayBvbmx5IHRo
ZSBBUExJQyByYW5nZSBkdXJpbmcgaW5pdGlhbGl6YXRpb246IHVzZXJzcGFjZSBjYW4gc2V0Cj4g
aXRzIGFkZHJlc3MgYW5kIHRoZW4gY2hhbmdlIEtWTV9DQVBfVk1fR1BBX0JJVFMgd2hpbGUgdGhl
IFZNIHN0aWxsIGhhcwo+IG5vIHZDUFVzIG9yIG1lbW9yeSBzbG90cy4gQW4gSU1TSUMgYWRkcmVz
cywgaW4gY29udHJhc3QsIGNhbiBvbmx5IGJlIHNldAo+IGZvciBhbiBleGlzdGluZyB2Q1BVLCB3
aGljaCBhbHJlYWR5IHByZXZlbnRzIHN1YnNlcXVlbnQgR1BBLXdpZHRoCj4gY2hhbmdlcy4gTm8g
YWRkaXRpb25hbCBwYXNzIG92ZXIgdGhlIHZDUFVzIGlzIG5lZWRlZC4KPgo+IEtlZXAgdGhlIGV4
aXN0aW5nIHJlcXVpcmVkLWFkZHJlc3MgY2hlY2tzIGFuZCBJTVNJQyBjbGVhbnVwIHBhdGguCj4K
PiBUaGUgaXNzdWUgd2FzIGZvdW5kIGJ5IG91ciBzdGF0aWMtYW5hbHlzaXMgdG9vbC4KPgo+IEZp
eGVzOiA4OWQwMTMwNmUzNGQgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IGRldmljZSBpbnRlcmZh
Y2UgZm9yIEFJQSBpcnFjaGlwIikKPiBBc3Npc3RlZC1ieTogZ3B0IDUKPiBTaWduZWQtb2ZmLWJ5
OiBQZW5ncGVuZyBIb3UgPGhwcGlzY2FzQDE2My5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8zOGY4NzIwNTQxOWYzMjg2OTNiYzZhYjI1YWU3
OGYwMjFjMmRkMDAzLjE3ODY1MTI2NzEuZ2l0LnBlbmdwZW5nQGlzY2FzLmFjLmNuLwo+IC0gS2Vl
cCB0aGUgb3JpZ2luYWwgQVBMSUMgYW5kIHBlci12Q1BVIElNU0lDIHJlcXVpcmVkLWFkZHJlc3Mg
Y2hlY2tzLgo+IC0gRHJvcCB0aGUgc2VwYXJhdGUgcGFzcyBvdmVyIGFsbCB2Q1BVcyBkdXJpbmcg
aW5pdGlhbGl6YXRpb24uCj4gLSBSZWNoZWNrIG9ubHkgQVBMSUMsIHdob3NlIGFkZHJlc3MgY2Fu
IGJlIGNvbmZpZ3VyZWQgYmVmb3JlIEdQQSB3aWR0aAo+ICAgYmVjb21lcyBpbW11dGFibGU7IElN
U0lDIHNldHRlcnMgYWxyZWFkeSByZXF1aXJlIGFuIGV4aXN0aW5nIHZDUFUuCj4KPiAgYXJjaC9y
aXNjdi9rdm0vYWlhX2RldmljZS5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgYi9hcmNoL3Jp
c2N2L2t2bS9haWFfZGV2aWNlLmMKPiBpbmRleCBlZmM3YzBiLi40NDkwMDE1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYwo+IEBAIC0xMCw3ICsxMCw5IEBACj4gICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9rdm1faG9zdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvb3ZlcmZsb3cuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiArI2luY2x1ZGUgPGFzbS9rdm1fZ3N0YWdlLmg+Cj4gICNp
bmNsdWRlIDxhc20va3ZtX2lzYS5oPgo+Cj4gIHN0YXRpYyBpbnQgYWlhX2NyZWF0ZShzdHJ1Y3Qg
a3ZtX2RldmljZSAqZGV2LCB1MzIgdHlwZSkKPiBAQCAtMTQyLDE3ICsxNDQsMzcgQEAgc3RhdGlj
IGludCBhaWFfY29uZmlnKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlLAo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IGFpYV9jaGVja19hZGRyX3Jhbmdl
KHN0cnVjdCBrdm0gKmt2bSwgdTY0IGFkZHIsIHU2NCBhbGlnbm1lbnQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1NjQgc2l6ZSkKPiArewo+ICsgICAgICAgdTY0IGVuZDsKPiAr
Cj4gKyAgICAgICBpZiAoIUlTX0FMSUdORUQoYWRkciwgYWxpZ25tZW50KSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgaWYgKGNoZWNrX2FkZF9vdmVyZmxv
dyhhZGRyLCBzaXplLCAmZW5kKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
Kwo+ICsgICAgICAgaWYgKGVuZCA+IGt2bV9yaXNjdl9nc3RhZ2VfZ3BhX3NpemUoa3ZtLT5hcmNo
LnBnZF9sZXZlbHMpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUUyQklHOwo+ICsKPiArICAg
ICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IGFpYV9hcGxpY19hZGRyKHN0cnVj
dCBrdm0gKmt2bSwgdTY0ICphZGRyLCBib29sIHdyaXRlKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
a3ZtX2FpYSAqYWlhID0gJmt2bS0+YXJjaC5haWE7Cj4gKyAgICAgICBpbnQgcmV0Owo+Cj4gICAg
ICAgICBpZiAod3JpdGUpIHsKPiAgICAgICAgICAgICAgICAgLyogV3JpdGVzIGNhbiBvbmx5IGJl
IGRvbmUgYmVmb3JlIGlycWNoaXAgaXMgaW5pdGlhbGl6ZWQgKi8KPiAgICAgICAgICAgICAgICAg
aWYgKGt2bV9yaXNjdl9haWFfaW5pdGlhbGl6ZWQoa3ZtKSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVCVVNZOwo+Cj4gLSAgICAgICAgICAgICAgIGlmICgqYWRkciAmIChLVk1f
REVWX1JJU0NWX0FQTElDX0FMSUdOIC0gMSkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGFpYV9jaGVja19hZGRyX3Jhbmdl
KGt2bSwgKmFkZHIsIEtWTV9ERVZfUklTQ1ZfQVBMSUNfQUxJR04sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEtWTV9ERVZfUklTQ1ZfQVBMSUNfU0laRSk7Cj4g
KyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPgo+ICAgICAgICAgICAgICAgICBhaWEtPmFwbGljX2FkZHIgPSAqYWRkcjsKPiAgICAg
ICAgIH0gZWxzZQo+IEBAIC0xNjYsNiArMTg4LDcgQEAgc3RhdGljIGludCBhaWFfaW1zaWNfYWRk
cihzdHJ1Y3Qga3ZtICprdm0sIHU2NCAqYWRkciwKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bV92
Y3B1ICp2Y3B1Owo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X2FpYSAqdmNwdV9haWE7Cj4gKyAg
ICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICB2Y3B1ID0ga3ZtX2dldF92Y3B1KGt2bSwgdmNwdV9p
ZHgpOwo+ICAgICAgICAgaWYgKCF2Y3B1KQo+IEBAIC0xNzcsOCArMjAwLDEwIEBAIHN0YXRpYyBp
bnQgYWlhX2ltc2ljX2FkZHIoc3RydWN0IGt2bSAqa3ZtLCB1NjQgKmFkZHIsCj4gICAgICAgICAg
ICAgICAgIGlmIChrdm1fcmlzY3ZfYWlhX2luaXRpYWxpemVkKGt2bSkpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPgo+IC0gICAgICAgICAgICAgICBpZiAoKmFkZHIg
JiAoS1ZNX0RFVl9SSVNDVl9JTVNJQ19BTElHTiAtIDEpKQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICByZXQgPSBhaWFfY2hlY2tfYWRk
cl9yYW5nZShrdm0sICphZGRyLCBLVk1fREVWX1JJU0NWX0lNU0lDX0FMSUdOLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fREVWX1JJU0NWX0lNU0lDX1NJ
WkUpOwo+ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIG11dGV4X2xvY2soJnZjcHUtPm11
dGV4KTsKPiBAQCAtMjQ4LDYgKzI3MywxNSBAQCBzdGF0aWMgaW50IGFpYV9pbml0KHN0cnVjdCBr
dm0gKmt2bSkKPiAgICAgICAgIGlmIChhaWEtPm5yX3NvdXJjZXMgJiYgYWlhLT5hcGxpY19hZGRy
ID09IEtWTV9SSVNDVl9BSUFfVU5ERUZfQUREUikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4KPiArICAgICAgIC8qIFRoZSBHUEEgd2lkdGggbWF5IGNoYW5nZSBhZnRlciBzZXR0
aW5nIEFQTElDJ3MgYWRkcmVzcyBvbiBhbiBlbXB0eSBWTS4gKi8KPiArICAgICAgIGlmIChhaWEt
Pm5yX3NvdXJjZXMpIHsKPiArICAgICAgICAgICAgICAgcmV0ID0gYWlhX2NoZWNrX2FkZHJfcmFu
Z2Uoa3ZtLCBhaWEtPmFwbGljX2FkZHIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEtWTV9ERVZfUklTQ1ZfQVBMSUNfQUxJR04sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEtWTV9ERVZfUklTQ1ZfQVBMSUNfU0laRSk7Cj4g
KyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiArICAgICAgIH0KPiArCgpXZSBzaG91bGQgYWxzbyBjaGVjayBJTVNJQyBhZGRyZXNz
ZXMgb25lIG1vcmUgdGltZSBpbiBhaWFfaW5pdCgpLiBJIHdpbGwKdGFrZSBjYXJlIG9mIGl0IGF0
IHRoZSB0aW1lIG9mIG1lcmdpbmcuCgo+ICAgICAgICAgLyogR3JvdXAgaW5kZXggYml0cyBtdXN0
IG5vdCBvdmVybGFwIGd1ZXN0IGFuZCBIQVJUIGluZGV4IGJpdHMuICovCj4gICAgICAgICBpZiAo
YWlhLT5ucl9ncm91cF9iaXRzICYmCj4gICAgICAgICAgICAgYWlhLT5ucl9ncm91cF9zaGlmdCA8
IChJTVNJQ19NTUlPX1BBR0VfU0hJRlQgKwo+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3Ig
TGludXgtNy40LXJjWAoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
