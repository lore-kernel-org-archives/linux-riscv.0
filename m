Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68E8CA5FD9
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfL5IMkYtyeHq54nVliPOZt4FWk5OwATXt8ud0ycF/Q=; b=LDjgVPCYYMCtXN
	nm8HUnU0N6auIpTGlJa4G8AlwW8/k89EJxsqmdtVbakwXerYYon4h7hfbel/hSI837ACETzNO4uYY
	q5liIzOnqNxZeI53VSW8TNmIcDPwbIaloVzeKqO1BbrX8dS84N5rxpeTmbPQLCpyQeEG5lU9eK1rm
	Hq3oAHd6fzD6Xgcyjs4D4iRm7sxQTATGITRrSn5vaRb+VUtxcLCN0ExLSAZnlKKQ0+wb1Ybmti0fb
	2yTTiHZ7fAEC4804+tlrHIsLbAfALUojaWVaUFjQrubuLYIwUhPUPCB2ba+OdrfwhflfmPcQj8xtB
	ggudzs0IGQmqCCBNZOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0o-0000000Au3x-1pCl;
	Fri, 02 Oct 2026 07:48:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0l-0000000Au1z-2oyh
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 07:48:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A13B4478C
	for <linux-riscv@lists.infradead.org>; Fri,  2 Oct 2026 07:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F2E1F008A4
	for <linux-riscv@lists.infradead.org>; Fri,  2 Oct 2026 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927335;
	bh=K/6dk9nrqC/MKrnHwwRY81eqOJFcj++Fe93uSmAxRa8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WSkLxcBV8rOs1pRakbDhFdSdzRUyIybCbVyESybWpJEoxHEI3bOnqFnDOf8+zKHr0
	 rDC+w/uzqqxpyhYxFQYnCdrZr2yR/vUOUQuDkpjWikmYFE9ZkNGlaV4Pav458TKY5e
	 tZH1RGFqG6HdYOyOuhY5n+i27May7nzMphKSwS0on2OpLZfDtJzJ1oMzfMINn89Yv0
	 ku9wVJKH8Qg0gty6LeSD2XLGjcXCXRa/J5DbD1hzZpWCjQPH3uIWRMXLspS5ssASVX
	 gxIiexEs7f/Ya3Fb6vvgcdtB0ULyp9Bun8rJtF6rE5Aee6mCwdSpiwjokwQ8dH+asI
	 Hxf26SfFBLLcA==
Received: by mail-lr2-f40.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so63125091fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 00:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8ZpLy97vkvMtQ+Z+zDpb68JuAob7BPYDFkxX+bakiAM+9uHX6SVt2QvKvFRlXvyUEB4kFkOMhUQrSXg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLDO/BZZ7MOaMNSZx30pKdCZ3AzrMDdX/doM+C6xfzCNk/W5Z0/
	AqeYW0SMKI+1/5krGwxXF0P8yEloTy1BjIVS3wgrhd7HetCn0JvUFfOValdVgXcMpZcEDTy+hWu
	NbjbHhc8X0a9lvI5edlf+lzo7DDc0e8s=
X-Received: by 2002:a05:651c:a214:10b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3a8877acfdbmr2899761fa.19.1790927333136; Fri, 02 Oct 2026
 00:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net> <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net> <20261002-matted-tux-5b4059bc305a@wendy>
In-Reply-To: <20261002-matted-tux-5b4059bc305a@wendy>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 2 Oct 2026 15:48:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v67N_c9qQYCkO3qyAJBD_AiS7121w7TdzaEo+oCHejZz4A@mail.gmail.com>
X-Gm-Features: AclHuK_MycTfrXnUdqDSD2u0CizqQBnqOmkhjG3IcG03pU3h9DtnRs-NxqNzvuk
Message-ID: <CAGb2v67N_c9qQYCkO3qyAJBD_AiS7121w7TdzaEo+oCHejZz4A@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Conor Dooley <conor.dooley@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andre Przywara <andre.przywara@arm.com>, Bastian Germann <bage@debian.org>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMiwgMjAyNiBhdCAzOjM04oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAzMCwgMjAyNiBhdCAwMjow
NTo0N1BNICswMDAwLCBXaWxrZW4gR290dHdhbHQgd3JvdGU6Cj4gPiBPbiBXZWQsIDMwIFNlcCAy
MDI2IDIwOjAyOjIxICswNzAwCj4gPiBOZ3V5ZW4gTWluaCBUaWVuIDx0aWVuLm5ndXllbm1pbmhA
ZW1iZWRkZWRsaW51eC5ibG9nPiB3cm90ZToKPiA+Cj4gPiA+IEhpIFdpbGtlbiwKPiA+ID4KPiA+
ID4gPiBXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gYWRkIHRoZSAiYWxsd2lubmVyLHN1
bjIwaS1kMS1od3NwaW5sb2NrIiBsaW5lIHRvCj4gPiA+ID4gdGhlIGRyaXZlciBpbiB0aGUgc3Vu
NmlfaHdzcGlubG9ja19pZHMgc3RydWN0LCBkcm9wCj4gPiA+ID4gImFsbHdpbm5lcixzdW42aS1h
MzEtaHdzcGlubG9jayIgaGVyZSBpbiB0aGUgRDEgZGV2aWNlIHRyZWUgYW5kIHVwZGF0ZSB0aGUg
eWFtbAo+ID4gPiA+IGZpbGUgYWNjb3JkaW5nbHk/Cj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3IgbG9v
a2luZyBhdCBpdC4gQmpvcm4gaGFzbid0IHJlcGxpZWQgeWV0LCBzbyBJIGxvb2tlZCBhIGJpdAo+
ID4gPiBtb3JlIGF0IHRoZSBuYW1pbmcuIEknZCBsaWtlIHRvIGtlZXAgdGhlIEEzMSBmYWxsYmFj
azogaXQncyB0aGUgdXN1YWwKPiA+ID4gcGF0dGVybiwgb3RoZXIgYmxvY2tzIGluIHRoaXMgZHRz
aSBkbyB0aGUgc2FtZSAodGltZXIsIEkyUywgTEVECj4gPiA+IGNvbnRyb2xsZXIpLCBhbmQgQ29u
b3IgYWxyZWFkeSBhY2tlZCB0aGUgYmluZGluZyBpbiAyLzMuIElmIEJqb3JuCj4gPiA+IHByZWZl
cnMgYSBkcml2ZXIgZW50cnkgaW5zdGVhZCwgSSdtIGZpbmUgdG8gY2hhbmdlIGl0Lgo+ID4KPiA+
IFllYWgsIENvbm9yIHdhcyBhIGJpdCBxdWljayB0byBhY3QgaGVyZSwgc3VjaCB0aGluZ3MgaGFw
cGVuIG9mdGVuIHdpdGggcGF0Y2hzZXRzCj4gPiBtYWRlIG91dCBvZiBkb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWVzIGFuZCBjb2RlLiBUaG91Z2gsIHRoZSBnZXQgY2xvY2sgYW5kIHJlc2V0cwo+ID4g
cGF0Y2ggaXMgZmluZS4gVGhlIGRyaXZlciBjb3VsZCB1c2Ugc29tZSBtb2Rlcm5pemF0aW9uLgo+
Cj4gSSBkdW5ubywgd2FzIEkgdG9vIHF1aWNrIHRvIGFjdD8gVGhlIHBhdGNoZWQgbG9va2VkIGNv
cnJlY3QgdG8gbWUsIHNpbmNlCj4gaXQgd2FzIHVzaW5nIGEgZmFsbGJhY2sgdG8gYSBkZXZpY2Ug
dGhhdCBpdCBhcHBlYXJzIHRvIGJlIGNvbXBhdGlibGUKPiB3aXRoLiBIYWQgdGhlIHNlcmllcyBk
b25lIHdoYXQgeW91J3JlIHN1Z2dlc3RpbmcsIG15IHJldmlldyBmZWVkYmFjawo+IHdvdWxkIGhh
dmUgYmVlbiB0byB0ZWxsIHRoZSBUaWVuIHRvIGFkZCBhIGZhbGxiYWNrLgo+Cj4gPiA+IEJqb3Ju
LCB3aGF0IGRvIHlvdSB0aGluaz8gSnVzdCBzdGF5IHdpdGggdGhlICJhbGx3aW5uZXIsc3VuNmkt
YTMxLWh3c3BpbmxvY2siCj4gPiA+IHN0cmluZyBvciBhZGQgYWxsIHRoZSBwb3NzaWJsZSBjb21i
aW5hdGlvbnMgbGlrZQo+ID4gPiAiYWxsd2lubmVyLHN1bjhpLWgyLXBsdXMtaHdzcGlubG9jayIg
b3IgImFsbHdpbm5lcixzdW44aS1hODN0LWh3c3BpbmxvY2siLgo+ID4gPiBJIG1lYW4sIGl0IGlz
IGp1c3QgYSBuYW1pbmcgZ2FtZSBhbmQgdGhlcmUgYXJlIDEwKyBTb0NzIHN1cHBvcnRpbmcgdGhp
cwo+ID4gPiBzcGlubG9jayByZWdpc3RlciBmaWxlCj4KPiBBbGwgZGV2aWNlcyBjb21wYXRpYmxl
IHdpdGggdGhlIGEzMSBzaG91bGQgdXNlIHRoZSBhMzEgYXMgYSBmYWxsYmFjay4KCisxLgoKSWYg
dGhlIGhhcmR3YXJlIGlzIGJhY2t3YXJkIGNvbXBhdGlibGUsIHRoZW4gd2l0aCB0aGUgZmFsbGJh
Y2sgY29tcGF0aWJsZQpldmVyeXRoaW5nIHdvcmtzLgoKV2UgYXNrIGZvbGtzIHRvIGFsd2F5cyBh
ZGQgU29DLXNwZWNpZmljIGNvbXBhdGlibGVzIGp1c3QgaW4gY2FzZS4KCgpDaGVuWXUKCj4gPgo+
ID4gPiA+IE9oLCBhbmQgSSBtYXkgYmUgYWJsZSB0byB0ZXN0IGl0IGFnYWluc3QgdGhlIEQxLCBJ
IG93biBhIFNpcGVlZCBOZXpoYS4KPiA+ID4KPiA+ID4gVGhhdCB3b3VsZCBiZSBncmVhdC4gWW91
IGRvbid0IG5lZWQgRnJlZVJUT1MgZm9yIGl0OiBJIHRlc3RlZCB3aXRoIGEKPiA+ID4gc21hbGwg
TGludXggbW9kdWxlIHRoYXQgdGFrZXMgZWFjaCBsb2NrIGFuZCBjaGVja3MgdGhlIHN0YXR1cwo+
ID4gPiByZWdpc3Rlci4gSSBjYW4gY2xlYW4gaXQgdXAgZm9yIHRoZSBzaW5nbGUtY29yZSBEMSBh
bmQgc2VuZCBpdC4KPiA+Cj4gPiBVaG0sIHRoZSBMaW51eC1vbmx5IHRlc3QgZG9lc24ndCB3b3Jr
IGFzIGEgaHdzcGlubG9jayB0ZXN0LCBpdCBtaXNzZXMgdGhlIGVudGlyZQo+ID4gcG9pbnQgb2Yg
dGhlIHByaW1pdGl2ZS4gQSBod3NwaW5sb2NrIGFyYml0cmF0ZXMgYmV0d2VlbiB0d28gaW5kZXBl
bmRlbnQgYWdlbnRzLAo+ID4gaW4gdGhpcyBjYXNlLCBMaW51eCBydW5uaW5nIG9uIHRoZSBDOTA2
IGNvcmUgYW5kIEZyZWVSVE9TIHJ1bm5pbmcgb24gdGhlIEhpRmkKPiA+IERTUCwgYm90aCBzaGFy
aW5nIHRoZSBzYW1lIG1lbW9yeSBidXMgYW5kIG90aGVyIGhhcmR3YXJlLiBJZiBMaW51eCBpcyB0
aGUgb25seQo+ID4gb25lIHdobyBldmVyIHRha2VzIHRoZSBsb2NrcywgaXQgaXMgc2ltdWx0YW5l
b3VzbHkgd3JpdGVyIGFuZCByZWFkZXIgb2YgdGhlIHN0YXR1cwo+ID4gcmVnaXN0ZXIsIHNvIHRo
ZSB0ZXN0IGNhbm5vdCBmYWlsIGV2ZW4gZm9yIGEgYnJva2VuIChvciBmYWtlKSBpbXBsZW1lbnRh
dGlvbi4gVGhhdAo+ID4gd291bGQgYmFzaWNhbGx5IHRlc3Qgbm90aGluZyBhdCBhbGwsIHdlbGws
IG1heWJlIGl0IHdvdWxkIGJlIHNvbWUga2luZCBvZiBicmluZy11cAo+ID4gdGVzdCwgYnV0IG92
ZXJhbGwgcXVpdGUgdXNlbGVzcy4KPiA+Cj4gPiBncmVldGluZ3MsCj4gPiBXaWxrZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
