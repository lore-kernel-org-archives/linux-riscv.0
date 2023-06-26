Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35338EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 03:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbNxYLYIb8s/ep25LZKCybVh6z8u7ksmX7Qo12AOXuY=; b=tTE1/INbKE0vTt
	+/Np2mxp6sRyZHY6AV+KpQ2W2dxQLveL2mglC6N9F/B7MoNCOwATctE9YI0mar7nueobdHZe8uqqX
	kj445ygQLSSTfR2Y1yjjIgHjK+kDPDSex5QRzOUA09xeVFQ+21ww1IPzJhMK8SUXz2KWZSN7+peUA
	+H5S0IVFGONN1VjjWZU/h4L8TBNR1W1yzuC6cWyE5T6TCQCHfxloIZXRBch8A2GDkip8QBYCI3bux
	ZNPqa33nemv8GHmSjca0Wi47DIsuqIWROvEppQyfWN4VIzYaM1MRiZ7f/PsNItAXVIywT/PGbCxLP
	nKfrZMB0y0oXuA9CwGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcrq-009Ed5-2a;
	Mon, 26 Jun 2023 03:26:18 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcrn-009EcE-1F
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 03:26:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so4755477e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 20:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687749972; x=1690341972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d27TruML66ln41kwNbriVUdepzW6hpF0owzY5DYOBTc=;
        b=nixJQJW/JM6ZhF95VwmPO9q32GpVx4+kO1Jmhh/m7AxWBjPVzuurbPplCHiZUph8mw
         VnRHpeZ3gcLpVRVkfDX06lKeR4XaNhXausla1rXJrdpuGiKqBJfGxv76yyPKOJoEsJyS
         I5OwAaHw+Mq0hOSCYi9hLEEnAyhv7xVwJi0N9wxmDMYvmcoQqRMpLl2Y1JG66sJSMy+q
         T3S4xp4Z+gicg7GlFaO4KbttvqvArCRV8Euj44ijnI7DbobMrWJ/Chn5iX238i19mFAV
         FtmcPTBarugpL9drzBlyxjoj3bpyCgnVGBm0yH/dS5Z0QJ4LKgk+1IZ/oLJSz6E7FYVO
         V2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687749972; x=1690341972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d27TruML66ln41kwNbriVUdepzW6hpF0owzY5DYOBTc=;
        b=HGNMuYI9OR0pqWjMHcY+C+VBjisSiJPnqb2f2Whc1DMIjvfV0Fts5mqgpZ3UV+wvKb
         86f3hUiqJ+nCqO0TJG2sgm2vherlq6u7egNg2PaYBE9WygbFjZlLWQLdyCjLWjZt4mIu
         hCTBIyJ8FzmdfYOhu54gUUzWWQJCgN2EqPkVfDvgcXpxvFLh+Pt3rkOUdVfdvp0Ye0mH
         +hHRYQVffTM5iOSjZ9kHgkhubfNbdmDQPRC37CYf2jBVat0OyCn9o0tMWgA2owOj7UDU
         nqnWf9CBUt5L54nR6uuiRDpHCjvjedUvWiunZl3Zn/mEq+fzFaYpK9P/Z7BmQ6vg/zSI
         JpAg==
X-Gm-Message-State: AC+VfDxrv5zuJvj2miVEYoGMJUP9ggeV9gobPBv80PVxCCjX1xF9qRbE
	t6dp36SZ4qzMsT6f8PXIi37muOjBpFpCyhnrEK9uXg==
X-Google-Smtp-Source: ACHHUZ5VXGFfIfcr1N1JRpfM8xoJIYXrZpWVXnEnMRRfEDsgxdragBOW5kVhTdzGVenAUlCT+DBser0m2zTw3Zexh0g=
X-Received: by 2002:a05:6512:3f18:b0:4eb:46c2:e771 with SMTP id
 y24-20020a0565123f1800b004eb46c2e771mr9802992lfa.14.1687749972447; Sun, 25
 Jun 2023 20:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
In-Reply-To: <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
From: Eric Lin <eric.lin@sifive.com>
Date: Mon, 26 Jun 2023 11:26:00 +0800
Message-ID: <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	maz@kernel.org, chenhuacai@kernel.org, baolu.lu@linux.intel.com, 
	will@kernel.org, kan.liang@linux.intel.com, nnac123@linux.ibm.com, 
	pierre.gondois@arm.com, jgross@suse.com, chao.gao@intel.com, 
	maobibo@loongson.cn, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_202615_510992_15A63C8A 
X-CRM114-Status: GOOD (  23.04  )
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

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgNjo0NeKAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBP
biAxNi8wNi8yMDIzIDA4OjMyLCBFcmljIExpbiB3cm90ZToKPiA+IFRoaXMgYWRkIFlBTUwgRFQg
YmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBTaUZpdmUgUHJpdmF0ZSBMMgo+ID4gY2FjaGUgY29u
dHJvbGxlcgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMgTGluIDxlcmljLmxpbkBzaWZpdmUu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IFJl
dmlld2VkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4v
YmluZGluZ3MvcmlzY3Yvc2lmaXZlLHBMMkNhY2hlMC55YW1sICAgICAgfCA4MSArKysrKysrKysr
KysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKykKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Np
Zml2ZSxwTDJDYWNoZTAueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLHBMMkNhY2hlMC55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NpZml2ZSxwTDJDYWNoZTAueWFtbAo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjVkOGQ0YTM5ZGRl
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3Yvc2lmaXZlLHBMMkNhY2hlMC55YW1sCj4gPiBAQCAtMCwwICsxLDgxIEBACj4g
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+
ID4gKyMgQ29weXJpZ2h0IChDKSAyMDIzIFNpRml2ZSwgSW5jLgo+ID4gKyVZQU1MIDEuMgo+ID4g
Ky0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmlzY3Yvc2lmaXZl
LHBMMkNhY2hlMC55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBTaUZpdmUgUHJpdmF0ZSBMMiBD
YWNoZSBDb250cm9sbGVyCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEdyZWVudGlt
ZSBIdSAgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4gKyAgLSBFcmljIExpbiAgICAgIDxl
cmljLmxpbkBzaWZpdmUuY29tPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOgo+ID4gKyAgVGhlIFNp
Rml2ZSBQcml2YXRlIEwyIENhY2hlIENvbnRyb2xsZXIgaXMgcGVyIGhhcnQgYW5kIGNvbW11bmlj
YXRlcyB3aXRoIGJvdGggdGhlIHVwc3RyZWFtCj4gPiArICBMMSBjYWNoZXMgYW5kIGRvd25zdHJl
YW0gTDMgY2FjaGUgb3IgbWVtb3J5LCBlbmFibGluZyBhIGhpZ2gtcGVyZm9ybWFuY2UgY2FjaGUg
c3Vic3lzdGVtLgo+ID4gKyAgQWxsIHRoZSBwcm9wZXJ0aWVzIGluIGVQQVBSL0RldmljZVRyZWUg
c3BlY2lmaWNhdGlvbiBhcHBsaWVzIGZvciB0aGlzIHBsYXRmb3JtLgo+Cj4gRHJvcCB0aGUgbGFz
dCBzZW50ZW5jZS4gV2h5IHNwZWNpZmljYXRpb24gd291bGQgbm90IGFwcGx5Pwo+Ck9LLCBJJ2xs
IGRyb3AgaXQgaW4gdjIuCgo+ID4gKwo+ID4gK2FsbE9mOgo+ID4gKyAgLSAkcmVmOiAvc2NoZW1h
cy9jYWNoZS1jb250cm9sbGVyLnlhbWwjCj4gPiArCj4gPiArc2VsZWN0Ogo+ID4gKyAgcHJvcGVy
dGllczoKPiA+ICsgICAgY29tcGF0aWJsZToKPiA+ICsgICAgICBjb250YWluczoKPiA+ICsgICAg
ICAgIGVudW06Cj4gPiArICAgICAgICAgIC0gc2lmaXZlLHBMMkNhY2hlMAo+ID4gKyAgICAgICAg
ICAtIHNpZml2ZSxwTDJDYWNoZQo+ID4gKwo+ID4gKyAgcmVxdWlyZWQ6Cj4gPiArICAgIC0gY29t
cGF0aWJsZQo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAg
ICBpdGVtczoKPgo+Cj4gWW91IGhhdmUgb25seSBvbmUgaXRlbSwgc28gbm8gbmVlZCBmb3IgaXRl
bXMuLi4gdW5sZXNzIHlvdSBqdXN0IG1pc3NlZAo+IHByb3BlciBmYWxsYmFjay4KCk9LLCBJJ2xs
IGZpeCBpdCBpbiB2Mi4KCj4KPiA+ICsgICAgICAtIGVudW06Cj4gPiArICAgICAgICAgIC0gc2lm
aXZlLHBMMkNhY2hlMAo+ID4gKyAgICAgICAgICAtIHNpZml2ZSxwTDJDYWNoZTEKPgo+IFdoYXQg
aXMgIjAiIGFuZCAiMSIgaGVyZT8gV2hhdCBkbyB0aGVzZSBjb21wYXRpYmxlcyByZXByZXNlbnQ/
IFdoeSB0aGV5Cj4gZG8gbm90IGhhdmUgYW55IFNvQyByZWxhdGVkIHBhcnQ/CgpUaGUgcEwyQ2Fj
aGUxIGhhcyBtaW5vciBjaGFuZ2VzIGluIGhhcmR3YXJlLCBidXQgaXQgY2FuIHVzZSB0aGUgc2Ft
ZQpwbDIgY2FjaGUgZHJpdmVyLgpNYXkgSSBhc2ssIHdoYXQgZG8geW91IG1lYW4gYWJvdXQgdGhl
IFNvQy1yZWxhdGVkIHBhcnQ/IFRoYW5rcy4KCj4KPiA+ICsKPiA+ICsgIGNhY2hlLWJsb2NrLXNp
emU6Cj4gPiArICAgIGNvbnN0OiA2NAo+ID4gKwo+ID4gKyAgY2FjaGUtbGV2ZWw6Cj4gPiArICAg
IGNvbnN0OiAyCj4gPiArCj4gPiArICBjYWNoZS1zZXRzOgo+ID4gKyAgICBjb25zdDogNTEyCj4g
PiArCj4gPiArICBjYWNoZS1zaXplOgo+ID4gKyAgICBjb25zdDogMjYyMTQ0Cj4KPiBBcmUgeW91
IHN1cmU/IFNvIGFsbCBwcml2YXRlIEwyIGNhY2hlIGNvbnRyb2xsZXJzIHdpbGwgaGF2ZSBmaXhl
ZCBzaXplCj4gb2YgY2FjaGU/CgpUaGUgcHJpdmF0ZSBMMiBjYWNoZSBjb250cm9sbGVycyB3aWxs
IGhhdmUgZGlmZmVyZW50IHNpemVzLgpPSywgSSdsbCBmaXggaW4gdjIuCgo+Cj4gPiArCj4gPiAr
ICBjYWNoZS11bmlmaWVkOiB0cnVlCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1z
OiAxCj4gPiArCj4gPiArICBuZXh0LWxldmVsLWNhY2hlOiB0cnVlCj4gPiArCj4gPiArYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4KPiByZXF1aXJlZDog
Z29lcyBiZWZvcmUgYWRkaXRpb25hbFByb3BlcnRpZXM6Lgo+Ck9LLCBJJ2xsIGZpeCBpdCBpbiB2
Mi4KVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKQmVzdCBSZWdhcmRzLApFcmljIExpbi4KPgo+IEJl
c3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
