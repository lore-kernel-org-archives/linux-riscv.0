Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46C1C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXbLVidYIwuMxjOg+4myhX4E6e00Vetj6gudtb8HT7I=; b=YHRxmn5JkPYDn/
	nOPNTp2Pf3XZflVDTUaC149DfopK4XO5bw/qPb68nreG6/St8+DznVzU3uh3uCPH/gwB7eZ3dz/Ih
	BG4T9ftAN/rTzIyhSsgO7/7BiRgArYdWZjKGupr7EuIalTP1rGzOwR6WEeb1WiHN1MfTdL7i8oTiV
	6RPdzNM1KqXm8AVOj8JvNzucg1aPcXzExs4wqwWSLI75ZqThckkea3EMcFUaPxAnIWMtdrDhIQO4a
	p3rWE7Xujex/Tj+JZsJ3oFuWfkPS7mx9wdtUjEfbUf1sZJP0u/BugRIE80nfCnlpDsUBRaqwd/0RN
	UeBMrXThyWTGGWcsrGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqOr-00BEzu-05;
	Mon, 22 Jan 2024 09:15:25 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqOl-00BEwa-1I
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 09:15:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E828C1C0008;
	Mon, 22 Jan 2024 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705914914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrG9+46KuXtBlxIUOx0DyHU7sjn1FkhruzlXHAOP5As=;
	b=SFDc5YZjAYVRO1aKvOuFt3JAr6qRfWGKwPgTbdbQ/8JLd8rtm9JbE+BvXMa0rqbH5G+TNI
	iFBNBhJw6VvJBsBwjBLnZJ4eFrzgxCIWgFYFZgM+5rKAjSv7Qv5be3ayicmtSpg99/LiEE
	ZArtLOhhmbouLIJYFK9bDQuasJJcksq4VSNVFdU7J1TujI7vjCB+tp7dRrO06BVCGmqhYx
	ygT/I2wQJmN+ud0cuf3cgD3x0J3Uq3qOKFfzH6kHinnuAwmtZ0wzqwnaRphmMWLC32FRoY
	euogrM+TTpBI1BpgrfHqLzuyN6j6EmGrcMiUg+m7KKfJ9PUVei+uOHtSipZj0Q==
Date: Mon, 22 Jan 2024 10:15:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, chao.wei@sophgo.com, unicorn_wang@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org
Subject: Re: [PATCH v7 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Message-ID: <2024012209151130867663@mail.local>
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
 <20240122081722868bdda5@mail.local>
 <CAJRtX8QU8iHY1oQJ1uDN3YOmCeN7SH+vPC8nD29WS5+2DT1oKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJRtX8QU8iHY1oQJ1uDN3YOmCeN7SH+vPC8nD29WS5+2DT1oKQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_011519_577296_ACADCF05 
X-CRM114-Status: GOOD (  23.50  )
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

T24gMjIvMDEvMjAyNCAxNjozNDowMCswODAwLCBKaW5nYmFvIFFpdSB3cm90ZToKPiBPbiBNb24s
IEphbiAyMiwgMjAyNCBhdCA0OjE34oCvUE0gQWxleGFuZHJlIEJlbGxvbmkKPiA8YWxleGFuZHJl
LmJlbGxvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDIyLzAxLzIwMjQgMTY6MDY6
MzArMDgwMCwgSmluZ2JhbyBRaXUgd3JvdGU6Cj4gPiA+IEltcGxlbWVudCB0aGUgUlRDIGRyaXZl
ciBmb3IgQ1YxODAwLCB3aGljaCBhYmxlIHRvIHByb3ZpZGUgdGltZSBhbGFybQo+ID4gPiBhbmQg
Y2FsaWJyYXRlIGZ1bmN0aW9uYWxpdHkuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEppbmdi
YW8gUWl1IDxxaXVqaW5nYmFvLmRsbXVAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4g
RGVwZW5kcyBvbiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1M0M3NzRE
NDFFREYxRUFEQjZFQzE4QkI2RDJASUExUFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxvb2su
Y29tLwo+ID4KPiA+IFdoYXQgaXMgdGhlIGRlcGVuZGVuY3k/Cj4gPgo+IAo+IFRoYW5rIHlvdSwg
dGhpcyBkcml2ZXIgcmVxdWlyZXMgc3VwcG9ydCBmcm9tIHRoZSBDTEsgZHJpdmVyLgo+IEkgd2ls
bCBhZGQgYW4gZXhwbGFuYXRpb24gaW4gdGhlIG5leHQgdmVyc2lvbi4KPiAKPiA+Cj4gPiBBbHNv
LCBwbGVhc2UgZml4IHRoZSBjaGVja3BhdGNoLnBsIC0tc3RyaWN0IHdhcm5pbmdzCj4gCj4gSSB3
aWxsIHVzZSB0aGUgLS0gc3RyaWN0IG9wdGlvbiBmb3IgdGVzdGluZy4KPiAKPiA+Cj4gPiA+ICsv
KioKPiA+ID4gKyAqIGN2MTgwMF9ydGNfMzJrX2NvYXJzZV92YWxfY2FsaWIoKSAtIFVzaW5nIGFu
IGV4dGVybmFsCj4gPiA+ICsgKiBjbG9jayB0byBjb2Fyc2UgY2FsaWJyYXRlIHRoZSBjcnlzdGFs
IG9zY2lsbGF0b3IKPiA+ID4gKyAqIEBpbmZvOiB0aGUgZGV2aWNlIG9mIGNhbGlicmF0ZWQKPiA+
ID4gKyAqCj4gPiA+ICsgKiBAcmV0dXJuIDAgb24gc3VjY2Vzcywgb3IgLTEgb24gZmFpbAo+ID4g
PiArICoKPiA+ID4gKyAqIFRoaXMgUlRDIGhhcyBhbiBpbmRlcGVuZGVudCAzMktIeiBvc2NpbGxh
dG9yLiBIb3dldmVyLAo+ID4gPiArICogdGhlIGFjY3VyYWN5IG9mIHRoaXMgb3NjaWxsYXRvciBp
cyBlYXNpbHkgYWZmZWN0ZWQgYnkKPiA+ID4gKyAqIGV4dGVybmFsIGVudmlyb25tZW50YWwgaW50
ZXJmZXJlbmNlLHJlc3VsdGluZyBpbiBsb3dlcgo+ID4gPiArICogYWNjdXJhY3kgdGhhbiB0aGUg
aW50ZXJuYWwgb3NjaWxsYXRvci5UaGVyZWZvcmUsIGEgMjVNCj4gPiA+ICsgKiBjcnlzdGFsIG9z
Y2lsbGF0b3IgaXMgdXNlZCBhcyBhIHJlZmVyZW5jZSBzb3VyY2UgdG8KPiA+ID4gKyAqIGNhbGli
cmF0ZSB0aGUgUlRDIGFuZCBpbXByb3ZlIGl0cyBhY2N1cmFjeS5DYWxpYnJhdGlvbgo+ID4gPiAr
ICogaXMgY29tcGxldGVkIHRocm91Z2ggdHdvIHN0ZXBzLCBuYW1lbHkgcm91Z2ggY2FsaWJyYXRp
b24KPiA+ID4gKyAqIGFuZCBmaW5lIGNhbGlicmF0aW9uLgo+ID4gPiArICovCj4gPiA+ICtzdGF0
aWMgaW50IGN2MTgwMF9ydGNfMzJrX2NvYXJzZV92YWxfY2FsaWIoc3RydWN0IGN2MTgwMF9ydGNf
cHJpdiAqaW5mbykKPiA+Cj4gPiBUaGlzIGlzIHN0aWxsIG5vdCB3b3JraW5nIGFzIHdlbGwgYXMg
eW91IHRoaW5rIGl0IGlzLiBZb3Ugc2hvdWxkCj4gPiBJbXBsZW1lbnQgdGhlIG9mZnNldCBjYWxs
YmFja3MgaW5zdGVhZC4KPiA+Cj4gSSdtIHNvcnJ5LCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQg
b2Zmc2V0IGNhbGxiYWNrcy4KPiBEbyB5b3UgbWVhbiB0aGF0IHRoaXMgZnVuY3Rpb24gbmVlZHMg
dG8gYmUgZXhlY3V0ZWQgcGVyaW9kaWNhbGx5LgoKSSBtZWFuIGltcGxlbWVudCByZWFkX29mZnNl
dCBhbmQgc2V0X29mZnNldCBoZXJlOgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
Ni43L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3J0Yy5oI0w2NwoKCi0tIApBbGV4YW5kcmUgQmVsbG9u
aSwgY28tb3duZXIgYW5kIENPTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
