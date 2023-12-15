Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A67CC35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNS+czl3jD73fT+dithNlraqhq6Qwbbbru8C8z1+K08=; b=RUilCnZz1rLdvz
	2yXDLdGEZngn13gnAY8C14E4bdExB1WxDthIhjowXRAsQU6ROcc+DQRVYaPSoF0CP+tEJdC6iw2FJ
	vNWZQpa6sJT0Fv2D95n+8IJjfLhmUh4yTbS3Sy85owFrxe/15uMNwpmUbB6+MyPBoxeKNfrEtMxmT
	Yv9YLlVD0GV157gENM91+42PCfgI2is5o7z5VGqFB0fhRs+JHmhtNUF3NJALO1yKf6UzWPjWXTMLc
	e+0Qc1QpMm0tuWH9Y4LwhE4TWTYZKxZKgjmX4p6FXjqfRnqkP0evMkQxKY5p10gzS3zbGY6vK5l8L
	7j3VQwUhXOwEg+zSE4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAAi-003k8e-31;
	Fri, 15 Dec 2023 15:32:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAAf-003k85-2w;
	Fri, 15 Dec 2023 15:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nvVr24yJlTcKSpTw1UQi3U4632hdafX2X9T8yNVWb/s=; b=RR12zPsUj34Qy44F0kIaQPaAZB
	nPc+zWXztM2JH+6eKjddRnEJOcP4lHMaZs0Ok+6Eho9xjDst2RRvXpsCCyoi7ja6CGEcydbSwFAla
	53X4gkcQ8TpZWIlIRo/ThKhe3wdKOcfl7yUOyXTd80QhoYvEG1X1gzin5cMl7VuHRsiaoHUkm/vCF
	PYV3ouDdMG+9zRwjqRNnemtSmGGjTl1pO8Bz5P4ZH+wXgC0S9oDcdiSR5YyOfn5ipO2ghRZtIMuIZ
	6tcgCPy1Ngdj7NUdlCPMO+WdfmNzTDSJrQZBHAb7IAFs/jxP1GIaaGn85jf5fzZNPpucwpWFKdF2Q
	MkpmY3mA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48236)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rEAAQ-0002qa-0q;
	Fri, 15 Dec 2023 15:31:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rEAAN-0003iY-2B; Fri, 15 Dec 2023 15:31:55 +0000
Date: Fri, 15 Dec 2023 15:31:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or
 functional) devices
Message-ID: <ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOfs-00DvjY-HQ@rmk-PC.armlinux.org.uk>
 <20231214173241.0000260f@Huawei.com>
 <CAJZ5v0jymOtZ0y65K9wE8FJk+ZKwP+FoGm4AKHXcYVfQJL9MVw@mail.gmail.com>
 <ZXtFBYJEX2RrFrwj@shell.armlinux.org.uk>
 <CAJZ5v0h2Keyb-gFWFuPsKtwqjXvM2snyGpo6MMfFzaXKbfEpgw@mail.gmail.com>
 <CAJZ5v0h3WWtvrbxRpaGfq6c756k+L1SzZ1Gv3A14JxXHNcUMKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h3WWtvrbxRpaGfq6c756k+L1SzZ1Gv3A14JxXHNcUMKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_073213_953968_19FF9ADD 
X-CRM114-Status: GOOD (  12.26  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMDc6Mzc6MTBQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNzoxNuKAr1BNIFJhZmFlbCBKLiBX
eXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBEZWMgMTQs
IDIwMjMgYXQgNzoxMOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4QGFybWxp
bnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+IEkgZ3Vlc3Mgd2UgbmVlZCBzb21ldGhpbmcgbGlrZToK
PiA+ID4KPiA+ID4gICAgICAgICBpZiAoZGV2aWNlLT5zdGF0dXMucHJlc2VudCkKPiA+ID4gICAg
ICAgICAgICAgICAgIHJldHVybiBkZXZpY2UtPmRldmljZV90eXBlICE9IEFDUElfQlVTX1RZUEVf
UFJPQ0VTU09SIHx8Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlLT5zdGF0dXMu
ZW5hYmxlZDsKPiA+ID4gICAgICAgICBlbHNlCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
ZGV2aWNlLT5zdGF0dXMuZnVuY3Rpb25hbDsKPiA+ID4KPiA+ID4gc28gd2Ugb25seSBjaGVjayBk
ZXZpY2UtPnN0YXR1cy5lbmFibGVkIGZvciBwcm9jZXNzb3ItdHlwZSBkZXZpY2VzPwo+ID4KPiA+
IFllcywgc29tZXRoaW5nIGxpa2UgdGhpcy4KPiAKPiBIb3dldmVyLCB0aGF0IGlzIG5vdCBzdWZm
aWNpZW50LCBiZWNhdXNlIHRoZXJlIGFyZQo+IEFDUElfQlVTX1RZUEVfREVWSUNFIGRldmljZXMg
cmVwcmVzZW50aW5nIHByb2Nlc3NvcnMuCj4gCj4gSSdtIG5vdCBzdXJlIGFib3V0IGEgY2xlYW4g
d2F5IHRvIGRvIGl0IEFUTS4KCk9rLCBob3cgYWJvdXQ6CgpzdGF0aWMgYm9vbCBhY3BpX2Rldl9p
c19wcm9jZXNzb3IoY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlICpkZXZpY2UpCnsKCXN0cnVjdCBh
Y3BpX2hhcmR3YXJlX2lkICpod2lkOwoKCWlmIChkZXZpY2UtPmRldmljZV90eXBlID09IEFDUElf
QlVTX1RZUEVfUFJPQ0VTU09SKQoJCXJldHVybiB0cnVlOwoKCWlmIChkZXZpY2UtPmRldmljZV90
eXBlICE9IEFDUElfQlVTX1RZUEVfREVWSUNFKQoJCXJldHVybiBmYWxzZTsKCglsaXN0X2Zvcl9l
YWNoX2VudHJ5KGh3aWQsICZkZXZpY2UtPnBucC5pZHMsIGxpc3QpCgkJaWYgKCFzdHJjbXAoQUNQ
SV9QUk9DRVNTT1JfT0JKRUNUX0hJRCwgaHdpZC0+aWQpIHx8CgkJICAgICFzdHJjbXAoQUNQSV9Q
Uk9DRVNTT1JfREVWSUNFX0hJRCwgaHdpZC0+aWQpKQoJCQlyZXR1cm4gdHJ1ZTsKCglyZXR1cm4g
ZmFsc2U7Cn0KCmFuZCB0aGVuOgoKCWlmIChkZXZpY2UtPnN0YXR1cy5wcmVzZW50KQoJCXJldHVy
biAhYWNwaV9kZXZfaXNfcHJvY2Vzc29yKGRldmljZSkgfHwgZGV2aWNlLT5zdGF0dXMuZW5hYmxl
ZDsKCWVsc2UKCQlyZXR1cm4gZGV2aWNlLT5zdGF0dXMuZnVuY3Rpb25hbDsKCj8KCi0tIApSTUsn
cyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0
Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0
aXZpdHkgYXQgbGFzdCEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
