Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977CCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gffk+bOzpRpLDurUT3SJdi3o8xZx/g5trgo0hYt6Bn8=; b=PZvpOSPcCJYG2l
	RsCBfI1Zw23xhODVlA8B2xfF45z4RB/RaGWwKHBcff0uLUAnCEyGI+6POL6SqJdCluJljfHeiVA7Z
	toT00o99cqPGqRT8cfQpPyBcDBXnUnSoPEJN/g+ZFOlWK4SdiNJ8c8yUf4YVwZG0HB0u6rc0/NmKH
	0INvzNECMLk8RkbtOe665KtEPMDPa+6L8AoNaf8NmoCd1p3fzjQXnfyRRI/GkuCoFeS/FDSgTFyHQ
	El0iDplpbVMO5mwzuz4sCM0JKR8GH7ex1MVdW6Fey12dht3CUteRyRu9ppmebgwv+W46kwLsL2mG/
	N7y6COICsT6SIqDvYGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYo5-00000007QsL-1eZq;
	Wed, 10 Apr 2024 14:20:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYo1-00000007QrY-3oGZ;
	Wed, 10 Apr 2024 14:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0093ACE29ED;
	Wed, 10 Apr 2024 14:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFEBC433B1;
	Wed, 10 Apr 2024 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758803;
	bh=OvoVNaySrcXw62YX7UG0Hd2hLfS04EbJaAtBVkIIqd8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s5PUTdDHBVvTl0uWmYq/RKh8Aa8mIAETnLABi1L3GGcnVaDiAnN6DgdGTb4B1wwpX
	 PQBJDnMksAax6GHrRfANFcQkVRxHXdz4xI6wV4SD/31BCwju1b3UJZhIIQ/i6+NuvZ
	 AuCnnYt9U0fNVXvhwVsQPkJs9aysHYSdYvsHGQA6fyUgQwG86k6t+qDtL1nznrMudT
	 dq/2gTJxzeqm7Jrd1OgDua4rSQnMVIlwNufz86jQyLGE0aUwkFmQn2ySsUivHJHam+
	 5YdthBMby3c3qh9i3I47xtQsKEH+xSnd5/uOT+TTvCQwFW5oKjEm3i7aISHe3EGTs8
	 7WHVpWvOL640Q==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-22ec8db3803so548191fac.1;
        Wed, 10 Apr 2024 07:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg3z0BwoeAfcPCi8hGb3zfof7/PUIYl+am4QK8ghqtbDQHcpEhA7TjCiz1dPgFSt5hh51Eu0tcPSuWK+arYibH4DIiHRgvtyA3sT9C00HW+GSFpSZmRRPHUCOPNkB/6MW1CPWP2TaBAjvwx2jukxPhdLgGKww=
X-Gm-Message-State: AOJu0Yyl+B7LKjpWLD4jRn2eJ95gLg1Of5dPVyY2I3O11etnfO7vLt7J
	7cf5mrlssSA9cx9rbY+WJSg5tcUc+wTEl1nNdQ2XNm7ouEqKr5aWq0Za+Tg9654j5jFv+uI2vvI
	puI9ESjkLNYdcOLS/RVgw9T1jiN8=
X-Google-Smtp-Source: AGHT+IFUbYvctHLscpPyYTlJqJkvjz7Lv1BPzvm+G1krAlpB1R6DPKUMcWT+4z93yfQwfckyfvgV5dE3NAZ750FVX1Q=
X-Received: by 2002:a05:6870:9e47:b0:22e:b175:3c22 with SMTP id
 pt7-20020a0568709e4700b0022eb1753c22mr3170425oab.1.1712758802087; Wed, 10 Apr
 2024 07:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk> <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
 <20240322185327.00002416@Huawei.com> <20240410134318.0000193c@huawei.com>
 <CAJZ5v0ggD042sfz3jDXQVDUxQZu_AWaF2ox-Me8CvFeRB8nczw@mail.gmail.com> <20240410145005.00003050@Huawei.com>
In-Reply-To: <20240410145005.00003050@Huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Apr 2024 16:19:50 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hRPFd7jmhJdCu8jVCRc4hZRUt9sKm6iWfynZH1mX7rCg@mail.gmail.com>
Message-ID: <CAJZ5v0hRPFd7jmhJdCu8jVCRc4hZRUt9sKm6iWfynZH1mX7rCg@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from acpi_processor_get_info()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_072006_392798_55D36BEB 
X-CRM114-Status: GOOD (  44.72  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMzo1MOKAr1BNIEpvbmF0aGFuIENhbWVyb24KPEpvbmF0
aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDEwIEFwciAyMDI0IDE1
OjI4OjE4ICswMjAwCj4gIlJhZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4gPiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAyOjQz4oCvUE0gSm9uYXRoYW4gQ2Ft
ZXJvbgo+ID4gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2NwdS5jIGIvZHJpdmVy
cy9iYXNlL2NwdS5jCj4gPiA+ID4gPiA+IGluZGV4IDQ3ZGUwZjE0MGJhNi4uMTNkMDUyYmYxM2Y0
IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Jhc2UvY3B1LmMKPiA+ID4gPiA+ID4g
KysrIGIvZHJpdmVycy9iYXNlL2NwdS5jCj4gPiA+ID4gPiA+IEBAIC01NTMsNyArNTUzLDExIEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBjcHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWModm9pZCkKPiA+ID4g
PiA+ID4gIHsKPiA+ID4gPiA+ID4gICAgICAgICBpbnQgaSwgcmV0Owo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiAtICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19DUFVfREVWSUNF
UykpCj4gPiA+ID4gPiA+ICsgICAgICAgLyoKPiA+ID4gPiA+ID4gKyAgICAgICAgKiBXaGVuIEFD
UEkgaXMgZW5hYmxlZCwgQ1BVcyBhcmUgcmVnaXN0ZXJlZCB2aWEKPiA+ID4gPiA+ID4gKyAgICAg
ICAgKiBhY3BpX3Byb2Nlc3Nvcl9nZXRfaW5mbygpLgo+ID4gPiA+ID4gPiArICAgICAgICAqLwo+
ID4gPiA+ID4gPiArICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19DUFVfREVW
SUNFUykgfHwgIWFjcGlfZGlzYWJsZWQpCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1
cm47Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSG9uZXN0bHksIHRoaXMgbG9va3MgbGlrZSBhIHF1aWNr
IGhhY2sgdG8gbWUgYW5kIGl0IGFic29sdXRlbHkKPiA+ID4gPiA+IHJlcXVpcmVzIGFuIEFDSyBm
cm9tIHRoZSB4ODYgbWFpbnRhaW5lcnMgdG8gZ28gYW55d2hlcmUuCj4gPiA+ID4gV2lsbCBhZGRy
ZXNzIHRoaXMgc2VwYXJhdGVseS4KPiA+ID4gPgo+ID4gPgo+ID4gPiBTbyBkbyBwZW9wbGUgcHJl
ZmVyIHRoaXMgaGFjaywgb3Igc29tZXRoaW5nIGFsb25nIGxpbmVzIG9mIHRoZSBmb2xsb3dpbmc/
Cj4gPiA+Cj4gPiA+IHN0YXRpYyBpbnQgX19pbml0IGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJpYyh2
b2lkKQo+ID4gPiB7Cj4gPiA+ICAgICAgICAgaW50IGksIHJldCA9IDA7Cj4gPiA+Cj4gPiA+ICAg
ICAgICAgZm9yX2VhY2hfb25saW5lX2NwdShpKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAo
IWdldF9jcHVfZGV2aWNlKGkpKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IGFyY2hfcmVnaXN0ZXJfY3B1KGkpOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
cmV0KQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4oInJlZ2lz
dGVyX2NwdSAlZCBmYWlsZWQgKCVkKVxuIiwgaSwgcmV0KTsKPiA+ID4gICAgICAgICAgICAgICAg
IH0KPiA+ID4gICAgICAgICB9Cj4gPiA+ICAgICAgICAgLy9Qcm9iYWJseSBqdXN0IGVhdCB0aGUg
ZXJyb3IuCj4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+IH0KPiA+ID4gc3Vic3lzX2luaXRj
YWxsX3N5bmMoY3B1X2Rldl9yZWdpc3Rlcl9nZW5lcmljKTsKPiA+Cj4gPiBJIHdvdWxkIHByZWZl
ciBzb21ldGhpbmcgbGlrZSB0aGUgYWJvdmUuCj4gPgo+ID4gSSBhY3R1YWxseSB0aG91Z2h0IHRo
YXQgYXJjaF9yZWdpc3Rlcl9jcHUoKSBtaWdodCByZXR1cm4gc29tZXRoaW5nCj4gPiBsaWtlIC1F
UFJPQkVfREVGRVIgd2hlbiBpdCBjYW5ub3QgZGV0ZXJtaW5lIHdoZXRoZXIgb3Igbm90IHRoZSBD
UFUgaXMKPiA+IHJlYWxseSBhdmFpbGFibGUuCj4KPiBPay4gVGhhdCB3b3VsZCBlbmQgdXAgbG9v
a2luZyBtdWNoIG1vcmUgbGlrZSB0aGUgb3JpZ2luYWwgY29kZSBJIHRoaW5rLgo+IFNvIHdlIHdv
dWxkbid0IGhhdmUgdGhpcyBsYXRlIHJlZ2lzdHJhdGlvbiBhdCBhbGwsIG9yIGtlZXAgaXQgZm9y
IERUCj4gb24gYXJtNjQ/ICBJJ20gbm90IHN1cmUgdGhhdCdzIGEgY2xlYW4gc29sdXRpb24gdGhv
dWdoIGxlYXZlcwo+IHRoZSB4ODYgcGF0aCBhbG9uZS4KCkknbSBub3Qgc3VyZSB3aHkgRFQgb24g
YXJtNjQgd291bGQgbmVlZCB0byBkbyBsYXRlIHJlZ2lzdHJhdGlvbi4KClRoZXJlIGlzIHRoaXMg
Y2hhaW4gb2YgY2FsbHMgaW4gdGhlIG1haW5saW5lIHRvZGF5OgoKZHJpdmVyX2luaXQoKQogIGNw
dV9kZXZfaW5pdCgpCiAgICBjcHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWMoKQoKdGhlIGxhc3Qgb2Yg
d2hpY2ggcmVnaXN0ZXJzIENQVXMgb24gYXJtNjQvRFQgc3lzdGVtcyBJSVVDLiBJIGRvbid0IHNl
ZQphIG5lZWQgdG8gY2hhbmdlIHRoaXMgYmVoYXZpb3IuCgpPbiBhcm02NC9BQ1BJLCB0aG91Z2gs
IGFyY2hfcmVnaXN0ZXJfY3B1KCkgY2Fubm90IG1ha2UgcHJvZ3Jlc3MgdW50aWwKaXQgY2FuIGxv
b2sgaW50byB0aGUgQUNQSSBOYW1lc3BhY2UsIHNvIEkgd291bGQganVzdCBtYWtlIGl0IHJldHVy
bgotRVBST0JFX0RFRkVSIG9yIGVxdWl2YWxlbnQgdGhlbiBhbmQgdGhlIEFDUEkgZW51bWVyYXRp
b24gd2lsbCBmaW5kCnRoZSBDUFUgYW5kIGJhc2ljYWxseSB0cmVhdCBpdCBhcyBvbmUgdGhhdCBo
YXMganVzdCBhcHBlYXJlZC4KCj4gSWYgd2UgZ2V0IHJpZCBvZiB0aGlzIGNhdGNoIGFsbCwgc29s
dXRpb24gd291bGQgYmUgdG8gbW92ZSB0aGUKPiAhYWNwaV9kaXNhYmxlZCBjaGVjayBpbnRvIHRo
ZSBhcm02NCB2ZXJzaW9uIG9mIGFyY2hfY3B1X3JlZ2lzdGVyKCkKPiBiZWNhdXNlIHdlIHdvdWxk
IG9ubHkgd2FudCB0aGUgZGVsYXllZCByZWdpc3RyYXRpb24gcGF0aCB0byBiZQo+IHVzZWQgb24g
QUNQSSBjYXNlcyB3aGVyZSB0aGUgcXVlc3Rpb24gb2YgQ1BVIGF2YWlsYWJpbGl0eSBjYW4ndAo+
IHlldCBiZSByZXNvbHZlZC4KCkV4YWN0bHkuCgpUaGlzIGlzIHNpbWlsYXIgKGlmIG5vdCBlcXVp
dmFsZW50IGV2ZW4pIHRvIGEgQ1BVIGJlY29taW5nIGF2YWlsYWJsZQpiZXR3ZWVuIHRoZSBjcHVf
ZGV2X3JlZ2lzdGVyX2dlbmVyaWMoKSBjYWxsIGFuZCB0aGUgQUNQSSBlbnVtZXJhdGlvbi4KCj4g
Pgo+ID4gVGhlbiwgdGhlIEFDUEkgcHJvY2Vzc29yIGVudW1lcmF0aW9uIHBhdGggbWF5IHRha2Ug
Y2FyZSBvZiByZWdpc3RlcmluZwo+ID4gQ1BVIHRoYXQgaGF2ZSBub3QgYmVlbiByZWdpc3RlcmVk
IHNvIGZhciBhbmQgaW4gdGhlIG1vcmUtb3ItbGVzcyB0aGUKPiA+IHNhbWUgd2F5IHJlZ2FyZGxl
c3Mgb2YgdGhlIGFyY2hpdGVjdHVyZSAobW9kdWxvIHNvbWUgYXJjaC1zcGVjaWZpYwo+ID4gc3R1
ZmYpLgo+Cj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgaW4gYWNwaV9wcm9jZXNzb3JfZ2V0
X2luZm8oKSB3ZSdkIGVuZCB1cAo+IHdpdGggYSBzaW1pbGFyIGNoZWNrIG9uIHdoZXRoZXIgaXQg
d2FzIGFscmVhZHkgcmVnaXN0ZXJlZCAodGhlIHg4NiBwYXRoKQo+IG9yIGhhZCBiZSBkZWZlcnJl
ZCAoYXJtNjQgLyBhY3BpKS4KPgo+ID4KPiA+IEluIHRoZSBlbmQsIGl0IHNob3VsZCBiZSBwb3Nz
aWJsZSB0byBhdm9pZCBjaGFuZ2luZyB0aGUgYmVoYXZpb3Igb2YKPiA+IHg4NiBhbmQgbG9vbmdh
cmNoIGluIHRoaXMgc2VyaWVzLgo+Cj4gUG9zc2libGUsIHllcywgYnV0IHJlc3VsdCBpZiBJIHVu
ZGVyc3RhbmQgY29ycmVjdGx5IGlzIHdlIGVuZCB1cCB3aXRoCj4gdmVyeSBkaWZmZXJlbnQgZmxv
d3MgYW5kIHJlcGxpY2F0aW9uIG9mIGZ1bmN0aW9uYWxpdHkgYmV0d2VlbiB0aGUKPiBlYXJseSBy
ZWdpc3RyYXRpb24gYW5kIHRoZSBsYXRlIG9uZS4gSSdtIGZpbmUgd2l0aCB0aGF0IGlmIHlvdSBw
cmVmZXIgaXQhCgpCdXQgdGhhdCdzIHdoYXQgaXMgdGhlcmUgdG9kYXksIGlzbid0IGl0PwoKSSB0
aGluayB0aGlzIGNhbiBiZSBjaGFuZ2VkIHRvIHJlZHVjZSB0aGUgZHVwbGljYXRpb24sIGJ1dCBJ
J2QgcHJlZmVyCnRvIGRvIHRoYXQgbGF0ZXIsIHdoZW4gdGhlIHJlcXVpc2l0ZSBmdW5jdGlvbmFs
aXR5IGlzIGluIHBsYWNlIGFuZCB3ZQpqdXN0IGRvIHRoZSBjb25zb2xpZGF0aW9uLiAgSW4gdGhh
dCBjYXNlLCBpZiBhbnl0aGluZyBnb2VzIHdyb25nLCB3ZQpjYW4gdGFrZSBhIHN0ZXAgYmFjayBh
bmQgcmVjb25zaWRlciB3aXRob3V0IGRlZmVycmluZyB0aGUgYXJtNjQgQ1BVCmhvdHBsdWcgc3Vw
cG9ydC4KCj4gPgo+ID4gPiBXaGljaCBtYXkgbG9vayBmYW1pbGlhciBhdCBpdCdzIGVmZmVjdGl2
ZWx5IHBhdGNoIDMgZnJvbSB2MyB3aGljaCB3YXMgZGVhbGluZwo+ID4gPiB3aXRoIENQVXMgbWlz
c2luZyBmcm9tIERTRFQgKHNvbWV0aGluZyB3ZSB0aGluayBkb2Vzbid0IGhhcHBlbikuCj4gPiA+
Cj4gPiA+IEl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGVsaWRlIHRoZSBhcmNoX3JlZ2lzdGVyX2Nw
dSgpIGluCj4gPiA+IG1ha2VfcHJlc2VudCgpIGJ1dCB0aGF0IHdpbGwgbWVhbiB3ZSB1c2UgZGlm
ZmVyZW50IGZsb3dzIGluIHRoaXMgcGF0Y2ggc2V0Cj4gPiA+IGZvciB0aGUgaG90cGx1ZyBhbmQg
aW5pdGlhbGx5IHByZXNlbnQgY2FzZXMgd2hpY2ggaXMgYSBiaXQgbWVzc3kuCj4gPiA+Cj4gPiA+
IEkndmUgdGVzdGVkIHRoaXMgbGlnaHRseSBvbiBhcm02NCBhbmQgeDg2IEFDUEkgKyBEVCBib290
aW5nIGFuZCBpdCAic2VlbXMiIGZpbmUuCj4gPgo+ID4gU291bmRzIHByb21pc2luZy4KPgo+IFBv
c3NpYmx5IG5vdCB0aGF0IHJlbGV2YW50IHRob3VnaCBpZiBwcm9wb3NhbCBpcyB0byBkcm9wIHRo
aXMgYXBwcm9hY2guIDooCj4gQXQgbGVhc3QgSSBub3cgaGF2ZSB0ZXN0IHNldHVwcyEKCkdyZWF0
IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
