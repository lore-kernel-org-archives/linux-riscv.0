Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF7C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 17:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yfn+zL7WvfSDxPTFD/nQ+a1D3AjCV192XlP9Mv+QZAY=; b=qaE80HRIdmEeAS
	5ZGPiaphxmB7SwD+XRDAOVdJ2ECSU5Wtdne1QWWznn5pibGFpmtolL1RPxS4638bWwbxwiH2YnWkT
	t9FP6a1/5CiYJZ0OlQFeA3we5IalS6R12Pg1YQTDodcIE1PSDshSnklXSHYAug6HitM3zizmzyU/s
	ig/p9hc0iUKR7Y+MAprS6iCdCmMlkxR5Ic0TBDQN+Nv+RZM6zvZQWZ3IbB0KmZv/hBmmb7myIDJ4/
	JjtX8l0DQwRlGwpBBd0A/7VxFtM5lMOUv0sBG8jqZ2rBjPmKRt6FG7jO+VwRNg/Bsn/+z28cRagM/
	cSegyG6L5Dm/hwDyM82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoKU-0000000EDxO-1pcM;
	Wed, 19 Feb 2025 17:57:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoKR-0000000EDvx-3lun
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 17:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3278E5C5643;
	Wed, 19 Feb 2025 17:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C23C4CED1;
	Wed, 19 Feb 2025 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739987867;
	bh=bNlAhfaAmhX6VaFyFfgt8A57xz33sy1WuFva1LsY4j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a44ocDxACxnXGyjoxzQcz8G/7t/hSKnD6q+yY4uNYd9R/XkNjCO5VpBkUh8uzL8q8
	 7K4C3RNO1rGNm1B1VodEgPZKREmqoW0j1TOdVtogiePmEg5wBMM2gvXjHZp/sllm1Y
	 c/WeL4usFP/oxisjnHLEMszr6mMqPm/CJ7B1Toljm18PLaNTW8TiI0VbLjMbZsEz7g
	 fNp/Yjekg+e77sJZrR+JYlIAaOYQEprh7r+dL6KR8HyMYjgSWIxYNAxEy2F2BVy9A4
	 QbyU4bAVT+KCKw6iWW/0qZOCmhf4M95s/FK1n7NaxJBCgMowosJMuXYlU9vApK5/YA
	 txJlAQEyRLPMA==
Date: Wed, 19 Feb 2025 23:27:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	maz@kernel.org, Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
	lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	pbrobinson@gmail.com, robh@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: Re: [PATCH v3 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <20250219175735.ruwt7s5rbwswvsi6@thinkpad>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <ddedd8f76f83fea2c6d3887132d2fe6f2a6a02c1.1736923025.git.unicorn_wang@outlook.com>
 <20250119122353.v3tzitthmu5tu3dg@thinkpad>
 <BM1PR01MB254540560C1281CE9898A5A0FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
 <20250122173451.5c7pdchnyee7iy6t@thinkpad>
 <MA0PR01MB56715414B26AA601CFFB54C8FEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0PR01MB56715414B26AA601CFFB54C8FEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_095748_022892_2A058004 
X-CRM114-Status: GOOD (  26.59  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMDQ6MjI6MDhQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IAo+IE9uIDIwMjUvMS8yMyAxOjM0LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4g
Cj4gWy4uLi4uLl0KPiA+ID4gPiA+ICsvKgo+ID4gPiA+ID4gKyAqIFNHMjA0MiBQQ0llIGNvbnRy
b2xsZXIgc3VwcG9ydHMgdHdvIHdheXMgdG8gcmVwb3J0IE1TSToKPiA+ID4gPiA+ICsgKgo+ID4g
PiA+ID4gKyAqIC0gTWV0aG9kIEEsIHRoZSBQQ0llIGNvbnRyb2xsZXIgaW1wbGVtZW50cyBhbiBN
U0kgaW50ZXJydXB0IGNvbnRyb2xsZXIKPiA+ID4gPiA+ICsgKiAgIGluc2lkZSwgYW5kIGNvbm5l
Y3QgdG8gUExJQyB1cHdhcmQgdGhyb3VnaCBvbmUgaW50ZXJydXB0IGxpbmUuCj4gPiA+ID4gPiAr
ICogICBQcm92aWRlcyBtZW1vcnktbWFwcGVkIE1TSSBhZGRyZXNzLCBhbmQgYnkgcHJvZ3JhbW1p
bmcgdGhlIHVwcGVyIDMyCj4gPiA+ID4gPiArICogICBiaXRzIG9mIHRoZSBhZGRyZXNzIHRvIHpl
cm8sIGl0IGNhbiBiZSBjb21wYXRpYmxlIHdpdGggb2xkIFBDSWUgZGV2aWNlcwo+ID4gPiA+ID4g
KyAqICAgdGhhdCBvbmx5IHN1cHBvcnQgMzItYml0IE1TSSBhZGRyZXNzLgo+ID4gPiA+ID4gKyAq
Cj4gPiA+ID4gPiArICogLSBNZXRob2QgQiwgdGhlIFBDSWUgY29udHJvbGxlciBjb25uZWN0cyB0
byBQTElDIHVwd2FyZCB0aHJvdWdoIGFuCj4gPiA+ID4gPiArICogICBpbmRlcGVuZGVudCBNU0kg
Y29udHJvbGxlciAic29waGdvLHNnMjA0Mi1tc2kiIG9uIHRoZSBTT0MuIFRoZSBNU0kKPiA+ID4g
PiA+ICsgKiAgIGNvbnRyb2xsZXIgcHJvdmlkZXMgbXVsdGlwbGUodXAgdG8gMzIpIGludGVycnVw
dCBzb3VyY2VzIHRvIFBMSUMuCj4gPiA+ID4gPiArICogICBDb21wYXJlZCB3aXRoIHRoZSBmaXJz
dCBtZXRob2QsIHRoZSBhZHZhbnRhZ2UgaXMgdGhhdCB0aGUgaW50ZXJydXB0Cj4gPiA+ID4gPiAr
ICogICBzb3VyY2UgaXMgZXhwYW5kZWQsIGJ1dCBiZWNhdXNlIGZvciBTRzIwNDIsIHRoZSBNU0kg
YWRkcmVzcyBwcm92aWRlZCBieQo+ID4gPiA+ID4gKyAqICAgdGhlIE1TSSBjb250cm9sbGVyIGlz
IGZpeGVkIGFuZCBvbmx5IHN1cHBvcnRzIDY0LWJpdCBhZGRyZXNzKD4gMl4zMiksCj4gPiA+ID4g
PiArICogICBpdCBpcyBub3QgY29tcGF0aWJsZSB3aXRoIG9sZCBQQ0llIGRldmljZXMgdGhhdCBv
bmx5IHN1cHBvcnQgMzItYml0IE1TSQo+ID4gPiA+ID4gKyAqICAgYWRkcmVzcy4KPiA+ID4gPiA+
ICsgKgo+ID4gPiA+ID4gKyAqIE1ldGhvZCBBICYgQiBjYW4gYmUgY29uZmlndXJlZCBpbiBEVFMs
IGRlZmF1bHQgaXMgTWV0aG9kIEIuCj4gPiA+ID4gSG93IHRvIGNvbmZpZ3VyZSB0aGVtPyBJIGNh
biBvbmx5IHNlZSAic29waGdvLHNnMjA0Mi1tc2kiIGluIHRoZSBiaW5kaW5nLgo+ID4gPiAKPiA+
ID4gVGhlIHZhbHVlIG9mIHRoZSBtc2ktcGFyZW50IGF0dHJpYnV0ZSBpcyB1c2VkIGluIGR0cyB0
byBkaXN0aW5ndWlzaCB0aGVtLAo+ID4gPiBmb3IgZXhhbXBsZToKPiA+ID4gCj4gPiA+IGBgYGR0
cwo+ID4gPiAKPiA+ID4gbXNpOiBtc2ktY29udHJvbGxlckA3MDMwMDEwMzAwIHsKPiA+ID4gIMKg
wqDCoCAuLi4uLi4KPiA+ID4gfTsKPiA+ID4gCj4gPiA+IHBjaWVfcmMwOiBwY2llQDcwNjAwMDAw
MDAgewo+ID4gPiAgwqDCoMKgIG1zaS1wYXJlbnQgPSA8Jm1zaT47Cj4gPiA+IH07Cj4gPiA+IAo+
ID4gPiBwY2llX3JjMTogcGNpZUA3MDYyMDAwMDAwIHsKPiA+ID4gIMKgwqDCoCAuLi4uLi4KPiA+
ID4gIMKgwqDCoCBtc2ktcGFyZW50ID0gPCZtc2lfcGNpZT47Cj4gPiA+ICDCoMKgwqAgbXNpX3Bj
aWU6IGludGVycnVwdC1jb250cm9sbGVyIHsKPiA+ID4gIMKgwqDCoMKgwqDCoMKgIC4uLi4uLgo+
ID4gPiAgwqDCoMKgIH07Cj4gPiA+IH07Cj4gPiA+IAo+ID4gPiBgYGAKPiA+ID4gCj4gPiA+IFdo
aWNoIG1lYW5zOgo+ID4gPiAKPiA+ID4gcGNpZV9yYzAgdXNlcyBNZXRob2QgQgo+ID4gPiAKPiA+
ID4gcGNpZV9yYzEgdXNlcyBNZXRob2QgQS4KPiA+ID4gCj4gPiBPay4geW91IG1lbnRpb25lZCAn
ZGVmYXVsdCBtZXRob2QnIHdoaWNoIGlzIG5vdCBhY2N1cmF0ZSBzaW5jZSB0aGUgY2hvaWNlCj4g
PiBvYnZpb3VzbHkgZGVwZW5kcyBvbiBEVC4gTWF5YmUgeW91IHNob3VsZCBzYXksICdjb21tb25s
eSB1c2VkIG1ldGhvZCc/IEJ1dCBib3RoCj4gPiB0aGUgYmluZGluZyBhbmQgZHRzIHBhdGNoZXMg
bWFrZSB1c2Ugb2YgaW4tYnVpbHQgTVNJIGNvbnRyb2xsZXIgb25seSAobWV0aG9kIEEpLgo+IAo+
ICJjb21tb25seSB1c2VkIG1ldGhvZCIgbG9va3Mgb2sgdG8gbWUuCj4gCj4gQmluZGluZyBleGFt
cGxlIG9ubHkgc2hvd3MgdGhlIGNhc2UgZm9yIE1ldGhvZCBBLCBkdWUgdG8gSSB0aGluayB0aGUg
d3JpdGluZwo+IG9mIGNhc2UgZm9yIE1ldGhvZCBBwqAgY292ZXJzIHRoZSB3cml0aW5nIG9mIGNh
c2UgZm9yIE1ldGhvZCBCLgo+IAo+IERUUyBwYXRjaGVzIHVzZSBib3RoIE1ldGhvZCBBIGFuZCBC
LiBZb3UgY2FuIHNlZSBwYXRjaCA0IG9mIHRoaXMgcGF0Y2hzZXQsCj4gcGNpZV9yYzEgdXNlcyBN
ZXRob2QgQSwgcGNpZV9yYzAgJiBwY2llX3JjMiB1c2UgTWV0aG9kIEIuCj4gCj4gPiBJbiBnZW5l
cmFsLCBmb3IgTVNJIGltcGxlbWVudGF0aW9ucyBpbnNpZGUgdGhlIFBDSWUgSVAsIHdlIGRvbid0
IHVzdWFsbHkgYWRkIGEKPiA+IGRlZGljYXRlZCBkZXZpY2V0cmVlIG5vZGUgc2luY2UgdGhlIElQ
IGlzIHRoZSBzYW1lLiBCdXQgaW4geW91ciByZXBseSB0byB0aGUgbXkKPiA+IHF1ZXN0aW9uIG9u
IHRoZSBiaW5kaW5ncyBwYXRjaCwgeW91IHNhaWQgaXQgaXMgYSBzZXBhcmF0ZSBJUC4gSSdtIGNv
bmZ1c2VkIG5vdy4KPiAKPiBJIGxlYXJuZWQgdGhlIHdyaXRpbmcgb2YgRFRTIGZyb20gImJyY20s
aXByb2MtcGNpZSIsIHNlZQo+IGFyY2gvYXJtL2Jvb3QvZHRzL2Jyb2FkY29tL2JjbS1jeWdudXMu
ZHRzaSBmb3IgZXhhbXBsZS4gV291bGRuJ3QgaXQgYmUKPiBjbGVhcmVyIHRvIGVtYmVkIGFuIG1z
aSBjb250cm9sbGVyIGluIHRvcG8/Cj4gCj4gQW5kIHJlZ2FyZGluZyB3aGF0IHlvdSBzYWlkLCAi
d2UgZG9uJ3QgdXN1YWxseSBhZGQgYSBkZWRpY2F0ZWQgZGV2aWNldHJlZQo+IG5vZGUiLCBkbyB5
b3UgaGF2ZSBhbnkgZXhhbXBsZSBJIGNhbiByZWZlciB0bz8KPiAKCllvdSBjYW4gcmVmZXIgYWxs
IERXQyBnbHVlIGRyaXZlcnMgdW5kZXIgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvIGFuZCB0
aGVpcgpjb3JyZXNwb25kaW5nIERUIGJpbmRpbmdzLgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K61
4K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
