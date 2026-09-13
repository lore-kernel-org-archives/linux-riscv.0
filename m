Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91BEC88E63
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 19:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GBMPFJedMKhgoH021QbAXMJ6zNNt577IQ5M3DpTnS4=; b=ccrv47Bc5SNOct
	zVi1q+RyGPdcjKoRSyhHV0HcHWUKCpwVaWAY/brbhnXKpwwzTWGowh/gZQQVnA7aK0O6pvxM9d8p7
	oX/n0RRGXFi7NumZOtDM3H/hwR/BTdqknA0B2gB3S0AlmefqlNrzjbAh1rbS42soxMbtMfXs2h0ut
	QlG4xEU+7mtcA2qPaM/wwQjvgs+Lh/Ddc2xbUvUWi0YChzaOJ4uOFB3JQcCrvpIJe8SyNZceqtAkG
	x3ksvHzkeHeskx03TF03BA5NFqGEh/VfdTu1MQHchbE4lm+E8YX0GhTp5+UDsx8tByk2bv9Dj42JV
	DSwOo5IYbRIu5NrUkzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qGd-000000020Xa-1Xxr;
	Sun, 13 Sep 2026 19:53:35 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qGa-000000020WM-0yzs;
	Sun, 13 Sep 2026 19:53:33 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B5817CD5BC;
	Sun, 13 Sep 2026 22:53:23 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B5817CD5BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789329207;
	bh=OxeU5Su/M8erJsaUWOmS2EmM0zS643DtJmSk63z/Z00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bPrxv5ZxzllOQiy2krKFOjC+n45BHyruI8wXJWW2dWXRr4DcLu0qSRf6d6pHLDx2g
	 jWcfuKvfm4R5fkihNP2bYAGlMPiEKu2EReiVm/sDrL/7gpXNRKBB7aWno9BxyE0PIx
	 eJ2WBtrgtJF/6pZnjqFQwwsDO/KmzOaIx0fkVSU/CK9rK96UEIEpRCrZ3RBw/9RO7M
	 dIG3X6gzczLJWO2ggvEASF+KnDy8M/wU/ZXNb4/e4nVlCj9JFDbH5mUjxdeheYhNPH
	 IQWdrYEJBtqEOV1SW3KVrCuI7RGRLTeehLAl+p9Cvbyg6Rh5mmTzHhmbRZNO4iAJKh
	 MCi83qnwm1Cog==
Message-ID: <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it
 consistently
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas
 Gleixner	 <tglx@kernel.org>, Anup Patel <anup@brainfault.org>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai
 <minghsiu.tsai@mediatek.com>, Houlong Wei	 <houlong.wei@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, "tip-bot2 for GUO Ren (XuanTie)"
	 <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Date: Sun, 13 Sep 2026 15:53:22 -0400
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_125332_454579_DD9480F6 
X-CRM114-Status: GOOD (  17.84  )
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

T24gRnJpLCAyMDI2LTA5LTExIGF0IDAzOjI3ICswMDAwLCBHdW8gUmVuIHdyb3RlOgo+IFRoaXMg
c2VyaWVzIHJlbW92ZXMgdGhlIGltcGxpY2l0IGFzc3VtcHRpb24gdGhhdCBSSVNDLVYgc3VwcG9y
dHMgZXhhY3RseQo+IGVpZ2h0IElQSSBtZXNzYWdlIHR5cGVzLgo+IAo+IEN1cnJlbnRseSwgdGhl
IFNCSSwgQ0xJTlQgYW5kIEFDTElOVCBTU1dJIElQSSBwcm92aWRlcnMgdXNlCj4gQklUU19QRVJf
QllURSB3aGVuIHNpemluZyB0aGUgZ2VuZXJpYyBJUEkgbXV4LCB3aGlsZSBJTVNJQyBjYXJyaWVz
IGEKPiBzZXBhcmF0ZSBJTVNJQ19OUl9JUEkgZGVmaW5pdGlvbiBzZXQgdG8gOC4gVGhlc2UgdmFs
dWVzIGhhcHBlbiB0byBtYXRjaAo+IElQSV9NQVggdG9kYXksIGJ1dCBuZWl0aGVyIGlzIHRoZSBw
cm9wZXIgc291cmNlIG9mIHRydXRoIGZvciB0aGUgbnVtYmVyCj4gb2YgUklTQy1WIElQSSBtZXNz
YWdlIHR5cGVzLgo+IAo+IE1vdmUgZW51bSBpcGlfbWVzc2FnZV90eXBlIHRvIGFzbS9zbXAuaCBz
byBJUEkgcHJvdmlkZXJzIGNhbiB1c2UgSVBJX01BWAo+IGRpcmVjdGx5LCB0aGVuIHJlcGxhY2Ug
dGhlIEJJVFNfUEVSX0JZVEUgYW5kIElNU0lDX05SX0lQSSB1c2VzIHdpdGgKPiBJUElfTUFYLgo+
IAo+IFRoaXMgYWxzbyBtYWtlcyBhZGRpbmcgZnV0dXJlIFJJU0MtViBJUEkgbWVzc2FnZSB0eXBl
cyBpbmRlcGVuZGVudCBvZgo+IHRoZSBjdXJyZW50IGVpZ2h0LWVudHJ5IGFzc3VtcHRpb24uCj4g
Cj4gQSBmb2xsb3ctdXAgcGF0Y2ggcmVuYW1lcyB0aGUgTWVkaWFUZWsgVlBVIG1haWxib3ggdGVy
bWluYXRvciBmcm9tCj4gSVBJX01BWCB0byBJUElfVlBVX01BWC4gVGhhdCB0b2tlbiBiZWxvbmdz
IHRvIHRoZSBWUFUgZmlybXdhcmUgSVBJIGlkCj4gZW51bSBhbmQgc2hvdWxkIGZvbGxvdyB0aGUg
c2FtZSBwcmVmaXhlZCBjb252ZW50aW9uIGFzIElQSV9WUFVfSU5JVAo+IChhbmQgU0NQX0lQSV9N
QVggb24gdGhlIFNDUCBzaWRlKSwgaW5zdGVhZCBvZiByZXVzaW5nIHRoZSBnZW5lcmljCj4gSVBJ
X01BWCBuYW1lLgo+IAo+IC0tLQo+IEdVTyBSZW4gKFh1YW5UaWUpICg0KToKPiDCoMKgwqDCoMKg
IGNsb2Nrc291cmNlOiBjbGludDogVXNlIElQSV9NQVggZm9yIElQSSBtdXhpbmcKPiDCoMKgwqDC
oMKgIGlycWNoaXAvYWNsaW50LXNzd2k6IFVzZSBJUElfTUFYIGZvciBJUEkgbXV4aW5nCj4gwqDC
oMKgwqDCoCBpcnFjaGlwL2ltc2ljOiBVc2UgSVBJX01BWCBpbnN0ZWFkIG9mIElNU0lDX05SX0lQ
SQo+IMKgwqDCoMKgwqAgbWVkaWE6IG10ay12cHU6IHJlbmFtZSBJUElfTUFYIHRvIElQSV9WUFVf
TUFYCj4gCj4gdGlwLWJvdDIgZm9yIEdVTyBSZW4gKFh1YW5UaWUpICgyKToKPiDCoMKgwqDCoMKg
IHJpc2N2OiBzbXA6IE1vdmUgZW51bSBpcGlfbWVzc2FnZV90eXBlIHRvIGFzbS9zbXAuaAo+IMKg
wqDCoMKgwqAgcmlzY3Y6IHNiaTogVXNlIElQSV9NQVggZm9yIFNCSSBJUEkgbXV4aW5nCgpJIGFt
IGNvbmZ1c2VkLiBUaG9tYXMgbWVyZ2VkIHlvdXIgZW50aXJlIHYxIHNlcmllcyBhIHdlZWsgYmVm
b3JlIChzZWUKdGhlIGluZGl2aWR1YWwgcmVwbGllcyBmcm9twqB0aXAtYm90MkBsaW51dHJvbml4
LmRlKS4gV2h5IGFyZSB5b3UKc2VuZGluZyB2Mj8KClBhdGNoIDYgd2FzIG5vdCBpbmNsdWRlZCBp
biB2MSAoYnV0IGl0J3MgY2xlYXJseSByZWxhdGVkKSwgc28gcGVyaGFwcwp5b3UgbWVhbnQgdG8g
c2VuZCBvbmx5IHRoaXMgb25lIGFzIGEgc2VwYXJhdGUgcGF0Y2g/CgpBbHNvOgogKiBUaGUgY292
ZXIgbGV0dGVyIHNob3VsZCBpbmNsdWRlIGEgY2hhbmdlbG9nLCBpbmRpY2F0aW5nIHdoYXQgY2hh
bmdlcwogICB3ZXJlIG1hZGUgaW4gZWFjaCB2ZXJzaW9uIGNvbXBhcmVkIHRvIHRoZSBwcmV2aW91
cyBvbmUuCiAqIFBhdGNoZXMgMSBhbmQgMiBjYXJyeSBhICJGcm9tOiIgdGFnIHRoYXQgYXR0cmli
dXRlcyBhdXRob3JzaGlwIHRvCiAgIHRpcC1ib3QyLCB3aGljaCBpcyB3cm9uZyAoaWYgdGhlc2Ug
cGF0Y2hlcyB3ZXJlIHRvIGJlIGFwcGxpZWQpLgoKPiAKPiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc21wLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIgKysrKysrKysr
KysrCj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC9zYmktaXBpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDQgKystLQo+IMKgYXJjaC9yaXNjdi9rZXJuZWwvc21wLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyIC0tLS0tLS0tLS0t
LQo+IMKgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1jbGludC5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA0ICsrLS0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtYWNsaW50LXNzd2kuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tCj4gwqBkcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLWVhcmx5LmPCoMKgwqDCoMKgwqAgfMKgIDQgKystLQo+IMKgZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5owqDCoMKgwqDCoMKgIHzCoCAxIC0KPiDCoGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1L210a192cHUuYyB8IDEyICsrKysrKy0t
LS0tLQo+IMKgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92cHUvbXRrX3ZwdS5oIHzC
oCA0ICsrLS0KPiDCoDkgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRp
b25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IDA4ZGY4ODQxMzZmMWMxMTk3YmFiMmEyNzgxNDQw
NGZkMzI5ZDlhYWMKPiBjaGFuZ2UtaWQ6IDIwMjYwOTExLWlwaV9tYXgtZmY3MWVlYWRmNmZkCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IC0twqAgCj4gR1VPIFJlbiAoWHVhblRpZSkgPGd1b3JlbkBrZXJu
ZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
