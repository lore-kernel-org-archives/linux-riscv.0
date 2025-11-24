Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA956CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vRRx7BKYOpf9rGVWL8iDm9lyQrnYhKbIdYUoMdB//w=; b=Dq7/nQ79firuTt
	YWRdoamITAVt8I1dHuMC4FJzNbr6LETJgvRaHHbVdD+RZ+9Fr/4l8VsEvCDk9XfPz5xaEAH0n6HiE
	5lV5+WWO5OwUtxZKpYYlnfWr9Es+P/UjEyOnDp+nUnlzoa9QR1NCPDeOJtVw9cver0Ppwj/GnMmsT
	dYodsfe6CFvPoR+eX3dDQ66afPfJGcczUEE/dCj9OOP4EDSh76QkfsFUV/Qy49jU5jATV5PhLt7eP
	oxy9a8jXQDlGLJhaMRbMU+8FxZ3u9aOxzJVJsh7Dxd7Pl65imQ8hQM3YeBW95wJywLGo/C6QAMhSP
	UnS8PbT6ion7AjjKikCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUSB-0000000BWtD-2ywc;
	Mon, 24 Nov 2025 11:09:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUS9-0000000BWsW-1TFZ
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 11:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9248C4383D;
	Mon, 24 Nov 2025 11:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC58C4CEF1;
	Mon, 24 Nov 2025 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763982592;
	bh=gPHrEfRpBYcJQFCAIEhRO0jHSzp5CJc+al28X0wZFOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H/xS5WVUORZR8PEbfQ6ea2AYAI+MUWKQM/vAozKQ4vt2V+vfSWYqYfVVqEFEBYBwK
	 uOi2rdsxX5qob2SPQcPqxe6PiSUWBS8zzd5YWDwRFDaoc3jEGdDd0R5S/E/uh6y2Op
	 kCfnuDH6YhdGrZpwZvQBao1fzSMLa7pXpOjz8HTAoUn6SJ3oTmV4zNFJE9bh5uRbNZ
	 Zsz1M7lXLWDI1OVA5dTk/UF9xRQOQpEyzjixXsMjfGhxYUumnF+dphIrtwU+FC95mM
	 3HfWmHVoGLUN/hZWuREynZixfIr1TDRd+0MiLHSOSdt3RLwGs1SyjrsQB/aHgCovBr
	 SWPkzo6LG7+Fw==
Message-ID: <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
Date: Mon, 24 Nov 2025 12:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030953_435678_DA8395BE 
X-CRM114-Status: GOOD (  14.75  )
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

T24gMjQvMTEvMjAyNSAxMjowNCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NOaYn+acn+S4gOeahCAxMjowMSArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjQvMTEvMjAyNSAxMTo1MiwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IFZlcmlzaWxp
Y29uIGhhcyBhIHNlcmllcyBvZiBkaXNwbGF5IGNvbnRyb2xsZXJzIHByZWZpeGVkIHdpdGggREMK
Pj4+IGFuZAo+Pj4gd2l0aCBzZWxmLWlkZW50aWZpY2F0aW9uIGZhY2lsaXR5IGxpa2UgdGhlaXIg
R0Mgc2VyaWVzIEdQVXMuCj4+Pgo+Pj4gQWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgaXQu
Cj4+Pgo+Pj4gRGVwZW5kcyBvbiB0aGUgc3BlY2lmaWMgREMgbW9kZWwsIGl0IGNhbiBoYXZlIGVp
dGhlciBvbmUgb3IgdHdvCj4+PiBkaXNwbGF5Cj4+PiBvdXRwdXRzLCBhbmQgZWFjaCBkaXNwbGF5
IG91dHB1dCBjb3VsZCBiZSBzZXQgdG8gRFBJIHNpZ25hbCBvciAiRFAiCj4+PiBzaWduYWwgKHdo
aWNoIHNlZW1zIHRvIGJlIHNvbWUgcGxhaW4gcGFyYWxsZWwgYnVzIHRvIEhETUkKPj4+IGNvbnRy
b2xsZXJzKS4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5t
ZT4KPj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFj
LmNuPgo+Pgo+PiBXcm9uZyBEQ08gY2hhaW4gb3JkZXIuIFlvdSBzZW5kIGl0IGFzIGljZW5vd3ku
bWUsIHNvIHRoaXMgbXVzdCBiZQo+PiBsYXN0Cj4+IFNvQi4gVGhpcyBpZGVudGl0eSBpcyB0aGUg
bGFzdCBvbmUgY2VydGlmeWluZyBEQ08uIFBsZWFzZSBraW5kbHkgcmVhZAo+PiBzdWJtaXR0aW5n
IHBhdGNoZXMsIHNvIHlvdSBrbm93IHdoYXQgeW91IGFyZSBjZXJ0aWZ5aW5nIGhlcmUuCj4gCj4g
V2VsbCBJIG1hcHBlZCB0aGUgQGlzY2FzLmFjLmNuIG1haWwgdG8gdGhlIEBpY2Vub3d5Lm1lIG9u
ZSBpbiB0aGUgbGFzdAo+IHBhdGNoLgo+IAo+IE9yIG1heWJlIEkgc2hvdWxkIG1ha2UgaXQgdGhl
IGZpcnN0IHBhdGNoPwoKLm1haWxtYXAgaGFzIGVmZmVjdCBvbiBiNCBhbmQgZ2l0IHNlbmQtZW1h
aWwsIHNvIG1heWJlIHRoYXQncyB0aGUKYW5zd2VyLiBUaGUgcHJvYmxlbSBpcyB0aGF0OgoxLiBU
aGlzIGVtYWlsIGhhcyBzZW5kZXIgYWRkcmVzcyBAaWNlbm93eS5tZQoyLiBJdCdzIFNvQiBpcyBu
b3QgdGhlIGxhc3Qgb25lLgoKVGhpcyBuZWVkcyB0byBiZSBmaXhlZC4gVGhlIG9yZGVyIG9mIHBh
dGNoZXMgZm9yIG1lIGRvZXMgbm90IG1hdHRlciwgSQpkb24ndCB0aGluayBpdCB3b3VsZCBmaXgg
dGhlIGlzc3VlIGhlcmUgZWl0aGVyLgoKQW55d2F5LCBwbGVhc2UgdHJpbSB5b3VyIHJlc3BvbnNl
cywgc28gSSB3aWxsIG5vdCBoYXZlIHRvIHNjcm9sbCB0aHJvdWdoCmxpbmVzIG9mIGNvZGUgdG8g
ZmluZCB0aGF0IHlvdSBkaWQgbm90IHJlc3BvbmQgdGhlcmUuCgoKCkJlc3QgcmVnYXJkcywKS3J6
eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
