Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C759CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGqrprH2gKM/XvYNz85Aj4vAfreMoQRSflATwjih+Kw=; b=pG/PsOalxbs1rk
	Y2KkDjemvsa7Oldilxg27C6LlTcNeOmj8+6rpkWWaq2bHjDAQrNk2yhqus6/PS8zt6vJ1Wzucwh1P
	hkoiFCbHqwXrbqyj8Dy0rvq09IfoeJ3Z2AICzXetkLxHzgSfsoIKr/PcCieFxcBBSfUoo7R4zkh8C
	d05UcEYaU7925iluZNdgW+XrKeEAHM+OXCtMjH9MTiA29BhHJtajvag6xrD6Go0yAgGv3B6C5xq7S
	zd0hIhiLamMaJYE4tWM+DftCq8E/6FfW1k0h2dlibImgAu6dWENFYgHO22m9p2EgQew4+YPN2xZ7k
	mjS3KpCls6qUflIq5WTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJArV-000000097El-46LC;
	Sat, 02 May 2026 13:58:29 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJArR-000000097Dk-3uiA
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 13:58:28 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.122])
	by APP-03 (Coremail) with SMTP id rQCowAAnDOPsAvZpzmzfDw--.27778S2;
	Sat, 02 May 2026 21:58:05 +0800 (CST)
Message-ID: <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Manivannan Sadhasivam <mani@kernel.org>, Han Gao <gaohan@iscas.ac.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <u.kleine-koenig@baylibre.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>,  Lukas Wunner <lukas@wunner.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Kees Cook	
 <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	linux-pci@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Han Gao
 <rabenda.cn@gmail.com>, Inochi Amaoto	 <inochiama@gmail.com>, Vivian Wang
 <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 	stable@vger.kernel.org
Date: Sat, 02 May 2026 21:58:04 +0800
In-Reply-To: <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
	 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
	 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnDOPsAvZpzmzfDw--.27778S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4UKr43uF17AF18Gw1ftFb_yoW5tF1rpF
	Z5GasYyr40gFyUKw4UXw18CFyDua1vy34Fkr9IgayxuanIyr95Xrs2qr98KFsrXFsrXF1Y
	qwn8Ww13GayDuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07bxNV9UUUUU=
X-Originating-IP: [112.94.102.122]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_065826_346947_F9AE627E 
X-CRM114-Status: GOOD (  20.17  )
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

5ZyoIDIwMjYtMDUtMDHkupTnmoQgMjI6MjMgKzA1MzDvvIxNYW5pdmFubmFuIFNhZGhhc2l2YW3l
hpnpgZPvvJoKPiBPbiBXZWQsIEFwciAwMSwgMjAyNiBhdCAwMTo1Njo1OEFNICswODAwLCBIYW4g
R2FvIHdyb3RlOgo+ID4gU0cyMDQyJ3MgUENJZSByb290IHBvcnRzIFsxZjFjOjIwNDJdIGZhaWwg
dG8gZGVsaXZlciBNU0kgaW50ZXJydXB0cwo+ID4gdG8KPiA+IGRvd25zdHJlYW0gZGV2aWNlcyB3
aGVuIG5hdGl2ZSBwb3J0IHNlcnZpY2VzIGFyZSBlbmFibGVkLiBEZXZpY2VzCj4gPiB1bmRlcgo+
ID4gYW4gYWZmZWN0ZWQgcm9vdCBwb3J0IHJlY2VpdmUgemVybyBpbnRlcnJ1cHRzIGRlc3BpdGUg
c3VjY2Vzc2Z1bAo+ID4gdmVjdG9yCj4gPiBhbGxvY2F0aW9uLCBjYXVzaW5nIGRyaXZlciB0aW1l
b3V0cyAoZS5nLiBhbWRncHUgZmVuY2UgZmFsbGJhY2sKPiA+IHRpbWVyCj4gPiBleHBpcmVkIG9u
IGFsbCByaW5ncykuCj4gPiAKPiAKPiBIYXZlIHlvdSBpbnZlc3RpZ2F0ZWQgd2h5IHRoZSBlbmRw
b2ludCBpcyBub3QgYWJsZSB0byBkZWxpdmVyIE1TSXMgdG8KPiBob3N0IHdoZW4KPiBQb3J0IHNl
cnZpY2VzIGFyZSBlbmFibGVkPyBJcyBpdCBiZWNhdXNlIHRoZSBwb3J0ZHJ2IGRyaXZlciBjb25z
dW1lcwo+IGFsbCBNU0lzIG9yCj4gTVNJcyBhcmUgbWFza2VkIGluIGh3IChpZiBzbyB3aHk/IGR1
ZSB0byBoYXJkd2FyZSBpc3N1ZT8pIG9yCj4gc29tZXRoaW5nIGVsc2U/CgpUaGUgcHJvYmxlbSBp
cyB0aGF0IHRoZSBNU0kgY29udHJvbGxlciBoYXMgb25seSAxNiBNU0lzIHVzYWJsZSAoaXQncwp3
cm9uZ2x5IGRlc2NyaWJlZCBhcyAzMiBwcmV2aW91c2x5LCBhIGZpeCB0byB0aGlzIGlzIHBlbmRp
bmdbMV0pLCBhbmQKdGhlIGZhaWxpbmcgZGV2aWNlIGhhdmUgYW4gb25ib2FyZCBQQ0llIHN3aXRj
aCwgd2hpY2ggY3JlYXRlZCBtYW55IFBDSWUKcG9ydHMgKGFuZCBjb3JyZXNwb25kaW5nIHBjaWVw
b3J0IGRldmljZXMpLgoKV2l0aCBwY2llcG9ydCBkZXZpY2VzIGFjdGl2YXRlZCwgMTEgTVNJcyBh
cmUgcmVxdWVzdGVkIGJ5IHRoZSBwY2llcG9ydApkcml2ZXJzIC0tIDMgU29DIFBDSWUgcG9ydHMg
YW5kIDggc3dpdGNoIGRvd25zdHJlYW0gcG9ydHMuIFRoZW4gb25seSA1Ck1TSXMgYXJlIGF2YWls
YWJsZSwgYnV0IHRoZXJlJ3JlIHN0aWxsIDEwIGRvd25zdHJlYW0tZmFjaW5nIFBDSWUgcG9ydHMK
bm93IChhbmQgNSBvZiB0aGVtIGFyZSBoYXJkd2lyZWQgdG8gb25ib2FyZCBwZXJpcGhlcmFscyku
CgpUaGFua3MsCkljZW5vd3kKClsxXQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA0
MDcxNjAxNDMuMTE4MjQzMC0xLXpoZW5neGluZ2RhQGlzY2FzLmFjLmNuLwoKPiAKPiBDdXJyZW50
bHksIHRoZSBwcm9ibGVtIGRlc2NyaXB0aW9uIGlzIHZlcnkgdmFndWUuCj4gCj4gLSBNYW5pCj4g
Cj4gPiBTZXQgUENJX0RFVl9GTEFHU19OT19QT1JUX1NFUlZJQ0VTIG9uIFNHMjA0MiByb290IHBv
cnRzIHRvIHByZXZlbnQKPiA+IHRoZQo+ID4gcG9ydCBzZXJ2aWNlIGRyaXZlciBmcm9tIHByb2Jp
bmcsIHJlc3RvcmluZyBjb3JyZWN0IE1TSSBkZWxpdmVyeS4KPiA+IAo+ID4gRml4ZXM6IDFjNzI3
NzRkZjAyOCAoIlBDSTogc2cyMDQyOiBBZGQgU29waGdvIFNHMjA0MiBQQ0llIGRyaXZlciIpCj4g
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8
Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvcGNpL3F1aXJrcy5jwqDC
oMKgIHwgMTIgKysrKysrKysrKysrCj4gPiDCoGluY2x1ZGUvbGludXgvcGNpX2lkcy5oIHzCoCAy
ICsrCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvcXVpcmtzLmMgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwo+ID4g
aW5kZXggNDg5NDZjY2E0YmU3Li5iYmRlNDgyZmY3Y2IgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L3BjaS9xdWlya3MuYwo+ID4gKysrIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPiA+IEBAIC02Mzgw
LDMgKzYzODAsMTUgQEAgc3RhdGljIHZvaWQKPiA+IHBjaV9tYXNrX3JlcGxheV90aW1lcl90aW1l
b3V0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ID4gwqBERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQ
Q0lfVkVORE9SX0lEX0dMSSwgMHg5NzUwLAo+ID4gcGNpX21hc2tfcmVwbGF5X3RpbWVyX3RpbWVv
dXQpOwo+ID4gwqBERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQQ0lfVkVORE9SX0lEX0dMSSwgMHg5
NzU1LAo+ID4gcGNpX21hc2tfcmVwbGF5X3RpbWVyX3RpbWVvdXQpOwo+ID4gwqAjZW5kaWYKPiA+
ICsKPiA+ICsvKgo+ID4gKyAqIFNHMjA0MidzIFBDSWUgcm9vdCBwb3J0cyBkbyBub3QgY29ycmVj
dGx5IGRlbGl2ZXIgTVNJCj4gPiBpbnRlcnJ1cHRzIHRvCj4gPiArICogZG93bnN0cmVhbSBkZXZp
Y2VzIHdoZW4gbmF0aXZlIFBDSWUgcG9ydCBzZXJ2aWNlcyBhcmUgZW5hYmxlZC4KPiA+IEFsbAo+
ID4gKyAqIHNlcnZpY2VzIGluY2x1ZGluZyBid2N0cmwgbXVzdCBiZSBkaXNhYmxlZCwgZXF1aXZh
bGVudCB0bwo+ID4gcGNpZV9wb3J0cz1jb21wYXQuCj4gPiArICovCj4gPiArc3RhdGljIHZvaWQg
cXVpcmtfc2cyMDQyX25vX3BvcnRfc2VydmljZXMoc3RydWN0IHBjaV9kZXYgKmRldikKPiA+ICt7
Cj4gPiArCXBjaV9pbmZvKGRldiwgIlNHMjA0MjogZGlzYWJsaW5nIG5hdGl2ZSBQQ0llIHBvcnQK
PiA+IHNlcnZpY2VzXG4iKTsKPiA+ICsJZGV2LT5kZXZfZmxhZ3MgfD0gUENJX0RFVl9GTEFHU19O
T19QT1JUX1NFUlZJQ0VTOwo+ID4gK30KPiA+ICtERUNMQVJFX1BDSV9GSVhVUF9FQVJMWShQQ0lf
VkVORE9SX0lEX1NPUEhHTywgMHgyMDQyLAo+ID4gcXVpcmtfc2cyMDQyX25vX3BvcnRfc2Vydmlj
ZXMpOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGNpX2lkcy5oIGIvaW5jbHVkZS9s
aW51eC9wY2lfaWRzLmgKPiA+IGluZGV4IDQwNmFiZjYyOWJlMi4uOTY2M2JlNTI2ZGQwIDEwMDY0
NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9wY2lfaWRzLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvcGNpX2lkcy5oCj4gPiBAQCAtMjYzMCw2ICsyNjMwLDggQEAKPiA+IMKgCj4gPiDCoCNkZWZp
bmUgUENJX1ZFTkRPUl9JRF9DWEwJCTB4MWU5OAo+ID4gwqAKPiA+ICsjZGVmaW5lIFBDSV9WRU5E
T1JfSURfU09QSEdPCQkweDFmMWMKPiA+ICsKPiA+IMKgI2RlZmluZSBQQ0lfVkVORE9SX0lEX1RF
SFVUSQkJMHgxZmM5Cj4gPiDCoCNkZWZpbmUgUENJX0RFVklDRV9JRF9URUhVVElfMzAwOQkweDMw
MDkKPiA+IMKgI2RlZmluZSBQQ0lfREVWSUNFX0lEX1RFSFVUSV8zMDEwCTB4MzAxMAo+ID4gLS0g
Cj4gPiAyLjQ3LjMKPiA+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
