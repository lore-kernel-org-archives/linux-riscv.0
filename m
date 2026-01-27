Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E48C88E41
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iWnioPDwNoyQ1Jqczev1YxfvnlW+36UfSgHv/4IfTg=; b=jasbp/VDSnbYBn
	Df0HcGGHN3iPAoS0w5thAkXMVgPSkv4B9iG8VZqti4eMYUfNQQayr1ihvu/uluu1boMn1YO+JKNEK
	fcS4U6Io4csnL9vJ/zElz6FPISEKcYtIwzrj+yRsD4GCseFPC0KsTQhb2eoZbNLX7bBdc62biuPeU
	T2TRPqXKo02c/SKIYAcWFCDyVM0BZCjZL+ijVgXC139Q0QlYOSOhm/lN15PFDApD7v4FdZekNsJcr
	Z79faUnSI2RLKfYrgqxd+cViXguh8/maTJaCZ10VMNmQswVRYBZcKNSvGHA/tCzpimyB681WgWGNX
	JAvxha8ImfAEArVn3/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkZ1-0000000EUWJ-0Rfs;
	Tue, 27 Jan 2026 15:01:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkYw-0000000EUVn-0xKk
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 15:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D78B4442AB
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 15:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1DEC2BCAF
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769526061;
	bh=TC2ojBnEzKjSm02vnSKbJc6xd4kHdDdbya/Bgqu9H9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L9QWfm9RXkIZ4/Woq7bsw0TyNn9g1Dc9kE8KU8Xd/kMwY1grTDmnhJlugeLCzdoiI
	 g6pIWwvLsiblw07hoJZyrS0eo6vwMB2p4m1NAXB5E8u2dGor2EoqfH1tydPB102iMn
	 kIDkG2gVUfz/PsqFGcws8Nn8dVUhyhxv6IzTiKH0iVA/fN2+zKNt1LbMQ+QHEfGNKJ
	 clKgGbhJZOs78b4lx8bSz7ufWBwmeALzjIzAQgNHlxjyc5GgBhU7xDZRpVW+LqNYYz
	 aN6GaCvydntTHaLKjahmWKWwZjsEkpD8dsDa7CKgoEAj9/oQveJki5FLs3BOGxt9IH
	 tyW3u2oEpaftA==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45c838069e5so3575264b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 07:01:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTa3R7gfEZFvGdpPBjyQmPAP1NsfL8vKRvqGZbEE9SS9zgBFHYW2gca/6cGfZFcNuLQkP23Jg37oPu4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmiZbKhOnkh26ZZxFaCo4thPo3o46nLfmqiMhAX26aOItswPlp
	05Qfnay6FfbHSSfw4tMl1jzwZkB09us/DySmLKRuWaJP+XEqEzymWwuWaaGL+o4jBYgHOMwh66j
	AzZiDaS0oB536U5SnAJ45qOGNe9Z9CrA=
X-Received: by 2002:a05:6808:2e4d:b0:450:bc28:c883 with SMTP id
 5614622812f47-45efc6f7349mr1237514b6e.58.1769526060517; Tue, 27 Jan 2026
 07:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20251203140716.3065-1-huyuye812@163.com> <20260112141630.2869-1-huyuye812@163.com>
In-Reply-To: <20260112141630.2869-1-huyuye812@163.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Jan 2026 16:00:49 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ixBFGHwvSEp3Ae_s0tyhK338Gju=1+vb+O3_pH2mHyGA@mail.gmail.com>
X-Gm-Features: AZwV_Qip_BNTk6ncmyWz97jQ9rPE2aPWnHrEh9T9xbERPrdO3mOUpXGjtm_GQ24
Message-ID: <CAJZ5v0ixBFGHwvSEp3Ae_s0tyhK338Gju=1+vb+O3_pH2mHyGA@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: pci_root: Clear the acpi dependencies after PCI
 root bridge initialization on RISC-V
To: huyuye <huyuye812@163.com>, Bjorn Helgaas <bhelgaas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_070102_307100_AC8953C7 
X-CRM114-Status: GOOD (  22.81  )
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
Cc: lin.yongchun@zte.com.cn, Albert Ou <aou@eecs.berkeley.edu>, guo.chang2@zte.com.cn, Alexandre Ghiti <alex@ghiti.fr>, zhang.longxiang@zte.com.cn, linux-pci@vger.kernel.org, Robert Moore <robert.moore@intel.com>, linux-kernel@vger.kernel.org, zuo.jiang@zte.com.cn, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, wu.jiabao@zte.com.cn, dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn, Paul Walmsley <pjw@kernel.org>, liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, hu.yuye@zte.com.cn, li.kunpeng@zte.com.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMzoxN+KAr1BNIGh1eXV5ZSA8aHV5dXllODEyQDE2My5j
b20+IHdyb3RlOgo+Cj4gSGkgUmFmYWVsLAo+IFRoYW5rIHlvdSBmb3IgeW91ciB0aG9yb3VnaCBy
ZXZpZXcgYW5kIHZhbHVhYmxlIGNvbW1lbnRzIG9uIHYxLgo+IEkndmUgdXBkYXRlZCB0aGUgcGF0
Y2ggYXMgZm9sbG93czoKPiAxLiBSZW1vdmVkIHRoZSByZWR1bmRhbnQgI2lmZGVmIENPTkZJR19B
Q1BJIGFuZCBpZiAoIWFjcGlfZGlzYWJsZWQpCj4gZ3VhcmQgYXMgeW91IHBvaW50ZWQgb3V0LiBU
aGUgZW50aXJlIGNvZGUgYmxvY2sgaW5kZWVkIGFscmVhZHkgZGVwZW5kcwo+IG9uIENPTkZJR19B
Q1BJIGF0IGEgaGlnaGVyIGxldmVsLCBtYWtpbmcgdGhlIGlubmVyIGd1YXJkIHVubmVjZXNzYXJ5
Lgo+IDIuIE1vdmVkIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcyB0byBSSVNDLVYgc3BlY2lm
aWMgYXJjaGl0ZWN0dXJlCj4gY29kZSAoZHJpdmVyL2FjcGkvcmlzY3YvYWNwaV9wY2kuYykuIFRo
aXMgZW5zdXJlcyB0aGF0IEFDUEkgZGVwZW5kZW5jeQo+IGNsZWFyaW5nIGlzIGhhbmRsZWQgd2l0
aGluIHRoZSBhcHByb3ByaWF0ZSBhcmNoaXRlY3R1cmFsIGNvbnRleHQuCj4KPiBCZXN0IHJlZ2Fy
ZHMKPiBTaWduZWQtb2ZmLWJ5OiBodXl1eWUgPGh1eXV5ZTgxMkAxNjMuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2FjcGkvcGNpX3Jvb3QuYyAgICAgICB8ICA2ICsrKysrKwo+ICBkcml2ZXJzL2FjcGkv
cmlzY3YvTWFrZWZpbGUgICB8ICAyICstCj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9hY3BpX3BjaS5j
IHwgMTEgKysrKysrKysrKysKPiAgaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmggICAgICAgfCAgMSAr
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9hY3BpL3Jpc2N2L2FjcGlfcGNpLmMKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2FjcGkvcGNpX3Jvb3QuYyBiL2RyaXZlcnMvYWNwaS9wY2lfcm9vdC5j
Cj4gaW5kZXggOWQ3Zjg1ZGFkYzQ4Li5hMTZlYjkwOTdjZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9hY3BpL3BjaV9yb290LmMKPiArKysgYi9kcml2ZXJzL2FjcGkvcGNpX3Jvb3QuYwo+IEBAIC0z
MCw2ICszMCwxMSBAQCBzdGF0aWMgaW50IGFjcGlfcGNpX3Jvb3RfYWRkKHN0cnVjdCBhY3BpX2Rl
dmljZSAqZGV2aWNlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IGFjcGlfZGV2aWNlX2lkICpub3RfdXNlZCk7Cj4gIHN0YXRpYyB2b2lkIGFjcGlfcGNpX3Jvb3Rf
cmVtb3ZlKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlKTsKPgo+ICsKPiArdm9pZCBfX3dlYWsg
YXJjaF9hY3BpX3BjaV9yb290X2FkZF9jbGVhcl9kZXAoc3RydWN0IGFjcGlfZGV2aWNlICpkZXZp
Y2UpCj4gK3sKPiArfQo+ICsKPiAgc3RhdGljIGludCBhY3BpX3BjaV9yb290X3NjYW5fZGVwZW5k
ZW50KHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKPiAgewo+ICAgICAgICAgYWNwaXBocF9jaGVj
a19ob3N0X2JyaWRnZShhZGV2KTsKPiBAQCAtNzYwLDYgKzc2NSw3IEBAIHN0YXRpYyBpbnQgYWNw
aV9wY2lfcm9vdF9hZGQoc3RydWN0IGFjcGlfZGV2aWNlICpkZXZpY2UsCj4gICAgICAgICBwY2lf
bG9ja19yZXNjYW5fcmVtb3ZlKCk7Cj4gICAgICAgICBwY2lfYnVzX2FkZF9kZXZpY2VzKHJvb3Qt
PmJ1cyk7Cj4gICAgICAgICBwY2lfdW5sb2NrX3Jlc2Nhbl9yZW1vdmUoKTsKPiArICAgICAgIGFy
Y2hfYWNwaV9wY2lfcm9vdF9hZGRfY2xlYXJfZGVwKGRldmljZSk7CgpBY3R1YWxseSwgdGhpcyBj
b3VsZCBiZSBhcyBzaW1wbGUgYXMKCiAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1Yp
KQogICAgICAgICAgICAgIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcyhkZXZpY2UpOwoKd2l0
aCBhIGJyaWVmIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkgaXQgaXMgbmVlZGVkLgoKQmpvcm4sIGFu
eSB0aG91Z2h0cz8KCj4gICAgICAgICByZXR1cm4gMTsKPgo+ICByZW1vdmVfZG1hcjoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9hY3BpL3Jpc2N2L01ha2VmaWxlIGIvZHJpdmVycy9hY3BpL3Jpc2N2
L01ha2VmaWxlCj4gaW5kZXggMTI4NGEwNzZmYTg4Li41YjFiZDAyOThmYjkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9hY3BpL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9hY3BpL3Jpc2N2
L01ha2VmaWxlCj4gQEAgLTEsNSArMSw1IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQo+IC1vYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAr
PSByaGN0Lm8gaW5pdC5vIGlycS5vCj4gK29iai15ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICs9IHJoY3QubyBpbml0Lm8gaXJxLm8gYWNwaV9wY2kubwo+ICBvYmotJChDT05GSUdf
QUNQSV9QUk9DRVNTT1JfSURMRSkgICAgICArPSBjcHVpZGxlLm8KPiAgb2JqLSQoQ09ORklHX0FD
UElfQ1BQQ19MSUIpICAgICAgICAgICAgKz0gY3BwYy5vCj4gIG9iai0kKENPTkZJR19BQ1BJX1JJ
TVQpICAgICAgICAgICAgICAgICAgICAgICAgKz0gcmltdC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNwaS9yaXNjdi9hY3BpX3BjaS5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2FjcGlfcGNpLmMK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzY4ZmYxMTNlNWM2
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9hY3BpX3BjaS5jCj4g
QEAgLTAsMCArMSwxMSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5Cj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyNiwgWlRFIENvcnBvcmF0aW9uCj4gKyAq
ICBBdXRob3I6IFl1IFllIEh1IDxodS55dXllQHp0ZS5jb20uY24+Cj4gKyAqLwo+ICsjaW5jbHVk
ZSA8bGludXgvYWNwaS5oPgo+ICsKPiArdm9pZCBhcmNoX2FjcGlfcGNpX3Jvb3RfYWRkX2NsZWFy
X2RlcChzdHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZSkKPiArewo+ICsgICAgICAgYWNwaV9kZXZf
Y2xlYXJfZGVwZW5kZW5jaWVzKGRldmljZSk7Cj4gK30KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9h
Y3BpL2FjcGlfYnVzLmggYi9pbmNsdWRlL2FjcGkvYWNwaV9idXMuaAo+IGluZGV4IGFhZDFhOTVl
Njg2My4uYzAwYjUyM2E2ZWJkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvYWNwaS9hY3BpX2J1cy5o
Cj4gKysrIGIvaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmgKPiBAQCAtOTk2LDYgKzk5Niw3IEBAIGlu
dCBhY3BpX3dhaXRfZm9yX2FjcGlfaXBtaSh2b2lkKTsKPgo+ICBpbnQgYWNwaV9zY2FuX2FkZF9k
ZXAoYWNwaV9oYW5kbGUgaGFuZGxlLCBzdHJ1Y3QgYWNwaV9oYW5kbGVfbGlzdCAqZGVwX2Rldmlj
ZXMpOwo+ICB1MzIgYXJjaF9hY3BpX2FkZF9hdXRvX2RlcChhY3BpX2hhbmRsZSBoYW5kbGUpOwo+
ICt2b2lkIGFyY2hfYWNwaV9wY2lfcm9vdF9hZGRfY2xlYXJfZGVwKHN0cnVjdCBhY3BpX2Rldmlj
ZSAqZGV2aWNlKTsKPiAgI2Vsc2UgIC8qIENPTkZJR19BQ1BJICovCj4KPiAgc3RhdGljIGlubGlu
ZSBpbnQgcmVnaXN0ZXJfYWNwaV9idXNfdHlwZSh2b2lkICpidXMpIHsgcmV0dXJuIDA7IH0KPiAt
LQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
