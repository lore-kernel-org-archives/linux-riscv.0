Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC44CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLlIzQUHI6X2dOREi529fp117WmV1UJoqyksR2O953s=; b=0uOrxhTkweUSE5
	HuU+cjJ7bMBtbIWMHDrhHG41SF9Q7nRuXq70yJVKsPcyiFfv/1Nhvwbp4YdovoazjiqvCQ2gXMcAP
	vZFMhMUGnLindNtrXB82erNUKQ8W4TZQKkv+GSTQ/fY88tfLT5sOGou7PUOGBWgzkTRiiSt/NJTqN
	6z2dimikt1lqkCF53YnS7mVB8JqP1+XJQZzdH5GxVfEi9nHEgpEcJfGNxIFprTk2ZL8JK7GOb6r6E
	oz8wR2Z+zofWSawHWNE9m8WC9OMof/0dnGkij+MIkwacxXPGuSo75seX1BrKRizylRNCHAP5HpTmP
	xf9zgqAYRE0jtUUT2+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfzd-00000004YCQ-29hu;
	Wed, 20 May 2026 12:25:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfza-00000004YBK-44EG
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 12:25:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 637E91AED;
	Wed, 20 May 2026 05:25:34 -0700 (PDT)
Received: from [10.57.34.79] (unknown [10.57.34.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0486B3F85F;
	Wed, 20 May 2026 05:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779279939; bh=r4MdZFtowyPpupGPpQIEXdP9NBQqXiB54/OWs7koQOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uFUScEO+VDFo1Yng4NuDnsMF/miGjHvXJ8FilngCJQqFJaq8eZFNKMBuuthzdAZER
	 yLOCNQ6Bk3vnNMCN0LTgcENfRn5nQT5Zluxxfn08TTnF9G780N1uOURGxohyGZ1Frh
	 Z7uXsD5a+7KNVc0oQdfVLv16yVcughVRGzLtFI/g=
Message-ID: <7dc61855-d916-4659-8137-7f3457f6a56d@arm.com>
Date: Wed, 20 May 2026 13:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/riscv: prefer WSI on IGS=BOTH when wired IRQs are
 described
To: fangyu.yu@linux.alibaba.com, sunilvl@oss.qualcomm.com
Cc: ajones@ventanamicro.com, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
 aou@eecs.berkeley.edu, guoren@kernel.org, iommu@lists.linux.dev,
 joro@8bytes.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 tomasz.jeznach@linux.dev, will@kernel.org
References: <CAB19ukGk2AUA3yjsrBxjsUsH9pUSeeu5F6vo1FFBcd504VQPzg@mail.gmail.com>
 <20260520095411.92045-1-fangyu.yu@linux.alibaba.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260520095411.92045-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_052543_198135_37171A72 
X-CRM114-Status: GOOD (  23.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNi0wNS0yMCAxMDo1NCBhbSwgZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tIHdyb3Rl
Ogo+Pj4KPj4+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+
Pj4KPj4+IFRoZSBSSVNDLVYgSU9NTVUgc3BlYyBkZWZpbmVzIElHUz1CT1RIIGFzIHN1cHBvcnRp
bmcgYm90aCBNU0kgYW5kCj4+PiBXU0ksIHdpdGggc29mdHdhcmUgc2VsZWN0aW5nIHRoZSBwYXRo
LiBUaGUgRFQgcGF0aCBhbHJlYWR5IGJlaGF2ZXMKPj4+IGFzIGV4cGVjdGVkIGJ5IHNlbGVjdGlu
ZyBXU0kgd2hlbiB3aXJlZCBJUlEgcmVzb3VyY2VzIGFyZSBkZXNjcmliZWQuCj4+PiBUaGUgQUNQ
SSBwYXRoLCBob3dldmVyLCBjdXJyZW50bHkgZmFsbHMgYmFjayB0byBNU0kgZXZlbiB3aGVuCj4+
PiBmaXJtd2FyZSBkZXNjcmliZXMgd2lyZWQgSVJRIHJlc291cmNlcy4KPj4+Cj4+PiBVc2UgZmly
bXdhcmUtZGVzY3JpYmVkIHdpcmVkIElSUSByZXNvdXJjZXMgYXMgdGhlIHRyaWdnZXIgdG8gc2Vs
ZWN0Cj4+PiBXU0kgZm9yIElHUz1CT1RIOgo+Pj4gICAgLSBEVDogImludGVycnVwdHMiIHByZXNl
bnQsIG5vICJtc2ktcGFyZW50Igo+Pj4gICAgLSBBQ1BJOiBEU0RUIF9DUlMgSW50ZXJydXB0KCkg
ZGVzY3JpcHRvcnMKPj4+ICAgICAgKG1haW5saW5lIGRvZXMgbm90IHlldCBwYXJzZSB0aGUgUklN
VCBJbnRlcnJ1cHQgV2lyZSBBcnJheSkKPj4+Cj4+PiBXaGVuIHRyaWdnZXJlZCwgcmV3cml0ZSBp
Z3MgdG8gSUdTX1dTSSBhbmQgcmV1c2UgdGhlIGV4aXN0aW5nIFdTSQo+Pj4gaGFuZGxpbmcuIEtl
ZXAgdGhlIGV4aXN0aW5nIGJlaGF2aW91ciBvdGhlcndpc2UuCj4+Pgo+Pj4gRml4ZXM6IGQ1Zjg4
YWNkZDZmZiAoImlvbW11L3Jpc2N2OiBBZGQgc3VwcG9ydCBmb3IgcGxhdGZvcm0gbXNpIikKPj4+
IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+
Pj4gLS0tCj4+PiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYyB8IDE1ICsr
KysrKysrKysrKysrKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMgYi9k
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMKPj4+IGluZGV4IDM5OWJhOGZlMWIz
ZS4uYmQ3NzEyMjMxMTQwIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21t
dS1wbGF0Zm9ybS5jCj4+PiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3Jt
LmMKPj4+IEBAIC03MSw2ICs3MSwyMSBAQCBzdGF0aWMgaW50IHJpc2N2X2lvbW11X3BsYXRmb3Jt
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiAgICAgICAgICBpb21tdS0+
aXJxc19jb3VudCA9IFJJU0NWX0lPTU1VX0lOVFJfQ09VTlQ7Cj4+Pgo+Pj4gICAgICAgICAgaWdz
ID0gRklFTERfR0VUKFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19JR1MsIGlvbW11LT5jYXBzKTsK
Pj4+ICsKPj4+ICsgICAgICAgLyoKPj4+ICsgICAgICAgICogSUdTPUJPVEggbWVhbnMgdGhlIElP
TU1VIHN1cHBvcnRzIGVpdGhlciBNU0kgb3IgV1NJOwo+Pj4gKyAgICAgICAgKiB0aGUgc3BlYyBs
ZWF2ZXMgdGhlIGNob2ljZSB0byBzb2Z0d2FyZS4gVXNlIHRoZSBmaXJtd2FyZS1kZXNjcmliZWQK
Pj4+ICsgICAgICAgICogd2lyZWQgaW50ZXJydXB0IHJlc291cmNlcyBhcyB0aGUgdHJpZ2dlcjoK
Pj4+ICsgICAgICAgICogICAtIERUICA6ICJpbnRlcnJ1cHRzIiBwcm9wZXJ0eSBwcmVzZW50LCBu
byAibXNpLXBhcmVudCIgIC0+IFdTSQo+Pj4gKyAgICAgICAgKiAgIC0gQUNQSTogRFNEVCBfQ1JT
IEludGVycnVwdCgpIHByZXNlbnQgIC0+IFdTSQo+Pj4gKyAgICAgICAgKiBPdGhlcndpc2UgZGVm
YXVsdCB0byB0aGUgTVNJIHBhdGguCj4+PiArICAgICAgICAqLwo+Pj4gKyAgICAgICBpZiAoaWdz
ID09IFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19JR1NfQk9USCAmJgo+Pj4gKyAgICAgICAgICAg
cGxhdGZvcm1faXJxX2NvdW50KHBkZXYpID4gMCkgewo+Pj4gKyAgICAgICAgICAgICAgIGRldl9p
bmZvKGRldiwgImZpcm13YXJlIGRlc2NyaWJlcyB3aXJlZCBJUlFzOyBwcmVmZXJyaW5nIFdTSSBv
biBJR1M9Qk9USFxuIik7Cj4+PiArICAgICAgICAgICAgICAgaWdzID0gUklTQ1ZfSU9NTVVfQ0FQ
QUJJTElUSUVTX0lHU19XU0k7Cj4+PiArICAgICAgIH0KPj4+ICsKPj4gV29uJ3QgaXQgY2hhbmdl
IHRoZSBEVCBiZWhhdmlvciBhcyBpdCBkb2Vzbid0IGNoZWNrIG1zaS1wYXJlbnQKPj4gYW55bW9y
ZT8gIElPVywgc2hvdWxkIHRoaXMgYmUgbWFkZSBzcGVjaWZpYyB0byBBQ1BJCj4+IGJ5IGNoZWNr
aW5nIHdoZXRoZXIgdGhlIGRldmljZSBub2RlIGlzIGFjcGkgbm9kZT8KPj4KPiAKPiBUaGFua3Mg
Zm9yIHRoZSByZXZpZXcsIHlvdSdyZSByaWdodCB0aGF0IHRoZSBjdXJyZW50IGNvbmRpdGlvbiB3
b3VsZAo+IGFmZmVjdCBEVCBhcyB3ZWxsLgo+IAo+IE15IGFzc3VtcHRpb24gd2FzIHRoYXQgRFQg
d291bGQgZGVzY3JpYmUgZWl0aGVyICJpbnRlcnJ1cHRzIiBmb3IgV1NJCj4gb3IgIm1zaS1wYXJl
bnQiIGZvciBNU0ksIGJ1dCBub3QgYm90aCwgc28gcGxhdGZvcm1faXJxX2NvdW50KCkgPiAwCj4g
d291bGQgZWZmZWN0aXZlbHkgaW1wbHkgIm5vIG1zaS1wYXJlbnQiIGluIHByYWN0aWNlLgo+IAo+
IFRoYXQgc2FpZCwgSSBhZ3JlZSB0aGF0IHRoaXMgc2hvdWxkIGJlIGxpbWl0ZWQgdG8gdGhlIEFD
UEkgcGF0aC4gVGhhdAo+IG1hdGNoZXMgdGhlIGFjdHVhbCBidWcgc2NvcGUg4oCUIG9ubHkgQUNQ
SSB3YXMgZmFsbGluZyBiYWNrIHRvIE1TSSB3aGVuCj4gd2lyZWQgSVJRcyB3ZXJlIGRlc2NyaWJl
ZCDigJQgYW5kIGxlYXZlcyBEVCB1bmNoYW5nZWQuCj4gCj4gSSdsbCByZXNwaW4gYSB2MiB0byBz
Y29wZSB0aGUgZml4IHRvIEFDUEkgb25seSwgYW5kIHRpZ2h0ZW4gdGhlIGNvbW1pdAo+IG1lc3Nh
Z2UgYWNjb3JkaW5nbHkuCgpXaHkgd291bGQgdGhpcyBiZSBzcGVjaWZpYyB0byBBQ1BJPyBBRkFJ
Q1MgaWYgRFQgc3BlY2lmaWVzIGFuIAoibXNpLXBhcmVudCIgcHJvcGVydHkgc3VjaCB0aGF0IGFu
IE1TSSBkb21haW4gZXhpc3RzLCB0aGVuIE1TSXMgd2lsbCBiZSAKcHJlZmVycmVkIGFzIHdlbGws
IHNpbmNlIHRoZSBlbnRpcmUgZnVuY3Rpb24gaXMgc3RydWN0dXJlZCB0byBwcmVmZXIgCk1TSXMg
aWYgYXZhaWxhYmxlLCBhbmQgZmFsbCBiYWNrIHRvIHdpcmVkIGlmIG5vdC4gSWYgdGhlIHN5c3Rl
bSBkb2VzIApzdXBwb3J0IGJvdGggb3B0aW9ucyB0aGVuIERUIHNob3VsZCBkZXNjcmliZSB0aGF0
LCBzYW1lIGFzIEFDUEk7IHdoYXQgCkxpbnV4IGNob29zZXMgdG8gdXNlIGlzIGVudGlyZWx5IExp
bnV4J3Mgb3duIHBvbGljeS4KCkJ1dCBpZiB5b3UgZG8gd2FudCB0byBjaGFuZ2UgdGhlIExpbnV4
IGRyaXZlcidzIHBvbGljeSBmb3Igc29tZSByZWFzb24gCnRoYXQgdGhlIGNvbW1pdCBtZXNzYWdl
IGlzbid0IHJlYWxseSBleHBsYWluaW5nLCB0aGVuIHJlYXJyYW5nZSB0aGUgCndob2xlIHN3aXRj
aCBzdGF0ZW1lbnQ7IGRvbid0IGp1c3QgYWRkIGEgd2VpcmQgaGFjayB0byB0cnkgdG8gZGVmZWF0
IHRoZSAKZXhpc3RpbmcgbG9naWMgX2luIHRoZSBzYW1lIGZ1bmN0aW9uXy4uLgoKSW4gZ2VuZXJh
bCB0aG91Z2gsIEkgd291bGQgaGF2ZSB0aG91Z2h0IHByZWZlcnJpbmcgTVNJcyBtYWtlcyB0aGUg
bW9zdCAKc2Vuc2UsIHNpbmNlIE1TSSB2ZWN0b3JzIGFyZSBnZW5lcmFsbHkgY2hlYXBlciB0aGFu
IHdpcmVzLCBzbyB0aGVyZSdzIGEgCmJldHRlciBjaGFuY2Ugb2YgYmVpbmcgYWJsZSB0byBoYXZl
IHVuaXF1ZSBJUlFzIHBlciBpbnRlcnJ1cHQgc291cmNlLCAKd2hlcmVhcyB3aXRoIHdpcmVzIHlv
dSBtYXkgYmUgc3R1Y2sgd2l0aCBhIGNvbWJpbmVkIElSUS4KCihBcyBhIHNpZGUgbm90ZSwgaXMg
dGhlcmUgYSByZWFzb24gdGhpcyBpcyBjYWxsaW5nIG9mX21zaV9jb25maWd1cmUoKSBvbiAKYSBw
bGF0Zm9ybSBkZXZpY2Ugd2hlbiBvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlX3BkYXRhKCkgd2ls
bCBoYXZlIGRvbmUgCnRoYXQgYWxyZWFkeT8pCgpUaGFua3MsClJvYmluLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
