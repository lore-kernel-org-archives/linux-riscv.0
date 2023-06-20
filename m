Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A4FEB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 08:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jq1hLNWkpSgSQgafd+dGhK/Ssb0s+PCiIYi2tJzKFYA=; b=myaFT79JSCAE5u
	FZ4c2ZmPURd997Uw5yb4D5TzZnwsYT9F4IX0rPkNm3uu5i7BWagABnpFaRzYAiewanQwU2Wywk2Tl
	sP2zZMiSh81lorUidJOc3QFeFhKY8zi0DXDXfI1EXPTNpybhjnd9w8zIBhymYdCicewBjPDITDyt7
	rGEevMLfLszQufpW4ZNTB9l0vvRvtB26PHTgR/0Yb52rzyU6FeOwWBsNaTXsyT1zamQe4ewTpAd8A
	oFu3OSBOwJ+FW42Duv+FV9BgJ2Jj/zuuv/Z5I893sCS1GgBZdGvFtZYhByccSUtYhzko9MEIX5I94
	HU3Yawy4iRJz7XhVaZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBWVN-00AXbW-1N;
	Tue, 20 Jun 2023 08:14:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBWVK-00AXat-0H
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 08:14:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f90b8acefdso21027155e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 01:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687248860; x=1689840860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQbdggw74AN0qE4N6rw9FwT496orbg2m9a2V0ULV/Uw=;
        b=qeI0jNx4MMXFY5pvb2+qLIUHE7ZFkv9z5nksQ+dxl7WQDJDA6+otDYPwrUmXxmcMc7
         OwY/zr/aawnu6IYyKH0dL4oTgDWILHJ8GE4g7oM4ZXA44gQCTVks6rRprW25HTKvFTCe
         Y/kcZOLY0w/EttyjMfaGUb2cOvcA8GAA1i+SIrr9fKqmIpVL8OC0Wy4v6543snbr7Osi
         hMsqWpBVWBjzsVHJrPwqBJDJjYH+PEKgscMI+vADvpubrPH+k69kTmWDJ1SgwO90Xa2/
         eLre4gs9T3eHRkhofGMc6nIUp+6nh3QXJPGHQpvxVMOu2DHff/Y32hNGd0RVHbuGMvWU
         Wk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687248860; x=1689840860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQbdggw74AN0qE4N6rw9FwT496orbg2m9a2V0ULV/Uw=;
        b=WHvGPkhpeqfSp74shfDr9/imafkDm4HJmXDbI1+T3qbR0lbrSs8dNhovxDxgzL9s6d
         ql44h+J4qxS/228n0vtyHxp+1JSjj2SLeOiRP1zXiPT2VqJndt+QgMZVkkw0fgEX2YOP
         7n/bcrXPtM5nAQ/MXbe+ggD/nXhygSvO/VnKA/uVL3gAcfaAeU/alp+dYJFc6Vo6wZos
         7ncGDesW8hHcSy5mXWEbyinckKipY01PrReKDwDVOZhhkrMiPvbq+bzytb9IqL7FysG+
         XDtfiLh9AvlfNE/0q0HbDTcON5/Uw7SPfnFjGoc/mpFI3nC29KMiNlm8i8OKSf+VnkxS
         W9pw==
X-Gm-Message-State: AC+VfDwajjllkO24OHfeBOLtf5k4dqwfRcgHxdb/f2En4SdUcTsKwBQ2
	8LhAS11OeJrpDiCMavcsbxHyEypYYck8jKYXQ3AW+g==
X-Google-Smtp-Source: ACHHUZ5rqXNURmljNNaXdt2sxgcF4jdXG62ZAho+mTu2bFDoCR6HsKSjbY5W5NzBKLCkQujzUGfPXnfTUJlhfbfEcQ8=
X-Received: by 2002:a05:600c:2252:b0:3f9:14c:11d3 with SMTP id
 a18-20020a05600c225200b003f9014c11d3mr5850732wmm.12.1687248860464; Tue, 20
 Jun 2023 01:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <CAHVXubjOUeEtnFnERjT2YOG+h5=2YX7kxeEBFSStO3WZvcv36A@mail.gmail.com> <ZJFS1K/LltE57MJ4@sunil-laptop>
In-Reply-To: <ZJFS1K/LltE57MJ4@sunil-laptop>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 20 Jun 2023 10:14:09 +0200
Message-ID: <CAHVXubhcStveNOzwA8i0R79P3spR7m1oEbWtBXaVSr2-bL3mvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_011422_346391_D32F01B2 
X-CRM114-Status: GOOD (  34.44  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgOToxOOKAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhleSBBbGV4LAo+Cj4gTWFueSB0aGFua3MgZm9yIHdy
aXRpbmcgdGhpcyB1cCEKPgo+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDExOjQ5OjEzQU0gKzAy
MDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEBTdW5pbCBWIEwgU29tZXRoaW5nIGFib3V0
IEFDUEkgaXMgbW9yZSB0aGFuIHdlbGNvbWUgOikKPiA+Cj4gPiBBbmQgdGhhbmtzIHRvIEBCasO2
cm4gVMO2cGVsIGFuZCBAQXRpc2ggS3VtYXIgUGF0cmEgZm9yIGhlbHBpbmcgaW4KPiA+IHdyaXRp
bmcgdGhpcyBkb2N1bWVudCEKPiA+Cj4gPiBPbiBNb24sIEp1biAxOSwgMjAyMyBhdCAxMTo0N+KA
r0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IFRoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSBjb25zdHJhaW50cyBhbmQgcmVxdWly
ZW1lbnRzIG9mIHRoZSBlYXJseQo+ID4gPiBib290IHByb2Nlc3MgaW4gYSBSSVNDLVYga2VybmVs
Lgo+ID4gPgo+ID4gPiBTemlnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1p
bWFnZS1oZWFkZXIucnN0IHwgICAzIC0KPiA+ID4gIERvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5y
c3QgICAgICAgICAgICAgIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIERvY3Vt
ZW50YXRpb24vcmlzY3YvaW5kZXgucnN0ICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMTgyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ID4gPgo+ID4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LWltYWdlLWhlYWRlci5yc3QgYi9E
b2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdAo+ID4gPiBpbmRleCBkNzc1
MjUzMzg2NWYuLmE0YTQ1MzEwYzRjNCAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9y
aXNjdi9ib290LWltYWdlLWhlYWRlci5yc3QKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9yaXNj
di9ib290LWltYWdlLWhlYWRlci5yc3QKPiA+ID4gQEAgLTcsOSArNyw2IEBAIEJvb3QgaW1hZ2Ug
aGVhZGVyIGluIFJJU0MtViBMaW51eAo+ID4gPgo+ID4gPiAgVGhpcyBkb2N1bWVudCBvbmx5IGRl
c2NyaWJlcyB0aGUgYm9vdCBpbWFnZSBoZWFkZXIgZGV0YWlscyBmb3IgUklTQy1WIExpbnV4Lgo+
ID4gPgo+ID4gPiAtVE9ETzoKPiA+ID4gLSAgV3JpdGUgYSBjb21wbGV0ZSBib290aW5nIGd1aWRl
Lgo+ID4gPiAtCj4gPiA+ICBUaGUgZm9sbG93aW5nIDY0LWJ5dGUgaGVhZGVyIGlzIHByZXNlbnQg
aW4gZGVjb21wcmVzc2VkIExpbnV4IGtlcm5lbCBpbWFnZTo6Cj4gPiA+Cj4gPiA+ICAgICAgICAg
dTMyIGNvZGUwOyAgICAgICAgICAgICAgICAvKiBFeGVjdXRhYmxlIGNvZGUgKi8KPiA+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jp
c2N2L2Jvb3QucnN0Cj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uYjAyMjMwODE4Yjc5Cj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ID4gPiBAQCAtMCwwICsxLDE4MSBAQAo+ID4gPiAr
Li4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gKwo+ID4gPiArPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+ICtFYXJseSBib290
IHJlcXVpcmVtZW50cy9jb25zdHJhaW50cyBvbiBSSVNDLVYKPiA+ID4gKz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiArCj4gPiA+ICs6QXV0aG9yOiBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+ICs6RGF0ZTogMjMg
TWF5IDIwMjMKPiA+ID4gKwo+ID4gPiArVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgd2hhdCB0aGUg
UklTQy1WIGtlcm5lbCBleHBlY3RzIGZyb20gdGhlIHByZXZpb3VzIHN0YWdlcwo+ID4gPiArYW5k
IHRoZSBmaXJtd2FyZSwgYnV0IGFsc28gdGhlIGNvbnN0cmFpbnRzIHRoYXQgYW55IGRldmVsb3Bl
ciBtdXN0IGhhdmUgaW4gbWluZAo+ID4gPiArd2hlbiB0b3VjaGluZyB0aGUgZWFybHkgYm9vdCBw
cm9jZXNzLCBlLmcuIGJlZm9yZSB0aGUgZmluYWwgdmlydHVhbCBtYXBwaW5nIGlzCj4gPiA+ICtz
ZXR1cC4KPiA+ID4gKwo+ID4gPiArUHJlLWtlcm5lbCBib290IChFeHBlY3RhdGlvbnMgZnJvbSBm
aXJtd2FyZSkKPiA+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Cj4gPiA+ICsKPiA+ID4gK1JlZ2lzdGVycyBzdGF0ZQo+ID4gPiArLS0tLS0tLS0tLS0tLS0t
Cj4gPiA+ICsKPiA+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVjdHM6Cj4gPiA+ICsKPiA+ID4g
KyAgKiBgJGEwYCB0byBjb250YWluIHRoZSBoYXJ0aWQgb2YgdGhlIGN1cnJlbnQgY29yZS4KPiA+
ID4gKyAgKiBgJGExYCB0byBjb250YWluIHRoZSBhZGRyZXNzIG9mIHRoZSBkZXZpY2UgdHJlZSBp
biBtZW1vcnkuCj4gPiA+ICsKPiA+ID4gK0NTUiBzdGF0ZQo+ID4gPiArLS0tLS0tLS0tCj4gPiA+
ICsKPiA+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVjdHM6Cj4gPiA+ICsKPiA+ID4gKyAgKiBg
JHNhdHAgPSAwYDogdGhlIE1NVSBtdXN0IGJlIGRpc2FibGVkLgo+ID4gPiArCj4gPiA+ICtSZXNl
cnZlZCBtZW1vcnkgZm9yIHJlc2lkZW50IGZpcm13YXJlCj4gPiA+ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICsKPiA+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4
cGVjdHMgdGhlIGZpcm13YXJlIHRvIG1hcmsgYW55IHJlc2lkZW50IG1lbW9yeSB3aXRoIHRoZQo+
ID4gPiArYG5vLW1hcGAgZmxhZywgdGh1cyB0aGUga2VybmVsIHdvbid0IG1hcCB0aG9zZSByZWdp
b25zIGluIHRoZSBkaXJlY3QgbWFwcGluZwo+ID4gPiArKGF2b2lkaW5nIGlzc3VlcyB3aXRoIGhp
YmVybmF0aW9uLCBzcGVjdWxhdGl2ZSBhY2Nlc3NlcyBhbmQgcHJvYmFibHkgb3RoZXIKPiA+ID4g
K3N1YnN5c3RlbXMpLgo+ID4gPiArCj4gPiA+ICtLZXJuZWwgbG9jYXRpb24KPiA+ID4gKy0tLS0t
LS0tLS0tLS0tLQo+ID4gPiArCj4gPiA+ICtUaGUgUklTQy1WIGtlcm5lbCBleHBlY3RzIHRvIGJl
IHBsYWNlZCBhdCBhIFBNRCBib3VuZGFyeSAoMk1CIGZvciBydjY0IGFuZCA0TUIKPiA+ID4gK2Zv
ciBydjMyKS4gTm90ZSB0aG91Z2ggdGhhdCB0aGUgRUZJIHN0dWIgd2lsbCBwaHlzaWNhbGx5IHJl
bG9jYXRlIHRoZSBrZXJuZWwgaWYKPiA+ID4gK3RoYXQncyBub3QgdGhlIGNhc2UuCj4gPiA+ICsK
PiA+ID4gK0RldmljZS10cmVlCj4gPiA+ICstLS0tLS0tLS0tLQo+ID4gPiArCj4gPiA+ICtUaGUg
UklTQy1WIGtlcm5lbCBhbHdheXMgZXhwZWN0cyBhIGRldmljZSB0cmVlLCBpdCBpczoKPiA+ID4g
Kwo+IEluIGdlbmVyYWwsIHRoZSBmaXJtd2FyZSBjYW4gcGFzcyBlaXRoZXIgRFQgb3IgQUNQSSAo
bm90IGJvdGggYXQgdGhlCj4gc2FtZSB0aW1lKSB0byB0aGUgT1MuIFNvLCBJIHRoaW5rIHRoZSBz
dGF0ZW1lbnQgdGhhdCBrZXJuZWwgYWx3YXlzCj4gZXhwZWN0cyBEVCBwcm9iYWJseSBjYXVzZXMg
Y29uZnVzaW9uLiBDYW4gd2UgbWVudGlvbiBzb21lIHRoaW5nIGxpa2UKPiBiZWxvdz8KPgo+IFRo
ZSBmaXJtd2FyZSBjYW4gcGFzcyBlaXRoZXIgRGV2aWNlVHJlZSBvciBBQ1BJIHRhYmxlcyB0byB0
aGUgUklTQy1WCj4ga2VybmVsLgo+Cj4gVGhlIERldmljZVRyZWUgaXMgZWl0aGVyIHBhc3NlZCBk
aXJlY3RseSB0byB0aGUga2VybmVsIGZyb20gdGhlCj4gcHJldmlvdXMgc3RhZ2UgdXNpbmcgdGhl
IGAkYTFgIHJlZ2lzdGVyLCBvciB3aGVuIGJvb3Rpbmcgd2l0aCBVRUZJLCBpdAo+IGNhbiBiZSBw
YXNzZWQgdXNpbmcgdGhlIEVGSSBjb25maWd1cmF0aW9uIHRhYmxlLgo+Cj4gVGhlIEFDUEkgdGFi
bGVzIGFyZSBwYXNzZWQgdG8gdGhlIGtlcm5lbCB1c2luZyB0aGUgRUZJIGNvbmZpZ3VyYXRpb24K
PiB0YWJsZS4gSW4gdGhpcyBjYXNlLCBhIHRpbnkgRGV2aWNlVHJlZSBpcyBzdGlsbCBjcmVhdGVk
IGJ5IHRoZSBFRkkKPiBzdHViLiBQbGVhc2UgcmVmZXIgdG8gIkVGSSBzdHViIGFuZCBkZXZpY2Ui
IHRyZWUgc2VjdGlvbiBiZWxvdyBmb3IKPiBkZXRhaWxzIG9mIHRoZSB0aW55IERldmljZVRyZWUu
Cj4KCkdyZWF0LCB0aGlzIGlzIHdheSBiZXR0ZXIgc28gSSdsbCBnbyB3aXRoIHRoYXQ6CgpIYXJk
d2FyZSBkZXNjcmlwdGlvbgotLS0tLS0tLS0tLS0tLS0tLS0tLQoKVGhlIGZpcm13YXJlIGNhbiBw
YXNzIGVpdGhlciBhIGRldmljZXRyZWUgb3IgQUNQSSB0YWJsZXMgdG8gdGhlIFJJU0MtViBrZXJu
ZWwuCgpUaGUgZGV2aWNldHJlZSBpcyBlaXRoZXIgcGFzc2VkIGRpcmVjdGx5IHRvIHRoZSBrZXJu
ZWwgZnJvbSB0aGUgcHJldmlvdXMgc3RhZ2UKdXNpbmcgdGhlIGAkYTFgIHJlZ2lzdGVyLCBvciB3
aGVuIGJvb3Rpbmcgd2l0aCBVRUZJLCBpdCBjYW4gYmUgcGFzc2VkCnVzaW5nIHRoZQpFRkkgY29u
ZmlndXJhdGlvbiB0YWJsZS4KClRoZSBBQ1BJIHRhYmxlcyBhcmUgcGFzc2VkIHRvIHRoZSBrZXJu
ZWwgdXNpbmcgdGhlIEVGSSBjb25maWd1cmF0aW9uIHRhYmxlLiBJbgp0aGlzIGNhc2UsIGEgdGlu
eSBkZXZpY2V0cmVlIGlzIHN0aWxsIGNyZWF0ZWQgYnkgdGhlIEVGSSBzdHViLiBQbGVhc2UgcmVm
ZXIgdG8KIkVGSSBzdHViIGFuZCBkZXZpY2V0cmVlIiB0cmVlIHNlY3Rpb24gYmVsb3cgZm9yIGRl
dGFpbHMgYWJvdXQgdGhpcyBkZXZpY2V0cmVlLgoKVGhhbmtzIQoKPiBUaGFua3MsCj4gU3VuaWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
