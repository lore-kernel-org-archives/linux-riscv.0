Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B12EC761AE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MffvfopQf4Zq3WsscvaGfgC99nC2weDesPvmLc+KCUM=; b=otktevUx0EbIxy
	HXu9kMBYT6FP3L6SVenfTGI45lU6mWuCvED602Sc06QH56hymbeYuyFFwfZvF8HdRK6gk3+pOGaYH
	K6bdtn3bZ0M3k/EKVSzp4wIJhpgnf8MLYtSj2nFDnbjo36JvUrlwSY6e+4TRYJMZK2sm9SsAGcyz+
	JUvoK6ncMv1ej6tW25/GdkLjLuoim0thpyGfbNJkf9ijCYdZ5DQYOX5N6mWfn7jxE4etAkH96bjR7
	OtBOSP0KCoWdPMt4u9inWV2i65X5C3WNaOouIP5KesCYmGJfyn3cmnhNIMtQf+0zGgcd5M04x+/OP
	I97GNdNY/M2+p3dag7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYSE-00000000ivE-0KlK;
	Thu, 29 Aug 2024 06:16:22 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYSB-00000000iuN-0Nfg
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 06:16:20 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3db50abf929so192185b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724912178; x=1725516978; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9y4ddcKIVUQCa1/ea3XcOqcG2GLAb+NeoR2FFMnflVY=;
        b=GECPf+YLOGBTHRcRg3Oo3S4Qlwk1yXu5a2dC7ViXVVU/6bq1JALB7Pmp4bvVy0wTf4
         wt7WUhgw2nxXUfOKy1FJiaObxENLHORqjU3bz9CuRZi6SGz9hhVuM1G7xbliSJNqKPf4
         piml/fdvlInOip3xrFvTxU5nBmgX5vG5l5oy/by4OzjXvG+BSejkS7dduwxZywBXQrGH
         ilwYcsVsroc6tJyrNhAdaYf3IQ8QJTHCAn/pNIETd3HK1/mAtSiF5xNvVUCSY/9wiUAg
         ev0JC2kg124UUnBLtveaiL2NuauJmvAblEWCR6uzGX3tnRjnuxYwc2zZYcxGjIbaJS64
         SVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724912178; x=1725516978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y4ddcKIVUQCa1/ea3XcOqcG2GLAb+NeoR2FFMnflVY=;
        b=smxNW/KgyIlSfkNzEEimtCgbMiTpJGDG6yk3ZIhvFMjwRrH4UrKKE8Gj+detiY5DAq
         ch55tV8lsVQuATyzIGFrczZKe5+4lLQ6fWlKkhukotqy6Yyqqy3ji0c5+xIKjQ5DxWGX
         TgVcellZxqQrB8cbUvocYPfYoCqd5PtI0nlY0cd9zl0ZyDaWi7fp4QhsRenIN6VXhIT5
         d1AEUUTSIlXHwj7LdBrh7+eDEPWuG4feiJHfeU3PGqX4u/ZqLkNkYq36BBabP81TTB6h
         u4g6rvEiHxfKerBCb3gVThGMow3TN15OAZrALQNV3GEzp2UQkfAu4CT9fP1BA0hbPS3e
         Upgw==
X-Forwarded-Encrypted: i=1; AJvYcCVRCKZdV97qnzkoTuabdStaE+LriC+S6a2oJyGXbMOfDhX3XidR0nGkveZ2MPA1WBJmax/6V0VdS2MQRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yza5/cMDN/aM163FBTZv+0rFaOMxGe1Nu87DDzCH9WjeDgn7n1n
	vyyS5GJTb7VkgLYWzCJf5GwPF+XPSWW/7hqR9LukSWBLUY2JNuV16/EJPTruhVS63fV6CDof+Gz
	TkVInWCdDjAiMQUZNas25I+zWPE36JE8rcoYKkg==
X-Google-Smtp-Source: AGHT+IEE4wRUW1rNC4WHXpmToVacLhp7JtdVm9GWj68DauHvAo1uUeyA1+SsT9HZgMVr7s8RUG+CLOtF61Epupbl4tY=
X-Received: by 2002:a05:6808:1241:b0:3de:218f:b60 with SMTP id
 5614622812f47-3df05c480afmr1690639b6e.17.1724912177961; Wed, 28 Aug 2024
 23:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-2-nick.hu@sifive.com>
 <CAK9=C2XSrxXGB-PKKi0sLQq7L1Ovucb73Bc9tOnxwWTxux_D7g@mail.gmail.com>
In-Reply-To: <CAK9=C2XSrxXGB-PKKi0sLQq7L1Ovucb73Bc9tOnxwWTxux_D7g@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 29 Aug 2024 14:16:07 +0800
Message-ID: <CAKddAkBwL+n7fK6ugCpNeCv3dryaPJTS1qAM9E6VHb1QkSKd=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Add stimecmp save and restore
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_231619_317954_A1B4E9EC 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCk9uIFRodSwgQXVnIDI5LCAyMDI0IGF0IDE6MTjigK9QTSBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyOSwgMjAyNCBh
dCA5OjA54oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBJ
ZiB0aGUgSFcgc3VwcG9ydCB0aGUgU1NUQyBleHRlbnNpb24sIHdlIHNob3VsZCBzYXZlIGFuZCBy
ZXN0b3JlIHRoZQo+ID4gc3RpbWVjbXAgcmVnaXN0ZXIgd2hpbGUgY3B1IG5vbiByZXRlbnRpb24g
c3VzcGVuZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5j
b20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N1c3BlbmQuaCB8ICA0ICsr
KysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMgICAgICB8IDEzICsrKysrKysrKysr
KysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdXNwZW5kLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N1c3BlbmQuaAo+ID4gaW5kZXggNGZmYjAyMmIwOTdmLi5mZmFhYzJlZmFiYjUgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N1c3BlbmQuaAo+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdXNwZW5kLmgKPiA+IEBAIC0xNiw2ICsxNiwxMCBAQCBz
dHJ1Y3Qgc3VzcGVuZF9jb250ZXh0IHsKPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBlbnZjZmc7
Cj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdHZlYzsKPiA+ICAgICAgICAgdW5zaWduZWQgbG9u
ZyBpZTsKPiA+ICsjaWYgX19yaXNjdl94bGVuIDwgNjQKPiA+ICsgICAgICAgdW5zaWduZWQgbG9u
ZyBzdGltZWNtcGg7Cj4gPiArI2VuZGlmCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgc3RpbWVj
bXA7Cj4gPiAgI2lmZGVmIENPTkZJR19NTVUKPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzYXRw
Owo+ID4gICNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gaW5kZXggYzhjZWMwY2M1ODMzLi4z
YWZkODZlMWFiZjcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMK
PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gQEAgLTE5LDYgKzE5LDEy
IEBAIHZvaWQgc3VzcGVuZF9zYXZlX2NzcnMoc3RydWN0IHN1c3BlbmRfY29udGV4dCAqY29udGV4
dCkKPiA+ICAgICAgICAgY29udGV4dC0+dHZlYyA9IGNzcl9yZWFkKENTUl9UVkVDKTsKPiA+ICAg
ICAgICAgY29udGV4dC0+aWUgPSBjc3JfcmVhZChDU1JfSUUpOwo+ID4KPiA+ICsgICAgICAgaWYg
KHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TU1RDKSkgewo+ID4g
KyAgICAgICAgICAgICAgIGNvbnRleHQtPnN0aW1lY21wID0gY3NyX3JlYWQoQ1NSX1NUSU1FQ01Q
KTsKPiA+ICsjaWYgX19yaXNjdl94bGVuIDwgNjQKPiA+ICsgICAgICAgICAgICAgICBjb250ZXh0
LT5zdGltZWNtcGggPSBjc3JfcmVhZChDU1JfU1RJTUVDTVBIKTsKPiA+ICsjZW5kaWYKPiA+ICsg
ICAgICAgfQo+Cj4gVGhlIHN1c3BlbmQgc2F2ZS9yZXN0b3JlIGlzIGVuYWJsZWQgZm9yIHRoZSBO
b01NVSBrZXJuZWwgYXMgd2VsbAo+ICh3aGljaCBydW5zIGluIE0tbW9kZSkgc28gaXQgaXMgYmV0
dGVyIHRvIHNhdmUvcmVzdG9yZSBzdGltZWNtcCBDU1IKPiBvbmx5IGZvciBNTVUgZW5hYmxlZCBr
ZXJuZWxzIChqdXN0IGxpa2Ugc2F0cCBDU1IpLgo+Ckdvb2QgcG9pbnQuIFdpbGwgdXBkYXRlIHRo
YXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgo+ID4gICAg
ICAgICAvKgo+ID4gICAgICAgICAgKiBObyBuZWVkIHRvIHNhdmUvcmVzdG9yZSBJUCBDU1IgKGku
ZS4gTUlQIG9yIFNJUCkgYmVjYXVzZToKPiA+ICAgICAgICAgICoKPiA+IEBAIC00Miw2ICs0OCwx
MyBAQCB2b2lkIHN1c3BlbmRfcmVzdG9yZV9jc3JzKHN0cnVjdCBzdXNwZW5kX2NvbnRleHQgKmNv
bnRleHQpCj4gPiAgICAgICAgIGNzcl93cml0ZShDU1JfVFZFQywgY29udGV4dC0+dHZlYyk7Cj4g
PiAgICAgICAgIGNzcl93cml0ZShDU1JfSUUsIGNvbnRleHQtPmllKTsKPiA+Cj4gPiArICAgICAg
IGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU1NUQykpIHsK
PiA+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBjb250ZXh0LT5zdGlt
ZWNtcCk7Cj4gPiArI2lmIF9fcmlzY3ZfeGxlbiA8IDY0Cj4gPiArICAgICAgICAgICAgICAgY3Ny
X3dyaXRlKENTUl9TVElNRUNNUEgsIGNvbnRleHQtPnN0aW1lY21waCk7Cj4gPiArI2VuZGlmCj4g
PiArICAgICAgIH0KPiA+ICsKPiA+ICAjaWZkZWYgQ09ORklHX01NVQo+ID4gICAgICAgICBjc3Jf
d3JpdGUoQ1NSX1NBVFAsIGNvbnRleHQtPnNhdHApOwo+ID4gICNlbmRpZgo+ID4gLS0KPiA+IDIu
MzQuMQo+ID4KPiA+Cj4KPiBSZWdhcmRzLAo+IEFudXAKClJlZ2FyZHMsCk5pY2sKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
