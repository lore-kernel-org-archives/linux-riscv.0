Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC1C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqCENlCjlrWDQXoVpwh/zBJYpLATLM8z0PUcT1OhDoY=; b=1EJMtYQGWcPQYp
	YHUU5FYiCeuA8Ywti4YqSymxgaBFLiqld1dommHrNq6LWjgys+7tCIsF1ufxsEjPzVNUnZABPpzM2
	MQUP/XMxJEt+UYkw2Ym6z0jEUGmrSCumaSx19fiJ0x+Sf6MmSWA0Z4fGbYY1RT+MkjqjMnGvECGKO
	3Pglu2eNmCQzmeUWYd2iHlReR6aA/fPheb5hZR2I1ECZ7Wz8S38DHLzpSpakb46Pkf+G4uGC+8ITf
	jQcNPQTsbr9h2Z2vLPYDMvYPbX2AQbo9gC3+WBqybOd+jWr2XyU+F61iHB59QIUqLL/KDFIdib8Sa
	4a+D3KnIR5vjiKnFoFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrIb-00000007SHH-19GP;
	Mon, 20 Jul 2026 16:57:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrIZ-00000007SH2-3CRM
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 16:56:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5751B41ED2;
	Mon, 20 Jul 2026 16:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050901F000E9;
	Mon, 20 Jul 2026 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784566619;
	bh=CL7VZPLwd2s3IweYjUVZvbpDs9ZCkifwypl2mqHFzhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E072VCYy+jt2/yl3Fjpcd/VvtYe/VCVFc2ag8TFOdnoOMSntM1zRVioDV7bQ1U9Af
	 7nYE0YK6eDqTm+S8OZmBou484JFwi3vBx/1wQuvRiGAXv887+e6AFPf4wRMD6ZtfyC
	 jUULNDqcsgPLSR4xytowO4Vgr/GdVsFUGu52BQ6mTWI62TPg1C4UAczuWI3IGp2hUM
	 DGUrvM0stglq0jOG4oTh9TSKqMy00uoym1JcTehq9++bAlBmkvOqQYjJse2WRUTVNh
	 sZdj8bcyzWrEfKuYhRthAvWXJ2rsoWXh4jxws4OLntQFuabi61/MJOXeDN2zLykvF/
	 ZyQVcai0IGtTg==
Date: Mon, 20 Jul 2026 09:56:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
Message-ID: <al5TWhx7pLIZguAc@gen8>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
 <allEg/A+Gt/em0Hs@x1>
 <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMTI6MTE6MjNQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiAKPiAKPiDkuo4gMjAyNuW5tDfmnIgxN+aXpSBHTVQrMDg6MDAgMDQ6NTI6MTnvvIxE
cmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4g5YaZ6YGT77yaCj4gPk9uIFR1ZSwgSnVs
IDE0LCAyMDI2IGF0IDAzOjQ1OjE0UE0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPj4g
RnJvbTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNh
bC5jb20+Cj4gPj4gCj4gPj4gQWRkIGxhYmVscyBmb3IgR1BJT3Mgb24gdGhlIElPIGV4cGFuc2lv
biBjaGlwIG9uIHRoZSBJMkMxIGJ1cy4KPiA+PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJl
bm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPiA+PiBb
SWNlbm93eTogU3BsaXR0ZWQgb2ZmIHRoZSBwYXRjaCBhZGRpbmcgYWxsIDMgSU8gZXhwYW5zaW9u
c10KPiA+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5h
Yy5jbj4KPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGlj
aGVlLXBpLTRhLmR0cyB8IDggKysrKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQo+ID4+IAo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFk
L3RoMTUyMC1saWNoZWUtcGktNGEuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1
MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4+IGluZGV4IDc0YjEyMGM2YjA2M2EuLjc4ZjU5NzlhNTZj
MTQgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGlj
aGVlLXBpLTRhLmR0cwo+ID4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LWxpY2hlZS1waS00YS5kdHMKPiA+PiBAQCAtMTI4LDYgKzEyOCwxNCBAQCBpb2V4cDI6IGdwaW9A
MTggewo+ID4+ICAJCXJlZyA9IDwweDE4PjsKPiA+PiAgCQlncGlvLWNvbnRyb2xsZXI7Cj4gPj4g
IAkJI2dwaW8tY2VsbHMgPSA8Mj47Cj4gPj4gKwkJZ3Bpby1saW5lLW5hbWVzID0gIiIsCj4gPj4g
KwkJCQkgICJjYW0wX3Jlc2V0IiwKPiA+PiArCQkJCSAgImNhbTFfcmVzZXQiLAo+ID4+ICsJCQkJ
ICAiY2FtMl9yZXNldCIsCj4gPj4gKwkJCQkgICJ3bF9ob3N0X3dha2UiLAo+ID4KPiA+SSBhbSBu
b3Qgc3VyZSB0aGUgbGluZSBuYW1lIHJlYWxseSBtYXR0ZXJzIGFsbCB0aGF0LCBidXQgaXQgc2Vl
bXMgdGhhdAo+ID5waW4gNCBpcyBhbHNvIHVzZWQgYXMgYSByZXNldCBncGlvOgo+IAo+IFRoZSAi
aG9zdCIgaGVyZSBpcyBzdWJqZWN0LCB3aGljaCBtZWFucyAidGhpcyBwaW5zIGlzIHVzZWQgYnkg
dGhlIGhvc3QgdG8gd2FrZSB0aGUgd2wiLgo+IAo+IE1heWJlIEkgc2hvdWxkIHRha2UgdGhlIHNj
aGVtYXRpY3MgbmFtZSwgIndsX2hvc3Rfd2FrZV9kZXYiPyBPciB1c2UgYW5vdGhlciBuYW1lIG9u
IHRoZSBwYWdlIGZvciBXaS1GaSwgIndsX3JlZ19vbiI/CgpJIHRobmsgIndsX2hvc3Rfd2FrZV9k
ZXYiIGlzIHNsaWdodGx5IGJldHRlciBpbiB0ZXJtcyBvZiBzZWFyY2hpbmcgdGhlClBERiBbMV0g
YW5kIGZpbmRpbmcgdGhlICJJTyBFeHBhbnNpb24gMiIgc2VjdGlvbi4gVGhpcyBpcyBtaW5vciBj
aGFuZ2UKc28gSSBjYW4ganVzdCBmaXggdXAgd2hlbiBhcHBseWluZyBpZiB5b3UgYXJlIG9rYXkg
d2l0aCB0aGF0LgoKVGhhbmtzLApEcmV3CgpbMV0gaHR0cHM6Ly9kbC5zaXBlZWQuY29tL3NoYXJl
VVJML0xJQ0hFRS9saWNoZWVwaTRhLzAyX1NjaGVtYXRpYwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
