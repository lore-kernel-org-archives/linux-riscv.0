Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCA5CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjso6+KzyAgtg8tlkCJMBvmbAvhwdeMCINd7KzAXGvU=; b=itErJZ/sHoPJrW
	6EbJ+8kq3DiZAMOB4p7aRsXe0ZggjEkU6VII80BKszdTVIM23PIi5n6eWfA37R+oUh3tcc4OPvs9Z
	/aWjUd83ryOimrPbzca/zfnwVTLVU5uZzFgP/GNvr/KQaaTeWPQ11OvtYskoB/pNiq86eMXCjMOm+
	ePoxFj2YPuiPAzi+Ly/hGKBZNsttYT3c/32PjEE1MQj4mVGFzT9ojtTzE/pmr1SsKppN1r5Jwqdmc
	uuheVlXsgje8gWEPN6gEmmyjd8MWz3ut+lmnc8A1Hv2CTW4zSlC1fpOCBxqyMtiACYPIG3WVXtLVy
	xMrZsgPzGkzh+K4mLglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaYm-0000000C7IF-3kRD;
	Mon, 24 Nov 2025 17:41:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaYh-0000000C7HS-31ks
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 17:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0C1C435B6;
	Mon, 24 Nov 2025 17:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA6EC4CEF1;
	Mon, 24 Nov 2025 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764006062;
	bh=zoUtfR4SGz2BKH5rplabaIYt5wL/apUOQkw2wk/1OPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LbrBvBXB7UWI52i0M3DMRx/Wji5wN5f77e8Kd1eSTD9uFjyDa76CcLwRNr/NyKVVF
	 5eyYHftmnNui+FbyEWO7FEpbRP4kSo6ROJYwFiaGSsPlGBL/1mZv6jyVoMQ8HgBJRk
	 LjhpKlXkjh7hkrx9hwpsCzyUA8bkkA4zyk1OyOaXn0wsD9J3L5yo1/fGRppwXZFQw+
	 u45t6xpTknFIvovZbxiWtyF+SZ3D97PzA1Lb2bcG0ZjX+b60cFgnILfU/6f7PK+9l2
	 M5AjZKYHhpnOyNpgeQBdBDGRxy/XLGQFsJljINK9K7NG6H9XIB5mvMA7hHNErxBLLg
	 VFA/0X+hK/5ZQ==
Message-ID: <ee1e4f94-ff9a-4227-b705-74a7eb806ff0@kernel.org>
Date: Mon, 24 Nov 2025 18:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>, Conor Dooley <conor@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
 <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
 <6ceb41bc-0597-4ea5-84be-51f53e3bc2d8@kernel.org>
 <20251124-said-overvalue-8a8f49d6c99d@spud>
 <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
 <20251124-pulp-pound-a2b6d749dcfc@spud>
 <390caea1-bc75-4cde-bd6d-9bc15a12f32d@kernel.org>
 <a8089e458bdf6fbad45cd6be838b4cf75396918f.camel@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a8089e458bdf6fbad45cd6be838b4cf75396918f.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_094103_799592_543B723B 
X-CRM114-Status: GOOD (  10.82  )
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

T24gMjQvMTEvMjAyNSAxNjoyNSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NOaYn+acn+S4gOeahCAxMzozMSArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjQvMTEvMjAyNSAxMzoyMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4gT24gTW9uLCBO
b3YgMjQsIDIwMjUgYXQgMDE6MDg6MDBQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraQo+Pj4g
d3JvdGU6Cj4+Pj4gT24gMjQvMTEvMjAyNSAxMzowNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+
Pgo+Pj4+PiBJIGRvbid0IHJlYWxseSBnZXQgd2hhdCB0aGUgZnVzcyBpcyB3aXRoIHRoZSBkdWFs
IHNpZ25vZmYsCj4+Pj4+IHdoYXQncyB0aGUKPj4+Pj4gcG9pbnQgaGF2aW5nIGJvdGggd2hlbiB0
aGV5IHJlcHJlc2VudCB0aGUgc2FtZSBwZXJzb24/IFByZXR0eQo+Pj4+PiBzdXJlIGl0Cj4+Pj4+
IHdhcyB5b3UgKEtyenlzenRvZikgYW5kIEFybmQgdGhhdCB0b2xkIG1lIG5vdCB0byBib3RoIGRv
aW5nIHRoZQo+Pj4+PiBkb3VibGUKPj4+Pj4gc2lnbm9mZi4KPj4+Pgo+Pj4+IEkgZG8gbm90IG9i
amVjdCBoYXZpbmcgb3Igbm90IGhhdmluZyBkdWFsIHNpZ25lZCBvZmYgSEVSRS4KPj4+Pgo+Pj4+
IEkgbmV2ZXIgc2FpZCB0aGF0LiBKdXN0IGxpa2UgSSBuZXZlciBzYWlkICJGcm9tIiBoYXMgdG8g
YmUKPj4+PiBjaGFuZ2VkLgo+Pj4KPj4+IEkgZGlkbid0IHNheSB5b3Ugb2JqZWN0ZWQgdG8gYm90
aCBiZWluZyB0aGVyZS4gKkkqIGFtIHNheWluZyB0aGF0Cj4+PiBpdCBpcwo+Pgo+PiBBaCwgc3Vy
ZS4gWWVzLCBpZiBib3RoIGlkZW50aXRpZXMgd29yayBJIHdvdWxkIHByb3Bvc2UgdG8gc2tpcCBz
ZWNvbmQKPj4gU29CLiBCdXQgSSBhbHNvIHN0b3BwZWQgb2JqZWN0aW5nIG9mIGhhdmluZyB0d28g
aWRlbnRpdGllcyBsaXN0ZWQsIGFzCj4+IGxvbmcgYXMgdGhleSBhcmUgY29ycmVjdC4KPiAKPiBX
ZWxsIGl0J3MgdW5mb3J0dW5hdGUgdGhhdCBzb21lIHBvbGljeSBub3cgcmVxdWlyZXMgbWUgdG8g
bGlzdCB0aGUKPiBzZWNvbmQgaWRlbnRpdHkuCgpObyBwb2xpY3kgYXNrZWQgeW91Li4uCgo+IAo+
IFNob3VsZCBJIHJlc2VuZCB0aGUgd2hvbGUgcGF0Y2hzZXQgd2l0aCB0aGUgSVNDQVMgbWFpbD8K
CllvdSBjYW4sIGl0IHByb2JhYmx5IHdvdWxkIHNvbHZlIHRoZSBpc3N1ZSwgdW5sZXNzIHlvdSBj
aGFuZ2UgdGhlCmF1dGhvciwgYnV0IHdoeSB5b3UgY2Fubm90IGRvIHdoYXQgSSBhc2tlZCBhdCB0
aGUgYmVnaW5uaW5nIC0gc2V0CmNvcnJlY3Qgb3JkZXIgb2YgU29Ccywgc28gdGhlIEBpY2Vub3d5
Lm1lIGJlaW5nIHRoZSBsYXN0PwoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
