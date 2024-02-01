Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578FAC4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yFci0g9ve9J1yvWeqy9qD10ewjLjfwvr+ipsxJ5yYY=; b=k7TOEMXSxEVrPr
	8SAcZagriZi+dgIR1npNKDvhb4abKs3yzat/Or45z55F2gI+cLv/iQBYKW/aHl3maZP3t4J07MHcA
	SAmSclgcsd2jikYdxFl1SwsueikOQhdFoM412KQundxhCZRMCOmVjmxEsUniTfcv+f9Ofb2jppFma
	NizFDahkDwevy3/cSLmpA/9tclNU64qoZcpjYvOWxvleeM00hP+6GMcrWT9pj2JGk+FpKnIe0H+g6
	VApDwBprAPMmH6dHmVvTJb93IbdAbg2VY+uxH8/771H6hmi4/xkkVSRpKlKMc+ddyVYCk60W6dIPy
	R5b3XXORRPQ1B2CY3h0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdBZ-00000009EAA-2FrM;
	Thu, 01 Feb 2024 19:57:21 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdBW-00000009E9O-3ReM
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 19:57:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-51124d86022so2147070e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 11:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706817436; x=1707422236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3021VM+AzQ6ZeLoFr/6H0XVQqS/2Wt7K7IALF5phVY=;
        b=OrVZj9pWqOhRYH/9yXOqALIkqw2sa60w/aIHjY6YeaMu/g9oZcDOGlQT26bYahMyOt
         wvqvqMHLc7gabpINyEqPe8zdYkCkaw34HQ2qyBu7Ns/gJ2rd9CVh0S+D81tgPp/02PRC
         XakAE2gLcKqf8V2eWQF1IJKvN/mYZ+LuqFrPb0wQ5SuED2CAjYXv3guRahb1m6+avxkE
         jHzhAwCziH/Rx+wjdthe2eXMIr3p8CyKQUgf4nNwHrKBHmwZTibmDW8+SF4HZDZU734L
         z5WtCNEQo9oWXz90jtspG3Kk90rSh3zgglTJbETf9Jn+FmWyoHf83b00wmgWu/lxwJDT
         8KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706817436; x=1707422236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3021VM+AzQ6ZeLoFr/6H0XVQqS/2Wt7K7IALF5phVY=;
        b=lUqqDznjhx8bewaJBaxYeJh/Y6Zq1d6W2sU4cbpTKzCTCUkYUDuWo+3a9w4Ntu39ov
         DA9AYrcNpoVFKA80RB8G5E9uYdYacW5H4HScSAISbscPFB9Fox0Owq4xlhUD92C3QfDu
         d5FV6w7sJNBPpDzuyUN86v4BjmFufndRVjo28WquPG4cH7PhKJ2jcHKG4N2Z4CQBgD4R
         nE/Ec/O8aJeIBrVgUnpH8IX98PBFpKAWgciFD9fVlqVomPM6hChlfw1YprkLjYZZ3Xij
         ErPSbRZnaA8zIkLRI35ChkQ2uaTqmoYTjBDgxJsJ1/ae1XSf+6VCXKei3OXilWWypx8b
         Peaw==
X-Gm-Message-State: AOJu0YxCrYzgRFGPgFIUqrA8ZMdv0XXN+XEPWl2dBEYg3fNwBt4keDvg
	6vsA7GiQsA7fpeM844wUffD8OHPhKruIsy4mI43CVp6UVgN0Tl7pjlG5bXwNnzQhf9AHPx9E6ea
	zfPWyTmtpHHGCcQX4cJh5DVkD9fs=
X-Google-Smtp-Source: AGHT+IEL+1Id5JbB0KpcKfsYDu9j5VFxy4YYttvnukZ2wtdTLmliIK9RUEhbRanRVr91KaMO/3VLj6DKge1amnqIVZo=
X-Received: by 2002:a2e:8791:0:b0:2d0:8088:c069 with SMTP id
 n17-20020a2e8791000000b002d08088c069mr595286lji.30.1706817435960; Thu, 01 Feb
 2024 11:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
 <20240131-disable_misaligned_probe_config-v1-2-98d155e9cda8@rivosinc.com>
 <48e6b009-c79c-4a2e-a532-e46c7b8b6fc8@rivosinc.com> <Zbvslcl7YTy38HNF@ghost>
In-Reply-To: <Zbvslcl7YTy38HNF@ghost>
From: Charles Lohr <lohr85@gmail.com>
Date: Thu, 1 Feb 2024 11:57:04 -0800
Message-ID: <CAGu26P85ZO1dY+qftMndKzwBpsA72x=KNWVyry=38uPhfuFweQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Disable misaligned access probe when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_115718_885181_47FFC1A1 
X-CRM114-Status: GOOD (  34.06  )
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

SSBhbSBhIGxpdHRsZSBjb25mdXNlZCBoZXJlIC0gSSB3YXMgdGVzdGluZyB3aXRoIDYuOC1yYzEg
YW5kIGl0IGRpZG4ndApzZWVtIHRvIGhhdmUgdGhlIGJlaGF2aW9yIG9mIHBlcmZvcm1pbmcgdGhl
IHByb2JlIChUaGUgcHJvYmUga2lsbHMKYm9vdCBwZXJmb3JtYW5jZSBpbiBteSBhcHBsaWNhdGlv
biBhbmQgSSd2ZSBoYWQgdG8gcGF0Y2ggb3V0IHRoZSBwcm9iZQppbiBtaWQtNi54IGtlcm5lbHMp
LgoKRGlkIHNvbWV0aGluZyBnZXQgcmV2ZXJ0ZWQgdG8gYnJpbmcgYmFjayB0aGUgcHJvYmUgZXZl
biB3aGVuCkNPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPVkgYmV0d2VlbiBy
YzEgYW5kIHRydW5rPyAgT3IgYW0KSSBtaXNyZW1lbWJlcmluZy9hY2NpZGVudGFsbHkgcGF0Y2hl
ZD8KCk9uIFRodSwgRmViIDEsIDIwMjQgYXQgMTE6MTDigK9BTSBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgRmViIDAxLCAyMDI0IGF0IDAy
OjQzOjQzUE0gKzAxMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiA+Cj4gPgo+ID4gT24gMDEv
MDIvMjAyNCAwNzo0MCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiBXaGVuIENPTkZJR19I
QVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGlzIHNlbGVjdGVkLCB0aGUgY3B1cyBjYW4g
YmUKPiA+ID4gc2V0IHRvIGhhdmUgZmFzdCBtaXNhbGlnbmVkIGFjY2VzcyB3aXRob3V0IG5lZWRp
bmcgdG8gcHJvYmUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jcHVmZWF0dXJlLmggIHwgNyArKysrKysrCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMgICAgICAgfCA0ICsrKysKPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMgICAgICB8IDQgKysrKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jIHwgNCArKysrCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiA+ID4gaW5kZXgg
ZGZkY2NhMjI5MTc0Li43ZDhkNjQ3ODNlMzggMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3B1ZmVhdHVyZS5oCj4gPiA+IEBAIC0xMzcsMTAgKzEzNywxNyBAQCBzdGF0aWMgX19hbHdh
eXNfaW5saW5lIGJvb2wgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoaW50IGNwdSwg
Y29uc3QgdW5zaQo+ID4gPiAgICAgcmV0dXJuIF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFi
bGUoaGFydF9pc2FbY3B1XS5pc2EsIGV4dCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICsjaWZuZGVm
IENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gPiA+ICBERUNMQVJFX1NU
QVRJQ19LRVlfRkFMU0UoZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZF9rZXkpOwo+ID4gPgo+
ID4gPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc19mYXN0X21pc2FsaWduZWRfYWNj
ZXNzZXModm9pZCkKPiA+ID4gIHsKPiA+ID4gICAgIHJldHVybiBzdGF0aWNfYnJhbmNoX2xpa2Vs
eSgmZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZF9rZXkpOwo+ID4gPiAgfQo+ID4gPiArI2Vs
c2UKPiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfZmFzdF9taXNhbGlnbmVk
X2FjY2Vzc2VzKHZvaWQpCj4gPiA+ICt7Cj4gPiA+ICsgICByZXR1cm4gdHJ1ZTsKPiA+ID4gK30K
PiA+ID4gKyNlbmRpZgo+ID4gPiAgI2VuZGlmCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+
ID4gaW5kZXggODk5MjBmODRkMGEzLi5kNzg3ODQ2YzBiNjggMTAwNjQ0Cj4gPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiA+ID4gQEAgLTQzLDEwICs0MywxMiBAQCBzdGF0aWMgREVDTEFSRV9C
SVRNQVAocmlzY3ZfaXNhLCBSSVNDVl9JU0FfRVhUX01BWCkgX19yZWFkX21vc3RseTsKPiA+ID4g
IC8qIFBlci1jcHUgSVNBIGV4dGVuc2lvbnMuICovCj4gPiA+ICBzdHJ1Y3QgcmlzY3ZfaXNhaW5m
byBoYXJ0X2lzYVtOUl9DUFVTXTsKPiA+ID4KPiA+ID4gKyNpZm5kZWYgQ09ORklHX0hBVkVfRUZG
SUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiA+ID4gIC8qIFBlcmZvcm1hbmNlIGluZm9ybWF0aW9u
ICovCj4gPiA+ICBERUZJTkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7
Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgY3B1bWFza190IGZhc3RfbWlzYWxpZ25lZF9hY2Nlc3M7Cj4g
PiA+ICsjZW5kaWYKPiA+ID4KPiA+ID4gIC8qKgo+ID4gPiAgICogcmlzY3ZfaXNhX2V4dGVuc2lv
bl9iYXNlKCkgLSBHZXQgYmFzZSBleHRlbnNpb24gd29yZAo+ID4gPiBAQCAtNzA2LDYgKzcwOCw3
IEBAIHVuc2lnbmVkIGxvbmcgcmlzY3ZfZ2V0X2VsZl9od2NhcCh2b2lkKQo+ID4gPiAgICAgcmV0
dXJuIGh3Y2FwOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJ
Q0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiAgc3RhdGljIGludCBjaGVja191bmFsaWduZWRf
YWNjZXNzKHZvaWQgKnBhcmFtKQo+ID4gPiAgewo+ID4gPiAgICAgaW50IGNwdSA9IHNtcF9wcm9j
ZXNzb3JfaWQoKTsKPiA+ID4gQEAgLTk0Niw2ICs5NDksNyBAQCBzdGF0aWMgaW50IGNoZWNrX3Vu
YWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKPiA+ID4gIH0KPiA+ID4KPiA+ID4gIGFyY2hf
aW5pdGNhbGwoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cyk7Cj4gPiA+ICsjZW5kaWYg
LyogQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgKi8KPiA+ID4KPiA+ID4g
IHZvaWQgcmlzY3ZfdXNlcl9pc2FfZW5hYmxlKHZvaWQpCj4gPiA+ICB7Cj4gPgo+ID4gSGkgQ2hh
cmxpZSwKPiA+Cj4gPiBHZW5lcmFsbHksIGhhdmluZyBzbyBtdWNoIGlmZGVmIGluIHZhcmlvdXMg
cGllY2VzIG9mIGNvZGUgaXMgcHJvYmFibHkKPiA+IG5vdCBhIGdvb2QgaWRlYS4KPiA+Cj4gPiBB
RkFJQ1QsIGlmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGlzIGVuYWJs
ZWQsIHRoZSB3aG9sZQo+ID4gbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgY2hlY2tpbmcgY291bGQg
YmUgb3B0LW91dC4gd2hpY2ggbWVhbnMgdGhhdAo+ID4gcHJvYmFibHkgZXZlcnl0aGluZyByZWxh
dGVkIHRvIG1pc2FsaWduZWQgYWNjZXNzZXMgc2hvdWxkIGJlIG1vdmVkIGluCj4gPiBpdCdzIG93
biBmaWxlIGJ1aWxkIGl0IG9ubHkgZm9yIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURf
QUNDRVNTPW4KPiA+IG9ubHkuCj4KPiBJIHdpbGwgbG9vayBpbnRvIGRvaW5nIHNvbWV0aGluZyBt
b3JlIGNsZXZlciBoZXJlISBJIGFncmVlIGl0IGlzIG5vdAo+IHZlcnkgbmljZSB0byBoYXZlIHNv
IG1hbnkgaWZkZWZzIHNjYXR0ZXJlZC4KPgo+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
Cj4gPiA+IGluZGV4IGE3YzU2YjQxZWZkMi4uM2YxYTZlZGZkYjA4IDEwMDY0NAo+ID4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMKPiA+ID4gQEAgLTE0OSw2ICsxNDksNyBAQCBzdGF0aWMgYm9v
bCBod3Byb2JlX2V4dDBfaGFzKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzLCB1bnNpZ25lZCBs
b25nIGV4dCkKPiA+ID4KPiA+ID4gIHN0YXRpYyB1NjQgaHdwcm9iZV9taXNhbGlnbmVkKGNvbnN0
IHN0cnVjdCBjcHVtYXNrICpjcHVzKQo+ID4gPiAgewo+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFW
RV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiAgICAgaW50IGNwdTsKPiA+ID4gICAg
IHU2NCBwZXJmID0gLTFVTEw7Cj4gPiA+Cj4gPiA+IEBAIC0xNjgsNiArMTY5LDkgQEAgc3RhdGlj
IHU2NCBod3Byb2JlX21pc2FsaWduZWQoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMpCj4gPiA+
ICAgICAgICAgICAgIHJldHVybiBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTjsKPiA+
ID4KPiA+ID4gICAgIHJldHVybiBwZXJmOwo+ID4gPiArI2Vsc2UKPiA+ID4gKyAgIHJldHVybiBS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfRkFTVDsKPiA+ID4gKyNlbmRpZgo+ID4gPiAgfQo+ID4g
Pgo+ID4gPiAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9i
ZSAqcGFpciwKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQ+IGluZGV4IDhkZWQy
MjVlOGM1Yi4uYzI0Zjc5ZDc2OWY2IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jCj4gPiA+IEBAIC00MTMsNyArNDEzLDkgQEAgaW50IGhhbmRsZV9taXNhbGln
bmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+Cj4gPiA+ICAgICBwZXJmX3N3X2V2
ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7Cj4gPiA+
Cj4gPiA+ICsjaWZuZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4g
PiA+ICAgICAqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCkgPSBSSVNDVl9I
V1BST0JFX01JU0FMSUdORURfRU1VTEFURUQ7Cj4gPiA+ICsjZW5kaWYKPiA+Cj4gPiBJIHRoaW5r
IHRoYXQgcmF0aGVyIHVzaW5nIGlmZGVmZXJ5IGluc2lkZSB0aGlzIGZpbGUgKHRyYXBzX21pc2Fs
aWduZWQuYykKPiA+ICBpdCBjYW4gYmUgdG90YWxseSBvcHQtb3V0IGluIGNhc2Ugd2UgaGF2ZQo+
ID4gQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1Mgc2luY2UgaXQgaW1wbGll
cyB0aGF0IG1pc2FsaWduZWQKPiA+IGFjY2Vzc2VzIGFyZSBub3QgZW11bGF0ZWQgKGF0IGxlYXN0
IHRoYXQgaXMgbXkgdW5kZXJzdGFuZGluZykuCj4gPgo+Cj4gVGhhdCdzIGEgZ3JlYXQgaWRlYSwg
SSBiZWxpZXZlIHRoYXQgaXMgY29ycmVjdC4KPgo+IC0gQ2hhcmxpZQo+Cj4gPiBUaGFua3MsCj4g
Pgo+ID4gQ2zDqW1lbnQKPiA+Cj4gPgo+ID4gPgo+ID4gPiAgICAgaWYgKCF1bmFsaWduZWRfZW5h
YmxlZCkKPiA+ID4gICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4gPiBAQCAtNTk2LDYgKzU5OCw3
IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+
ID4gICAgIHJldHVybiAwOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFW
RV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiAgYm9vbCBjaGVja191bmFsaWduZWRf
YWNjZXNzX2VtdWxhdGVkKGludCBjcHUpCj4gPiA+ICB7Cj4gPiA+ICAgICBsb25nICptYXNfcHRy
ID0gcGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpOwo+ID4gPiBAQCAt
NjQwLDYgKzY0Myw3IEBAIHZvaWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCkKPiA+
ID4gICAgIH0KPiA+ID4gICAgIHVuYWxpZ25lZF9jdGwgPSB0cnVlOwo+ID4gPiAgfQo+ID4gPiAr
I2VuZGlmCj4gPiA+Cj4gPiA+ICBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpCj4g
PiA+ICB7Cj4gPiA+Cj4gPgo+ID4KPiA+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
