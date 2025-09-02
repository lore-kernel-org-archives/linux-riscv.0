Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709ECA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTENQckOl+CUcl1P8j7d/H+wvj5cqWvUfbDfxXEJSYU=; b=E9czJR3I5/JzjZ
	0N+fHk0CA4TAPEihqzkMZ92pivMtwwFxbWfZwSjIdSP0D5fNygHuM0AuMbqLqcwIPpGL0Mj2pt2f7
	7sbRfa00mYOXLrGoPkwfFgHsLAWDUe6pbxoTEp2Criy+tSLHApeAgLXrHLDE7rBV7AG+58Wkqj/DE
	HAe5W4JCBdh2oLnp6RkyxEdzXZpzr+2n4HOAylnOmWUPFUcsnd3nvIvOk5Xlw30RjB5G1E92sjvSr
	CsWjsLXxhczDU9T54N/ZGRGNd+zEM3DALaJCJ4cnnPkLaUhi46Kb6nigXPwM2yZDXxiO5R+3BJQ1m
	YbTh0lWaGuButMxvFImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmf-00000002BR1-1IPC;
	Tue, 02 Sep 2025 21:43:21 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT7T-00000000jJ4-3PFF
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 15:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756827613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aWSAyqXGsbZjyShKncpMOh2bidqXBUaIDVtuzUJ9ynIU8Ey2gXXZZi9XAQdK5sp4Nrz81JWpmpb48FI2REhZHUnKA7sM1fNZke6JLLHmCJEkTd+jtJPnz/ts1VpUaa+25zLVdw2OSDkBo+VH2/puV1S60oIb7tuLMYKPBy9NZfY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756827613; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l0a5d8Bq/rNvK9rZz6eVzwJDRq62Oo1VLiOvhjtNKw8=; 
	b=XviKQ7S2Lz1VZUPRK6bGbuRdPZHwIg+emTIBGm6CanG9Zoq9HsZFIiNlXQ6sm4II4EUcTAjetTPLQwev+DyRmtLqpd/B5fvOiqbO+nkxk+p41UXtegdRbi+fEKkLqGCQSI38bHQpSwpxjhyJR0RHbQPWApyObAmD5DRYFHh79fc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756827613;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=l0a5d8Bq/rNvK9rZz6eVzwJDRq62Oo1VLiOvhjtNKw8=;
	b=DY7B30btFfiDhiATF39UO6rTAcb9BQuxHUdDLHInGZWVjnvJFTd5P5XJXwvFuD1+
	ztTip4d26jnvXJNgfPR2ZcTRMNzNvUJRHnU0f9X+lASTyUTKZNKyqaHlfD5UpLYYsrR
	4C0avRo+a3k3iTTRnH9NtwKs6SBij7nW6rirOnveSQhFq0D1fIz+yYzCZDFb3CdFaOv
	Ys9fM4ltdce7ejncw23vjKEba45VWRCrAh93kwluVrPodct5ycgMnRKnr5O7p2QU07d
	FQqNZ+9YGJ+ciBbPG0hIOy3NFAj3VX3ZCBdnvu82CGZLp6dFrQsMaIFNWO3UYADi4Ri
	MBHpOorwRA==
Received: by mx.zohomail.com with SMTPS id 1756827610463291.94280483667023;
	Tue, 2 Sep 2025 08:40:10 -0700 (PDT)
Message-ID: <05ef7c0df0a2235277030b9e33f34082e8938faa.camel@icenowy.me>
Subject: Re: [PATCH 6/7] drm/etnaviv: add shared context support for iommuv2
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 02 Sep 2025 23:40:02 +0800
In-Reply-To: <20250816074757.2559055-7-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
	 <20250816074757.2559055-7-uwu@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084027_904320_EFE2411D 
X-CRM114-Status: GOOD (  19.17  )
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

5ZyoIDIwMjUtMDgtMTbmmJ/mnJ/lha3nmoQgMTU6NDcgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gVW5mb3J0dW5hdGVseSB0aGUgR0M2MjAgR1BVIHNlZW1zIHRvIGhhdmUgYnJva2Vu
IFBUQSBjYXBpYmlsaXR5LCBhbmQKPiBzd2l0Y2hpbmcgcGFnZSB0YWJsZSBJRCBpbiBjb21tYW5k
IHN0cmVhbSBhZnRlciBpdCdzIHJ1bm5pbmcgd29uJ3QKPiB3b3JrLgo+IEFzIGRpcmVjdGx5IHN3
aXRjaGluZyBtdGxiIGlzbid0IHdvcmtpbmcgZWl0aGVyLCB0aGVyZSB3aWxsIGJlIG5vCj4gcmVs
aWFibGUgd2F5IHRvIHN3aXRjaCBwYWdlIHRhYmxlIGluIHRoZSBjb21tYW5kIHN0cmVhbSwgYW5k
IGEgc2hhcmVkCj4gY29udGV4dCwgbGlrZSBpb21tdXYxLCBpcyBuZWVkZWQuCj4gCj4gQWRkIHN1
cHBvcnQgZm9yIHRoaXMgc2hhcmVkIGNvbnRleHQgc2l0dWF0aW9uLiBTaGFyZWQgY29udGV4dCBp
cyBzZXQKPiB3aGVuIHRoZSBicm9rZW4gUFRBIGlzIGtub3duLCBhbmQgdGhlIGNvbnRleHQgYWxs
b2NhdGlvbiBjb2RlIHdpbGwgYmUKPiBtYWRlIHNob3J0IGNpcmN1aXQgd2hlbiBhIHNoYXJlZCBj
b250ZXh0IGlzIHNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNl
bm93eS5tZT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXVf
djIuYyB8IDggKysrKysrKysKPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11
LmPCoMKgwqDCoMKgIHwgMSArCj4gwqBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21t
dS5owqDCoMKgwqDCoCB8IDIgKysKPiDCoDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2lvbW11
X3YyLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXVfdjIuYwo+IGlu
ZGV4IDU2NTRhNjA0YzcwY2YuLjk2MGJhM2Q2NTlkYzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9pb21tdV92Mi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9pb21tdV92Mi5jCgpXZWxsLCBJIGZvcmdvdCB0byBjbGVhbiBzaGFy
ZWRfY29udGV4dCBpbiBldG5hdml2X2lvbW11djJfZnJlZSgpIHdoZW4KdGhlIHNoYXJlZCBjb250
ZXh0IGlzIHRvcm4gZG93bi4uLgoKPiBAQCAtMjczLDYgKzI3MywxMiBAQCBldG5hdml2X2lvbW11
djJfY29udGV4dF9hbGxvYyhzdHJ1Y3QKPiBldG5hdml2X2lvbW11X2dsb2JhbCAqZ2xvYmFsKQo+
IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZXRuYXZpdl9pb21tdV9jb250ZXh0ICpjb250ZXh0Owo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmdsb2JhbC0+bG9jayk7Cj4gK8KgwqDC
oMKgwqDCoMKgaWYgKGdsb2JhbC0+c2hhcmVkX2NvbnRleHQpIHsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY29udGV4dCA9IGdsb2JhbC0+c2hhcmVkX2NvbnRleHQ7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGV0bmF2aXZfaW9tbXVfY29udGV4dF9nZXQoY29udGV4
dCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmZ2xvYmFs
LT5sb2NrKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGNvbnRleHQ7
Cj4gK8KgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHYyX2NvbnRleHQgPSB2
emFsbG9jKHNpemVvZigqdjJfY29udGV4dCkpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXYyX2Nv
bnRleHQpCj4gQEAgLTMwMSw2ICszMDcsOCBAQCBldG5hdml2X2lvbW11djJfY29udGV4dF9hbGxv
YyhzdHJ1Y3QKPiBldG5hdml2X2lvbW11X2dsb2JhbCAqZ2xvYmFsKQo+IMKgwqDCoMKgwqDCoMKg
wqBtdXRleF9pbml0KCZjb250ZXh0LT5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgSU5JVF9MSVNU
X0hFQUQoJmNvbnRleHQtPm1hcHBpbmdzKTsKPiDCoMKgwqDCoMKgwqDCoMKgZHJtX21tX2luaXQo
JmNvbnRleHQtPm1tLCBTWl80SywgKHU2NClTWl8xRyAqIDQgLSBTWl80Syk7Cj4gK8KgwqDCoMKg
wqDCoMKgaWYgKGdsb2JhbC0+djIuYnJva2VuX3B0YSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ2xvYmFsLT5zaGFyZWRfY29udGV4dCA9IGNvbnRleHQ7Cj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZnbG9iYWwtPmxvY2spOwo+IMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gY29udGV4dDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRu
YXZpdl9tbXUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYwo+IGlu
ZGV4IGRmNTE5MjA4M2IyMDEuLmEwZjljOTUwNTA0ZTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfbW11LmMKPiBAQCAtNTA0LDYgKzUwNCw3IEBAIGludCBldG5hdml2X2lvbW11
X2dsb2JhbF9pbml0KHN0cnVjdCBldG5hdml2X2dwdQo+ICpncHUpCj4gwqDCoMKgwqDCoMKgwqDC
oG1lbXNldDMyKGdsb2JhbC0+YmFkX3BhZ2VfY3B1LCAweGRlYWQ1NWFhLCBTWl80SyAvCj4gc2l6
ZW9mKHUzMikpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh2ZXJzaW9uID09IEVUTkFWSVZf
SU9NTVVfVjIpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ2xvYmFsLT52Mi5i
cm9rZW5fcHRhID0gZ3B1LT5pZGVudGl0eS5tb2RlbCA9PQo+IGNoaXBNb2RlbF9HQzYyMDsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdsb2JhbC0+djIucHRhX2NwdSA9IGRtYV9h
bGxvY193YyhkZXYsCj4gRVROQVZJVl9QVEFfU0laRSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAmZ2xvYmFsLT52Mi5wdGFfZG1hLAo+IEdGUF9LRVJORUwpOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFnbG9iYWwtPnYyLnB0YV9jcHUpCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmgKPiBiL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmgKPiBpbmRleCAyZWM0YWNkYTAyYmM2Li41
NjI3ZDJhMGQwMjM3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfbW11LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5oCj4g
QEAgLTU1LDYgKzU1LDggQEAgc3RydWN0IGV0bmF2aXZfaW9tbXVfZ2xvYmFsIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU2NCAqcHRhX2NwdTsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRtYV9hZGRyX3QgcHRhX2RtYTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoERFQ0xBUkVfQklUTUFQKHB0YV9hbGxvYywgRVROQVZJVl9QVEFfRU5UUklF
Uyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFdoZXRoZXIgcnVudGltZSBz
d2l0Y2hpbmcgcGFnZSB0YWJsZSBJRCB3aWxsIGZhaWwKPiAqLwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBib29sIGJyb2tlbl9wdGE7Cj4gwqDCoMKgwqDCoMKgwqDCoH0gdjI7Cj4g
wqB9Owo+IMKgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
