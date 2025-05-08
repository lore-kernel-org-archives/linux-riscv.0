Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75A6C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuV/opizAT5c2Zt+U4215YGy4soZVAQOgWzhKQAfWco=; b=vgKZQWq6j1eKxV
	lwmREWjMGopsd0tagPVgvdF0E8ofqEaWguxMX70bqL6+qjTTeawQ0Q0ctFqtRJQJ8+iFNuLPZfRbc
	CTGVmUtgaa5ULblhPs/S7g0/895NsDivj1nZPM3qodOP9GDZwH5fxjoTD9XFtWCkGr8+WfFKt3LeC
	aCjfbxvtOjm+i9jhduA+30/hcG2BetDfxSza6FyfZsyBxaufgxVUPBuRQGOU2gLUvi5UuqoCavVu5
	E3/YCfVvo9X80nqO4xpUR+ivVz1wZsY1Yxd/g4S9TetFRA4zKt6XeSSkTN2NT1nKcRkJJaN7M9MJ/
	NoiFg5so5z+SW+tt3oWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2JK-00000000wKs-2Za5;
	Thu, 08 May 2025 14:33:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Yh-00000000nhB-0MiZ
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 13:45:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a0b5b90b7aso142330f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711905; x=1747316705; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddvWwlvmJ56gF3G0LSGRAILthDv6fgZpldIeC6gbgK4=;
        b=ow6TcuHH5rCm9BSfautDzfd4B5p76kq0L/agQo1hjR5wk9PVT9u4z28bwV3e1dfuwE
         q9PzNPA7AfKaI8JOih90V4DW1XauQJ3hjAoB3qBBfWa/C2N8/GOCFJbn/FQAb9BQ0u9g
         9ZeRT3jYndLaIvmjnpWjTKv6DdeglfnelQC01OyqNiFnF2nOILBys6IPr7OTUKAoCKh6
         sQMpqloE/YAu67M30EY50N1ayS4uvVJriF+RyVjBCL3s0uDez3rM25fmYCBRWzs6kq/c
         8KfGdMIT/DWPqmwCX1Qbthh/7bRWLkYPbd/5RWNUEdC74cnL2G0zBqX55/s64RI1aRB8
         PDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711905; x=1747316705;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddvWwlvmJ56gF3G0LSGRAILthDv6fgZpldIeC6gbgK4=;
        b=C/LUoHe1UP/HLpMXp9QALMWwabg51fBBuyqFq2Dl2SCCRXe8r+t6pseoGWoe5oaVqV
         iRMU5PhrXLBx/MVI6FRF7Z2ivDBGGQBKQtVvsnq+/VvmdXmypHirR6YJzEF1/AZXWKPx
         IF2VeVZA0tJ0LZRMCoGD7OxqjFrjpVBJPUoc3gwDPWhmapmufJdWgAL1lJ4dnEOS4r0G
         CTfAXerRZi+aQhTfR6P6bD7kXROzbZAPGjTB5GWBUOXxu1wACU0wZSI4jF5TviofiPmN
         aNY6vbCuhBMjuO0zWgbn9YgBO9n+xgMZxOO1WpRgNO41R3FsDA3/akbnx34bih5AmvkC
         etWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTK+9Ua2gQeLi1rg8T7LkL2xQR0shrWdBvyUTd9V0KpzMpmNxCPDc66WJLDuGBnSgZPpamVjjQOhtwFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydhnLegAtVhXJ1jYvzX/jH/4R67HAfbnF3ejo557ccKW/hk4iE
	Xjp6oelWpZpZbPuoETIhjU88zYdSBVeHkzSGRJuF2C+NL9ZPjmttY2R8dg5wc1U=
X-Gm-Gg: ASbGnct9DxA/sBpTUqD6Kw5Yw9Ic1WVVjYcQqtbLcKXAuYczStXwuWQLaAaePX7cpzu
	vdUCv6L3Khgdb4oISIUsHxLjh9SXtHJoI6oYvhxL+MkaVCJBuYIpTzPPCWST0LHOwCsR4YuxbSE
	nVRP200AtAZmxytN45uHOVpL9IJ/62S08cfjXjqKkHm+S5UDjRpczRUILegjVDzs+sXUlHre3Kv
	0UdBhi5J+Kscd1Z/LbBJpqbJcjQMqf31sr3v4e8kkxXmQiaqc3kLtEA/rLr1DDXBA6KyUYT4ioz
	dAmTDFlPMlfxW5bvCyeOpRGImAaeaeFvtysX1TbGPMiRKzOejNN6ycIrCKI=
X-Google-Smtp-Source: AGHT+IFF1lCrGjkOjvYLS8FuS71T+NJYPZUDl1ROqgtA2qAAckMb6oaYDMoD6JX8fEG+cSaT0+BVjg==
X-Received: by 2002:a05:6000:178e:b0:3a1:3543:a74a with SMTP id ffacd0b85a97d-3a13543abcdmr434102f8f.7.1746711905310;
        Thu, 08 May 2025 06:45:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe00sm26063f8f.38.2025.05.08.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:45:03 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 May 2025 15:45:03 +0200
Message-Id: <D9QTOYMN362W.398FE9SQB0S4X@ventanamicro.com>
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com> <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev> <D9Q05T702L8Y.3UTLG7VXIFXOK@ventanamicro.com> <ec73105c-f359-4156-8285-b471e3521378@linux.dev>
In-Reply-To: <ec73105c-f359-4156-8285-b471e3521378@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_064507_123756_12CB528C 
X-CRM114-Status: GOOD (  18.04  )
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

MjAyNS0wNS0wN1QxNzozNDozOC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS83LzI1IDc6MzYgQU0sIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPj4gMjAy
NS0wNS0wNlQxMToyNDo0MS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRl
dj46Cj4+PiBPbiA1LzYvMjUgMjoyNCBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+IDIw
MjUtMDUtMDVUMTQ6Mzk6MjUtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PjoKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBUaGlzIHNlcmllcyBleHRlbmRzCj4+Pj4+IHRob3NlIHRvIGVuYWJsZSB0byBjb3JyZXBz
b25kaW5nIGhzdGF0ZWVuIGJpdHMgaW4gUEFUQ0gxLiBUaGUgcmVtYWluaW5nCj4+Pj4+IHBhdGNo
ZXMgYWRkcyBsYXp5IGVuYWJsaW5nIHN1cHBvcnQgb2YgdGhlIG90aGVyIGJpdHMuCj4+Pj4gVGhl
IElTQSBoYXMgYSBwZWN1bGlhciBkZXNpZ24gZm9yIGhzdGF0ZWVuL3NzdGF0ZWVuIGludGVyYWN0
aW9uOgo+Pj4+Cj4+Pj4gICAgIEZvciBldmVyeSBiaXQgaW4gYW4gaHN0YXRlZW4gQ1NSIHRoYXQg
aXMgemVybyAod2hldGhlciByZWFkLW9ubHkgemVybwo+Pj4+ICAgICBvciBzZXQgdG8gemVybyks
IHRoZSBzYW1lIGJpdCBhcHBlYXJzIGFzIHJlYWQtb25seSB6ZXJvIGluIHNzdGF0ZWVuCj4+Pj4g
ICAgIHdoZW4gYWNjZXNzZWQgaW4gVlMtbW9kZS4KPj4+IENvcnJlY3QuCj4+Pgo+Pj4+IFRoaXMg
bWVhbnMgd2UgbXVzdCBjbGVhciBiaXQgNjMgaW4gaHN0YXRlZW4gYW5kIHRyYXAgb24gc3N0YXRl
ZW4KPj4+PiBhY2Nlc3NlcyBpZiBhbnkgb2YgdGhlIHNzdGF0ZWVuIGJpdHMgYXJlIG5vdCBzdXBw
b3NlZCB0byBiZSByZWFkLW9ubHkgMAo+Pj4+IHRvIHRoZSBndWVzdCB3aGlsZSB0aGUgaHlwZXJ2
aXNvciB3YW50cyB0byBoYXZlIHRoZW0gYXMgMC4KPj4+IEN1cnJlbnRseSwgdGhlcmUgYXJlIHR3
byBiaXRzIGluIHNzdGF0ZWVuLiBGQ1NSIGFuZCBaVlQgd2hpY2ggYXJlIG5vdAo+Pj4gdXNlZCBh
bnl3aGVyZSBpbiBvcGVuc2JpL0xpbnV4L0tWTSBzdGFjay4KPj4gVHJ1ZSwgSSBndWVzcyB3ZSBj
YW4ganVzdCBtYWtlIHN1cmUgdGhlIGN1cnJlbnQgY29kZSBjYW4ndCBieSBtaXN0YWtlCj4+IGxh
emlseSBlbmFibGUgYW55IG9mIHRoZSBib3R0b20gMzIgaHN0YXRlZW4gYml0cyBhbmQgaGFuZGxl
IHRoZSBjYXNlCj4+IHByb3Blcmx5IGxhdGVyLgo+Cj4gSSBjYW4gdXBkYXRlIHRoZSBjb3ZlciBs
ZXR0ZXIgYW5kIGxlYXZlIGEgY29tbWVudCBhYm91dCB0aGF0Lgo+Cj4gRG8geW91IHdhbnQgYSBh
ZGRpdGlvbmFsIGNoZWNrIGluIHNzdGF0ZWVuIAo+IHRyYXAoa3ZtX3Jpc2N2X3ZjcHVfaHN0YXRl
ZW5fZW5hYmxlX3N0YXRlZW4pCj4gdG8gbWFrZSBzdXJlIHRoYXQgdGhlIG5ldyB2YWx1ZSBkb2Vz
bid0IGhhdmUgYW55IGJpdHMgc2V0IHRoYXQgaXMgbm90IAo+IHBlcm1pdHRlZCBieSB0aGUgaHlw
ZXJ2aXNvciA/CgpJIHdhbnRlZCB0byBwcmV2ZW50IGt2bV9yaXNjdl92Y3B1X2hzdGF0ZWVuX2xh
enlfZW5hYmxlKCkgZnJvbSBiZWluZwphYmxlIHRvIG1vZGlmeSB0aGUgYm90dG9tIDMyIGJpdHMs
IGJlY2F1c2UgdGhleSBhcmUgZ3Vlc3QtdmlzaWJsZSBhbmQKS1ZNIGRvZXMgbm90IGhhbmRsZSB0
aGVtIGNvcnJlY3RseSAtLSBpdCdzIGFuIGludGVybmFsIEtWTSBlcnJvciB0aGF0CnNob3VsZCBi
ZSBtYWRlIG9idmlvdXMgdG8gZnV0dXJlIHByb2dyYW1tZXJzLgoKPj4+IEluIGNhc2UsIHdlIG5l
ZWQgdG8gZW5hYmxlIG9uZSBvZiB0aGUgYml0cyBpbiB0aGUgZnV0dXJlLCBkb2VzIGh5cGV2aXNv
cgo+Pj4gbmVlZCB0byB0cmFwIGV2ZXJ5IHNzdGF0ZWVuIGFjY2VzcyA/Cj4+IFdlIG5lZWQgdG8g
dHJhcCBzc3RhdGVlbiBhY2Nlc3NlcyBpZiB0aGUgZ3Vlc3QgaXMgc3VwcG9zZWQgdG8gYmUgYWJs
ZSB0bwo+PiBjb250cm9sIGEgYml0IGluIHNzdGF0ZWVuLCBidXQgdGhlIGh5cGVydmlzb3Igd2Fu
dHMgdG8gbGF6aWx5IGVuYWJsZQo+PiB0aGF0IGZlYXR1cmUgYW5kIHNldHMgMCBpbiBoc3RhdGVl
biB1bnRpbCB0aGUgZmlyc3QgdHJhcC4KPiBZZXMuIFRoYXQncyB3aGF0IFBBVENIIDQgaW4gdGhp
cyBzZXJpZXMgZG9lcy4KCkkgd2FzIHRoaW5raW5nIGFib3V0IHRoZSBjb3JyZWN0IGVtdWxhdGlv
bi4KCmUuZy4gZ3Vlc3Qgc2V0cyBzc3RhdGVlbiBiaXQgWCB0byAxLCBidXQgS1ZNIHdhbnRzIHRv
IGhhbmRsZSB0aGUgZmVhdHVyZQpYIGxhemlseSwgd2hpY2ggbWVhbnMgdGhhdCBoc3RhdGVlbiBi
aXQgWCBpcyAwLgpoc3RhdGVlbiBiaXQgU0UwIG11c3QgYmUgMCBpbiB0aGF0IGNhc2UsIGJlY2F1
c2UgS1ZNIG11c3QgdHJhcCB0aGUgZ3Vlc3QKYWNjZXNzIHRvIGJpdCBYIGFuZCBwcm9wZXJseSBl
bXVsYXRlIGl0LgpXaGVuIHRoZSBndWVzdCBhY2Nlc3NlcyBhIGZlYXR1cmUgY29udHJvbGxlZCBi
eSBzc3RhdGVlbiBiaXQgWCwgS1ZNIHdpbGwKbGF6aWx5IGVuYWJsZSB0aGUgZmVhdHVyZSBhbmQg
dGhlbiBzZXQgc3N0YXRlZW4gYW5kIGhzdGF0ZWVuIGJpdCBYLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
