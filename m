Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34D6C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbbVg8koMRHynqBTKk/s1WvR9AVq5CcH9lKU02iajlM=; b=B+JRI7TqedaOeb
	0gVcIJsR3Bzp769410fNlYeQRKNfmvJ4UhAlEutStNiXZgI7e5d9sj3ofr3z54KqnFRvyinxPjVzW
	MCdvkaHChOu3H9IP62JPCWz9pgw/y1UDsgCUL2HnMt76TLdjj3NcMS5dpMJvaewhj92hnuGQlG7bc
	n06PRK/yYXzn6LtSYYEZUuCa86hF1gAiN7nTGW0pXoYDD0yIBYJpQi9yg4DIS5gYOcuPhypC+V8iH
	Uj5jCZzmsP78PyzCllerkN0IsQv9w5LHOeVHkwpzHuKnqJ0Z3J1UAYj+BEhqkpTYBpJF+mSShrPAv
	2So+vQBaWyQZat/MlXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFdQ-000j1x-10;
	Tue, 25 Apr 2023 10:10:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prFdN-000j19-1M
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 10:10:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec94eb6dcaso6016966e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682417448; x=1685009448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jpi1FpCyxlB6q2gMU0WhK2er2029jL9tq4NAFF3QpOw=;
        b=RU1Xbsio0cFvIijsBDmbgseUBjl2u+HSmtFJimi3KwEe9VU3nUSc0yT+T0vhBWIlQJ
         X/dvcN2tq0DoAcgT6nSvg3zXHe3bIoLFajhrqtSrL7FJ8ze7hj74orc8NnpsZom5fk0s
         iRo9geipRBhN7YT2UvgCtG+WomHT2FIiLAiu7Eymt9VReEdCSwCPyxFaMC4y5ypF8NEf
         mAtVtn0D6c5/EOVeiz5WPhwQ8qB4KDLWBfsEd8Fmnk822/lTDVcAY5zaxhNGk0pUe3jI
         +8MENBJ7fLsDP8qVC30wNLMyaCShGJyLmXhEE6Xlo3Mb9bBg1wR5Er3kYurbkir9ORiD
         ONGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682417448; x=1685009448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jpi1FpCyxlB6q2gMU0WhK2er2029jL9tq4NAFF3QpOw=;
        b=MCCAu4lGhalUKjL+R0oJsMwURLTA+nRLTMiEeszbS43zAXeLPFg0Y2z/lrmZ5+KjQO
         9+Ze3Ankobt5TiHi4yIOXZgY3HxgirDSRWMCmWC6C5+3bLHB2iYg/IktFG8dlfBIwFtv
         RVCH3GN/enfqcaC1+RICFnBPquASrJlcxW6eIEad3GDX8yGKaomjI5drtiUsgBlXssy+
         9+IksabiBZUB+RwC4aLmnyn987WxqRHY9g0GKB22oFI8W30kpjQq5r17G5p114IMta2g
         mPZOYEzAQA3p7xoMsn1pI6Mn0PcstqT4eDyWuJoPzMVro+Fi1WrgV2BM21ii/aBjhpyP
         ie5Q==
X-Gm-Message-State: AAQBX9doUiVA6DqdPqtn4ioMtlxMDEcLoh6bCV9wof87YOwFXeOBDbJX
	+qbG08mJY2JjGlXWJG+aWKUaSe2NfltjLuxvUCcI
X-Google-Smtp-Source: AKy350ZXH/d6G3V1zDgoUmECS1aHd3dDz4YAt+eHU/PTlA+VW6gi/sBND+azzhDFiIdHo1Psl6PYHf/dHzCLW8GLd5w=
X-Received: by 2002:ac2:43ac:0:b0:4dd:9f4d:7459 with SMTP id
 t12-20020ac243ac000000b004dd9f4d7459mr4444993lfl.67.1682417448215; Tue, 25
 Apr 2023 03:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230425034407.1601585-1-woodrow.shen@sifive.com> <20230425-frolic-cough-b775f8d6ca29@wendy>
In-Reply-To: <20230425-frolic-cough-b775f8d6ca29@wendy>
From: Woodrow Shen <woodrow.shen@sifive.com>
Date: Tue, 25 Apr 2023 18:10:36 +0800
Message-ID: <CABquHATUGZpzhmJNRDZ55Z2Cm3bxgJApRUdiftscU7sGEALyYw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC
 must be readable
To: Conor Dooley <conor.dooley@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_031053_545691_24C501A7 
X-CRM114-Status: GOOD (  26.21  )
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

SGkgQ29ub3IsCgpPbiBUdWUsIEFwciAyNSwgMjAyMyBhdCAyOjU14oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIZXkgSHNpZWgtVHNlbmcs
Cj4KPiBPbiBUdWUsIEFwciAyNSwgMjAyMyBhdCAxMTo0NDowN0FNICswODAwLCBXb29kcm93IFNo
ZW4gd3JvdGU6Cj4gPiBGcm9tOiBIc2llaC1Uc2VuZyBTaGVuIDx3b29kcm93LnNoZW5Ac2lmaXZl
LmNvbT4KPiA+Cj4gPiBUaGUgY29tbWl0IDhhZWI3YjEgYWxsb3dzIHJpc2N2IHRvIHVzZSBtbWFw
IHdpdGggUFJPVF9XUklURSBvbmx5LAo+ID4gYW5kIG1lYW53aGlsZSBtbWFwIHdpdGggdyt4IGlz
IGFsc28gcGVybWl0dGVkLiBIb3dldmVyLCB3aGVuIHVzZXJzcGFjZQo+ID4gdHJpZXMgdG8gYWNj
ZXNzIHRoaXMgcGFnZSB3aXRoIFBST1RfV1JJVEV8UFJPVF9FWEVDLCB3aGljaCBjYXVzZXMKPiA+
IGluZmluaXRlIGxvb3AgYXQgbG9hZCBwYWdlIGZhdWx0IGFzIHdlbGwgYXMgaXQgdHJpZ2dlcnMg
c29mdCBsb2NrdXAuCj4gPiBBY2NvcmRpbmcgdG8gcmlzY3YgcHJpdmlsZWdlZCBzcGVjLCAiV3Jp
dGFibGUgcGFnZXMgbXVzdCBhbHNvIGJlIG1hcmtlZAo+ID4gcmVhZGFibGUiLiBUaGUgZml4IHRv
IGRyb3AgdGhlIGBQQUdFX0NPUFlfUkVBRF9FWEVDYCBhbmQgYFBBR0VfUkVBRF9FWEVDYAo+ID4g
c2hvdWxkIGJlIGp1c3QgdXNlZCBpbnN0ZWFkLiBUaGlzIGFsaWducyB0aGUgb3RoZXIgYXJjaGVz
IChpLmUgYXJtNjQpCj4gPiBmb3IgcHJvdGVjdGlvbl9tYXAuCj4gPgo+ID4gRml4ZXM6IDhhZWI3
YjEgKCJSSVNDLVY6IE1ha2UgbW1hcCgpIHdpdGggUFJPVF9XUklURSBpbXBseSBQUk9UX1JFQUQi
KQo+Cj4gVGhpcyBmaXhlcyB0YWcgc2hvdWxkIGJlOgo+IEZpeGVzOiA4YWViN2IxN2YwNGUgKCJS
SVNDLVY6IE1ha2UgbW1hcCgpIHdpdGggUFJPVF9XUklURSBpbXBseSBQUk9UX1JFQUQiKQo+IGFz
IGNoZWNrcGF0Y2ggd291bGQgaGF2ZSB0b2xkIHlvdSA6LyBQZXJoYXBzIFBhbG1lciBjYW4gZml4
IHRoYXQgdXAgb24KPiBhcHBsaWNhdGlvbj8KPgo+ID4gU2lnbmVkLW9mZi1ieTogSHNpZWgtVHNl
bmcgU2hlbiA8d29vZHJvdy5zaGVuQHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4KPiBUaGlzIGlzIG5v
dCB2MSwgaXQncyB2MiByaWdodD8KPiBQbGVhc2UgaW5jbHVkZSBhIGNoYW5nZWxvZyBiZXR3ZWVu
IHZlcnNpb25zLgoKWWVzLCBpdCdzIHYyLiBJIGNvcGllZCB0aGUgb3V0ZGF0ZWQgY29tbWVudCBh
cyBteSBmaXJzdCB2ZXJzaW9uIHdhcwp2ZXJpZmllZCBieSBzY3JpcHQgY29ycmVjdGx5LiBXaWxs
IGZpeCBpdCBpbiB2Mi4KCj4KPiBBbHNvLCB3aGF0IG1ha2VzIGl0IGFuIFJGQywgaXQncyBhbiBh
Y3R1YWwgZml4IHRoYXQgeW91IHdvdWxkIGxpa2UKPiBtZXJnZWQsIHJpZ2h0PwoKSSB3YXMgc3Vn
Z2VzdGVkIHRvIHVzZSAiUkZDIiBpbnRlcm5hbGx5LCBzbyBzaG91bGQgSSBqdXN0IHJlLXN1Ym1p
dCB2Mgp3aXRoIFtSRVNFTkQgdjJdPwpUaGFua3MsCldvb2Ryb3cKCj4KPiBUaGFua3MsCj4gQ29u
b3IuCj4KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDMgKy0tCj4gPiAg
YXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPiA+IGluZGV4IGY2NDE4MzdjY2YzMS4uMDVlZGEzMjgxYmE5IDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBAQCAtMTY1LDggKzE2NSw3IEBAIGV4dGVy
biBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHB0X29wcyBfX2luaXRkYXRhOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgX1BBR0VfRVhFQyB8IF9QQUdFX1dSSVRFKQo+ID4K
PiA+ICAjZGVmaW5lIFBBR0VfQ09QWSAgICAgICAgICAgIFBBR0VfUkVBRAo+ID4gLSNkZWZpbmUg
UEFHRV9DT1BZX0VYRUMgICAgICAgICAgICAgICBQQUdFX0VYRUMKPiA+IC0jZGVmaW5lIFBBR0Vf
Q09QWV9SRUFEX0VYRUMgIFBBR0VfUkVBRF9FWEVDCj4gPiArI2RlZmluZSBQQUdFX0NPUFlfRVhF
QyAgICAgICAgICAgICAgIFBBR0VfUkVBRF9FWEVDCj4gPiAgI2RlZmluZSBQQUdFX1NIQVJFRCAg
ICAgICAgICBQQUdFX1dSSVRFCj4gPiAgI2RlZmluZSBQQUdFX1NIQVJFRF9FWEVDICAgICBQQUdF
X1dSSVRFX0VYRUMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9h
cmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gaW5kZXggMGYxNGY0YThkMTc5Li5jYzQ4YjBkOTNhOTgg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gKysrIGIvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiA+IEBAIC0yODYsNyArMjg2LDcgQEAgc3RhdGljIGNvbnN0IHBncHJvdF90
IHByb3RlY3Rpb25fbWFwWzE2XSA9IHsKPiA+ICAgICAgIFtWTV9FWEVDXSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgID0gUEFHRV9FWEVDLAo+ID4gICAgICAgW1ZNX0VYRUMg
fCBWTV9SRUFEXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBQQUdFX1JFQURfRVhFQywK
PiA+ICAgICAgIFtWTV9FWEVDIHwgVk1fV1JJVEVdICAgICAgICAgICAgICAgICAgICAgICAgICAg
ID0gUEFHRV9DT1BZX0VYRUMsCj4gPiAtICAgICBbVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVB
RF0gICAgICAgICAgICAgICAgICA9IFBBR0VfQ09QWV9SRUFEX0VYRUMsCj4gPiArICAgICBbVk1f
RVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0gICAgICAgICAgICAgICAgICA9IFBBR0VfQ09QWV9F
WEVDLAo+ID4gICAgICAgW1ZNX1NIQVJFRF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPSBQQUdFX05PTkUsCj4gPiAgICAgICBbVk1fU0hBUkVEIHwgVk1fUkVBRF0gICAgICAg
ICAgICAgICAgICAgICAgICAgICA9IFBBR0VfUkVBRCwKPiA+ICAgICAgIFtWTV9TSEFSRUQgfCBW
TV9XUklURV0gICAgICAgICAgICAgICAgICAgICAgICAgID0gUEFHRV9TSEFSRUQsCj4gPiAtLQo+
ID4gMi4zNC4xCj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
