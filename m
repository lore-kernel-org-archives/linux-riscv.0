Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C6ECA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KT5ZlC7h3J0LJyws7lgFVhGIFebIeUU1EyBkzT7feM0=; b=vMuvaKjVPDwmNt
	L5/d/32g8YeIcBK6DLudGMk3AzeOVtWygbCDBAg2cdDfyhLOMIruRcLd7Uvo18+AA4snAdW7E3zV+
	ypQoE7ZogsBqsLnKgQOglDbu/TERe+/4UxLqsyv++nFf+vyz9l+7RGGnVDoNHK9mo695Nq3rwIXuo
	8gKiG2vVefA0lEPPBAbdD7yJG8lsgQyMgrI/8OuyLr39pXc+M3u6e/BcHVRlwCD1ynB9ByGzQuYxy
	01aWwnER2AveZSvBEsfm64o7GWLIiC3V02ZGkQ5X+cD7GPq9LKx7HMd5quj3xCDNa9gns7CVRuMZm
	9kUDuG1DAn/29+QcPLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploe-00000004fGt-3e0k;
	Sat, 23 Aug 2025 10:49:44 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uph4j-00000003uPm-44aR
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 05:46:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755927952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KT8b4S2x9J+pu0uPywBdy6Ou0xfDprAOneKq9nK0Y2FpiTpXCDRSNUL1dUMIF9rRRA+OlqyTyA4xPJ9pfYT+kDJEzT4I4sJWQomcnNl2h3uakOIaC+phSsGS1HJCvkF2uYOUqzS9yNCNZ7jiziEtt4QkLycrez/yhFw7ZQkOyQI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755927952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y/5L1LOFiJghDLEs+MG7KIK4n7AgU847WKZtPA9q7AQ=; 
	b=imNy9eRiTszpTPM+0Myo+YNKTCUugI89WFqAEwTP9zA7hdvg8Q5fqlM4RWkxOX+K94wyuLusQaBdNtBAXmhj1ErBd6AW19jL/u6iy1YJpLuoBbpoahZJvFieJ/nIxe525797j88Y2PNewQWykXH56JY9VshpFNDDnHrSerJJvHw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755927952;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=y/5L1LOFiJghDLEs+MG7KIK4n7AgU847WKZtPA9q7AQ=;
	b=mgQrtpUCUPy3Zf6p2HtWBZC3OQtb3i2z2akSgnrMqOxvXLB5UWuabd/RH7mTD5d0
	Zz6OUqZ/Vwj9uDxKCuXh4hDj9BiKosWh5b8CrLXxTY4F6VacqjdM2wbct77liPir2vP
	8XZ7VC4gMKVvyrT9uLg4Ga8X65+QRltyfzURbRZjVF0HFL7ILNb+PuEObLoWZeuNZpu
	Fzs8W7tU6C48f4G9cdp9XMRvZQw6msl0pMrWdZI+i8uH9wNpx0XQCeqnYsQM6McgTvk
	AuQ6MweHBZvYN9y0dyIQulYYRuD7saMBfI/kDZvDoe/gkfVmXUHezEF5/uY1arduVHJ
	G/ZbyvQppw==
Received: by mx.zohomail.com with SMTPS id 1755927949758986.6712120663119;
	Fri, 22 Aug 2025 22:45:49 -0700 (PDT)
Message-ID: <046e10babcdd391a012d160fed35d8f4d3a42ddc.camel@icenowy.me>
Subject: Re: [PATCH 3/3] riscv: dts: thead: th1520: add soft PWM fan for
 Lichee Pi 4A
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>,  linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Sat, 23 Aug 2025 13:45:42 +0800
In-Reply-To: <aKjh6hrhrRqUvnSd@x1>
References: <20250816093209.2600355-1-uwu@icenowy.me>
	 <20250816093209.2600355-4-uwu@icenowy.me> <aKjh6hrhrRqUvnSd@x1>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_224602_078047_7958E76A 
X-CRM114-Status: GOOD (  19.06  )
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

5ZyoIDIwMjUtMDgtMjLmmJ/mnJ/kupTnmoQgMTQ6MzIgLTA3MDDvvIxEcmV3IEZ1c3Rpbmnlhpnp
gZPvvJoKPiBPbiBTYXQsIEF1ZyAxNiwgMjAyNSBhdCAwNTozMjowOVBNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4gQmVjYXVzZSBvZiB0aGUgU29NK0RvY2sgZGVzaWduIG9mIExpY2hl
ZSBQaSA0QSwgaGVhdCBkaXNzaXBhdGlvbgo+ID4gZG9lcwo+ID4gbm90IHdvcmsgd2VsbDsgZm9y
dHVuYXRlbHkgaXQgY29tZXMgd2l0aCBhIGZhbiBwb3J0IHdpdGggUFdNCj4gPiBkcml2aW5nCj4g
PiBjYXBhYmlsaXR5Lgo+ID4gCj4gPiBBcyB0aGUgaGFyZHdhcmUgUFdNIGNvbnRyb2xsZXIgb2Yg
TGljaGVlIFBpIDRBIGlzbid0IHJlYWR5IHlldCwKPiA+IGRyaXZlIGl0Cj4gPiB3aXRoIHB3bS1n
cGlvIGRyaXZlciAoc29mdHdhcmUgUFdNKSBub3cuCj4gPiAKPiA+IEEgbG9uZyBQV00gcGVyaW9k
IGlzIHVzZWQsIGJlY2F1c2Ugbm90IG9ubHkgc29mdHdhcmUgUFdNIGlzIHVzZWQsCj4gPiBidXQK
PiA+IGFsc28gdGhlIGZhbiBwb3J0IGlzIGEgMi1waW4gb25lIGFuZCBmYXN0IFBXTSBtaWdodCBj
b25mdXNlIHRoZQo+ID4gQkxEQwo+ID4gZHJpdmVyIG9uIGZhbnMuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gLS0tCj4gPiDCoC4uLi9i
b290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0c8KgwqDCoCB8IDUzCj4gPiArKysr
KysrKysrKysrKysrKysrCj4gPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0
c2nCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzCj4gPiBpbmRleCA0MDIwYzcy
N2YwOWU4Li5mNjk2ZGIwMTM1M2M1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0
cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290
L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gQEAgLTQsNiArNCw3IEBACj4g
PiDCoCAqLwo+ID4gwqAKPiA+IMKgI2luY2x1ZGUgInRoMTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0
c2kiCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+ID4gwqAKPiA+IMKg
LyB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgbW9kZWwgPSAiU2lwZWVkIExpY2hlZSBQaSA0QSI7Cj4g
PiBAQCAtMjgsNiArMjksNTggQEAgYWxpYXNlcyB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgY2hvc2Vu
IHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Rkb3V0LXBhdGggPSAic2Vy
aWFsMDoxMTUyMDBuOCI7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfTsKPiA+ICsKPiA+ICvCoMKgwqDC
oMKgwqDCoGdwaW9fcHdtOiBncGlvLXB3bSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgI3B3bS1jZWxscyA9IDwzPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBjb21wYXRpYmxlID0gInB3bS1ncGlvIjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBncGlvcyA9IDwmZ3BpbzMgMyBHUElPX0FDVElWRV9ISUdIPjsKPiA+ICvCoMKgwqDCoMKg
wqDCoH07Cj4gCj4gSSB0aGluayB0aGUgbm9kZSBuYW1lIG5lZWRzIHRvIGJlICdwd20nIGluc3Rl
YWQgb2YgJ2dwaW8tcHdtJyBhcwo+IGR0YnNfY2hlY2sKPiB3YXJucyB0aGF0OgoKU291bmRzIHJl
YXNvbmFibGUsIGFsdGhvdWdoICdwd20nIHNlZW1zIHRvIGJlIHRvbyBnZW5lcmljLgoKQnV0IHRo
ZSByZWNvbW1lbmRlZCBuYW1lcyBiZWxvdyBsb29rcyBxdWl0ZSBnZW5lcmljIHRvby4uLiBJcyBp
dCBqdXN0CnNvbWUgY29weS1wYXN0YT8KCldlbGwsIG1heWJlIGp1c3QgdGFrZSAncHdtJyBvciAn
cHdtLTAnIG5vdz8KCj4gCj4gZ3Bpby1wd206ICRub2RlbmFtZTowOiAnZ3Bpby1wd20nIGRvZXMg
bm90IG1hdGNoICdecHdtKEAuKnwtKFswLQo+IDldfFsxLTldWzAtOV0rKSk/JCcKPiBmcm9tIHNj
aGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3B3bS9wd20tZ3Bpby55YW1s
Iwo+IAo+IFRoYW5rcywKPiBEcmV3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
