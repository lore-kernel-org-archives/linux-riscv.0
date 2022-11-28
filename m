Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1D1C4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dql5Wb7/xu6ig3vHcuJb7PxxXZ2YMBrnQJQuTqBMoWs=; b=p1iBuYUmqU+vvZ
	wDNR3XEIH8xkXtnY9I8fYANWLwKDG5HjHssSY/R+5y8okelaP3F0yACKFP1MfTHMZAUCcR5Z8w/Gu
	dbiiHFWCDKX4XlvON91ghEmbBCg4cpzw0PQWMrKjih07hvCJyZbDMIMuiofxOJ3boPBgx60oyPibw
	gfF65GqBM2CLtDuCytmEET7p1BmURFHSMG4QmllgphjiWCYsY2mmU1J2I3McAEBUkHtYcDgIrF1A3
	XKIDHv7RTZd/6MtJKnmMhjVeWOQFx1hHWJNCjSekdAwnclkRUtQHfO8BYJS4lbYiFo23MRJ6bT2TA
	4VVOKJBNm16ZnF4qBOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeCI-001o1y-GZ; Mon, 28 Nov 2022 13:29:22 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeCG-001nzd-3U
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 13:29:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id k5so9459482pjo.5
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 05:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBdU9MBKjL0Xadg7p+abX3ZuC4Gb0AyqB1eHg7GazfE=;
        b=VCINWH96hYF2LyLNKubViZIaiQbd8s8WBUNpDH0jKjBHGQ2ryA3XM+U+YvaM960KNY
         1XjgWvAPbtsLVmAOO9/8cZF3vLbu5Yx6pOElAAhbAa2UCE8eI/tiZGyJ0BjKi+GUAiLj
         XhgdlNXLrMk1rCnDa/Ppo/1slTy9fm8Ja3oSjkljS6tWDdmNrrp6kb4kxuorPxHUl5ui
         YLOe4hfK45AeBcIiY99PhpcxAuDQTgD+f/oCOphxl+BNeyKBNha//e4Pnxoshhm1aLAy
         DayLfXLnDwEgUErBD7Ve2vjk922foGo4dDjr9Xm5h8WKNJ5KtCzRAMbX2AicnZZ7chDg
         kdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBdU9MBKjL0Xadg7p+abX3ZuC4Gb0AyqB1eHg7GazfE=;
        b=qlxmXZczFDpF3wQuKSAzBphxbhvnQ5B69dAaRsYXk/qj+6o2AimO4YqyXhEaMuhvCN
         dpSlrEZczvlW39AbNgj8/Z5uzgOJMpP0JItg9MTSioGs43Wdmxs3x6SHaf4QLIx2GYKu
         lGI6UXBv27LNNjxnn2pB4Plh6mSKdvsLbHQ3RXfvYAukkkkeplgNFPcdtJBTWjZL0mvH
         qjTkOwDFoB2EIwh/rRqpJI7z4TD7zX94IZXKhIu5bfGrzmc9MFEn7a4ZfIJ9aXPltxGB
         S5gO+5yDDktgQ4SV8L9VZsZNGMLLzxgoYV6fWkPml3QSaqIYDAw0kiwvfIfyRnOhw163
         2zQQ==
X-Gm-Message-State: ANoB5pmRLpZ1zGmNYVzz2hK/TOUeeLf9CmBQgaGG0CBoT5RWGDltaxwO
	zt/IVZMkYIGFe8xRzk2sghR5QX5C/Z3pN/VOzEQ=
X-Google-Smtp-Source: AA0mqf5DYCv1aNh5HImmu7qLjWM2lakpYzwNvqT22+jQhNJ18ws9YJ7Vhl7ZuXmX4VXoHjAsF/yh2gG4Ai1QPtrzhoQ=
X-Received: by 2002:a17:903:2351:b0:189:6574:a4b7 with SMTP id
 c17-20020a170903235100b001896574a4b7mr17567737plh.107.1669642157574; Mon, 28
 Nov 2022 05:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTSbyfwdCDdUu7S3JpdFpspxVEi+t_8r6SQhaLogE1O7wg@mail.gmail.com>
In-Reply-To: <CAJF2gTSbyfwdCDdUu7S3JpdFpspxVEi+t_8r6SQhaLogE1O7wg@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Mon, 28 Nov 2022 13:29:05 +0000
Message-ID: <CAAYs2=hKSOo9KyvXE+Nt_GWZwXV91g04187LYx7LXUZ-c9urkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_052920_169424_47AA62CB 
X-CRM114-Status: GOOD (  23.78  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDI45pel5ZGo5LiAIDEz
OjE35YaZ6YGT77yaCj4KPiBPbiBXZWQsIE5vdiAyMywgMjAyMiBhdCAxMDoyMCBQTSBTb25nIFNo
dWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRk
cyBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBzdXBwb3J0IGZvciBSSVNDLVYuCj4g
Pgo+ID4gc2VsZWN0IHRoZSBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyB0byBwcm92
aWRlIHRoZQo+ID4gcmVnaXN0ZXJfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGludGVyZmFjZXMgYWxs
b3dpbmcgdXNlcnMgdG8gcmVnaXN0ZXIKPiA+IHRoZSBjdXN0b21lZCB0cmFtcG9saW5lIChkaXJl
Y3RfY2FsbGVyKSBhcyB0aGUgbWNvdW50IGZvciBvbmUgb3IKPiA+IG1vcmUgdGFyZ2V0IGZ1bmN0
aW9ucy4gQW5kIG1vZGlmeV9mdHJhY2VfZGlyZWN0W19tdWx0aV0gYXJlIGFsc28KPiA+IHByb3Zp
ZGVkIGZvciBtb2RpZnlpbmcgZGlyZWN0X2NhbGxlci4KPiA+Cj4gPiBUbyBtYWtlIHRoZSBkaXJl
Y3RfY2FsbGVyIGFuZCB0aGUgb3RoZXIgZnRyYWNlIGhvb2tzIChlZy4gZnVuY3Rpb24vZmdyYXBo
Cj4gPiB0cmFjZXIsIGtbcmV0XXByb2JlcykgY28tZXhpc3QsIGEgdGVtcG9yYXJ5IHJlZ2lzdGVy
IGlzIG5vbWluYXRlZCB0bwo+ID4gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2NhbGxlciBp
biBmdHJhY2VfcmVnc19jYWxsZXIuIEFmdGVyIHRoZQo+ID4gc2V0dGluZyBvZiB0aGUgYWRkcmVz
cyBkaXJlY3RfY2FsbGVyIGJ5IGRpcmVjdF9vcHMtPmZ1bmMgYW5kIHRoZQo+ID4gUkVTVE9SRV9S
RUdTIGluIGZ0cmFjZV9yZWdzX2NhbGxlciwgZGlyZWN0X2NhbGxlciB3aWxsIGJlIGp1bXBlZCB0
bwo+ID4gYnkgdGhlIGBqcmAgaW5zdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFp
IDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgICAgIHwgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCB8
IDYgKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TICB8IDQgKysrKwo+
ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IDM5ZWM4
ZDYyOGNmNi4uZDA4M2VjMDhkMGI2IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmln
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC0yNzgsNiArMjc4LDcgQEAgY29u
ZmlnIEFSQ0hfUlY2NEkKPiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfSU5UMTI4IGlm
IENDX0hBU19JTlQxMjgKPiA+ICAgICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0UgaWYg
IVhJUF9LRVJORUwgJiYgTU1VICYmICQoY2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVu
dHJ5PTgpCj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBp
ZiBIQVZFX0RZTkFNSUNfRlRSQUNFCj4gPiArICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRS
QUNFX1dJVEhfRElSRUNUX0NBTExTCj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09V
TlRfUkVDT1JEIGlmICFYSVBfS0VSTkVMCj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9O
X0dSQVBIX1RSQUNFUgo+ID4gICAgICAgICBzZWxlY3QgSEFWRV9GVU5DVElPTl9UUkFDRVIgaWYg
IVhJUF9LRVJORUwgJiYgIVBSRUVNUFRJT04KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4g
aW5kZXggMDFiZWJiMjhlYWJlLi5iZTRkNTc1NjYxMzkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Z0cmFjZS5oCj4gPiBAQCAtMTE0LDYgKzExNCwxMiBAQCBzdHJ1Y3QgZnRyYWNlX3JlZ3M7Cj4g
PiAgdm9pZCBmdHJhY2VfZ3JhcGhfZnVuYyh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25n
IHBhcmVudF9pcCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMg
Km9wLCBzdHJ1Y3QgZnRyYWNlX3JlZ3MgKmZyZWdzKTsKPiA+ICAjZGVmaW5lIGZ0cmFjZV9ncmFw
aF9mdW5jIGZ0cmFjZV9ncmFwaF9mdW5jCj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGFy
Y2hfZnRyYWNlX3NldF9kaXJlY3RfY2FsbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25l
ZCBsb25nIGFkZHIpCj4gPiArewo+ID4gKyAgICAgICAgICAgICAgIHJlZ3MtPnQxID0gYWRkcjsK
PiA+ICt9Cj4gPiArCj4gPiAgI2VuZGlmIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JF
R1MgKi8KPiA+Cj4gPiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3Vu
dC1keW4uUwo+ID4gaW5kZXggNDY2YzZlZjIxN2IxLi5iODljODVhNTg1NjkgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL21jb3VudC1keW4uUwo+ID4gQEAgLTIzMyw2ICsyMzMsNyBAQCBFTkRQUk9DKGZ0cmFj
ZV9jYWxsZXIpCj4gPiAgI2Vsc2UgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyAq
Lwo+ID4gIEVOVFJZKGZ0cmFjZV9yZWdzX2NhbGxlcikKPiA+ICAgICAgICAgU0FWRV9BQklfUkVH
UyAxCj4gPiArICAgICAgIFJFR19TICAgeDAsIFBUX1QxKHNwKQo+IEVOVFJZKGZ0cmFjZV9yZWdz
X2NhbGxlcikKPiArICAgIG1vdmUgdDEsIHplcm8KPiAgICAgICBTQVZFX0FCSV9SRUdTIDEKPiAg
ICAgICBQUkVQQVJFX0FSR1MKPgo+IFNoYWxsIHdlIHVzZSBhIG1vdmUgaGVyZSwgaW5zdGVhZD8K
VGhhdCBzZWVtcyBvayB0byBtZS4gSnVzdCBtb3ZlIGl0Lgo+Cj4gPiAgICAgICAgIFBSRVBBUkVf
QVJHUwo+ID4KPiA+ICBmdHJhY2VfcmVnc19jYWxsOgo+ID4gQEAgLTI0MSw3ICsyNDIsMTAgQEAg
ZnRyYWNlX3JlZ3NfY2FsbDoKPiA+Cj4gPgo+ID4gICAgICAgICBSRVNUT1JFX0FCSV9SRUdTIDEK
PiA+ICsgICAgICAgYm5leiAgICB0MSwuTGRpcmVjdAo+ID4gICAgICAgICBqciB0MAo+ID4gKy5M
ZGlyZWN0Ogo+ID4gKyAgICAgICBqciB0MQo+ID4gIEVORFBST0MoZnRyYWNlX3JlZ3NfY2FsbGVy
KQo+ID4KPiA+ICBFTlRSWShmdHJhY2VfY2FsbGVyKQo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPgo+
Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgoKCgotLSAKVGhhbmtzLApTb25nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
