Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FBCC7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 01:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiwLVkSmjRHZ7j25QjKzdpdIOAYvKAwGy4e2qMdgJnY=; b=gKil+9fVi9GawB
	uz1anmpJdJW6k2e/sehuglJPbjf+yHxeXthjpbxIu09Mp/9ZZsCJ/wpCO8KdueWw96QY/vfYu1xPp
	AC37J/xFJc+Z0uWlZEpgEVQ6Dd4CjS+ykTfo7H7AAfpu9Tg8yAMrJoCkG3WaP5+mxJHDJtk7lAL+M
	p8Ccfu4F7hoAkAkAOPljM+vwtm8E3dUIQSYpzuJvxYbI4OAre3WU4De9za2fwFYUOAPuZXn2/XJni
	dzW5Hj+2hF/DQRvc71lsK5eIyRgcxURlfr7E8f3R7a5kwyjVhgXRGplKkDvYcjkzbQ1wYGnySGO72
	kWB52ilRiQ1OJKa9QEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0uTy-0051Tj-19;
	Mon, 22 May 2023 01:37:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0uTv-0051TD-1j
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 01:37:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71AFA61902
	for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 01:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589DAC4339C
	for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 01:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684719421;
	bh=lv6wouIBbbs+ZUnfY6iszC49L7vXimaT8vWL2XojXUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FCmviC3wl9npZoyPR9/+xP/t2umpo7tSwAklN5q4WZD+YwBWs4UPFLUyfsOLWs3ye
	 t7oJdiEnEaiCwdkgoKtffidLtwNE/oRIXag03eVnT3JEvnYGJ32WPFszueN+ytzOXA
	 3kBDlLNkEBbjmM00A7bn0PBlrTSSebh0MH49H18d6ac3snWaSngprGiq16L6OWjxRf
	 wMp/bo5dT7sLCjp9Nznq/HrgMzwn0dBLDOPJqbvOdlhSguDnIlnkWD1EmhaRze8cey
	 mI2Ni8rm3V6NBQgTr2rhx0AMX0aUoo97CULhJdOvWTe5ENW7aMfdSu+3QZeeD63lVB
	 1xw2meoBa0JHA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-510b56724caso6048931a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 18:37:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDyO+HtRWdFOy9VliSrDu0Iwo38+6bSQ/Yuck7d158HLO2pQ5N28
	t7xsFL9Voqy0N0Pd7uxfCSEeuEh8ngRWQms7IVk=
X-Google-Smtp-Source: ACHHUZ6CO1iiQGsq6FLHKPtTopDUygqukzZyE+vzpTFrZB3aFb7iQCtAfVLKr/WwESBwjwhnp8zhJbdCNmBWQiBlpY4=
X-Received: by 2002:aa7:c452:0:b0:504:81d4:118d with SMTP id
 n18-20020aa7c452000000b0050481d4118dmr8659697edr.3.1684719419571; Sun, 21 May
 2023 18:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org> <20230507182304.2934-4-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud> <ZFkiotPacIMUghDP@xhacker>
 <20230508-unmoved-unvocal-9a6c5fc0c629@spud> <CAJF2gTSFm32ozEDy_3zvrf05USJ8FxCsaGK-2FbkJQsPUDQXmA@mail.gmail.com>
 <20230521-licorice-follicle-2f83e82f8bce@spud>
In-Reply-To: <20230521-licorice-follicle-2f83e82f8bce@spud>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 22 May 2023 09:36:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTReEW3onRyAXvasX748JuyXJeLU3nQpmQMZRrkS2=ANjg@mail.gmail.com>
Message-ID: <CAJF2gTReEW3onRyAXvasX748JuyXJeLU3nQpmQMZRrkS2=ANjg@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_183703_655571_C0D12E50 
X-CRM114-Status: GOOD (  27.65  )
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

T24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgMTowOOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAyMSwgMjAyMyBhdCAxMTozNzo1OFBNICsw
ODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgOSwgMjAyMyBhdCAxMjo0NOKAr0FN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFR1
ZSwgTWF5IDA5LCAyMDIzIGF0IDEyOjI2OjEwQU0gKzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6
Cj4gPiA+ID4gT24gU3VuLCBNYXkgMDcsIDIwMjMgYXQgMTA6MzU6MTJQTSArMDEwMCwgQ29ub3Ig
RG9vbGV5IHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uLCBNYXkgMDgsIDIwMjMgYXQgMDI6MjM6MDJB
TSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICsgICAg
ICAgICBjOTEwXzA6IGNwdUAwIHsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJ0aGVhZCxjOTEwIiwgInJpc2N2IjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgcmlz
Y3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+ID4gPiA+ID4KPiA+ID4gPiA+IERvZXMgdGhpcyBzdXBw
b3J0IG1vcmUgdGhhbiAicnY2NGltYWZkYyI/Cj4gPiA+ID4gPiBJIGFzc3VtZSB0aGVyZSdzIHNv
bWUgX3h0aGVhZGZvbyBleHRlbnNpb25zIHRoYXQgaXQgZG9lcyBzdXBwb3J0LAo+ID4gPiA+ID4g
YWx0aG91Z2ggSSBhbSBub3Qgc3VyZSBob3cgd2UgYXJlIHByb2NlZWRpbmcgd2l0aCB0aG9zZSAt
IEhlaWtvIG1pZ2h0Cj4gPiA+ID4gPiBoYXZlIGEgbW9yZSBudWFuY2VkIHRha2UuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiArICAgICAgICAgcmVzZXQ6IHJlc2V0LXNhbXBsZSB7Cj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQscmVzZXQtc2FtcGxlIjsKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBXaGF0IGlzIGEgInJlc2V0LXNhbXBsZSI/Cj4gPiA+ID4KPiA+ID4g
PiBUaGlzIG5vZGUgaXMgb25seSBmb3Igb3BlbnNiaS4gVGhlIGNvbXBhdGlibGUgc3RyaW5nIGlz
IGFscmVhZHkgaW4KPiA+ID4gPiBvcGVuc2JpLiBEbyB3ZSBhbHNvIG5lZWQgdG8gYWRkIGR0LWJp
bmRpbmcgZm9yIGl0IGluIGxpbnV4Pwo+ID4gPgo+ID4gPiBJZiBpdCdzIHRvIGJlIGluY2x1ZGVk
IGluIHRoZSBrZXJuZWwncyBkdHMsIHRoZW4geWVzLCB5b3UgZG8gbmVlZCBhCj4gPiA+IGR0LWJp
bmRpbmcuIElmIHlvdSByZW1vdmUgaXQsIHRoZW4geW91IGRvbid0IDopCj4gPiA+Cj4gPiA+IFRo
YXQgc2FpZCwgInRoZWFkLHJlc2V0LXNhbXBsZSIgaXMgYSBzdHJhbmdlbHkgbmFtZWQgY29tcGF0
aWJsZSwgc28gaWYKPiA+ID4geW91IGRvIGtlZXAgaXQgaXQgbWF5IGVuZCB1cCBuZWVkaW5nIGEg
cmVuYW1lIQo+Cj4gPiBIb3cgYWJvdXQgY29tcGF0aWJsZSA9ICJ0aGVhZCxyZXNldC10aDE1MjAi
ID8KPgo+ICJ2ZW5kb3Isc29jLWZ1bmN0aW9uIiBpcyBtb3JlIHR5cGljYWwsIGJ1dCAicmVzZXQi
IGlzIHVzdWFsbHkgdXNlZCBmb3IKPiByZXNldCBjb250cm9sbGVycyBvZiB3aGljaCB0aGlzIGlz
bid0IGFzIGZhciBhcyBJIGNhbiB0ZWxsLgo+IEkgY29tbWVudGVkIG9uIHRoZSB2MiwgaG9waW5n
IHRoYXQgeW91IG1pZ2h0IGFjdHVhbGx5IGtub3cgd2hhdCB0aGUgSVAKPiBibG9jaycgZnVsbC9w
cm9wZXIgbmFtZSBpczoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA1MTgtZHJp
dmluZy1zZWNsdWRpbmctNzkzYjMxOTI3NzZlQHNwdWQvCk9oLCBzb3JyeSwgSSBmb2N1c2VkIG9u
IHM2NGlscDMyIHRoZXNlIGRheXMgYW5kIG1pc3NlZCB0aGF0LiBJIHdvdWxkCnJlcGx5IHRvIHRo
YXQgdGhyZWFkLgoKPgo+IERvIHlvdT8KPgo+IENoZWVycywKPiBDb25vci4KCgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
