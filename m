Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2865C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 03:36:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8550661924
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 03:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8550661924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OWKDa3NJ/WS7ffOV8QGtYsMJoTwUV8EW6okAf+aSKAs=; b=nspdHbeW55Yies2kxsxzcObqE
	gMoBrOqweAPFlICC3OkiSz7UO5iaCwKC3po6RSnPoXRChTG9waSDV0H7WBt2eItcEDxWJqdcKRpS8
	aLbZjZ80TckM481R3sijgKeivOW633QRX+SThnUWpR2qr0RB4nXd6Q161P5BLlJAO4IU44YtgnU5m
	fsLpO6OREe0uUowze34yqVFIWlTh+SGUffLnnh3dP6l8tj+Kjg+DDDOO7MujSvDySo5i8oNYlFMPo
	HHUYMZAUE1YDdrfl/okHtfteAD0C60YKnNRB+LIEjlkUjFZwR1wQuP2fO+LavR1sAwMFPpNnXhTKJ
	VrnSVw7LQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR5B8-002acx-Kk; Tue, 30 Mar 2021 03:36:30 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR5B3-002abu-TH
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 03:36:27 +0000
Received: by mail-qv1-xf33.google.com with SMTP id by2so7520556qvb.11
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5oFbwfLQwyYfYwndfNuhqzfmnicAmT4eTuezCa87hZ8=;
 b=Ig+y6Y+c1gyTxgnPBQWPhpOyXg4OoXKv2BE4qr6DHkGfLyEyHrKOUH7MGn1otpkWcN
 kyE/XgUxXw2odCG9cs8Z01SbUYyCaZ5Lu35u7upzKgWerIlCX9tcG+ej8dGbF4oft59o
 Jz45nZZMBILlzNrBpaIkRVJbA0/irRVXLZ8M5ZS6fbuk1zvqLF+xmgeATsd8G2M9wchi
 ZqQaXZAQqhmisluHGosx2pBeGVINB4/GAWUybfaWEiIDOJmmYrmqzWrCWg05rXXqsEwA
 DRvVz8/su4/18C7RTUF8HDL18/u0ZvAZd8OvyXlYSmkfecn/kES13pwqea31yuVPL438
 0pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5oFbwfLQwyYfYwndfNuhqzfmnicAmT4eTuezCa87hZ8=;
 b=AfOVr2WvroGCf4bG8dNkKqJQL+Mdb/1h6YIFlODUU+Ypzjbvw7nZFv5p8/opeXrIUd
 EoriKpEvjp2JB2/hDwk6LmfKeZ/ILSaFKil4VGodaTaaDJuANazo0+JXKXri7MsulWSc
 JUg7D1zTAA6o8JbVj5Ac6kA2eHaI2hxffT5++g2ePUJ71GFoMtbwPpC1yE9kCD+1hdop
 uEw0+6hoqfIUlFX99rghmYgFhih0P7EpGazIgJu10m7VH3vXxa0ZuoJAu3ZB0Eqrs7Aw
 33Hw4ExOo3Y293XvQQjXTTez5cIAZpEEeE3sWZgcGwNcWbUObNM191Js+MzfUeDc7/Ob
 kjfg==
X-Gm-Message-State: AOAM532vFXg6TqmprxRFxaJTMBgX+fTqvMKxAwYsoDw5rNHeEu9cB1/i
 JWv4cSyEIZUY4I5qJUpCKXlyldlqRLmzA2qLYaoj0A==
X-Google-Smtp-Source: ABdhPJycQJX/y0PAtsFp+YXjKCTZ+dLVuREDX7kiJ+wyKRjUQUcZEbZpXPSdS3GtQqa6UBU6KpvoUU+fWG5o791GvQ0=
X-Received: by 2002:a0c:e9c7:: with SMTP id q7mr28188265qvo.7.1617075384531;
 Mon, 29 Mar 2021 20:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <91d016e59bab9d9175168a63e7bcd81fdb69b549.1615954046.git.greentime.hu@sifive.com>
 <161704524201.3012082.13807741329367593907@swboyd.mtv.corp.google.com>
In-Reply-To: <161704524201.3012082.13807741329367593907@swboyd.mtv.corp.google.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 30 Mar 2021 11:36:12 +0800
Message-ID: <CAHCEehL63aJQPA3DdRCa3pZHWX3DH9ktgKbo1+nD=KWxADsogA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: sifive: Use reset-simple in prci driver for
 PCIe driver
To: Stephen Boyd <sboyd@kernel.org>
Cc: alex.dewar90@gmail.com, Albert Ou <aou@eecs.berkeley.edu>, 
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
 Erik Danie <erik.danie@sifive.com>, hayashi.kunihiko@socionext.com, 
 Bjorn Helgaas <helgaas@kernel.org>, hes@sifive.com, jh80.chung@samsung.com, 
 khilman@baylibre.com, linux-clk@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, lorenzo.pieralisi@arm.com, 
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org, vidyas@nvidia.com, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_043626_090813_EEF8D352 
X-CRM114-Status: GOOD (  12.81  )
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

U3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDPmnIgzMOaXpSDpgLHk
uowg5LiK5Y2IMzoxNOWvq+mBk++8mgo+Cj4gUXVvdGluZyBHcmVlbnRpbWUgSHUgKDIwMjEtMDMt
MTcgMjM6MDg6MDkpCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9LY29uZmlnIGIvZHJp
dmVycy9yZXNldC9LY29uZmlnCj4gPiBpbmRleCA3MWFiNzVhNDY0OTEuLmYwOTRkZjkzZDkxMSAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcmVzZXQvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9y
ZXNldC9LY29uZmlnCj4gPiBAQCAtMTczLDcgKzE3Myw3IEBAIGNvbmZpZyBSRVNFVF9TQ01JCj4g
Pgo+ID4gIGNvbmZpZyBSRVNFVF9TSU1QTEUKPiA+ICAgICAgICAgYm9vbCAiU2ltcGxlIFJlc2V0
IENvbnRyb2xsZXIgRHJpdmVyIiBpZiBDT01QSUxFX1RFU1QKPiA+IC0gICAgICAgZGVmYXVsdCBB
UkNIX0FHSUxFWCB8fCBBUkNIX0FTUEVFRCB8fCBBUkNIX0JJVE1BSU4gfHwgQVJDSF9SRUFMVEVL
IHx8IEFSQ0hfU1RNMzIgfHwgQVJDSF9TVFJBVElYMTAgfHwgQVJDSF9TVU5YSSB8fCBBUkNIX1pY
IHx8IEFSQwo+ID4gKyAgICAgICBkZWZhdWx0IEFSQ0hfQUdJTEVYIHx8IEFSQ0hfQVNQRUVEIHx8
IEFSQ0hfQklUTUFJTiB8fCBBUkNIX1JFQUxURUsgfHwgQVJDSF9TVE0zMiB8fCBBUkNIX1NUUkFU
SVgxMCB8fCBBUkNIX1NVTlhJIHx8IEFSQ0hfWlggfHwgQVJDIHx8IFJJU0NWCj4KPiBUaGlzIGNv
bmZsaWN0cy4gQ2FuIHRoaXMgZGVmYXVsdCBiZSBwYXJ0IG9mIHRoZSByaXNjdiBkZWZjb25maWcg
aW5zdGVhZD8KPgoKTWF5YmUgSSBzaG91bGQgcmVtb3ZlIHRoaXMgc2luY2UgaXQgaGFzIGJlZW4g
c2VsZWN0ZWQgYnkgQ0xLX1NJRklWRV9QUkNJPwoKIGNvbmZpZyBDTEtfU0lGSVZFX1BSQ0kKICAg
ICAgICBib29sICJQUkNJIGRyaXZlciBmb3IgU2lGaXZlIFNvQ3MiCisgICAgICAgc2VsZWN0IFJF
U0VUX0NPTlRST0xMRVIKKyAgICAgICBzZWxlY3QgUkVTRVRfU0lNUExFCgo+ID4gICAgICAgICBo
ZWxwCj4gPiAgICAgICAgICAgVGhpcyBlbmFibGVzIGEgc2ltcGxlIHJlc2V0IGNvbnRyb2xsZXIg
ZHJpdmVyIGZvciByZXNldCBsaW5lcyB0aGF0Cj4gPiAgICAgICAgICAgdGhhdCBjYW4gYmUgYXNz
ZXJ0ZWQgYW5kIGRlYXNzZXJ0ZWQgYnkgdG9nZ2xpbmcgYml0cyBpbiBhIGNvbnRpZ3VvdXMsCj4g
PiBAQCAtMTg3LDYgKzE4Nyw3IEBAIGNvbmZpZyBSRVNFVF9TSU1QTEUKPiA+ICAgICAgICAgICAg
LSBSQ0MgcmVzZXQgY29udHJvbGxlciBpbiBTVE0zMiBNQ1VzCj4gPiAgICAgICAgICAgIC0gQWxs
d2lubmVyIFNvQ3MKPiA+ICAgICAgICAgICAgLSBaVEUncyB6eDI5NjcgZmFtaWx5Cj4gPiArICAg
ICAgICAgIC0gU2lGaXZlIEZVNzQwIFNvQ3MKPiA+Cj4gPiAgY29uZmlnIFJFU0VUX1NUTTMyTVAx
NTcKPiA+ICAgICAgICAgYm9vbCAiU1RNMzJNUDE1NyBSZXNldCBEcml2ZXIiIGlmIENPTVBJTEVf
VEVTVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
