Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299F0C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKDR23fcTCdnvZYEOIZYdxncaBmMdB1dqdQrCKA8wN4=; b=FlddAJrx8UKo5z
	EpBIjZSWj6MGA+MQupYDu3o7tqRWsN9tCpghn7oFcRGjjgE87ye2f10ah7hZtLS0NylXZoKeV50LB
	wxW2twIs+PTnc9X8uRNoZnkf9XYau5NdBD+DYMzOYk4Jlo3eArwn1vRfkh8ctP3tTjFImFKAVQAID
	ro/FfaTZyAOM93rN2cXkgLA6E8CfAYBWOjmZskjA3dWajLrsejFPfObWqpI3FmXqV+pWlRSXdpxJL
	OJXIdO2xBFgE9Hb85ZkU9FB3RqORg9IwwM7yMfruPFW2VQqAP87nGdKblgXOytKl13jTNxYVRa1xr
	FZPiAwGqaXjyAI1JrP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlpe-0000000GIew-1hxC;
	Tue, 30 Jan 2024 10:59:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlpb-0000000GIeE-3fqN
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 10:59:09 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a35ba5744e0so232919466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706612346; x=1707217146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfeEjcw/cYNhw8CuObtnMfG4ZfpJlIGF2/HIY1QhhR8=;
        b=BbAnyEy8JiULmdDOsC7i0WNSX/SIt1RBC3+NjaSBG9RH3+NcleTOLohBtpPL9ueeq+
         kLsk4LF5Yi+hUlIKxA98cVr+3tq9mouzkSUZlWtVftodOc+rtC9RlbrRlFU8W7KfDTv5
         CGm30KmqsveQ+fNnw4/b3bTKcO2yYQ7DOswielsP0QnYSshZFQeL/GPU/OMYZu2ebgM1
         sc29wgNWAcYALbCr2apsVTH+MlGMX1QXvC4uV6R9mlUbtPzcdKqfLFfskWe9XXmFDqoV
         30jJWKVbaHKxiqwfcFBD5Q4wQo65NrXjUE/R5BvHoy7PSZfZLu+srRbYP9IpIUN4rdX2
         WYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706612346; x=1707217146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfeEjcw/cYNhw8CuObtnMfG4ZfpJlIGF2/HIY1QhhR8=;
        b=T4Z2OleXXzuc3oJPQmDyJ32lpg9fCdgT7gvcQG2FeekUIqZvxytcAIqdpROqI/c43c
         t75oNC1cOXVdkTDVU6dAs8EG9+pJtIL3llfCq9Y4FEKKuhzA1YIYvQ7OETmOw4gPX4MG
         V8m8SbqBe+sHlpTb/p2WetLjOTkK5xD+CMQcU7WzDH1AnkkCBFc5pIEDcHiIVyCOulD2
         qHzFxo9rhYvJNDDHrlqbch5tqDb/TWj7rLwSoqJ3zUvFEG6UP7dFrzrKGgD3PL7+K3Pv
         zH1duW+b8U09veAb4Yq8/z00n8o6Cz+JclEXMrlPIR24QX0ce6ZXsy/ozrp4QIREhH5G
         mtYw==
X-Gm-Message-State: AOJu0YxFeCjFFuZtqcuyTbSBjMjJHhMg/nMeEALsfv695JQmW4f9c36w
	g9PXqW3X9y1TOPyLVLpoUr55gDa4sWELrsJhsn67CQ0H3gfM8+I3Pg1ArF1qhINGio2aTxPyjYq
	LflzE0ZLqCG3qWpw4HB/JyJAGYF2I3AlhdzZHbA==
X-Google-Smtp-Source: AGHT+IGX74c23vS+z93CGFBL5RJbjriDtowHYVh+ehpTvgiIGFUXHfdE9Eh8Nyqr1VNAPL4krm4YnIbj9rzbQx++8KY=
X-Received: by 2002:a17:906:d8f:b0:a30:d9c5:e5c with SMTP id
 m15-20020a1709060d8f00b00a30d9c50e5cmr5668946eji.55.1706612345765; Tue, 30
 Jan 2024 02:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20240117140333.2479667-1-vincent.chen@sifive.com> <CA+V-a8uDyY7bT4t8XRRVuTiMceiLtWpHTwEM6M_o_FgJOd4P0A@mail.gmail.com>
In-Reply-To: <CA+V-a8uDyY7bT4t8XRRVuTiMceiLtWpHTwEM6M_o_FgJOd4P0A@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 30 Jan 2024 11:58:54 +0100
Message-ID: <CAHVXubgJ+j78fwDyy44tz38sfH=aN-eBZypQmXpAbgKsrtTn0A@mail.gmail.com>
Subject: Re: [v6 PATCH] riscv: mm: execute local TLB flush after populating vmemmap
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_025908_155677_8FD46C86 
X-CRM114-Status: GOOD (  30.20  )
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

SGkgUHJhYmhha2FyLAoKT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTA6NTnigK9BTSBMYWQsIFBy
YWJoYWthcgo8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgVmluY2Vu
dCwKPgo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+Cj4gT24gV2VkLCBKYW4gMTcsIDIwMjQg
YXQgMjowN+KAr1BNIFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+IHdyb3Rl
Ogo+ID4KPiA+IFRoZSBzcGFyZV9pbml0KCkgY2FsbHMgbWVtbWFwX3BvcHVsYXRlKCkgbWFueSB0
aW1lcyB0byBjcmVhdGUgVkEgdG8gUEEKPiA+IG1hcHBpbmcgZm9yIHRoZSBWTUVNTUFQIGFyZWEs
IHdoZXJlIGFsbCAic3RydWN0IHBhZ2UiIGFyZSBsb2NhdGVkIG9uY2UKPiA+IENPTkZJR19TUEFS
U0VNRU1fVk1FTU1BUCBpcyBkZWZpbmVkLiBUaGVzZSAic3RydWN0IHBhZ2UiIGFyZSBsYXRlcgo+
ID4gaW5pdGlhbGl6ZWQgaW4gdGhlIHpvbmVfc2l6ZXNfaW5pdCgpIGZ1bmN0aW9uLiBIb3dldmVy
LCBkdXJpbmcgdGhpcwo+ID4gcHJvY2Vzcywgbm8gc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiBpcyBl
eGVjdXRlZCBmb3IgdGhpcyBWTUVNTUFQIGFyZWEuCj4gPiBUaGlzIG9taXNzaW9uIG1heSBjYXVz
ZSB0aGUgaGFydCB0byBmYWlsIHRvIHBlcmZvcm0gcGFnZSB0YWJsZSB3YWxrCj4gPiBiZWNhdXNl
IHNvbWUgZGF0YSByZWxhdGVkIHRvIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIGlzIGludmlzaWJs
ZSB0byB0aGUKPiA+IGhhcnQuIFRvIHNvbHZlIHRoaXMgaXNzdWUsIHRoZSBsb2NhbF9mbHVzaF90
bGJfa2VybmVsX3JhbmdlKCkgaXMgY2FsbGVkCj4gPiByaWdodCBhZnRlciB0aGUgc3BhcnNlX2lu
aXQoKSB0byBleGVjdXRlIGEgc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiBmb3IgdGhpcwo+ID4gVk1F
TU1BUCBhcmVhLCBlbnN1cmluZyB0aGF0IGFsbCBkYXRhIHJlbGF0ZWQgdG8gdGhlIGFkZHJlc3Mg
dHJhbnNsYXRpb24KPiA+IGlzIHZpc2libGUgdG8gdGhlIGhhcnQuCj4gPgo+ID4gRml4ZXM6IGQ5
NWYxYTU0MmMzZCAoIlJJU0MtVjogSW1wbGVtZW50IHNwYXJzZW1lbSIpCj4gPiBTaWduZWQtb2Zm
LWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgKysKPiA+ICBhcmNoL3Jpc2N2
L21tL2luaXQuYyAgICAgICAgICAgICAgfCA1ICsrKysrCj4gPiAgYXJjaC9yaXNjdi9tbS90bGJm
bHVzaC5jICAgICAgICAgIHwgNiArKysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKykKPiA+Cj4gSSBnZXQgYmVsb3cgYnVpbGQgaXNzdWUgd2l0aCB0aGlzIHBhdGNoIGFw
cGxpZWQ6Cj4KPiBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmM6MjA3OjY6IGVycm9yOiByZWRlZmlu
aXRpb24gb2YKPiAnbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZScKPiAgIDIwNyB8IHZvaWQg
bG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LAo+IHVuc2ln
bmVkIGxvbmcgZW5kKQo+ICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jOjY5OjY6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRp
b24gb2YKPiAnbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZScgd2l0aCB0eXBlICd2b2lkKGxv
bmcgdW5zaWduZWQgaW50LAo+IGxvbmcgdW5zaWduZWQgaW50KScKPiAgICA2OSB8IHZvaWQgbG9j
YWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LAo+IHVuc2lnbmVk
IGxvbmcgZW5kKQo+ICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4g
bWFrZVs0XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0MzogYXJjaC9yaXNjdi9tbS90
bGJmbHVzaC5vXSBFcnJvciAxCj4gbWFrZVs0XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQg
am9icy4uLi4KPiAgIENDICAgICAga2VybmVsL3Jlc291cmNlLm8KPiBtYWtlWzNdOiAqKiogW3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDgxOiBhcmNoL3Jpc2N2L21tXSBFcnJvciAyCj4gbWFrZVsz
XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPgo+IEkgaGF2ZSBhdHRhY2hl
ZCB0aGUgZGVmY29uZmlnIGZpbGUuCj4KCkluZGVlZCwgd2UgcmVjZW50bHkgYWRkZWQgdGhlIHNh
bWUgZnVuY3Rpb24sIHlvdSBjYW4gZmluZCBhIHJlYmFzZWQKdmVyc2lvbiBvZiB0aGlzIHBhdGNo
IG9uIHRvcCBvZiA2LjggaGVyZToKaHR0cHM6Ly9naXRodWIuY29tL0FsZXhHaGl0aS9saW51eC1y
aXNjdi9jb21taXQvNzU2ZDE4NzFmNThlZGFjNDU1NzczZGIwYmI5OTZmOGQwNjRhNmIwNgoKPiBD
aGVlcnMsCj4gUHJhYmhha2FyCj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+IGlu
ZGV4IDhmMzQxOGM1ZjE3Mi4uNTI1MjY3Mzc5Y2NiIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RsYmZsdXNoLmgKPiA+IEBAIC00Niw2ICs0Niw3IEBAIHZvaWQgZmx1c2hfdGxiX2tlcm5lbF9y
YW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7Cj4gPiAgdm9pZCBm
bHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBs
b25nIHN0YXJ0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQp
Owo+ID4gICNlbmRpZgo+ID4gK3ZvaWQgbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNp
Z25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7Cj4gPiAgI2Vsc2UgLyogQ09ORklH
X1NNUCAmJiBDT05GSUdfTU1VICovCj4gPgo+ID4gICNkZWZpbmUgZmx1c2hfdGxiX2FsbCgpIGxv
Y2FsX2ZsdXNoX3RsYl9hbGwoKQo+ID4gQEAgLTY2LDYgKzY3LDcgQEAgc3RhdGljIGlubGluZSB2
b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiA+Cj4gPiAg
I2RlZmluZSBmbHVzaF90bGJfbW0obW0pIGZsdXNoX3RsYl9hbGwoKQo+ID4gICNkZWZpbmUgZmx1
c2hfdGxiX21tX3JhbmdlKG1tLCBzdGFydCwgZW5kLCBwYWdlX3NpemUpIGZsdXNoX3RsYl9hbGwo
KQo+ID4gKyNkZWZpbmUgbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZShzdGFydCwgZW5kKSBm
bHVzaF90bGJfYWxsKCkKPiA+ICAjZW5kaWYgLyogIUNPTkZJR19TTVAgfHwgIUNPTkZJR19NTVUg
Ki8KPiA+Cj4gPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfVExCRkxVU0hfSCAqLwo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+IGlu
ZGV4IDJlMDExY2JkZGYzYS4uY2M1NmEwOTQ1MTIwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBAQCAtMTM3Nyw2
ICsxMzc3LDEwIEBAIHZvaWQgX19pbml0IG1pc2NfbWVtX2luaXQodm9pZCkKPiA+ICAgICAgICAg
ZWFybHlfbWVtdGVzdChtaW5fbG93X3BmbiA8PCBQQUdFX1NISUZULCBtYXhfbG93X3BmbiA8PCBQ
QUdFX1NISUZUKTsKPiA+ICAgICAgICAgYXJjaF9udW1hX2luaXQoKTsKPiA+ICAgICAgICAgc3Bh
cnNlX2luaXQoKTsKPiA+ICsjaWZkZWYgQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQCj4gPiArICAg
ICAgIC8qIFRoZSBlbnRpcmUgVk1FTU1BUCByZWdpb24gaGFzIGJlZW4gcG9wdWxhdGVkLiBGbHVz
aCBUTEIgZm9yIHRoaXMgcmVnaW9uICovCj4gPiArICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9rZXJu
ZWxfcmFuZ2UoVk1FTU1BUF9TVEFSVCwgVk1FTU1BUF9FTkQpOwo+ID4gKyNlbmRpZgo+ID4gICAg
ICAgICB6b25lX3NpemVzX2luaXQoKTsKPiA+ICAgICAgICAgYXJjaF9yZXNlcnZlX2NyYXNoa2Vy
bmVsKCk7Cj4gPiAgICAgICAgIG1lbWJsb2NrX2R1bXBfYWxsKCk7Cj4gPiBAQCAtMTM4Niw2ICsx
MzkwLDcgQEAgdm9pZCBfX2luaXQgbWlzY19tZW1faW5pdCh2b2lkKQo+ID4gIGludCBfX21lbWlu
aXQgdm1lbW1hcF9wb3B1bGF0ZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVu
ZCwgaW50IG5vZGUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZt
ZW1fYWx0bWFwICphbHRtYXApCj4gPiAgewo+ID4gKyAgICAgICAvKiBEZWZlciB0aGUgcmVxdWly
ZWQgVExCIGZsdXNoIHVudGlsIHRoZSBlbnRpcmUgVk1FTU1BUCByZWdpb24gaGFzIGJlZW4gcG9w
dWxhdGVkICovCj4gPiAgICAgICAgIHJldHVybiB2bWVtbWFwX3BvcHVsYXRlX2Jhc2VwYWdlcyhz
dGFydCwgZW5kLCBub2RlLCBOVUxMKTsKPiA+ICB9Cj4gPiAgI2VuZGlmCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4g
PiBpbmRleCBlNjY1OWQ3MzY4YjMuLmQxMWE0YWU4N2VjMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4g
PiBAQCAtMTkzLDYgKzE5MywxMiBAQCB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiAgICAgICAgIF9fZmx1c2hfdGxi
X3JhbmdlKE5VTEwsIHN0YXJ0LCBlbmQgLSBzdGFydCwgUEFHRV9TSVpFKTsKPiA+ICB9Cj4gPgo+
ID4gKy8qIEZsdXNoIGEgcmFuZ2Ugb2Yga2VybmVsIHBhZ2VzIHdpdGhvdXQgYnJvYWRjYXN0aW5n
ICovCj4gPiArdm9pZCBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ID4gK3sKPiA+ICsgICAgICAgbG9jYWxfZmx1c2hf
dGxiX3JhbmdlX2FzaWQoc3RhcnQsIGVuZCAtIHN0YXJ0LCBQQUdFX1NJWkUsIEZMVVNIX1RMQl9O
T19BU0lEKTsKPiA+ICt9Cj4gPiArCj4gPiAgI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRQo+ID4gIHZvaWQgZmx1c2hfcG1kX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgZW5kKQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiA+Cj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
