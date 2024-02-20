Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A1C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIkecCwmHuH+ypTV+zcYsgBSuiKJxNerZMa1lmyk6Yw=; b=fWe1O2OCWwZgkx
	rKFy79JxQAEvoN2yJS1Fda63iptI8vVixCGlYjqhciTJm3lTu3eKG2IVbsT9/1fQOm9PmR8x7V7C1
	/RpzHdZtxhPRnQwI1iBvrKJXVQ5LQGQa2Q6WzVaEEiw/I/FPACm8R/ps+IpJ7kQTIvu09Dkcl++zr
	UWKe87RsFK2Tr8Otqx9PCQzBQvkN3igHnVdfZhtuxjDV4nIEM75G25oQWEzk8V/2cYHbE/0iA90sk
	UwA3/75kTmMU7nyDZ2lTzGQ9zaGaKS7vA8xdLOtYd6xH1tL+xOd3mgKnBNUlQrNkk0LA9ai4jfgrR
	Fh7Y95xFvI/nlK9n7scA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOJg-0000000ESbo-0Fzp;
	Tue, 20 Feb 2024 11:29:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOJc-0000000ES4E-40b8;
	Tue, 20 Feb 2024 11:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YAbiUOeHNTOOtMQq3T2dYQUt8NBgKEvDfS/NrGbV6TI=; b=O6lRSVZhxbh5i6u+BH25w3f3Cm
	1Vw7wxiDSgvtyuvUnEQCtl4LHsD0HzY1J+QnwBBfWvzYrZnw4ZdEKbmD4OvhU0znyUN2QW3v3TQK6
	acFANS/gPds8L+eRUinfOfYI/5P5/HHW8+MaTKOwBEFBIXcdD2h/rAjy4+NEGoLQ4VhzrvLbGSILa
	e4bVQ4JEXiZ5ggyFjiYKM2SMFHyueGtUiByprCY7LB4A0i9T5NoqAM9yDfSyA8mANNn7sjoowzKXf
	gZg39Bgc4AYxKTEmwc/LOvXE0VrkkOYgYtUo08k1FAqXJPZDFh0Fdt9VSeb+Bh6zHM/C3MKPJvsVF
	UW/+AtXw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54660)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rcOHQ-0002Id-2W;
	Tue, 20 Feb 2024 11:27:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rcOHM-0000pR-05; Tue, 20 Feb 2024 11:27:16 +0000
Date: Tue, 20 Feb 2024 11:27:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
Message-ID: <ZdSMk93c1I6x973h@shell.armlinux.org.uk>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
 <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_032937_011079_84A72BBE 
X-CRM114-Status: GOOD (  33.17  )
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

T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMDg6MjI6MjlQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNTo1MOKAr1BNIFJ1c3NlbGwgS2lu
ZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jIGIvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29y
LmMKPiA+IGluZGV4IGNmN2MxY2NhNjlkZC4uYTY4YzQ3NWNkZWE1IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMKPiA+ICsrKyBiL2RyaXZlcnMvYWNwaS9hY3Bp
X3Byb2Nlc3Nvci5jCj4gPiBAQCAtMzE0LDYgKzMxNCwxOCBAQCBzdGF0aWMgaW50IGFjcGlfcHJv
Y2Vzc29yX2dldF9pbmZvKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgY3B1ZnJlcV9hZGRfZGV2aWNlKCJhY3BpLWNwdWZyZXEiKTsKPiA+ICAg
ICAgICAgfQo+ID4KPiA+ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogUmVnaXN0ZXIgQ1BVcyB0
aGF0IGFyZSBwcmVzZW50LiBnZXRfY3B1X2RldmljZSgpIGlzIHVzZWQgdG8gc2tpcAo+ID4gKyAg
ICAgICAgKiBkdXBsaWNhdGUgQ1BVIGRlc2NyaXB0aW9ucyBmcm9tIGZpcm13YXJlLgo+ID4gKyAg
ICAgICAgKi8KPiA+ICsgICAgICAgaWYgKCFpbnZhbGlkX2xvZ2ljYWxfY3B1aWQocHItPmlkKSAm
JiBjcHVfcHJlc2VudChwci0+aWQpICYmCj4gPiArICAgICAgICAgICAhZ2V0X2NwdV9kZXZpY2Uo
cHItPmlkKSkgewo+ID4gKyAgICAgICAgICAgICAgIGludCByZXQgPSBhcmNoX3JlZ2lzdGVyX2Nw
dShwci0+aWQpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiAgICAg
ICAgIC8qCj4gPiAgICAgICAgICAqICBFeHRyYSBQcm9jZXNzb3Igb2JqZWN0cyBtYXkgYmUgZW51
bWVyYXRlZCBvbiBNUCBzeXN0ZW1zIHdpdGgKPiA+ICAgICAgICAgICogIGxlc3MgdGhhbiB0aGUg
bWF4ICMgb2YgQ1BVcy4gVGhleSBzaG91bGQgYmUgaWdub3JlZCBfaWZmCj4gCj4gVGhpcyBpcyBp
bnRlcmVzdGluZywgYmVjYXVzZSByaWdodCBiZWxvdyB0aGVyZSBpcyB0aGUgZm9sbG93aW5nIGNv
ZGU6Cj4gCj4gICAgIGlmIChpbnZhbGlkX2xvZ2ljYWxfY3B1aWQocHItPmlkKSB8fCAhY3B1X3By
ZXNlbnQocHItPmlkKSkgewo+ICAgICAgICAgaW50IHJldCA9IGFjcGlfcHJvY2Vzc29yX2hvdGFk
ZF9pbml0KHByKTsKPiAKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiAgICAgfQo+IAo+IGFuZCBhY3BpX3Byb2Nlc3Nvcl9ob3RhZGRfaW5pdCgpIGVzc2VudGlh
bGx5IGNhbGxzIGFyY2hfcmVnaXN0ZXJfY3B1KCkKPiB3aXRoIHNvbWUgZXh0cmEgdGhpbmdzIGFy
b3VuZCBpdCAobW9yZSBhYm91dCB0aGF0IGJlbG93KS4KPiAKPiBJIGRvIHJlYWxpemUgdGhhdCBh
Y3BpX3Byb2Nlc3Nvcl9ob3RhZGRfaW5pdCgpIGlzIGRlZmluZWQgdW5kZXIKPiBDT05GSUdfQUNQ
SV9IT1RQTFVHX0NQVSwgc28gZm9yIHRoZSBzYWtlIG9mIHRoZSBhcmd1bWVudCBsZXQncwo+IGNv
bnNpZGVyIGFuIGFyY2hpdGVjdHVyZSB3aGVyZSBDT05GSUdfQUNQSV9IT1RQTFVHX0NQVSBpcyBz
ZXQuCj4gCj4gU28gd2h5IGFyZSB0aGUgdHdvIGNvbmRpdGlvbmFscyB0aGF0IGFsbW9zdCBjb250
cmFkaWN0IGVhY2ggb3RoZXIgYm90aAo+IG5lZWRlZD8gIEl0IGxvb2tzIGxpa2UgdGhlIG5ldyBj
b2RlIGNvdWxkIGJlIGNvbWJpbmVkIHdpdGgKPiBhY3BpX3Byb2Nlc3Nvcl9ob3RhZGRfaW5pdCgp
IHRvIGRvIHRoZSByaWdodCB0aGluZyBpbiBhbGwgY2FzZXMuCj4gCj4gTm93LCBhY3BpX3Byb2Nl
c3Nvcl9ob3RhZGRfaW5pdCgpIGRvZXMgc29tZSBleHRyYSB0aGluZ3MgdGhhdCBsb29rCj4gbGlr
ZSB0aGV5IHNob3VsZCBiZSBkb25lIGJ5IHRoZSBuZXcgY29kZSB0b28uCj4gCj4gMS4gSXQgY2hl
Y2tzIGludmFsaWRfcGh5c19jcHVpZCgpIHdoaWNoIGFwcGVhcnMgdG8gYmUgYSBnb29kIGlkZWEg
dG8gbWUuCj4gCj4gMi4gSXQgdXNlcyBsb2NraW5nIGFyb3VuZCBhcmNoX3JlZ2lzdGVyX2NwdSgp
IHdoaWNoIGRvZXNuJ3Qgc2VlbQo+IHVucmVhc29uYWJsZSBlaXRoZXIuCj4gCj4gMy4gSXQgY2Fs
bHMgYWNwaV9tYXBfY3B1KCkgYW5kIEknbSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBub3QgZG9uZSBi
eQo+IHRoZSBuZXcgY29kZS4KPiAKPiBUaGUgb25seSB0aGluZyB0aGF0IGNhbiBiZSBkcm9wcGVk
IGZyb20gaXQgaXMgdGhlIF9TVEEgY2hlY2sgQUZBSUNTLAo+IGJlY2F1c2UgYWNwaV9wcm9jZXNz
b3JfYWRkKCkgd29uJ3QgZXZlbiBiZSBjYWxsZWQgaWYgdGhlIENQVSBpcyBub3QKPiBwcmVzZW50
IChhbmQgbm90IGVuYWJsZWQgYWZ0ZXIgdGhlIGZpcnN0IHBhdGNoKS4KPiAKPiBTbyB3aHkgZG9l
cyB0aGUgY29kZSBub3QgZG8gMSAtIDMgYWJvdmU/CgpIb25lc3RseSwgSSdtIG91dCBvZiBteSBk
ZXB0aCB3aXRoIHRoaXMgYW5kIGNhbid0IGFuc3dlciB5b3VyCnF1ZXN0aW9ucyAtIGFuZCBJIHJl
YWxseSBkb24ndCB3YW50IHRvIHRyeSBmaWRkbGluZyB3aXRoIHRoaXMgY29kZQpiZWNhdXNlIGl0
J3MganVzdCB0b28gaWNreSAoZXZlbiBpbiBpdHMgY3VycmVudCBmb3JtIGluIG1haW5saW5lKQp0
byBiZSB1bmRlcnN0YW5kYWJsZSB0byBhbnlvbmUgd2hvIGhhc24ndCBnYWluZWQgYSBkZXRhaWxl
ZCBrbm93bGVkZ2UKb2YgdGhpcyBjb2RlLgoKSXQncyBnb2luZyB0byByZXF1aXJlIGEgbG90IG9m
IGFuYWx5c2lzIC0gaG93IGFjcGlfbWFwX2NwdWlkKCkgYmVoYXZlcwppbiBhbGwgY2lyY3Vtc3Rh
bmNlcywgd2hhdCB0aGlzIG1lYW5zIGZvciBpbnZhbGlkX2xvZ2ljYWxfY3B1aWQoKSBhbmQKaW52
YWxpZF9waHlzX2NwdWlkKCksIHdoYXQgcGF0aHMgd2lsbCBiZSB0YWtlbiBpbiBlYWNoIGNhc2Uu
IFRoaXMgY29kZQppcyBhbHJlYWR5IGp1c3QgdG9vIGhhaXJ5IGZvciBzb21lb25lIHdobyBpc24n
dCBhbiBleHBlcmllbmNlZCBBQ1BJCmhhY2tlciB0byBiZSBhYmxlIHRvIGZvbGxvdyBhbmQgSSBk
b24ndCBzZWUgYW4gb2J2aW91cyB3YXkgdG8gbWFrZSBpdAptb3JlIHJlYWRhYmxlLgoKSmFtZXMn
IGFkZGl0aW9ucyBtYWtlIGl0IGV2ZW4gbW9yZSBjb21wbGV4IGFuZCBsZXNzIHJlYWRhYmxlLgoK
LS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVs
b3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50
IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
