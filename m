Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0460EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 03:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XR79NGpAR/xG2hpB8SUqwNoOJRU3IxP0+0J5LvUyWi4=; b=e4VrisDzAfgO9F
	iwQFfU2x9jN+vj+S2HoshvAe3xfopCH9nURsh4IBdr6+vSqKv4zdybi1MsGkOysOkGkIy/u2PqsK5
	fBAdzbmnP+5RqSxoznR2jpqYuK+gp7N4MyWWuNYiEES6Wl2wvgKWj94shLh2zz8goDO+soPFO6dWc
	qXVF8C5eV/VRy5TUCqQcAgiHFTyiuYBfagbEWZF2cN1XXaZPijZz/fljm4+VS36frwFtl549qVhCa
	sSapoJwmgYHLwlu4UVdYjF/rm+nNMrslCI51VwKjxRvehVBez3QpYlAx/twpPt31yzkOYXSU3xSLa
	y/xQY3eqFf2DUO5IuVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o61Wq-003xJ0-Ef; Tue, 28 Jun 2022 03:04:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o61Wn-003xIU-Vr
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 03:04:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80B81B819B6
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 03:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF019C341D1
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 03:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656385474;
	bh=Dr3/Y/ZEFbz5YUD1O4lFuoAblnOIw2GNM9YjX37GVH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R0ErmPALbkmJwBeVFyS4uRUSDdonftuKGiu/OsMcHbWNRZtqKfZ9pK7eRL8ew+ih9
	 nfc0yHRKBRZdGGxXs8V3gfI7Qjt0wvSahFOx+O0msj5o5L+N+1m/hLOzIlRh+AjRtB
	 nP2Rkx9roqAvNn6R13svRPBDYcSKA2FzvKiHGg99GRehV2MhiZeCjJTIR0cG3nXD4U
	 tgki4uId0RC74c201aGQOQD8diLMtA+XggQVwAttyqEfCsW3OS4R1VIWRNDgysC8DU
	 YlXRbC8Sw5dnMVZ8jxhGVzUmp/75Nsb2dWJ4yBzp0YcAn40RjEZ22wLcCMYlo1HQhy
	 6qVEQIKZKbTKQ==
Received: by mail-vs1-f43.google.com with SMTP id z66so10789890vsb.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 20:04:34 -0700 (PDT)
X-Gm-Message-State: AJIora+yHhz5pHJ9wY7poj4O5VPvrptnYUiflVbbT47LyMJd/pf2QD0u
	LylaYUQwQA4gnrXkaNDOBD5CpX1s7dUIwmgCL5E=
X-Google-Smtp-Source: AGRyM1sASgqSd1n8b23qRP+ZhK+QUT6xztdltgnao0HzRVoKiGz7MfrQ2B57jUIY44E4lHuWRgyB3F8u57cQJWE342A=
X-Received: by 2002:a05:6102:366f:b0:356:352f:9de2 with SMTP id
 bg15-20020a056102366f00b00356352f9de2mr959975vsb.2.1656385473552; Mon, 27 Jun
 2022 20:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220627051257.38543-1-samuel@sholland.org> <20220627051257.38543-2-samuel@sholland.org>
 <CAJF2gTSq1NsBWRCg+kpTbJRwSeE30P9NVB5di6vzi7m2CFRzHw@mail.gmail.com> <ab5b4722-8219-ab1c-e9d8-2c00e52040da@sholland.org>
In-Reply-To: <ab5b4722-8219-ab1c-e9d8-2c00e52040da@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 28 Jun 2022 11:04:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR5Zb4TZbomVLbJdHG=JYrM9UkS4hxGeShXu0eu+SqpjQ@mail.gmail.com>
Message-ID: <CAJF2gTR5Zb4TZbomVLbJdHG=JYrM9UkS4hxGeShXu0eu+SqpjQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: interrupt-controller: Require trigger
 type for T-HEAD PLIC
To: Samuel Holland <samuel@sholland.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Marc Zyngier <maz@kernel.org>, 
	Sagar Kadam <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_200438_347119_027F3F9B 
X-CRM114-Status: GOOD (  28.75  )
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

T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMTA6MTQgUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBz
aG9sbGFuZC5vcmc+IHdyb3RlOgo+Cj4gT24gNi8yNy8yMiAyOjQwIEFNLCBHdW8gUmVuIHdyb3Rl
Ogo+ID4gT24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMToxMyBQTSBTYW11ZWwgSG9sbGFuZCA8c2Ft
dWVsQHNob2xsYW5kLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBUaGUgUklTQy1WIFBMSUMgc3BlY2lm
aWNhdGlvbiB1bmZvcnR1bmF0ZWx5IGFsbG93cyBQTElDIGltcGxlbWVudGF0aW9ucwo+ID4+IHRv
IGlnbm9yZSBlZGdlcyBzZWVuIHdoaWxlIGFuIGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdCBpcyBi
ZWluZyBoYW5kbGVkOgo+ID4+Cj4gPj4gICBEZXBlbmRpbmcgb24gdGhlIGRlc2lnbiBvZiB0aGUg
ZGV2aWNlIGFuZCB0aGUgaW50ZXJydXB0IGhhbmRsZXIsCj4gPj4gICBpbiBiZXR3ZWVuIHNlbmRp
bmcgYW4gaW50ZXJydXB0IHJlcXVlc3QgYW5kIHJlY2VpdmluZyBub3RpY2Ugb2YgaXRzCj4gPj4g
ICBoYW5kbGVy4oCZcyBjb21wbGV0aW9uLCB0aGUgZ2F0ZXdheSBtaWdodCBlaXRoZXIgaWdub3Jl
IGFkZGl0aW9uYWwKPiA+PiAgIG1hdGNoaW5nIGVkZ2VzIG9yIGluY3JlbWVudCBhIGNvdW50ZXIg
b2YgcGVuZGluZyBpbnRlcnJ1cHRzLgo+ID4+Cj4gPj4gRm9yIFBMSUNzIHdpdGggdGhhdCBtaXNm
ZWF0dXJlLCBzb2Z0d2FyZSBuZWVkcyB0byBrbm93IHRoZSB0cmlnZ2VyIHR5cGUKPiA+PiBvZiBl
YWNoIGludGVycnVwdC4gVGhpcyBhbGxvd3MgaXQgdG8gd29yayBhcm91bmQgdGhlIGlzc3VlIGJ5
IGNvbXBsZXRpbmcKPiA+PiBlZGdlLXRyaWdnZXJlZCBpbnRlcnJ1cHRzIGJlZm9yZSBoYW5kbGlu
ZyB0aGVtLiBTdWNoIGEgd29ya2Fyb3VuZCBpcwo+ID4+IHJlcXVpcmVkIHRvIGF2b2lkIG1pc3Np
bmcgYW55IGVkZ2VzLgo+ID4+Cj4gPj4gVGhlIFQtSEVBRCBDOXh4IFBMSUMgaXMgYW4gZXhhbXBs
ZSBvZiBhIFBMSUMgd2l0aCB0aGlzIGJlaGF2aW9yLgo+ID4gQWN0dWFsbHksIEM5eHggc3VwcG9y
dCBwdWxzZSBzaWduYWxzIHdoaWNoIGNvbmZpZ2VkIGJ5Cj4gPiBwYWRfcGxpY19pbnRfY2ZnX3gg
Zm9yIFNvQyB2ZW5kb3I6Cj4gPgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29w
ZW5jOTA2L2Jsb2IvbWFpbi9DOTA2X1JUTF9GQUNUT1JZL2dlbl9ydGwvcGxpYy9ydGwvcGxpY19p
bnRfa2lkLnYKPiA+IDEwNDogYXNzaWduIGludF9uZXdfcGVuZGluZyA9IHBhZF9wbGljX2ludF9j
ZmdfeCA/IGludF9wdWxzZQo+ID4gMTA1Ogo+ID4gICAgICAgICA6IGxldmVsX2ludF9wZW5kaW5n
Owo+ID4KPiA+IFRoZXkgY291bGQgcHV0IHBhZF9wbGljX2ludF9jZmdfeCBpbnRvIHRoZSBTb0Mg
c29mdHdhcmUgY29uZmlnCj4gPiByZWdpc3RlcnMgcmVnaW9uIG9yIGJpbmQgdGhlbSB0byBjb25z
dGFudCB2YWx1ZXMuCj4KPiBUaGUgaXNzdWUgaGVyZSBpcyB0aGUgIiFpbnRfYWN0aXZlIiBjb25k
aXRpb24gZm9yIGludF9uZXdfc2V0X3BlbmRpbmcsCj4gcmVnYXJkbGVzcyBvZiB0aGF0IGNvbmZp
Z3VyYXRpb24gaW5wdXQuCj4KPiBGb3IgaW50ZXJydXB0IHNvdXJjZXMgdGhhdCBzZW5kIHB1bHNl
cywgdGhvc2UgcHVsc2VzIHdpbGwgYmUgbG9zdCBpZiB0aGV5IGFyZQo+IHJlY2VpdmVkIHdoaWxl
IGludF9hY3RpdmUgaXMgdHJ1ZS4gU28gdGhlIGRyaXZlciBoYXMgdG8gbWFrZSBzdXJlIGludF9h
Y3RpdmUgaXMKPiBmYWxzZSBfYmVmb3JlXyBzZXJ2aWNpbmcgYW4gaW50ZXJydXB0LCBvciBpdCBt
YXkgbWlzcyB0aGUgbmV4dCBvbmUuIFRoaXMgbWVhbnMKPiB0aGUgZHJpdmVyIG5lZWRzIHRvIGtu
b3cgd2hpY2ggaW50ZXJydXB0IF9zb3VyY2VzXyBzZW5kIHB1bHNlcyBhbmQgd2hpY2ggb25lcwo+
IGFzc2VydCBsZXZlbHMuCllvdSBhcmUgcmlnaHQsIGluIHBsdXMgbW9kZSwgd2UgY2FuJ3QgcmVj
ZWl2ZSBhbnkgaW50ZXJydXB0IGJldHdlZW4KY2xhaW0gJiBjb21wbGV0ZSwgdGhlbiB0aGUgaXJx
IGNvdWxkIGJlIGxvc3QuCgpJIHRoaW5rIHRoZSBkZXNpZ24gZm9sbG93cyB0aGUgc2VudGVuY2Ug
d3JpdHRlbiBieSBQTElDIHNwZWM6Cmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1wbGlj
LXNwZWMvYmxvYi9tYXN0ZXIvcmlzY3YtcGxpYy5hZG9jCgpJZiB0aGUgZ2xvYmFsIGludGVycnVw
dCBzb3VyY2Ugd2FzIGVkZ2UtdHJpZ2dlcmVkLCB0aGUgZ2F0ZXdheSB3aWxsCmNvbnZlcnQgdGhl
IO+sgXJzdCBtYXRjaGluZyBzaWduYWwgZWRnZSBpbnRvIGFuIGludGVycnVwdCByZXF1ZXN0LgpE
ZXBlbmRpbmcgb24gdGhlIGRlc2lnbiBvZiB0aGUgZGV2aWNlIGFuZCB0aGUgaW50ZXJydXB0IGhh
bmRsZXIsIGluCmJldHdlZW4gc2VuZGluZyBhbiBpbnRlcnJ1cHQgcmVxdWVzdCBhbmQgcmVjZWl2
aW5nIG5vdGljZSBvZiBpdHMKaGFuZGxlcuKAmXMgY29tcGxldGlvbiwgdGhlIGdhdGV3YXkgbWln
aHQgZWl0aGVyICoqaWdub3JlIGFkZGl0aW9uYWwKbWF0Y2hpbmcgZWRnZXMqKiBvciBpbmNyZW1l
bnQgYSBjb3VudGVyIG9mIHBlbmRpbmcgaW50ZXJydXB0cy4KCkFsc28sIHRoZSBoYXJkd2FyZSBj
b3VsZCBlYXNpbHkgc3VwcG9ydCB0aGUgZmVhdHVyZSwgYnV0IHRoZSBlbmdpbmVlcgpmb2xsb3dz
IHRoZSBmaXJzdCBjaG9pY2UgYW5kIGRpc2FibGUgdGhlIHVzZWZ1bCBmdW5jdGlvbi4gLV8qIQoK
Pgo+IEZvciBsZXZlbCBpbnRlcnJ1cHRzLCBwYWRfcGxpY19pbnRfY2ZnX3ggaGFkIGJldHRlciBi
ZSAwLCBidXQgdGhhdCBpcyBhCj4gaGFyZHdhcmUvZmlybXdhcmUgY29uZmlndXJhdGlvbiBjb25j
ZXJuLiBUaGUgZHJpdmVyIHNob3VsZCBub3QgaGF2ZSB0byBjYXJlCj4gYWJvdXQgdGhhdC4KPgo+
IChPbiB0aGUgQWxsd2lubmVyIEQxLCB0aG9zZSBpbnB1dHMgYXJlIG1lbW9yeSBtYXBwZWQsIHdo
aWNoIHdhcyB0aGUgcmVhc29uIGZvcgo+IHRoZSBzdGFja2VkIGludGVycnVwdCBjb250cm9sbGVy
IG1lbnRpb25lZCBpbiBteSBvdGhlciByZXBseS4gQnV0IHdoaWxlCj4gcGFkX3BsaWNfaW50X2Nm
Z194ID09IDEgb25seSB3b3JrcyB3aXRoIGVkZ2UgaW50ZXJydXB0cywgdGhlIHBhZF9wbGljX2lu
dF9jZmdfeAo+ID09IDAgY2hvaWNlIHdvcmtzIHdpdGggZWl0aGVyIGtpbmQgb2YgaW50ZXJydXB0
IHNvdXJjZSwgc28gdGhlIHN0YWNrZWQgZHJpdmVyIGlzCj4gbm90IHJlYWxseSBuZWVkZWQuKQo+
Cj4gUmVnYXJkcywKPiBTYW11ZWwKLS0KQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
