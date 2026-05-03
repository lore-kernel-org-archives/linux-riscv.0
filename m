Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB85FF886F
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1cX0Ugrw6949Zl0vFh6S5tBeMnKRJC3WULVs9j9p/I=; b=WLwlZQjEkjPuhC
	D7wOFGHThknG/3+wAIJPDLhpciQ93DWYWf8i1kKdMI75qKEznCRgM1RETulgt4bf+BKwj+DztFXEK
	oZeK1agbX5LX43a07tMwQ0ZxzXuU82nekCV1d5wIf2lXVAlRZATbeEXnHiNACJTBL+kGEAAds+ibb
	lSILXrtJB8aK9Q4Ab1/KBq029p9F2zfF9XSsx7EWoXV/tBDlOe6Uc0vleJeQ4cQgAyR5hqPqK+lTw
	QJHKfhgk6aZJD/+lhwCi3LkJ0P5bNZzQXLsOKSYe9ZN1kfiJBIiRE035Bd+FRbUlh06c0b1v8vmvt
	dJVrJcZHxd54/eK2rEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJQzL-0000000AWL8-035z;
	Sun, 03 May 2026 07:11:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJQzH-0000000AWKV-0n75
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 07:11:37 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.122])
	by APP-01 (Coremail) with SMTP id qwCowACXP2sD9fZpjdgiDw--.44921S2;
	Sun, 03 May 2026 15:10:59 +0800 (CST)
Message-ID: <68d4a49bf1df785ae906fbc2dd16e64b667ca5f0.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Lukas Wunner <lukas@wunner.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Bjorn Helgaas <bhelgaas@google.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>,  Jonathan Cameron
 <jonathan.cameron@huawei.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Kees Cook <kees@kernel.org>, Chen Wang
 <unicorn_wang@outlook.com>, linux-pci@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, Inochi
 Amaoto	 <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao
 Zi <me@ziyao.cc>, 	stable@vger.kernel.org
Date: Sun, 03 May 2026 15:10:58 +0800
In-Reply-To: <afZUxYhkCQ0wG0Uu@wunner.de>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
	 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
	 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
	 <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
	 <afZUxYhkCQ0wG0Uu@wunner.de>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXP2sD9fZpjdgiDw--.44921S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry5WFyDJrWDXr4UKFy7Awb_yoW5JFWUpF
	W7K3Wqkr4qqFyxtw1DG3yxJryrAw48Aw4rJ3s8tryUAas8JryfXrn7Kas8WrsrGF1fZFyY
	vrWrCF1rC3ykXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYsSdPUUUUU==
X-Originating-IP: [112.94.102.122]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_001135_627435_69232F94 
X-CRM114-Status: GOOD (  22.63  )
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

5ZyoIDIwMjYtMDUtMDLlha3nmoQgMjE6NDcgKzAyMDDvvIxMdWthcyBXdW5uZXLlhpnpgZPvvJoK
PiBPbiBTYXQsIE1heSAwMiwgMjAyNiBhdCAwOTo1ODowNFBNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgTVNJIGNvbnRyb2xsZXIgaGFzIG9u
bHkgMTYgTVNJcyB1c2FibGUKPiA+IChpdCdzCj4gPiB3cm9uZ2x5IGRlc2NyaWJlZCBhcyAzMiBw
cmV2aW91c2x5LCBhIGZpeCB0byB0aGlzIGlzIHBlbmRpbmdbMV0pLAo+ID4gYW5kCj4gPiB0aGUg
ZmFpbGluZyBkZXZpY2UgaGF2ZSBhbiBvbmJvYXJkIFBDSWUgc3dpdGNoLCB3aGljaCBjcmVhdGVk
IG1hbnkKPiA+IFBDSWUKPiA+IHBvcnRzIChhbmQgY29ycmVzcG9uZGluZyBwY2llcG9ydCBkZXZp
Y2VzKS4KPiAKPiBJcyB0aGUgU0cyMDQyIG9ubHkgdXNlZCBpbiB0aGF0IHNpbmdsZSBwcm9kdWN0
P8KgIElmIGl0IGlzIHVzZWQgaW4KPiBvdGhlcgo+IHByb2R1Y3RzIHdoaWNoIGRvIG5vdCBoYXZl
IGFuIG9uLWJvYXJkIFBDSWUgc3dpdGNoLCB3aHkgZG8geW91IHdhbnQKPiB0bwo+IGRpc2FibGUg
TVNJcyBvbiB0aG9zZSBvdGhlciBwcm9kdWN0cyBhcyB3ZWxsPwoKSXQncyB1c2VkIGluIG11bHRp
cGxlIHByb2R1Y3RzLCBidXQgb25seSBvbmUgb2YgdGhlbSAoRVZCdjEsIHdoaWNoIGlzCmp1c3Qg
YW4gZWFybHkgRVZCIGF2YWlsYWJsZSBmb3IgYSBmZXcgcGVvcGxlIGluY2x1ZGluZyBtZSkgbGFj
a3MgYW4Kb25ib2FyZCBzd2l0Y2gsIGJlY2F1c2UgU0cyMDQyIGlzIHNob3J0IG9uIG9uLWNoaXAg
cGVyaXBoZXJhbHMuIEFsbApvdGhlciBkZXZpY2VzIChpbmNsdWRpbmcgdHdvIG1haW5saW5lZCBv
bmVzLCBFVkJ2MiBhbmQgTWlsay1WIFBpb25lZXIsCmFuZCB1bm1haW5saW5lZCBkdWFsIHNvY2tl
dCByYWNrIHNlcnZlcnM7IE1pbGstViBQaW9uZWVyIHNob3VsZCBiZSB0aGUKbW9zdCBwb3B1bGFy
IGRldmljZSBiZWNhdXNlIGl0IHdhcyBvbiBzaGVsZikgaGF2ZSBhbiBvbmJvYXJkIHN3aXRjaCB0
bwptaXRpZ2F0ZSB0aGUgbGFjayBvZiBvbi1jaGlwIHBlcmlwaGVyYWxzIGluIFNHMjA0Mi4KCj4g
Cj4gTXkgcG9pbnQgaXMsIHlvdSB3YW50IHRvIGNvbnN0cmFpbiB0aGlzIHRvIGEgc3BlY2lmaWMg
cHJvZHVjdCwgbm90IHRvCj4gdGhlIFNvQy7CoCBDYW4geW91IG1heWJlIHNvbHZlIHRoaXMgYnkg
bm90IHNwZWNpZnlpbmcgaW50ZXJydXB0cyBpbgo+IHRoZQo+IGRldmljZXRyZWUgZm9yIHRoZSBQ
Q0llIHN3aXRjaD8KClRoZSBQQ0llIHN3aXRjaGVzIGFyZSBub3QgZGVzY3JpYmVkIGluIHRoZSBk
ZXZpY2UgdHJlZSBhdCBhbGwsIGJlY2F1c2UKdGhleSdyZSBhbGwganVzdCBkaXNjb3ZlcmFibGU7
IGNhbiB3ZSBkZXNjcmliZSB0aGVtIGluIHRoZSBEVCBhbmQKcmVkaXJlY3QgdGhlaXIgaW50ZXJy
dXB0cyB0byB2b2lkPwoKPiAKPiA+IFdpdGggcGNpZXBvcnQgZGV2aWNlcyBhY3RpdmF0ZWQsIDEx
IE1TSXMgYXJlIHJlcXVlc3RlZCBieSB0aGUKPiA+IHBjaWVwb3J0Cj4gPiBkcml2ZXJzIC0tIDMg
U29DIFBDSWUgcG9ydHMgYW5kIDggc3dpdGNoIGRvd25zdHJlYW0gcG9ydHMuIFRoZW4KPiA+IG9u
bHkgNQo+ID4gTVNJcyBhcmUgYXZhaWxhYmxlLCBidXQgdGhlcmUncmUgc3RpbGwgMTAgZG93bnN0
cmVhbS1mYWNpbmcgUENJZQo+ID4gcG9ydHMKPiA+IG5vdyAoYW5kIDUgb2YgdGhlbSBhcmUgaGFy
ZHdpcmVkIHRvIG9uYm9hcmQgcGVyaXBoZXJhbHMpLgo+IAo+IHBjaWVwb3J0IGNhbiBtYWtlIGRv
IHdpdGggYSBzaW5nbGUgTVNJIHZlY3RvciBiZWNhdXNlIGFsbCBwb3J0Cj4gc2VydmljZXMKPiBz
dXBwb3J0IGEgc2hhcmVkIGludGVycnVwdC7CoCBCdXQgSSBhc3N1bWUgeW91ciBwb2ludCBpcyB0
aGF0IHRoaXMKPiBwYXJ0aWN1bGFyIHByb2R1Y3QgaGFzIHNvIG1hbnkgUENJZSBwb3J0cyB0aGF0
IHlvdSdyZSBzdGlsbCBjbG9zZQo+IHRvIHRoZSAxNiBNU0lzIGxpbWl0PwoKWWVzLCBkaWZmZXJl
bnQgc2VydmljZXMgb2YgdGhlIHNhbWUgcG9ydCBhcmUgbm93IHNoYXJpbmcgYSBzaW5nbGUgTVNJ
Cih0aGUgMyBuYXRpdmUgcG9ydHMgaGF2ZSBQTUUsIGFlcmRydiwgYndjdHJsIHNoYXJpbmcgdGhl
IHNhbWUgSVJRIHdoaWxlCnRoZSBvbmx5IHNlcnZpY2UgYXZhaWxhYmxlIGZvciBzd2l0Y2ggZG93
bnN0cmVhbSBwb3J0cyBpcyBid2N0cmwpLgpIb3dldmVyIHRoZXJlJ3JlIDExIHBvcnRzICgzIG5h
dGl2ZSBwb3J0cyArIDggc3dpdGNoIGRvd25zdHJlYW0gcG9ydHMpLApzbyB0aGlzIHN0aWxsIGxl
YXZlcyB0b28gZmV3IHJvb20gZm9yIG90aGVyIGNhcmRzLgoKVGhhbmtzLApJY2Vub3d5Cgo+IAo+
IFRoYW5rcywKPiAKPiBMdWthcwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
