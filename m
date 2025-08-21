Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F82CA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DKyP+uJdXpm+KbpkfR01WcgZG2mPaYepxIfnAquGDU=; b=DO8PIpHx3lz8p3
	x1AKT3cM73lTJk88CuyE5sNdljPwcBKFfpjhw4MdnyEnPSM0Fjf6nf6lxRAtK2s1uPH4FXuOuBdur
	lqnIwjshG+Et9kgwDonqChHRU2wE0lVTmUlV85PAbQrFlg3z0g2cr1UvfQVpsj2WOCIN9dH/98SS/
	tDtfysQIRQpxRZBk8Ad0+GY/1k5GukctFJyTBymUNLmeNbwtrTfx+2B8IF5t+cRvDDSV3v4QN6ioB
	zm0g2hzXqrhoYyk/DlQ6JDZ2p/Tv17fWU2v9FYRqlh+wcd1E4J/rsAzHaqNNwDL9ILjyo7U2ZQh5C
	C7Q2zngGx9WlHbLIObxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3v5-0000000GpLr-2zAr;
	Thu, 21 Aug 2025 11:57:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1BR-0000000GKt7-0FC7
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 09:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43EDF60200;
	Thu, 21 Aug 2025 09:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71F6C4CEED;
	Thu, 21 Aug 2025 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755766928;
	bh=dVFzBPWCzdNl+r+IY4jDzYJATdF5aoUko5LV3cDF84k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QLZRqdgtZEelsPlMflFm2C3NnPS4QOajGSQyftyVN8kcvf1TV2K0gr1eGV2mCsoWW
	 cB8oGiF0wfjsy41Zd1PHwvcBvRK5JhC+TBgf7KtIz/cxal5P2q5tLtmzjKLIxJdoRn
	 MF+aOO64sRPGY71Cn4iaHdHyFht0NgAyqLzJ43iPY4zzL4Wr3HxiaVzgQ/Nh0UZ8yw
	 zlanym+SivgCFQLpnfv/ds4I45KvaxwbzyYqAMWaz6U67wflZPAz859rjWyT3IndFm
	 YzIH34c6RCS3GJFt3bkElmpU42LHNuhbJx7C6ABfcOz/Untba72/38Hl1JoD/m9dff
	 fU88UzTBGSyfQ==
Message-ID: <4b4f0bbb-c0bd-49c7-a75f-cee71bbd0002@kernel.org>
Date: Thu, 21 Aug 2025 11:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] riscv: dts: eswin: Add clock driver support
To: =?UTF-8?B?6JGj57uq5rSL?= <dongxuyang@eswincomputing.com>,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
References: <20250815093539.975-1-dongxuyang@eswincomputing.com>
 <20250815093754.1143-1-dongxuyang@eswincomputing.com>
 <0ef61f03-0346-491d-ad2a-293e24cbc4a8@kernel.org>
 <3fa3950e.371.198c1770125.Coremail.dongxuyang@eswincomputing.com>
 <bfa23779-9861-4ae4-9ced-9f347394f033@kernel.org>
 <27984d9.51f.198cbcde8d7.Coremail.dongxuyang@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <27984d9.51f.198cbcde8d7.Coremail.dongxuyang@eswincomputing.com>
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

T24gMjEvMDgvMjAyNSAxMDo0NSwg6JGj57uq5rSLIHdyb3RlOgo+Pj4+PiArCQkvKiBmaXhlZCBj
bG9jayAqLwo+Pj4+PiArCQlmaXhlZF9yYXRlX2Nsa19hcGxsX2ZvdXQyOiBmaXhlZC1yYXRlLWFw
bGwtZm91dDIgewo+Pj4+Cj4+Pj4gU3VjaCBwYXR0ZXJuIHdhcyB5ZWFycyBhZ28gTkFLZWQuCj4+
Pj4KPj4+PiBObywgZG9uJ3QgZXZlciBicmluZyBub2RlcyBwZXIgY2xvY2suCj4+Pj4KPj4+IFdl
IGhhdmUgZGVmaW5lZCBhIGxhcmdlIG51bWJlciBvZiBjbG9jayBkZXZpY2VzLsKgCj4+PiBUaGUg
Y29tbWVudCBvZiB2MyBpcyAiRHJpdmVyIGlzIGFsc28gd2F5IHRvbyBiaWcgZm9yIHNpbXBsZSBj
bG9jayBkcml2ZXIgYW5kIEnCoAo+Pj4gYW0gc3VycHJpc2VkIHRvIHNlZSBzbyBtYW55IHJlZHVu
ZGFuY2llcy4iLiBUaGVyZWZvcmUsIHdlIG1vZGlmaWVkIHRoZSBjbG9ja8KgCj4+PiBkcml2ZXIg
Y29kZSBhbmQgbW92ZWQgdGhlIGRlc2NyaXB0aW9uIG9mIGNsb2NrIGRldmljZSBmcm9tIHRoZSBk
cml2ZXIgdG8gdGhlIERUUy4KPj4+Cj4+PiBCdXQsIHRoaXMgY29tbWVudCBpcyB0aGF0IGRvbid0
IGV2ZXIgYnJpbmcgbm9kZXMgcGVyIGNsb2NrLiBXZeKAmXZlIHJ1biBpbnRvIHNvbWUKPj4KPj4g
QW5kPyBXaGF0IGlzIHVuY2xlYXIgaW4gdGhhdCBjb21tZW50Pwo+Pgo+Pj4gdHJvdWJsZSBhbmQg
YXJlbuKAmXQgc3VyZSB3aGljaCBhcHByb2FjaCBhbGlnbnMgYmV0dGVyIHdpdGggY29tbXVuaXR5
IGd1aWRlbGluZXMuwqAKPj4+IENvdWxkIHlvdSBzaGFyZSB5b3VyIGFkdmljZSBvciBzdWdnZXN0
aW9ucyBvbiB0aGUgYmVzdCB3YXkgZm9yd2FyZD8KPj4KPj4gTG9vayBhdCBhbnkgb3RoZXIgcmVj
ZW50IGNsb2NrIGRyaXZlcnMuCj4gCj4gSSBmb3VuZCBvdXQgdGhhdCB0aGUgcmVjZW50IGNsb2Nr
IGRyaXZlcnMsIHN1Y2ggYXMgc29waGdvL2Nsay1zZzIwNDQuY8KgCj4gYW5kIHJvY2tjaGlwL2Ns
ay1yazM1NjIuYywgdGhlIGNsb2NrIHRyZWUgaW5mb3JtYXRpb24gb2YgdGhlbSB3YXMgcGxhY2Vk
Cj4gaW4gdGhlIEMgY29kZS7CoAo+IFNvLCBmb3IgRUlDNzcwMCBTb0MsIHNob3VsZCB0aGUgY2xv
Y2sgdHJlZSBpbmZvcm1hdGlvbiBiZSBwbGFjZWQgaW4KPiBjbGstZWljNzcwMC5jIGp1c3QgYXMg
Y2xrLXNnMjA0NC5jPyBJcyB0aGlzIHVuZGVyc3RhbmRpbmcgY29ycmVjdD8KClllcywgZW50aXJl
IGNsb2NrIGhpZXJhcmNoeSBmb3Igb25lIGNsb2NrIGNvbnRyb2xsZXIgc2hvdWxkIGJlIGNvZGVk
IGluCnRoZSBMaW51eCBkcml2ZXIuIEhvdyBkbyB5b3UgbmFtZSBpdCBvciBob3cgZG8geW91IHNw
bGl0IHlvdXIgZHJpdmVycyB0bwpjb2RlIGl0IGVmZmljaWVudGx5LCBpcyBkaWZmZXJlbnQgdG9w
aWMuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
