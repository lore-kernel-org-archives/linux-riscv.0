Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15FDEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdQTsOnF2bs8qz6qNU9KvsAe1Vi6jJqrBTOj0vmLrCI=; b=xdFE6XRxoEJykj
	6dLqTf/veOhm/KmEEypBJ1xnX613ejHO2lAQihLP0NcseLgQapQthnqUtsWFJgeRItWTwMcovKDHy
	RNTyUi8RGvF1/ZlCeqhj6pUfxrHbB4P7na4ujL5PCmur+hOwqYr8cl0Ln9pJErPzb+5gaoXYeeDRk
	ewwpYGaTC2gj4O4I7QPLwFmWMkxb9xwzvsaj5LtYuirEWv8JtcPFWTyBcbUKJEbIrAwG+ir+6WkJQ
	dEiOWsntytEwGkFZxOhSApHOXc16g7ixO5Gzf+4KW9k0ZX/Am0oyCSaSPeI7meqBwi2QYhQQDBqCA
	kESqxEmSQ9RXjfKvTJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCDM-003aIq-16;
	Fri, 30 Jun 2023 11:23:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCDI-003aI9-27
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 11:22:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97AEA61728
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21F0C433AB
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688124174;
	bh=HIgffZnOosSIcjOP1dB+R/SNrBLEPOgvVYTtQ+OoMbc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iC9Y0Eb2Z2MrXa6Y0C3L0itdnUhM4boFSN3EVF2hfwwESwXo2f0xnysTU4DH55i8q
	 LPRCqB1weLDnb1l/6wVnR26XX6yvfBBjDiwiCnWAD+1Q8tj7lgbNPv9QNYG3oXhCYi
	 jhoRAa0IscmrtkjZetLnY0SUfy6bT1P9ix6uoengTcF8SfJxq6sRNwBBw6YKmaHmat
	 Hk+finD67UsNPxNmVWFr5EqEGCImxrkyJfW4S0fSJo6AEaxNGlsb1/ODu+nXFEyQHL
	 DDaDryi0GmannFjCqZzQhFhLnJK/4U5QqwMzl9zCmtDH7+5Z/gF0qyEkmHLaUvG2DI
	 YLz91LavDYzNw==
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso21799745e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 04:22:53 -0700 (PDT)
X-Gm-Message-State: ABy/qLYMSGwECObvlGI8kye8T4Voj4PGpaMB26hrwS2p0cwl9yVbfNmr
	t5/I58xbQyCMB2HDgAWZ0sN4wDFiPZmJDIBBtGg=
X-Google-Smtp-Source: APBJJlEl3R3agomzm6d8TGvRI5Iv/j9uIUWV2C5RvtxdK+YCyx2E8/q4piZNcSGztOcV2x6OLVr/LPL52UVCqEccBUc=
X-Received: by 2002:a7b:c3c1:0:b0:3fb:c77e:80f6 with SMTP id
 t1-20020a7bc3c1000000b003fbc77e80f6mr1426408wmj.36.1688124172132; Fri, 30 Jun
 2023 04:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230222033021.983168-1-guoren@kernel.org> <20230222033021.983168-5-guoren@kernel.org>
 <ZJ2PBosSQtSX28Mf@wychelm> <CAJF2gTRPYDxDpia=o6oqbt_8_5hqAQk-pwY1uPwUjcxCFg1EPw@mail.gmail.com>
In-Reply-To: <CAJF2gTRPYDxDpia=o6oqbt_8_5hqAQk-pwY1uPwUjcxCFg1EPw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 30 Jun 2023 07:22:40 -0400
X-Gmail-Original-Message-ID: <CAJF2gTTRViivgy3njDc1k7A-jaSFUsyo2VPg2JwEAwx=H3mR4w@mail.gmail.com>
Message-ID: <CAJF2gTTRViivgy3njDc1k7A-jaSFUsyo2VPg2JwEAwx=H3mR4w@mail.gmail.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, ben@decadent.org.uk, bjorn@kernel.org, 
	palmer@dabbelt.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yipeng Zou <zouyipeng@huawei.com>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_042256_771570_D7D6F44E 
X-CRM114-Status: GOOD (  29.75  )
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

T24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgNzoxNuKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDI5LCAyMDIzIGF0IDEwOjAy4oCvQU0gRGFuaWVs
IFRob21wc29uCj4gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBUdWUsIEZlYiAyMSwgMjAyMyBhdCAxMDozMDoxOFBNIC0wNTAwLCBndW9yZW5Aa2VybmVsLm9y
ZyB3cm90ZToKPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGNvbnZlcnRzIHJpc2N2IHRvIHVzZSB0aGUgZ2VuZXJpYyBl
bnRyeSBpbmZyYXN0cnVjdHVyZSBmcm9tCj4gPiA+IGtlcm5lbC9lbnRyeS8qLiBUaGUgZ2VuZXJp
YyBlbnRyeSBtYWtlcyBtYWludGFpbmVycycgd29yayBlYXNpZXIgYW5kCj4gPiA+IGNvZGVzIG1v
cmUgZWxlZ2FudC4gSGVyZSBhcmUgdGhlIGNoYW5nZXM6Cj4gPiA+Cj4gPiA+ICAtIE1vcmUgY2xl
YXIgZW50cnkuUyB3aXRoIGhhbmRsZV9leGNlcHRpb24gYW5kIHJldF9mcm9tX2V4Y2VwdGlvbgo+
ID4gPiAgLSBHZXQgcmlkIG9mIGNvbXBsZXggY3VzdG9tIHNpZ25hbCBpbXBsZW1lbnRhdGlvbgo+
ID4gPiAgLSBNb3ZlIHN5c2NhbGwgcHJvY2VkdXJlIGZyb20gYXNzZW1ibHkgdG8gQywgd2hpY2gg
aXMgbXVjaCBtb3JlCj4gPiA+ICAgIHJlYWRhYmxlLgo+ID4gPiAgLSBDb25uZWN0IHJldF9mcm9t
X2ZvcmsgJiByZXRfZnJvbV9rZXJuZWxfdGhyZWFkIHRvIGdlbmVyaWMgZW50cnkuCj4gPiA+ICAt
IFdyYXAgd2l0aCBpcnFlbnRyeV9lbnRlci9leGl0IGFuZCBzeXNjYWxsX2VudGVyL2V4aXRfZnJv
bV91c2VyX21vZGUKPiA+ID4gIC0gVXNlIHRoZSBzdGFuZGFyZCBwcmVlbXB0aW9uIGNvZGUgaW5z
dGVhZCBvZiBjdXN0b20KPiA+ID4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBIdWFjYWkgQ2hlbiA8Y2hl
bmh1YWNhaUBrZXJuZWwub3JnPgo+ID4gPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+ID4gPiBUZXN0ZWQtYnk6IFlpcGVuZyBab3UgPHpvdXlpcGVuZ0Bo
dWF3ZWkuY29tPgo+ID4gPiBUZXN0ZWQtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVs
Lm9yZz4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+
ID4gQ2M6IEJlbiBIdXRjaGluZ3MgPGJlbkBkZWNhZGVudC5vcmcudWs+Cj4gPgo+ID4gQXBvbG9n
aWVzIGZvciB0aGUgbGF0ZSBmZWVkYmFjayBidXQgSSd2ZSBiZWVuIHN3YW1wZWQgbGF0ZWx5IGFu
ZCBvbmx5Cj4gPiByZWNlbnRseSBnb3Qgcm91bmQgdG8gcnVubmluZyB0aGUgZnVsbCBrZ2RiIHRl
c3Qgc3VpdGUgb24gdGhlIHY2LjQKPiA+IHNlcmllcy4KPiA+Cj4gPiBUaGUga2dkYiB0ZXN0IHN1
aXRlIGluY2x1ZGVzIGEgY291cGxlIG9mIHRlc3RzIHRoYXQgdmVyaWZ5IHRoYXQgdGhlCj4gPiBz
eXN0ZW0gcmVzdW1lcyBhZnRlciBicmVha3BvaW50aW5nIGR1ZSB0byBhIEJVRygpOgo+ID4gaHR0
cHM6Ly9naXRodWIuY29tL2RhbmllbC10aG9tcHNvbi9rZ2RidGVzdC9ibG9iL21hc3Rlci90ZXN0
cy90ZXN0X2tkYl9mYXVsdF9pbmplY3Rpb24ucHkjTDI0LUw0NQo+ID4KPiA+IFRoZXNlIHRlc3Rz
IGhhdmUgcmVncmVzc2VkIG9uIHJpc2N2IGJldHdlZW4gdjYuMyBhbmQgdjYuNCBhbmQgYSBiaXNl
Y3QKPiA+IGlzIHBvaW50aW5nIGF0IHRoaXMgcGF0Y2guIFdpdGggdGhlc2UgY2hhbmdlcyBpbiBw
bGFjZSB0aGVuLCBhZnRlciBrZGIKPiA+IHJlc3VtZXMgdGhlIHN5c3RlbSwgdGhlIEJVRygpIG1l
c3NhZ2UgaXMgcHJpbnRlZCBhcyBub3JtYWwgYnV0IHRoZW4KPiA+IGltbWVkaWF0ZWx5IGZhaWxz
LiBGcm9tIHRoZSBiYWNrdHJhY2UgaXQgbG9va3MgbGlrZSB0aGUgbmV3IGVudHJ5L2V4aXQKPiA+
IGNvZGUgY2Fubm90IGFkdmFuY2UgcGFzdCBhIGNvbXBpbGVkIGJyZWFrcG9pbnQgaW5zdHJ1Y3Rp
b246Cj4gPiB+fn4KPiA+IFBBTklDOiBGYXRhbCBleGNlcHRpb24gaW4gaW50ZXJydXB0Cj4gSXQg
Y29tZXMgZnJvbToKPiB2b2lkIGRpZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgLi4uCj4gewo+IC4u
Lgo+IGlmIChpbl9pbnRlcnJ1cHQoKSkKPiAgICAgICAgIHBhbmljKCJGYXRhbCBleGNlcHRpb24g
aW4gaW50ZXJydXB0Iik7Cj4gLi4uCj4KPiBXZSBjb3VsZCBhZGQgYSBkdW1wX2JhY2t0cmFjZSB0
byBzZWUgd2hhdCBoYXBwZW5lZDoKPiBpZiAoaW5faW50ZXJydXB0KCkpIHsKPiArICAgICAgZHVt
cF9iYWNrdHJhY2UocmVncywgTlVMTCwgS0VSTl9ERUZBVUxUKTsKU29ycnksIGl0IHNob3VsZCBi
ZToKKyAgICAgICAgZHVtcF9iYWNrdHJhY2UoTlVMTCwgTlVMTCwgS0VSTl9ERUZBVUxUKTsKV2Ug
bmVlZCBjdXJyZW50IHN0YWNrIGluZm8sIG5vdCBleGNlcHRpb24gY29udGV4dC4KCgo+ICAgICAg
ICAgcGFuaWMoIkZhdGFsIGV4Y2VwdGlvbiBpbiBpbnRlcnJ1cHQiKTsKPiB9Cj4KPgo+Cj4gPgo+
ID4gRW50ZXJpbmcga2RiIChjdXJyZW50PTB4ZmY2MDAwMDAwMWEyYTI4MCwgcGlkIDEwNCkgb24g
cHJvY2Vzc29yIDEgZHVlIHRvCj4gPiBOb25NYXNrCj4gPiBhYmxlIEludGVycnVwdCBAIDB4ZmZm
ZmZmZmY4MDBiYjNjNAo+ID4gWzFda2RiPiBidAo+ID4gU3RhY2sgdHJhY2ViYWNrIGZvciBwaWQg
MTA0Cj4gPiAweGZmNjAwMDAwMDFhMmEyODAgICAgICAxMDQgICAgICAgOTIgIDEgICAgMSAgIFIg
IDB4ZmY2MDAwMDAwMWEyYWM1MAo+ID4gKmVjaG8KPiA+IENQVTogMSBQSUQ6IDEwNCBDb21tOiBl
Y2hvIFRhaW50ZWQ6IEcgICAgICBECj4gPiA2LjMuMC1yYzEtMDAwMDMtZ2YwYmRkZjUwNTg2ZCAj
MTE5Cj4gPiBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4gPiBDYWxsIFRy
YWNlOgo+ID4gWzxmZmZmZmZmZjgwMDA1MGRjPl0gZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0Cj4g
PiBbPGZmZmZmZmZmODA4NDU4Zjg+XSBzaG93X3N0YWNrKzB4MmMvMHgzOAo+ID4gWzxmZmZmZmZm
ZjgwODUxYjAwPl0gZHVtcF9zdGFja19sdmwrMHgzYy8weDU0Cj4gPiBbPGZmZmZmZmZmODA4NTFi
MmM+XSBkdW1wX3N0YWNrKzB4MTQvMHgxYwo+ID4gWzxmZmZmZmZmZjgwMGJjNGI4Pl0ga2RiX2R1
bXBfc3RhY2tfb25fY3B1KzB4NjQvMHg2Ngo+ID4gWzxmZmZmZmZmZjgwMGMzZDJhPl0ga2RiX3No
b3dfc3RhY2srMHg4Mi8weDg4Cj4gPiBbPGZmZmZmZmZmODAwYzNkYzA+XSBrZGJfYnQxKzB4OTAv
MHhmMgo+ID4gWzxmZmZmZmZmZjgwMGM0MjA2Pl0ga2RiX2J0KzB4MzRjLzB4Mzg0Cj4gPiBbPGZm
ZmZmZmZmODAwYzFkMjg+XSBrZGJfcGFyc2UrMHgyN2EvMHg2MTgKPiA+IFs8ZmZmZmZmZmY4MDBj
MjU2Nj5dIGtkYl9tYWluX2xvb3ArMHgzYjIvMHg4ZmEKPiA+IFs8ZmZmZmZmZmY4MDBjNGM1YT5d
IGtkYl9zdHViKzB4MWJhLzB4M2E4Cj4gPiBbPGZmZmZmZmZmODAwYmJiYTg+XSBrZ2RiX2NwdV9l
bnRlcisweDM0Mi8weDViYQo+ID4gWzxmZmZmZmZmZjgwMGJjM2RhPl0ga2dkYl9oYW5kbGVfZXhj
ZXB0aW9uKzB4ZTAvMHgxMWEKPiA+IFs8ZmZmZmZmZmY4MDAwODEwYz5dIGtnZGJfcmlzY3Zfbm90
aWZ5KzB4ODYvMHhiNAo+ID4gWzxmZmZmZmZmZjgwMDJmMjEwPl0gbm90aWZ5X2RpZSsweDZhLzB4
YTYKPiA+IFs8ZmZmZmZmZmY4MDAwNGRiMD5dIGhhbmRsZV9icmVhaysweDcwLzB4ZTAKPiA+IFs8
ZmZmZmZmZmY4MDg1MjQ2Mj5dIGRvX3RyYXBfYnJlYWsrMHg0OC8weDVjCj4gPiBbPGZmZmZmZmZm
ODAwMDM1OTg+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4NjQKPiA+IFs8ZmZmZmZmZmY4MDBi
YjNjND5dIGtnZGJfY29tcGlsZWRfYnJlYWsrMHgwLzB4MTQKPiA+IH5+fgo+ID4KPiA+Cj4gPiBE
YW5pZWwuCj4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgoKCgotLQpCZXN0IFJl
Z2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
