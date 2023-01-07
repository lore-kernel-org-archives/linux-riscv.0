Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EBCC54EBC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHfEVKx4sGP6vGiEvla3NOvMV9Cwuszwta8X0rk73Vk=; b=Fe0umnUvRRHYv1
	FYLh2+uJhEUEJGWGGwIh3VrZAg1ZUZQM9VqRbugkEEH4EDVB6KVEN4VujADEyvFbf/z4XwFcCe4Fs
	2gJYnimKMbRj9cPwPSMjRx2QkCacnOr3qhUmBJD4MD8nsUNV+/DbxfyS1FrbtnzH0H8uTu/AwP0t5
	8kmhn7lgRI+2ynkbCZJH0cbEAh8WB83IGyaQd/r//e4Y1/ZZKL1P8t22w5w/jPDHrrdKJYhP0Wl2n
	RW/bGweo3i8aygRSjJQOVTpBG7K6v2chg3GWhmUdcbJ8MMo1mXKSxEoU4l2RoKU9RpyAcUT0TNzzC
	A1XDLss1ZK67UdX+ZDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7gd-004ZjK-Tw; Sat, 07 Jan 2023 11:48:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7ga-004ZhC-C9
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 11:48:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EF184B81F88
	for <linux-riscv@lists.infradead.org>; Sat,  7 Jan 2023 11:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA69C433B0
	for <linux-riscv@lists.infradead.org>; Sat,  7 Jan 2023 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673092104;
	bh=VTHYtUz3OxxwIjeHECLj9I/wTerQL3qNkUG2k0mTR8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qOa/1i97apW+ROtARA4M8NUqOhckmJ+TqWQR1dT5DD8dAHXLz6uQvpTmzw6TiCHHg
	 NLf85Z3Lm8CJS4H/h3bWaTAk9g5u4aV3T5jRMSTjEzE+UAwwXYKszzLT26l5Mb3S28
	 80xJo8x02/Xo8t54fpqZvmQjL1JtX+Ep1jzOPXHE9oRuS0+zogjpdlD2XXXGn6cyoU
	 hID9AqNFaM+zmc/Boo/9kcuXC/ghNlFa4jAIG7OTCmUk0pIaA8VJZhuy9hOl9oW0kI
	 9XvIhwI/vyCbEZCFWyZD7XxAuzYHZCku7MOWzUqzsWKTQTFLAxQ9geCb1MUFhJG3rC
	 zRfsuWAy/lI7Q==
Received: by mail-ej1-f53.google.com with SMTP id cf18so2684052ejb.5
        for <linux-riscv@lists.infradead.org>; Sat, 07 Jan 2023 03:48:24 -0800 (PST)
X-Gm-Message-State: AFqh2krRh0mqoyNiQORTj7RjLgoZONgwtsqGGla5fni4n9DZg9B8MIC/
	8Ix1gljKXHyaX73PwS2OHydlxZGOxzK263Vu6/0=
X-Google-Smtp-Source: AMrXdXsq/i9/Nu38s6tEkyJaWEjtXp+PKs2w/3v6SEZyzEE384j2KgTR88394juTV7MRj4ar2cUwXc9J0hCdBqvthqI=
X-Received: by 2002:a17:907:8024:b0:84d:df2:81f5 with SMTP id
 ft36-20020a170907802400b0084d0df281f5mr633884ejc.406.1673092102402; Sat, 07
 Jan 2023 03:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20230103033531.2011112-1-guoren@kernel.org> <20230103033531.2011112-4-guoren@kernel.org>
 <36314eb6-e41d-30b9-9ac4-12b88a108b7b@ghiti.fr> <CAJF2gTTSretKkJGNV7Y6iJboPuAWUQ=to=RPA8_-Nz8dnufGAg@mail.gmail.com>
 <Y7VrEMJtwC7v7oNy@FVFF77S0Q05N>
In-Reply-To: <Y7VrEMJtwC7v7oNy@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 7 Jan 2023 19:48:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSwE81vtSaCxrVnRk9NsYtT1ukptudLAdLs28MLDgTXrg@mail.gmail.com>
Message-ID: <CAJF2gTSwE81vtSaCxrVnRk9NsYtT1ukptudLAdLs28MLDgTXrg@mail.gmail.com>
Subject: Re: [PATCH -next V12 3/7] riscv: entry: Add noinstr to prevent
 instrumentation inserted
To: Mark Rutland <mark.rutland@arm.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	ben@decadent.org.uk, bjorn@kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_034828_741844_D2CC2A06 
X-CRM114-Status: GOOD (  38.57  )
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

T24gV2VkLCBKYW4gNCwgMjAyMyBhdCA4OjAzIFBNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMDQsIDIwMjMgYXQgMDk6NDA6MzhBTSAr
MDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDMsIDIwMjMgYXQgNToxMiBQTSBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBHdW8s
Cj4gPiA+Cj4gPiA+IE9uIDEvMy8yMyAwNDozNSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4g
PiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+Cj4g
PiA+ID4gV2l0aG91dCBub2luc3RyIHRoZSBjb21waWxlciBpcyBmcmVlIHRvIGluc2VydCBpbnN0
cnVtZW50YXRpb24gKHRoaW5rCj4gPiA+ID4gYWxsIHRoZSBrKlNBTiwgS0NvdiwgR0NvdiwgZnRy
YWNlIGV0Yy4uKSB3aGljaCBjYW4gY2FsbCBjb2RlIHdlJ3JlIG5vdAo+ID4gPiA+IHlldCByZWFk
eSB0byBydW4gdGhpcyBlYXJseSBpbiB0aGUgZW50cnkgcGF0aCwgZm9yIGluc3RhbmNlIGl0IGNv
dWxkCj4gPiA+ID4gcmVseSBvbiBSQ1Ugd2hpY2ggaXNuJ3Qgb24geWV0LCBvciBleHBlY3QgbG9j
a2RlcCBzdGF0ZS4gKGJ5IHBldGVyeikKPiA+ID4gPgo+ID4gPiA+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L1l4Y1E2Tm9QZjNBSDBFWGVAaGlyZXoucHJvZ3JhbW1p
bmcua2lja3MtYXNzLm5ldC8KPiA+ID4gPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+ID4gPiA+IFN1Z2dlc3RlZC1ieTogUGV0ZXIgWmlqbHN0cmEgPHBl
dGVyekBpbmZyYWRlYWQub3JnPgo+ID4gPiA+IFRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6
aGFuZ0BrZXJuZWwub3JnPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBs
aW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMgfCA0ICsrLS0KPiA+ID4gPiAgIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyAgICAgfCAyICstCj4g
PiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gPiA+IGluZGV4IDU0OWJkZTVjOTcwYS4uOTZl
Yzc2YzU0ZmYyIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
PiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiA+ID4gQEAgLTk1LDkg
Kzk1LDkgQEAgc3RhdGljIHZvaWQgZG9fdHJhcF9lcnJvcihzdHJ1Y3QgcHRfcmVncyAqcmVncywg
aW50IHNpZ25vLCBpbnQgY29kZSwKPiA+ID4gPiAgIH0KPiA+ID4gPgo+ID4gPiA+ICAgI2lmIGRl
ZmluZWQoQ09ORklHX1hJUF9LRVJORUwpICYmIGRlZmluZWQoQ09ORklHX1JJU0NWX0FMVEVSTkFU
SVZFKQo+ID4gPiA+IC0jZGVmaW5lIF9fdHJhcF9zZWN0aW9uICAgICAgICAgICAgICAgX19zZWN0
aW9uKCIueGlwLnRyYXBzIikKPiA+ID4gPiArI2RlZmluZSBfX3RyYXBfc2VjdGlvbiBfX25vaW5z
dHJfc2VjdGlvbigiLnhpcC50cmFwcyIpCj4gPiA+ID4gICAjZWxzZQo+ID4gPiA+IC0jZGVmaW5l
IF9fdHJhcF9zZWN0aW9uCj4gPiA+ID4gKyNkZWZpbmUgX190cmFwX3NlY3Rpb24gbm9pbnN0cgo+
ID4gPiA+ICAgI2VuZGlmCj4gPiA+ID4gICAjZGVmaW5lIERPX0VSUk9SX0lORk8obmFtZSwgc2ln
bm8sIGNvZGUsIHN0cikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICAg
YXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBuYW1lKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKSBcCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBi
L2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gPiA+IGluZGV4IGQ4NmY3Y2ViZDRhNy4uYjI2ZjY4
ZWFjNjFjIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gPiA+
ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gPiA+IEBAIC0yMDQsNyArMjA0LDcgQEAg
c3RhdGljIGlubGluZSBib29sIGFjY2Vzc19lcnJvcih1bnNpZ25lZCBsb25nIGNhdXNlLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+ID4gPiAgICAqIFRoaXMgcm91dGluZSBoYW5kbGVz
IHBhZ2UgZmF1bHRzLiAgSXQgZGV0ZXJtaW5lcyB0aGUgYWRkcmVzcyBhbmQgdGhlCj4gPiA+ID4g
ICAgKiBwcm9ibGVtLCBhbmQgdGhlbiBwYXNzZXMgaXQgb2ZmIHRvIG9uZSBvZiB0aGUgYXBwcm9w
cmlhdGUgcm91dGluZXMuCj4gPiA+ID4gICAgKi8KPiA+ID4gPiAtYXNtbGlua2FnZSB2b2lkIGRv
X3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ID4gK2FzbWxpbmthZ2Ugdm9p
ZCBub2luc3RyIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+Cj4gPiA+
Cj4gPiA+IChJIGR1ZyB0aGUgYXJjaGl2ZSBidXQgY2FuJ3QgZmluZCB0aGUgc2VyaWVzIGJlZm9y
ZSB2NCwgc28gc29ycnkgaWYgaXQKPiA+ID4gd2FzIGFscmVhZHkgYW5zd2VyZWQpCj4gPiA+Cj4g
PiA+IEkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBkaXNhYmxlIHRoZSBpbnN0cnVtZW50YXRpb24gb2Yg
dGhvc2UgdHJhcCBoYW5kbGVycwo+ID4gPiBhcyBhdCBsZWFzdCBwcm9maWxpbmcgdGhlbSB3aXRo
IGZ0cmFjZSB3b3VsZCBwcm92aWRlIHZhbHVhYmxlCj4gPiA+IGluZm9ybWF0aW9uIChhbmQgZ2Nv
diB3b3VsZCBiZSBuaWNlIHRvbyk6IHdoeSBkbyB3ZSBuZWVkIHRvIGRvIHRoYXQ/IEEKPiA+ID4g
dHJhcCB2ZXJ5IGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MgaXMgbm90IHJlY292ZXJhYmxlIGFu
eXdheS4KPiA+IEV2ZXJ5dGhpbmcgdGhhdCBjYWxscyBpcnFlbnRyeV9lbnRlcigpIHNob3VsZCBi
ZSBub2luc3RyLCBhbmQgdGhpcwo+ID4gcGF0Y2ggcHJlcGFyZXMgZm9yIHRoZSBuZXh0IGdlbmVy
aWNfZW50cnkgY29udmVydC4KPiA+Cj4gPiBlZzoKPiA+IGFzbWxpbmthZ2Ugdm9pZCBub2luc3Ry
IGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiB7Cj4gPiAgICAgICAgIGly
cWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRlcihyZWdzKTsKPiA+Cj4gPiAgICAg
ICAgIF9fZG9fcGFnZV9mYXVsdChyZWdzKTsKPiA+Cj4gPiAgICAgICAgIGxvY2FsX2lycV9kaXNh
YmxlKCk7Cj4gPgo+ID4gICAgICAgICBpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsKPiA+IH0K
PiA+IE5PS1BST0JFX1NZTUJPTChkb19wYWdlX2ZhdWx0KTsKPiA+Cj4gPiBZb3Ugc3RpbGwgY291
bGQgcHJvZmlsZSBfX2RvX3BhZ2VfZmF1bHQuCj4gPgo+ID4gPgo+ID4gPiBBbmQgSSB0b29rIGEg
bG9vayBhdCBvdGhlciBhcmNoaXRlY3R1cmVzLCBub25lIG9mIHRoZW0gZGlzYWJsZXMgdGhlCj4g
PiA+IGluc3RydW1lbnRhdGlvbiBvbiBkb19wYWdlX2ZhdWx0Lgo+ID4gVGhhdCdzIG5vdCB0cnVl
LCBoYXZlIGEgbG9vayBhdCBwb3dlciAmIGFybTY0LiBBbGwgb2YgdGhlbSBoYXZlIHNvbWUKPiA+
IGxpbWl0YXRpb25zIGF0IHRoZSBlbnRyeSBvZiBwYWdlX2ZhdWx0Lgo+Cj4gV2VsbCwgYXJtNjQn
cyBjYW4ndCBiZSBrcHJvYmVkLCBidXQgaXMgKmNhbiogYmUgdHJhY2VkIHdpdGggZnRyYWNlLCBh
bmQgKmNhbioKPiBiZSBpbnN0cnVtZW50ZWQgd2l0aCBLQVNBTiBhbmQgZnJpZW5kcy4gSSdtIG5v
dCBzdXJlIHRoYXQgd2UgYWN0dWFsbHkgbmVlZCB0bwo+IGluaGliaXQga3Byb2JlcyBmb3IgZG9f
cGFnZV9mYXVsdCwgYW5kIHdlIG1pZ2h0IGJlIGFibGUgdG8gcmVsYXggdGhhdC4KPgo+IEFzIGEg
Z2VuZXJhbCB0aGluZywgd2UndmUgdHJpZWQgdG8gY2VudHJhbGl6ZSBhbGwgdGhlIG5lY2VzYXJp
bHktbm9pbnN0ciBiaXRzCj4gaW4gYXJjaC9hcm02NC9rZXJuZWwvZW50cnktY29tbW9uLmMsIGFu
ZCBrZWVwIGV2ZXJ5dGhpbmcgZWxzZSBhcyBpbnN0cnVtZW50YWJsZQo+IGFzIHBvc3NpYmxlLgo+
Cj4gSSdkIHJlY29tbWVuZCBkb2luZyBzaW1pbGFyLCBhbmQgaGF2ZSBhIGNlbnRyYWwgZmlsZSBm
b3IgYW55IGVudHJ5IGJpdHMgd2hpY2gKPiBjYW4ndCBsaXZlIGluIHRoZSBnZW5lcmljIGVudHJ5
IGNvZGUsIGFuZCBrZWVwIHRoZSByZXN0IGluc3RydW1lbnRhYmxlLiBUaGF0Cj4gd2lsbCBtYWtl
IGl0IGVhc2llciB0byBtYWludGFpbiBhbmQgdmVyaWZ5LgoKT2theSwgaGVyZSBpcyB0aGUgdjEz
IFsxXS4gSSd2ZSBjZW50cmFsaXplZCBhbGwgdGhlIG5lY2VzYXJpbHktbm9pbnN0cgpiaXRzIGlu
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyMzAxMDcxMTM4MzguMzk2OTE0OS0xLWd1b3JlbkBrZXJuZWwub3JnLwoK
Pgo+IFRoYW5rcywKPiBNYXJrLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
