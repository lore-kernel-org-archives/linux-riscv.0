Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF34D1039D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caVNBlP3ESttctFOaXUShaWzg8hSKEUYvpCe1aLnNtg=; b=A9rWpnexqWzxWf
	B/cynNesHdumujH1Z9E0ojdo+V6MH1JH/ZkavbUvKouvSPnlYM8KkLQ+wQn3UWsY3A5aEvkFJV8c4
	FUSNozjLeC9nOuvExhkbJs2K3meUmcxDU/09ExaBUnqScyLo30Lab4tPZEdCGPeHPMUWdEsyfIVLP
	qC5aPu4qYzvN8DHUUufJlyrSaYoArm7XYKkuNocNMYa3rR3PQHK969wmQb0mgJy2l9BHOZfM63rcU
	BgwjJTsCin5iO4GBkkcY/5wyBvQqls7WC43HrzYkU38Ag8MYUC68wTCJNPjJXHbisf0H6t0bJAFTP
	qxeg4xmcqDfFEWnOirPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCfo-0000000Em70-15R6;
	Wed, 26 Nov 2025 10:22:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCfm-0000000Em6U-17AH
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 10:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B98643EB6;
	Wed, 26 Nov 2025 10:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C9FC113D0;
	Wed, 26 Nov 2025 10:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764152573;
	bh=yApvlgYFAq8V1I0DJfjfzUtWA2HTkUFR9FtEgwOym40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tq5AOqx9UHeBxhDK48rQ2ZO6G4cleQjzcs8UeBfn9vu2joql4xBcRe1OiYkX1IwgV
	 3gVt+8mazMAPIGODasAJwMIJ9GwD4ZSCMP3YdQFYw7PYr3g+1ulSqm6NDA/j0+sp3m
	 LuQy3+1eL6uR8V8wrWlmG8TWAAXwEAdjTTtBCxNpi+vhqUZdaesVsO0Khb9RSqbfnQ
	 93BWGXRF7nagFTOovb+Dt+I/0iEem+r6eEqoRxocxGf/llGMw+eLJDWPK4Bdsav6QT
	 L42XWmcTGAEFWjhYDe6N0ZtGsp9H7gaabwQQH+eGe2Nhm6601zjzsIHdRkMlxtvl7o
	 6IrdzQJbSzESw==
Message-ID: <0b7ba974-d8d5-4417-8182-3e9299315058@kernel.org>
Date: Wed, 26 Nov 2025 11:22:45 +0100
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
 <544ae21cc1b5f488d03a5650d9275ff22b237d63.camel@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <544ae21cc1b5f488d03a5650d9275ff22b237d63.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_022254_382691_96A5BBD1 
X-CRM114-Status: GOOD (  16.55  )
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

T24gMjYvMTEvMjAyNSAxMDo1MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+ICttYWludGFpbmVy
czoKPj4+ICvCoCAtIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+Pj4gKwo+Pj4gK3By
b3BlcnRpZXM6Cj4+PiArwqAgJG5vZGVuYW1lOgo+Pj4gK8KgwqDCoCBwYXR0ZXJuOiAiXmRpc3Bs
YXlAWzAtOWEtZl0rJCIKPj4+ICsKPj4+ICvCoCBjb21wYXRpYmxlOgo+Pj4gK8KgwqDCoCBpdGVt
czoKPj4+ICvCoMKgwqDCoMKgIC0gZW51bToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSB0aGVh
ZCx0aDE1MjAtZGM4MjAwCj4+PiArwqDCoMKgwqDCoCAtIGNvbnN0OiB2ZXJpc2lsaWNvbixkYwo+
Pgo+PiBJIGRvIG5vdCBzZWUgYW55IGV4cGxhbmF0aW9uIG9mIGV4Y2VwdGlvbiBmb3IgZ2VuZXJp
YyBjb21wYXRpYmxlcywKPj4gbWF5YmUKPj4gZXhjZXB0ICJzZWxmLWlkZW50aWZpY2F0aW9uIiBy
ZW1hcmsuIFJvYiBhbHJlYWR5IHBvaW50ZWQgdGhpcyBvdXQsIHNvCj4+IGJlCj4+IGV4cGxpY2l0
IGluIGNvbW1pdCBtc2cgd2h5IHlvdSBhcmUgdXNpbmcgYSBnZW5lcmljIGNvbXBhdGlibGUuCj4g
Cj4gV2VsbCBJIG9ubHkgZ2V0IHRoZSBtZWFuaW5nIG9mICJhIFNvQyBzcGVjaWZpYyBjb21wYXRp
YmxlIGlzIHJlcXVpcmVkIgo+IGluIGhpcyByZXZpZXcgbWVzc2FnZS4KPiAKPiBJIHRoaW5rIG15
IGJpbmRpbmcgbm93IHJlcXVpcmVzIGJvdGggYSBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZSBhbmQg
YQo+IGdlbmVyaWMgY29tcGF0aWJsZSwgd2hpY2ggc2hvdWxkIGJlIG9rYXkgdG8gc2F0aXNmeSBS
b2IncyBvcmlnaW5hbAo+IHJldmlldy4KCllvdSB3aWxsIGdldCB0aGVuIHRoZSBzYW1lIHF1ZXN0
aW9ucyBmb3IgbWUgLSB3aGF0IGp1c3RpZmllcyBnZW5lcmljCmNvbXBhdGlibGUuIFlvdSBzaG91
bGQgYmUgb24gdGhpcyBleHBsaWNpdCwgYmVjYXVzZSBvdGhlcndpc2UgcGVvcGxlCm1pc2ludGVy
cHJldCBzb21lIGNvbW1pdHMgYW5kIHBhdGNoZXMsIGFuZCB0aGV5IHRoaW5rIHRoZSBnZW5lcmlj
CmNvbXBhdGlibGUgaXMgYWxsb3dlZCBmb3IgdGhlbSBhcyB3ZWxsLgoKPiAKPj4KPj4+ICsKPj4+
ICvCoCByZWc6Cj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+PiArCj4+PiArwqAgaW50ZXJydXB0
czoKPj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4+ICsKPj4+ICvCoCBjbG9ja3M6Cj4+PiArwqDC
oMKgIG1pbkl0ZW1zOiA0Cj4+Cj4+IFRoaXMgaXMgbm90IGZsZXhpYmxlLiBEZXZpY2UgZWl0aGVy
IGhhcyBvciBoYXMgbm90IHRoZXNlIGNsb2Nrcy4KPiAKPiBUaGUgZXhpc3RlbmNlIG9mIGFsbCB0
aGVzZSBjbG9ja3MgYXJlIHZlcmlmaWVkIGJ5IGRpYWdyYW1zIGluIG1hbnVhbHMKClNvIG5vdCBm
bGV4aWJsZSwgdGhlbjoKCj4gb2YgdHdvIGRpZmZlcmVudCBTb0NzIHdpdGggREM4MjAwIChULUhl
YWQgVEgxNTIwIGFuZCBTdGFyRml2ZSBKSDcxMTApLgo+IAo+IE1heWJlIGEgZXhwbGljaXQgYG1h
eEl0ZW1zOiA1YCBpcyBuZWVkZWQgaGVyZSwgYnV0IGFzIG15IERUIHBhc3Nlcwo+IGR0YnNfY2hl
Y2ssIEkgZG9uJ3QgdGhpbmsgaXQncyBuZWNlc3Nhcnk/CgpObywgZHJvcCBtaW5JdGVtcyBvbmx5
LgoKPiAKPiBPciBtYXliZSBJIHNob3VsZCBkcm9wIHRoZSBmbGV4aWJpbGl0eSBub3cgYW5kIHVz
ZSBhIGBtaW5JdGVtczogNWAgaGVyZQo+IChhbmQgbGVhdmUgREM4MDAwIHN1cHBvcnQgYXMgYW5v
dGhlciBzdG9yeSk/IChUaGUgRXN3aW4gRUlDNzcwMCBtYW51YWwKPiBkb2VzIG5vdCBoYXZlIGEg
ZGlhZ3JhbSBzaG93aW5nIGV4dGVybmFsIGNvbm5lY3Rpb25zIG9mIHRoZSBEQywgbGlrZQo+IHRo
ZSB0d28gU29DcyBJIG1lbnRpb25lZCBhYm92ZSkuCgpZb3UgZG9jdW1lbnQgaGVyZSBvbmx5IHRo
ZSBkZXZpY2VzIGV4cGxpY2l0bHkgbWVudGlvbmVkIGluIHRoZSBiaW5kaW5nLgpZb3UgY2Fubm90
IGFkZCBoZXJlIGNvbnN0cmFpbnRzIG9yIGNsb2NrcyBmb3Igc29tZSBkZXZpY2Ugd2hpY2ggaXMg
bm90CmluIHRoZSBiaW5kaW5nIGFuZCBJIHNlZSBvbmx5IHRoMTUyMCBpbiB0aGUgYmluZGluZy4K
CkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
