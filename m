Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C971C36005
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 03:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/sUSn3O8+/KUDN98XnrTx5l3GEMZ5wQx4aunX5O2O8=; b=qmZHHpuXPm2lzx
	pIfTzQJWM3OpO7CGU4l/efyxD1jxck8mS9A6/bBM4a6zYDdRSywpm8/COg/6HuHhVFelmeK8fi5l3
	aB2FngTdhMsIKJsVc1aFboLFIk9RZPukxLWr4n1092TVPm1fNWpfMK/jYKUodiTVK3/yKnJbYhjHT
	MlK0ZxwdLHGNLOGkgQYUSfxioaxrj5Yef3ssWCJR/60hkyZdJ6mxFu8kCRCw0MfBX2tVNhwgF9KOG
	CQndEPHDEVP4BIAzp8invlDgL83Kz+tEv+Ikyf6GfwdcMKSHVq72ueoQxToN2NWM05ZdGPyRKqCFX
	b700luuPzYX7ug0aG21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txHPL-00000007TXa-1jLN;
	Wed, 26 Mar 2025 03:26:23 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txHPI-00000007TX3-2fXo
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 03:26:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso10815425a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 20:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742959579; x=1743564379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfIZvsvXpyObm/MeDnvF7J2nbF4JP/x/sNoYgG6zOmE=;
        b=E2cNhmVwEb8NXCqRyodqGzdZHNrt0LYxTRGBpbYLmhprnJNWqTM4iTF+0hmbIibI3H
         LGCtgnqQX1wvg2Ih5xFoPqBSknOECe07o7Ritjw7RqKj6CkobiR+MoKum7+l4ZOaJ+zW
         ngSk3qtOIonTIhZjVUqjoBwVnjlOczH6rtAgyAl1VNrYRcBw9/xRdIRm5JIcLsifkml/
         gaT2rXuNQq7W04/v/FGv9/qct/fTRZJu9C4cBVn/cwCQxquUTaj19sbdaH3lYMJG1iuk
         vXxCTewY+pOM+XkENunAH+GzLg/WwCzatHb0JMVdRHzKbCKmzoDTS3rbLDNk7CYjhIJk
         wGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742959579; x=1743564379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfIZvsvXpyObm/MeDnvF7J2nbF4JP/x/sNoYgG6zOmE=;
        b=mIDPQv821TjNsjlH8mLntFwl1mQ8gODVRY9nyHHnnJYqRhD4gN2Yv0eglSGnzKYV7f
         RgYP6m/UDrXOyPYyTxidvmMKAFA8gtI09w08RsXgYBsE1M2RTPNjt23zAwbOHWBTCjXL
         2FFxHGPBEABNcY/8vgbIdPBR803JdfzEf817I1q5JjdV2gMC+W7kYAl309HPe3rh74RC
         Ev3fMglElPXcFE5ltCYMh7BW1PJjIB46AXZSBEt1DdNBucmUK5UBMDZBulsR3IC7Pmt2
         Q/BUHXxgg+eOjPUUdNwbhq7SIzUJ61CFyOX054Jx2IQimmZNc4eY10BLN3mLbinhGnF4
         drvg==
X-Forwarded-Encrypted: i=1; AJvYcCUaCHj6KWx3RzEpNvlHhMjrIYB+8lng9vkNdQ/fPa5gdaZv6g0L0UIUpPgaSbUvMCYlYAsTe2gBWHAqCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnTXKiivEsRL6C7xwSlTkh0pUpvywe1ekYxkbnJoru3pgEq6c+
	PTyYJBH9D5Jj7miijzjXhFiHEeKENrpoJRnnMYi0AoCHgsUiupxkI4YuJ2TbEHr/v4LWspklEHJ
	sMTtQHsSfP256MHbD2sJkIwS3Va4xE4ehNbFPDdmPKHNm4tunRCArHw==
X-Gm-Gg: ASbGncvEzGTQvxNhEH7g5cupMy/+LMY2hpqbL8vS+AZ224JKFITr6pmkdVddFpC5dB/
	7BgIvgCUDkx2GUAmI5VZNiDIeIxZ3ZVrLo5g3AfEYmlyBjJMxTYQX0FefzUcWm9kNSE1lRZiMI4
	/yF/3snJRM0dBQlj9mIpnMyTxP/rAjWSQUTNbNLsY=
X-Google-Smtp-Source: AGHT+IESJp7bMb71tkEwSEqLlTExKVrqQjhhbFW5v0UB8BFvfnFaTdUzEAIGCTPbNRUOBYf4WDIquQovAJzJJAsBfdo=
X-Received: by 2002:a17:90b:540b:b0:2ff:52e1:c49f with SMTP id
 98e67ed59e1d1-3030fef7845mr25635283a91.26.1742959578594; Tue, 25 Mar 2025
 20:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250325144252.27403-1-luxu.kernel@bytedance.com> <9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com>
In-Reply-To: <9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 26 Mar 2025 11:26:07 +0800
X-Gm-Features: AQ5f1Jo0368Hu_uIx_F-VQxmteASeA53lS4ajgOXrFsQ3icn84Q0MxG88EP36ck
Message-ID: <CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32
 bit I/O bus platform
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, alex@ghiti.fr, lihangjing@bytedance.com, 
	xieyongji@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_202620_936285_B5599E53 
X-CRM114-Status: GOOD (  22.72  )
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

SGkgSmVzc2ljYSwKCj4gSXMgc3VjaCBhIHBsYXRmb3JtIGNvbmZvcm1hbnQgdG8gdGhlIHNwZWNp
ZmljYXRpb24/CgpXZSBoYXZlIHRhbGtlZCBhYm91dCB0aGlzIGJlZm9yZSBbMV0uIEkgdGhpbmsg
dGhlIElPTU1VIHNwZWMgZG9lcyBub3QKbWFuZGF0ZSB0aGUgaW1wbGVtZW50YXRpb24gb2YgOC1i
eXRlIGFjY2VzcyBmdW5jdGlvbmFsaXR5LiBUaGUgcmVsYXRlZApzZW50ZW5jZXMgYXJlIGxpc3Rl
ZCBiZWxvdzoKCiJUaGUgOC1ieXRlIElPTU1VIHJlZ2lzdGVycyBhcmUgZGVmaW5lZCBpbiBzdWNo
IGEgd2F5IHRoYXQgc29mdHdhcmUKY2FuIHBlcmZvcm0gdHdvIGluZGl2aWR1YWwgNC1ieXRlIGFj
Y2Vzc2VzLCBvciBoYXJkd2FyZSBjYW4gcGVyZm9ybQp0d28gaW5kZXBlbmRlbnQgNC1ieXRlIHRy
YW5zYWN0aW9ucyByZXN1bHRpbmcgZnJvbSBhbiA4LWJ5dGUgYWNjZXNzLAp0byB0aGUgaGlnaCBh
bmQgbG93IGhhbHZlcyBvZiB0aGUgcmVnaXN0ZXIsIGluIHRoYXQgb3JkZXIsIGFzIGxvbmcgYXMK
dGhlIHJlZ2lzdGVyIHNlbWFudGljcywgd2l0aCByZWdhcmQgdG8gc2lkZS1lZmZlY3RzLCBhcmUg
cmVzcGVjdGVkCmJldHdlZW4gdGhlIHR3byBzb2Z0d2FyZSBhY2Nlc3Nlcywgb3IgdHdvIGhhcmR3
YXJlIHRyYW5zYWN0aW9ucywKcmVzcGVjdGl2ZWx5LiIKCiJSZWdpc3RlcnMgdGhhdCBhcmUgNjQt
Yml0IHdpZGUgbWF5IGJlIGFjY2Vzc2VkIHVzaW5nIGVpdGhlciBhIDMyLWJpdApvciBhIDY0LWJp
dCBhY2Nlc3MuIgoKPiBFaXRoZXIgd2F5LCB3aHkgaXMgdGhpcyBhIHN0YXRpYyBidWlsZC10aW1l
IGNvbmZpZ3VyYXRpb24gY2hvaWNlIHJhdGhlciB0aGFuIGEgZHluYW1pYyBydW4tdGltZSBjaG9p
Y2UgYmFzZWQgb24gdGhlIEZEVCAvIEFDUEkgdGFibGVzIC8gc29tZSBvdGhlciBwbGF0Zm9ybSBw
cm9iaW5nIG1ldGhvZD8KCkkgZGlkIG5vdCBmaW5kIGF2YWlsYWJsZSBmaWVsZCBpbiBSSU1UIHRh
YmxlIHRvIGRlc2NyaWJlIGl0LiBTbyBtYXliZQphZGRpbmcgYSBuZXcgY29uZmlnIGlzIGZhc3Rl
ci4KClsxXSBodHRwczovL3d3dy51d3NnLmluZGlhbmEuZWR1L2h5cGVybWFpbC9saW51eC9rZXJu
ZWwvMjQwOC4zLzAzOTY4Lmh0bWwKCkJlc3QgUmVnYXJkcywKClh1IEx1CgpPbiBXZWQsIE1hciAy
NiwgMjAyNSBhdCAyOjUx4oCvQU0gSmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3
cm90ZToKPgo+IE9uIDI1IE1hciAyMDI1LCBhdCAxNDo0MiwgWHUgTHUgPGx1eHUua2VybmVsQGJ5
dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEludHJvZHVjZSBhIG5ldyBjb25maWd1cmF0aW9u
IENPTkZJR19SSVNDVl9JT01NVV8zMkJJVCB0byBlbmFibGUKPiA+IHNwbGl0dGluZyA4LWJ5dGUg
YWNjZXNzIGludG8gNC1ieXRlIHRyYW5zYWN0aW9ucyBmb3IgaGFyZHdhcmUgcGxhdGZvcm0KPiA+
IHdob3NlIEkvTyBidXMgbGltaXRzIGFjY2VzcyB0byA0LWJ5dGUgdHJhbnNmZXJzLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+Cj4gSXMg
c3VjaCBhIHBsYXRmb3JtIGNvbmZvcm1hbnQgdG8gdGhlIHNwZWNpZmljYXRpb24/IEVpdGhlciB3
YXksIHdoeSBpcwo+IHRoaXMgYSBzdGF0aWMgYnVpbGQtdGltZSBjb25maWd1cmF0aW9uIGNob2lj
ZSByYXRoZXIgdGhhbiBhIGR5bmFtaWMKPiBydW4tdGltZSBjaG9pY2UgYmFzZWQgb24gdGhlIEZE
VCAvIEFDUEkgdGFibGVzIC8gc29tZSBvdGhlciBwbGF0Zm9ybQo+IHByb2JpbmcgbWV0aG9kPwo+
Cj4gSmVzcwo+Cj4gPiAtLS0KPiA+IGRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZyB8ICA5ICsr
KysrKysrKwo+ID4gZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5oIHwgMjggKysrKysrKysrKysr
KysrKysrKysrKystLS0tLQo+ID4gMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L0tj
b25maWcgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGMwNzE4MTZmNTlh
Ni4uYjdjOWVhMjJkOTY5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9LY29u
ZmlnCj4gPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcKPiA+IEBAIC0xOCwzICsx
OCwxMiBAQCBjb25maWcgUklTQ1ZfSU9NTVVfUENJCj4gPiBkZWZfYm9vbCB5IGlmIFJJU0NWX0lP
TU1VICYmIFBDSV9NU0kKPiA+IGhlbHAKPiA+ICBTdXBwb3J0IGZvciB0aGUgUENJZSBpbXBsZW1l
bnRhdGlvbiBvZiBSSVNDLVYgSU9NTVUgYXJjaGl0ZWN0dXJlLgo+ID4gKwo+ID4gK2NvbmZpZyBS
SVNDVl9JT01NVV8zMkJJVAo+ID4gKyBib29sICJTdXBwb3J0IDQtQnl0ZSBBY2Nlc3NlcyBvbiBS
SVNDLVYgSU9NTVUgUmVnaXN0ZXJzIgo+ID4gKyBkZXBlbmRzIG9uIFJJU0NWX0lPTU1VCj4gPiAr
IGRlZmF1bHQgbgo+ID4gKyBoZWxwCj4gPiArICBTdXBwb3J0IGhhcmR3YXJlIHBsYXRmb3JtIHdo
b3NlIEkvTyBidXMgbGltaXRzIGFjY2VzcyB0byA0LWJ5dGUKPiA+ICsgIHRyYW5zZmVycy4gV2hl
biBlbmFibGVkLCBhbGwgYWNjZXNzZXMgdG8gSU9NTVUgcmVnaXN0ZXJzIHdpbGwgYmUKPiA+ICsg
IHNwbGl0IGludG8gNC1ieXRlIGFjY2Vzc2VzLgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUuaCBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaAo+ID4gaW5kZXgg
NDZkZjc5ZGQ1NDk1Li4wZTM1NTJhODE0MmQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LmgKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaAo+ID4g
QEAgLTE0LDYgKzE0LDEwIEBACj4gPiAjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiA+ICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgo+ID4gI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgo+ID4gKyNp
ZmRlZiBDT05GSUdfUklTQ1ZfSU9NTVVfMzJCSVQKPiA+ICsjaW5jbHVkZSA8bGludXgvaW8tNjQt
bm9uYXRvbWljLWhpLWxvLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvLTY0LW5vbmF0b21pYy1s
by1oaS5oPgo+ID4gKyNlbmRpZgo+ID4KPiA+ICNpbmNsdWRlICJpb21tdS1iaXRzLmgiCj4gPgo+
ID4gQEAgLTY5LDIxICs3MywzNSBAQCB2b2lkIHJpc2N2X2lvbW11X2Rpc2FibGUoc3RydWN0IHJp
c2N2X2lvbW11X2RldmljZSAqaW9tbXUpOwo+ID4gI2RlZmluZSByaXNjdl9pb21tdV9yZWFkbChp
b21tdSwgYWRkcikgXAo+ID4gcmVhZGxfcmVsYXhlZCgoaW9tbXUpLT5yZWcgKyAoYWRkcikpCj4g
Pgo+ID4gLSNkZWZpbmUgcmlzY3ZfaW9tbXVfcmVhZHEoaW9tbXUsIGFkZHIpIFwKPiA+IC0gcmVh
ZHFfcmVsYXhlZCgoaW9tbXUpLT5yZWcgKyAoYWRkcikpCj4gPiAtCj4gPiAjZGVmaW5lIHJpc2N2
X2lvbW11X3dyaXRlbChpb21tdSwgYWRkciwgdmFsKSBcCj4gPiB3cml0ZWxfcmVsYXhlZCgodmFs
KSwgKGlvbW11KS0+cmVnICsgKGFkZHIpKQo+ID4KPiA+ICsjZGVmaW5lIHJpc2N2X2lvbW11X3Jl
YWRsX3RpbWVvdXQoaW9tbXUsIGFkZHIsIHZhbCwgY29uZCwgZGVsYXlfdXMsIHRpbWVvdXRfdXMp
IFwKPiA+ICsgcmVhZHhfcG9sbF90aW1lb3V0KHJlYWRsX3JlbGF4ZWQsIChpb21tdSktPnJlZyAr
IChhZGRyKSwgdmFsLCBjb25kLCBcCj4gPiArICAgZGVsYXlfdXMsIHRpbWVvdXRfdXMpCj4gPiAr
Cj4gPiArI2lmbmRlZiBDT05GSUdfUklTQ1ZfSU9NTVVfMzJCSVQKPiA+ICsjZGVmaW5lIHJpc2N2
X2lvbW11X3JlYWRxKGlvbW11LCBhZGRyKSBcCj4gPiArIHJlYWRxX3JlbGF4ZWQoKGlvbW11KS0+
cmVnICsgKGFkZHIpKQo+ID4gKwo+ID4gI2RlZmluZSByaXNjdl9pb21tdV93cml0ZXEoaW9tbXUs
IGFkZHIsIHZhbCkgXAo+ID4gd3JpdGVxX3JlbGF4ZWQoKHZhbCksIChpb21tdSktPnJlZyArIChh
ZGRyKSkKPiA+Cj4gPiAjZGVmaW5lIHJpc2N2X2lvbW11X3JlYWRxX3RpbWVvdXQoaW9tbXUsIGFk
ZHIsIHZhbCwgY29uZCwgZGVsYXlfdXMsIHRpbWVvdXRfdXMpIFwKPiA+IHJlYWR4X3BvbGxfdGlt
ZW91dChyZWFkcV9yZWxheGVkLCAoaW9tbXUpLT5yZWcgKyAoYWRkciksIHZhbCwgY29uZCwgXAo+
ID4gICBkZWxheV91cywgdGltZW91dF91cykKPiA+ICsjZWxzZSAvKiBDT05GSUdfUklTQ1ZfSU9N
TVVfMzJCSVQgKi8KPiA+ICsjZGVmaW5lIHJpc2N2X2lvbW11X3JlYWRxKGlvbW11LCBhZGRyKSBc
Cj4gPiArIGhpX2xvX3JlYWRxX3JlbGF4ZWQoKGlvbW11KS0+cmVnICsgKGFkZHIpKQo+ID4KPiA+
IC0jZGVmaW5lIHJpc2N2X2lvbW11X3JlYWRsX3RpbWVvdXQoaW9tbXUsIGFkZHIsIHZhbCwgY29u
ZCwgZGVsYXlfdXMsIHRpbWVvdXRfdXMpIFwKPiA+IC0gcmVhZHhfcG9sbF90aW1lb3V0KHJlYWRs
X3JlbGF4ZWQsIChpb21tdSktPnJlZyArIChhZGRyKSwgdmFsLCBjb25kLCBcCj4gPiArI2RlZmlu
ZSByaXNjdl9pb21tdV93cml0ZXEoaW9tbXUsIGFkZHIsIHZhbCkgXAo+ID4gKyAoKGFkZHIgPT0g
UklTQ1ZfSU9NTVVfUkVHX0lPSFBNQ1lDTEVTKSA/IFwKPiA+ICsgbG9faGlfd3JpdGVxX3JlbGF4
ZWQoKHZhbCksIChpb21tdSktPnJlZyArIChhZGRyKSkgOiBcCj4gPiArIGhpX2xvX3dyaXRlcV9y
ZWxheGVkKCh2YWwpLCAoaW9tbXUpLT5yZWcgKyAoYWRkcikpKQo+ID4gKwo+ID4gKyNkZWZpbmUg
cmlzY3ZfaW9tbXVfcmVhZHFfdGltZW91dChpb21tdSwgYWRkciwgdmFsLCBjb25kLCBkZWxheV91
cywgdGltZW91dF91cykgXAo+ID4gKyByZWFkeF9wb2xsX3RpbWVvdXQoaGlfbG9fcmVhZHFfcmVs
YXhlZCwgKGlvbW11KS0+cmVnICsgKGFkZHIpLCB2YWwsIGNvbmQsIFwKPiA+ICAgZGVsYXlfdXMs
IHRpbWVvdXRfdXMpCj4gPiArI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JT01NVV8zMkJJVCAqLwo+
ID4KPiA+ICNlbmRpZgo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
