Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C48CD6E79
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUn1GKKFN47AFRlgDJjAmvkDc7FVRQ+WFYE8gWOBSh8=; b=3tGYnEIdg8hDoH
	VtxNOj237qs/xnhXKYF2Tgum4WQMIQzdDQnIYCcvejRO22CPyorJjeHKjSOWK26UbNVVwCj/g/nLK
	ATVbuhdbmmh6HAuxnx7TMEOfLxUg2MSTu9OWWFd2Fhg9kYUkO2D6ZXn/DfQdhXubazDhm+NwUhFXq
	Djwf6sq4xVg6O7Ae/aHA+X82SKFClNkxs2mxsK4Uj1y4I5zv3CNzQM67KC8yr72aIGVsks9w4ZBmI
	wPWXxp51KBftfYCzB08bzoMduAWp9ns+PXCq2Qv0uVhxrHmsUl8dt6nJYC9T7BCbU4tH/m5FWFZBL
	TEbIKSh5Q0gV2SNK370Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWso7-00000005DE7-41iC;
	Tue, 09 Jun 2026 09:31:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWso6-00000005DDO-1onP;
	Tue, 09 Jun 2026 09:31:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0503743F92;
	Tue,  9 Jun 2026 09:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0606B1F00893;
	Tue,  9 Jun 2026 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780997497;
	bh=2O0A8k7i0uc3+GN/wePb/LhobyOV72RtaqOWFuiG+AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mAI6hhRXHfGBva7Rk3YIaxAe7+mGw8/Nc1CfF0iSOK7POUGUFrcPUd8rhYyAIQ/PA
	 dlYb0Z433wrDey4OY33Evo/RywrrH3HIGh1lADXKvY+gT6ZAUmg6ZBjy9/IrdeOviS
	 NuiO0yVrE5IWQNWfJz8xhh0BIlRrIE9lOhSaL3/LGs4BGbbOAr8eiDOybX/erkM50Z
	 B52wIBz2lnFpm0+319gQkrelQ1Y5h7gPp1y7bgpmHtOqRm2vnr9gBYfgU/iSufmUkS
	 R9LDV5FA/sPADE1rEeSrsfU5+o2bX1TWV5nsX2r5S6NA9HAXJye9hxqLxf1vBOU5LO
	 B5RcmBKv9b83Q==
Date: Tue, 9 Jun 2026 11:31:31 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
Message-ID: <aifdc2E/+YCvCnwG@lpieralisi>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
 <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMDgsIDIwMjYgYXQgMDc6MTg6MTVQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMywgMjAyNiBhdCAxMDoyMeKAr0FNIExvcmVuem8gUGll
cmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFJlZ2lzdGVyIGFu
IEFDUEkgaG9vayBpbiB0aGUgQUNQSSBpbnRlcnJ1cHQgbWFuYWdlbWVudCBjb2RlIGZvciBHSUN2
NSB0bwo+ID4gcmV0cmlldmUgdGhlIEFDUEkgaW50ZXJydXB0IGNvbnRyb2xsZXIgaGFuZGxlIChp
ZiBhbnkpIG9mIHRoZSBjb250cm9sbGVyCj4gPiBoYW5kbGluZyBhIHNwZWNpZmljIEdTSSwgYnkg
dXBkYXRpbmcgdGhlIGFjcGlfc2V0X2lycV9tb2RlbCgpIGNhbGwgd2l0aAo+ID4gdGhlIGdpY192
NV9nZXRfZ3NpX2hhbmRsZSgpIGZ1bmN0aW9uIHBvaW50ZXIgcGFyYW1ldGVyLgo+ID4KPiA+IGdp
Y3Y1X2dldF9nc2lfaGFuZGxlKCkgYWxsb3dzIEFDUEkgY29yZSB0byBkZXRlY3QgdGhlIEFDUEkg
aGFuZGxlCj4gPiBvZiB0aGUgY29udHJvbGxlciB0aGF0IG1hbmFnZXMgYSBzcGVjaWZpYyBHU0kg
aW50ZXJydXB0Lgo+ID4KPiA+IFVwZGF0ZSB0aGUgSVdCIGRyaXZlciB0byBjbGVhciBkZXZpY2Ug
ZGVwZW5kZW5jaWVzIGluIEFDUEkgY29yZSBvbmNlIHRoZQo+ID4gSVdCIGRyaXZlciBoYXMgcHJv
YmVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNp
QGtlcm5lbC5vcmc+Cj4gPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4g
PiBDYzogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
aXJxY2hpcC9pcnEtZ2ljLXY1LWl3Yi5jIHwgIDUgKysrKysKPiA+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLWdpYy12NS5jICAgICB8IDEzICsrKysrKysrKysrLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl3Yi5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMt
djUtaXdiLmMKPiA+IGluZGV4IDkxMDNmZWI3MGNlOC4uYTAyY2I5NTM3YjE1IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUtaXdiLmMKPiA+ICsrKyBiL2RyaXZlcnMv
aXJxY2hpcC9pcnEtZ2ljLXY1LWl3Yi5jCj4gPiBAQCAtMjY5LDYgKzI2OSwxMSBAQCBzdGF0aWMg
aW50IGdpY3Y1X2l3Yl9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+ICAgICAgICAgaWYgKElTX0VSUihpd2Jfbm9kZSkpCj4gPiAgICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoaXdiX25vZGUpOwo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX0FDUEkKPiA+ICsg
ICAgICAgaWYgKGhhc19hY3BpX2NvbXBhbmlvbigmcGRldi0+ZGV2KSkKPiA+ICsgICAgICAgICAg
ICAgICBhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoQUNQSV9DT01QQU5JT04oJnBkZXYtPmRl
dikpOwo+ID4gKyNlbmRpZgo+IAo+IEkgd291bGQgcmF0aGVyIGFkZCBhIHdyYXBwZXIgZm9yIHRo
aXMsIGFsb25nIHdpdGggYW4gZW1wdHkgc3R1YiBmb3IKPiB0aGUgIUNPTkZJR19BQ1BJIGNhc2Uu
CgpPaywgSSB3aWxsLgoKPiA+ICsKPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1naWMtdjUuYwo+ID4gaW5kZXggMDNjYzI4MzBiMjYwLi4yNmNmYWVhMWFmNDEgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jCj4gPiArKysgYi9kcml2
ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jCj4gPiBAQCAtMTIxNywxMSArMTIxNywxOSBAQCBzdGF0
aWMgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmdzaV9kb21haW5faGFuZGxlOwo+ID4gIHN0YXRpYyBz
dHJ1Y3QgZndub2RlX2hhbmRsZSAqZ2ljX3Y1X2dldF9nc2lfZG9tYWluX2lkKHUzMiBnc2kpCj4g
PiAgewo+ID4gICAgICAgICBpZiAoRklFTERfR0VUKEdJQ1Y1X0dTSV9JQ19UWVBFLCBnc2kpID09
IEdJQ1Y1X0dTSV9JV0JfVFlQRSkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gaW9ydF9pd2Jf
aGFuZGxlKEZJRUxEX0dFVChHSUNWNV9HU0lfSVdCX0ZSQU1FX0lELCBnc2kpKTsKPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gaW9ydF9pd2JfaGFuZGxlX2Z3bm9kZShGSUVMRF9HRVQoR0lDVjVf
R1NJX0lXQl9GUkFNRV9JRCwgZ3NpKSk7Cj4gCj4gV2h5IGlzIHRoaXMgY2hhbmdlIG5lZWRlZD8K
ClRoaXMgaXMgYSBtaXN0YWtlLCB0aGFua3MgZm9yIHNwb3R0aW5nIGl0LCBpdCBiZWxvbmdzIGlu
IHRoZSBwcmV2aW91cyBwYXRjaAooSU1PIHBhdGNoIDUgYW5kIDYgYXJlIGEgc2luZ2xlIGxvZ2lj
YWwgZW50aXR5LCBJIHNwbGl0IGl0IHRvIHRyeSB0byBrZWVwCmlycWNoaXAgc3BlY2lmaWMgY2hh
bmdlcyBpbiBvbmUgcGF0Y2gpLgoKaW9ydF9pd2JfaGFuZGxlKCkgd2FzIHJlZmFjdG9yZWQgdG8g
cmV0dXJuIGFuIGFjcGlfaGFuZGxlIG5vdCBhIGZ3bm9kZV9oYW5kbGUKKGluIHByZXBhcmF0aW9u
IGZvciBhZGRpbmcgZ2ljX3Y1X2dldF9nc2lfaGFuZGxlKCkgYmVsb3cgLSB0aGUgZGVwZW5kZW5j
eQpjaGFpbiByZXF1aXJlcyBhY3BpX2hhbmRsZSByZXRyaWV2YWwgbm90IGZ3bm9kZV9oYW5kbGUp
LCBzbyB0aGUgY2hhbmdlIGFib3ZlCmJlbG9uZ3MgaW4gcGF0Y2ggNSwgSSB3aWxsIG1vdmUgdGhp
cyBsaW5lIGNoYW5nZSB0byBwYXRjaCA1IGluIHYzLgoKVGhhbmtzLApMb3JlbnpvCgo+ID4KPiA+
ICAgICAgICAgcmV0dXJuIGdzaV9kb21haW5faGFuZGxlOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGlj
IGFjcGlfaGFuZGxlIGdpY192NV9nZXRfZ3NpX2hhbmRsZSh1MzIgZ3NpKQo+ID4gK3sKPiA+ICsg
ICAgICAgaWYgKEZJRUxEX0dFVChHSUNWNV9HU0lfSUNfVFlQRSwgZ3NpKSA9PSBHSUNWNV9HU0lf
SVdCX1RZUEUpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGlvcnRfaXdiX2hhbmRsZShGSUVM
RF9HRVQoR0lDVjVfR1NJX0lXQl9GUkFNRV9JRCwgZ3NpKSk7Cj4gPiArCj4gPiArICAgICAgIHJl
dHVybiBOVUxMOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW50IF9faW5pdCBnaWNfYWNwaV9p
bml0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAqaGVhZGVyLCBjb25zdCB1bnNpZ25lZCBs
b25nIGVuZCkKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBhY3BpX21hZHRfZ2ljdjVfaXJzICpp
cnMgPSAoc3RydWN0IGFjcGlfbWFkdF9naWN2NV9pcnMgKiloZWFkZXI7Cj4gPiBAQCAtMTI0Miw3
ICsxMjUwLDggQEAgc3RhdGljIGludCBfX2luaXQgZ2ljX2FjcGlfaW5pdCh1bmlvbiBhY3BpX3N1
YnRhYmxlX2hlYWRlcnMgKmhlYWRlciwgY29uc3QgdW5zaWcKPiA+ICAgICAgICAgaWYgKHJldCkK
PiA+ICAgICAgICAgICAgICAgICBnb3RvIG91dF9pcnM7Cj4gPgo+ID4gLSAgICAgICBhY3BpX3Nl
dF9pcnFfbW9kZWwoQUNQSV9JUlFfTU9ERUxfR0lDX1Y1LCBnaWNfdjVfZ2V0X2dzaV9kb21haW5f
aWQsIE5VTEwpOwo+ID4gKyAgICAgICBhY3BpX3NldF9pcnFfbW9kZWwoQUNQSV9JUlFfTU9ERUxf
R0lDX1Y1LCBnaWNfdjVfZ2V0X2dzaV9kb21haW5faWQsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICBnaWNfdjVfZ2V0X2dzaV9oYW5kbGUpOwo+ID4KPiA+ICAgICAgICAgcmV0dXJuIDA7
Cj4gPgo+ID4KPiA+IC0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
