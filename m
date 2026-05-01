Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A285CCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5a1njz49nyXFlsM81DeohWmwtMvcrPdFpZV9W3pa6/g=; b=05kv4qNOMTI2ZB
	nnIbvbVi69J80+N2XrbCtoxOV1NFEoegGSV6bZTpl1tRJm/Fa3LEy9m42Vb5SnNfVNCi02dLNK6pH
	SEnxVB//A7bWAdiZ6eWy+XUjTZ4OCYkDxdsQkDORFMc1d1PCHOzj2qBpF0jcmB1Kuvz378iJrvyof
	tCGNmxzEjcJ0WHu0JkFvRg5CC56jvNGTFHa9zR6mNPdFwLsPdaxuQPlo5QiHzoUwhnSM+DsYr2Q6s
	M3v5wSHLY0/CSExCj75zCogBFsG3iQ3flqKGoPcN7onumonOc9O1oG2WE3ztadHJ0zAb1p4xWw/Jz
	OfEw7H3XaZFOtVvMilcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr7z-00000007TXR-0Kr7;
	Fri, 01 May 2026 16:54:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr7y-00000007TX6-0V2C
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 16:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7799E60120;
	Fri,  1 May 2026 16:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80D7C2BCB4;
	Fri,  1 May 2026 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777654449;
	bh=56PrMhQcqP8AT3QF86gLf69QqCuuy3MnxUjgUbDZhUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S30PcIKDMLC46S80j0J9tke22W1b6vtv5JA+GSDwguH6mC/8+wl2TxL301k90R0nn
	 eLCa5RK7N20QAqhWRi3KvLSbcfvJDznVcSScx72GsYEZ9JdKC6BTLOu0jDUb9zbKUB
	 ET/WcVdeY8vwaIAA1nUbg2Qeb3zUz1nNRwzxMhLazthoBLNQJOMCZ5dsmwtDGYiAnj
	 OtogOybJzG7XBm+n8ItMtk4Vpi0yHUo2OgQZ+8yirO+iWSffob3X7OJXgxDGazX5Sx
	 YshjnfCOEMklcTX6FSCweXxkbNXvGG3mYQSNSzMDMy4Id4g5zxprDVRIkgENSRuY3/
	 Nu/G2tayN+9Rg==
Date: Fri, 1 May 2026 22:23:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Lukas Wunner <lukas@wunner.de>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, linux-pci@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
Message-ID: <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331175658.1015829-3-gaohan@iscas.ac.cn>
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

T24gV2VkLCBBcHIgMDEsIDIwMjYgYXQgMDE6NTY6NThBTSArMDgwMCwgSGFuIEdhbyB3cm90ZToK
PiBTRzIwNDIncyBQQ0llIHJvb3QgcG9ydHMgWzFmMWM6MjA0Ml0gZmFpbCB0byBkZWxpdmVyIE1T
SSBpbnRlcnJ1cHRzIHRvCj4gZG93bnN0cmVhbSBkZXZpY2VzIHdoZW4gbmF0aXZlIHBvcnQgc2Vy
dmljZXMgYXJlIGVuYWJsZWQuIERldmljZXMgdW5kZXIKPiBhbiBhZmZlY3RlZCByb290IHBvcnQg
cmVjZWl2ZSB6ZXJvIGludGVycnVwdHMgZGVzcGl0ZSBzdWNjZXNzZnVsIHZlY3Rvcgo+IGFsbG9j
YXRpb24sIGNhdXNpbmcgZHJpdmVyIHRpbWVvdXRzIChlLmcuIGFtZGdwdSBmZW5jZSBmYWxsYmFj
ayB0aW1lcgo+IGV4cGlyZWQgb24gYWxsIHJpbmdzKS4KPiAKCkhhdmUgeW91IGludmVzdGlnYXRl
ZCB3aHkgdGhlIGVuZHBvaW50IGlzIG5vdCBhYmxlIHRvIGRlbGl2ZXIgTVNJcyB0byBob3N0IHdo
ZW4KUG9ydCBzZXJ2aWNlcyBhcmUgZW5hYmxlZD8gSXMgaXQgYmVjYXVzZSB0aGUgcG9ydGRydiBk
cml2ZXIgY29uc3VtZXMgYWxsIE1TSXMgb3IKTVNJcyBhcmUgbWFza2VkIGluIGh3IChpZiBzbyB3
aHk/IGR1ZSB0byBoYXJkd2FyZSBpc3N1ZT8pIG9yIHNvbWV0aGluZyBlbHNlPwoKQ3VycmVudGx5
LCB0aGUgcHJvYmxlbSBkZXNjcmlwdGlvbiBpcyB2ZXJ5IHZhZ3VlLgoKLSBNYW5pCgo+IFNldCBQ
Q0lfREVWX0ZMQUdTX05PX1BPUlRfU0VSVklDRVMgb24gU0cyMDQyIHJvb3QgcG9ydHMgdG8gcHJl
dmVudCB0aGUKPiBwb3J0IHNlcnZpY2UgZHJpdmVyIGZyb20gcHJvYmluZywgcmVzdG9yaW5nIGNv
cnJlY3QgTVNJIGRlbGl2ZXJ5Lgo+IAo+IEZpeGVzOiAxYzcyNzc0ZGYwMjggKCJQQ0k6IHNnMjA0
MjogQWRkIFNvcGhnbyBTRzIwNDIgUENJZSBkcml2ZXIiKQo+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IC0t
LQo+ICBkcml2ZXJzL3BjaS9xdWlya3MuYyAgICB8IDEyICsrKysrKysrKysrKwo+ICBpbmNsdWRl
L2xpbnV4L3BjaV9pZHMuaCB8ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9xdWlya3MuYyBiL2RyaXZlcnMvcGNp
L3F1aXJrcy5jCj4gaW5kZXggNDg5NDZjY2E0YmU3Li5iYmRlNDgyZmY3Y2IgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9wY2kvcXVpcmtzLmMKPiArKysgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwo+IEBA
IC02MzgwLDMgKzYzODAsMTUgQEAgc3RhdGljIHZvaWQgcGNpX21hc2tfcmVwbGF5X3RpbWVyX3Rp
bWVvdXQoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gIERFQ0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBD
SV9WRU5ET1JfSURfR0xJLCAweDk3NTAsIHBjaV9tYXNrX3JlcGxheV90aW1lcl90aW1lb3V0KTsK
PiAgREVDTEFSRV9QQ0lfRklYVVBfRklOQUwoUENJX1ZFTkRPUl9JRF9HTEksIDB4OTc1NSwgcGNp
X21hc2tfcmVwbGF5X3RpbWVyX3RpbWVvdXQpOwo+ICAjZW5kaWYKPiArCj4gKy8qCj4gKyAqIFNH
MjA0MidzIFBDSWUgcm9vdCBwb3J0cyBkbyBub3QgY29ycmVjdGx5IGRlbGl2ZXIgTVNJIGludGVy
cnVwdHMgdG8KPiArICogZG93bnN0cmVhbSBkZXZpY2VzIHdoZW4gbmF0aXZlIFBDSWUgcG9ydCBz
ZXJ2aWNlcyBhcmUgZW5hYmxlZC4gQWxsCj4gKyAqIHNlcnZpY2VzIGluY2x1ZGluZyBid2N0cmwg
bXVzdCBiZSBkaXNhYmxlZCwgZXF1aXZhbGVudCB0byBwY2llX3BvcnRzPWNvbXBhdC4KPiArICov
Cj4gK3N0YXRpYyB2b2lkIHF1aXJrX3NnMjA0Ml9ub19wb3J0X3NlcnZpY2VzKHN0cnVjdCBwY2lf
ZGV2ICpkZXYpCj4gK3sKPiArCXBjaV9pbmZvKGRldiwgIlNHMjA0MjogZGlzYWJsaW5nIG5hdGl2
ZSBQQ0llIHBvcnQgc2VydmljZXNcbiIpOwo+ICsJZGV2LT5kZXZfZmxhZ3MgfD0gUENJX0RFVl9G
TEFHU19OT19QT1JUX1NFUlZJQ0VTOwo+ICt9Cj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0VBUkxZKFBD
SV9WRU5ET1JfSURfU09QSEdPLCAweDIwNDIsIHF1aXJrX3NnMjA0Ml9ub19wb3J0X3NlcnZpY2Vz
KTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wY2lfaWRzLmggYi9pbmNsdWRlL2xpbnV4
L3BjaV9pZHMuaAo+IGluZGV4IDQwNmFiZjYyOWJlMi4uOTY2M2JlNTI2ZGQwIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvcGNpX2lkcy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9wY2lfaWRz
LmgKPiBAQCAtMjYzMCw2ICsyNjMwLDggQEAKPiAgCj4gICNkZWZpbmUgUENJX1ZFTkRPUl9JRF9D
WEwJCTB4MWU5OAo+ICAKPiArI2RlZmluZSBQQ0lfVkVORE9SX0lEX1NPUEhHTwkJMHgxZjFjCj4g
Kwo+ICAjZGVmaW5lIFBDSV9WRU5ET1JfSURfVEVIVVRJCQkweDFmYzkKPiAgI2RlZmluZSBQQ0lf
REVWSUNFX0lEX1RFSFVUSV8zMDA5CTB4MzAwOQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfVEVI
VVRJXzMwMTAJMHgzMDEwCj4gLS0gCj4gMi40Ny4zCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N
4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
