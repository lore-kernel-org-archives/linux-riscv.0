Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BE3CD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXfXHGeyVwCV9xYtyIgzCrXal4hzGr6LHJYs6YBwVU4=; b=mpDlDa7dAUJRA8
	UQ1lOsH/yRa17b7HpvZOnjXWySX1V3Om8hELmRkXa/drDHBOCa2o0Ih5wZ7rjsuyQuK1ALhp1xLL9
	Aa3QMloeYzB9rjRwv2U0h90k9XcBHVxvloQt9rH965oCUbIxx12SD4ZnvQlDZwqKtWsCYTxsaKxjr
	Nz1EfXtzat6/kvxen2bI7OtUUVuzuO5lXHrADsnBd6wrICxHLGCbn7NnX8Xet9+LcUIoIZFzrEBnj
	jzx5nGogi8jw4EFuAPOwfwBvSk55jJKgGkN56lcqEVMt2PNgJ16S3PNZxlYe1VvnOMCCs/HogDJ9H
	4MdyWejCwSvdFuI4Z/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd9S-0000000145W-3WPp;
	Wed, 06 May 2026 14:23:02 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd9R-0000000144b-2SZB
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 14:23:02 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-05 (Coremail) with SMTP id zQCowAAHmQy7TvtptBGODw--.6857S2;
	Wed, 06 May 2026 22:22:52 +0800 (CST)
Message-ID: <2415c7a9e33912ac4b87176b07f6cf4db21fa57c.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>
Cc: Han Gao <gaohan@iscas.ac.cn>, Bjorn Helgaas <bhelgaas@google.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Kees Cook <kees@kernel.org>, Chen Wang	
 <unicorn_wang@outlook.com>, linux-pci@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao	 <rabenda.cn@gmail.com>, Inochi
 Amaoto <inochiama@gmail.com>, Vivian Wang	 <wangruikang@iscas.ac.cn>, Yao
 Zi <me@ziyao.cc>, stable@vger.kernel.org
Date: Wed, 06 May 2026 22:22:51 +0800
In-Reply-To: <2se24qgfmwumdpdjdcszz7l3m5rbucnp22hbidvhz6xc3p6j4i@fkb4u4hg6ha2>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
	 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
	 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
	 <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
	 <afZUxYhkCQ0wG0Uu@wunner.de>
	 <68d4a49bf1df785ae906fbc2dd16e64b667ca5f0.camel@iscas.ac.cn>
	 <afcMtlBJYeuxSqZr@wunner.de>
	 <2se24qgfmwumdpdjdcszz7l3m5rbucnp22hbidvhz6xc3p6j4i@fkb4u4hg6ha2>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHmQy7TvtptBGODw--.6857S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAry8urW3WF15KrykKr4fAFb_yoW5uF4kpF
	W7Kay8tFs8JF4Iy3ZrKw10qFyayF4DJw15C3s5GrWjvrs8WryrZryxtFyDZasrCr1xAw1a
	vrZYq348u3yDXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07b4oGdUUUUU=
X-Originating-IP: [112.94.100.82]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_072302_005600_330FFF4B 
X-CRM114-Status: GOOD (  32.35  )
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

5ZyoIDIwMjYtMDUtMDbkuInnmoQgMTk6MDkgKzA1MzDvvIxNYW5pdmFubmFuIFNhZGhhc2l2YW3l
hpnpgZPvvJoKPiBPbiBTdW4sIE1heSAwMywgMjAyNiBhdCAxMDo1MjowNkFNICswMjAwLCBMdWth
cyBXdW5uZXIgd3JvdGU6Cj4gPiBPbiBTdW4sIE1heSAwMywgMjAyNiBhdCAwMzoxMDo1OFBNICsw
ODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPiBJdCdzIHVzZWQgaW4gbXVsdGlwbGUgcHJv
ZHVjdHMsIGJ1dCBvbmx5IG9uZSBvZiB0aGVtIChFVkJ2MSwKPiA+ID4gd2hpY2ggaXMKPiA+ID4g
anVzdCBhbiBlYXJseSBFVkIgYXZhaWxhYmxlIGZvciBhIGZldyBwZW9wbGUgaW5jbHVkaW5nIG1l
KSBsYWNrcwo+ID4gPiBhbgo+ID4gPiBvbmJvYXJkIHN3aXRjaCwgYmVjYXVzZSBTRzIwNDIgaXMg
c2hvcnQgb24gb24tY2hpcCBwZXJpcGhlcmFscy4KPiA+ID4gQWxsCj4gPiA+IG90aGVyIGRldmlj
ZXMgKGluY2x1ZGluZyB0d28gbWFpbmxpbmVkIG9uZXMsIEVWQnYyIGFuZCBNaWxrLVYKPiA+ID4g
UGlvbmVlciwKPiA+ID4gYW5kIHVubWFpbmxpbmVkIGR1YWwgc29ja2V0IHJhY2sgc2VydmVyczsg
TWlsay1WIFBpb25lZXIgc2hvdWxkCj4gPiA+IGJlIHRoZQo+ID4gPiBtb3N0IHBvcHVsYXIgZGV2
aWNlIGJlY2F1c2UgaXQgd2FzIG9uIHNoZWxmKSBoYXZlIGFuIG9uYm9hcmQKPiA+ID4gc3dpdGNo
IHRvCj4gPiA+IG1pdGlnYXRlIHRoZSBsYWNrIG9mIG9uLWNoaXAgcGVyaXBoZXJhbHMgaW4gU0cy
MDQyLgo+ID4gCj4gPiBXaG8ga25vd3MsIG1heWJlIHNvbWVvbmUgd2lsbCBkZXNpZ24gYSBwcm9k
dWN0IHdoaWNoIGRvZXNuJ3QgYXR0YWNoCj4gPiBhIFBDSWUgc3dpdGNoIHRvIHRoZSBTb0MsIG1h
eWJlIHRoZSBsYWNrIG9mIHBlcmlwaGVyYWxzIGlzbid0IGEKPiA+IHByb2JsZW0gZm9yIHRoZW0u
Cj4gPiAKPiA+IEl0IHNlZW1zIHJlYXNvbmFibGUgdG8gYWNjb21tb2RhdGUgc3VjaCBub24tc3dp
dGNoIHVzZSBjYXNlcyBhcwo+ID4gd2VsbCwKPiA+IHNvIEkgdGhpbmsgeW91IGRlZmluaXRlbHkg
ZG8gbm90IHdhbnQgdG8gcXVpcmsgYWxsIHByb2R1Y3RzIHVzaW5nCj4gPiB0aGF0Cj4gPiBTb0Mg
YnV0IG9ubHkgdGhvc2UgdGhhdCBuZWVkIGl0LCByZWdhcmRsZXNzIHdoZXRoZXIgaXQncyB0aGUK
PiA+IG1ham9yaXR5Lgo+ID4gCj4gPiA+ID4gTXkgcG9pbnQgaXMsIHlvdSB3YW50IHRvIGNvbnN0
cmFpbiB0aGlzIHRvIGEgc3BlY2lmaWMgcHJvZHVjdCwKPiA+ID4gPiBub3QgdG8KPiA+ID4gPiB0
aGUgU29DLsKgIENhbiB5b3UgbWF5YmUgc29sdmUgdGhpcyBieSBub3Qgc3BlY2lmeWluZyBpbnRl
cnJ1cHRzCj4gPiA+ID4gaW4KPiA+ID4gPiB0aGUgZGV2aWNldHJlZSBmb3IgdGhlIFBDSWUgc3dp
dGNoPwo+ID4gPiAKPiA+ID4gVGhlIFBDSWUgc3dpdGNoZXMgYXJlIG5vdCBkZXNjcmliZWQgaW4g
dGhlIGRldmljZSB0cmVlIGF0IGFsbCwKPiA+ID4gYmVjYXVzZQo+ID4gPiB0aGV5J3JlIGFsbCBq
dXN0IGRpc2NvdmVyYWJsZTsgY2FuIHdlIGRlc2NyaWJlIHRoZW0gaW4gdGhlIERUIGFuZAo+ID4g
PiByZWRpcmVjdCB0aGVpciBpbnRlcnJ1cHRzIHRvIHZvaWQ/Cj4gPiAKPiA+IFllcywgc29tZWJv
ZHkgZGlkIGEgd3JpdGV1cCBob3cgdG8gcmVwcmVzZW50IHN3aXRjaGVzIGFuZCBlbmRwb2ludHMK
PiA+IGluIHRoZSBkZXZpY2V0cmVlOgo+ID4gCj4gPiBodHRwczovL2ZhcmxlcGV0LmdpdGh1Yi5p
by9saW51eC8yMDI0LzAyLzIwL3VzaW5nLWxpbnV4LWRldmljZS10cmVlLXdpdGgtcGNpZS1kZXZp
Y2VzLmh0bWwKPiA+IAo+IAo+IEkgd291bGRuJ3QgcmVjb21tZW5kIGdvaW5nIHRoaXMgZmFyLi4u
IFdlIGRvIGhhdmUgc29tZSBzd2l0Y2hlcwo+IGRlc2NyaWJlZCBpbiBEVCwKPiBidXQgdGhleSBo
YXZlIHNvbWUgcmVzb3VyY2UgcmVxdWlyZW1lbnRzIGxpa2UgcmVndWxhdG9yLCBpMmMuLi4KPiAK
PiA+IEFuZCB0aGVuIEkgd291bGQgdHJ5IHByb3ZpZGluZyBhbiBlbXB0eSAiaW50ZXJydXB0cyIg
cHJvcGVydHkgZm9yCj4gPiB0aG9zZSBzd2l0Y2ggcG9ydHMgZm9yIHdoaWNoIHlvdSB3YW50IHRv
IGF2b2lkIHBvcnQgc2VydmljZXMgYmVpbmcKPiA+IGluc3RhbnRpYXRlZC4KPiA+IAo+IAo+IFRo
ZXJlIGlzIG5vICdpbnRlcnJ1cHRzJyBwcm9wZXJ0eSBpbiBEVCBiaW5kaW5nIGZvciBQQ0kgYnJp
ZGdlIG5vZGVzLgo+IFRoZXJlIGlzCj4gJ2ludGVycnVwdC1tYXAnLCBidXQgdGhhdCdzIHVzZWQg
Zm9yIG1hcHBpbmcgSU5UeCB3aXRoIHBsYXRmb3JtCj4gaW50ZXJydXB0Cj4gY29udHJvbGxlci4K
PiAKPiBNb3Jlb3ZlciwgRFQgc2hvdWxkIGp1c3QgZGVzY3JpYmUgdGhlIGhhcmR3YXJlIHRvcG9s
b2d5L3Jlc291cmNlLCBub3QKPiBwbGF0Zm9ybSBjb25zdHJhaW50cy4KPiAKPiBJJ2QgcmVjb21t
ZW5kIGludHJvZHVjaW5nIGEgbmV3IGNtZGxpbmUgcGFyYW0gdG8gdGhlIHBvcnRkcnYgZHJpdmVy
Cj4gdG8gZGlzYWJsZQo+IHVzaW5nIE1TSXMgZm9yIHNlcnZpY2VzLiBCdXQgdGhlIHBsYXRmb3Jt
IGxpbWl0YXRpb24gd291bGQgaGl0IG9uZQoKQ3VycmVudGx5IGBwY2llX3BvcnRzPWNvbXBhdGAg
Y29tbWFuZCBsaW5lIHBhcmFtZXRlciBpcyB1c2VkIHRvCndvcmthcm91bmQgdGhlIGN1cnJlbnQg
c2l0dWF0aW9uLCBhbmQgdGhpcyBwYXRjaCBpcyBkZXNpZ25lZCB0bwppbnRlZ3JhdGUgc3VjaCB3
b3JrYXJvdW5kIGludG8gdGhlIGtlcm5lbC4KCj4gd2F5IG9yIHRoZQo+IG90aGVyIGlmIG9uZSBv
ZiB0aGUgZW5kcG9pbnRzIGNvbnN1bWUgYWxsIE1TSXMuLi4KCkkgdGhpbmsgb25lIEVQIGNsYWlt
aW5nIG11bHRpcGxlIE1TSSAobm90IE1TSS1YKSBpcyBhbiBleHRlbmRlZApjYXBhYmlsaXR5IG9m
IHRoZSBNU0kgY29udHJvbGxlciBjb250cm9sbGVkIGJ5IE1TSV9GTEFHX01VTFRJX1BDSV9NU0kK
ZmxhZywgd2hpY2ggaXNuJ3Qgc3VwcG9ydGVkIGZvciB0aGUgU0cyMDQyIE1TSSBjb250cm9sbGVy
IGRyaXZlci4KCkluIGZhY3QgdGhlIFNHMjA0MiBNU0kgY29udHJvbGxlciBpc24ndCBvcmlnaW5h
bGx5IGRlc2lnbmVkIGZvciBQQ0llCk1TSXMgLS0gb25lIGJpdCBpbiBpdHMgZG9vcmJlbGwgcmVn
aXN0ZXIgY29ycmVzcG9uZHMgdG8gb25lIGludGVycnVwdC4KSXQncyB3aHkgdGhlcmUncyBvbmx5
IDE2IE1TSXMgYXZhaWxhYmxlIChvbmx5IG9uZSBkb29yYmVsbCByZWdpc3RlciBpcwphdmFpbGFi
bGUgYW5kIHRoZSBQQ0kgTVNJIHJlc3RyaWN0cyB0byAxNi1iaXQgbWVzc2FnZSBkYXRhKSwgYW5k
IGFsc28Kd2h5IG11bHRpcGxlIFBDSSBNU0kgaXNuJ3Qgc3VwcG9ydGVkIChtdWx0aXBsZSBQQ0kg
TVNJcyBtdXN0IGhhdmUKY29uc2VjdXRpdmUgZGF0YSB2YWx1ZXMsIHdoaWNoIGlzbid0IHBvc3Np
YmxlIGluIHN1Y2ggY2FzZSkuCgpUaGFua3MsCkljZW5vd3kKCj4gCj4gLSBNYW5pCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
