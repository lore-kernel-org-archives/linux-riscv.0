Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F28D64099
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 23:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg40+u15OksJbvkLmtWzBtzKGiLPD2V8Uno94i8slIg=; b=z++ol0VubwiKc6
	X94pMaaa5uTXDELJuPWm/QWV3OC0b09xwTIxB8lvqJJhJWRjWnOc/Dt0IbviIxHHcnSEP1CdSakbT
	/aksff4J/HE6Rzu47AGD/Jj9bVVMzf5+cBrJRcYDHKOcUEs1ZiW40jr+s9OVoG2eqnQCi0aAtHNrl
	tN2KVBU64OMccADjcX66UbmuNUdlbu8aFu36FYHwfy6mZI4gqa18ZY8CxN9H96B/sc/psddx92XaA
	me/K3Gb/eyP7HOb1AAYo/eWe9vg4tLBZxzks7/kiYg/SKOgcpJlx5BP5epBb0OQz4oDUADy587+V0
	hTY0fdVft+tUayjCl8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YDn-0000000CCeu-1NMa;
	Fri, 08 Nov 2024 23:16:55 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YDI-0000000CCYN-17Pn
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:16:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-720aa3dbda5so2039588b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731107783; x=1731712583; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3s19kqrmyY22Y7qqFzMaAHjUFofrm4HNgSWYVbsk21c=;
        b=E1VMYWb86M3KrO6mRE755ZLM5T7EHZZkoJtWD/fkmwb3TE70OnDA85Rdt6SXd8jHN4
         G4M14cvEYsAb7qn8U1Ez1YqpFC+uz+imd2+TwBFdwH0RUBjz2hkeuyi0D1r2IULNUsuC
         DuzG3W8y4dTWQppzRsdwXOxb1++G3awlA5JE903WvNMnmzosNmlMQ+SZFnGYuWtgKsJ6
         xwklS5sCLDPfdY9GsVY0GRfOL7ZH4AazkeWIDzpPxdUrO9TzEreSZbLVIEOQpqV4WuvC
         ej+nINW2yvWlyxGdWI+cIU9Z8A2+6yOd57xsCw5ByWZzZzxqlQgybHlfYDQ8qZwwLerl
         rbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731107783; x=1731712583;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3s19kqrmyY22Y7qqFzMaAHjUFofrm4HNgSWYVbsk21c=;
        b=iC6YlcAe6R2mf+Jm+wl9LI0dqddtOzGwuI9m/rm9cpkdK81oUNzD70RCNzpp0Krs3b
         SWgi2AqiWo2T02jnlOLNm7Qt61+Qq6KVFyxSsywXfwodijMuAM3uwwo0kCVKQkQJgQPp
         OgKiv5skSlp0MChlBc4IHId8/qZco04W82vgNbuums17gQ+AB1/Oq8B6ahnEekWMiEr+
         YfG9qhdfzVr0AEClTwLJy3ERF2/K3yMOBN8H8dZZkviiChvmMEGdL/SsKdyopVJfnSc1
         8XS92ExTpLsszwe46FLP3xSmD0fV/Zy40oPEVo1WjSCDnqtYxQIpVhjwwSC01aXGXc2D
         LXwA==
X-Forwarded-Encrypted: i=1; AJvYcCXD8F0XbyS4uYb/D+bwh53m0uBcdGfvc+GfpU/Ttgq/nS9JaQk+XG003r5conJTdh+ivd3Y3cqyYMQKww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZY58NqgcJeGb97fACTGlwtyyk5mbuukYBxT+ghK/yDz6XGAZ4
	JgFTFT7M2WP/v0NpDkalcAbCTHnl90q1tEhzSQ/DtK3bvmoWMnwLpoiKD4UcsOo=
X-Google-Smtp-Source: AGHT+IHWS2zI7KGQTmBA7oV9V+N8SCN4SRWJ3iSOSny0p4gLDXp0McEBB/xZ6NoObJZivwctCIwgIQ==
X-Received: by 2002:a17:90b:5447:b0:2d8:a672:1869 with SMTP id 98e67ed59e1d1-2e9b174807emr6165396a91.32.1731107782960;
        Fri, 08 Nov 2024 15:16:22 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc82a8sm36221385ad.28.2024.11.08.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 15:16:22 -0800 (PST)
Date: Fri, 8 Nov 2024 15:16:19 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse T <mr.bossman075@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-next] riscv: Fix default misaligned access trap
Message-ID: <Zy6bw8Fnkxl2Q78K@ghost>
References: <20241107-fix_handle_misaligned_load-v1-1-07d7852c9991@rivosinc.com>
 <CAJFTR8RBcoqYmWNmNe_ZixO3bv2aP-wGCbX7ieorXYxxMAa7BA@mail.gmail.com>
 <CAJFTR8Sas83NkRPSuSdbb3qtDNra=cbinPoBmpyt4_ic8R5LQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJFTR8Sas83NkRPSuSdbb3qtDNra=cbinPoBmpyt4_ic8R5LQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_151624_547448_BA023E2F 
X-CRM114-Status: GOOD (  19.72  )
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

T24gRnJpLCBOb3YgMDgsIDIwMjQgYXQgMDU6MTI6MDRQTSAtMDUwMCwgSmVzc2UgVCB3cm90ZToK
PiBPbiBGcmksIE5vdiA4LCAyMDI0IGF0IDU6MDnigK9QTSBKZXNzZSBUIDxtci5ib3NzbWFuMDc1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBOb3YgNywgMjAyNCBhdCA1OjM44oCv
UE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IENvbW1pdCBkMTcwM2RjN2JjOGUgKCJSSVNDLVY6IERldGVjdCB1bmFsaWduZWQgdmVjdG9y
IGFjY2Vzc2VzCj4gPiA+IHN1cHBvcnRlZCIpIHJlbW92ZWQgdGhlIGRlZmF1bHQgaGFuZGxlcnMg
Zm9yIGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoKQo+ID4gPiBhbmQgaGFuZGxlX21pc2FsaWduZWRf
c3RvcmUoKS4gV2hlbiB0aGUga2VybmVsIGlzIGNvbXBpbGVkIHdpdGhvdXQKPiA+ID4gUklTQ1Zf
U0NBTEFSX01JU0FMSUdORUQKPiA+IFRlY2huaWNhbGx5IENPTkZJR19SSVNDVl9NSVNBTElHTkVE
Lgo+ID4gSSBhcHBhcmVudGx5IGNoYW5nZWQgYCtvYmoteSArPSB0cmFwc19taXNhbGlnbmVkLm9g
IHRvCj4gPiBgK29iai0kKENPTkZJR19SSVNDVl9NSVNBTElHTkVEKSArPSB0cmFwc19taXNhbGln
bmVkLm9gCj4gPiBpbiBWMiBhbmQgZGlkbid0IGNoYW5nZSB0aGF0IGNoZWNrIGJhY2sgb29wcyBz
b3JyeS4KPiA+Cj4gPiA+ICwgdGhlc2UgaGFuZGxlcnMgYXJlIG5ldmVyIGRlZmluZWQsIGNhdXNp
bmcKPiA+ID4gY29tcGlsYXRpb24gZXJyb3JzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBD
aGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
SmVzc2UgVGF1YmUgPG1yLmJvc3NtYW4wNzVAZ21haWwuY29tPgo+ID4KPiA+ID4gRml4ZXM6IGQx
NzAzZGM3YmM4ZSAoIlJJU0MtVjogRGV0ZWN0IHVuYWxpZ25lZCB2ZWN0b3IgYWNjZXNzZXMgc3Vw
cG9ydGVkIikKPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNv
bW1vbi5oIHwgMTIgKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
bnRyeS1jb21tb24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmgKPiA+
ID4gaW5kZXggN2IzMmQyYjA4YmI2Li5jMjgwODU2MWRmODEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaAo+ID4gPiBAQCAtMjUsNyArMjUsMTkgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGFyY2hfZXhpdF90b191c2VyX21vZGVfcHJlcGFyZShzdHJ1Y3QgcHRf
cmVncyAqcmVncywKPiA+ID4gIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpOwo+ID4gPiAgdm9pZCBoYW5kbGVfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+
ID4gPgo+ID4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAo+IAo+IE1l
YW50IHRvIHNheSB0byBjaGFuZ2UgdGhpcyB0byBDT05GSUdfUklTQ1ZfTUlTQUxJR05FRC4KPiBB
cyB0aGV5IGFyZSBkZWZpbmVkIHdoZW4gQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVEIGlz
IGZhbHNlCj4gYW5kIENPTkZJR19SSVNDVl9WRUNUT0VfTUlTQUxJR05FRCBpcyB0cnVlLiB0aGV5
IGFyZSBvbmx5IG5vdCBkZWZpbmVkIHdoZW4KPiBDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdO
RUQgaXMgZmFsc2UuCgpPaCB5ZXMsIHRoYW5rIHlvdSEKCi0gQ2hhcmxpZQoKPiAKPiA+ID4gIGlu
dCBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiA+ID4gIGlu
dCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gPiA+ICsj
ZWxzZQo+ID4gPiArc3RhdGljIGlubGluZSBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gK3sKPiA+ID4gKyAgICAgICByZXR1cm4gLTE7Cj4gPiA+
ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGhhbmRsZV9taXNhbGlnbmVkX3N0
b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gPiArewo+ID4gPiArICAgICAgIHJldHVybiAt
MTsKPiA+ID4gK30KPiA+ID4gKyNlbmRpZgo+ID4gPgo+ID4gPiAgI2VuZGlmIC8qIF9BU01fUklT
Q1ZfRU5UUllfQ09NTU9OX0ggKi8KPiA+ID4KPiA+ID4gLS0tCj4gPiA+IGJhc2UtY29tbWl0OiA3
NDc0MWEwNTBiNzlkMzFkOGQyZWVlZTEyYzc3NzM2NTk2ZDBhNmIyCj4gPiA+IGNoYW5nZS1pZDog
MjAyNDExMDctZml4X2hhbmRsZV9taXNhbGlnbmVkX2xvYWQtOGJlODZjYjA4MDZlCj4gPiA+IC0t
Cj4gPiA+IC0gQ2hhcmxpZQo+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
