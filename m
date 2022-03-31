Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C54C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pseQUOLGrk4sMveekD6oAwvg/xfcXhBzJXpc/nudw8I=; b=3QX69hUwy19iF3
	/KRLgkQEkiJpvxlQuDKHw4ds36RaoaIY1HEIlXdKzxoXFHO67M0agU5Ya5jwjwJ+4Xtf1ZIKSjlMS
	VVX9vQnvs9AQIqdx+MRzjNHJVEN2lVYDnnQcM4s+JSooeJj/rojl6M/LhODuSW860LeyG5JiTBTNv
	phdl4QfM4/b57E6kxmISr7+J4ORZcuhdrw4lJWOdY9EIBw1nk16xArOoQs3CZd1NpDVCXXS9MV4kS
	wFzYPPsz8cTadROE+knsglCN7mRsranMzxqkWNZrzTlzk3G4uJYJC4zF+8HoBICAS6qpr3rDRjxg1
	BjNY3odxBcWUDmF4rWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZraj-001blO-85; Thu, 31 Mar 2022 09:59:45 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZraf-001bkq-QJ
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 09:59:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 582E968AA6; Thu, 31 Mar 2022 11:59:37 +0200 (CEST)
Date: Thu, 31 Mar 2022 11:59:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu
Subject: Re: [PATCH v8 09/14] riscv: Fix accessing pfn bits in PTEs for
 non-32bit variants
Message-ID: <20220331095937.GF23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-10-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324000710.575331-10-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_025942_053370_75833CF3 
X-CRM114-Status: GOOD (  23.57  )
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

T24gVGh1LCBNYXIgMjQsIDIwMjIgYXQgMDE6MDc6MDVBTSArMDEwMCwgSGVpa28gU3R1ZWJuZXIg
d3JvdGU6Cj4gT24gcnYzMiB0aGUgUEZOIHBhcnQgb2YgUFRFcyBpcyBkZWZpbmVkIHRvIHVzZSBi
aXRzIFt4bGVuLTE6MTBdCj4gd2hpbGUgb24gcnY2NCBpdCBpcyBkZWZpbmVkIHRvIHVzZSBiaXRz
IFs1MzoxMF0sIGxlYXZpbmcgWzYzOjU0XQo+IGFzIHJlc2VydmVkLgo+IAo+IFdpdGggdXBjb21p
bmcgb3B0aW9uYWwgZXh0ZW5zaW9ucyBsaWtlIHN2cGJtdCB0aGVzZSBwcmV2aW91c2x5Cj4gcmVz
ZXJ2ZWQgYml0cyB3aWxsIGdldCB1c2VkIHNvIHNpbXBseSByaWdodC1zaGlmdGluZyB0aGUgUFRF
Cj4gdG8gZ2V0IHRoZSBQRk4gd29uJ3QgYmUgZW5vdWdoLgo+IAo+IFNvIGludHJvZHVjZSBhIF9Q
QUdFX1BGTl9NQVNLIGNvbnN0YW50IHRvIG1hc2sgdGhlIGNvcnJlY3QgYml0cwo+IGZvciBib3Ro
IHJ2MzIgYW5kIHJ2NjQgYmVmb3JlIHNoaWZ0aW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhlaWtv
IFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS0zMi5oICAgfCAgOCArKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUtNjQuaCAgIHwgMTQgKysrKysrKysrKystLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLWJpdHMuaCB8ICA2IC0tLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaCAgICAgIHwgIDYgKysrLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS0zMi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTMy
LmgKPiBpbmRleCA1YjJlNzllNWJmYTUuLmUyNjZhNGZlN2Y0MyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtMzIuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS0zMi5oCj4gQEAgLTcsNiArNyw3IEBACj4gICNkZWZpbmUgX0FTTV9SSVND
Vl9QR1RBQkxFXzMyX0gKPiAgCj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcG1k
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jb25zdC5o
Pgo+ICAKPiAgLyogU2l6ZSBvZiByZWdpb24gbWFwcGVkIGJ5IGEgcGFnZSBnbG9iYWwgZGlyZWN0
b3J5ICovCj4gQEAgLTE2LDQgKzE3LDExIEBACj4gIAo+ICAjZGVmaW5lIE1BWF9QT1NTSUJMRV9Q
SFlTTUVNX0JJVFMgMzQKPiAgCj4gKy8qCj4gKyAqIHJ2MzIgUFRFIGZvcm1hdDoKPiArICogfCBY
TEVOLTEgIDEwIHwgOSAgICAgICAgICAgICA4IHwgNyB8IDYgfCA1IHwgNCB8IDMgfCAyIHwgMSB8
IDAKPiArICogICAgICAgUEZOICAgICAgcmVzZXJ2ZWQgZm9yIFNXICAgRCAgIEEgICBHICAgVSAg
IFggICBXICAgUiAgIFYKPiArICovCj4gKyNkZWZpbmUgX1BBR0VfUEZOX01BU0sgIEdFTk1BU0so
MzEsIDEwKQoKSSBoYXZlIHRvIHNheSBJIHJlYWxseSBoYXRlIHRoaXMgb2JzZnVjYXRpbmcgR0VO
TUFTSyBtYWNyb+6AmiwgYnV0IGl0CmRvZXMgaGF2ZSBhIGZldyBvdGhlciB1c2VzIGluIHRoZSBy
aXNjdiBjb2RlLgoKPiArLyoKPiArICogcnY2NCBQVEUgZm9ybWF0Ogo+ICsgKiB8IDYzIHwgNjIg
NjEgfCA2MCA1NCB8IDUzICAxMCB8IDkgICAgICAgICAgICAgOCB8IDcgfCA2IHwgNSB8IDQgfCAz
IHwgMiB8IDEgfCAwCj4gKyAqICAgTiAgICAgIE1UICAgICBSU1YgICAgUEZOICAgICAgcmVzZXJ2
ZWQgZm9yIFNXICAgRCAgIEEgICBHICAgVSAgIFggICBXICAgUiAgIFYKPiArICovCj4KPiArI2Rl
ZmluZSBfUEFHRV9QRk5fTUFTSyAgR0VOTUFTSyg1MywgMTApCj4gKwo+ICBzdGF0aWMgaW5saW5l
IGludCBwdWRfcHJlc2VudChwdWRfdCBwdWQpCj4gIHsKPiAgCXJldHVybiAocHVkX3ZhbChwdWQp
ICYgX1BBR0VfUFJFU0VOVCk7Cj4gQEAgLTkxLDEyICs5OSwxMiBAQCBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgX3B1ZF9wZm4ocHVkX3QgcHVkKQo+ICAKPiAgc3RhdGljIGlubGluZSBwbWRf
dCAqcHVkX3BndGFibGUocHVkX3QgcHVkKQo+ICB7Cj4gLQlyZXR1cm4gKHBtZF90ICopcGZuX3Rv
X3ZpcnQocHVkX3ZhbChwdWQpID4+IF9QQUdFX1BGTl9TSElGVCk7Cj4gKwlyZXR1cm4gKHBtZF90
ICopcGZuX3RvX3ZpcnQoKHB1ZF92YWwocHVkKSAmIF9QQUdFX1BGTl9NQVNLKSA+PiBfUEFHRV9Q
Rk5fU0hJRlQpOwoKTG90cyBvZiBvdmVybHkgbG9uZyBsaW5zIG1ha2luZyB0aGlzIHByZXR0eSB1
bnJlYWRhYmxlLgoKQnV0IGluIGdlbmVyYWwgdGhlIChwZm4gJiBfUEFHRV9QRk5fTUFTSykgPj4g
X1BBR0VfUEZOX1NISUZUIGxvZ2ljCnJlYWxseSBzaG91bGQgaGF2ZSBhIGhlbHBlciBhbnl3YXku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
