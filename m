Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E92CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPNHU2ERmkCb4ZD2G5pnVyzmenFvNYFozbujyPIP0rg=; b=Ibl+XfKAc5mhLp
	xloeEXnB48vHUW6Py6Wp3YFyfMYjhXjVnEp3MkVM9s5mOzvOMqnekN2YhD6RJcQj7vJBK3HSeXyHo
	Iea5xnR/4b5yWIaipJ1GW5jzO/Dq1k2qkNFaBsgoGPMt9AUHrnq91rul8GdjX5lWQs9rAdyYh2pyM
	PTTfK+mqmqieIppQCEnka4hjauqO4hJytgVlbRVDnduH2s2XE9CYgK7EFmuoVgs+mHCB748S16YHg
	meetOecVjIxBJLdWirMQCt8ajooH7X6A9JSyWU73itHJg36OcjVMCxBP9FW/KYkp5fB4Got/v7krd
	pRSPAonTLC4FF7iLGOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdcM-00000004B5Y-2QmD;
	Mon, 08 Jun 2026 17:18:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdcM-00000004B5P-0ZmT
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 17:18:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23661601D8
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 17:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1181F00899
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780939108;
	bh=XrNOOi+PlaQWmV4dMJih5PA704/YUREYdhWD77leDwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BzfrUniBTTjg++qitRjPXuRramYkh7ZimNV4b2g34/a/ZCPO2+uFnRv0+ZOCh2gCn
	 ZMm9/hj3Rub1G07qfn9V5+cpbWaiqsW/6pIZC8F76HDQoVMkxxs4jpuYpgmilLij2A
	 Rvr6X6iAeU7p9rHmsWdeMxG+FWfz/AaQv+giGNWKiENiiLrUFHyMjywPWoSIyY+a40
	 xAWJXK3gCe6IppxQ7ghkpj7sDqDVIipFgwiZ9FUMyjq1vIbcdFl76oT54AVlTx3Gvq
	 dr6j9GWXpQA2GeByYuQidFcTYIEpH1YBC8NmKFQ2g0TpGZfHjPZrzW3zxcwqZlA9DW
	 lXqTUK/acxm4g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa7bf3d512so4083239e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 10:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8atLKA7x+8KQtUbSHVmsA+Ji9AHvLCa5tqDoN0OiCrye4wEZUOjIy29LqhGbIz0J9kQaDBXWlNlRA11Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnYJPKWU1qxDMBvoY6ck6IE5J1HSEVmkyNqwr1s6g5t+j9DlKR
	XexgSOnfOIQOxDpBJUmTpFzKjH35wDryTUW84XP334gN1i211/DYd626xpP5OYKD2rxrXcH9rQ6
	7FSHChKHSm4a955hGnLCZrGo/D65tR1w=
X-Received: by 2002:a05:6512:33c3:b0:5aa:6e5d:adf5 with SMTP id
 2adb3069b0e04-5aa87beb34fmr4601211e87.19.1780939107273; Mon, 08 Jun 2026
 10:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 19:18:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
X-Gm-Features: AVVi8CcTa11c5Xl8V7_VF2hxe7iSgWJNbGaXh3nHX-6VT5F-TvPgOxONicEOC_k
Message-ID: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxMDoyMeKAr0FNIExvcmVuem8gUGllcmFsaXNpIDxscGll
cmFsaXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gUmVnaXN0ZXIgYW4gQUNQSSBob29rIGluIHRo
ZSBBQ1BJIGludGVycnVwdCBtYW5hZ2VtZW50IGNvZGUgZm9yIEdJQ3Y1IHRvCj4gcmV0cmlldmUg
dGhlIEFDUEkgaW50ZXJydXB0IGNvbnRyb2xsZXIgaGFuZGxlIChpZiBhbnkpIG9mIHRoZSBjb250
cm9sbGVyCj4gaGFuZGxpbmcgYSBzcGVjaWZpYyBHU0ksIGJ5IHVwZGF0aW5nIHRoZSBhY3BpX3Nl
dF9pcnFfbW9kZWwoKSBjYWxsIHdpdGgKPiB0aGUgZ2ljX3Y1X2dldF9nc2lfaGFuZGxlKCkgZnVu
Y3Rpb24gcG9pbnRlciBwYXJhbWV0ZXIuCj4KPiBnaWN2NV9nZXRfZ3NpX2hhbmRsZSgpIGFsbG93
cyBBQ1BJIGNvcmUgdG8gZGV0ZWN0IHRoZSBBQ1BJIGhhbmRsZQo+IG9mIHRoZSBjb250cm9sbGVy
IHRoYXQgbWFuYWdlcyBhIHNwZWNpZmljIEdTSSBpbnRlcnJ1cHQuCj4KPiBVcGRhdGUgdGhlIElX
QiBkcml2ZXIgdG8gY2xlYXIgZGV2aWNlIGRlcGVuZGVuY2llcyBpbiBBQ1BJIGNvcmUgb25jZSB0
aGUKPiBJV0IgZHJpdmVyIGhhcyBwcm9iZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFBp
ZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAa2VybmVsLm9yZz4KPiBDYzogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4KPiAtLS0K
PiAgZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUtaXdiLmMgfCAgNSArKysrKwo+ICBkcml2ZXJz
L2lycWNoaXAvaXJxLWdpYy12NS5jICAgICB8IDEzICsrKysrKysrKysrLS0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl3Yi5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1n
aWMtdjUtaXdiLmMKPiBpbmRleCA5MTAzZmViNzBjZTguLmEwMmNiOTUzN2IxNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS1pd2IuYwo+ICsrKyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtZ2ljLXY1LWl3Yi5jCj4gQEAgLTI2OSw2ICsyNjksMTEgQEAgc3RhdGljIGludCBn
aWN2NV9pd2JfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAg
ICAgICBpZiAoSVNfRVJSKGl3Yl9ub2RlKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9F
UlIoaXdiX25vZGUpOwo+Cj4gKyNpZmRlZiBDT05GSUdfQUNQSQo+ICsgICAgICAgaWYgKGhhc19h
Y3BpX2NvbXBhbmlvbigmcGRldi0+ZGV2KSkKPiArICAgICAgICAgICAgICAgYWNwaV9kZXZfY2xl
YXJfZGVwZW5kZW5jaWVzKEFDUElfQ09NUEFOSU9OKCZwZGV2LT5kZXYpKTsKPiArI2VuZGlmCgpJ
IHdvdWxkIHJhdGhlciBhZGQgYSB3cmFwcGVyIGZvciB0aGlzLCBhbG9uZyB3aXRoIGFuIGVtcHR5
IHN0dWIgZm9yCnRoZSAhQ09ORklHX0FDUEkgY2FzZS4KCj4gKwo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1naWMtdjUuYwo+IGluZGV4IDAzY2MyODMwYjI2MC4uMjZjZmFlYTFh
ZjQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LmMKPiArKysgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jCj4gQEAgLTEyMTcsMTEgKzEyMTcsMTkgQEAgc3Rh
dGljIHN0cnVjdCBmd25vZGVfaGFuZGxlICpnc2lfZG9tYWluX2hhbmRsZTsKPiAgc3RhdGljIHN0
cnVjdCBmd25vZGVfaGFuZGxlICpnaWNfdjVfZ2V0X2dzaV9kb21haW5faWQodTMyIGdzaSkKPiAg
ewo+ICAgICAgICAgaWYgKEZJRUxEX0dFVChHSUNWNV9HU0lfSUNfVFlQRSwgZ3NpKSA9PSBHSUNW
NV9HU0lfSVdCX1RZUEUpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBpb3J0X2l3Yl9oYW5kbGUo
RklFTERfR0VUKEdJQ1Y1X0dTSV9JV0JfRlJBTUVfSUQsIGdzaSkpOwo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gaW9ydF9pd2JfaGFuZGxlX2Z3bm9kZShGSUVMRF9HRVQoR0lDVjVfR1NJX0lXQl9G
UkFNRV9JRCwgZ3NpKSk7CgpXaHkgaXMgdGhpcyBjaGFuZ2UgbmVlZGVkPwoKPgo+ICAgICAgICAg
cmV0dXJuIGdzaV9kb21haW5faGFuZGxlOwo+ICB9Cj4KPiArc3RhdGljIGFjcGlfaGFuZGxlIGdp
Y192NV9nZXRfZ3NpX2hhbmRsZSh1MzIgZ3NpKQo+ICt7Cj4gKyAgICAgICBpZiAoRklFTERfR0VU
KEdJQ1Y1X0dTSV9JQ19UWVBFLCBnc2kpID09IEdJQ1Y1X0dTSV9JV0JfVFlQRSkKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIGlvcnRfaXdiX2hhbmRsZShGSUVMRF9HRVQoR0lDVjVfR1NJX0lXQl9G
UkFNRV9JRCwgZ3NpKSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIE5VTEw7Cj4gK30KPiArCj4gIHN0
YXRpYyBpbnQgX19pbml0IGdpY19hY3BpX2luaXQodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJz
ICpoZWFkZXIsIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
YWNwaV9tYWR0X2dpY3Y1X2lycyAqaXJzID0gKHN0cnVjdCBhY3BpX21hZHRfZ2ljdjVfaXJzICop
aGVhZGVyOwo+IEBAIC0xMjQyLDcgKzEyNTAsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBnaWNfYWNw
aV9pbml0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAqaGVhZGVyLCBjb25zdCB1bnNpZwo+
ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBvdXRfaXJzOwo+Cj4gLSAg
ICAgICBhY3BpX3NldF9pcnFfbW9kZWwoQUNQSV9JUlFfTU9ERUxfR0lDX1Y1LCBnaWNfdjVfZ2V0
X2dzaV9kb21haW5faWQsIE5VTEwpOwo+ICsgICAgICAgYWNwaV9zZXRfaXJxX21vZGVsKEFDUElf
SVJRX01PREVMX0dJQ19WNSwgZ2ljX3Y1X2dldF9nc2lfZG9tYWluX2lkLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdpY192NV9nZXRfZ3NpX2hhbmRsZSk7Cj4KPiAgICAgICAgIHJldHVy
biAwOwo+Cj4KPiAtLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
