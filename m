Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C33C6FD19
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/tE0iBNh4oYYMEegXx8zAndxaVCvcaERhQysOqZaJk=; b=rds2dWGiTOFbbc
	AReUodKNSwWzLc/n+3jaumQipvDv/FnjYGz2hZnZXfALOXixU9wns3J2osPXPQsUqt4oEAoXvA7y/
	njtjn8AZ+lONO5LshbAoFgRGbBAmJiLA5OxEpM0DjVlRqY1N/Egy8UcVDA1RQUo9i3fYNCr7o2Vnh
	dvUsgDOC3IggLqLZMMXO1Jqm8ERn9mQHAutxZqdu06uNtgildoltZmj5k90TiRW/mpBo+6k0/2F+7
	FVd5pnFB2eUz9CyKNPq7BiV2e3RhhAKkSeX5nSgvZz6Qx9CVDnvq4BgXa1PAQECNVlvYXG7JL70Yf
	3ODfzPeC3b42jHH+SEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYvV-0049kP-5b; Mon, 13 Mar 2023 03:32:45 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYvO-0049iL-B0
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:32:43 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 32D3W50e044563;
	Mon, 13 Mar 2023 11:32:05 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from APC323 (10.0.12.101) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Mon, 13 Mar 2023 11:32:03 +0800
Date: Mon, 13 Mar 2023 11:32:27 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Guo Ren <guoren@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <sergey.matyukevich@syntacore.com>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <x5710999x@gmail.com>, <tim609@andestech.com>,
        <peterlin@andestech.com>, <ycliang@andestech.com>
Subject: Re: [PATCH] riscv: mm: Fix incorrect ASID argument when flushing TLB
Message-ID: <ZA6ZS3hIXWR9PeXV@APC323>
References: <20230310103144.396214-1-dylan@andestech.com>
 <CAJF2gTTwEJNmee7TcbdbcmLQKTTWpokrUST4xanyreUJHxETqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTwEJNmee7TcbdbcmLQKTTWpokrUST4xanyreUJHxETqg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Originating-IP: [10.0.12.101]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 32D3W50e044563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_203238_850516_A87697A4 
X-CRM114-Status: GOOD (  19.35  )
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

T24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgMDg6NDA6NTlQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIE1hciAxMCwgMjAyMyBhdCA2OjMy4oCvUE0gRHlsYW4gSmhvbmcgPGR5bGFuQGFu
ZGVzdGVjaC5jb20+IHdyb3RlOgo+ID4KPiA+IEN1cnJlbnRseSwgd2UgcGFzcyB0aGUgQ09OVEVY
VElEIGluc3RlYWQgb2YgdGhlIEFTSUQgdG8gdGhlIFRMQiBmbHVzaAo+ID4gZnVuY3Rpb24uIFdl
IHNob3VsZCBvbmx5IHRha2UgdGhlIEFTSUQgZmllbGQgdG8gcHJldmVudCBmcm9tIHRvdWNoaW5n
Cj4gPiB0aGUgcmVzZXJ2ZWQgYml0IGZpZWxkLgo+ID4KPiA+IEZpeGVzOiAzZjFlNzgyOTk4Y2Qg
KCJyaXNjdjogYWRkIEFTSUQtYmFzZWQgdGxiZmx1c2hpbmcgbWV0aG9kcyIpCj4gPiBTaWduZWQt
b2ZmLWJ5OiBEeWxhbiBKaG9uZyA8ZHlsYW5AYW5kZXN0ZWNoLmNvbT4KPiA+IC0tLQo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgKysKPiA+ICBhcmNoL3Jpc2N2L21t
L2NvbnRleHQuYyAgICAgICAgICAgfCAzICsrLQo+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
YyAgICAgICAgICB8IDIgKy0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBpbmRl
eCA5MDdiOWVmZDM5YTguLjU5N2Q2ZDhhZWMyOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90
bGJmbHVzaC5oCj4gPiBAQCAtMTIsNiArMTIsOCBAQAo+ID4gICNpbmNsdWRlIDxhc20vZXJyYXRh
X2xpc3QuaD4KPiA+Cj4gPiAgI2lmZGVmIENPTkZJR19NTVUKPiA+ICtleHRlcm4gdW5zaWduZWQg
bG9uZyBhc2lkX21hc2s7Cj4gPiArCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNo
X3RsYl9hbGwodm9pZCkKPiA+ICB7Cj4gPiAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgi
c2ZlbmNlLnZtYSIgOiA6IDogIm1lbW9yeSIpOwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bW0vY29udGV4dC5jIGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiA+IGluZGV4IDgwY2U5Y2Fi
YThkMi4uYTZiNzZiMzNlMzc3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9jb250ZXh0
LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jCj4gPiBAQCAtMjIsNyArMjIsOCBA
QCBERUZJTkVfU1RBVElDX0tFWV9GQUxTRSh1c2VfYXNpZF9hbGxvY2F0b3IpOwo+ID4KPiA+ICBz
dGF0aWMgdW5zaWduZWQgbG9uZyBhc2lkX2JpdHM7Cj4gPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
bnVtX2FzaWRzOwo+ID4gLXN0YXRpYyB1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPiA+ICt1bnNp
Z25lZCBsb25nIGFzaWRfbWFzazsKPiA+ICtFWFBPUlRfU1lNQk9MKGFzaWRfbWFzayk7Cj4gV2h5
IEVYUE9SVF9TWU1CT0w/IChObyBtb2R1bGUgd291bGQgdXNlIGl0IGJ5IHlvdXIgcGF0Y2guKQo+
Ck9LLiBJJ2xsIHJlbW92ZSBFWFBPUlRfU1lNQk9MIGluIHYyLgpUaGFua3MuCgo+ID4KPiA+ICBz
dGF0aWMgYXRvbWljX2xvbmdfdCBjdXJyZW50X3ZlcnNpb247Cj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4g
aW5kZXggY2U3ZGZjODFiYjNmLi5iYTRjMjcxODdjOTUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L21tL3RsYmZsdXNoLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4g
QEAgLTI3LDcgKzI3LDcgQEAgc3RhdGljIHZvaWQgX19zYmlfdGxiX2ZsdXNoX3JhbmdlKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4gICAgICAgICAvKiBjaGVj
ayBpZiB0aGUgdGxiZmx1c2ggbmVlZHMgdG8gYmUgc2VudCB0byBvdGhlciBDUFVzICovCj4gPiAg
ICAgICAgIGJyb2FkY2FzdCA9IGNwdW1hc2tfYW55X2J1dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1
X2lkczsKPiA+ICAgICAgICAgaWYgKHN0YXRpY19icmFuY2hfdW5saWtlbHkoJnVzZV9hc2lkX2Fs
bG9jYXRvcikpIHsKPiA+IC0gICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBhdG9t
aWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCk7Cj4gPiArICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBhc2lkID0gYXRvbWljX2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpICYgYXNpZF9t
YXNrOwo+ID4KPiA+ICAgICAgICAgICAgICAgICAvKgo+ID4gICAgICAgICAgICAgICAgICAqIFRM
QiB3aWxsIGJlIGltbWVkaWF0ZWx5IGZsdXNoZWQgb24gaGFydHMgY29uY3VycmVudGx5Cj4gPiAt
LQo+ID4gMi4zNC4xCj4gPgo+IAo+IAo+IC0tIAo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
