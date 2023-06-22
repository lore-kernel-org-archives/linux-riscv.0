Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2DAEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=62M0QprZce0MmW7MiuA53IrBQPN8eYkdb5KRg9prfEE=; b=2rTK7yMZj9VjOONEndSwtMsPKI
	hgPQon+dxswVS2hszSPrcPwIQbxZte/HaXfvF2+bsbs5GJF3YukBjfFhFTEZcu2DF5USaDhsA5rWZ
	aRTEZShkBna6IBOg87tH1ic3FzA+hdIdYaA8npLTybep1dK+OzkXrnnf3MyoOZCHf6wC7ljz2mPR7
	BuDj4iNY+HM+rsKgRGTD9ahsW+SJ0bcOIGZmK030jtcyGY7tqMwW57xf28sykWWJcsrkuLL2d+qY8
	wk/ELYGMH29AYcsbc/PRG7GIFli0+KS5o80BZDcKdjvZSguBMXODLBBTkP3Th8tDJujgHOvCgEIb0
	i56mtprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOdL-001Oyr-1y;
	Thu, 22 Jun 2023 18:02:15 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOdH-001Oy4-2t
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 18:02:13 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a04e5baffcso1460492b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 11:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687456930; x=1690048930;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNedEHKdy3Sq2pC4S9lvmkW9ty8TdoFP0ANZLsoNiXM=;
        b=kgiW2yGMlxSjNtXXUYJtQKxtO9ZutniyYhQwFHkRqEhYzFwe/McW6/rMGiWDKSzNgx
         2sIV3jv7538SekcZJwUfXY6dihhmd9d9GCa0jCqZIWYmndXuKNO/aacATc1DtRfoxQjm
         geIavH46RGx1sYBzp6b/GBbyIT2fgbgUEt28rhhWx8B+Io2cdVfp7/wz2FhnKf5Sr2dr
         UHHuqoX9K/CxaLut39MEUELV2t5EfVIQz/fRSml7TJMBXnYpLM8DJ+8DUAd9jocn7zvc
         nIG7CT07w8W0G63uteNdIYyYpc4rfEEBZNq4fnAHZjBbBfbOvgSl+xzpCtYgN1gWtJSj
         IrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687456930; x=1690048930;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNedEHKdy3Sq2pC4S9lvmkW9ty8TdoFP0ANZLsoNiXM=;
        b=j/VSgSYgEF67pK+IJJ9Bgaw/bOWsTkkvgUjifUNZgmwRcoa6ZAJ1T7+fK/cWPsV0iP
         dPYkaPXgH/OkXVZ/bn8ND7tv6LWNbUi9hvLhg8PllXI8AbPbq90lCcETuGaBV3LoItoH
         4jfaH8gYC9u6yDG8Nc3Jus685u4SuLxXBGOHYBsNoEyQpfMFvFOOMPGGZdXlc6kuYqCG
         Hh+lJLKX5lgzFRZ0E3FioqlKZm1ttGg3Cdn6NLAQSdY585OJ9eP7/DWC+RUf87kralx9
         36gXjHJFqAK3MxmqWDVlMXGMBpArKQDDCBfYp5LhqqcuhR8uytsYYh3Oz7A5tttWUTKb
         N39Q==
X-Gm-Message-State: AC+VfDzWh+PBadHR17CP5FCDqyAL7HbsQEy9gHzS5DDM9hPYTBMcxyyK
	u19P9y266retQcqwCV+OHQM2cA==
X-Google-Smtp-Source: ACHHUZ7GZe9K4yocGcHPot8NT07229+nMwJFXJ9wGbcZqe8Tc3raEXcoNjEmojmbtt5AvSfzV9g9pw==
X-Received: by 2002:aca:1913:0:b0:39e:cf4c:4556 with SMTP id l19-20020aca1913000000b0039ecf4c4556mr12997557oii.35.1687456929040;
        Thu, 22 Jun 2023 11:02:09 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x4-20020a17090a6b4400b00260e7c2cedesm18285pjl.57.2023.06.22.11.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 11:02:08 -0700 (PDT)
Date: Thu, 22 Jun 2023 11:02:08 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 11:01:27 PDT (-0700)
Subject: Re: [PATCH] riscv: Discard vector state on syscalls
In-Reply-To: <ZJSLKrB/4xaYB75d@bruce.bluespec.com>
CC: bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, Bjorn Topel <bjorn@rivosinc.com>,
  linux-kernel@vger.kernel.org, linux@rivosinc.com, remi@remlab.net, andy.chiu@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Darius Rad <darius@bluespec.com>
Message-ID: <mhng-4c2014dc-5e23-4fb8-b5cc-d70f29d905d5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_110211_934691_693760FE 
X-CRM114-Status: GOOD (  37.65  )
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

T24gVGh1LCAyMiBKdW4gMjAyMyAxMDo1NTo1NCBQRFQgKC0wNzAwKSwgRGFyaXVzIFJhZCB3cm90
ZToKPiBPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCAxMDo0NjozMUFNIC0wNzAwLCBQYWxtZXIgRGFi
YmVsdCB3cm90ZToKPj4gT24gVGh1LCAyMiBKdW4gMjAyMyAxMDozNjoxMyBQRFQgKC0wNzAwKSwg
Ympvcm5Aa2VybmVsLm9yZyB3cm90ZToKPj4gPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4+ID4gCj4+ID4gVGhlIFJJU0MtViB2ZWN0b3Igc3BlY2lmaWNhdGlvbiBz
dGF0ZXM6Cj4+ID4gICBFeGVjdXRpbmcgYSBzeXN0ZW0gY2FsbCBjYXVzZXMgYWxsIGNhbGxlci1z
YXZlZCB2ZWN0b3IgcmVnaXN0ZXJzCj4+ID4gICAodjAtdjMxLCB2bCwgdnR5cGUpIGFuZCB2c3Rh
cnQgdG8gYmVjb21lIHVuc3BlY2lmaWVkLgo+PiA+IAo+PiA+IFRoZSB2ZWN0b3IgcmVnaXN0ZXJz
IGFyZSBjbGVhcmVkLCB2aWxsIGlzIHNldCAoaW52YWxpZCksIGFuZCB0aGUKPj4gPiB2ZWN0b3Ig
c3RhdHVzIGlzIHNldCB0byBJbml0aWFsLgo+PiA+IAo+PiA+IFRoYXQgd2F5IHdlIGNhbiBwcmV2
ZW50IHVzZXJzcGFjZSBmcm9tIGFjY2lkZW50YWxseSByZWx5aW5nIG9uIHRoZQo+PiA+IHN0YXRl
ZCBzYXZlLgo+PiA+IAo+PiA+IFLDqW1pIHBvaW50ZWQgb3V0IFsxXSB0aGF0IGNsZWFyaW5nIHRo
ZSByZWdpc3RlcnMgbWlnaHQgYmUgc3VwZXJmbHVvdXMsCj4+ID4gYW5kIHNldHRpbmcgdmlsbCBp
cyBzdWZmaWNpZW50Lgo+PiA+IAo+PiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzEyNzg0MzI2LjlVUFBLM01BZUJAYmFzaWxlLnJlbWxhYi5uZXQvICMgWzFdCj4+
ID4gU3VnZ2VzdGVkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4g
PiBTdWdnZXN0ZWQtYnk6IFLDqW1pIERlbmlzLUNvdXJtb250IDxyZW1pQHJlbWxhYi5uZXQ+Cj4+
ID4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+PiA+
IC0tLQo+PiA+IAo+PiA+IEkgZmlndXJlZCBJJ2Qgc2VudCBvdXQgYSBwcm9wZXIgcGF0Y2guIEkg
bGlrZSBBbmR5J3Mgb3B0aW1pemF0aW9uCj4+ID4gcGF0Y2gsIGJ1dCBUQkggSSB0aGluayB3ZSBz
aG91bGQgZG8gdGhhdCBhcyBhIGZvbGxvdyB1cC4KPj4gPiAKPj4gPiBBcyBSw6ltaSBwb2ludGVk
IG91dCwgdGhlIGNsZWFyaW5nIG1pZ2h0IGJlIG9wdGVkIG91dCwgYnV0IEkgbGVmdCBpdCBpbgo+
PiA+IGhlcmUuCj4+IAo+PiBJIHRoaW5rIHdlJ3JlIGdvaW5nIHRvIGVuZCB1cCB3aXRoIGEgYnVu
Y2ggb2YgdWFyY2gtc3BlY2lmaWMgc3R1ZmYgaGVyZSwgYnV0Cj4+IGZvciBub3cgaGF2aW5nIHRo
ZSBoZWF2eSBoYW1tZXIgc2VlbXMgc2FmZXN0LiAgVGhlcmUncyBubyBWIGhhcmR3YXJlIHlldCBz
bwo+PiB3ZSBjYW4ndCByZWFsbHkgdGVsbCBob3cgYW55dGhpbmcgcGVyZm9ybXMsIGF0IGxlYXN0
IHRoaXMgd2F5IHdlJ3JlCj4+IGRlZmluYXRlbHkgbm90IGxlYWtpbmcgYW55dGhpbmcuCj4+IAo+
PiBTbyBJJ20gT0sgd2l0aCB0aGlzLiAgSSdkIGFsc28gYmUgZmluZSB3aXRoIGNsZWFyaW5nIHRv
IGFsbC0xcywgSSB0aGluayBpdCdzCj4+IGtpbmQgb2Ygc3BsaXR0aW5nIGhhaXJzIGF0IHRoaXMg
cG9pbnQ6IHRoZSAxcyBhcmUgbmljZSBiZWNhdXNlIHRoZXkncmUgd2hhdAo+PiB0aGUgcmVzdCBv
ZiBWIGRvZXMsIGJ1dCBzZXR0aW5nIHZpbGwgc2hvdWxkIG1ha2UgZXZlcnl0aGluZyB0cmFwIGFu
eXdheSBzbwo+PiBtYXliZSBpdCBkb2Vzbid0IG1hdHRlciAtLSBhbmQgaXQncyBub3QgY2xlYXIg
aWYgMSBvciAwIHdpbGwgYWxsb3cgaW5pdGlhbCwKPj4gc28gd2hvIGtub3dzLgo+PiAKPj4gRGFy
aXVzOiBJJ20gY29vbCBzd2FwcGluZyBvdmVyIHRvIHRoZSAxcyBpZiB5b3UgZmVlbCBzdHJvbmds
eSBhYm91dCBpdC4KPj4gQmpvcm4gc2F5cyBTd2VlZGVuIGlzIG9uIHZhY2F0aW9uLCBzbyBqdXN0
IExNSyBhbmQgSSdsbCByZS1zcGluIGl0IHdpdGggdGhlCj4+IDFzLgo+Cj4gSSB0aGluayBhbGwg
MXMgd291bGQgYmUgcHJlZmVycmVkLCBidXQgSSBkb24ndCB0aGluayBpdCdzIHBhcnRpY3VsYXJs
eQo+IGNyaXRpY2FsIChzcGxpdHRpbmcgaGFpcnMsIGxpa2UgeW91IHNhaWQpLCBzbyBJJ2xsIGxl
dCB5b3UgbWFrZSB0aGUgY2FsbC4gIAoKT0ssIEknbSBqdXN0IGdvaW5nIHRvIHRha2UgdGhpcyB0
aGVuIGFzIGl0J3MgdGhlIGxlc3Mgd29yayBvcHRpb24gOykKCj4KPj4gCj4+IFJlZ2FyZGxlc3Mg
SSdkIGxpa2UgdG8gcGljayB1cCBzb21ldGhpbmcgdGhhdCBibG93cyBhd2F5IFYgc3RhdGUgZm9y
IHRoaXMKPj4gbWVyZ2Ugd2luZG93LCBhcyBpdCdsbCBtYWtlIHN1cmUgdGhlIHVBQkkgaXMgcXVp
dGUgc3RyaWN0bHkgZW5mb3JjZWQuCj4+IAo+PiA+IEJqw7Zybgo+PiA+IAo+PiA+IC0tLQo+PiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgMjUgKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgIHwgIDIgKysKPj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4+ID4gCj4+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oCj4+ID4gaW5kZXggMDRjMGIwN2JmNmNkLi42OTJjZTU1ZTRhNjkgMTAwNjQ0
Cj4+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+PiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPj4gPiBAQCAtMTYzLDYgKzE2MywzMCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVjdCB0YXNrX3N0cnVjdCAq
cHJldiwKPj4gPiAgdm9pZCByaXNjdl92X3ZzdGF0ZV9jdHJsX2luaXQoc3RydWN0IHRhc2tfc3Ry
dWN0ICp0c2spOwo+PiA+ICBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkKHZv
aWQpOwo+PiA+IAo+PiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVfZGlzY2Fy
ZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gPiArewo+PiA+ICsJdW5zaWduZWQgbG9uZyB2bCwg
dnR5cGVfaW52YWwgPSAxVUwgPDwgKEJJVFNfUEVSX0xPTkcgLSAxKTsKPj4gPiArCj4+ID4gKwlp
ZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHJlZ3MpKQo+PiA+ICsJCXJldHVybjsKPj4gPiArCj4+
ID4gKwlyaXNjdl92X2VuYWJsZSgpOwo+PiA+ICsJYXNtIHZvbGF0aWxlICgKPj4gPiArCQkiLm9w
dGlvbiBwdXNoXG5cdCIKPj4gPiArCQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCj4+ID4gKwkJInZz
ZXR2bGkJJTAsIHgwLCBlOCwgbTgsIHRhLCBtYVxuXHQiCj4+ID4gKwkJInZtdi52LmkJdjAsIDBc
blx0Igo+PiA+ICsJCSJ2bXYudi5pCXY4LCAwXG5cdCIKPj4gPiArCQkidm12LnYuaQl2MTYsIDBc
blx0Igo+PiA+ICsJCSJ2bXYudi5pCXYyNCwgMFxuXHQiCj4+ID4gKwkJInZzZXR2bAkJJTAsIHgw
LCAlMVxuXHQiCj4+ID4gKwkJIi5vcHRpb24gcG9wXG5cdCIKPj4gPiArCQk6ICI9JnIiICh2bCkg
OiAiciIgKHZ0eXBlX2ludmFsKSA6ICJtZW1vcnkiKTsKPj4gPiArCXJpc2N2X3ZfZGlzYWJsZSgp
Owo+PiA+ICsKPj4gPiArCXJpc2N2X3ZfdnN0YXRlX29uKHJlZ3MpOwo+PiA+ICt9Cj4+ID4gKwo+
PiA+ICAjZWxzZSAvKiAhIENPTkZJR19SSVNDVl9JU0FfViAgKi8KPj4gPiAKPj4gPiAgc3RydWN0
IHB0X3JlZ3M7Cj4+ID4gQEAgLTE3OCw2ICsyMDIsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcmlz
Y3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0KPj4g
PiAgI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBfX25leHQpCWRvIHt9IHdoaWxl
ICgwKQo+PiA+ICAjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX29mZihyZWdzKQkJZG8ge30gd2hpbGUg
KDApCj4+ID4gICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykJCQlkbyB7fSB3aGlsZSAo
MCkKPj4gPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpCQlkbyB7fSB3aGls
ZSAoMCkKPj4gPiAKPj4gPiAgI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JU0FfViAqLwo+PiA+IAo+
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+PiA+IGluZGV4IDA1ZmZkY2QxNDI0ZS4uMDBjNjhiNTdmZjg4IDEwMDY0
NAo+PiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jCj4+ID4gQEAgLTI5NSw2ICsyOTUsOCBAQCBhc21saW5rYWdlIF9f
dmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKPj4gPiAgCQlyZWdzLT5lcGMgKz0gNDsKPj4gPiAgCQlyZWdzLT5vcmlnX2EwID0g
cmVncy0+YTA7Cj4+ID4gCj4+ID4gKwkJcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChyZWdzKTsKPj4g
PiArCj4+ID4gIAkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywg
c3lzY2FsbCk7Cj4+ID4gCj4+ID4gIAkJaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPj4gPiAK
Pj4gPiBiYXNlLWNvbW1pdDogNDY4MWRhY2FkZWVmYTVjYTYwMTdlMDA3MzZhZGMxZDdkYzk2M2M2
YQo+Cj4gLS0gCj4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vi
c2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAibGludXgiIGdyb3VwLgo+IFRvIHVuc3Vic2Ny
aWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNl
bmQgYW4gZW1haWwgdG8gbGludXgrdW5zdWJzY3JpYmVAcml2b3NpbmMuY29tLgo+IFRvIHZpZXcg
dGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNv
bS9hL3Jpdm9zaW5jLmNvbS9kL21zZ2lkL2xpbnV4L1pKU0xLckIvNHhhWUI3NWQlNDBicnVjZS5i
bHVlc3BlYy5jb20uCj4gRm9yIG1vcmUgb3B0aW9ucywgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29v
Z2xlLmNvbS9hL3Jpdm9zaW5jLmNvbS9kL29wdG91dC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
