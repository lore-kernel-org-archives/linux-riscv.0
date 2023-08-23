Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BACEE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8LQJsrx1OVfDrXZuwndlqelojz4liPzCw/q2QUVTnc=; b=0EM6WmqpXGZES2
	IRNsfGCCA1GTQ/GJdxFDu5tDYRfdgjYnwZWA3oxTSp4Xm3YPLhSC8t/zlk5OAoPmY5y0kpyOaX8fT
	Y3Spudnk1mar2CM00JA8s7cKiyLPFuv/FrOrtKkhiUpoPlyZMaOWStNRmW0a8i4ePF0o0vZkyJgU7
	5OCan31B1ZcVOVJme3WaDVG+NgqhIA4JXddUz93y6smewpA5Ygce80m+FXNWogOpLDsMLor4xacS6
	Ruwn+DQzx+3gzV3CV5FE7HrZiu+qdOmB3+jLJ+/b2L4ZR5bKJ5DJYgoOd7jgoISuxub/kxm7mc1/w
	zlCKpZLmJtgiKtLuK/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYiex-00HVeZ-27;
	Wed, 23 Aug 2023 07:52:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYieu-00HVdN-37
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 07:52:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 301B160C28;
	Wed, 23 Aug 2023 07:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09211C433C8;
	Wed, 23 Aug 2023 07:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692777127;
	bh=RrVC+nogoaZgt/Y3jUBheREnMWxpQIF1TAB30x8RvjE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dEj3Lzw7hAZZPCtkp0+9x+e7toz8Q2K8csXTxCu+eAk9U9sFpYDr7Hi16kGUZ0pNB
	 ht5J8RxLaEGJPvXxfRukfSwVoO7vRtix56SNNwECn25lHhNgE9vU24qrvCd208dz7T
	 76uBf2Mebi5yxvxXz7R6dGM55lIQOqIFGYlbEKMjmF88j1htqj6KYHq4Nh23NQ7d/V
	 f2PG+nFdRscJGXFoCaEx3MgWhO08K8n+MQFXhgpH/UmmPd4tyTHLORNWzCGw67gjWU
	 zGqIHsdO3XdCnMqsrXC+Uji5UgNFn34BKtMO4cavSTSZpC54Ef8gSQjhIhha6zEyX0
	 SwgVZY6Oif3sw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Aug 21 (riscv-64 asm)
In-Reply-To: <877cpmxl95.fsf@all.your.base.are.belong.to.us>
References: <20230821164605.7bac05f1@canb.auug.org.au>
 <5ebf04f8-0cf6-d2b4-fb73-f51fff421b3a@infradead.org>
 <87ttsr33a8.fsf@all.your.base.are.belong.to.us>
 <0111b49a-8cdf-2c1a-bab3-d1fd647aafa6@infradead.org>
 <87bkeyxmzx.fsf@all.your.base.are.belong.to.us>
 <877cpmxl95.fsf@all.your.base.are.belong.to.us>
Date: Wed, 23 Aug 2023 09:52:04 +0200
Message-ID: <87r0nu19i3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_005209_087561_82B940CC 
X-CRM114-Status: GOOD (  14.48  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4KPj4gUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+IHdyaXRlczoKPj4KPj4+IEhpLAo+Pj4KPj4+IE9uIDgvMjIvMjMgMDE6MTEs
IEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+Pj4gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVh
ZC5vcmc+IHdyaXRlczoKPj4+PiAKPj4+Pj4gT24gOC8yMC8yMyAyMzo0NiwgU3RlcGhlbiBSb3Ro
d2VsbCB3cm90ZToKPj4+Pj4+IEhpIGFsbCwKPj4+Pj4+Cj4+Pj4+PiBDaGFuZ2VzIHNpbmNlIDIw
MjMwODE4Ogo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gLi4vYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzog
SW4gZnVuY3Rpb24gJ2RvX2lycSc6Cj4+Pj4+IC4uL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6
Mzg0OjE6IGVycm9yOiBzMCBjYW5ub3QgYmUgdXNlZCBpbiAnYXNtJyBoZXJlCj4+Pj4+ICAgMzg0
IHwgfQo+Pj4+PiAgICAgICB8IF4KPj4+Pj4gLi4vYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmM6IElu
IGZ1bmN0aW9uICdkb19zb2Z0aXJxX293bl9zdGFjayc6Cj4+Pj4+IC4uL2FyY2gvcmlzY3Yva2Vy
bmVsL2lycS5jOjk0OjE6IGVycm9yOiBzMCBjYW5ub3QgYmUgdXNlZCBpbiAnYXNtJyBoZXJlCj4+
Pj4+ICAgIDk0IHwgfQo+Pj4+PiAgICAgICB8IF4KPj4+Pj4KPj4+Pj4KPj4+Pj4gMiBvdXQgb2Yg
MTAgcmlzYy12IDY0LWJpdCBidWlsZHMgZmFpbGVkIHdpdGggdGhlc2UgZXJyb3JzLgo+Pj4+Pgo+
Pj4+PiBJcyB0aGlzIGEgdG9vbGNoYWluIHByb2JsZW0gb3Igc29tZXRoaW5nIGVsc2U/Cj4+Pj4g
Cj4+Pj4gSG1tLCBkbyB5b3UgaGF2ZSBhIGxpbmsgdG8gY29uZmlnL3Rvb2xjaGFpbi9sb2csIG9y
IHNpbWlsYXI/Cj4+Pgo+Pj4gVGhlIGZ1bGwgcmFuZGNvbmZpZyBmaWxlIGlzIGF0dGFjaGVkLgo+
Pj4KPj4+IFRoZSB0b29sY2hhaW4gaXMgQXJuZCdzIGJ1aWxkIG9mIGdjYyAxMy4xLjAgZnJvbToK
Pj4+ICAgaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvdG9vbHMvY3Jvc3N0b29s
Lwo+Pj4gKHg4Nl82NCBob3N0KQo+Pj4KPj4+IEhtLCBJIHNlZSB0aGF0IHRoZSBsYXRlc3QvY3Vy
cmVudCB0aGVyZSBpcyBnY2MgMTMuMi4wLgo+Pj4gSSdsbCB1cGdyYWRlIGxhdGVyIHRvZGF5Lgo+
Pgo+PiBUaGFua3MgUmFuZHkhIEkgY2FuIHJlcHJvZHVjZSB3aXRoIEdDQyAxMiBvbiBteSBtYWNo
aW5lLgo+Pgo+PiBUaGUgY29uZmlnIGhhcwo+PiAgfCAjIENPTkZJR19GUkFNRV9QT0lOVEVSIGlz
IG5vdCBzZXQKPj4gYnV0IGZvciBzb21lIHJlYXNvbiAiLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIi
IGlzIHBhc3NlZCB0byBHQ0MgYW55d2F5LAo+PiB3aGljaCBpcyB3aHkgR0NDIGNvbXBsYWlucyBh
Ym91dCBzMCAoRlAgb24gUklTQy1WKSBpbiBhc20uCj4+Cj4+Cj4+IEknbGwgZGlnIGEgYml0IG1v
cmUuCj4KPiBUaGVyZSBhcmUgbXVsdGlwbGUgaXNzdWVzOgo+ICAqIHJpc2N2IGVuYWJsZXMgLWZu
by1vbWl0LWZyYW1lLXBvaW50ZXIgdW5jb25kaXRpb25hbGx5IGZvciBQRVJGX0VWRU5UUwo+ICAq
IENPTkZJR19GVU5DVElPTl9UUkFDRVIgdy9vIGR5bmFtaWMgZnRyYWNlIGVuYWJsZXMgLXBnLCB3
aGljaCBwdWxscyBpbgo+ICAgIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyIG9uIHJpc2N2LgoKTWF5
YmUgc29tZXRoaW5nIGxpa2UgKHRvbyBjcnVkZT8pOgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
S2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCAxMGU3YTdhZDE3NWEuLmNkODA3NWMw
OTJjMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwpAQCAtNjIsNiArNjIsNyBAQCBjb25maWcgUklTQ1YKICAgICAgICBzZWxlY3QgQ09NTU9O
X0NMSwogICAgICAgIHNlbGVjdCBDUFVfUE0gaWYgQ1BVX0lETEUgfHwgSElCRVJOQVRJT04KICAg
ICAgICBzZWxlY3QgRURBQ19TVVBQT1JUCisgICAgICAgc2VsZWN0IEZSQU1FX1BPSU5URVIgaWYg
UEVSRl9FVkVOVFMgfHwgKEZVTkNUSU9OX1RSQUNFUiAmJiAhRFlOQU1JQ19GVFJBQ0UpCiAgICAg
ICAgc2VsZWN0IEdFTkVSSUNfQVJDSF9UT1BPTE9HWQogICAgICAgIHNlbGVjdCBHRU5FUklDX0FU
T01JQzY0IGlmICE2NEJJVAogICAgICAgIHNlbGVjdCBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FE
Q0FTVCBpZiBTTVAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2
L01ha2VmaWxlCmluZGV4IDZlYzZkNTJhNDE4MC4uMTMyOWUwNjBjNTQ4IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKQEAgLTg3LDkgKzg3
LDYgQEAgZW5kaWYKIGlmZXEgKCQoQ09ORklHX0NNT0RFTF9NRURBTlkpLHkpCiAgICAgICAgS0JV
SUxEX0NGTEFHUyArPSAtbWNtb2RlbD1tZWRhbnkKIGVuZGlmCi1pZmVxICgkKENPTkZJR19QRVJG
X0VWRU5UUykseSkKLSAgICAgICAgS0JVSUxEX0NGTEFHUyArPSAtZm5vLW9taXQtZnJhbWUtcG9p
bnRlcgotZW5kaWYKIAogIyBBdm9pZCBnZW5lcmF0aW5nIC5laF9mcmFtZSBzZWN0aW9ucy4KIEtC
VUlMRF9DRkxBR1MgKz0gLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtZm5vLXVud2lu
ZC10YWJsZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
