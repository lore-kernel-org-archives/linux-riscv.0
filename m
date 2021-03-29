Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4720CC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:54:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E47476195D
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E47476195D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JlCHeQKd+I/gMbHlZuMXUjNP2fT+jOGQLX67oMXBV7Q=; b=jNWbVB3QvZc5uCOKhTYBGwd3J
	2/+tvM1i9J3OedPt6RR13Ur4slJBBAofmYeUZQRk056NiFqf+ittARN7SSTisvUG/jzAqyyCryLiJ
	psktshGFjcYCPBHFt3RNmGdcsC7HQMDw8KICrJZVguvj7ISzD9QAmmY1H7GNw/w/Q3i7eAfidv66J
	7OJ9Sl1+L9KXnZTSDS519tqumJilF7fxRmm5qZLUW5O3LF1hnWNgwKImh8afX3sPaXTs0DY9NFbQS
	ZT3pe5ad4eflnR0IjYI6MskWQUHs8KrGMwRvB/NTgyanxQZpOCbiielXiYAkQtRqXcdfGzapHKcsf
	sx34FSQUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQx1m-0018dl-22; Mon, 29 Mar 2021 18:54:18 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQphd-000bLq-0l
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 11:05:04 +0000
Received: by mail-vs1-xe32.google.com with SMTP id a23so6161081vsd.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 04:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t+xrhMH6Gr2A3zI8Lcey2uhccYuzey1LBxw8FGRBr38=;
 b=GlrshGa0JheYxNSV53Bg30loaFV1EoaqTDeQ4sNl5yMfy0XcZRrlxMtdMSPW1A7Yf4
 EbTgvKP2xqK9gpYlJKevK6F099bP6A7MjXe561/2v+ADngUOs3cryvs85OYWgtjJZXfk
 1iQoDgHm2qxjio8Y9Ymp80ANC43PudXOfx/WUcIOvInOgXAy7VcIgWyRsm98QhImbst5
 +/1tM1ELbjLI5lHjScnDyL90S4FRIHjiUbfHkrmzex7q+YurcZfSlSqSK3bSb3xrZVAs
 MnNvbTC7Hmn51U/oVHggPrGZ47AxohQwlQ8dtGXWZ4z6bqbTVeScW2T0abx16japHG9X
 wOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t+xrhMH6Gr2A3zI8Lcey2uhccYuzey1LBxw8FGRBr38=;
 b=uAFtL0hxpQLXv9SSruASNO7nkqRw6iF4PLKpTR/153FeX/cF6HlQojyFf5xvZioq3F
 8i+uG2RFHqAoc9h6+zoiZ4PyGhbv0CYFJ+l9RSjn3fPFWJsWJvoJMjZJ8w1cKxXlxd89
 ylVEIK8gM1bca+qd6FPVOTmfDFwJCsU55uiX+M6yxe++h4MTwtwXoeGWoJvQtrI6AvV4
 eZPuYlUDXLuZdTeAB1ZnG8dnY2O9O189jO1lEg3MtQgKc7QYlDgdVisOono5JdCYaYaY
 dTGqQZE5Wr7OwuIwzegrQv/9PP7wNLCkOoknMkHmaK2MXMJvSWi7NK2RjL7dvJHxmPGy
 QBPg==
X-Gm-Message-State: AOAM532C1AZWyb3jM4aRbAplbRNxdYi/nxPkN+y/gZu9u+eR1uyN+pfC
 Z0lFRspjjTbOamZVygPtOI02RLUM4VxrT5+K2X4FJ0omFOO+Qw==
X-Google-Smtp-Source: ABdhPJwtzOJzKprrFyS651SYxqerVpA4YQVKn1jE961aUbyTUomzkbGS4bOkuGuS6qbJozSOfhU9WUXqdidGPMyRNcE=
X-Received: by 2002:a0c:dd14:: with SMTP id u20mr24167583qvk.13.1616989206452; 
 Sun, 28 Mar 2021 20:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
 <20210323203508.GA1251968@robh.at.kernel.org>
In-Reply-To: <20210323203508.GA1251968@robh.at.kernel.org>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Mon, 29 Mar 2021 11:39:54 +0800
Message-ID: <CAHCEehKw2Sb6DN-hQCZB8-ARuaOf47mmzS18Fqm1amr4sXVCRg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
To: Rob Herring <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com, 
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 sboyd@kernel.org, 
 lorenzo.pieralisi@arm.com, Philipp Zabel <p.zabel@pengutronix.de>,
 alex.dewar90@gmail.com, 
 khilman@baylibre.com, hayashi.kunihiko@socionext.com, vidyas@nvidia.com, 
 jh80.chung@samsung.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_120501_151787_83168A8D 
X-CRM114-Status: GOOD (  14.19  )
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

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQz5pyIMjTml6Ug6YCx5LiJ
IOS4iuWNiDQ6MzXlr6vpgZPvvJoKPgo+IE9uIFRodSwgTWFyIDE4LCAyMDIxIGF0IDAyOjA4OjEx
UE0gKzA4MDAsIEdyZWVudGltZSBIdSB3cm90ZToKPiA+IEFkZCBQQ0llIGhvc3QgY29udHJvbGxl
ciBEVCBiaW5kaW5ncyBvZiBTaUZpdmUgRlU3NDAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3Jl
ZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5k
aW5ncy9wY2kvc2lmaXZlLGZ1NzQwLXBjaWUueWFtbCAgICAgICB8IDExOSArKysrKysrKysrKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zaWZpdmUs
ZnU3NDAtcGNpZS55YW1sClsuLi5dCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAg
cGNpZUBlMDAwMDAwMDAgewo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4gPiAr
ICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8Mj47Cj4gPiArICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxmdTc0MC1wY2llIjsKPiA+
ICsgICAgICAgIHJlZyA9IDwweGUgMHgwMDAwMDAwMCAweDEgMHgwCj4KPiBIdW1tLCA0R0IgZm9y
IERCSSBzcGFjZT8gVGhlIERXQyBjb250cm9sbGVyIGRvZXNuJ3QgaGF2ZSB0aGF0IG11Y2gKPiBz
cGFjZSwgYW5kIHRoZSBrZXJuZWwgd2lsbCBtYXAgKmFsbCogb2YgdGhhdC4gVGhhdCdzIG5vdCBh
bgo+IGluc2lnbmlmaWNhbnQgYW1vdW50IG9mIG1lbW9yeSBqdXN0IGZvciBwYWdlIHRhYmxlcy4K
ClRoYW5rIHlvdSBmb3IgcmV2aWV3IGFuZCBwb2ludCB0aGlzIG91dC4gOikKCkkgY2hlY2sgdGhl
IHNwZWMgZGVzY3JpcHRpb24gZm9yIERCSSBpbiBEV0NfcGNpZV9jdGxfZG1fZGF0YWJvb2sucGRm
CnNlY3Rpb24gMy4xNSAzLjE2IGFuZCB0YWJsZSAzLTE3LgoKSSB0aGluayBDWF9TUklPVl9FTkFC
TEUgYW5kIENYX0FSSV9FTkFCTEUgd2lsbCBiZSBzZXQgdG8gMCBiZWNhdXNlCnRoZXNlIDIgYXJl
IGVuZHBvaW50IG1vZGUgZmVhdHVyZXMuClNpbmdsZSBSb290IEkvTyBWaXJ0dWFsaXphdGlvbiAo
U1ItSU9WKSBUaGlzIHNlY3Rpb24gZGVzY3JpYmVzIHRoZQpTUi1JT1YgZmVhdHVyZXMgaW1wbGVt
ZW50ZWQgaW4gRVAgbW9kZS4gVGhlIHBhcmFtZXRlciBmb3IgZW5hYmxpbmcKU1ItSU9WIGlzIENY
X1NSSU9WX0VOQUJMRQpBbHRlcm5hdGl2ZSBSb3V0aW5nLUlEIEludGVycHJldGF0aW9uIChBUkkp
IEFSSSBhbGxvd3MgYW4gZW5kcG9pbnQgdG8Kc3VwcG9ydCBtb3JlIHRoYW4gZWlnaHQgcGh5c2lj
YWwgZnVuY3Rpb25zIChQRnMpLiBBUkkgaXMgZW5hYmxlZCBieQp0aGUgQ1hfQVJJX0VOQUJMRSBw
YXJhbWV0ZXIuCgpTbyBiYXNlZCBvbiBUYWJsZSAzLTE3LCB3ZSB3aWxsIG5lZWQgdG8gbWFwIDJH
QihiaXQzMCkgaW5zdGVhZCBvZiA0R0IoYml0MzEpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
