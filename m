Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8616BC02196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3ZEnbszyaTZMHFMigiuDmb4zOLaFyFXxuxo+PIff7o=; b=C9CGOeRcGq1qqT
	CR9in/GyVjB67p0BZEV8Sjyc2hNRk8t6nAwLGBcHMalQMLcPxaahbkQJ983pBTHZUrxMmojL5v9Vl
	fQcUdnFNTXh0SL42VrSTgRcetGcXTSAqv4mKE/PQK14KqKRKlaRhIJVF9gxA93+Z7/v6qULjbmg2g
	dxuloIpI7aLC/jQ44Vp6MeBtuUxb6yhGi3MoUA2OYxEqtSgT6otBeKgrAakEqR+mgeh7qHHn3ZCcR
	qZouQgI0zCl7nvzXIuLDDQK4+e9MyQz1ttX7CpmmzUct0tI8G1tjYE2IVZrTIJseZwr6McPLYnwcE
	Ilzoa5IiPCXiIT7JIz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teqRL-0000000EgDj-0Fk1;
	Mon, 03 Feb 2025 07:00:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teqQf-0000000Eg70-0sB2
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 06:59:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43626213fffso30753845e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 02 Feb 2025 22:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738565971; x=1739170771; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFYnAZUFUao61yVy6zNuCPtiUmdvsXsUKmfDPfyAsoM=;
        b=d0STJXPHmn9sca5BCEWIVRUz81zIicOU6x1OLCmAwpuCn4U2sfeMc4HLQqC1Ij7/uX
         GOINk8jRDobGz6FygqU1kVshBMkb7vym3gnmpD1IcQ0v2gzr7IdSb9OmDk6u9RimaLcn
         gKTYNHMiIVesJTj4EROjWzq/FTUzWh9rqK2jr5EWBh3r69G8KT4NkCN8/HHZg9Y09Ved
         DY/GqW8s8xkYxkr6BUnDDsYXnlEJ9f/dUotBY5nri+AjIMUIl5i+EFqfWU8Wg/FX1BG2
         uiLmUgM2Q+2ADXpHWP6E1nJrI8HVBbpRoRDZV2M8ZvOarKQWFPxjsd2iIffYnTPVIBfU
         oorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565971; x=1739170771;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFYnAZUFUao61yVy6zNuCPtiUmdvsXsUKmfDPfyAsoM=;
        b=K/rtqJNZOorP/m+F+J5oFWV2YPbJ+kro/K+1sWn6+zO3gj2ZrrzT/9tYx1Xcsw4niy
         CTlnRFtb666mOsZyUVF+Tx00njFCq/YPPxAMopoaZ2dEOak0sndZfPmOUVvktoX+9r6h
         ceBACr0xfgWCi9d39O6oZtDJCMNPDhJHDqkehZ3rv8vh3cJOcknlgyDoRs0tO0FQybmc
         nDsSHvwF7MlAtI9CdDtid77fWkb/OVXtjPBVBlmPiWRSQCYt51KSAJFbZcyjmnHRY2mk
         hofE+dk3vWj9Hu+hAE1zN7IgxkpwGxbka178LqByx1CKQgGJWWsZXWCNVgmtjGRnOemQ
         KdWA==
X-Forwarded-Encrypted: i=1; AJvYcCWvnaC1DLSQ0MAbRtzjaBErJQavJfhheLLtLcG+u5yUxm5cdNgK34XGgwk58rLCYGcddrI/nEK3ByHVQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQYtR4bBbhfVG9HoxSb3lmWcGdrt8Gsfxbk0fPfFN9pynUybnV
	fhmV2FthFIvSo4JsGcg/Ap33Sz2KJUj9st+fii5gIaTF6wLm65kZTJbZOqiPYGY=
X-Gm-Gg: ASbGncvmotR/j7/xb1ZquG/+dBSuSttmsG09Aj/M4B0jQFpN/AqRP0UGJce69TT7ZhX
	T7qi5yW2RZ6SS7XepmRKV8Uw64OiYI4sYr3NsRh4ojrpjFMXIObSPAT7oRpHfJm8aB9euka0myA
	Gn9rdyq/uYOUhIMDd0LxarcyFlsPMRm4MQOghB7Ju7q6yuUMgveW/IeCu7VHvIpNPTcPWQdKK+A
	mjVoqi9Ml7Ly5c2Zu+O0NNP9pfWdhlQEstTiZEG2B72CnWO5vrcicKfB5VXZ7jdYC6FVKGE6KX6
	rT6EluoIIyWsW/bltm4EE6MFJnDC
X-Google-Smtp-Source: AGHT+IHc7TsMH05mlkvzaFMBpTxzhfd0jlMSaJGgcjOwELt4l0ZR8Uoj4RfcTaQK8b7AR3LEmPTKuA==
X-Received: by 2002:a05:6000:1a8a:b0:38a:8d32:2707 with SMTP id ffacd0b85a97d-38c60f77922mr10339567f8f.26.1738565971037;
        Sun, 02 Feb 2025 22:59:31 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfccasm12025244f8f.92.2025.02.02.22.59.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:59:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250202-clammy-skewed-eb0a0fce18f1@spud>
Date: Mon, 3 Feb 2025 06:59:18 +0000
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrea Parri <parri.andrea@gmail.com>,
 Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Eric Chan <ericchancf@google.com>,
 linux-kernel@vger.kernel.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
Message-Id: <D0D039F7-26EE-4687-9836-DE076006F2F0@jrtc27.com>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_225933_261328_FC05ECC1 
X-CRM114-Status: GOOD (  17.49  )
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

T24gMiBGZWIgMjAyNSwgYXQgMjA6MDgsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gCj4gT24gU2F0LCBGZWIgMDEsIDIwMjUgYXQgMDE6MDQ6MjVQTSArMDEwMCwgQWxl
a3NhbmRhciBSaWthbG8gd3JvdGU6Cj4+IE9uIEZyaSwgSmFuIDEwLCAyMDI1IGF0IDQ6MjPigK9B
TSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gCj4+Pj4g
RnJvbTogQ2hhby15aW5nIEZ1IDxjZnVAbWlwcy5jb20+Cj4+Pj4gCj4+Pj4gVXNlIG9ubHkgTFIv
U0MgaW5zdHJ1Y3Rpb25zIHRvIGltcGxlbWVudCBhdG9taWMgZnVuY3Rpb25zLgo+Pj4gCj4+PiBJ
biB0aGUgcHJldmlvdXMgcGF0Y2ggeW91IG1lbnRpb24gdGhhdCB0aGlzIGlzIHRvIHN1cHBvcnQg
TUlQUyBQODcwMC4gQ2FuCj4+PiB5b3UgZXhwYW5kIG9uIHdoeSB0aGlzIGNoYW5nZSBpcyByZXF1
aXJlZD8gVGhlIGRhdGFzaGVldCBhdCBbMV0gc2F5czoKPj4+IAo+Pj4gIlRoZSBQODcwMCBjb3Jl
IGlzIGNvbmZpZ3VyZWQgdG8gc3VwcG9ydCB0aGUgUlY2NEdDWmJhX1piYiAoRyA9IElNQUZEKQo+
Pj4gU3RhbmRhcmQgSVNBLiBJdCBpbmNsdWRlcyB0aGUgUlY2NEkgYmFzZSBJU0EsIE11bHRpcGx5
IChNKSwgQXRvbWljIChBKSwKPj4+IFNpbmdsZS1QcmVjaXNpb24gRmxvYXRpbmcgUG9pbnQgKEYp
LCBEb3VibGUgKEQpLCBDb21wcmVzc2VkIChDKSBSSVNDLVYKPj4+IGV4dGVuc2lvbnMsIGFzIHdl
bGwgYXMgdGhlIGFzIHdlbGwgYXMgdGhlIGJpdC1tYW5pcHVsYXRpb24gZXh0ZW5zaW9ucwo+Pj4g
KFpiYSkgYW5kIChaYmIpIgo+Pj4gCj4+PiBUaGUgIkEiIGV4dGVuc2lvbiBpcyBhIHBhcnQgb2Yg
IkciIHdoaWNoIGlzIG1vc3RseSBhc3N1bWVkIHRvIGV4aXN0IGluCj4+PiB0aGUga2VybmVsLiBB
ZGRpdGlvbmFsbHksIGhhdmluZyB0aGlzIGJlIGEgY29tcGlsYXRpb24gZmxhZyB3aWxsIGNhdXNl
Cj4+PiB0cmFwcyBvbiBnZW5lcmljIGtlcm5lbHMuIFdlIGdlbmVyYWxseSB0cnkgdG8gcHVzaCBl
dmVyeXRoaW5nIHdlIGNhbgo+Pj4gaW50byBydW50aW1lIGZlYXR1cmUgZGV0ZWN0aW9uIHNpbmNl
IHRoZXJlIGFyZSBzbyBtYW55IHBvc3NpYmxlIHZhcmlhbnRzCj4+PiBvZiByaXNjdi4KPj4+IAo+
Pj4gRXhwcmVzc2luZyBub3QgYmVpbmcgYWJsZSB0byBwZXJmb3JtIGEgZmVhdHVyZSBsaWtlIHRo
aXMgaXMgbm9ybWFsbHkKPj4+IGJldHRlciBleHByZXNzZWQgYXMgYW4gZXJyYXRhLiBUaGVuIGdl
bmVyaWMga2VybmVscyB3aWxsIGJlIGFibGUgdG8KPj4+IGluY2x1ZGUgdGhpcywgYW5kIGFueWJv
ZHkgd2hvIGRvZXNuJ3Qgd2FudCB0byBoYXZlIHRoZSBleHRyYSBub3BzCj4+PiBpbnRyb2R1Y2Vk
IGNhbiBkaXNhYmxlIHRoZSBlcnJhdGEuIEEgc2ltaWxhciBhcHByb2FjaCB0byB3aGF0IEkgcG9p
bnRlZAo+Pj4gb3V0IGxhc3QgdGltZSBzaG91bGQgd29yayBoZXJlIHRvbyAoYnV0IHdpdGggbW9y
ZSBwbGFjZXMgdG8gcmVwbGFjZSkKPj4+IFsyXS4KPj4+IAo+Pj4gWzFdIGh0dHBzOi8vbWlwcy5j
b20vd3AtY29udGVudC91cGxvYWRzLzIwMjQvMTEvUDg3MDBfRGF0YV9TaGVldC5wZGYKPj4+IFsy
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1oyLVVOZndjQVFZWnFWQlVAZ2hvc3QvVC8K
Pj4gCj4+IFNvIGZhciB3ZSBoYXZlbid0IGZvdW5kIGEgd2F5IHRvIGRvIHRoaXMgdXNpbmcgZXJy
YXRhLgo+IAo+IFlvdSBtZWFuIHVzaW5nIGFsdGVybmF0aXZlcz8gTm90IGltcGxlbWVudGluZyBB
LCBidXQgaW5zdGVhZAo+IGltcGxlbWVudGluZyBaYWxyc2MsIGlzIG5vdCBhbiBlcnJhdHVtLiBJ
dCdzIGEgZGVzaWduIGRlY2lzaW9uLgo+IAo+PiBUaGVyZSdzIG5vIHdheQo+PiB0byBwYXRjaCBv
bmUgaW5zdHJ1Y3Rpb24gd2l0aCBtdWx0aXBsZSBvbmVzLAo+IAo+IEhhdmUgeW91IGxvb2tlZCBh
dCBob3cgdGhlIGFsdGVybmF0aXZlcyB3b3JrPyBUaGVyZSdzIG5vIHJlcXVpcmVtZW50Cj4gdGhh
dCB0aGUgc2VxdWVuY2VzIGhhdmUgdGhlIHNhbWUgbnVtYmVyIG9mIGluc3RydWN0aW9ucywgcGFk
ZGluZyBpcwo+IGFsbG93ZWQuCj4gCj4+IGFuZCB3ZSBhbHNvIG5lZWQgYW4gZXh0cmEKPj4gKHRl
bXBvcmFyeSkgcmVnaXN0ZXIuCj4+IAo+PiBBIENQVSBjYW4gaW1wbGVtZW50IHRoZSBaYWxyc2Mg
ZXh0ZW5zaW9uIFsxXSBpbnN0ZWFkIG9mICJjb21wbGV0ZSBBIgo+PiAod2hpY2ggUDg3MDAgZG9l
cykuCj4+PiBGcm9tICJaYWFtbyBhbmQgWmFscnNjIEV4dGVuc2lvbnMiIHNwZWM6Cj4gCj4gV2h5
IGRvZXMgdGhpcyBzdGF0ZW1lbnQgZGlmZmVyIGZyb20gdGhlIFA4NzAwIGRhdGFzaGVldCBsaW5r
ZWQgYWJvdmU/CgpJbiBhbiBMTFZNIHBhdGNoIHNldmVyYWwgd2Vla3MgYWdvIGl0IHdhcyBzYWlk
IHRoYXQgWmFhbW8gaXMKaW1wbGVtZW50ZWQgaW4gZmlybXdhcmUgYnkgdHJhcHBpbmcgYW5kIGVt
dWxhdGluZyB3aXRoIExSL1NDLgoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
