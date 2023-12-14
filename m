Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A124CC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+nIKJXKTJzOochKAju7znH1UZao9x1LJSr20y4NfRA=; b=I3xuLvW14B0FlB
	CNA5BN80Im70+axXxmwFbbf6XgRznhiiz1d6Cd2KzQ1GPU1IADNT48OitIja6Y1kG9hQDykjfwquI
	HTSaWmc3VxbZW9ZeAnZh1+7OnTJKRsEpStCHkauIIHumHjUANW705HI4iXQhS2c46lCLeRwW6wZez
	EVNvrHgKlF8yNlCtXICEyotcbAj4gXz2AIVyh601Ekms7fDqnzQDJ0DzCd7mxbtWgs5U3bFIKSazR
	hx1ccDGXRcKkO9piBgVyBhJMCM4nRI1eXf7iDKNX8KfYTOJnTkUHigFHPa/ePnYUjJXfb+nxnV4Xr
	1sjw0nwz+DsQ8pS7QpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqFv-0010sO-34;
	Thu, 14 Dec 2023 18:16:19 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqFs-0010qk-0D;
	Thu, 14 Dec 2023 18:16:17 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2033578d5e0so75685fac.0;
        Thu, 14 Dec 2023 10:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702577774; x=1703182574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fVrLLiv/CD23rD47e8kGnLhnnuQbRgVTt+cM3Cov5A=;
        b=JfNQFIzlCwKeP1QhSn91kI2c9ijWEnkrtqWqgXo49ef7iO2UFAh2+H5wd11VuBVlk2
         qqaQqvZVp/kaZ+uVBDRm6sTv7BuswptMWlqRxU8KWQp/GD9sSmS/5QXkJNnWUOcnO/+Z
         OLb8jpF4CfWtPEoIlufLisqw+mcj8lvdrVuhWZi8g5+b2RkjwCYA/QUmiWxHbU2vzsWU
         +c61rz39/FLFykxneK2+DOuTbQDA4IjSULoFQZPWd3iD3ZRgctxIxCtw0QFeu31XuFXq
         xxQNmbWY6bmtvL+in4Y14dWr5TH5CjKgWRNfxByShRZNnbhrBOIKG3JFjkdvfWMpovSm
         r74A==
X-Gm-Message-State: AOJu0Yzvc7ULV9SUcELjWljpex0Kt+Sg8Rthlm8HIKnSAlzonQRKbFLH
	9r4x700qH6eGzA3fpRJ7hrVhXugCDxKTltNBDCs=
X-Google-Smtp-Source: AGHT+IHJijZImnPNUIIOWv84OL2w1tGUmgZPvXQ1Drc8dHZAkuSK99fCqBUWsD+7YUkvDs3ihxHUMSQwP8kpLp8yZOg=
X-Received: by 2002:a05:6870:9a8a:b0:203:36fc:6c8a with SMTP id
 hp10-20020a0568709a8a00b0020336fc6c8amr4450470oab.4.1702577773953; Thu, 14
 Dec 2023 10:16:13 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOfs-00DvjY-HQ@rmk-PC.armlinux.org.uk>
 <20231214173241.0000260f@Huawei.com> <CAJZ5v0jymOtZ0y65K9wE8FJk+ZKwP+FoGm4AKHXcYVfQJL9MVw@mail.gmail.com>
 <ZXtFBYJEX2RrFrwj@shell.armlinux.org.uk>
In-Reply-To: <ZXtFBYJEX2RrFrwj@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 14 Dec 2023 19:16:02 +0100
Message-ID: <CAJZ5v0h2Keyb-gFWFuPsKtwqjXvM2snyGpo6MMfFzaXKbfEpgw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or functional) devices
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
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
X-CRM114-CacheID: sfid-20231214_101616_101137_55F7B783 
X-CRM114-Status: GOOD (  30.33  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNzoxMOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFRodSwgRGVjIDE0LCAyMDIzIGF0
IDA2OjQ3OjAwUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVGh1LCBE
ZWMgMTQsIDIwMjMgYXQgNjozMuKAr1BNIEpvbmF0aGFuIENhbWVyb24KPiA+IDxKb25hdGhhbi5D
YW1lcm9uQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIDEzIERlYyAyMDIz
IDEyOjQ5OjE2ICswMDAwCj4gPiA+IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBh
cm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IEZyb206IEphbWVzIE1vcnNlIDxq
YW1lcy5tb3JzZUBhcm0uY29tPgo+ID4gPiA+Cj4gPiA+ID4gVG9kYXkgdGhlIEFDUEkgZW51bWVy
YXRpb24gY29kZSAndmlzaXRzJyBhbGwgZGV2aWNlcyB0aGF0IGFyZSBwcmVzZW50Lgo+ID4gPiA+
Cj4gPiA+ID4gVGhpcyBpcyBhIHByb2JsZW0gZm9yIGFybTY0LCB3aGVyZSBDUFVzIGFyZSBhbHdh
eXMgcHJlc2VudCwgYnV0IG5vdAo+ID4gPiA+IGFsd2F5cyBlbmFibGVkLiBXaGVuIGEgZGV2aWNl
LWNoZWNrIG9jY3VycyBiZWNhdXNlIHRoZSBmaXJtd2FyZS1wb2xpY3kKPiA+ID4gPiBoYXMgY2hh
bmdlZCBhbmQgYSBDUFUgaXMgbm93IGVuYWJsZWQsIHRoZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJz
Ogo+ID4gPiA+IHwgYWNwaSBBQ1BJMDAwNzo0ODogRW51bWVyYXRpb24gZmFpbHVyZQo+ID4gPiA+
Cj4gPiA+ID4gVGhpcyBpcyB1bHRpbWF0ZWx5IGJlY2F1c2UgYWNwaV9kZXZfcmVhZHlfZm9yX2Vu
dW1lcmF0aW9uKCkgcmV0dXJucwo+ID4gPiA+IHRydWUgZm9yIGEgZGV2aWNlIHRoYXQgaXMgbm90
IGVuYWJsZWQuIFRoZSBBQ1BJIFByb2Nlc3NvciBkcml2ZXIKPiA+ID4gPiB3aWxsIG5vdCByZWdp
c3RlciBzdWNoIENQVXMgYXMgdGhleSBhcmUgbm90ICdkZWNvZGluZyB0aGVpciByZXNvdXJjZXMn
Lgo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdlIGFjcGlfZGV2X3JlYWR5X2Zvcl9lbnVtZXJhdGlvbigp
IHRvIGFsc28gY2hlY2sgdGhlIGVuYWJsZWQgYml0Lgo+ID4gPiA+IEFDUEkgYWxsb3dzIGEgZGV2
aWNlIHRvIGJlIGZ1bmN0aW9uYWwgaW5zdGVhZCBvZiBtYWludGFpbmluZyB0aGUKPiA+ID4gPiBw
cmVzZW50IGFuZCBlbmFibGVkIGJpdC4gTWFrZSB0aGlzIGJlaGF2aW91ciBhbiBleHBsaWNpdCBj
aGVjayB3aXRoCj4gPiA+ID4gYSByZWZlcmVuY2UgdG8gdGhlIHNwZWMsIGFuZCB0aGVuIGNoZWNr
IHRoZSBwcmVzZW50IGFuZCBlbmFibGVkIGJpdHMuCj4gPiA+ID4gVGhpcyBpcyBuZWVkZWQgdG8g
YXZvaWQgZW51bWVyYXRpbmcgcHJlc2VudCAmJiBmdW5jdGlvbmFsIGRldmljZXMgdGhhdAo+ID4g
PiA+IGFyZSBub3QgZW5hYmxlZC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4gPiA+IFRlc3RlZC1ieTogTWlndWVsIEx1
aXMgPG1pZ3VlbC5sdWlzQG9yYWNsZS5jb20+Cj4gPiA+ID4gVGVzdGVkLWJ5OiBWaXNobnUgUGFq
anVyaSA8dmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb20+Cj4gPiA+ID4gVGVzdGVkLWJ5OiBK
aWFueW9uZyBXdSA8amlhbnlvbmcud3VAYXJtLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBS
dXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+ID4gPiA+
IC0tLQo+ID4gPiA+IElmIHRoaXMgY2hhbmdlIGNhdXNlcyBwcm9ibGVtcyBvbiBkZXBsb3llZCBo
YXJkd2FyZSwgSSBzdWdnZXN0IGFuCj4gPiA+ID4gYXJjaCBvcHQtaW46IEFDUElfSUdOT1JFX1NU
QV9FTkFCTEVELCB0aGF0IGNhdXNlcwo+ID4gPiA+IGFjcGlfZGV2X3JlYWR5X2Zvcl9lbnVtZXJh
dGlvbigpIHRvIG9ubHkgY2hlY2sgdGhlIHByZXNlbnQgYml0Lgo+ID4gPgo+ID4gPiBNeSBndXQg
ZmVlbGluZyAoaGF2aW5nIG1hZGUgQUNQSSAnZml4ZXMnIGluIHRoZSBwYXN0IHRoYXQgcmFuIGlu
dG8KPiA+ID4gaG9ycmlibHkgYnJva2VuIGZpcm13YXJlIGFuZCBoYWQgdG8gYmUgcmV2ZXJ0ZWQp
IGlzIHJlZHVjZSB0aGUgYmxhc3QKPiA+ID4gcmFkaXVzIHByZWVtcHRpdmVseSBmcm9tIHRoZSBz
dGFydC4gSSdkIGxvdmUgdG8gbGl2ZSBpbiBhIHdvcmxkIHdlcmUKPiA+ID4gdGhhdCB3YXNuJ3Qg
bmVjZXNzYXJ5IGJ1dCBJIGRvbid0IHRydXN0IGFsbCB0aGUgZ2VuZXJhdG9ycyBvZiBBQ1BJIHRh
Ymxlcy4KPiA+ID4gSSdsbCBsZWF2ZSBpdCB0byBSYWZhZWwgYW5kIG90aGVyIEFDUEkgZXhwZXJ0
cyBzdWdnZXN0IGhvdyBuYXJyb3cgd2Ugc2hvdWxkCj4gPiA+IG1ha2UgaXQgdGhvdWdoIC0gYXJj
aCBvcHQgaW4gbWlnaHQgYmUgbmFycm93IGVub3VnaC4KPiA+Cj4gPiBBIGNoaWNrZW4gYml0IHdv
dWxkbid0IGhlbHAgbXVjaCBJTU8sIGVzcGVjaWFsbHkgaW4gdGhlIGNhc2VzIHdoZW4KPiA+IHdv
cmtpbmcgc2V0dXBzIGdldCBicm9rZW4uCj4gPgo+ID4gSSB3b3VsZCB2ZXJ5IG11Y2ggcHJlZmVy
IHRvIGxpbWl0IHRoZSBzY29wZSBvZiBpdCwgc2F5IHRvIHByb2Nlc3NvcnMKPiA+IG9ubHksIGlu
IHRoZSBmaXJzdCBwbGFjZS4KPgo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIGFuZCB0aGUgaWRl
YS4KPgo+IEkgZ3Vlc3Mgd2UgbmVlZCBzb21ldGhpbmcgbGlrZToKPgo+ICAgICAgICAgaWYgKGRl
dmljZS0+c3RhdHVzLnByZXNlbnQpCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZpY2UtPmRl
dmljZV90eXBlICE9IEFDUElfQlVTX1RZUEVfUFJPQ0VTU09SIHx8Cj4gICAgICAgICAgICAgICAg
ICAgICAgICBkZXZpY2UtPnN0YXR1cy5lbmFibGVkOwo+ICAgICAgICAgZWxzZQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gZGV2aWNlLT5zdGF0dXMuZnVuY3Rpb25hbDsKPgo+IHNvIHdlIG9ubHkg
Y2hlY2sgZGV2aWNlLT5zdGF0dXMuZW5hYmxlZCBmb3IgcHJvY2Vzc29yLXR5cGUgZGV2aWNlcz8K
Clllcywgc29tZXRoaW5nIGxpa2UgdGhpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
