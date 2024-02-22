Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522E8C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 13:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYgroG8IMBAhmeGj4DquTG3zVxiH3dn1HOWz03L1X6I=; b=KfbMQSUALOVB2O
	CTN6+9/icqGnrKL/BY7s4pJoo8XZuyBW5YoS+g37pw3s/u7wIcthUO47vTfr9rFCr5bssrIeA4/I/
	KdTAFHsWr/h0LmcWgiQQQIwTRQz2mrLZKio70tSy3SMroE7y/XPqLevOpm/K9GvFdKIjplUvxSKxF
	ab40TWOJfhS1ADW9yfgOYa+XXlbfGoNlzWxNoK3v7NVYD9IQiXLEyfEsHy35R05ZNQ8xZ/eDEjWmj
	E78JZVK6hhtpD/KscSBM9URoEQmsUwOTwkmUr8YCKh50VnYyDpA+xnxwtZ0ZhL2gOuAYG3z0TDyyA
	SDufywyMp1kBU7+jqyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd99t-000000052oO-1wny;
	Thu, 22 Feb 2024 13:30:41 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd99r-000000052k2-17W1
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 13:30:40 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-364f794f237so33112715ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 05:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708608637; x=1709213437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm6+BZx//BfcbcHBQe5tKGHx19q8gbGIF+ECXygbr2c=;
        b=vkskaxK/Nd6GeTB10xNBKb3DnIu/Q/2xqVzkZfOm6Y29KM41pYLUu4MYu2s7KRH0sN
         /jbqh1JB2R87T+ZHotebtlshWAUZCG/SM9J6VA/X/hlzb4p5ICd0gqb9EnMR6oMwEGAC
         2FpmSUaR40x+wyB6NR+4jgimycoYfdCP8b8l6tGHbFk9zvvv9sRFqEMNpY8QjKmOYxF6
         cAjPEbxXbumozmWbahFV6h8nO6jvi/JgfPjpbAXi2WShQq84pZtiPW09u1J8oDLs3mnA
         SRZuQzy/s4UuPhpqJ3/6IBKpnAysrWG9u/GKWrltwYwqwP4fxI5+euIyETwLhLE+zQqg
         NScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708608637; x=1709213437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm6+BZx//BfcbcHBQe5tKGHx19q8gbGIF+ECXygbr2c=;
        b=hoPXiZi2JeHZmyOkMWPGBNYJC/Jzzg04EALfP/CwHWjvIaWrcxAca/lWNoKl1pAAa+
         utNPLkFLtJ0emQmTn219CRy3IJOuV0WF1eKNwnB2u5sOZXAp7wPgTGt4QbsvfGuSnucQ
         yR9KjDmpB6HM1PB6e0Ll4jVhOzg/uqNhksi30Aa8hfeDvqkrSD0QJ4n8vkDC9LU38Wrm
         UI2WfUHMTizT3uasejnjkIA5p40KRGy1IXrprG/bV7HaV1987rQ403S22OBe1jNSDkj1
         ETNeQl51NaFifJMyeX0/3+AnzePslrEwpfQQOfqWyR5vrw9ISg3f78ddLOOFrT/lUcBb
         WJbA==
X-Forwarded-Encrypted: i=1; AJvYcCV49ZAXfWf03m2difcrVOQr+8VZjc+2Y7bfS4bSewsaKHqiBqCaJ4IbPCvd9LVZww1GWT9yZC2SvhoPyor7jCpMfJLkRip17mzlq7wMUbbB
X-Gm-Message-State: AOJu0YzknKqOdmSixauSz2HyZUvK+TH0bc323F9pQyJszldAco0AcIBw
	BeLUAv3RpGUvUlUKSV6k+lr6nuOUIT24ef3+MTf6HFvUWflVZNRRzzFnXsMg9cyeuJpi35jzx3j
	c6tpH/yFYUi87D8yHK14VAyRfl8zJPld/qqvI1g==
X-Google-Smtp-Source: AGHT+IH7+5ZCczA7CU0C46qlCuTGH9ZfX4fnyGxuO1KETodyAdfp/RwxJf4awEiJMnqjcwJ7wcD82uB7iK3DMxQoA9s=
X-Received: by 2002:a05:6e02:1292:b0:363:da36:f643 with SMTP id
 y18-20020a056e02129200b00363da36f643mr18895064ilq.8.1708608637266; Thu, 22
 Feb 2024 05:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-14-apatel@ventanamicro.com> <87msrstzck.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87msrstzck.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Feb 2024 19:00:25 +0530
Message-ID: <CAAhSdy3DtDFnZKQLXXJ2OPPSv5s8bbGvm8Mmqhg_F2rPneQ3sw@mail.gmail.com>
Subject: Re: [PATCH v14 13/18] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_053039_318743_411249AA 
X-CRM114-Status: GOOD (  19.67  )
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

T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgNjo0NOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gVGhlIExpbnV4IFBDSSBmcmFtZXdvcmsgc3VwcG9ydHMgcGVyLWRldmlj
ZSBNU0kgZG9tYWlucyBmb3IgUENJIGRldmljZXMKPiA+IHNvIGV4dGVuZCB0aGUgSU1TSUMgZHJp
dmVyIHRvIGFsbG93IFBDSSBwZXItZGV2aWNlIE1TSSBkb21haW5zLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9pcnFjaGlwL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysKPiA+
ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgfCAzNSArKysrKysr
KysrKysrKysrKysrKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvS2NvbmZp
ZyBiL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnCj4gPiBpbmRleCA4NWY4NmUzMWM5OTYuLjJmYzBj
YjMyMzQxYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnCj4gPiArKysg
Yi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+ID4gQEAgLTU1Myw2ICs1NTMsMTMgQEAgY29uZmln
IFJJU0NWX0lNU0lDCj4gPiAgICAgICBzZWxlY3QgR0VORVJJQ19JUlFfTUFUUklYX0FMTE9DQVRP
Ugo+ID4gICAgICAgc2VsZWN0IEdFTkVSSUNfTVNJX0lSUQo+ID4KPiA+ICtjb25maWcgUklTQ1Zf
SU1TSUNfUENJCj4gPiArICAgICBib29sCj4gPiArICAgICBkZXBlbmRzIG9uIFJJU0NWX0lNU0lD
Cj4gPiArICAgICBkZXBlbmRzIG9uIFBDSQo+ID4gKyAgICAgZGVwZW5kcyBvbiBQQ0lfTVNJCj4g
PiArICAgICBkZWZhdWx0IFJJU0NWX0lNU0lDCj4gPiArCj4gPiAgY29uZmlnIEVYWU5PU19JUlFf
Q09NQklORVIKPiA+ICAgICAgIGJvb2wgIlNhbXN1bmcgRXh5bm9zIElSUSBjb21iaW5lciBzdXBw
b3J0IiBpZiBDT01QSUxFX1RFU1QKPiA+ICAgICAgIGRlcGVuZHMgb24gKEFSQ0hfRVhZTk9TICYm
IEFSTSkgfHwgQ09NUElMRV9URVNUCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNp
Yy1wbGF0Zm9ybS5jCj4gPiBpbmRleCBlMjM0NGZjMDhkY2EuLjkwZGRjZGQwYmJhNSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+ID4g
KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4gPiBAQCAt
MTQsNiArMTQsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4KPiA+ICAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L21zaS5oPgo+ID4gKyNp
bmNsdWRlIDxsaW51eC9wY2kuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3NtcC5oPgo+ID4gQEAgLTIwOCw2ICsyMDksMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFf
ZG9tYWluX29wcyBpbXNpY19iYXNlX2RvbWFpbl9vcHMgPSB7Cj4gPiAgI2VuZGlmCj4gPiAgfTsK
PiA+Cj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9JTVNJQ19QQ0kKPiA+ICsKPiA+ICtzdGF0aWMg
dm9pZCBpbXNpY19wY2lfbWFza19pcnEoc3RydWN0IGlycV9kYXRhICpkKQo+ID4gK3sKPiA+ICsg
ICAgIHBjaV9tc2lfbWFza19pcnEoZCk7Cj4gPiArICAgICBpcnFfY2hpcF9tYXNrX3BhcmVudChk
KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgaW1zaWNfcGNpX3VubWFza19pcnEoc3Ry
dWN0IGlycV9kYXRhICpkKQo+ID4gK3sKPiA+ICsgICAgIGlycV9jaGlwX3VubWFza19wYXJlbnQo
ZCk7Cj4gPiArICAgICBwY2lfbXNpX3VubWFza19pcnEoZCk7Cj4gPiArfQo+ID4gKwo+ID4gKyNk
ZWZpbmUgTUFUQ0hfUENJX01TSSAgICAgICAgICAgICAgICBCSVQoRE9NQUlOX0JVU19QQ0lfTVNJ
KQo+ID4gKwo+ID4gKyNlbHNlCj4gPiArCj4gPiArI2RlZmluZSBNQVRDSF9QQ0lfTVNJICAgICAg
ICAgICAgICAgIDAKPiA+ICsKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICBzdGF0aWMgYm9vbCBpbXNp
Y19pbml0X2Rldl9tc2lfaW5mbyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqcmVhbF9wYXJl
bnQsCj4gPiBAQCAtMjMxLDYgKzI1NCwxMyBAQCBzdGF0aWMgYm9vbCBpbXNpY19pbml0X2Rldl9t
c2lfaW5mbyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPgo+ID4gICAgICAgLyogSXMgdGhlIHRhcmdl
dCBzdXBwb3J0ZWQ/ICovCj4gPiAgICAgICBzd2l0Y2ggKGluZm8tPmJ1c190b2tlbikgewo+ID4g
KyNpZmRlZiBDT05GSUdfUklTQ1ZfSU1TSUNfUENJCj4gPiArICAgICBjYXNlIERPTUFJTl9CVVNf
UENJX0RFVklDRV9NU0k6Cj4gPiArICAgICBjYXNlIERPTUFJTl9CVVNfUENJX0RFVklDRV9NU0lY
Ogo+ID4gKyAgICAgICAgICAgICBpbmZvLT5jaGlwLT5pcnFfbWFzayA9IGltc2ljX3BjaV9tYXNr
X2lycTsKPiA+ICsgICAgICAgICAgICAgaW5mby0+Y2hpcC0+aXJxX3VubWFzayA9IGltc2ljX3Bj
aV91bm1hc2tfaXJxOwo+Cj4gaXJxX3NldF9hZmZpbml0eSgpPwoKSXQncyBhbHJlYWR5IHNldCBi
eSB0aGUgc3dpdGNoLWNhc2UgYWJvdmUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
