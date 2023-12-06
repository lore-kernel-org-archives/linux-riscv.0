Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CE7C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6OxpQCWDpcmROZdhwfWgf5X4iDcK5PReiYq3DQErzY=; b=kZHJtTeiFgVATl
	dggrUQbAc/BfnkPIX/hpqexTIXU3LJbzAKQ/r+cymRrTZGMChOKanTtElTZGTos/fqWWae6gN1goY
	NBYsabK2siQd+VfLBH9R1wRJ8gCBNsnMKZgk5oT2clUCW9oHl1wpTDtx4DwqEG1aLnM/IMs/SEdhH
	ui2Dr/vg7keKyuZ2EjcTMKnM7lHRuS3nqW5I9ujJZhYSKxziu2rmzPugT/MQsRXa2chkTDAN236lY
	sLuDL824TwqPd4Dy/olQOWUrx8cQzSL2r2zUUah/hg1/XR0q0XdRPnFFzIBDmFaFtEy4m5eSjSp1E
	8+50gNgmjdFuIaDwIBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhOU-008sAO-18;
	Wed, 06 Dec 2023 02:12:10 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhOR-008s9Z-0b
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 02:12:08 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54c77d011acso3270a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 18:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701828711; x=1702433511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSzJ/eDmpu5qKlh7l7ZmUhxzU0D7hwAbG/bWD2UzWAg=;
        b=mmsd5Ey7saMwWWp3xYmBDHYXKRZSoQ/S4cVbKwEP5HColh6LUQItEv52tN2PSGMmOA
         wMW/7uLetMni5fgwXpGBAaS3c7GgRriqFtyPW3hHYMtPxC+ohaLkN1qHmJdJSh/L2wzl
         ZPq5uCqXWp6qQ30EaCC5SCth7iC2MmxO4wc/v1HbKpYvpHLxNxoDofHoV+QaRcKPKTSz
         vGIjRGhlm9snJZ+apuIv3Uen75elC0GhBBURmN68n9ZywJETrs99+aiCzDxnfECDxJqw
         UIdLYUYsdw+qUUw63WbE3jrc6gTDLrBPTvOFodRoy0Qp4OTfqzczvW/vprO62P012DLd
         FHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701828711; x=1702433511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSzJ/eDmpu5qKlh7l7ZmUhxzU0D7hwAbG/bWD2UzWAg=;
        b=SCiIsC16SH11EvpfrDcVGz42UZNY2KmqW+M0nqZcCFzA2xX/DIQlHTQwnpM+r9lxn1
         xN7nkmJEJ2ruZiki94hdv1fPc8a3wCHNxpp6AU/iE1p7k2/D0EnuUqrZCxVZMChadV0V
         /wq0r+rzcZ2wL5QVZwKAemyt6DvZprI/D376M42EXc7D+7UboA1nOjoI6jrIkPnbNRRg
         64c8d6A35L7jj4XDvW53+pHbDr/9AVH10wO3Uc1CanoK44LC8waH/FuRrBNSI4QILJFe
         vyQgUwHuZClJjtw7Lg84FUoQ2DM4YwKx/YaN5kNuLXcgbEaecZdMKnBdJLqKdwb81k/W
         fapQ==
X-Gm-Message-State: AOJu0YyIJW28WOdNdWTV1hK3sijaW0UTo7mXKaY/tEchTu8sOnjPsWHD
	PrzcrBn24ujB1QV9fropdc8/bU0AxluV6l15LLWs+w==
X-Google-Smtp-Source: AGHT+IFzA8RIjLbgincX9lQ/PvllzQCK/mYcCDN7t80oDb+wk/rQpCEl5GkjPt8Q+5aU6plyxvR27GnuD2AjYgQfTS8=
X-Received: by 2002:a50:9f69:0:b0:54b:6b3f:4a86 with SMTP id
 b96-20020a509f69000000b0054b6b3f4a86mr43698edf.4.1701828710837; Tue, 05 Dec
 2023 18:11:50 -0800 (PST)
MIME-Version: 1.0
References: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org> <20231205-riscv-restrict-dwarf5-llvm-v2-2-aedf00a382ac@kernel.org>
In-Reply-To: <20231205-riscv-restrict-dwarf5-llvm-v2-2-aedf00a382ac@kernel.org>
From: Fangrui Song <maskray@google.com>
Date: Tue, 5 Dec 2023 18:11:38 -0800
Message-ID: <CAFP8O3+-YZaS01NSYt9d2cOVLS-wHk-tMjB8URA0g2GPddy4HQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] riscv: Restrict DWARF5 when building with LLVM to
 known working versions
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_181207_241056_4529E780 
X-CRM114-Status: GOOD (  15.49  )
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

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCAzOjU04oCvUE0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IExMVk0gcHJpb3IgdG8gMTguMC4wIHdvdWxkIGdlbmVy
YXRlIGluY29ycmVjdCBkZWJ1ZyBpbmZvIGZvciBEV0FSRjUgZHVlCj4gdG8gbGlua2VyIHJlbGF4
YXRpb24sIHdoaWNoIHdhcyB3b3JrZWQgYXJvdW5kIGluIGNsYW5nIGJ5IGRlZmF1bHRpbmcKPiBS
SVNDLVYgdG8gRFdBUkY0IFsxXS4gVW5mb3J0dW5hdGVseSwgdGhpcyB3b3JrYXJvdW5kIGRvZXMg
bm90IHdvcmsgZm9yCj4gdGhlIGtlcm5lbCBiZWNhdXNlIHRoZSBEV0FSRiB2ZXJzaW9uIGNhbiBi
ZSBpbmRlcGVuZGVudGx5IGNoYW5nZWQgZnJvbQo+IHRoZSBkZWZhdWx0IGluIEtjb25maWcuCj4K
PiBEbyBub3QgYWxsb3cgRFdBUkY1IHRvIGJlIHNlbGVjdGVkIGZvciBSSVNDLVYgd2hlbiB1c2lu
ZyBsaW5rZXIKPiByZWxheGF0aW9uIChsZC5sbGQgPj0gMTUuMC4wKSBhbmQgYSB2ZXJzaW9uIG9m
IExMVk0gdGhhdCBkb2VzIG5vdCBoYXZlCj4gdGhlIGZpeGVzICh0aGUgaW50ZWdyYXRlZCBhc3Nl
bWJsZXIgWzJdIGFuZCBsZC5sbGQgWzNdIDwgMTguMC4wKQo+IG5lY2Vzc2FyeSB0byBnZW5lcmF0
ZSB0aGUgY29ycmVjdCBkZWJ1ZyBpbmZvLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2xs
dm0vbGx2bS1wcm9qZWN0L2NvbW1pdC9iYmMwZjk5ZjNiYzk2ZjFkYjE2ZjY0OWZjMjFkZDE4ZTVi
MDkxOGY2IFsxXQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9j
b21taXQvMWRmNWVhMjliNDM2OTBiNjYyMmRiMmNhZDdiNzQ1NjA3Y2E0ZGU2YSBbMl0KPiBMaW5r
OiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvY29tbWl0LzdmZmFiYjYxYTU1
Njk0NDRiNWFjOTMyMmUyMmU1NDcxY2M1ZTRhNzcgWzNdCj4gU2lnbmVkLW9mZi1ieTogTmF0aGFu
IENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25m
aWcgfCA5ICsrKysrKysrKwo+ICBsaWIvS2NvbmZpZy5kZWJ1ZyAgfCAxICsKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29u
ZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggNzJiZTFkODEyMmEzLi44MWI0NzNjYjQ3
YjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4gQEAgLTE4Niw2ICsxODYsMTUgQEAgY29uZmlnIFJJU0NWX1VTRV9MSU5LRVJfUkVM
QVhBVElPTgo+ICAgICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3Qv
Y29tbWl0LzY2MTFkNThmNWJiY2JlYzc3MjYyZDM5MmUyOTIzZTFkNjgwZjY5ODUKPiAgICAgICAg
IGRlcGVuZHMgb24gIUxEX0lTX0xMRCB8fCBMTERfVkVSU0lPTiA+PSAxNTAwMDAKPgo+ICsjIGh0
dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9jb21taXQvYmJjMGY5OWYzYmM5NmYx
ZGIxNmY2NDlmYzIxZGQxOGU1YjA5MThmNgo+ICtjb25maWcgQVJDSF9IQVNfQlJPS0VOX0RXQVJG
NQo+ICsgICAgICAgZGVmX2Jvb2wgeQo+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9VU0VfTElO
S0VSX1JFTEFYQVRJT04KPiArICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1w
cm9qZWN0L2NvbW1pdC8xZGY1ZWEyOWI0MzY5MGI2NjIyZGIyY2FkN2I3NDU2MDdjYTRkZTZhCj4g
KyAgICAgICBkZXBlbmRzIG9uIEFTX0lTX0xMVk0gJiYgQVNfVkVSU0lPTiA8IDE4MDAwMAo+ICsg
ICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvY29tbWl0LzdmZmFi
YjYxYTU1Njk0NDRiNWFjOTMyMmUyMmU1NDcxY2M1ZTRhNzcKPiArICAgICAgIGRlcGVuZHMgb24g
TERfSVNfTExEICYmIExMRF9WRVJTSU9OIDwgMTgwMDAwCj4gKwoKTEdUTS4gIGxvb25nYXJjaCBm
b2xrcyBjYW4gYWRkIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgYWZ0ZXIgdGhleQpmaW5pc2ggdGhl
aXIgUl9MQVJDSF9BRERfVUxFQjEyOC9SX0xBUkNIX1NVQl9VTEVCMTI4IHRvb2xjaGFpbiB3b3Jr
LgoKUmV2aWV3ZWQtYnk6IEZhbmdydWkgU29uZyA8bWFza3JheUBnb29nbGUuY29tPgoKPiAgY29u
ZmlnIEFSQ0hfTU1BUF9STkRfQklUU19NSU4KPiAgICAgICAgIGRlZmF1bHQgMTggaWYgNjRCSVQK
PiAgICAgICAgIGRlZmF1bHQgOAo+IGRpZmYgLS1naXQgYS9saWIvS2NvbmZpZy5kZWJ1ZyBiL2xp
Yi9LY29uZmlnLmRlYnVnCj4gaW5kZXggY2M3ZDUzZDlkYzAxLi5hMGViY2UwNWEzNjggMTAwNjQ0
Cj4gLS0tIGEvbGliL0tjb25maWcuZGVidWcKPiArKysgYi9saWIvS2NvbmZpZy5kZWJ1Zwo+IEBA
IC0yODIsNiArMjgyLDcgQEAgY29uZmlnIERFQlVHX0lORk9fRFdBUkY0Cj4gIGNvbmZpZyBERUJV
R19JTkZPX0RXQVJGNQo+ICAgICAgICAgYm9vbCAiR2VuZXJhdGUgRFdBUkYgVmVyc2lvbiA1IGRl
YnVnaW5mbyIKPiAgICAgICAgIHNlbGVjdCBERUJVR19JTkZPCj4gKyAgICAgICBkZXBlbmRzIG9u
ICFBUkNIX0hBU19CUk9LRU5fRFdBUkY1Cj4gICAgICAgICBkZXBlbmRzIG9uICFDQ19JU19DTEFO
RyB8fCBBU19JU19MTFZNIHx8IChBU19JU19HTlUgJiYgQVNfVkVSU0lPTiA+PSAyMzUwMiAmJiBB
U19IQVNfTk9OX0NPTlNUX0xFQjEyOCkKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgR2VuZXJh
dGUgRFdBUkYgdjUgZGVidWcgaW5mby4gUmVxdWlyZXMgYmludXRpbHMgMi4zNS4yLCBnY2MgNS4w
KyAoZ2NjCj4KPiAtLQo+IDIuNDMuMAo+Cj4KCgotLSAK5a6L5pa5552/CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
