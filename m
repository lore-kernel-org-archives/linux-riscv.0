Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF0FC2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxGbzjdiBCq0I7KAitK5ze7tTb/WZqufIoxl/F6VC1E=; b=m8N6wjNZ7n81dd
	SP64P6XqHIkxd4pJUTS7HifO6mKUprJG+ZpIdpvc5rqP6Ujc7e9PTHBz1kVfeVkGU7gdpSCTW4VYA
	5Lza2tgES99Waswjbcq2jtCArglO6D3mVFvF6vA8XkLYzi46sgQjylGlQh0tVznbx4VX6a1N8bNRS
	gar9Ch1ySjC7UXvLLqOAkNz2ww20BmHvMRMJXFpAs/bY5Lt7FcUM6BQYoPpKppUOPmmXGbzuNqAUH
	XQ1uOkeGuWP0mtX5e6iPOzM7MzwmUCuv/ilWu6SqBHNXjHp/kXFpI01a6Nfz7mAeG2zhrR5ZwQ0OA
	olbK6qIU3EwbbLCxIKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKe6n-00000009IKT-0o5a;
	Fri, 21 Jun 2024 13:15:17 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKe6k-00000009IJg-1IzX
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 13:15:15 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso2319009a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 06:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718975712; x=1719580512; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cD16Eg0jMB1tLt142Rk+A9t4pdlm9NDQxO24pzXHIlI=;
        b=kixrRClGsGEzqKo5SaUVoc5x1ep+72vzrCbP1MX5W0SObjhHbdCZCrqAxY60q2p/pP
         gHtoYoGghe64EJKgn/XsW/pNnyTjFN41PTSNhCD7dCB/CY3mvpPPwvE41+JMwbTQKvRU
         mcncwstC0sVDL7xr1FawBJ8SWlb8ke/NkEPYB2RXkE/b76JQqRBfhJgIOII1129uWVbY
         UUms03IaueUcQWkcZzeDVQ0LoEbBjtMtBD9AgHSb7duGhglapWCrf0+XRL8o9aMI0vjK
         9vdlY+5JAml/wS9dmiySwvLrQavv0rO4gDhE0ZExO4wRoKF7eQJ/On7qPsJRgbgvzMY7
         i5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718975712; x=1719580512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cD16Eg0jMB1tLt142Rk+A9t4pdlm9NDQxO24pzXHIlI=;
        b=cpjl3+G9mUXrmh31VIYZGFV2V+ZrwBBHN1w7xFslEYMZEacB4zroljl/YnII5HoIbo
         96xQ1Ea+oDsQ8zp1WQ27th/GQVoC+yjCREPoO4ODr6mTjzK+3eqpbXy01oNilJ6Eiy7i
         jMmLxUVm+pNSYqnsOP3CfrFCIMSzbynvSHiJqFysmhQlsRNHW2dBeR3S8ZOQO6n7GZye
         +dRhea7zqguVZyg32KS9+LsVCVZcU+cwknHQrAxGcwD006CHi+TqN0azmzyrPP491zC4
         PoxiPVdpW0viUE6ZT+ROv4jKl2Hoyd7LHbkGQPvdP0q/0N7H9IDDE/ccc07q7CsFQM9d
         3QKg==
X-Forwarded-Encrypted: i=1; AJvYcCWXX4FhuXRW8/W4F/4f3R1vaJfV1d6SawqkWF3WOmy1RJZ8qvILP/EwU8i5oUXYfX44ms8rIzxNUi2WnJ6WekMnE+mG7kH6DlatNPw1FNLb
X-Gm-Message-State: AOJu0YyRuv8NNkvBnnQRUfDb8B7vA1DPw+h5yPSCwSQyfJuzgD1Pc6Ek
	573JH8XsnNgqhZson7bvBzUllSGKQ9HUtlhKew+leCudzyx2AyOwbUlzmUQGuKg=
X-Google-Smtp-Source: AGHT+IEHzhMsJ0Rmre1Op5vsKrU4YAx88gVFBKQkrx9xQgMhlCsZix0dkICFq5gGjvtBpIaF8RFzng==
X-Received: by 2002:a50:8719:0:b0:57c:571f:e52d with SMTP id 4fb4d7f45d1cf-57d07ebeaaamr5721984a12.36.1718975712142;
        Fri, 21 Jun 2024 06:15:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3042fd72sm954912a12.48.2024.06.21.06.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 06:15:11 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:15:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor@kernel.org>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240621-9bf9365533a2f8f97cbf1f5e@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_061514_515195_13D45DD8 
X-CRM114-Status: GOOD (  47.18  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDI6NDI6MTVQTSBHTVQsIEFsZXhhbmRyZSBHaGl0aSB3
cm90ZToKPiAKPiBPbiAyMS8wNi8yMDI0IDEyOjE3LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBP
biBGcmksIEp1biAyMSwgMjAyNCBhdCAxMDozNzoyMUFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkg
d3JvdGU6Cj4gPiA+IE9uIDIwLzA2LzIwMjQgMDg6MjUsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+
ID4gT24gV2VkLCBKdW4gNSwgMjAyNCBhdCAxMDoyNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBXZWQsIEp1biAwNSwgMjAyNCBhdCAwODox
NTowOFBNICswODAwLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gQWRkIGVudHJp
ZXMgZm9yIHRoZSBTdmFkZSBhbmQgU3ZhZHUgZXh0ZW5zaW9ucyB0byB0aGUgcmlzY3YsaXNhLWV4
dGVuc2lvbnMKPiA+ID4gPiA+ID4gcHJvcGVydHkuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+
ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIHwgMzAgKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gPiAg
ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sCj4gPiA+ID4gPiA+IGluZGV4IDQ2OGM2NDYyNDdhYS4uMWUzMDk4ODgy
NmI5IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiA+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ID4gPiA+ID4g
QEAgLTE1Myw2ICsxNTMsMzYgQEAgcHJvcGVydGllczoKPiA+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgcmF0aWZpZWQgYXQgY29tbWl0IDNmOWVkMzQgKCJBZGQgYWJpbGl0eSB0byBtYW51YWxseSB0
cmlnZ2VyCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgIHdvcmtmbG93LiAoIzIpIikgb2Ygcmlz
Y3YtdGltZS1jb21wYXJlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gKyAgICAgICAgLSBjb25z
dDogc3ZhZGUKPiA+ID4gPiA+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiA+ID4g
PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFN2YWRlIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5z
aW9uIGZvciByYWlzaW5nIHBhZ2UtZmF1bHQKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIGV4Y2Vw
dGlvbnMgd2hlbiBQVEUgQS9EIGJpdHMgbmVlZCBiZSBzZXQgYXMgcmF0aWZpZWQgaW4gdGhlIDIw
MjQwMjEzCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICB2ZXJzaW9uIG9mIHRoZSBwcml2aWxlZ2Vk
IElTQSBzcGVjaWZpY2F0aW9uLgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICBCb3RoIFN2YWRlIGFuZCBTdmFkdSBleHRlbnNpb25zIGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJl
aGF2aW9yIHdoZW4KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIHRoZSBQVEUgQS9EIGJpdHMgbmVl
ZCB0byBiZSBzZXQuIFRoZSBkZWZhdWx0IGJlaGF2aW9yIGZvciB0aGUgZm91cgo+ID4gPiA+ID4g
PiArICAgICAgICAgICAgcG9zc2libGUgY29tYmluYXRpb25zIG9mIHRoZXNlIGV4dGVuc2lvbnMg
aW4gdGhlIGRldmljZSB0cmVlIGFyZToKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIDEuIE5laXRo
ZXIgc3ZhZGUgbm9yIHN2YWR1IGluIERUOiBkZWZhdWx0IHRvIHN2YWRlLgo+ID4gPiA+ID4gSSB0
aGluayB0aGlzIG5lZWRzIHRvIGJlIGV4cGFuZGVkIG9uLCBhcyB0byB3aHkgbm90aGluZyBtZWFu
cyBzdmFkZS4KPiA+ID4gPiBBY3R1YWxseSBpZiBib3RoIFN2YWRlIGFuZCBTdmFkdSBhcmUgbm90
IHByZXNlbnQgaW4gRFQgdGhlbgo+ID4gPiA+IGl0IGlzIGxlZnQgdG8gdGhlIHBsYXRmb3JtIGFu
ZCBPcGVuU0JJIGRvZXMgbm90aGluZy4KPiA+ID4gPiAKPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
IDIuIE9ubHkgc3ZhZGUgaW4gRFQ6IHVzZSBzdmFkZS4KPiA+ID4gPiA+IFRoYXQncyBhIHN0YXRl
bWVudCBvZiB0aGUgb2J2aW91cywgcmlnaHQ/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgIDMuIE9ubHkgc3ZhZHUgaW4gRFQ6IHVzZSBzdmFkdS4KPiA+ID4gPiA+IFRoaXMgaXMg
bm90IHJlbGV2YW50IGZvciBTdmFkZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgNC4gQm90aCBzdmFkZSBhbmQgc3ZhZHUgaW4gRFQ6IGRlZmF1bHQgdG8gc3ZhZGUgKExpbnV4
IGNhbiBzd2l0Y2ggdG8KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHN2YWR1IG9uY2UgdGhl
IFNCSSBGV0ZUIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUpLgo+ID4gPiA+ID4gIlRoZSBwcml2aWxl
Z2UgbGV2ZWwgdG8gd2hpY2ggdGhpcyBkZXZpY2V0cmVlIGhhcyBiZWVuIHByb3ZpZGVkIGNhbiBz
d2l0Y2ggdG8KPiA+ID4gPiA+IFN2YWR1IGlmIHRoZSBTQkkgRldGVCBleHRlbnNpb24gaXMgYXZh
aWxhYmxlIi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiArICAgICAgICAtIGNvbnN0OiBzdmFkdQo+
ID4gPiA+ID4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICBUaGUgc3RhbmRhcmQgU3ZhZHUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIGhh
cmR3YXJlIHVwZGF0aW5nCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICBvZiBQVEUgQS9EIGJpdHMg
YXMgcmF0aWZpZWQgYXQgY29tbWl0IGMxYWJjY2YgKCJNZXJnZSBwdWxsIHJlcXVlc3QKPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICMyNSBmcm9tIHZlZC1yaXZvcy9yYXRpZmllZCIpIG9mIHJpc2N2
LXN2YWR1Lgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICBCb3RoIFN2YWRl
IGFuZCBTdmFkdSBleHRlbnNpb25zIGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4K
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgIHRoZSBQVEUgQS9EIGJpdHMgbmVlZCB0byBiZSBzZXQu
IFRoZSBkZWZhdWx0IGJlaGF2aW9yIGZvciB0aGUgZm91cgo+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgcG9zc2libGUgY29tYmluYXRpb25zIG9mIHRoZXNlIGV4dGVuc2lvbnMgaW4gdGhlIGRldmlj
ZSB0cmVlIGFyZToKPiA+ID4gPiA+IEBBbnVwL0RyZXcvQWxleCwgYXJlIHdlIG1pc3Npbmcgc29t
ZSB3b3JkaW5nIGluIGhlcmUgYWJvdXQgaXQgb25seSBiZWluZwo+ID4gPiA+ID4gdmFsaWQgdG8g
aGF2ZSBTdmFkdSBpbiBpc29sYXRpb24gaWYgdGhlIHByb3ZpZGVyIG9mIHRoZSBkZXZpY2V0cmVl
IGhhcwo+ID4gPiA+ID4gYWN0dWFsbHkgdHVybmVkIG9uIFN2YWR1PyBUaGUgYmluZGluZyBzYXlz
ICJ0aGUgZGVmYXVsdCBiZWhhdmlvdXIiLCBidXQKPiA+ID4gPiA+IGl0IGlzIG5vdCB0aGUgImRl
ZmF1bHQiIGJlaGF2aW91ciwgdGhlIGJlaGF2aW91ciBpcyBhIG11c3QgQUZBSUNULiBJZgo+ID4g
PiA+ID4geW91IHNldCBTdmFkdSBpbiBpc29sYXRpb24sIHlvdSAvbXVzdC8gaGF2ZSB0dXJuZWQg
aXQgb24uIElmIHlvdSBzZXQKPiA+ID4gPiA+IFN2YWR1IGFuZCBTdmFkZSwgeW91IG11c3QgaGF2
ZSBTdmFkdSB0dXJuZWQgb2ZmPwo+ID4gPiA+IFllcywgdGhlIHdvcmRpbmcgc2hvdWxkIGJlIG1v
cmUgb2YgcmVxdWlyZW1lbnQgc3R5bGUgdXNpbmcKPiA+ID4gPiBtdXN0IG9yIG1heS4KPiA+ID4g
PiAKPiA+ID4gPiBIb3cgYWJvdXQgdGhpcyA/Cj4gPiA+ID4gMSkgQm90aCBTdmFkZSBhbmQgU3Zh
ZHUgbm90IHByZXNlbnQgaW4gRFQgPT4gU3VwZXJ2aXNvciBtYXkKPiA+ID4gPiAgICAgICBhc3N1
bWUgU3ZhZGUgdG8gYmUgcHJlc2VudCBhbmQgZW5hYmxlZCBvciBpdCBjYW4gZGlzY292ZXIKPiA+
ID4gPiAgICAgICBiYXNlZCBvbiBtdmVuZG9yaWQsIG1hcmNoaWQsIGFuZCBtaW1waWQuCj4gPiA+
ID4gMikgT25seSBTdmFkZSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUg
U3ZhZGUKPiA+ID4gPiAgICAgICB0byBiZSBhbHdheXMgZW5hYmxlZC4gKE9idmlvdXMpCj4gPiA+
ID4gMykgT25seSBTdmFkdSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUg
U3ZhZHUKPiA+ID4gPiAgICAgICB0byBiZSBhbHdheXMgZW5hYmxlZC4gKE9idmlvdXMpCj4gPiA+
IAo+ID4gPiBJIGFncmVlIHdpdGggYWxsIG9mIHRoYXQsIGJ1dCB0aGUgcHJvYmxlbSBpcyBob3cg
Y2FuIHdlIGd1YXJhbnRlZSB0aGF0Cj4gPiA+IG9wZW5TQkkgYWN0dWFsbHkgZW5hYmxlZCBzdmFk
dT8KPiA+IENvbmZsYXRpb24gb2YgYW4gU0JJIGltcGxlbWVudGF0aW9uIGFuZCBPcGVuU0JJIGFz
aWRlLCBpZiB0aGUgZGV2aWNldHJlZQo+ID4gcHJvcGVydHkgaXMgZGVmaW5lZCB0byBtZWFuIHRo
YXQgInRoZSBzdXBlcnZpc29yIG11c3QgYXNzdW1lIHN2YWR1IHRvIGJlCj4gPiBhbHdheXMgZW5h
YmxlZCIsIHRoZW4gZWl0aGVyIGl0IGlzLCBvciB0aGUgZmlybXdhcmUncyBkZXNjcmlwdGlvbiBv
ZiB0aGUKPiA+IGhhcmR3YXJlIGlzIGJyb2tlbiBhbmQgaXQncyBub3QgdGhlIHN1cGVydmlzb3In
cyBwcm9ibGVtIGFueSBtb3JlLiBJdCdzCj4gPiBub3QgdGhlIGtlcm5lbCdzIGpvYiB0byB2YWxp
ZGF0ZSB0aGF0IHRoZSBkZXZpY2V0cmVlIG1hdGNoZXMgdGhlCj4gPiBoYXJkd2FyZS4KPiA+IAo+
ID4gPiBUaGlzIGlzIG5vdCB0aGUgY2FzZSBmb3Igbm93Lgo+ID4gV2hhdCAiaXMgbm90IHRoZSBj
YXNlIGZvciBub3ciPyBNeSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0LCBhdCB0aGUKPiA+IG1vbWVu
dCwgbm90aGluZyBoYXBwZW5zIHdpdGggU3ZhZHUgaW4gT3BlblNCSS4gSW4gdHVybiwgdGhpcyBt
ZWFucyB0aGF0Cj4gPiB0aGVyZSBzaG91bGQgYmUgbm8gZGV2aWNldHJlZXMgY29udGFpbmluZyBT
dmFkdSAocGVyIHRoaXMgYmluZGluZydzCj4gPiBkZXNjcmlwdGlvbikgYW5kIHRoZXJlZm9yZSBu
byBwcm9ibGVtPwo+IAo+IAo+IFdoYXQgcHJldmVudHMgYSBkdGIgdG8gYmUgcGFzc2VkIHdpdGgg
c3ZhZHUgdG8gYW4gb2xkIHZlcnNpb24gb2Ygb3BlbnNiaQo+IHdoaWNoIGRvZXMgbm90IHN1cHBv
cnQgdGhlIGVuYWJsZW1lbnQgb2Ygc3ZhZHU/IFRoZSBzdmFkdSBleHRlbnNpb24gd2lsbCBlbmQK
PiB1cCBiZWluZyBwcmVzZW50IGluIHRoZSBrZXJuZWwgYnV0IG5vdCBlbmFibGVkIHJpZ2h0Pwo+
CgpJIHVuZGVyc3RhbmQgdGhlIGNvbmNlcm47IG9sZCBTQkkgaW1wbGVtZW50YXRpb25zIHdpbGwg
bGVhdmUgc3ZhZHUgaW4gdGhlCkRUIGJ1dCBub3QgYWN0dWFsbHkgZW5hYmxlIGl0LiBUaGVuLCBz
aW5jZSBzdmFkZSBtYXkgbm90IGJlIGluIHRoZSBEVCBpZgp0aGUgcGxhdGZvcm0gZG9lc24ndCBz
dXBwb3J0IGl0IG9yIGl0IHdhcyBsZWZ0IG91dCBvbiBwdXJwb3NlLCBMaW51eCB3aWxsCm9ubHkg
c2VlIHN2YWR1IGFuZCBnZXQgdW5leHBlY3RlZCBleGNlcHRpb25zLiBUaGlzIGlzIHNvbWV0aGlu
ZyB3ZSBjb3VsZApmb3JjZSBlYXNpbHkgd2l0aCBRRU1VIGFuZCBhbiBTQkkgaW1wbGVtZW50YXRp
b24gd2hpY2ggZG9lc24ndCBkbyBhbnl0aGluZwpmb3Igc3ZhZHUuIEkgaG9wZSB2ZW5kb3JzIG9m
IHJlYWwgcGxhdGZvcm1zLCB3aGljaCB0eXBpY2FsbHkgcHJvdmlkZSB0aGVpcgpvd24gZmlybXdh
cmUgYW5kIERUcywgd291bGQgZ2V0IHRoaXMgcmlnaHQsIHRob3VnaCwgZXNwZWNpYWxseSBzaW5j
ZSBMaW51eApzaG91bGQgZmFpbCBmYXN0IGluIHRoZWlyIHRlc3Rpbmcgd2hlbiB0aGV5IGdldCBp
dCB3cm9uZy4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
