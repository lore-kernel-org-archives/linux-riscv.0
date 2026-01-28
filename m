Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E89D3F095
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywyP9KUphHwBz6TLnbN2dRNcnPqyLQ0d1njedjHxMXQ=; b=cbdfHaGbCDed63
	rbW9EqQiHZ8ViXW+xCjhjIIQpgSVI2Kf0xihewuavjsjAYD6mnIagvcKI+rHyX32XLhQ8aTdQRWAV
	AYss9YXjqW5lBbF/1imnZ4Hg2KtmyAltBhXMiWrOGIufFD49HeHDItIj3upkBo8SqFIz/KJRCuhXh
	MI+IAWMGVRbezGB5dB1pL65hzVCwNFhEdvsTGcHPSu7QgAjiNdI71qjpdEfocdEXJzLYPkjPDITtd
	hrXKEdzhYl6H5C1Ekt3JVySsBrnbEg4MhN5Hd7WLJ8Vx7QCduABT6R6/5OSOKXY51XWotelndL6+Q
	OuW7Ujn63gO1BixCprKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8eQ-0000000GPrz-2sPG;
	Wed, 28 Jan 2026 16:44:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8eN-0000000GPrd-3mGY
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 16:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2F2443AF0;
	Wed, 28 Jan 2026 16:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588A3C4CEF1;
	Wed, 28 Jan 2026 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769618654;
	bh=5DovOnZ0d/vD+FS6LMq5cjmgNxGlH48eoVz7AsPLaZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLw6q2hyyMhczgJtKVG4ZScIVWCKyS5DAyL6vgAcQs55C1JogC0jJnjvyKORQtuC/
	 VGhIiNae5eDve+hzCyVjMMOgCU7oA0yeQ8erSWGAbX4+6jnlvhnjxuUFytlfhQLhNL
	 tLjjzhy0j1YDw5X4GjVpw858EBVl3KgRMmO9whyrWsbim32i2V7oVgHx6pzgRS5mxh
	 nCD6Sfdu4O0qwfeS5jsvYxIkeexgGWOE5Lw8VYDaV68NAxaIj6W8s090YSr0n7CBpH
	 61sjaOavOOr4Wt/TIchmolOHBAcA/26Nm+iik0sCysfrzEGvSz1CguM+gfZjwfBBIy
	 OvSayE1rGmaUA==
Date: Wed, 28 Jan 2026 08:44:12 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <aXo83Ob9LpeHd2SC@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>
 <6ea016d6-42a4-4d83-89fd-eee918a834ef@suse.de>
 <7301d5f80c7f247d4a2f82c242b3d8b8ad69f5e1.camel@icenowy.me>
 <064dd2b7-415b-4794-8867-73bdd7ac17df@suse.de>
 <4e340eb246e4e725754ed2097260c1a1acd8fe71.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e340eb246e4e725754ed2097260c1a1acd8fe71.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_084415_981704_5A05ABCD 
X-CRM114-Status: GOOD (  41.76  )
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

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMTI6MDM6MDFBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0wMS0yOOaYn+acn+S4ieeahCAwOTo1NCArMDEwMO+8jFRob21hcyBa
aW1tZXJtYW5u5YaZ6YGT77yaCj4gPiBIaQo+ID4gCj4gPiBBbSAyOC4wMS4yNiB1bSAwOTozOSBz
Y2hyaWViIEljZW5vd3kgWmhlbmc6Cj4gPiA+IOWcqCAyMDI2LTAxLTI45pif5pyf5LiJ55qEIDA4
OjU4ICswMTAw77yMVGhvbWFzIFppbW1lcm1hbm7lhpnpgZPvvJoKPiA+ID4gPiBIaQo+ID4gPiA+
IAo+ID4gPiA+IEFtIDIzLjAxLjI2IHVtIDEwOjI4IHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiA+
ID4gPiA+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBUaGlzIGlzIGEgZnJvbS1zY3JhdGNoIGRyaXZlciB0YXJnZXRpbmcgVmVyaXNpbGlj
b24gREMtc2VyaWVzCj4gPiA+ID4gPiBkaXNwbGF5Cj4gPiA+ID4gPiBjb250cm9sbGVycywgd2hp
Y2ggZmVhdHVyZSBzZWxmLWlkZW50aWZpY2F0aW9uIGZ1bmN0aW9uYWxpdHkKPiA+ID4gPiA+IGxp
a2UKPiA+ID4gPiA+IHRoZWlyCj4gPiA+ID4gPiBHQy1zZXJpZXMgR1BVcy4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gT25seSBEQzgyMDAgaXMgYmVpbmcgc3VwcG9ydGVkIG5vdywgYW5kIG9ubHkgdGhl
IG1haW4KPiA+ID4gPiA+IGZyYW1lYnVmZmVyCj4gPiA+ID4gPiBpcyBzZXQKPiA+ID4gPiA+IHVw
IChhcyB0aGUgRFJNIHByaW1hcnkgcGxhbmUpLiBTdXBwb3J0IGZvciBtb3JlIERDIG1vZGVscyBh
bmQKPiA+ID4gPiA+IG1vcmUKPiA+ID4gPiA+IGZlYXR1cmVzIGlzIG15IGZ1cnRoZXIgdGFyZ2V0
cy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQXMgdGhlIGRpc3BsYXkgY29udHJvbGxlciBpcyBkZWxp
dmVyZWQgdG8gU29DIHZlbmRvcnMgYXMgYQo+ID4gPiA+ID4gd2hvbGUKPiA+ID4gPiA+IHBhcnQs
Cj4gPiA+ID4gPiB0aGlzIGRyaXZlciBkb2VzIG5vdCB1c2UgY29tcG9uZW50IGZyYW1ld29yayBh
bmQgZXh0cmEgYnJpZGdlcwo+ID4gPiA+ID4gaW5zaWRlIGEKPiA+ID4gPiA+IFNvQyBpcyBleHBl
Y3RlZCB0byBiZSBpbXBsZW1lbnRlZCBhcyBkZWRpY2F0ZWQgYnJpZGdlcyAodGhpcwo+ID4gPiA+
ID4gZHJpdmVyCj4gPiA+ID4gPiBwcm9wZXJseSBzdXBwb3J0cyBicmlkZ2UgY2hhaW5pbmcpLgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNl
bm93eS5tZT4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGlu
Z2RhQGlzY2FzLmFjLmNuPgo+ID4gPiA+ID4gVGVzdGVkLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNj
YXMuYWMuY24+Cj4gPiA+ID4gPiBUZXN0ZWQtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6
eW5za2lAc2Ftc3VuZy5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4gPiA+IAo+ID4gPiA+IEkgb25seSBicmllZmx5IGxv
b2tlZCBvdmVyIHRoaXMgcmV2aXNpb24sIGFzIHY1IGFscmVhZHkgc2VlbWVkCj4gPiA+ID4gcXVp
dGUKPiA+ID4gPiBnb29kLiBJZiB5b3Ugd2FudCB0byBkbyBhIGZvbGxvdy11cCBwYXRjaCwgc2Vl
IG15IG90aGVyIHJlcGx5IHRvCj4gPiA+ID4gdjUKPiA+ID4gPiBvbgo+ID4gPiA+IHN0b3Jpbmcg
aGFyZHdhcmUgZm9ybWF0cyBpbiB0aGUgcGxhbmUgc3RhdGUuCj4gPiA+IFdlbGwgdGhlIGtlcm5l
bCB0ZXN0IHJvYm90IGZvdW5kIGEgc21hbGwgS2NvbmZpZyBwcm9ibGVtIGluIHRoaXMKPiA+ID4g
cmV2aXNpb24gLS0gRFJNX0RJU1BMQVlfSEVMUEVSIHNob3VsZCBiZSBzZWxlY3RlZC4KPiA+ID4g
Cj4gPiA+IE1heWJlIEknbSBnb2luZyB0byBzZW5kIGEgdjcgdG8gYWRkcmVzcyB0aGlzLgo+ID4g
PiAKPiA+ID4gU2hvdWxkIEkgYWxzbyBtYWtlIGRlcml2ZWQgcGxhbmUgc3RhdGUgYSBjaGFuZ2Ug
aW4gdjcsIG9yIGxlYXZlIGl0Cj4gPiA+IGFzIGEKPiA+ID4gZm9sbG93LXVwPwo+ID4gCj4gPiBU
aGF0IHdvdWxkIHJlcXVpcmUgYW5vdGhlciByb3VuZCBvZiByZXZpZXcsIEkgZ3Vlc3MuIEJldHRl
ciBsZWF2ZSBpdAo+ID4gZm9yIAo+ID4gYSBzZXBhcmF0ZSBzZXJpZXMuCj4gPiAKPiA+ID4gCj4g
PiA+IEJ5IHRoZSB3YXksIEkgdGhpbmsgUEFUQ0ggMS01IHNob3VsZCBnbyB0aHJvdWdoIGRybS1t
aXNjIHRyZWUsIGFtIEkKPiA+ID4gcmlnaHQ/IFdobydzIGdvaW5nIHRvIHBpY2sgaXQgaWYgZ29p
bmcgdGhyb3VnaCBkcm0tbWlzYz8KPiA+IAo+ID4gSSBjYW4gZG8gdGhhdC4gSW4gdjcsIHlvdSBj
YW4gbWVyZ2UgcGF0Y2ggOCAoTUFJTlRBSU5FUlMpIGludG8gcGF0Y2gKPiA+IDMsIAo+ID4gc28g
dGhhdCBpdCBnb2VzIGluIGFzIHdlbGwuCj4gCj4gV2VsbCB0aGVuIHdobyBzaG91bGQgcGljayBw
YXRjaCA5LCB0aGUgbWFpbG1hcCBjaGFuZ2U/Cj4gCj4gSSByZW1lbWJlciB0aGVyZSBpcyBzb21l
IHRyZWUgZm9yIHRoaXMga2luZCBvZiAidHJpdmlhbCBjaGFuZ2VzIiwgYnV0IEkKPiBmb3Jnb3Qg
YW55IGRldGFpbCBhYm91dCB0aGlzLgo+IAo+ID4gCj4gPiBQYXRjaGVzIDYgYW5kIDcgYXJlIHNt
YWxsLCBzbyBJIGNhbiBhbHNvIHRha2UgdGhlbSBpbnRvIGRybS1taXNjIGlmCj4gPiB0aGV5IAo+
ID4gcmlzY3YgbWFpbnRhaW5lcnMgYXJlIE9LIHdpdGggdGhhdC4KPiAKPiBXZWxsLCBJIHRoaW5r
IHRoZXJlIG1pZ2h0IGJlIG90aGVyIFRIMTUyMCBEVCBiaXRzIG1lcmdlZCBieSBEcmV3Cj4gRnVz
dGluaSBpbiB0aGlzIGN5Y2xlPwo+IAo+IERyZXcsIGNhbiB5b3UgcmVhZCB0aGlzPyAoSSBoZWFy
ZCBmcm9tIEhhbiBHYW8gdGhhdCBoaXMgbWFpbCBmYWlsZWQgdG8KPiBnZXQgZGVsaXZlcmVkIHRv
IERyZXcpLiBJZiB5b3UgY2FuIHJlYWQgdGhpcywgY291bGQgeW91IGNvbmZpcm0gdGhhdAo+IHdo
ZXRoZXIgeW91IHdhbnQgdG8gbWVyZ2UgRFQgcGF0Y2hlcz8KClNvcnJ5IGZvciBub3QgZ2l2aW5n
IGEgdGFnIGZvciB0aGUgZHRzIHBhdGNoZXMgZWFybGllci4gSSdsbCBkbyB0aGF0Cm5vdy4gVz0x
IGR0YnNfY2hlY2sgbG9va3MgY2xlYW4uCgpUaGUgZHRzIHBhdGNoZXMgc2hvdWxkIHByb2JhYmx5
IGdvIHRocm91Z2ggdGhlIHRoZWFkLWR0LWZvci1uZXh0IHRyZWUuClRoZXJlIHdlcmUgbm8gb3Ro
ZXIgZHRzIHBhdGNoZXMgZm9yIHRoZSBtZXJnZSB3aW5kb3cgc28gSSBoYWQgbm90CnBsYW5uZWQg
dG8gc2VuZCBhIHRoZWFkLWR0LWZvci1uZXh0IHB1bGwgcmVxdWVzdCBmb3IgNi4yMC4gTm9ybWFs
bHkgSQp0cnkgdG8gc2VuZCB0aGUgUFIgdG8gQXJuZCBieSByYzUuCgpJJ20gZXhjaXRlZCBhYm91
dCB0aGlzIHNlcmllcyBzbyBtYXliZSB0aGVyZSBpcyBzdGlsbCBhIHBvc3NpYmlsaXR5LiBJZgp0
aGUgZHJpdmVycyBjaGFuZ2VzIGFyZSBnb2luZyBpbnRvIG5leHQgbm93LCB0aGVuIEkgY291bGQg
YXBwbHkgdGhlIGR0cwpjaGFuZ2VzIHRvIHRoZWFkLWR0LWZvci1uZXh0IGFuZCBhc2sgdGhlIFNv
QyBtYWludGFpbmVyIHRlYW0gaWYgaXQgaXMKcG9zc2libGUgdG8gYWNjZXB0IGEgbGF0ZSBkdHMg
UFIuIFRoZXJlIGlzIHN0aWxsIHRoZSBwb3NzaWJpbGl0eSBvZiBhCmNvdXBsZSBuZXh0IHJlbGVh
c2VzIGJlZm9yZSByYzggdGhpcyB3ZWVrZW5kLiBUaGUgZXh0cmEgd2VlayBmb3IgNi4xOQptaWdo
dCBtYWtlIHRoaXMgZmVhc2libGUuCgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
