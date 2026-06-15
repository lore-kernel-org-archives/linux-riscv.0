Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C6DCD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 00:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiVHfNWuZVmgQ9JLvjleUw1h/I8bUh1IWeWhCWD1WRQ=; b=ZBmwc01tF4qU1K
	7mYFTQNM4znsh7A5gOpKvvH/pENeMc5qW276ZfPeTfFFe22b/JBYkOcT0ljHNfqmKj9hATwYzlvyf
	EoIyz7OJ1nTZByNTVmgslziAuwY0KiEk/x6+wnLDB0HrxDbWpmDG/Q5/khLyFhKiBVqSVRJKKX5bY
	95cxgDYWIOmwwDylBM/oizHq++cvkDop/H8vXC0uspbkQ+iD/zL/N1+Kl7yiN101omcgJtV/XguWa
	0YMR/A8huF2FRkW3JTvH2civF77DUo9uMG8sY7abUwuqSX3YJGOHVI7iBeP5LU8UMk5m3UDX36MxL
	yZb14jZStQ2ueGUUOH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYvO7-0000000DQ7Q-2JDV;
	Mon, 15 Jun 2026 00:41:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYvO5-0000000DQ7K-2C2Q
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 00:41:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CED260132;
	Mon, 15 Jun 2026 00:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3C51F000E9;
	Mon, 15 Jun 2026 00:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781484071;
	bh=wO+xhrsIY7D9Za7HFA+jcdc+uFRy9vZxo0r3ijKBOMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDJkSnLbAydbROsU/w2Ao1u7vkhvlnf3yIcWpGa1NWsj8v5WM9EcqfOVe4YyBmuVI
	 4TAIi1DEyQLis8OJ2a9o0m5m/5xOttqUMDDlZMifak7lBIF0OvzDkrSn0xkPHuPy3D
	 GDRpDK9IqkFHPoQdtRfP3Xm7F2ZokVnFtiKhx1LR0bF4rFQXVa3IQE9QKo4F1WJ9cc
	 Q54rzjNKu05r57NAcppKGIdufMCywYyjJmCW+weODbbymyxXpkZUgA3W4snx1b7506
	 zgp8fr53R27uqgBTo6+a+pjfv6bgiCzQ23MC5KWviAUGYoqtxE9TJnluyFbC7FGXPb
	 iQuEX01208Vrw==
Date: Mon, 15 Jun 2026 00:41:08 +0000
From: Yixun Lan <dlan@kernel.org>
To: Vincent Legoll <legoll@online.fr>
Cc: Shuwei Wu <shuwei.wu@mailbox.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for
 K1, SoC
Message-ID: <20260615004108-GKA1002079@kernel.org>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <f031e13e-d9f5-414a-b90e-a3d5a60b8d05@online.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f031e13e-d9f5-414a-b90e-a3d5a60b8d05@online.fr>
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

SGkgVmluY2VudCwKCiBQbGVhc2Ugc2VuZCB0aGUgcGF0Y2ggZGlyZWN0bHkgaW5zdGVhZCBvZiBh
dHRhY2hlZCBmaWxlLCBpdCdzIG1vcmUKZWFzeSBmb3IgcGVvcGxlIHRvIHJldmlldyBhbmQgYXBw
bHksIHN1Z2dlc3QgdG8gdXNlIGI0LCBvcgogImdpdCBzZW5kLWVtYWlsIiAob2xkIHdheSkKCgpP
biAwODo1MCBTdW4gMTQgSnVuICAgICAsIFZpbmNlbnQgTGVnb2xsIHdyb3RlOgo+IFtSRVNFTkRd
IGFzIEkgY2Fubm90IHNlZSB5ZXN0ZXJkYXkncwo+IAo+IAo+IEhlbGxvLAo+IAo+IAo+IAo+IEkg
dGVzdGVkIChvbiBPcmFuZ2VQaSBSVjIpIHRoZSBhdHRhY2hlZCBwYXRjaCBhcHBsaWVkIG92ZXIK
PiAKPiBzcGFjZW1pdC9mb3ItbmV4dCArIFNodXdlaSBXdSdzIFYzIHNlcmllcy4KPiAKPiAKPiBU
aGlzIGlzIGEgY29weS9wYXN0ZSBvZiBTaHV3ZWkgV3UncyB3b3JrLCBzbyBJIGRvbid0IGtub3cK
PiAKPiBpZiBJIGNhbiBzdWJtaXQgdGhpcyB3aXRoIG15IFNvQiBvciBpZiBpdCBzaG91bGQgYmUg
ZG9uZQo+IApJdCdzIG9rIHRvIGFkZCB5b3VyIFNvQiB3aGlsZSBhZGRpbmcgc3VwcG9ydCBmb3Ig
bmV3IGJvYXJkCgo+IGRpZmZlcmVudGx5LCBwbGVhc2UgYWR2aXNlLgo+IAo+IAo+IEFueXdheXMs
IHlvdSBjYW4gYWRkIG15Ogo+IAo+IFRlc3RlZC1ieTogVmluY2VudCBMZWdvbGwgPHZpbmNlbnQu
bGVnb2xsQGdtYWlsLmNvbT4gIyBPcmFuZ2VQaS1SVjIKPiAKPiAKPiBUbyB0aGUgcmVsZXZhbnQg
cGF0Y2hlcyBmcm9tIHlvdXIgc2VyaWVzLCBpZiB0aGF0J3MgdXNlZnVsLAo+IAo+IGJlY2F1c2Ug
aXQgbG9va3MgbGlrZSBpdCBpcyB3b3JraW5nIHByb3Blcmx5Ogo+IAo+IAo+IE9uIFZvaWQgbGlu
dXggKG11c2wgbGliYyk6Cj4gCj4gCj4gdW5hbWUgLWEKPiBMaW51eCBvcGlydjIgNy4xLjAtcmMx
LTAwMDQzLWdiODYwYmNhMTNiZTQgIzE0IFNNUCBQUkVFTVBUIFNhdCBKdW4gMTMgCj4gMTE6MDI6
MTMgQ0VTVCAyMDI2IHJpc2N2NjQgR05VL0xpbnV4Cj4gCj4gYXdrIC0tdmVyc2lvbiB8IGhlYWQg
LTEKPiBHTlUgQXdrIDUuMy4yLCBBUEkgNC4wCj4gCj4gZWNobyB1c2Vyc3BhY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHVmcmVxL3BvbGljeTAvc2NhbGluZ19nb3Zlcm5vcgo+IAo+IGVj
aG8gMTYwMDAwMCA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9zY2FsaW5n
X3NldHNwZWVkCj4gdGltZSBhd2sgJ0JFR0lOe2ZvcihpPTA7aTwxMDAwMDAwO2krKyl7fX0nCj4g
cmVhbMKgIMKgIDBtMC4zMDBzCj4gdXNlcsKgIMKgIDBtMC4yOTlzCj4gc3lzwqAgwqAgwqAwbTAu
MDAxcwo+IAo+IGVjaG8gMTIyODgwMCA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1
ZnJlcS9zY2FsaW5nX3NldHNwZWVkCj4gdGltZSBhd2sgJ0JFR0lOe2ZvcihpPTA7aTwxMDAwMDAw
O2krKyl7fX0nCj4gcmVhbMKgIMKgIDBtMC40MzJzCj4gdXNlcsKgIMKgIDBtMC40MjlzCj4gc3lz
wqAgwqAgwqAwbTAuMDA0cwo+IAo+IGVjaG8gMTAwMDAwMCA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTAvY3B1ZnJlcS9zY2FsaW5nX3NldHNwZWVkCj4gdGltZSBhd2sgJ0JFR0lOe2Zvcihp
PTA7aTwxMDAwMDAwO2krKyl7fX0nCj4gcmVhbMKgIMKgIDBtMC40NzZzCj4gdXNlcsKgIMKgIDBt
MC40NzZzCj4gc3lzwqAgwqAgwqAwbTAuMDAxcwo+IAo+IGVjaG8gODE5MDAwID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfc2V0c3BlZWQKPiB0aW1lIGF3ayAn
QkVHSU57Zm9yKGk9MDtpPDEwMDAwMDA7aSsrKXt9fScKPiByZWFswqAgwqAgMG0wLjU4MnMKPiB1
c2VywqAgwqAgMG0wLjU4MXMKPiBzeXPCoCDCoCDCoDBtMC4wMDFzCj4gCj4gZWNobyA2MTQ0MDAg
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUwL2NwdWZyZXEvc2NhbGluZ19zZXRzcGVlZAo+
IHRpbWUgYXdrICdCRUdJTntmb3IoaT0wO2k8MTAwMDAwMDtpKyspe319Jwo+IHJlYWzCoCDCoCAw
bTAuNzc4cwo+IHVzZXLCoCDCoCAwbTAuNzczcwo+IHN5c8KgIMKgIMKgMG0wLjAwNXMKPiAKPiAt
LSAKPiAKPiBWaW5jZW50IExlZ29sbAo+IAoKPiBGcm9tIDk5MjQ3ODk2NTVhZTVmNGY5OGU3YTVj
ZGMzZGYzZjM0ZTdiZmI2NTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogVmluY2Vu
dCBMZWdvbGwgPHZpbmNlbnQubGVnb2xsQGdtYWlsLmNvbT4KPiBEYXRlOiBTYXQsIDEzIEp1biAy
MDI2IDEwOjQ5OjM0ICswMjAwCj4gU3ViamVjdDogW1BBVENIXSByaXNjdjogZHRzOiBzcGFjZW1p
dDogb3JhbmdlcGktcnYyOiBBZGQgY3B1IHNjYWxpbmcgZm9yIEsxCj4gIFNvQwo+IAo+IEVuYWJs
ZSBDUFUgRFZGUyBvbiBPcmFuZ2VQaSBSVjIKPiAKLi4KPiBUaGlzIGlzIGEgY29weS9wYXN0ZSBm
cm9tIFNodXdlaSBXdSdzIEJQSS1GMyBEVFMgbW9kaWZpY2F0aW9ucwo+IApJdCdzIHF1aXRlIGNv
bW1vbiB0aGF0IHBlb3BsZSBkbyBjb3B5L3Bhc3RlIGZvciBhZGRpdGlvbmFsIGJvYXJkCnN1cHBv
cnQsIG5vIG5lZWQgdG8gbWVudGlvbiBpdCBpbiBjb21taXQgbWVzc2FnZSB3aGljaCBJIHRoaW5r
IGl0Cmlzbid0IHJlYWxseSB1c2VmdWwKCgo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgTGVnb2xs
IDx2aW5jZW50LmxlZ29sbEBnbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi9ib290L2R0cy9zcGFjZW1p
dC9rMS1vcmFuZ2VwaS1ydjIuZHRzICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gaW5kZXgg
N2M0OWJjZTQyN2YzLi42MmQyNWY1NzlhZjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gKysrIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gQEAgLTgsNiArOCw3IEBACj4gIAo+
ICAjaW5jbHVkZSAiazEuZHRzaSIKPiAgI2luY2x1ZGUgImsxLXBpbmN0cmwuZHRzaSIKPiArI2lu
Y2x1ZGUgImsxLW9wcC5kdHNpIgprZWVwIGFscGhhYmV0IHNvcnRlZAo+ICAKPiAgLyB7Cj4gIAlt
b2RlbCA9ICJPcmFuZ2VQaSBSVjIiOwo+IEBAIC04MCw2ICs4MSwzOCBAQCAmY29tYm9fcGh5IHsK
PiAgCXN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPiAgCj4gKyZjcHVfMCB7Cj4gKyAgICAgICBjcHUt
c3VwcGx5ID0gPCZidWNrMV8wdjk+Owo+ICt9Owo+ICsKPiArJmNwdV8xIHsKPiArICAgICAgIGNw
dS1zdXBwbHkgPSA8JmJ1Y2sxXzB2OT47Cj4gK307Cj4gKwo+ICsmY3B1XzIgewo+ICsgICAgICAg
Y3B1LXN1cHBseSA9IDwmYnVjazFfMHY5PjsKPiArfTsKPiArCj4gKyZjcHVfMyB7Cj4gKyAgICAg
ICBjcHUtc3VwcGx5ID0gPCZidWNrMV8wdjk+Owo+ICt9Owo+ICsKPiArJmNwdV80IHsKPiArICAg
ICAgIGNwdS1zdXBwbHkgPSA8JmJ1Y2sxXzB2OT47Cj4gK307Cj4gKwo+ICsmY3B1XzUgewo+ICsg
ICAgICAgY3B1LXN1cHBseSA9IDwmYnVjazFfMHY5PjsKPiArfTsKPiArCj4gKyZjcHVfNiB7Cj4g
KyAgICAgICBjcHUtc3VwcGx5ID0gPCZidWNrMV8wdjk+Owo+ICt9Owo+ICsKPiArJmNwdV83IHsK
PiArICAgICAgIGNwdS1zdXBwbHkgPSA8JmJ1Y2sxXzB2OT47Cj4gK307Cj4gKwo+ICAmZW1tYyB7
Cj4gIAlidXMtd2lkdGggPSA8OD47Cj4gIAltbWMtaHM0MDAtMV84djsKPiBAQCAtMTYyLDcgKzE5
NSw3IEBAIHBtaWNANDEgewo+ICAJCWRsZG9pbjItc3VwcGx5ID0gPCZidWNrNT47Cj4gIAo+ICAJ
CXJlZ3VsYXRvcnMgewo+IC0JCQlidWNrMSB7Cj4gKwkJCWJ1Y2sxXzB2OTogYnVjazEgewo+ICAJ
CQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwPjsKPiAgCQkJCXJlZ3VsYXRvci1t
YXgtbWljcm92b2x0ID0gPDM0NTAwMDA+Owo+ICAJCQkJcmVndWxhdG9yLXJhbXAtZGVsYXkgPSA8
NTAwMD47Cj4gLS0gCj4gMi41NC4wCj4gCgoKLS0gCllpeHVuIExhbiAoZGxhbikKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
