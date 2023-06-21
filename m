Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C66EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GskljoUmT3cPhElqj3u+lr/MjZt3nioYRdqTNETxvlw=; b=x6kQz4Ph2fZSO/+QtJU/C6gLAD
	8fML++H89cYNWBZy9h/oCXOI2GJzQiM80MlgLvDsaVYd5WvYnjPQqNGlrzzDm4tLvH4Wtzl0OAjGX
	b9T3yNCOY36/35a62DPORMQllgQOEOcfO4A2gZMg8+vMBZvS4CAjxzkX5Yi6YOU47Ezpnznw6hF6g
	2G1oaGL4kme4Gfu4KIZ2jRUgxIyNTr9+Qrmzn4TteaobdRKMW1cFJ0kZCrRWguUZvEGkGlRzQ9Jaw
	TlaDDeOWF7wrdA70TerEaWJFJjKiOmaKYY2F+rskTbaAqWvomGOwjuPSCI74pnyf0K7fO6uH3w5Ry
	eVpLDL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Nt-00FMNs-3A;
	Wed, 21 Jun 2023 18:16:49 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2No-00FMLt-29
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 18:16:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso2982764b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687371402; x=1689963402;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sm32Nj940RgMLaCnuB+ef8IDyt0jL8Yt73IZHQiXsDA=;
        b=Tf7QmCqRRbhVGdMwYrNEJL2XFUxhTKXbHQ6JfVGSE4QuKL2hUeRg/J409L65sT9KtQ
         9R1OwyT4FCx24Wp7p/X6/yMVd1s4kM6DbwEmJvxQNe6mzpLj+jN1uR3hO+06acR9Yqcs
         tsNxwNHTM2DAFD5/GGxyR74WnSGynV28e1vlkJnlrRVm0FuVExkxBxwYYJ/MEh39j9oJ
         mahjinbRxSnb5qWGCqfte9TtUElqxewQNIFzdT/pR3EcVM8AEkG2ExCSNc6bVPFz/KjB
         KVcUJCiq7TzEsOeRiLJ9os2/Fx8coE0JQad4maoU+ChDEDGyS26PoVLRKfHiWoAnkcd3
         PEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687371402; x=1689963402;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm32Nj940RgMLaCnuB+ef8IDyt0jL8Yt73IZHQiXsDA=;
        b=Iu6W7MksvZVTlG+DK5kIkoiQbUjIKgksHa2gDYJZ8m/2kHscdPVR6h027Ivp0Fg+Se
         R3l3yFeyQ+mSy6moMetSOVaQDi6ahnIGfu9Bv2eAFXMcXuDQq6nLemgf8ujD5Ji3ZX02
         WXrtxyAZnlyJYNS8mdIiX0jvg74QhZDJXxDZLBqJuLYVYNieY9XNUDUpnW7scxDm2T70
         UF7BD9h6+edZ7E1bk4T3YtvIdbl7zlnHU+G+WAVEvYOY6X2EWqKUjDI+zn8O0tf0ehps
         /5xRT2K+9FpqmBYBYglnFylp/xZv/OVyJgn+2R5rvfx2JkKH2F6Hb1xEvNZ3ojiTJMFL
         PI+g==
X-Gm-Message-State: AC+VfDzcgewnbA33MFW4GA/KJcy0KLSpICumsRII0XIrzw4KMfy8qIAY
	pPo6lYo4c4ex+3ATJCTbIyTg0iANHfGk6OdxCMQ=
X-Google-Smtp-Source: ACHHUZ42tKqGgzzto8uQbS5EwTByQNMA25EuBbmp/MOC4AZeT+xLF0ksMC5baguYFxJjGBWjoV/4uQ==
X-Received: by 2002:a05:6a20:1596:b0:10b:e54f:1c00 with SMTP id h22-20020a056a20159600b0010be54f1c00mr12970082pzj.57.1687371401680;
        Wed, 21 Jun 2023 11:16:41 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id k10-20020aa790ca000000b006661562429fsm3300531pfk.97.2023.06.21.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:16:40 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:16:40 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 11:15:56 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <ZJMM4yrU8RfnhD+m@bruce.bluespec.com>
CC: bjorn@kernel.org, linux-riscv@lists.infradead.org, andy.chiu@sifive.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Darius Rad <darius@bluespec.com>
Message-ID: <mhng-2cd909f1-e1ac-438c-8178-9186a291f995@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_111644_702437_820EAF4D 
X-CRM114-Status: GOOD (  33.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMSBKdW4gMjAyMyAwNzo0NDo1MSBQRFQgKC0wNzAwKSwgRGFyaXVzIFJhZCB3cm90
ZToKPiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCAwNDoyNjoxNFBNICswMjAwLCBCasO2cm4gVMO2
cGVsIHdyb3RlOgo+PiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JpdGVz
Ogo+Pgo+PiA+IE9uIE1vbiwgMTkgSnVuIDIwMjMgMTI6MDE6MjAgUERUICgtMDcwMCksIGJqb3Ju
QGtlcm5lbC5vcmcgd3JvdGU6Cj4+ID4+IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPiB3cml0ZXM6Cj4+ID4+Cj4+ID4+IFsuLi5dCj4+ID4+Cj4+ID4+Pj4+ICsJCXJpc2N2X3Zf
dnN0YXRlX29mZihyZWdzKTsKPj4gPj4+Pj4gKwo+PiA+Pj4+Cj4+ID4+Pj4gTm90IG9mZiwgcmln
aHQ/IElzbid0IGl0IF9fcmlzY3Zfdl92c3RhdGVfY2xlYW4oKSB0aGF0IHlvdSdkIGxpa2UgdG8K
Pj4gPj4+PiBjYWxsPyBTb21ldGhpbmcgbGlrZToKPj4gPj4+Pgo+PiA+Pj4+IHN0YXRpYyB2b2lk
IHZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiA+Pj4+IHsKPj4gPj4+PiAg
ICAgICAgaWYgKChyZWdzLT5zdGF0dXMgJiBTUl9WUykgPT0gU1JfVlNfRElSVFkpCj4+ID4+Pj4g
ICAgICAgICAgICAgICAgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKPj4gPj4+PiB9Cj4+
ID4+Pj4KPj4gPj4+PiBDb21wbGVtZW50ZWQgYnkgYSAhViBjb25maWcgdmFyaWFudC4KPj4gPj4+
Cj4+ID4+PiBJIHRoaW5rIGl0J3MganVzdCBhIHF1ZXN0aW9uIG9mIHdoYXQgd2UncmUgdHJ5aW5n
IHRvIGRvIGhlcmU6IGNsZWFuCj4+ID4+PiBhdm9pZHMgdGhlIGtlcm5lbCBWIHN0YXRlIHNhdmUs
IGJ1dCB1bmxlc3MgdGhlIGtlcm5lbCBkZWNpZGVzIHRvIHVzZSBWCj4+ID4+PiBkdXJpbmcgdGhl
IHN5c2NhbGwgdGhlIHJlZ2lzdGVyIGNvbnRlbnRzIHdpbGwgc3RpbGwgYmUgdXNhYmxlIGJ5Cj4+
ID4+PiB1c2Vyc3BhY2UuICBNYXliZSB0aGF0J3MgZmluZSBhbmQgd2UgY2FuIGp1c3QgcmVseSBv
biB0aGUgSVNBIHNwZWMsCj4+ID4+PiB0aG91Z2g/ICBJIHNlbnQgYW5vdGhlciBwYXRjaCB0byBq
dXN0IGRvY3VtZW50IGl0IGluIExpbnV4LCBldmVuIGlmIGl0J3MKPj4gPj4+IGluIHRoZSBJU0Eg
c3BlYyBpdCBzZWVtcyB3b3J0aCBoYXZpbmcgaW4gdGhlIGtlcm5lbCBhcyB3ZWxsLgo+PiA+Pj4K
Pj4gPj4+IFRoYXQgc2FpZCwgSSB0aGluayB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaGVyZSBtaWdo
dCBiZSB0byB6ZXJvIHRoZSBWCj4+ID4+PiByZWdpc3RlciBzdGF0ZSBhbmQgc2V0IGl0IHRvIGlu
aXRpYWw6IHRoYXQgd2F5IHdlIGNhbiBwcmV2ZW50IHVzZXJzcGFjZQo+PiA+Pj4gZnJvbSBhY2Np
ZGVudGFsbHkgcmVseWluZyBvbiB0aGUgc3RhdGUgc2F2ZSwgYnV0IHdlIGNhbiBhbHNvIGF2b2lk
IHRoZQo+PiA+Pj4gdHJhcCB0aGF0IHdvdWxkIGNvbWUgZnJvbSB0dXJuaW5nIGl0IG9mZi4gIFRo
YXQgbGV0cyB1cyBnaXZlIHRoZQo+PiA+Pj4gaGFyZHdhcmUgYSBuaWNlIGNsZWFuIGluZGljYXRp
b24gd2hlbiB0aGUgViBzdGF0ZSBpc24ndCBpbiB1c2UsIHdoaWNoCj4+ID4+PiB3aWxsIGhvcGVm
dWxseSBoZWxwIHVzIGF2b2lkIHRoZSBzYXZlL3Jlc3RvcmUgcGVyZm9ybWFuY2UgaXNzdWVzIHRo
YXQKPj4gPj4+IG90aGVyIHBvcnRzIGhhdmUgaGl0Lgo+PiA+Pgo+PiA+PiBGV0lXLCBJIHRoaW5r
IHRoYXQncyBhIG11Y2ggYmV0dGVyIGlkZWEgdGhhbiB0dXJuaW5nIFYgb2ZmLiBJIGFsc28gbGlr
ZQo+PiA+PiB0aGF0IGl0J2xsIHByZXZlbnRpbmcgdXNlcmxhbmQgdG8gcmVseSBvbiBwcmUtZWNh
bGwgc3RhdGUuCj4+ID4KPj4gPiBPSywgYW55b25lIGVsc2Ugb3Bwb3NlZD8KPj4gPgo+PiA+IFdl
J3JlIGtpbmQgb2YgaW4gdGhlIHdlZWRzIG9uIHBlcmZvcm1hbmNlLCBJIHRoaW5rIHdlJ2QgbmVl
ZCBIVyB0byBrbm93Cj4+ID4gZm9yIHN1cmUgaWYgZWl0aGVyIGlzIGFuIGlzc3VlLiAgU2VlbXMg
YmVzdCB0byBqdXN0IHBsYXkgaXQgc2FmZSBXUlQgdGhlCj4+ID4gdUFCSSBmb3Igbm93LCB3ZSBj
YW4gYWx3YXlzIGRlYWwgd2l0aCBhbnkgcGVyZm9ybWFuY2UgaXNzdWVzIGlmIHRoZQo+PiA+IGV4
aXN0Lgo+Pgo+PiBIZXJlJ3MgdGhlIHBhdGNoIHlvdSBtZW50aW9uZWQgYXQgdGhlIFBXIHN5bmNo
dXA7IEkndmUga2VwdCB0aGUgU3ViamVjdAo+PiBhbmQgc3VjaCBpZiB5b3Ugd2FuJ3QgdG8gYXBw
bHkgaXQuIExNSyBpZiB5b3UnZCBsaWtlIGEgcHJvcGVyIG9uZS4KPj4KPj4gLS0KPj4KPj4gU3Vi
amVjdDogW1BBVENIXSByaXNjdjogRGlzY2FyZCB2ZWN0b3Igc3RhdGUgb24gc3lzY2FsbHMKPj4g
TUlNRS1WZXJzaW9uOiAxLjAKPj4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04Cj4+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPj4KPj4gVGhlIFJJU0MtViB2
ZWN0b3Igc3BlY2lmaWNhdGlvbiBzdGF0ZXM6Cj4+ICAgRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwg
Y2F1c2VzIGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycwo+PiAgICh2MC12MzEsIHZs
LCB2dHlwZSkgYW5kIHZzdGFydCB0byBiZWNvbWUgdW5zcGVjaWZpZWQuCj4+Cj4+IFRoZSB2ZWN0
b3Igc3RhdHVzIGlzIHNldCB0byBJbml0aWFsLCBhbmQgdGhlIHZlY3RvciBzdGF0ZSBpcwo+PiBl
eHBsaWNpdGx5IHplcm9lZC4gVGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNwYWNlIGZyb20g
YWNjaWRlbnRhbGx5Cj4+IHJlbHlpbmcgb24gdGhlIHN0YXRlZCBzYXZlLgo+Cj4gSXMgaXQgd29y
dGggY2xvYmJlcmluZyB3aXRoIGFsbCAxcywgcmF0aGVyIHRoYW4gemVybywgZm9yIGNvbnNpc3Rl
bmN5IHdpdGgKPiBvdGhlciB2ZWN0b3IgYmVoYXZpb3IgKGkuZS4sIHRhaWwvbWFzayBhZ25vc3Rp
YykgYW5kIGZvciB0aGUgcmVhc29ucyBnaXZlbgo+IGluIHRoZSB2ZWN0b3Igc3BlYyBmb3Igbm90
IGRvaW5nIHNvIHdpdGggemVybz8KCk1pZ2h0IGJlLiAgSSBndWVzcyB0aGUgYXNzdW1wdGlvbiB3
YXMgdGhhdCB2cz09aW5pdGlhbCBtZWFucyBhbGwgMCdzLCAKYnV0IHVubGVzcyBJJ20gbWlzc2lu
ZyBzb21ldGhpbmcgdGhlcmUncyBubyBydWxlcyBmb3Igd2hhdCBpbml0aWFsIG1lYW5zIAppbiB0
aGUgc3BlYy4KCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2
b3NpbmMuY29tPgo+PiAtLS0KPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCB8IDI0
ICsrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAg
ICAgICB8ICAyICsrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4+IGluZGV4IDA0YzBiMDdiZjZjZC4uYjMwMjBkMDY0ZjQy
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPj4gQEAgLTE2Myw2ICsxNjMsMjkgQEAg
c3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnByZXYsCj4+ICB2b2lkIHJpc2N2X3ZfdnN0YXRlX2N0cmxfaW5pdChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRzayk7Cj4+ICBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkKHZvaWQp
Owo+Pgo+PiArc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCj4+ICt7Cj4+ICsJdW5zaWduZWQgbG9uZyB2bDsKPj4gKwo+PiArCWlm
ICghcmlzY3Zfdl92c3RhdGVfcXVlcnkocmVncykpCj4+ICsJCXJldHVybjsKPj4gKwo+PiArCXJp
c2N2X3ZfdnN0YXRlX29uKHJlZ3MpOwo+PiArCj4+ICsJcmlzY3Zfdl9lbmFibGUoKTsKPj4gKwlh
c20gdm9sYXRpbGUgKAo+PiArCQkiLm9wdGlvbiBwdXNoXG5cdCIKPj4gKwkJIi5vcHRpb24gYXJj
aCwgK3Zcblx0Igo+PiArCQkidnNldHZsaQklMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKPj4g
KwkJInZtdi52LmkJdjAsIDBcblx0Igo+PiArCQkidm12LnYuaQl2OCwgMFxuXHQiCj4+ICsJCSJ2
bXYudi5pCXYxNiwgMFxuXHQiCj4+ICsJCSJ2bXYudi5pCXYyNCwgMFxuXHQiCj4+ICsJCSIub3B0
aW9uIHBvcFxuXHQiCj4+ICsJCTogIj0mciIgKHZsKSA6IDogIm1lbW9yeSIpOwo+PiArCXJpc2N2
X3ZfZGlzYWJsZSgpOwo+PiArfQo+PiArCj4+ICAjZWxzZSAvKiAhIENPTkZJR19SSVNDVl9JU0Ff
ViAgKi8KPj4KPj4gIHN0cnVjdCBwdF9yZWdzOwo+PiBAQCAtMTc4LDYgKzIwMSw3IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0ZV9jdHJsX3VzZXJfYWxsb3dlZCh2b2lkKSB7IHJl
dHVybiBmYWxzZTsgfQo+PiAgI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBfX25l
eHQpCWRvIHt9IHdoaWxlICgwKQo+PiAgI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJ
CWRvIHt9IHdoaWxlICgwKQo+PiAgI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRv
IHt9IHdoaWxlICgwKQo+PiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpCQlk
byB7fSB3aGlsZSAoMCkKPj4KPj4gICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1YgKi8KPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCj4+IGluZGV4IDA1ZmZkY2QxNDI0ZS4uMDBjNjhiNTdmZjg4IDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMKPj4gQEAgLTI5NSw2ICsyOTUsOCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBf
X3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykK
Pj4gIAkJcmVncy0+ZXBjICs9IDQ7Cj4+ICAJCXJlZ3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKPj4K
Pj4gKwkJcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChyZWdzKTsKPj4gKwo+PiAgCQlzeXNjYWxsID0g
c3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsKPj4KPj4gIAkJaWYg
KHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPj4KPj4gYmFzZS1jb21taXQ6IGFiZDYxNTJkNjA0NmRk
YzRiZTEwNDBiNjIwNmJlZTJlMDI1ZThhNzkKPj4gLS0KPj4gMi4zOS4yCj4+Cj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
