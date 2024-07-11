Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFE4C3DA41
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Se030gvsBTrRVn8MYE9IrS8mAv5UTuU5dfuvZdIBasY=; b=DV+18slLSE02x8
	40/u5iVRHrDom7yP6ukaSxQtp2h0EijUl2ZHdxKvovb5hwKCSNLReFtlsIWKVn97eafa76npRuOAr
	hLgZ3/Po4voFekUwsc5hW3S0sREEgkhfXQhnwbAjJxaztVxf38MeoAAQNa6GdxzCBGIsGRlIg57Z5
	f0QnHV1ESzkWZY57nJnMfXsHkZJ0CAeMfs1oXf+IfF78xrXH4T55qs8tRmLYg8YmJaV6O/kmswiFl
	wrSpJqwjr9o726mD1ebhy3rzcf4rOCXqwQXFphakRojwtrkOLo9U1gZcUwqQrYJgHSCpzI5xQCPbL
	Qs/AV11EZq8TwgF2YPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRr8j-0000000DZhS-10zt;
	Thu, 11 Jul 2024 10:35:05 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRr8f-0000000DZdh-0M7W
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 10:35:03 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3d9da46ca13so371082b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1720694099; x=1721298899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81XIkWS3ndQ7+PCCdHsExXmF1eARnUo6Gh7sCw+xD4Y=;
        b=noc2LjNKu6NkUZfE3RMyUorNnH0eWQVJ/yQI+eVw+p4h9SBKJ7gZuDuzN2R1+c2JqH
         lsfkWiM9D9HokYLm82GG/R+IAmjuFn2hbCWNvwmEykHcRhCm6ra4HZAMyaOabyTisNw1
         x3UMIgz5zVv3FYD8jHnNol2/bNkV5AzG3kvX/Va+TX0d9znMssfaqDlRfQCZihPE/N6r
         Sz2iI8PyVi+6T6X4ic3ppRNSwRSdwguK6QVFTKPe02rrczdMWK0HwEWyvlJ3olqQfEHW
         71M2LPHR/3XPo0uOyzvr1IOadfmagk0xghkNMdd5kV73aw42ReUv9MHd3EqEKd3UiYjZ
         Etpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720694099; x=1721298899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81XIkWS3ndQ7+PCCdHsExXmF1eARnUo6Gh7sCw+xD4Y=;
        b=kA3AZ7ccIssGC5iFsCTgdqt4WQA8DcyFlmJgVmqnh6vZ7O/H9mEE6sLXamlH3DN3SG
         DyvVFP1S5kGzvAcdJ32Kz745KjP//xJTpCXOFsib2k2DngiEgCB28vK09K3TQvCtjxVa
         x6sRL4WofrzGxPuXs8OWvUnG9sy+1FStwqhw+FvIbK66zUSGgT0IeItWTcw98qIbJ7sy
         ZXJz7c2/Xgltfx2oBEk7gzzzNwWfdtJoUqEMf8ZOcBUxT+usUi26v9X7WExIVkVKGxWD
         tOMP9eoir8eegbertKwuA3WTk3lPVUobSQhgW31sstrPQK8gfQUmdt/SyJB1a3/0+T8u
         fMLw==
X-Forwarded-Encrypted: i=1; AJvYcCW4/bk18YSQFblIwj+HlYCFivfaXGu/KxFSEbQo4BsNR7BS2h5S7SFAT5uu5p1bB3wna04aeJPQhxLDhCnHXpvuT8YBcJZ+PlcKhl+2kYbY
X-Gm-Message-State: AOJu0YzHQzjtCVtXBctF0K+ABplcTg8qYCiX/ZlF5nhBmdAOSXkviC61
	j1a+p/a7HGk9wxRT4Yp5IyhJ3YPuI00T88/gLi2F2ibREgjrLp5yrSbv7K7a619oEHvUdM3Zf3j
	FIhT4nee3wHl0vDPIMPx7yWu3QN7tj9Ltl25nxg==
X-Google-Smtp-Source: AGHT+IFJB5x3pYSD0y4Q5r4wWK4Y3rLRAWXELD1JUSAm8Ow50OC5okYZ99DPR11L57LtC71EXPAYdgoDHtJYINBxm0g=
X-Received: by 2002:a05:6808:308d:b0:3d9:2415:da77 with SMTP id
 5614622812f47-3d93c073d69mr9586482b6e.25.1720694099522; Thu, 11 Jul 2024
 03:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
 <20240628093711.11716-3-yongxuan.wang@sifive.com> <20240628-clamp-vineyard-c7cdd40a6d50@spud>
 <402C3422-0248-4C0F-991E-C0C4BBB0FA72@jrtc27.com> <20240630-caboose-diameter-7e73bf86da49@spud>
In-Reply-To: <20240630-caboose-diameter-7e73bf86da49@spud>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 11 Jul 2024 18:34:49 +0800
Message-ID: <CAMWQL2gpg-xN5xjshTaZT5844kKoZHDmLUQb8nXYYzw1RGbykQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Conor Dooley <conor@kernel.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_033501_275959_E1A60CCC 
X-CRM114-Status: GOOD (  31.40  )
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

SGkgQ29ub3IgYW5kIEplc3NpY2EsCgpPbiBTdW4sIEp1biAzMCwgMjAyNCBhdCAxMDowOeKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEp1biAy
OSwgMjAyNCBhdCAwMjowOTozNFBNICswMTAwLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiA+IE9u
IDI4IEp1biAyMDI0LCBhdCAxNzoxOSwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBKdW4gMjgsIDIwMjQgYXQgMDU6Mzc6MDZQTSArMDgw
MCwgWW9uZy1YdWFuIFdhbmcgd3JvdGU6Cj4gPiA+PiBBZGQgZW50cmllcyBmb3IgdGhlIFN2YWRl
IGFuZCBTdmFkdSBleHRlbnNpb25zIHRvIHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucwo+ID4gPj4g
cHJvcGVydHkuCj4gPiA+Pgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlv
bmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4gLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgMjggKysrKysrKysrKysrKysrKysrKwo+
ID4gPj4gMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPiA+ID4+Cj4gPiA+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKPiA+ID4+IGluZGV4IDQ2OGM2NDYyNDdhYS4uYzNkMDUzY2U3NzgzIDEwMDY0NAo+
ID4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbAo+ID4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gPj4gQEAgLTE1Myw2ICsxNTMsMzQgQEAgcHJvcGVy
dGllczoKPiA+ID4+ICAgICAgICAgICAgIHJhdGlmaWVkIGF0IGNvbW1pdCAzZjllZDM0ICgiQWRk
IGFiaWxpdHkgdG8gbWFudWFsbHkgdHJpZ2dlcgo+ID4gPj4gICAgICAgICAgICAgd29ya2Zsb3cu
ICgjMikiKSBvZiByaXNjdi10aW1lLWNvbXBhcmUuCj4gPiA+Pgo+ID4gPj4gKyAgICAgICAgLSBj
b25zdDogc3ZhZGUKPiA+ID4+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ID4+ICsgICAg
ICAgICAgICBUaGUgc3RhbmRhcmQgU3ZhZGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9y
IFNXLW1hbmFnZWQgUFRFIEEvRAo+ID4gPj4gKyAgICAgICAgICAgIGJpdCB1cGRhdGVzIGFzIHJh
dGlmaWVkIGluIHRoZSAyMDI0MDIxMyB2ZXJzaW9uIG9mIHRoZSBwcml2aWxlZ2VkCj4gPiA+PiAr
ICAgICAgICAgICAgSVNBIHNwZWNpZmljYXRpb24uCj4gPiA+PiArCj4gPiA+PiArICAgICAgICAg
ICAgQm90aCBTdmFkZSBhbmQgU3ZhZHUgZXh0ZW5zaW9ucyBjb250cm9sIHRoZSBoYXJkd2FyZSBi
ZWhhdmlvciB3aGVuCj4gPiA+PiArICAgICAgICAgICAgdGhlIFBURSBBL0QgYml0cyBuZWVkIHRv
IGJlIHNldC4gVGhlIGRlZmF1bHQgYmVoYXZpb3IgZm9yIHRoZSBmb3VyCj4gPiA+PiArICAgICAg
ICAgICAgcG9zc2libGUgY29tYmluYXRpb25zIG9mIHRoZXNlIGV4dGVuc2lvbnMgaW4gdGhlIGRl
dmljZSB0cmVlIGFyZToKPiA+ID4+ICsgICAgICAgICAgICAxKSBOZWl0aGVyIFN2YWRlIG5vciBT
dmFkdSBwcmVzZW50IGluIERUID0+Cj4gPiA+Cj4gPiA+PiAgICAgICAgICAgICAgICBJdCBpcyB0
ZWNobmljYWxseQo+ID4gPj4gKyAgICAgICAgICAgICAgIHVua25vd24gd2hldGhlciB0aGUgcGxh
dGZvcm0gdXNlcyBTdmFkZSBvciBTdmFkdS4gU3VwZXJ2aXNvciBtYXkKPiA+ID4+ICsgICAgICAg
ICAgICAgICBhc3N1bWUgU3ZhZGUgdG8gYmUgcHJlc2VudCBhbmQgZW5hYmxlZCBvciBpdCBjYW4g
ZGlzY292ZXIgYmFzZWQKPiA+ID4+ICsgICAgICAgICAgICAgICBvbiBtdmVuZG9yaWQsIG1hcmNo
aWQsIGFuZCBtaW1waWQuCj4gPiA+Cj4gPiA+IEkgd291bGQganVzdCB3cml0ZSAiZm9yIGJhY2t3
YXJkcyBjb21wYXRpYmlsaXR5LCBpZiBuZWl0aGVyIFN2YWRlIG5vcgo+ID4gPiBTdmFkdSBhcHBl
YXIgaW4gdGhlIGRldmljZXRyZWUgdGhlIHN1cGVydmlzb3IgbWF5IGFzc3VtZSBTdmFkZSB0byBi
ZQo+ID4gPiBwcmVzZW50IGFuZCBlbmFibGVkIi4gSWYgdGhlcmUgYXJlIHN5c3RlbXMgdGhhdCB0
aGlzIGJlaGF2aW91ciBjYXVzZXMKPiA+ID4gcHJvYmxlbXMgZm9yLCB3ZSBjYW4gZGVhbCB3aXRo
IHRoZW0gaWZmIHRoZXkgYXBwZWFyLiBJIGRvbid0IHRoaW5rCj4gPiA+IGxvb2tpbmcgYXQgbSpp
ZCB3b3VsZCBiZSBzdWZmaWNpZW50IGhlcmUgYW55d2F5LCBzaW5jZSB0aGUgZmlybXdhcmUgY2Fu
Cj4gPiA+IGhhdmUgYW4gaW1wYWN0LiBJJ2QganVzdCBkcm9wIHRoYXQgcGFydCBlbnRpcmVseS4K
PiA+Cj4gPiBPbGRlciBRRU1VIGZhbGxzIGludG8gdGhhdCBjYXRlZ29yeSwgYXMgZG8gQmx1ZXNw
ZWPigJlzIHNvZnQtY29yZXMgKHdoaWNoCj4gPiBvdXJzIGFyZSBkZXJpdmVkIGZyb20gYXQgQ2Ft
YnJpZGdlKS4gSSBmZWVsIHRoYXQsIGluIHJlYWxpdHksIG9uZQo+ID4gc2hvdWxkIGJlIHByZXBh
cmVkIHRvIGhhbmRsZSBib3RoIHRyYXBwaW5nIGFuZCBhdG9taWMgdXBkYXRlcyBpZgo+ID4gd3Jp
dGluZyBhbiBPUyB0aGF0IGFpbXMgdG8gc3VwcG9ydCBjYXNlIDEuCj4KPiBJIGd1ZXNzIHRoYXQg
aXMgYWN0dWFsbHkgd2hhdCB3ZSBzaG91bGQgcHV0IGluIHRoZW4sIHRvIHVzZSBhbgo+IGFwcHJv
eGltYXRpb24gb2YgeW91ciB3b3JkaW5nLCBzb21ldGhpbmcgbGlrZQo+ICAgICAgICAgTmVpdGhl
ciBTdmFkZSBub3IgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIHNvZnR3YXJlIHNo
b3VsZCBiZQo+ICAgICAgICAgcHJlcGFyZWQgdG8gaGFuZGxlIGVpdGhlciBoYXJkd2FyZSB1cGRh
dGluZyBvZiB0aGUgUFRFIEEvRCBiaXRzIG9yIHBhZ2UKPiAgICAgICAgIGZhdWx0cyB3aGVuIHRo
ZXkgbmVlZCB1cGRhdGVkCj4gPwoKVGhhbmsgeW91ISBJIHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0
IHZlcnNpb24uCgpSZWdhcmRzLApZb25nLVh1YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
