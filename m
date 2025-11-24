Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F761CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jCczyq5r3auCsityKNT3ovnfLnKPkwW/onXOeyZqcw=; b=2d/ou1agen+X/j
	a/W4ov0RzcPwhYdkUsQ3I3cY5GDTRnuzu/BfA9R2QL1rJOjVCN0EgwoBL8/JK+gVV4xT7cK7DcufY
	lp1NUrOAYD9HfEfJqzDuCQBg31JdgB2Am0hUkrxhfnhAHzEwWMBGKJyTQAknbpMJxsNMHmjgQORrm
	kHFveEv4kutXe2z0/ee/Sx+HXmWZ5jGkczQNRN9WF1QHj6m13+5NtPv/5XZK8NjTb3ADTUOEn6myZ
	QwyQSQY9dapTr9vsxeX4XsdYWb7Hm1Ug8xmnvpbMDBEleDW4DCRlqRZ1+5kCfKIUVaGaE0HGdWfbd
	ePIsRIycSmRzZ6CLydUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaXQ-0000000C7AY-210W;
	Mon, 24 Nov 2025 17:39:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaXP-0000000C7AQ-0LmI
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 17:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ECD46016B;
	Mon, 24 Nov 2025 17:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37583C4CEF1;
	Mon, 24 Nov 2025 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764005981;
	bh=a/dt3SO0IBMPj/ZOG+botHjprn85wxhaFe5Ue9Kxg1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fIoO1afYA8NKsyxJwtO2RCIaR4mTKYx07g+3YPaDFb3cghv5WctAgyUiQq4WevK8L
	 3XcoWIem/vQObIj81EEWaoALnsF/Ice6yZ35tKRLWsq+/9/DOPMCCA6kgcdjbxLNsv
	 ggVDrbei64+ecVzOOFEPiI8aSyXtZk/Asshh+kmz9VxYcpnNuSpBhpREZI5AvJMzU7
	 pHdYgV/FMuidVydA+sYtM9HwA/1pLW5CxYPF3dhmzwWyw+yFc1mfL8DeFPmD714VsX
	 ktvWf5mtpM9U+k7rucyVAHtMaxGxMlHSaPd0LbzwtyHlsEacjGU+aMB/7IEHL8myiI
	 8LW5U8kWOZung==
Message-ID: <d578fc15-261b-456d-9887-f15417084943@kernel.org>
Date: Mon, 24 Nov 2025 18:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Verisilicon DC8200 driver (and adaption to TH1520)
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
 <374aa38b-c16f-46da-985e-266fdfb4c717@kernel.org>
 <24a3104c9879519c70554510766aba98afd663e7.camel@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <24a3104c9879519c70554510766aba98afd663e7.camel@icenowy.me>
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

T24gMjQvMTEvMjAyNSAxNjoyMywgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NOaYn+acn+S4gOeahCAxMTo1NyArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjQvMTEvMjAyNSAxMTo1MiwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+IFRoaXMgcGF0
Y2hzZXQgdHJpZXMgdG8gYWRkIGEgZHJpdmVyIGZvciBWZXJpc2lsaWNvbiBEQzgyMDAgZHJpdmVy
LAo+Pj4gYW5kCj4+PiBkZW1vbnN0cmF0ZXMgdGhlIGRyaXZlciBvbiBULUhlYWQgVEgxNTIwIHdp
dGggaXRzIEhETUkgb3V0cHV0Lgo+Pj4KPj4+IFRoaXMgZGlzcGxheSBjb250cm9sbGVyIElQIGlz
IHVzZWQgb24gU3RhckZpdmUgSkg3MTEwIHRvbywgYnV0IGFzCj4+PiB0aGUKPj4+IEhETUkgY29u
dHJvbGxlciB1c2VkIHRoZXJlIGlzbid0IGFzIGNvbW1vbiBhcyB0aGUgRGVzaWduV2FyZSBvbmUs
IEkKPj4+IGNob29zZSB0byB1c2UgVEgxNTIwIGluIHRoaXMgcGF0Y2hzZXQuCj4+Cj4+Cj4+IFRo
YXQncyBhIHYzLCBzbyBwbGVhc2Uga2luZGx5IGFsd2F5cyB3cml0ZSBjaGFuZ2Vsb2cuCj4gCj4g
V2VsbCBJIGxpc3QgY2hhbmdlcyBpbiBhbGwgaW5kaXZpZHVhbCBjb21taXRzLgo+IAo+IFNob3Vs
ZCBJIG1lcmdlIHRoZW0gdG8gdGhlIGNvdmVyIGxldHRlciB0aGUgbmV4dCB0aW1lPwoKTm8sIGl0
J3MgcGVyZmVjdGx5IGZpbmUsIEkgZG9uJ3Qga25vdyB3aHkgSSBkaWQgbm90IHNlZSB0aGVtLiBT
b3JyeSBmb3IKdGhlIG5vaXNlLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
