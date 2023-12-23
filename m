Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A845C46CD3
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 03:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2sLCO3qKKmf/KhoL0fJyEC1OjvyaOoSvSCR0SVCIg8=; b=MJ7wDCh3Rrf+FI
	i4nKLwaCeWvoCd/owepP5+2jEBpaYwiCXQxP8qCzd1+H+NhCuWZCnObsVmt0SaL8DWXMMvutBAN3I
	Lk9o4wlUL9ENIweh5NfRhkE5T+GeFRFJXQG2VtBOAoWkGyYw/YPD1HmXhxAFcBr7M9VNI/LW/mPFN
	+PRmzTMXRWH36E7ojGRclN0kx3MG/1ZqYLJqbV+0xJ7VXpaaZifyA9jSCMhdGJ++Q5xiUfHHeGiy/
	u0iTg7FGv21vV/KgZgSqSbthfbwuQAEU5yyazcXMWTHoa32iegE4GNc5tWBtmZy+bntaSmQAAIOru
	LARBcPej0YB0kISJo4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsoj-007I8g-2k;
	Sat, 23 Dec 2023 03:36:49 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsog-007I7W-25
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 03:36:48 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bb85a202c2so1272447b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 19:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703302603; x=1703907403; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gk7B3KrzxZzeHiI8miK48fRulREz0I4yE9Agea2Gg9U=;
        b=KblwW+s26339xDzbanKl++g2NCM9l88Z22+Iu9/1NeKWj84uP3+AlF7t5yEbgOzffP
         1t8UrAYKXlPKesGREv4BUgqg+tXGfqO05dynoJzs45NI4lkZ3D+tAmntGJ+JxumOFxF4
         c049dalr1O+I/SD/cxtcSwjQvL8ALrCr/l8pe0jfh2FDEj0d7GLmRG9wToltzJI3XGF5
         XjeAKBnzUWGxTi764ZzcLyRz/Ni1bpCVAKhUTglUhEqNnBq9T3DjyseCguqVIGmVBcgK
         UZ+PXaRMatXfwKWGEsTbT1P70bKgqhxTX1dW2wxp5YjbZzFdLOYpLKEyAlyRkM90FfTJ
         l1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703302603; x=1703907403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk7B3KrzxZzeHiI8miK48fRulREz0I4yE9Agea2Gg9U=;
        b=Vg9eWTVIOQ6YgnvKesrTeFaVzvw5Bs8ktWMOdnlW7p5kEHEwnh9kRcgId78/e1X940
         17WATD/LSz38F073Q+rJC2otCJikx6zQzu+GAyMXPXuJSasjfpZwddZPzm1F+/89se1O
         W0Lfsr2Yd5G+p6ZX7kHNr/tixoOhHArsltEx5aGOTmy84TSVgCFDQUHjIxQRMZViZTwY
         Ciu9CswiLF6Lu5chnJoR1RzPy3rXWePoPz042fda+D6xIV2bhdvoPhTpmckBmh1itH4Y
         bz/z1VHv76EiggXcAxIxD2XtGiBt+09Us+1UEac+LBvt8mflQXEUKHZ30hUIQqFBZ3bx
         Pv6A==
X-Gm-Message-State: AOJu0Yx7FvDAJnUs/LXWPZ1GLFDTn9d/QUQeV6ZAHzE6I7pzE7HJW4qq
	fUsY3SG0QJvL8hZweq9plFdh1hDgY8Jkhg==
X-Google-Smtp-Source: AGHT+IEO5Ec5EkwzWH54J3IM8DaQZHy+XPgAcqVlCFHOsQy9QN6dPasA91RGiJdI57DVf/XdxwNHFA==
X-Received: by 2002:a05:6808:189d:b0:3b8:b063:9b52 with SMTP id bi29-20020a056808189d00b003b8b0639b52mr2825068oib.68.1703302603572;
        Fri, 22 Dec 2023 19:36:43 -0800 (PST)
Received: from ghost ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id cp15-20020a056808358f00b003b85bd22147sm806729oib.49.2023.12.22.19.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 19:36:43 -0800 (PST)
Date: Fri, 22 Dec 2023 19:36:39 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	alexghiti@rivosinc.com, xiao.w.wang@intel.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com,
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
Subject: Re: [PATCH V3 1/4] riscv: mm: Fixup compat mode boot failure
Message-ID: <ZYZVx58W7f3inR7m@ghost>
References: <20231222115703.2404036-1-guoren@kernel.org>
 <20231222115703.2404036-2-guoren@kernel.org>
 <ZYZMsgL9Bcz1J_Bd@LeoBras>
 <CAJF2gTR7VvHhm4QUpEkk8P=b__HqbXZ7ggW9DvkD1fUpoKPTew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR7VvHhm4QUpEkk8P=b__HqbXZ7ggW9DvkD1fUpoKPTew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_193646_925744_C59E30F0 
X-CRM114-Status: GOOD (  30.26  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMTE6MDc6MjlBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBTYXQsIERlYyAyMywgMjAyMyBhdCAxMDo1OOKAr0FNIExlb25hcmRvIEJyYXMgPGxlb2Jy
YXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDY6
NTc6MDBBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+IEZyb206IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4KPiA+ID4gSW4gQ09NUEFUIG1vZGUs
IHRoZSBTVEFDS19UT1AgaXMgREVGQVVMVF9NQVBfV0lORE9XICgweDgwMDAwMDAwKSwgYnV0Cj4g
PiA+IHRoZSBUQVNLX1NJWkUgaXMgMHg3ZmZmMDAwLiBXaGVuIHRoZSB1c2VyIHN0YWNrIGlzIHVw
b24gMHg3ZmZmMDAwLCBpdAo+ID4gPiB3aWxsIGNhdXNlIGEgdXNlciBzZWdtZW50IGZhdWx0LiBT
b21ldGltZXMsIGl0IHdvdWxkIGNhdXNlIGJvb3QKPiA+ID4gZmFpbHVyZSB3aGVuIHRoZSB3aG9s
ZSByb290ZnMgaXMgcnYzMi4KPiA+ID4KPiA+ID4gRnJlZWluZyB1bnVzZWQga2VybmVsIGltYWdl
IChpbml0bWVtKSBtZW1vcnk6IDIyMzZLCj4gPiA+IFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJv
Y2Vzcwo+ID4gPiBTdGFydGluZyBpbml0OiAvc2Jpbi9pbml0IGV4aXN0cyBidXQgY291bGRuJ3Qg
ZXhlY3V0ZSBpdCAoZXJyb3IgLTE0KQo+ID4gPiBSdW4gL2V0Yy9pbml0IGFzIGluaXQgcHJvY2Vz
cwo+ID4gPiAuLi4KPiA+ID4KPiA+ID4gSW5jcmVhc2UgdGhlIFRBU0tfU0laRSB0byBjb3ZlciBT
VEFDS19UT1AuCj4gPiA+Cj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+IEZp
eGVzOiBhZGQyY2M2YjY1MTUgKCJSSVNDLVY6IG1tOiBSZXN0cmljdCBhZGRyZXNzIHNwYWNlIGZv
ciBzdjM5LHN2NDgsc3Y1NyIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBs
aW51eC5hbGliYWJhLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4gaW5kZXggYWIw
MDIzNWIwMThmLi43NGZmYjIxNzhmNTQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4gPiA+IEBAIC04ODEsNyArODgxLDcgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVf
c3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4gPiA+ICAjZGVmaW5lIFRBU0tfU0laRV9N
SU4gICAgICAgIChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiA+ID4KPiA+ID4g
ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiA+IC0jZGVmaW5lIFRBU0tfU0laRV8zMiAoX0FDKDB4
ODAwMDAwMDAsIFVMKSAtIFBBR0VfU0laRSkKPiA+ID4gKyNkZWZpbmUgVEFTS19TSVpFXzMyIChf
QUMoMHg4MDAwMDAwMCwgVUwpKQo+ID4gPiAgI2RlZmluZSBUQVNLX1NJWkUgICAgKHRlc3RfdGhy
ZWFkX2ZsYWcoVElGXzMyQklUKSA/IFwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICBUQVNL
X1NJWkVfMzIgOiBUQVNLX1NJWkVfNjQpCj4gPiA+ICAjZWxzZQo+ID4gPiAtLQo+ID4gPiAyLjQw
LjEKPiA+ID4KPiA+Cj4gPiBJIGFtIG5vdCByZWFsbHkgaW52b2x2ZWQgaW4gdGhlIGlzc3VlIHRo
aXMgaXMgc29sdmluZywgc28gSSBoYXZlIG5vCj4gPiB0ZWNobmljYWwgb3BpbmlvbiBvbiB0aGUg
c29sdXRpb24uCj4gPgo+ID4gSUlVQyB0aGVyZSBzaG91bGQgYWx3YXlzIGJlIChUQVNLX1NJWkUg
Pj0gU1RBQ0tfVE9QKSwgc28gYnkgaXRzZWxmIHRoaXMKPiA+IGlzIGZpeGluZyBhbiBpc3N1ZS4K
PiA+Cj4gPiBJIGhhdmUgcmV2aWV3ZWQgdGhlIGNvZGUgYW5kIGl0IGRvZXMgZXhhY3RseSBhcyBz
dGF0ZWQgaW50byB0aGUgY29tbWl0Cj4gPiBtZXNzYWdlLCBzbyBGV0lXOgo+ID4gUmV2aWV3ZWQt
Ynk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiBUaHgsCj4gCj4gSSBmb3Vu
ZCB0aGlzIHByb2JsZW0gYmVjYXVzZSBpdCBjYW4ndCBib290IG15IHJ2MzIgYnVpbGRyb290LXJv
b3RmcyBpbgo+IHY2LjYuIEJ1dCBpdCdzIG9rYXkgaW4gdjYuNS4gU28gSSB1c2VkIGdpdCBiaXNl
Y3QgYW5kIGZvdW5kIGNvbW1pdDoKPiBhZGQyY2M2YjY1MTUgKCJSSVNDLVY6IG1tOiBSZXN0cmlj
dCBhZGRyZXNzIHNwYWNlIGZvcgo+IHN2Mzksc3Y0OCxzdjU3IiksIHdoaWNoIGNhdXNlZCB0aGF0
Lgo+IAo+IFBpbmcgQ2hhcmxpZSwgSSBob3BlIGl0IGNhbiBiZSBmaXhlZCBpbiB0aGUgdjYuNiBs
b25nLXRlcm0gdmVyc2lvbi4KCkkgaGF2ZSBsb29rZWQgYXQgdGhpcyBtb3JlIEkgZG8gYWdyZWUg
dGhhdCB0aGlzIGNoYW5nZSBtYWtlcyBzZW5zZS4gSQp3YXMgdGhpbmtpbmcgdGhhdCBpdCB3YXMg
dmFsaWQgdG8gaGF2ZSBTVEFDS19UT1AgdGhhdCB3YXMgZ3JlYXRlciB0aGFuClRBU0tfU0laRSBi
dXQgSSBhbSBubyBsb25nZXIgY29udmluY2VkIHRoYXQgaXMgdHJ1ZS4gVGhhbmsgeW91IGZvcgps
b29raW5nIGludG8gdGhpcy4KClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVA
cml2b3NpbmMuY29tPgoKPiAKPiA+Cj4gCj4gCj4gCj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiAgR3Vv
IFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
