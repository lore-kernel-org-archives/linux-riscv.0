Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DEBC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 07:23:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BECC46520C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 07:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BECC46520C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aaFizTZx4ezUgyUt9lxB/u637xc679Ruf9jpX+y/zYI=; b=JNs6wuBgoRMcSTK3DIW3RLttG
	vs+zCAfs+5d0NtpGerBrcmuwU/cr76aVpRRkX2PvNzOaI111kCgNDILklZwQALhmmJgdRYYammN1H
	sgjuTHQfkvDiGf3L5YDsXDZisTlnIDIbd/dvKyR/vnyI6Gs6+ND8kvJWaSFQTqYnnFUKDRgAkvNka
	jnLa6thTnkRRMoKteFjFLjEzHu6juutNijfHbpcaWPCsTJPWgo5NuksDgvK9LSvME9+ILHZ3aM4W8
	GpYVnsrGNzYkz1CzLNDS78fPPiWC23qPvxUtx51atE/GcCp/76bycdUSnkIiePFWB2NNB3QKf+Oig
	OqVrak3OQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJWiO-003wwm-F0; Tue, 09 Mar 2021 07:23:36 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJWiJ-003wwL-6Y
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 07:23:33 +0000
Received: by mail-qk1-x72b.google.com with SMTP id b130so12051618qkc.10
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 23:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oqO7RxhDDe9vwKp/BB6AgPJShCvp9ZtWoA6Sh+EENcs=;
 b=Ud3PEmS7F/HL1ClBM5fvcc71dFxIGph/JiVvIxFtoAACgUhUdwd3d1JDpZAWyryI4/
 H00WQUh6kjUPafd2ThBYw9ZtS34nshFF5tWtZGNZ1EgBfQTdUN3XYkl7kzREpnyavn71
 TK+awh0xLrq0MfmLyTt1/Y13AGmNR3ZBJ15axGl3gd82rU/QKEwN/OMs+2mvmBscgDVy
 BZeZLu7f0meD98GsZFypmTNkG5/8iycndvsukzJpMwALx2+3+j4rat0gZlbufwYXVt82
 vFlOJutYcZmd4oW9S7VQwWQPDoXikWAturt0OVgGLzb5SQ+c5k0WpbbIHyWni6dbwUGq
 Kaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oqO7RxhDDe9vwKp/BB6AgPJShCvp9ZtWoA6Sh+EENcs=;
 b=b+cadnFCF5TdG2/RUgOaQLPiGlg633EGikug68PsKGb7Lyc3+74vxOAFrAdWIpJ9l4
 4xfTIJv7QTV6FpdsEJSeHPMeIuszdhuyzEgVpUwgkAWSKYQfTsQsDEFYL4PkBI/11Wao
 6UbdhCk+MunMywtFfSyDeTiroSNL1EGDLjT8L1EO7vs7HjdDgzzdqI4Fh02HMPrs1hws
 F9u7ApyfiEPcXugP1YekB0YQ2usbGid/O/4SQ2Gja0oQ8uGXsxoO63N0RYwMogtSb3xF
 4QmIrP294oly5kzNLlNhZw9yueYWg5BBF12VUFhdt2VEGDRqsff3TvlQlvkftfEdvMrj
 guyQ==
X-Gm-Message-State: AOAM531zQLYQoy9qiGwZGXc+nIYvlj34DO6h1WkdhNToBf2SW3y+hGsN
 fwtE6FEK3JUveFDYkcLQQtofHzgRzixac/iG6+nBNQ==
X-Google-Smtp-Source: ABdhPJwtYPYtApR4EueplUtwNsjPnC8GSeKATOROKTHuWvVYiLX1g7t/b1oVki8yJ8MfrVSGPDDRQGIb0ZVn6cn5YHw=
X-Received: by 2002:a37:66cd:: with SMTP id
 a196mr16664749qkc.374.1615274606652; 
 Mon, 08 Mar 2021 23:23:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614681831.git.greentime.hu@sifive.com>
 <e2bd7db9db3c196b9b0399f0655a56939a0f3d62.1614681831.git.greentime.hu@sifive.com>
 <81c45bf40b397b57343f159baae896528fa32d89.camel@pengutronix.de>
In-Reply-To: <81c45bf40b397b57343f159baae896528fa32d89.camel@pengutronix.de>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 9 Mar 2021 15:23:14 +0800
Message-ID: <CAHCEehK3P7jXq-v_xVm-0+BQsugG21VgjU0teyuUgANyR5ErKA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] clk: sifive: Use reset-simple in prci driver for
 PCIe driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com, 
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com, 
 alex.dewar90@gmail.com, khilman@baylibre.com, hayashi.kunihiko@socionext.com, 
 vidyas@nvidia.com, jh80.chung@samsung.com, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_072331_365234_B856B7DD 
X-CRM114-Status: GOOD (  18.18  )
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

UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4g5pa8IDIwMjHlubQz5pyINOaX
pSDpgLHlm5sg5LiL5Y2INzo1OOWvq+mBk++8mgo+Cj4gT24gVHVlLCAyMDIxLTAzLTAyIGF0IDE4
OjU5ICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6Cj4gPiBXZSB1c2UgcmVzZXQtc2ltcGxlIGlu
IHRoaXMgcGF0Y2ggc28gdGhhdCBwY2llIGRyaXZlciBjYW4gdXNlCj4gPiBkZXZtX3Jlc2V0X2Nv
bnRyb2xfZ2V0KCkgdG8gZ2V0IHRoaXMgcmVzZXQgZGF0YSBzdHJ1Y3R1cmUgYW5kIHVzZQo+ID4g
cmVzZXRfY29udHJvbF9kZWFzc2VydCgpIHRvIGRlYXNzZXJ0IHBjaWVfcG93ZXJfdXBfcnN0X24u
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZl
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9LY29uZmlnICAgICAgIHwgIDIg
KysKPiA+ICBkcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2kuYyB8IDE0ICsrKysrKysrKysr
KysrCj4gPiAgZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmggfCAgNCArKysrCj4gPiAg
ZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAgfCAgMyArKy0KPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvc2lmaXZlL0tjb25maWcgYi9kcml2ZXJzL2Nsay9zaWZpdmUvS2NvbmZp
Zwo+ID4gaW5kZXggMWMxNGViMjBjMDY2Li45MTMyYzNjNGFhODYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2Nsay9zaWZpdmUvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9jbGsvc2lmaXZlL0tj
b25maWcKPiA+IEBAIC0xMCw2ICsxMCw4IEBAIGlmIENMS19TSUZJVkUKPiA+Cj4gPiAgY29uZmln
IENMS19TSUZJVkVfUFJDSQo+ID4gICAgICAgYm9vbCAiUFJDSSBkcml2ZXIgZm9yIFNpRml2ZSBT
b0NzIgo+ID4gKyAgICAgc2VsZWN0IFJFU0VUX0NPTlRST0xMRVIKPiA+ICsgICAgIHNlbGVjdCBS
RVNFVF9TSU1QTEUKPiA+ICAgICAgIHNlbGVjdCBDTEtfQU5BTE9HQklUU19XUlBMTF9DTE4yOEhQ
Qwo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBTdXBwb3J0cyB0aGUgUG93ZXIgUmVzZXQgQ2xv
Y2sgaW50ZXJmYWNlIChQUkNJKSBJUCBibG9jayBmb3VuZCBpbgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5jIGIvZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2
ZS1wcmNpLmMKPiA+IGluZGV4IGJhZjczMTNkYWM5Mi4uOTI1YWZmYzZkZTU1IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Y2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5jCj4gPiBAQCAtNTgzLDcgKzU4MywyMSBAQCBzdGF0aWMg
aW50IHNpZml2ZV9wcmNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAg
ICAgICBpZiAoSVNfRVJSKHBkLT52YSkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KHBkLT52YSk7Cj4gPgo+ID4gKyAgICAgcGQtPnJlc2V0LnJjZGV2Lm93bmVyID0gVEhJU19NT0RV
TEU7Cj4gPiArICAgICBwZC0+cmVzZXQucmNkZXYubnJfcmVzZXRzID0gUFJDSV9SU1RfTlI7Cj4g
PiArICAgICBwZC0+cmVzZXQucmNkZXYub3BzID0gJnJlc2V0X3NpbXBsZV9vcHM7Cj4gPiArICAg
ICBwZC0+cmVzZXQucmNkZXYub2Zfbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOwo+ID4gKyAgICAg
cGQtPnJlc2V0LmFjdGl2ZV9sb3cgPSB0cnVlOwo+ID4gKyAgICAgcGQtPnJlc2V0Lm1lbWJhc2Ug
PSBwZC0+dmEgKyBQUkNJX0RFVklDRVNSRVNFVFJFR19PRkZTRVQ7Cj4gPiArICAgICBzcGluX2xv
Y2tfaW5pdCgmcGQtPnJlc2V0LmxvY2spOwo+ID4gKwo+ID4gKyAgICAgciA9IGRldm1fcmVzZXRf
Y29udHJvbGxlcl9yZWdpc3RlcigmcGRldi0+ZGV2LCAmcGQtPnJlc2V0LnJjZGV2KTsKPiA+ICsg
ICAgIGlmIChyKSB7Cj4gPiArICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiY291bGQgbm90IHJl
Z2lzdGVyIHJlc2V0IGNvbnRyb2xsZXI6ICVkXG4iLCByKTsKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIHI7Cj4gPiArICAgICB9Cj4gPiAgICAgICByID0gX19wcmNpX3JlZ2lzdGVyX2Nsb2Nrcyhk
ZXYsIHBkLCBkZXNjKTsKPiA+ICsKPgo+IEFjY2lkZW50YWwgd2hpdGVzcGFjZT8KPgo+IE90aGVy
d2lzZSwKPgo+IFJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPgoKVGhhbmsgeW91LCBQaGlsaXBwLgpZZXMsIGl0IGlzIGFuIGFjY2lkZW50YWwgd2hpdGVz
cGFjZS4gSSdsbCByZW1vdmUgaXQgaW4gbXkgbmV4dCB2ZXJzaW9uIHBhdGNoLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
