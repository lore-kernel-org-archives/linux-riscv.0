Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72942C46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hri/8wxVHygA0xdJLC9d+Gm98jV8xmS9d8X8cDEgm4=; b=aIe2JYbRP6q6IR
	sQpOeJgk3rHzrDds9WyQ2glPP+sNVa3EZ/qxBFAg+z86rJgWQzkYoYTfR7mfZwSHLs7KzGc1lfRFA
	vLySlRjssZifcRvQUu/1TjCPSGaGd8oJnXkB9bjuncITN+f5+x0il2pKI4QxJR2PCnapzFwUktnF3
	b4VHADGcNAq7IAFyhzM39i1HTpTqvs3fdFKNCJQOeT1I7GLyxqhE7M+NYVkcKkwPwZovlyYpGtB+n
	U2t1H4BBy2/L942BYvEb1pRpbKAAvGQPdbXEot1bEvSDavvTd3ouE78uB2badyNblEvaeNpTTh3v0
	Sn/TptoEt69/ifIrmeYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXNt-004sQw-1p;
	Fri, 22 Dec 2023 04:43:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXNq-004sQ2-05
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7942DB821C1
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166D7C433AD
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703220215;
	bh=BYc4P52QVmcfkosbCiaZHm30PAhBdMV15eIFZyXrt/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gfYgaZlUKTevwbQZJYf85rCQkvZ/2dCJYNFbjX4MpLQkTDUUEUs/gP6VgkDORJWb8
	 39mKyH0Ale/2tztSN7oPpMMX8AVjmR7C80Ec+Qj7ylvDdMCuhODKMjmh5TDF4Lx3uC
	 39ErfF6Mps6iJFaHEwyXAzkQ5Nu128Yd2sJxWJ6nY/94L7qUCSZHLV5/sCN8oYauqI
	 N4dax9yGxlcrjoMrDAaNl8IZ8xR0Hgym3gVh5HxSmMIEXzMN9t6gLELtElUW7lppYm
	 5IIc6FIgr1lxlCyWzmaSZamTNwe7g9rYswUzFs4QlJqViWD7UPJhQ8/YWKRjrzaesf
	 HqqLBcybWwv9w==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-553ba2f0c8fso1623479a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:43:34 -0800 (PST)
X-Gm-Message-State: AOJu0YzlbdyCMsXnkRsHPd+6AY6NmsOyWTx3QxDjnzNGp77b3GuTnTVS
	CgMTFgePNa1lCIAAiKebKZz3n3sGgdX36+dZz3k=
X-Google-Smtp-Source: AGHT+IEUijHJ57JnutUHpUy3p1Ku8NBY/+d6W1M5E/W4tJng1EyPnpTmpp3MlXrvJ8ydAe+kadGKjzYldx2WjsB5z0k=
X-Received: by 2002:a50:935c:0:b0:553:aa33:7876 with SMTP id
 n28-20020a50935c000000b00553aa337876mr152031eda.31.1703220213485; Thu, 21 Dec
 2023 20:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20231220-optimize_checksum-v13-0-a73547e1cad8@rivosinc.com>
 <20231220-optimize_checksum-v13-2-a73547e1cad8@rivosinc.com>
 <CAJF2gTR9ZxLZwEs=TMeih+vEEuuxNHRkgLsG2ShjXPEZ-G44_w@mail.gmail.com> <ZYTobxPZVNct4toQ@ghost>
In-Reply-To: <ZYTobxPZVNct4toQ@ghost>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 12:43:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBweJTVw1m1WuJ6LNKrB_U83sdtkiZAk-NLND6sqdMZQ@mail.gmail.com>
Message-ID: <CAJF2gTTBweJTVw1m1WuJ6LNKrB_U83sdtkiZAk-NLND6sqdMZQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] riscv: Add static key for misaligned accesses
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_204338_353092_3A504151 
X-CRM114-Status: GOOD (  32.03  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgOTozN+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDg6MzM6
MThBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIFRodSwgRGVjIDIxLCAyMDIzIGF0IDc6
MzjigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gU3VwcG9ydCBzdGF0aWMgYnJhbmNoZXMgZGVwZW5kaW5nIG9uIHRoZSB2YWx1ZSBv
ZiBtaXNhbGlnbmVkIGFjY2Vzc2VzLgo+ID4gPiBUaGlzIHdpbGwgYmUgdXNlZCBieSBhIGxhdGVy
IHBhdGNoIGluIHRoZSBzZXJpZXMuIEFsbCBjcHVzIG11c3QgYmUKPiA+ID4gY29uc2lkZXJlZCAi
ZmFzdCIgZm9yIHRoaXMgc3RhdGljIGJyYW5jaCB0byBiZSBmbGlwcGVkLgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4g
PiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIHwgIDIgKysK
PiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgIHwgMzAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlv
bnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1
ZmVhdHVyZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiA+ID4gaW5k
ZXggYTQxOGMzMTEyY2Q2Li43YjEyOWU1ZTJmMDcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+IEBAIC0xMzMsNCArMTMzLDYgQEAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSBib29sIHJpc2N2X2NwdV9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KGludCBjcHUs
IGNvbnN0IHVuc2kKPiA+ID4gICAgICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2
YWlsYWJsZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0KTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gK0RF
Q0xBUkVfU1RBVElDX0tFWV9GQUxTRShmYXN0X21pc2FsaWduZWRfYWNjZXNzX3NwZWVkX2tleSk7
Cj4gPiA+ICsKPiA+ID4gICNlbmRpZgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+IGlu
ZGV4IGIzNzg1ZmZjMTU3MC4uMDk1ZWI2ZWJkY2FhIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiA+IEBAIC0xMCw2ICsxMCw3IEBACj4gPiA+ICAjaW5jbHVkZSA8bGludXgv
Yml0bWFwLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvY3B1aG90cGx1Zy5oPgo+ID4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2N0eXBlLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5o
Pgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9t
ZW1vcnkuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ID4gQEAgLTcyOCw2
ICs3MjksMzUgQEAgdm9pZCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCkKPiA+ID4gICAgICAg
ICAgICAgICAgIGNzcl9zZXQoQ1NSX1NFTlZDRkcsIEVOVkNGR19DQlpFKTsKPiA+ID4gIH0KPiA+
ID4KPiA+ID4gK0RFRklORV9TVEFUSUNfS0VZX0ZBTFNFKGZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nf
c3BlZWRfa2V5KTsKPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCBzZXRfdW5hbGlnbmVkX2FjY2Vz
c19zdGF0aWNfYnJhbmNoZXModm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICAvKgo+ID4gPiAr
ICAgICAgICAqIFRoaXMgd2lsbCBiZSBjYWxsZWQgYWZ0ZXIgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19hbGxfY3B1cyBzbyB0aGUKPiA+ID4gKyAgICAgICAgKiByZXN1bHQgb2YgdW5hbGlnbmVkIGFj
Y2VzcyBzcGVlZCBmb3IgYWxsIGNwdXMgd2lsbCBiZSBhdmFpbGFibGUuCj4gPiA+ICsgICAgICAg
ICovCj4gPiA+ICsKPiA+ID4gKyAgICAgICBpbnQgY3B1Owo+ID4gPiArICAgICAgIGJvb2wgZmFz
dF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZCA9IHRydWU7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBm
b3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgewo+ID4gRWFjaCBvbmxpbmVfY3B1PyBJcyB0aGVyZSBh
bnkgb2ZmbGluZV9jcHUgdGhhdCBpcyBubwo+ID4gZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVl
ZD8KPgo+IEkgdGhpbmsgaW5zdGVhZCBvZiBjaGVja2luZyBvZmZsaW5lIGNwdXMsIGl0IHdvdWxk
IG1ha2UgbW9yZSBzZW5zZSB0bwo+IGFkanVzdCB0aGUgc3RhdGljIGJyYW5jaCB3aGVuIG9mZmxp
bmUgY3B1cyBjb21lIG9ubGluZS4gU2luY2UKPiByaXNjdl9vbmxpbmVfY3B1IGlzIGNhbGxlZCB3
aGVuIGEgbmV3IENQVSBjb21lcyBvbmxpbmUsIEkgY2FuIHVwZGF0ZSB0aGUKPiBzdGF0aWMgYnJh
bmNoIGluc2lkZSBvZiB0aGF0IGZ1bmN0aW9uLgo+Cj4gPgo+ID4gTW92ZSBpbnRvIHlvdXIgcmlz
Y3Zfb25saW5lX2NwdSBmb3IgZWFjaCBDUFUsIGFuZCB1c2Ugc3RvcF9tYWNoaW5lIGZvcgo+ID4g
c3luY2hyb25pemF0aW9uLgo+ID4KPgo+IEkgZG8gbm90IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVh
biBieSAiTW92ZSBpbnRvIHlvdXIgcmlzY3Zfb25saW5lX2NwdQo+IGZvciBlYWNoIENQVSIsIGJ1
dCBJIGFtIGFzc3VtaW5nIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHVwZGF0aW5nIHRoZQo+IHN0YXRp
YyBicmFuY2ggaW5zaWRlIG9mIHJpc2N2X29ubGluZV9jcHUuCkkgbWVhbiBpbjoKYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jOiByaXNjdl9vbmxpbmVfY3B1KCkKClllcywiYWRqdXN0IHRo
ZSBzdGF0aWMgYnJhbmNoIHdoZW4gb2ZmbGluZSBjcHVzIGNvbWUgb25saW5lIC4uLiIKCj4KPiBJ
IGJlbGlldmUgYW55IHJhY2UgY29uZGl0aW9uIHRoYXQgY291bGQgYmUgc29sdmVkIGJ5IHN0b3Bf
bWFjaGluZSB3aWxsCj4gYmVjb21lIGlycmVsZXZlbnQgYnkgZW5zdXJpbmcgdGhhdCB0aGUgc3Rh
dGljIGJyYW5jaCBpcyB1cGRhdGVkIHdoZW4gYQo+IG5ldyBjcHUgY29tZXMgb25saW5lLgpFbS4u
LiAgc3RvcF9tYWNoaW5lIG1heSBiZSBub3QgbmVjZXNzYXJ5LgoKPgo+IC0gQ2hhcmxpZQo+Cj4g
PiA+ICsgICAgICAgICAgICAgICBpbnQgdGhpc19wZXJmID0gcGVyX2NwdShtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCwgY3B1KTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKHRoaXNf
cGVyZiAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRkFTVCkgewo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBmYXN0X21pc2FsaWduZWRfYWNjZXNzX3NwZWVkID0gZmFsc2U7Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiArICAgICAgICAgICAgICAgfQo+
ID4gPiArICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAgIGlmIChmYXN0X21pc2FsaWduZWRf
YWNjZXNzX3NwZWVkKQo+ID4gPiArICAgICAgICAgICAgICAgc3RhdGljX2JyYW5jaF9lbmFibGUo
JmZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfa2V5KTsKPiA+ID4gKwo+ID4gPiArICAgICAg
IHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICthcmNoX2luaXRjYWxsX3N5bmMoc2V0
X3VuYWxpZ25lZF9hY2Nlc3Nfc3RhdGljX2JyYW5jaGVzKTsKPiA+ID4gKwo+ID4gPiAgI2lmZGVm
IENPTkZJR19SSVNDVl9BTFRFUk5BVElWRQo+ID4gPiAgLyoKPiA+ID4gICAqIEFsdGVybmF0aXZl
IHBhdGNoIHNpdGVzIGNvbnNpZGVyIDQ4IGJpdHMgd2hlbiBkZXRlcm1pbmluZyB3aGVuIHRvIHBh
dGNoCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuNDMuMAo+ID4gPgo+ID4gPgo+ID4KPiA+Cj4gPiAt
LQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJlbgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
