Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28238CDB479
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 13:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVJ0mpsqoQFku/bj67xBt/1TWELij94rWqZdPWRqP/M=; b=GM7TUvXsYaLIPl
	c4HVKL5CjRefaVEnBbT212TGKi51icYjmvGMwYT2cpMdo4KdLyGbz+A134uP4frdZhB105qcRKjtO
	ML023jUI7fpvEyZuGgiquvCouYCh0GuR37QESbxRkLwe3evgI2jkafNaleMMBw7ZZ4vQYrXLjQXMk
	JWc5byJ4KMsw3K+IQTRhwSdikoAKqiTdPDyC92jPtgZKbQaKziGJ4rK25Qeh7J7yl7Qpf2Q4Irrb5
	/cdcyDOFeTf4kz4sVRxXYoIQwa+eCbQQ8T3XpNxIfQXk1mz2iIzkPermKrrxX49gNYsQgBbNGExDS
	UP/pPl1cR0n1Wi6ObInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNUZ-00000007oIo-2QWN;
	Wed, 24 Jun 2026 13:18:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNUY-00000007oIi-1z3v
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 13:18:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D99A7441D7
	for <linux-riscv@lists.infradead.org>; Wed, 24 Jun 2026 13:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17AE1F00ADE
	for <linux-riscv@lists.infradead.org>; Wed, 24 Jun 2026 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782307089;
	bh=1rD5RzOkXDXTz9zhYe01XrnuO4Sm8PLmcsetrRyq0j8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aSRG5boFF576nEz0BFVHWB/dOFlcQf9QVXwZa8b/TuCHY/GCsJg0oXEzamnf+M1jD
	 iWweLgCfIuv7+t92aGHdHzUEJodKOmEpyuFXD41pmEh3xQ74VYXezX7D84gARjfcCG
	 GPM9/RN0CtJrSBW489pyuaRBCRQg3kP8H3pMxcxtTekTrXuMlXogbZEo7GK4WNemGt
	 lPusITMN4VULnX3RKGVfC5y2+JndNWAMGdGgqPOTp+eBs3DiWpKo/GsQfLtajH/0oV
	 F1p0s26/BVXCw+9TTsdSp/RvuRmKWG6/fTR0CRFenFdxPOFRiqKcCDgE4RRKn+uQyU
	 qSgftL9j1CLVA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad0abf1f7bso715847e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jun 2026 06:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqickrt4qXKEj5A3/BVqohZQIzi52T8zpfUaWE09XaQ9F9cDVm2JodOiXqHMJBV4ckO4JTXjacAjlj0eg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhz4t5OqpGPGnOqnFdT3nGrd4/R9LJB8wjIC7Sq3c4v0PqKXOg
	8Fh0StECt+f1t6xtbyq5UDz8aIqeIM9dFmw1IA1DO2+4UtL1i7tbMnQhxjncErSyKf51wry1EAW
	VDuYpH2LFfrOtwBeIHiAuIiCsTob8/lo=
X-Received: by 2002:ac2:5981:0:b0:5aa:64cb:9594 with SMTP id
 2adb3069b0e04-5ae9d57862cmr636267e87.15.1782307088192; Wed, 24 Jun 2026
 06:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260616072617.2272-1-lirongqing@baidu.com> <CAJZ5v0j3Wnn3exbji-6PzwjCnOCJDe_pUJU9R25Bhvh1ZE3E5A@mail.gmail.com>
 <731d81865e444be8a9bc07dd121975f3@baidu.com>
In-Reply-To: <731d81865e444be8a9bc07dd121975f3@baidu.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Jun 2026 15:17:51 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gpdX-V9rwtE6AC9GiwVpjf=xexZCQEA+Z3CwevemUcWQ@mail.gmail.com>
X-Gm-Features: AVVi8CcGimQDx9OVfVo-peErRJmnfIUZDklsSTkoyAy4wC0g8y2nBYj2kxSLXJ8
Message-ID: <CAJZ5v0gpdX-V9rwtE6AC9GiwVpjf=xexZCQEA+Z3CwevemUcWQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdW3YyXSBBQ1BJOiBwcm9jZXNzb3JfaQ==?=
	=?UTF-8?B?ZGxlOiBNYXJrIExQSSBlbnRlciBmdW5jdGlvbnMgYXMgX19jcHVpZGxl?=
To: "Li,Rongqing" <lirongqing@baidu.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Huisong Li <lihuisong@huawei.com>, Paul Walmsley <pjw@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgMzo1MeKAr0FNIExpLFJvbmdxaW5nIDxsaXJvbmdxaW5n
QGJhaWR1LmNvbT4gd3JvdGU6Cj4KPiA+ID4gVGhlIGFjcGlfaWRsZV9scGlfZW50ZXIoKSBmdW5j
dGlvbiBpcyBpbnZva2VkIHdpdGhpbiB0aGUgY3B1aWRsZSBwYXRoCj4gPiA+IGFmdGVyIFJDVSBo
YXMgYWxyZWFkeSBiZWVuIGRpc2FibGVkIGZvciB0aGUgY3VycmVudCBsb2NhbCBDUFUuCj4gPiA+
IENvbnNlcXVlbnRseSwgZnRyYWNlJ3MgZnVuY3Rpb25fdHJhY2VfY2FsbCgpIGV4cGVjdHMgUkNV
IHRvIGJlCj4gPiA+IGFjdGl2ZWx5IHdhdGNoaW5nIGJlZm9yZSByZWNvcmRpbmcgdHJhY2UgZGF0
YSwgZW1pdHRpbmcgYSB3YXJuaW5nIGlmCj4gPiA+IGl0IGlzIG5vdC4KPiA+ID4KPiA+ID4gRml4
IHRoaXMgYnkgYW5ub3RhdGluZyBhY3BpX2lkbGVfbHBpX2VudGVyKCksIHRoZSBnZW5lcmljIF9f
d2VhayBzdHViLAo+ID4gPiBhbmQgdGhlIFJJU0MtViBpbXBsZW1lbnRhdGlvbiBvZiBhY3BpX3By
b2Nlc3Nvcl9mZmhfbHBpX2VudGVyKCkgd2l0aAo+ID4gPiBfX2NwdWlkbGUuIFRoaXMgbW92ZXMg
dGhlc2UgZnVuY3Rpb25zIGludG8gdGhlICcuY3B1aWRsZS50ZXh0Jwo+ID4gPiBzZWN0aW9uLCBp
bXBsaWNpdGx5IGRpc2FibGluZyBmdHJhY2UgaW5zdHJ1bWVudGF0aW9uIChub3RyYWNlKSBhbG9u
Zwo+ID4gPiB0aGlzIHNlbnNpdGl2ZSBwYXRoIGFuZCBwcmV2ZW50aW5nIHRyYWNlLWluZHVjZWQg
UkNVIHdhcm5pbmdzIGR1cmluZwo+ID4gPiBpZGxlIGVudHJ5Lgo+ID4gPgo+ID4gPiBGaXhlczog
YTM2YTdmZWNmZTYwICgiQUNQSSAvIHByb2Nlc3Nvcl9pZGxlOiBBZGQgc3VwcG9ydCBmb3IgTG93
IFBvd2VyCj4gPiA+IElkbGUoTFBJKSBzdGF0ZXMiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBS
b25nUWluZyA8bGlyb25ncWluZ0BiYWlkdS5jb20+Cj4gPiA+IC0tLQo+ID4gPiBEaWZmIHdpdGgg
djE6IGFkZCBfX2NwdWlkbGUgdG8gYWNwaV9wcm9jZXNzb3JfZmZoX2xwaV9lbnRlcgo+ID4gPgo+
ID4gPiAgZHJpdmVycy9hY3BpL3Byb2Nlc3Nvcl9pZGxlLmMgfCA0ICsrLS0gIGRyaXZlcnMvYWNw
aS9yaXNjdi9jcHVpZGxlLmMKPiA+ID4gfCAyICstCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYWNwaS9wcm9jZXNzb3JfaWRsZS5jCj4gPiA+IGIvZHJpdmVycy9hY3BpL3Byb2Nlc3Nv
cl9pZGxlLmMgaW5kZXggMzkwYWI1Zi4uNDQ4MmNmMiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9hY3BpL3Byb2Nlc3Nvcl9pZGxlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9hY3BpL3Byb2Nlc3Nv
cl9pZGxlLmMKPiA+ID4gQEAgLTExNDMsNyArMTE0Myw3IEBAIHN0YXRpYyBpbnQgYWNwaV9wcm9j
ZXNzb3JfZ2V0X2xwaV9pbmZvKHN0cnVjdAo+ID4gYWNwaV9wcm9jZXNzb3IgKnByKQo+ID4gPiAg
ICAgICAgIHJldHVybiAwOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiAtaW50IF9fd2VhayBhY3BpX3By
b2Nlc3Nvcl9mZmhfbHBpX2VudGVyKHN0cnVjdCBhY3BpX2xwaV9zdGF0ZSAqbHBpKQo+ID4gPiAr
aW50IF9fd2VhayBfX2NwdWlkbGUgYWNwaV9wcm9jZXNzb3JfZmZoX2xwaV9lbnRlcihzdHJ1Y3QK
PiA+ID4gK2FjcGlfbHBpX3N0YXRlICpscGkpCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgcmV0dXJu
IC1FTk9ERVY7Cj4gPiA+ICB9Cj4gPiA+IEBAIC0xMTU2LDcgKzExNTYsNyBAQCBpbnQgX193ZWFr
IGFjcGlfcHJvY2Vzc29yX2ZmaF9scGlfZW50ZXIoc3RydWN0Cj4gPiBhY3BpX2xwaV9zdGF0ZSAq
bHBpKQo+ID4gPiAgICoKPiA+ID4gICAqIFJldHVybjogMCBmb3Igc3VjY2VzcyBvciBuZWdhdGl2
ZSB2YWx1ZSBmb3IgZXJyb3IKPiA+ID4gICAqLwo+ID4gPiAtc3RhdGljIGludCBhY3BpX2lkbGVf
bHBpX2VudGVyKHN0cnVjdCBjcHVpZGxlX2RldmljZSAqZGV2LAo+ID4gPiArc3RhdGljIGludCBf
X2NwdWlkbGUgYWNwaV9pZGxlX2xwaV9lbnRlcihzdHJ1Y3QgY3B1aWRsZV9kZXZpY2UgKmRldiwK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjcHVpZGxlX2RyaXZl
ciAqZHJ2LCBpbnQgaW5kZXgpCj4gPiA+IHsKPiA+ID4gICAgICAgICBzdHJ1Y3QgYWNwaV9wcm9j
ZXNzb3IgKnByOwo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3Jpc2N2L2NwdWlkbGUu
Ywo+ID4gPiBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHVpZGxlLmMgaW5kZXggNjI0ZjliYi4uYzc2
ZGJhYiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L2NwdWlkbGUuYwo+ID4g
PiArKysgYi9kcml2ZXJzL2FjcGkvcmlzY3YvY3B1aWRsZS5jCj4gPiA+IEBAIC02Niw3ICs2Niw3
IEBAIGludCBhY3BpX3Byb2Nlc3Nvcl9mZmhfbHBpX3Byb2JlKHVuc2lnbmVkIGludCBjcHUpCj4g
PiA+ICAgICAgICAgcmV0dXJuIGFjcGlfY3B1X2luaXRfaWRsZShjcHUpOyAgfQo+ID4gPgo+ID4g
PiAtaW50IGFjcGlfcHJvY2Vzc29yX2ZmaF9scGlfZW50ZXIoc3RydWN0IGFjcGlfbHBpX3N0YXRl
ICpscGkpCj4gPiA+ICtpbnQgX19jcHVpZGxlIGFjcGlfcHJvY2Vzc29yX2ZmaF9scGlfZW50ZXIo
c3RydWN0IGFjcGlfbHBpX3N0YXRlCj4gPiA+ICsqbHBpKQo+ID4gPiAgewo+ID4gPiAgICAgICAg
IHUzMiBzdGF0ZSA9IGxwaS0+YWRkcmVzczsKPiA+ID4KPiA+ID4gLS0KPiA+Cj4gPiBTYXNoaWtv
IHNheXMgdGhhdCB0aGlzIGNoYW5nZSBtYXkgbm90IGJlIHN1ZmZpY2llbnQgdG8gZnVsbHkgYWRk
cmVzcyB0aGUgaXNzdWUKPiA+Cj4gPiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA2MTYwNzI2MTcuMjI3Mi0xLWxpcm9uZ3FpbmclNDBiYWlkdQo+ID4gLmNvbQo+ID4KPiA+IGFu
ZCB0aGF0IGFwcGVhcnMgdG8gYmUgYSB2YWxpZCBjb25jZXJuLgo+Cj4gU2hvdWxkIHRoaXMgZml4
IGJlIHBsYWNlZCBpbiBhIHNlcGFyYXRlIHBhdGNoPyBDUFVfUE1fQ1BVX0lETEVfRU5URVJfUEFS
QU0KPiBpcyBhbHNvIGludm9rZWQgYnkgc2JpX2NwdWlkbGVfZW50ZXJfc3RhdGUsIHdoaWNoIGlz
IGl0c2VsZiBhbHJlYWR5IGFubm90YXRlZCB3aXRoIF9fY3B1aWRsZSwKPiBzbyB0aGlzIGFwcGVh
cnMgdG8gYmUgYSBwcmUtZXhpc3RpbmcgaXNzdWUgaW4gdGhlIFJJU0MtViB0cmVlLiBJdCB3b3Vs
ZCBiZSBtb3JlIGFwcHJvcHJpYXRlCj4gdG8gaGF2ZSBSSVNDLVYgZXhwZXJ0cyB0byBmaXggaXQg
aW5kZXBlbmRlbnRseS4KCk9LLCBmYWlyIGVub3VnaC4KCkFwcGxpZWQgYXMgNy4yLXJjIG1hdGVy
aWFsLCB0aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
