Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEDAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 01:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtL0b08NpcSyjQhDR/+BWtJdXqtlVZxHpAsrnwO+F54=; b=Ff3qnXsdX7srbC
	mEJoejvATb9XoMKt4vk0X0TU5I2t2TRZ3Ku8Mv8qs8TaJCOCqXOc5avAtMiiAYKdn40eUzpifjDD0
	Ed1W1AsFz4JMSBuoAQdsvhnzZDMa+E9xUQYrnzz5TcKXLOUpG+KVRoAo9k8n04otxd+D2oP1cetbP
	VcwuGs+iePk+HY+an4IMIdn5+aRQVeNkzG58EpyMxck5Crd+J/50aPvGWFUYMaOk5wfeYJJI+rUxy
	tHAOW3AXiAmdzkM5iFleKSk/OtZ1/6nmQBS1e9GIcjcHth0KlFhbBFGWOvTE/FvCD5XEzQc1o9PBM
	OgANpIR+UpeTN3xz0BXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msEJw-007FDr-3R; Wed, 01 Dec 2021 01:22:04 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msEJs-007FDF-QQ
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 01:22:02 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id f9so58316510ybq.10
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 17:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S286PR0DOlhKjJpIypbhz5PFRsYUTAsr8Ii0YLKt+/8=;
 b=UuJWQaahTTK6KJGehNSnehKrgl4QgxwPTGSm2AeOkOWBq2igthUifPJNo7KL7t9VGp
 Qsz5W6jvXfhhOn1aVSn5wqWM/xEzfWuOkrVJID2Hik+MHSP9NgtgNveL6GDsRUUcUNRj
 9vQ/GN/8IPYpj10AzBIpZ/JjOFkbzU4CrSCu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S286PR0DOlhKjJpIypbhz5PFRsYUTAsr8Ii0YLKt+/8=;
 b=XD3JolcwlvIDRne5Chl5BQFRqwzUGZrCk1WZS3ga1qWV4/kWfkJm2hd4jpVD9BNX28
 STiunTLXohS+uaAj6c4YAGIfxkodA39r5S0WVdvOS4HPJLNsrbkxoooW9kv3sybkww6g
 p+InnHncdAO81/16MtGQTQ2gByShBTr97ZFLkTuKlYb1R37o58pJIZf/ExdhUeJlRAbo
 28bAMoLwLgGCODuZrC8X5PY8rxUEbCysWeKMdjJjnDJTrVuew5sOkgO3mAFjaV7vgl98
 PDBUO/fTEiSRgmMFLzIdVSPqTdsGSl4meyQNrcWzeiC1WNVibDd6OLIjKFkpqhgZBDsm
 9WeA==
X-Gm-Message-State: AOAM533xueLilbuWsSycJYretUOP6x/rQ+dYwVnS8o9jwzz8lEAppbjL
 oMjofOPXyc/xQpsoa2b+zdeMzXRRwm7pMCRPYbOB
X-Google-Smtp-Source: ABdhPJw+00AP89gQplxYPhQDfHcmpRwigzGF+ndaHqbza4cDl274n4eYzpSs5hGU2eSVkLKT8NhCL5rUVD9L5lykoNI=
X-Received: by 2002:a25:bbc4:: with SMTP id c4mr3229673ybk.309.1638321717694; 
 Tue, 30 Nov 2021 17:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20211129014007.286478-1-wefu@redhat.com>
 <1909580.k68io2XIxi@diego>
 <D7F256F9-F31F-4663-AADD-A535E159F87C@jrtc27.com> <2728314.U2HhIfhhqV@diego>
 <C19C85E6-821B-4A87-B764-56CF4D53E7FA@jrtc27.com>
 <CAAeLtUC0Qc6ysf31sh0dkvfJD-JsREZbyFFk=Ko0vQeBRzyjaw@mail.gmail.com>
 <03B8F784-4AF3-425D-99B6-F753F7970273@jrtc27.com>
In-Reply-To: <03B8F784-4AF3-425D-99B6-F753F7970273@jrtc27.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 30 Nov 2021 17:21:46 -0800
Message-ID: <CAOnJCUKmP6dsrV9xWC52uEaM0=fZh-FNDYyFg1VxQybpQZABMA@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Wei Fu <wefu@redhat.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>,
 Gordan Markus <gordan.markus@canonical.com>, 
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Dan Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh+dt@kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 atishp04@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 Wei Wu <lazyparser@gmail.com>, Drew Fustini <drew@beagleboard.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_172200_970225_6CF10ECF 
X-CRM114-Status: GOOD (  37.45  )
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

T24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgODoxMyBBTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpy
dGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMzAgTm92IDIwMjEsIGF0IDE1OjAxLCBQaGlsaXBwIFRv
bXNpY2ggPHBoaWxpcHAudG9tc2ljaEB2cnVsbC5ldT4gd3JvdGU6Cj4gPgo+ID4gV2UgZGlkIHRv
dWNoIG9uIHRoaXMgaW4gb3VyIGNvb3JkaW5hdGlvbiBjYWxsIGEgZmV3IHdlZWtzIGFnbzogdGhl
Cj4gPiBncm91cGluZyB1bmRlciBtbXUgYW5kIHRoZSBib29sLWVudHJpZXMgd2VyZSBjaG9zZW4g
YmVjYXVzZSBvZiB0aGVpcgo+ID4gc2ltaWxhcml0eSB0byBvdGhlciBleHRlbnNpb25zIChpLmUu
IGZvciBaYlthYmNzXSB0aGVyZSBjb3VsZC9zaG91bGQKPiA+IGJlIGEgYm9vbC1lbnRyeSB1bmRl
ciBlYWNoIGNwdS1ub2RlIOKAlCBmb3Igc29tZSBadiogZW50cmllcyBhIHN1Ym5vZGUKPiA+IG1p
Z2h0IGJlIG5lZWRlZCB3aXRoIGZ1cnRoZXIgcGFyYW1ldGVycykuCj4gPgo+ID4gVGhlIHN0cmlu
Zy1iYXNlZCBhcHByb2FjaCAoYXMgaW4gdGhlIG9yaWdpbmFsbHkgcHJvcG9zZWQgIm1tdS10eXBl
PSIpCj4gPiB3b3VsZCBsaWtlIG5vdCBzY2FsZSB3aXRoIHRoZSBwcm9saWZlcmF0aW9uIG9mIHNt
YWxsICYgbW9kdWxhcgo+ID4gZXh0ZW5zaW9ucy4KPgo+IEkgZG9u4oCZdCBzZWUgd2h5IHRoZSBT
diogZXh0ZW5zaW9ucyBuZWVkIHRvIGJlIHVuZGVyIGFuIG1tdSBub2RlIHRoZW4sCj4gdW5sZXNz
IHRoZSBpbnRlbnQgaXMgdGhhdCBldmVyeSBleHRlbnNpb24gYmUgZ3JvdXBlZCB1bmRlciBhIHN1
Yi1ub2RlCj4gKHdoaWNoIGRvZXNu4oCZdCBzZWVtIHZpYWJsZSBkdWUgdG8gZXh0ZW5zaW9ucyBs
aWtlIFpiayosIHVubGVzcyB5b3UKPiBncm91cCBieSBTcywgU3YgYW5kIFopPwo+CgpJdCBzaG91
bGRuJ3QgYmUuIEFsbCB0aGUgSVNBIGV4dGVuc2lvbnMgKGkuZS4gc3RhbmRhcmQsIHN1cGVydmlz
b3IgJiBoeXBlcnZpc29yKQp3aXRoIHByZWZpeCBTLFosSCBzaG91bGQgYmUga2VwdCBzZXBhcmF0
ZSBpbiBhIHNlcGFyYXRlIG5vZGUgZm9yIGVhc3kKcGFyc2luZy4KCiJyaXNjdixpc2EiIGR0IHBy
b3BlcnR5IHdpbGwgbm90IHNjYWxlIGF0IGFsbC4gSnVzdCBsb29rIGF0IHRoZSBmZXcKZXh0ZW5z
aW9ucyB0aGF0IHdlcmUgcmF0aWZpZWQgdGhpcyB5ZWFyCmFuZCBMaW51eCBrZXJuZWwgbmVlZHMg
dG8gc3VwcG9ydCB0aGVtLgoKIlNzY29mcG1mIiwgIlN2cGJtdCIsICJaaWNib20iCgo+IEFsc28s
IHdoYXQgaXMgZ29pbmcgdG8gaGFwcGVuIHRvIHRoZSBjdXJyZW50IHJpc2N2LGlzYT8gV2lsbCB0
aGF0Cj4gY29udGludWUgdG8gZXhpc3QgYW5kIGR1cGxpY2F0ZSB0aGUgaW5mbywgb3Igd2lsbCBr
ZXJuZWxzIGJlIHJlcXVpcmVkCj4gdG8gcmVjb25zdHJ1Y3QgdGhlIHN0cmluZyB0aGVtc2VsdmVz
IGlmIHRoZXkgd2FudCB0byBkaXNwbGF5IGl0IHRvCj4gdXNlcnM/Cj4KClRoaXMgaXMgbXkgcGVy
c29uYWwgcHJlZmVyZW5jZToKcmlzY3YsaXNhIHdpbGwgY29udGludWUgdG8gYmFzZSBTdGFuZGFy
ZCBJU0EgZXh0ZW5zaW9ucyB0aGF0IGhhdmUKc2luZ2xlIGxldHRlciBleHRlbnNpb25zLgoKVGhp
cyBuZXcgRFQgbm9kZSB3aWxsIGVuY29kZSBhbGwgdGhlIG5vbi1zaW5nbGUgbGV0dGVyIGV4dGVu
c2lvbnMuCkkgYW0gbm90IHN1cmUgaWYgaXQgc2hvdWxkIGluY2x1ZGUgc29tZSBwcm92aXNpb25z
IGZvciBjdXN0b20KZXh0ZW5zaW9ucyBzdGFydGluZyB3aXRoIFggYmVjYXVzZQp0aGF0IHdpbGwg
YmUgcGxhdGZvcm0gc3BlY2lmaWMuCgpBZ2FpbiwgdGhpcyBpcyBqdXN0IG15IHBlcnNvbmFsIHBy
ZWZlcmVuY2UuIEkgd2lsbCB0cnkgdG8gc2VuZCBhIHBhdGNoCnNvb24gc28gdGhhdCB3ZSBjYW4g
aW5pdGlhdGUgYSBicm9hZGVyCmRpc2N1c3Npb24gb2YgdGhlIHNjaGVtZSBhbmQgYWdyZWUvZGlz
YWdyZWUgb24gc29tZXRoaW5nLgoKCgo+IEFzIGEgRnJlZUJTRCBkZXZlbG9wZXIgSeKAmW0gb2J2
aW91c2x5IG5vdCBhIHBhcnQgb2YgbWFueSBvZiB0aGVzZQo+IGRpc2N1c3Npb25zLCBidXQgd2hh
dCB0aGUgTGludXggY29tbXVuaXR5IGltcG9zZXMgYXMgdGhlIGRldmljZSB0cmVlCj4gYmluZGlu
Z3MgaGFzIGEgcmVhbCBpbXBhY3Qgb24gdXMuCj4KPiBKZXNzCj4KPiA+IE9uIFR1ZSwgMzAgTm92
IDIwMjEgYXQgMTQ6NTksIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6
Cj4gPj4KPiA+PiBPbiAzMCBOb3YgMjAyMSwgYXQgMTM6MjcsIEhlaWtvIFN0w7xibmVyIDxoZWlr
b0BzbnRlY2guZGU+IHdyb3RlOgo+ID4+Pgo+ID4+PiBIaSwKPiA+Pj4KPiA+Pj4gQW0gRGllbnN0
YWcsIDMwLiBOb3ZlbWJlciAyMDIxLCAxNDoxNzo0MSBDRVQgc2NocmllYiBKZXNzaWNhIENsYXJr
ZToKPiA+Pj4+IE9uIDMwIE5vdiAyMDIxLCBhdCAxMjowNywgSGVpa28gU3TDvGJuZXIgPGhlaWtv
QHNudGVjaC5kZT4gd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+PiBBbSBNb250YWcsIDI5LiBOb3ZlbWJl
ciAyMDIxLCAxMzowNjoyMyBDRVQgc2NocmllYiBIZWlrbyBTdMO8Ym5lcjoKPiA+Pj4+Pj4gQW0g
TW9udGFnLCAyOS4gTm92ZW1iZXIgMjAyMSwgMDk6NTQ6MzkgQ0VUIHNjaHJpZWIgSGVpbnJpY2gg
U2NodWNoYXJkdDoKPiA+Pj4+Pj4+IE9uIDExLzI5LzIxIDAyOjQwLCB3ZWZ1QHJlZGhhdC5jb20g
d3JvdGU6Cj4gPj4+Pj4+Pj4gRnJvbTogV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+Cj4gPj4+Pj4+
Pj4KPiA+Pj4+Pj4+PiBQcmV2aW91cyBwYXRjaCBoYXMgYWRkZWQgc3ZwYm10IGluIGFyY2gvcmlz
Y3YgYW5kIGFkZCAicmlzY3Ysc3ZwbWJ0Igo+ID4+Pj4+Pj4+IGluIHRoZSBEVCBtbXUgbm9kZS4g
VXBkYXRlIGR0LWJpbmRpbmdzIHJlbGF0ZWQgcHJvcGVydHkgaGVyZS4KPiA+Pj4+Pj4+Pgo+ID4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBGdSA8d2VmdUByZWRoYXQuY29tPgo+ID4+Pj4+Pj4+
IENvLWRldmVsb3BlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPj4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPj4+Pj4+Pj4gQ2M6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gPj4+Pj4+Pj4gQ2M6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPj4+Pj4+Pj4gQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoK2R0QGtlcm5lbC5vcmc+Cj4gPj4+Pj4+Pj4gLS0tCj4gPj4+Pj4+Pj4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDEwICsrKysrKysrKysKPiA+
Pj4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4+Pj4+Pj4+Cj4gPj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1
cy55YW1sCj4gPj4+Pj4+Pj4gaW5kZXggYWE1ZmI2NGQ1N2ViLi45ZmY5Y2JkZDhhODUgMTAwNjQ0
Cj4gPj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2NwdXMueWFtbAo+ID4+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+Pj4+Pj4+PiBAQCAtNjMsNiArNjMsMTYgQEAgcHJvcGVy
dGllczoKPiA+Pj4+Pj4+PiAgICAgIC0gcmlzY3Ysc3Y0OAo+ID4+Pj4+Pj4+ICAgICAgLSByaXNj
dixub25lCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiArICBtbXU6Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4g
U2hvdWxkbid0IHdlIGtlZXAgdGhlIGl0ZW1zIGJlIGluIGFscGhhYmV0aWMgb3JkZXIsIGkuZS4g
bW11IGJlZm9yZQo+ID4+Pj4+Pj4gbW11LXR5cGU/Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4+ICsgICAg
ZGVzY3JpcHRpb246Cj4gPj4+Pj4+Pj4gKyAgICAgIERlc2NyaWJlcyB0aGUgQ1BVJ3MgTU1VIFN0
YW5kYXJkIEV4dGVuc2lvbnMgc3VwcG9ydC4KPiA+Pj4+Pj4+PiArICAgICAgVGhlc2UgdmFsdWVz
IG9yaWdpbmF0ZSBmcm9tIHRoZSBSSVNDLVYgUHJpdmlsZWdlZAo+ID4+Pj4+Pj4+ICsgICAgICBT
cGVjaWZpY2F0aW9uIGRvY3VtZW50LCBhdmFpbGFibGUgZnJvbQo+ID4+Pj4+Pj4+ICsgICAgICBo
dHRwczovL3Jpc2N2Lm9yZy9zcGVjaWZpY2F0aW9ucy8KPiA+Pj4+Pj4+PiArICAgICRyZWY6ICcv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcnCj4gPj4+Pj4+Pj4gKyAgICBl
bnVtOgo+ID4+Pj4+Pj4+ICsgICAgICAtIHJpc2N2LHN2cG1idAo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+
IFRoZSBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24gaGFzIG11bHRpcGxlIE1NVSByZWxhdGVkIGV4
dGVuc2lvbnM6Cj4gPj4+Pj4+PiBTdm5hcG90LCBTdnBibXQsIFN2aW52YWwuIFNoYWxsIHRoZXkg
YWxsIGJlIG1vZGVsZWQgaW4gdGhpcyBlbnVtPwo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIHJlbWVtYmVy
IGluIHNvbWUgZWFybGllciB2ZXJzaW9uIHNvbWUgd2F5IGJhY2sgdGhlcmUgd2FzIHRoZQo+ID4+
Pj4+PiBzdWdnZXN0aW9uIG9mIHVzaW5nIGEgc3ViLW5vZGUgaW5zdGVhZCBhbmQgdGhlbiBhZGRp
bmcgYm9vbGVhbgo+ID4+Pj4+PiBwcm9wZXJ0aWVzIGZvciB0aGUgc3VwcG9ydGVkIGV4dGVuc2lv
bnMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEFrYSBzb21ldGhpbmcgbGlrZQo+ID4+Pj4+PiAgIG1tdSB7
Cj4gPj4+Pj4+ICAgICAgICAgICByaXNjdixzdnBibXQ7Cj4gPj4+Pj4+ICAgfTsKPiA+Pj4+Pgo+
ID4+Pj4+IEZvciB0aGUgcmVjb3JkLCBJJ20gdGFsa2luZyBhYm91dCB0aGUgbWFpbCBmcm9tIHNl
cHRlbWJlcgo+ID4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBQWVM
dFVDaGpqekcrUDh5ZzQ1R0xaTUp5NVVSMks1UlJCb0xGVlpodE9hWjVwUHRFQUBtYWlsLmdtYWls
LmNvbS8KPiA+Pj4+Pgo+ID4+Pj4+IFNvIGhhdmluZyBhIHN1Yi1ub2RlIHdvdWxkIG1ha2UgYWRk
aW5nIGZ1dHVyZSBleHRlbnNpb25zCj4gPj4+Pj4gd2F5IG5pY2VyLgo+ID4+Pj4KPiA+Pj4+IFN2
cGJtdCBpcyBqdXN0IGFuIElTQSBleHRlbnNpb24sIGFuZCBzaG91bGQgYmUgdHJlYXRlZCBsaWtl
IGFueSBvdGhlci4KPiA+Pj4+IExldOKAmXMgbm90IGludmVudCB0d28gZGlmZmVyZW50IHdheXMg
b2YgcmVwcmVzZW50aW5nIHRoYXQgaW4gdGhlIGRldmljZQo+ID4+Pj4gdHJlZS4KPiA+Pj4KPiA+
Pj4gSGVpbnJpY2ggYXNrZWQgaG93IHRoZSBvdGhlciBleHRlbnNpb25zIHNob3VsZCBiZSBoYW5k
bGVkCj4gPj4+IChTdm5hcG90LCBTdnBibXQsIFN2aW52YWwpLCBzbyB3aGF0IGRvIHlvdSBzdWdn
ZXN0IHRvIGRvIHdpdGggdGhlc2U/Cj4gPj4KPiA+PiBXaGF0ZXZlciBpcyBkb25lIGZvciBaYlth
YmNzXSwgWmsqLCBadiosIFppY2JvKiwgZXRjLiBUaGVyZSBtYXkgbm90IGJlCj4gPj4gYSBjb25j
cmV0ZSBwbGFuIGZvciB0aGF0IHlldCwgYnV0IHRoYXQgbWVhbnMgeW91IHNob3VsZCBzcGVhayB3
aXRoIHRoZQo+ID4+IHBlb3BsZSBpbnZvbHZlZCB3aXRoIHN1Y2ggZXh0ZW5zaW9ucyBhbmQgY29t
ZSB1cCB3aXRoIHNvbWV0aGluZwo+ID4+IGFwcHJvcHJpYXRlIHRvZ2V0aGVyLgo+ID4+Cj4gPj4g
SmVzcwo+ID4+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCgoKLS0KUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
