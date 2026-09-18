Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297E2C982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 23:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKvGsvic0tIOiuv1hRqQ2wVqsK8CAv+Y7bOxpvSgAFE=; b=Lf07cPE3wfaNnj
	BR8e0CoCV0KDRngiTXXaCPhsqUqC2WcTX9pcDELnKcgkyEM+egRZpUpB1GdizYcDKSTx4XkKNegh9
	GTN/MfrTsNnLazYAYg9gkLt1RSwyiTkvu04C6UvcOHfiQ8zEDKQDdf591tftx0LQcgJfjAQQHEeE8
	lZHN5CrTpRmoqvkPSx4dWbtm2ddITSZfI7kFszpH7UBGkkrH3MZRaJUBm7TBDGkjKho1sZD2h8Vfy
	u66cllwQc5G2apjl3ZHiwWbdLlxXcpTSFCIXJUH25U4k4kmWgCcPaPkahs8acGBan50sCQNgw+ahQ
	R0jInkbCn7BvfjPhpvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hZv-0000000FgKk-2UmQ;
	Fri, 18 Sep 2026 23:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hZu-0000000FgKX-0AM2
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 23:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 884E7439F0;
	Fri, 18 Sep 2026 23:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5DF1F000FF;
	Fri, 18 Sep 2026 23:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772469;
	bh=SN+cGtUcaDOXnci0UtnpePkFtN0EYV845cfIYt8n+7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flOQ3ytxsAwXtDjXhE3lWkmvTLpnoqeZnMIlinf02PTdQ/+E+iC2gVenIoyWSuxsE
	 FTrW7YLcU0pbEkpirrU3rBgWvqjWKqK6xJDqrOyE2jm6AQ3wKwUcp8xMt4fdUcX4s9
	 dFp2juVIjMsWyfL59WOGGaxe7ncOAAiyz9htdiLLJHq8zg14+sWu9xUJp/25J/crGC
	 bEMi+7ix4GhbCw7iS/nhy0HDIrhIMZIyg9QDiK51Ith0JsQxRw5oIv3khqUKIaukB8
	 VrDey+9KvV+4hsLEOPVB5etPhj/tGIarpF/D3Jz/i4tONxYP0GSOW6yy/UVZQ3DyL1
	 /9r9IfDXxIWEQ==
Date: Fri, 18 Sep 2026 23:01:07 +0000
From: Yixun Lan <dlan@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
Message-ID: <20260918230107-GKC297024@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
 <a4359efeee2220903a05a2383a651ec8ec7284b7.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4359efeee2220903a05a2383a651ec8ec7284b7.camel@icenowy.me>
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

SGkgSWNlbm93eSwgCgpPbiAxNzowMCBGcmkgMTggU2VwICAgICAsIEljZW5vd3kgWmhlbmcgd3Jv
dGU6Cj4g5ZyoIDIwMjYtMDktMTjkupTnmoQgMDI6NDAgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPv
vJoKPiA+IMKgIFNwYWNlbWlUJ3MgUE1VIChQb3dlciBNYW5hZ2VtZW50IFVuaXQpIGNvbnNpc3Qg
b2Ygc2V2ZXJhbCBwb3dlcgo+ID4gZG9tYWlucwo+ID4gd2hpY2ggY2FuIGJlIG1hbmFnZWQgaW5k
ZXBlbmRlbnRseSwgZGVwZW5kaW5nIG9uIGRpZmZlcmVudAo+ID4gYXBwbGljYXRpb24KPiA+IHNj
ZW5hcmlvLCBlYWNoIGRvbWFpbiBjYW4gYmUgcG93ZXJlZCBvbi9vZmYgZm9yIHNhdmluZyBwb3dl
ci4KPiA+IAo+ID4gwqAgVGhlIGRyaXZlciBpcyBpbXBsZW1lbnRlZCBiYXNlZCBvbiBMaW51eCBH
ZW5lcmljIFBNIERvbWFpbgo+ID4gZnJhbWV3b3JrLgo+ID4gRnJvbSBhIGhhcmR3YXJlIHBlcnNw
ZWN0aXZlLCBlaXRoZXIgb2YgdHdvIGRpc3RpbmN0IHBvd2VyLW9uCj4gPiBzZXF1ZW5jZXMKPiA+
IGFyZSBzdXBwb3J0ZWQsIGluIHNvZnR3YXJlIG1vZGUgKFNXIG1vZGUpLCB0aGUgZHJpdmVyIGlz
IHJlc3BvbnNpYmxlCj4gPiBmb3IKPiA+IGNvbnRyb2xsaW5nIHRoZSBzdGF0ZXMgb2YgYml0cyBz
dWNoIGFzIHNsZWVwMSwgc2xlZXAyLCBpc29sYXRpb24gYW5kCj4gPiBwd3Jfc3RhdGUsIHdoaWxl
IGluIGhhcmR3YXJlIG1vZGUgKEhXIG1vZGUpLCB0aGUgUE1VIGhhcmR3YXJlIHdpbGwKPiA+IGNv
bXBsZXRlCj4gPiB0aGUgc2VxdWVuY2UgYXV0b21hdGljYWxseSB3aXRob3V0IHJlcXVpcmluZyBz
b2Z0d2FyZSBpbnRlcnZlbnRpb24uCj4gCj4gSSB0aGluayB0aGVyZSBhbHNvIGV4aXN0cyBzb2x1
dGlvbnMgZm9yIEszIHRoYXQgdXNlcyBSUE1JIHBvd2VyCj4gZG9tYWlucywgYW5kIGxldCB0aGVp
ciBFU09TIGZpcm13YXJlIHRvIGFjY2VzcyB0aGUgaGFyZHdhcmUuCj4gClllcywgSSdtIGF3YXJl
IG9mIHRoYXQKCj4gV2hhdCdzIHRoZSByZWxhdGlvbnNoaXAgb2YgdGhpcyBpbXBsZW1lbnRhdGlv
biB3aXRoIHRoZSBFU09TCj4gaW1wbGVtZW50YXRpb24/IFNob3VsZCB0aGUgRVNPUyBwYXJ0IGJl
IGRpc2FibGVkIHRvIHVzZSB0aGlzCj4gaW1wbGVtZW50YXRpb24/Cj4gCkkgc2hvdWxkIHNheSwg
aXQncyBhIG11dHVhbGx5IGV4Y2x1c2l2ZSBzb2x1dGlvbiwgc28geWVzLCB0aGUgRVNPUyBwYXJ0
CnNob3VsZCBiZSBkaXNhYmxlZCBpbiBvcmRlciB0byB1c2UgdGhpcyB2ZXJzaW9uCgpUaGUgbW90
aXZhdGlvbiBvZiB0aGlzIHBhdGNoIGlzIHRyeWluZyB0byBzdXBwb3J0IGRybS9kaXNwbGF5IGRy
aXZlcidzClBNIHJlcXVpcmVtZW50LCB3aGlsZSBhdm9pZCBnb2luZyB3aXRoIHZlbmRvcidzIGNv
bXBsaWNhdGVkIFJQTUkgc29sdXRpb24Kd2hpY2ggaXNuJ3QgbWFpbmxpbmUgcmVhZHkKCi0tIApZ
aXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
