Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283A6C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vFmM4TVgfSWe8ibDx90CO9jyPyAnSSdoUsDBcXESyY=; b=VBgXgwiH/WmTG9
	m3rFNSwJFnMiDPyCLiGf5xwpz56HKGADeIxr49N3iYAhYSD9OPaV98viSiKMXp/j93WL2lIP6GaCp
	CLy9T1VTUNe1Y3V9Tlzx0WcE4JAGRKtQPH8QzrzckQ9yK868tong1gfvIaJ8VN9IOGrz59u1f17C7
	i99+g0XG6UK1jrsvg1Mvikovubce/ya1ybiSxMlwibSo1AZ3nwQ51Juh5kDPq2b/K4s/k7iviyVad
	H0AP68dKoE4cCYU5M0DE8C0CUY1/dsgMUVB3E1y7wZUtoBIG0Lo9+ZVtYw2Q8bjv7aIywv31WQbEO
	VJAg/k8v+SMbrK83MaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0HXm-00E99h-Df; Wed, 30 Nov 2022 07:30:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0HXj-00E98g-Ta
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 07:30:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42B8F61A55
	for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD0DC433D7
	for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669793406;
	bh=24uFz0b68v5+VVJUu/He47zj/7dJG9dq467p9XypaeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=th8ebr7fQaM8gfHn5sGm3/QvcQB8h3WdL04sQNGRkPWKvb9f/mdCmG0hvCSEVxHvK
	 S96BK9md45sShploOxsGWeDBC39wsi5BLntrB8STf2pbPP1qtIKC4vgk1PGlOHehCq
	 zUpDLtYeHweDLQB/aYsIYB/x+jjpPcecEEvCIO9o38p/PFwREaFvz3w59JMQ1keUXn
	 EQzSjnlb6MNLAcgEcSbblCi4FjM53gF+4C/0FQUNf0jxwzDWiVmb64Fnsdn6VbZUue
	 E9uvdIm9QS7TI9HNJDF7wZAy7NsjQntLN1JBbjBU87xNe9+PQoruVc1se3m3f48AWf
	 MgoFvEaKNRr2Q==
Received: by mail-ed1-f52.google.com with SMTP id a16so1370667edb.9
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 23:30:06 -0800 (PST)
X-Gm-Message-State: ANoB5pnI/9WgyOEt8PRicoW2C7EnNJR2uKGeadnQ0Q0eUU3SFFYTfOB5
	cwdgCK3k8hwiZcRAeN11bNpxxgQ1tobVPtF7IAc=
X-Google-Smtp-Source: AA0mqf5MN2g4IJe4JEA/IqpLTHs5+DQIGo50jetRn/E+i2xurtRBNwDC/YOvpVHzxRcGhHpTzZHvXsmBqgGu6aEjoio=
X-Received: by 2002:aa7:c046:0:b0:461:54f0:f7dc with SMTP id
 k6-20020aa7c046000000b0046154f0f7dcmr54770572edo.117.1669793404614; Tue, 29
 Nov 2022 23:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20221129033230.255947-1-guoren@kernel.org> <20221129033230.255947-7-guoren@kernel.org>
 <CAAYs2=hOY+ib_OYwUfnM10kwyqte7C7=efTL00VkVKHWM9HbAw@mail.gmail.com>
In-Reply-To: <CAAYs2=hOY+ib_OYwUfnM10kwyqte7C7=efTL00VkVKHWM9HbAw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 30 Nov 2022 15:29:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSTMqcF4zYXOCK2zccwqkqPdgttK00XXWq3YQubaB5XAw@mail.gmail.com>
Message-ID: <CAJF2gTSTMqcF4zYXOCK2zccwqkqPdgttK00XXWq3YQubaB5XAw@mail.gmail.com>
Subject: Re: [PATCH V4 6/7] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 support
To: Song Shuai <suagrfillet@gmail.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	andy.chiu@sifive.com, mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_233008_057293_56DDCB94 
X-CRM114-Status: GOOD (  28.37  )
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

T24gVHVlLCBOb3YgMjksIDIwMjIgYXQgODowMyBQTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gPGd1b3JlbkBrZXJuZWwub3JnPiDkuo4yMDIy5bm0MTHmnIgy
OeaXpeWRqOS6jCAwMzozM+WGmemBk++8mgo+ID4KPiA+IEZyb206IFNvbmcgU2h1YWkgPHN1YWdy
ZmlsbGV0QGdtYWlsLmNvbT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgRFlOQU1JQ19GVFJBQ0Vf
V0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydCBmb3IgUklTQy1WLgo+ID4KPiA+IHNlbGVjdCB0aGUg
RFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgdG8gcHJvdmlkZSB0aGUKPiA+IHJlZ2lz
dGVyX2Z0cmFjZV9kaXJlY3RbX211bHRpXSBpbnRlcmZhY2VzIGFsbG93aW5nIHVzZXJzIHRvIHJl
Z2lzdGVyCj4gPiB0aGUgY3VzdG9tZWQgdHJhbXBvbGluZSAoZGlyZWN0X2NhbGxlcikgYXMgdGhl
IG1jb3VudCBmb3Igb25lIG9yCj4gPiBtb3JlIHRhcmdldCBmdW5jdGlvbnMuIEFuZCBtb2RpZnlf
ZnRyYWNlX2RpcmVjdFtfbXVsdGldIGFyZSBhbHNvCj4gPiBwcm92aWRlZCBmb3IgbW9kaWZ5aW5n
IGRpcmVjdF9jYWxsZXIuCj4gPgo+ID4gVG8gbWFrZSB0aGUgZGlyZWN0X2NhbGxlciBhbmQgdGhl
IG90aGVyIGZ0cmFjZSBob29rcyAoZWcuIGZ1bmN0aW9uL2ZncmFwaAo+ID4gdHJhY2VyLCBrW3Jl
dF1wcm9iZXMpIGNvLWV4aXN0LCBhIHRlbXBvcmFyeSByZWdpc3RlciBpcyBub21pbmF0ZWQgdG8K
PiA+IHN0b3JlIHRoZSBhZGRyZXNzIG9mIGRpcmVjdF9jYWxsZXIgaW4gZnRyYWNlX3JlZ3NfY2Fs
bGVyLiBBZnRlciB0aGUKPiA+IHNldHRpbmcgb2YgdGhlIGFkZHJlc3MgZGlyZWN0X2NhbGxlciBi
eSBkaXJlY3Rfb3BzLT5mdW5jIGFuZCB0aGUKPiA+IFJFU1RPUkVfUkVHUyBpbiBmdHJhY2VfcmVn
c19jYWxsZXIsIGRpcmVjdF9jYWxsZXIgd2lsbCBiZSBqdW1wZWQgdG8KPiA+IGJ5IHRoZSBganJg
IGluc3QuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21h
aWwuY29tPgo+ID4gVGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IFNp
Z25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICB8IDEgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZnRyYWNlLmggfCA2ICsrKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1k
eW4uUyAgfCA0ICsrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmln
Cj4gPiBpbmRleCAxZDBlNTgzOGIxMWIuLjI4Mjg1MzdhYmZjZCAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtMjc4
LDYgKzI3OCw3IEBAIGNvbmZpZyBBUkNIX1JWNjRJCj4gPiAgICAgICAgIHNlbGVjdCBBUkNIX1NV
UFBPUlRTX0lOVDEyOCBpZiBDQ19IQVNfSU5UMTI4Cj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0RZ
TkFNSUNfRlRSQUNFIGlmICFYSVBfS0VSTkVMICYmIE1NVSAmJiAkKGNjLW9wdGlvbiwtZnBhdGNo
YWJsZS1mdW5jdGlvbi1lbnRyeT04KQo+IEkgbm90aWNlZCB0aGlzIGNjLW9wdGlvbiB1c2VzIHRo
ZSAnLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9OCcgdG8KPiBqdWRnZSBpZiB0aGUgY29tcGls
ZXIgc3VwcG9ydHMgdGhpcyBvcHRpb24uCj4gU2hvdWxkIHdlIGtlZXAgdXAgd2l0aCB0aGUgQ0Nf
RkxBR1NfRlRSQUNFIG1vZGlmaWVkIGluICgicmlzY3Y6Cj4gZnRyYWNlOiBSZWR1Y2UgdGhlIGRl
dG91ciBjb2RlIHNpemUgdG8gaGFsZiIpLAo+IG9yIGZvbGxvdyB0aGUgcGFyaXNjIGFyY2hpdGVj
dHVyZSB0byBzZXQgdGhlIHZhbHVlIGFzICcxLDEnIGluIHRoZQo+IGNhc2Ugb2YgdGhlIENDX0ZM
QUdTX0ZUUkFDRSBpcyBub3QgY29uc3RhbnQuCj4gYGBgCj4gLi9hcmNoL3BhcmlzYy9NYWtlZmls
ZTo3NTpDQ19GTEFHU19GVFJBQ0UgOj0KPiAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT0kKE5P
UF9DT1VOVCksJChzaGVsbCBlY2hvCj4gJCQoKCQoTk9QX0NPVU5UKS0xKSkpCj4gLi9hcmNoL3Bh
cmlzYy9LY29uZmlnOjcwOiAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZgo+ICQo
Y2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTEsMSkKVGhlIC1mcGF0Y2hhYmxl
LWZ1bmN0aW9uLWVudHJ5PTggaXMgc3RpbGwgb2theSBmb3IgcmlzY3YgYmVjYXVzZSBpdCdzCmJp
ZyBlbm91Z2guIFlvdXIgcHJvcG9zYWwgY291bGQgYmUgYW5vdGhlciBvcHRpbWl6YXRpb24gcGF0
Y2gsIG5vdCBhCmZpeHVwIChObyBidWcgaGFwcGVucyA6KS4KCj4gYGBgCj4gPiAgICAgICAgIHNl
bGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZTkFNSUNfRlRSQUNF
Cj4gPiArICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExT
Cj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEIGlmICFYSVBfS0VS
TkVMCj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+ID4gICAg
ICAgICBzZWxlY3QgSEFWRV9GVU5DVElPTl9UUkFDRVIgaWYgIVhJUF9LRVJORUwgJiYgIVBSRUVN
UFRJT04KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gaW5kZXggODRmODU2YTMyODZlLi40
NTM5ZjEwZmVhNTYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFj
ZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPiBAQCAtMTE0
LDYgKzExNCwxMiBAQCBzdHJ1Y3QgZnRyYWNlX3JlZ3M7Cj4gPiAgdm9pZCBmdHJhY2VfZ3JhcGhf
ZnVuYyh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wLCBzdHJ1Y3QgZnRyYWNlX3Jl
Z3MgKmZyZWdzKTsKPiA+ICAjZGVmaW5lIGZ0cmFjZV9ncmFwaF9mdW5jIGZ0cmFjZV9ncmFwaF9m
dW5jCj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZnRyYWNlX3NldF9kaXJlY3Rf
Y2FsbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gPiArewo+
ID4gKyAgICAgICAgICAgICAgIHJlZ3MtPnQxID0gYWRkcjsKPiA+ICt9Cj4gPiArCj4gPiAgI2Vu
ZGlmIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiA+Cj4gPiAgI2VuZGlm
IC8qIF9fQVNTRU1CTFlfXyAqLwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21j
b3VudC1keW4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUwo+ID4gaW5kZXggNDY2
YzZlZjIxN2IxLi5mZWY3YzQ2MGY5OTEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9tY291bnQtZHluLlMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUwo+
ID4gQEAgLTIzMiw2ICsyMzIsNyBAQCBFTkRQUk9DKGZ0cmFjZV9jYWxsZXIpCj4gPgo+ID4gICNl
bHNlIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiA+ICBFTlRSWShmdHJh
Y2VfcmVnc19jYWxsZXIpCj4gPiArICAgICAgIG1vdmUgICAgdDEsIHplcm8KPiA+ICAgICAgICAg
U0FWRV9BQklfUkVHUyAxCj4gPiAgICAgICAgIFBSRVBBUkVfQVJHUwo+ID4KPiA+IEBAIC0yNDEs
NyArMjQyLDEwIEBAIGZ0cmFjZV9yZWdzX2NhbGw6Cj4gPgo+ID4KPiA+ICAgICAgICAgUkVTVE9S
RV9BQklfUkVHUyAxCj4gPiArICAgICAgIGJuZXogICAgdDEsLkxkaXJlY3QKPiA+ICAgICAgICAg
anIgdDAKPiA+ICsuTGRpcmVjdDoKPiA+ICsgICAgICAganIgdDEKPiA+ICBFTkRQUk9DKGZ0cmFj
ZV9yZWdzX2NhbGxlcikKPiA+Cj4gPiAgRU5UUlkoZnRyYWNlX2NhbGxlcikKPiA+IC0tCj4gPiAy
LjM2LjEKPiA+Cj4KPgo+IC0tCj4gVGhhbmtzLAo+IFNvbmcKCgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
