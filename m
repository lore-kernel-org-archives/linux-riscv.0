Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C76C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRCSh3iENDkwD3wT7hA1iyhYAWlr2lXNH9QMQMb6FYs=; b=ioSPnEmVKS4pha
	6d6rHKJwxKnGDvYmxDMQRNzia4R0CAQCgd68ojm2uKcV2LS4hnDeeolafV9e68qJjXT3euBi5s7W5
	SAmZZ8ANCot2tGKsBwYUBbbS1N+erFUvx2uZHuEGeQnHxgkBEomiWTUOh4PPcaRbJ6c70DjctY6ev
	ttAFh7Zx4wKrsFTKC2qHshhrcuRY/zo4XWYVGcXMD1n0rK1NPw4LKiWLsd6lH0I8vvXq4FrwDe40n
	4su3mz/oSS1PpR83uYsy5irmmh73dXsFZBgrCYUlPkAfsmugRm7xFUIkgv1mjBV2PXaMWBTl2m1WT
	s3VGMj/M/tEvYoGWoZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZlBP-003Qi1-LP; Wed, 08 Mar 2023 04:13:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZlBF-003Qfe-1w; Wed, 08 Mar 2023 04:13:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BB4F1B81BBD;
	Wed,  8 Mar 2023 04:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CA9C433B4;
	Wed,  8 Mar 2023 04:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678248809;
	bh=KZvivIcdP43nYQjxQV2iwy3EY21Hd7biSu6JBWcNfhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qwpkfQ9VnecJvrGDoPULM/UgWFCDiFizZR9bwOGtGDBHVcPfmKoGcKdlIPO9ML2A4
	 7Hoq1/OwuH5ZeKgVG0mk7tWzc15Jks/nMeMCDoc8qnnG1n3n2EbMbRr3ITnC5kGJZ+
	 doklXfgvNCatWziSkJnkLWMgzpH/UIqYn09mHlzvMkHPZPER8YQRGmvHyLKq3kA/EV
	 ba1NYZ0jLVjH2rSj2i8COtMWqsU2/947TxQhR6HNrwOfZ6czJ+zzVuxbVJ6r8lTVft
	 wJFNmD9hOP40zKm8aUBXFOR6VCyFF9ZfyyeZPLLOXaMLmoV9f0Xw7UZQ2EhYR9yJ8E
	 F6UDj4NBFKYsw==
Received: by mail-ed1-f48.google.com with SMTP id x3so60706818edb.10;
        Tue, 07 Mar 2023 20:13:28 -0800 (PST)
X-Gm-Message-State: AO0yUKX+jmjeGxRFmoQ1351jrvT63RVeNKAx3YT+jn3ZV4XxgcHENBFJ
	QcTz0m7UfRmQI50NfS+OY+T98QJ9fzXAZHtgbXA=
X-Google-Smtp-Source: AK7set/OXHamMd30xa9MOxiTaztHdq2/uUI5fxgIghiVMrlHV5++je5CqfJuFdwe8KixFa9DHTv2yqkrJAn+QxpPD+o=
X-Received: by 2002:a50:9b53:0:b0:4ae:f648:950b with SMTP id
 a19-20020a509b53000000b004aef648950bmr9192549edj.7.1678248807011; Tue, 07 Mar
 2023 20:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20221231235541.13568-1-samuel@sholland.org>
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 8 Mar 2023 12:13:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTgV=xTq-vqf4KHcpcRndp1=o74NebvAVfpC8CMRv8qWA@mail.gmail.com>
Message-ID: <CAJF2gTTgV=xTq-vqf4KHcpcRndp1=o74NebvAVfpC8CMRv8qWA@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 0/5] leds: Allwinner A100 LED controller support
To: Samuel Holland <samuel@sholland.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Heiko Stuebner <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_201333_428983_FB4874D5 
X-CRM114-Status: GOOD (  26.44  )
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

VGh4IFNhbXVlbCwKCk9uIFN1biwgSmFuIDEsIDIwMjMgYXQgNzo1NeKAr0FNIFNhbXVlbCBIb2xs
YW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPiB3cm90ZToKPgo+IFtSZXNlbmRpbmcgYmVjYXVzZSBp
dCBoYXMgYmVlbiBhIGNvdXBsZSBvZiBtb250aHMgc2luY2Ugdjcgd2l0aCBubyBMRUQKPiBtYWlu
dGFpbmVyIGZlZWRiYWNrLCBhbmQgTEVEcyBub3cgaGF2ZSBhbiBhZGRpdGlvbmFsIG1haW50YWlu
ZXIuXQo+Cj4gVGhpcyBzZXJpZXMgYWRkcyBiaW5kaW5ncyBhbmQgYSBkcml2ZXIgZm9yIHRoZSBS
R0IgTEVEIGNvbnRyb2xsZXIgZm91bmQKPiBpbiBzb21lIEFsbHdpbm5lciBTb0NzLCBzdGFydGlu
ZyB3aXRoIEExMDAuIFRoZSBoYXJkd2FyZSBpbiB0aGUgUjMyOSBhbmQKPiBEMSBTb0NzIGFwcGVh
cnMgdG8gYmUgaWRlbnRpY2FsLgo+Cj4gUGF0Y2hlcyA0LTUgZGVwZW5kIG9uIHRoZSBEMSBkZXZp
Y2V0cmVlIHNlcmllc1sxXSwgYnV0IHRoZSByZXN0IG9mIHRoaXMKPiBzZXJpZXMgY2FuL3Nob3Vs
ZCBiZSBtZXJnZWQgd2l0aG91dCB0aGVtLgo+Cj4gVGhpcyBkcml2ZXIgd2FzIHRlc3RlZCBvbiB0
aGUgRDEgTmV6aGEgYm9hcmQuCj4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMjEyMzEyMzM4NTEuMjQ5MjMtMS1zYW11ZWxAc2hvbGxhbmQub3JnLwo+Cj4gQ2hhbmdlcyBp
biB2NzoKPiAgLSBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTCj4KPiBDaGFuZ2VzIGluIHY2
Ogo+ICAtIERyb3AgdGhlIEExMDAgRE1BIGNvbnRyb2xsZXIgRFQgbm9kZSBwYXRjaCwgd2hpY2gg
d2FzIG1lcmdlZCB2aWEgYQo+ICAgIGRpZmZlcmVudCBzZXJpZXMKPgo+IENoYW5nZXMgaW4gdjU6
Cj4gIC0gQTEwMCBjb250YWlucyB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24sIHNvIHVzZSB0
aGF0IGFzIHRoZSBiYXNlCj4gICAgY29tcGF0aWJsZSBzdHJpbmcsIGFuZCByZW5hbWUgdGhlIGJp
bmRpbmcgdG8gbWF0Y2gKPiAgLSBBZGQgInVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UiIHRv
IHRoZSBjaGlsZCBtdWx0aS1sZWQgYmluZGluZwo+ICAtIFJlbmFtZSB0aGUgZHJpdmVyIFIzMjkg
LT4gQTEwMCwgc2luY2UgdGhhdCBpcyB0aGUgYWN0dWFsIG9yaWdpbmFsCj4gICAgaW1wbGVtZW50
YXRpb24KPgo+IENoYW5nZXMgaW4gdjQ6Cj4gIC0gVXNlICJkZWZhdWx0IiBpbnN0ZWFkIG9mICJt
YXhJdGVtcyIgZm9yIHRpbWluZyBwcm9wZXJ0aWVzCj4gIC0gRGVwZW5kIG9uIExFRFNfQ0xBU1Nf
TVVMVElDT0xPUgo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAgLSBSZW1vdmVkIHF1b3RlcyBmcm9tIGVu
dW1lcmF0aW9uIHZhbHVlcwo+ICAtIEFkZGVkIHZlbmRvciBwcmVmaXggdG8gdGltaW5nL2Zvcm1h
dCBwcm9wZXJ0aWVzCj4gIC0gUmVuYW1lZCAiZm9ybWF0IiBwcm9wZXJ0eSB0byAicGl4ZWwtZm9y
bWF0IiBmb3IgY2xhcml0eQo+ICAtIERyb3BwZWQgInZsZWQtc3VwcGx5IiBhcyBpdCBpcyB1bnJl
bGF0ZWQgdG8gdGhlIGNvbnRyb2xsZXIgaGFyZHdhcmUKPiAgLSBBZGRlZCB2ZW5kb3IgcHJlZml4
IHRvIHRpbWluZy9mb3JtYXQgcHJvcGVydGllcwo+ICAtIFJlbmFtZWQgImZvcm1hdCIgcHJvcGVy
dHkgdG8gInBpeGVsLWZvcm1hdCIgZm9yIGNsYXJpdHkKPiAgLSBEcm9wcGVkICJ2bGVkLXN1cHBs
eSIgYXMgaXQgaXMgdW5yZWxhdGVkIHRvIHRoZSBjb250cm9sbGVyIGhhcmR3YXJlCj4gIC0gQ2hh
bmdlZCAid3JpdGVzbCIgdG8gImlvd3JpdGUzMl9yZXAiIHNvIHRoZSBkcml2ZXIgYnVpbGRzIG9u
IGhwcGEKPgo+IENoYW5nZXMgaW4gdjI6Cj4gIC0gRml4ZWQgdHlwbyBsZWFkaW5nIHRvIGR1cGxp
Y2F0ZSB0MWgtbnMgcHJvcGVydHkKPiAgLSBSZW1vdmVkICJpdGVtcyIgbGF5ZXIgaW4gZGVmaW5p
dGlvbiBvZiBkbWFzL2RtYS1uYW1lcwo+ICAtIFJlcGxhY2VkIHVpbnQzMiB0eXBlIHJlZmVyZW5j
ZSB3aXRoIG1heEl0ZW1zIGluIHRpbWluZyBwcm9wZXJ0aWVzCj4gIC0gUmVuYW1lZCBmcm9tIHN1
bnhpLWxlZGMgdG8gc3VuNTBpLXIzMjktbGVkYwo+ICAtIEFkZGVkIG1pc3NpbmcgInN0YXRpYyIg
dG8gZnVuY3Rpb25zL2dsb2JhbHMgYXMgcmVwb3J0ZWQgYnkgMGRheSBib3QKPgo+IFNhbXVlbCBI
b2xsYW5kICg1KToKPiAgIGR0LWJpbmRpbmdzOiBsZWRzOiBBZGQgQWxsd2lubmVyIEExMDAgTEVE
IGNvbnRyb2xsZXIKPiAgIGxlZHM6IHN1bjUwaS1hMTAwOiBOZXcgZHJpdmVyIGZvciB0aGUgQTEw
MCBMRUQgY29udHJvbGxlcgo+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBhMTAwOiBBZGQgTEVE
IGNvbnRyb2xsZXIgbm9kZQo+ICAgcmlzY3Y6IGR0czogYWxsd2lubmVyOiBkMTogQWRkIExFRCBj
b250cm9sbGVyIG5vZGUKPiAgIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjogZDE6IEFkZCBSR0IgTEVE
cyB0byBib2FyZHMKPgo+ICAuLi4vbGVkcy9hbGx3aW5uZXIsc3VuNTBpLWExMDAtbGVkYy55YW1s
ICAgICAgfCAxMzkgKysrKysKPiAgLi4uL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGkt
YTEwMC5kdHNpIHwgIDE0ICsKPiAgLi4uL2FsbHdpbm5lci9zdW4yMGktZDEtbGljaGVlLXJ2LWRv
Y2suZHRzICAgIHwgIDEyICsKPiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEtbmV6
aGEuZHRzICAgIHwgIDEzICsKPiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBp
LWQxLmR0c2kgIHwgICA2ICsKPiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDEx
My5kdHNpICAgIHwgIDE1ICsKPiAgZHJpdmVycy9sZWRzL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA5ICsKPiAgZHJpdmVycy9sZWRzL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9sZWRzL2xlZHMtc3VuNTBpLWExMDAuYyAgICAg
ICAgICAgICAgIHwgNTU1ICsrKysrKysrKysrKysrKysrKwo+ICA5IGZpbGVzIGNoYW5nZWQsIDc2
NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbGVkcy9hbGx3aW5uZXIsc3VuNTBpLWExMDAtbGVkYy55YW1sCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2xlZHMvbGVkcy1zdW41MGktYTEwMC5jCkFja2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4KPiAtLQo+IDIuMzcuNAo+CgoKLS0gCkJl
c3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
