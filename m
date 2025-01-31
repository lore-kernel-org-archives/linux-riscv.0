Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C9EC0218A
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 00:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gS0ayrrar2d6WG+iYnZ/gbLV703B/3dKeQJUwJSL2KA=; b=PllQ13hS7I3107
	s6gh3Q9o3JYD5K84Ws6oSAdRbFLh+yKBd89ecEokWk8PFoLNWVYbFObAnhq56ciNapJ6d40z5pkA+
	nnx4fe6G2PkdrFdZirknzhOYXR0Q/yw5Z6wZZf4O4Foef69eMAnle4GFeaLgbkodLhQU60FPLURJY
	hHEOX6iMpVjAdpNIBwhvBOaATEiqMpPPxx6a8X/uWMFwwR4GVnpKjFV8JS2EoGcoXoH9yv9/vvG4V
	tGe4+/OCEH/yOIL5u3mgES0ZYAeybdgOdajhBs23CT7HqMK49TCWWr6BEOLHM7KSO3iG0vNf0IVSI
	lYPerNoxLv972HXin3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfNS-00000009ryA-46h3;
	Fri, 31 Jan 2025 00:59:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfNP-00000009rxn-3Ug7
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 00:59:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2166f1e589cso35141825ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 16:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738285159; x=1738889959; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cUgOKqFkRsm4oPHXb8aVKMWr0SLZSnGfeke0UV1RBn0=;
        b=VA6m3UdipMW0DGrj9oBQfxwKKj56c5CwD3YwuudHhYN7T94zZRIzw13r5OtJF9jXXE
         8Dc3KOtvJUEEy3lyJj/OIYfdBBYTspstWw9LBDGNqNYnu05+Ehw8xXvIh3W1H3QkdH7O
         oyrWT7R8Qwb0FQqz6d6jdl99oZ0yd5Tinv+Ap500vrA9SevyhuNGQkr4G0n1S8S+68FS
         MhXZ1Q6MxaYUKOAwp7zzCndCZwDIPJ8BC7+ROWiQszLS1QD/bDTam0dzgw69Y/ZhSgr5
         Nnkv6tCyOOOnika/xXH0GZsj3EAiOtR2NdKZOJ3tq15YtJKFdzKUttVHiebMmAlYS6jC
         npQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738285159; x=1738889959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgOKqFkRsm4oPHXb8aVKMWr0SLZSnGfeke0UV1RBn0=;
        b=OIar+i1Yz2OVL+kqqR2k+JehiHlS1oVJY99IUTzvd6BaZvl3FHL3PfzPMtErpD5x0F
         6RZbJbNj02zlHhp7hGxpGXX2uVZfBo9Hz74tAdr5Z7lWTO6mJAP7Uj0LGqr6wKPPhi2y
         kQpkzbsCW/yPHi1iOj1MeWmhcfqgbECMHnwUtPs2905qkDPagPrqCn3soJQ170Cm7L6p
         lLlC7habcpTEfEHISOUlnCwHTg3jxRuJ2VEqrdsDJ5DMOToWj0Km2xxkIALrD+wbE2DV
         5FB32jgsDeCaEUK9GeKi8lVPkOgsiIFhGy1S3A+0xHQ9poubuasIhi6YM2CPx3HerYS0
         DaHw==
X-Forwarded-Encrypted: i=1; AJvYcCWxJOEcRExofr3NUIBKEXj/GSNBIeExE23oiCuZ/nfudD/l1MHOdLhaAGEmMCX4O54sUS/BbMQz5fi76Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW1dckrvweb4vAFVKuoxwy8UGjqMk/SHz7+BGMouszU+rgG2gN
	4ZogNJZTcgMWUYcPCTIqRxTKGteXS1BNQ8FTVnGLEOkTkHYoZy23NNit1oASopU=
X-Gm-Gg: ASbGncu0gjyb7bjmE8PICrIvGCsW00aqeBshcz3FLit0tDcSNEpGtymbDoOOhholiZj
	verRgVppvXKPW0JP5YosnK78Kj6xuehszYtTW0PdcURzK1ieu6A+aHV+AY3wSRKPabQ6juDJbMe
	KLOCY6UmtH0Jx2cgfCqtgyxtFQLjt2gJHrJp2gXrx1atGEZx4ghDVFmW+/j7J5ptLtmARDvOQ6v
	pB6nXPGzN9dHbd98gpv4vjEluH3E8eTnzODFafYGcQMWA+7nEN7xTX96Plba8bLAd5e4grbneGf
	plmMf2knU8p1OuvL/sAQxZAgG3i++BNtIRGyq2ai78+BWsj5rw==
X-Google-Smtp-Source: AGHT+IGRII0QPm3rxHT+zVo2k8HvV+c2UWRw3gIsn7i7+HbIEYjPA+itL3Fh9hFoa0ppbbJxcfNQNQ==
X-Received: by 2002:a05:6a00:1946:b0:72a:aa0f:c86e with SMTP id d2e1a72fcca58-72fd0bda6c1mr13416483b3a.4.1738285158873;
        Thu, 30 Jan 2025 16:59:18 -0800 (PST)
Received: from ghost (c-24-56-227-58.customer.broadstripe.net. [24.56.227.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe64267aesm2097761b3a.47.2025.01.30.16.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 16:59:18 -0800 (PST)
Date: Thu, 30 Jan 2025 16:59:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <Z5wgZHnvu9EeE4xq@ghost>
References: <20250129131703.733098-1-arikalo@gmail.com>
 <20250129-museum-slider-3bb634d124de@spud>
 <Z5wEKS9q8-nYPO7h@ghost>
 <20250131-unknotted-yoga-bccacad0c6d3@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250131-unknotted-yoga-bccacad0c6d3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_165920_934279_4A129D56 
X-CRM114-Status: GOOD (  37.21  )
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

T24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgMTI6NDM6MTJBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFRodSwgSmFuIDMwLCAyMDI1IGF0IDAyOjU4OjQ5UE0gLTA4MDAsIENoYXJsaWUg
SmVua2lucyB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDI5LCAyMDI1IGF0IDA0OjE5OjU4UE0gKzAw
MDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDI6
MTc6MDNQTSArMDEwMCwgQWxla3NhbmRhciBSaWthbG8gd3JvdGU6Cj4gPiA+ID4gRnJvbTogRGpv
cmRqZSBUb2Rvcm92aWMgPGRqb3JkamUudG9kb3JvdmljQGh0ZWNncm91cC5jb20+Cj4gPiA+ID4g
Cj4gPiA+ID4gVGhlIHJpc2N2IE1JUFMgUDg3MDAgdXNlcyBhIGRpZmZlcmVudCBvcGNvZGUgZm9y
IFBBVVNFLgo+ID4gPiA+IEl0IGlzIGEg4oCYaGludOKAmSBlbmNvZGluZyBvZiB0aGUgU0xMSSBp
bnN0cnVjdGlvbiwgd2l0aCByZD0wLCByczE9MCBhbmQKPiA+ID4gPiBpbW09NS4gSXQgd2lsbCBi
ZWhhdmUgYXMgYSBOT1AgaW5zdHJ1Y3Rpb24gaWYgbm8gYWRkaXRpb25hbCBiZWhhdmlvcgo+ID4g
PiA+IGJleW9uZCB0aGF0IG9mIFNMTEkgaXMgaW1wbGVtZW50ZWQuCj4gPiA+IAo+ID4gPiBZb3Ug
c2F5IHA4NzAwLCBidXQgdGhlIGVycmF0dW0gd2lsbCBiZSBhcHBsaWVkIG9uIGFsbCBzeXN0ZW1z
IHRoYXQgYXJlCj4gPiA+IGlkZW50aWZpZWQgYXMgdXNpbmcgYSBtaXBzIGNwdS4gV2h5J3MgdGhh
dD8KPiA+ID4gCj4gPiA+ID4gK3ZvaWQgbWlwc19lcnJhdGFfcGF0Y2hfZnVuYyhzdHJ1Y3QgYWx0
X2VudHJ5ICpiZWdpbiwKPiA+ID4gPiArCQkJCQkgICAgIHN0cnVjdCBhbHRfZW50cnkgKmVuZCwK
PiA+ID4gPiArCQkJCQkgICAgIHVuc2lnbmVkIGxvbmcgYXJjaGlkLAo+ID4gPiA+ICsJCQkJCSAg
ICAgdW5zaWduZWQgbG9uZyBpbXBpZCwKPiA+ID4gPiArCQkJCQkgICAgIHVuc2lnbmVkIGludCBz
dGFnZSkKPiA+ID4gPiArewo+ID4gPiA+ICsJc3RydWN0IGFsdF9lbnRyeSAqYWx0Owo+ID4gPiA+
ICsKPiA+ID4gPiArCUJVSUxEX0JVR19PTihFUlJBVEFfTUlQU19OVU1CRVIgPj0gUklTQ1ZfVkVO
RE9SX0VYVF9BTFRFUk5BVElWRVNfQkFTRSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJaWYgKHN0YWdl
ID09IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UKQo+ID4gPiA+ICsJCXJldHVybjsKPiA+
ID4gPiArCj4gPiA+ID4gKwlmb3IgKGFsdCA9IGJlZ2luOyBhbHQgPCBlbmQ7IGFsdCsrKSB7Cj4g
PiA+ID4gKwkJaWYgKGFsdC0+dmVuZG9yX2lkICE9IE1JUFNfVkVORE9SX0lEKQo+ID4gPiA+ICsJ
CQljb250aW51ZTsKPiA+ID4gPiArCj4gPiA+ID4gKwkJaWYgKGFsdC0+cGF0Y2hfaWQgPj0gRVJS
QVRBX01JUFNfTlVNQkVSKSB7Cj4gPiA+ID4gKwkJCVdBUk4oMSwgIk1JUFMgZXJyYXRhIGlkOiVk
IG5vdCBpbiBrZXJuZWwgZXJyYXRhIGxpc3RcbiIsCj4gPiA+ID4gKwkJCSAgICAgYWx0LT5wYXRj
aF9pZCk7Cj4gPiA+ID4gKwkJCWNvbnRpbnVlOwo+ID4gPiA+ICsJCX0KPiA+ID4gPiArCj4gPiA+
ID4gKwkJbXV0ZXhfbG9jaygmdGV4dF9tdXRleCk7Cj4gPiA+ID4gKwkJcGF0Y2hfdGV4dF9ub3N5
bmMoQUxUX09MRF9QVFIoYWx0KSwgQUxUX0FMVF9QVFIoYWx0KSwgYWx0LT5hbHRfbGVuKTsKPiA+
ID4gPiArCQltdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwo+ID4gPiA+ICsJfQo+ID4gPiA+ICt9
Cj4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Zkc28vcHJvY2Vzc29yLmggYi90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJv
Y2Vzc29yLmgKPiA+ID4gPiBpbmRleCA2NjJhY2EwMzk4NDguLjg4MGYyNmEyNGY2OSAxMDA2NDQK
PiA+ID4gPiAtLS0gYS90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29y
LmgKPiA+ID4gPiArKysgYi90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vz
c29yLmgKPiA+ID4gPiBAQCAtMTQsNyArMTQsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIGNwdV9y
ZWxheCh2b2lkKQo+ID4gPiA+ICAJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJkaXYgJTAsICUwLCB6
ZXJvIiA6ICI9ciIgKGR1bW15KSk7Cj4gPiA+ID4gICNlbmRpZgo+ID4gPiA+ICAKPiA+ID4gPiAt
I2lmZGVmIENPTkZJR19UT09MQ0hBSU5fSEFTX1pJSElOVFBBVVNFCj4gPiA+ID4gKyNpZmRlZiBD
T05GSUdfRVJSQVRBX01JUFNfUDg3MDBfUEFVU0VfT1BDT0RFCj4gPiA+ID4gKyAgICAvKiBNSVBT
IFA4NzAwIHBhdXNlIG9wY29kZSAqLwo+ID4gPiA+ICsgICAgX19hc21fXyBfX3ZvbGF0aWxlX18g
KCIuNGJ5dGUgMHgwMDUwMTAxMyIpOwo+ID4gPiA+ICsjZWxpZiBDT05GSUdfVE9PTENIQUlOX0hB
U19aSUhJTlRQQVVTRQo+ID4gPiA+ICAJLyoKPiA+ID4gPiAgCSAqIFJlZHVjZSBpbnN0cnVjdGlv
biByZXRpcmVtZW50Lgo+ID4gPiA+ICAJICogVGhpcyBhc3N1bWVzIHRoZSBQQyBjaGFuZ2VzLgo+
ID4gPiAKPiA+ID4gV2hhdCBhYm91dCB3aGVuIHRoZSBlcnJhdHVtIGlzIGVuYWJsZWQgYW5kIHRo
ZSB0b29sY2hhaW4gc3VwcG9ydHMKPiA+ID4gWmloaW50cGF1c2U/Cj4gPiAKPiA+IFNvIHRoZSBv
dGhlciB3YXkgdG8gZG8gdGhpcyBpcyBoYXZpbmcgYW4gaHdwcm9iZSBjYWxsIHRvIGNoZWNrIGlm
IHRoZQo+ID4gY3VycmVudGx5IHJ1bm5pbmcgcHJvY2Vzc29yIGlzIGVmZmVjdGVkIGJ5IHRoaXMu
IEhvd2V2ZXIgSSB3YXMgY29uY2VybmVkCj4gPiBhYm91dCB0aGUgcGVyZm9ybWFuY2UgcGVuYWx0
eSBvZiBjYWxsaW5nIGh3cHJvYmUgaGVyZSBpbiB0aGUgcHJldmlvdXMKPiA+IHZlcnNpb24gc28g
SSBoYWQgc3VnZ2VzdGVkIHRvIHVzZSBhIGZsYWcgaW5zdGVhZCBzbyB0aGVyZSBpcyBub3QgdGhl
Cj4gPiBwZW5hbHR5IG9uIG90aGVyIGFyY2hpdGVjdHVyZXMuIFRoaXMgZG9lcyBtYWtlIGl0IGlu
dmFsaWQgdG8gZW5hYmxlCj4gPiB0aGlzIGVycmF0YSBpbiB0aGUgZGVmY29uZmlnLiBUaGlzIGlz
IGEgcHJlY2VkZW50IGZvciBob3cgd2Ugd2FudCB0bwo+ID4gaGFuZGxlIGVycmF0YSBpbiB0b29s
cy4KPiAKPiBHb25uYSBoYXZlIHRvIGJlIG1hcmtlZCBub24tcG9ydGFibGUgdGhlbiwgaWYgZW5h
YmxpbmcgaXQgcmVzdWx0cyBpbgo+IHRvb2xzIHRoYXQgbWlnaHQgbWFsZnVuY3Rpb24gb24gb3Ro
ZXIgcGxhdGZvcm1zLgo+IAo+ID4gPiBXaHkgZG9uJ3QgeW91IHVzZSB0aGUgc2FtZSBpbXBsZW1l
bnRhdGlvbiBhcyB0aGUgIXRvb2xzCj4gPiA+IGNvcHkgb2YgdGhlIGhlYWRlcj8gKEknbSBub3Qg
c3VyZSB3aHkgdGhleSdyZSBkaWZmZXJlbnQgaW4gdGhlIGZpcnN0Cj4gPiA+IHBsYWNlKS4KPiA+
IAo+ID4gSXQgaXMgZGlmZmVyZW50IGJlY2F1c2UgdGhlIGhlYWRlcnMgaW4gdG9vbHMgYXJlIHVz
ZXJzcGFjZSBzbyBpdCBkb2Vzbid0Cj4gPiBtYWtlIHNlbnNlIHRvIGhhdmUgYWx0ZXJuYXRpdmVz
Lgo+IAo+IEkgYXNzdW1lIHRoYXQncyBhbiBhbnN3ZXIgdG8gdGhlIGZpcnN0IHBhcnQsIGFuZCBu
b3QgdGhlIGJpdCBpbgo+IGJyYWNrZXRzIHNpbmNlIHRoZSAiZmlyc3QgcGxhY2UiIGRpZmZlcmVu
Y2UgaXMgYWJvdXQgdXNpbmcgdGhlIC40Ynl0ZQo+IHZlcnN1cyBoYXZpbmcgYW4gaWZkZWYvZWxz
ZSBhbmQgeW91J3JlIHRhbGtpbmcgYWJvdXQgYWx0ZXJuYXRpdmVzLgo+IFRoYXQgbG9va3MgdG8g
aGF2ZSBiZWVuIHNvbWUgc29ydCBvZiBzeW5jIGlzc3VlIG9yIG92ZXJzaWdodCBpbgo+IDZkYTEx
MTU3NGJhZmYsIG5vPwoKWWVhaCBpdCB3YXMgYSByZXNwb25zZSB0byB0aGUgZmlyc3QgcGFydC4K
CkFzIGZvciB0aGUgc2Vjb25kIHBhcnQsIHllcyBpdCBsb29rIGl0IHdhcyBhIHN5bmNpbmcgaXNz
dWUuCgotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
