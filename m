Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BCACCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4esOznTogiwDNbLtlfsnFNhLCTtSNfqrddK3aBpkZhE=; b=lCQ96foOSmN2Pl
	CyrqEyChpvTYXAH2bFFM5UQEgsbKQA+Rfw1xV0Dmu0Dc4PXn9PfML/LWNoclB+D54EAINqTq9YceF
	cW/l8/HmizPZ3g25kVqDl2XEbJyRjBGosvUB6+Er0w29WhUY374TO8Jmml5sp78wSicsZhIyfjyFl
	UAKjPnK1WePjoRKnblsHIjp5JOXnzJ7aLzw11zvKfKog9ScAVX73aScDIvoCNhN5rnr7SQPNDSdJN
	Buq+UwpVMyxQUNsy2eFoyz8lv/thLWKU79QwWZE/wuib7sgv/9PfPRAsx3fXCRaTto8i14IPwsC26
	ZZqki1H2Zjb+/E7JxXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISDb-00000005WGn-3Ode;
	Mon, 10 Nov 2025 13:46:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISDV-00000005WCB-39d7
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 13:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CAE8438E7;
	Mon, 10 Nov 2025 13:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835D4C2BCAF;
	Mon, 10 Nov 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762782356;
	bh=BfZlbtmgRdgYv7hKoZSzpQyyse54YgiwBUgsuLLVOEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGr1PmZRLwYBt/uM1R1jlsuy0hADBTEbyD6JFYM/9qUmH/OSBiahCYGGplFS1TzUF
	 fzlRKv1LJnDjYZ9SoLa9wINK0OmUliXSttYyrAzFwGa1MlYTb4z8ik8fU4as9WOPdW
	 Ozt/nUh+2gA0m/XJ3p5Ms1fbTcA9DkgYyfPdwnVAWGUHuMdVQa28g5QWxudt1OOjct
	 Jzvlm8a9BwvM+gi1kTO+AiMKpvXjCc4FMQYFeyBF29yT77ji9HSTO9MkBjVjrO8lI/
	 DzpyQh8F6WHUcnGAG7YOkh7LNk9iGs6JMyerz1X/pCSGtUKnS8wn9ZQivYcOHm4RGQ
	 OH8bedllMvOGg==
Date: Mon, 10 Nov 2025 13:45:50 +0000
From: Lee Jones <lee@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: (subset) [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <20251110134550.GE1949330@google.com>
References: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
 <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
 <71DB25E553BE0B04+aQ1LlKzeR-FkZA83@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71DB25E553BE0B04+aQ1LlKzeR-FkZA83@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054557_811851_EE2566ED 
X-CRM114-Status: GOOD (  17.65  )
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

T24gRnJpLCAwNyBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90ZToKCj4gT24gVGh1LCBOb3Yg
MDYsIDIwMjUgYXQgMDQ6MDQ6MjFQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gTW9u
LCAyNyBPY3QgMjAyNSAxMzo0ODowNSArMDgwMCwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+ID4g
c2VsZWN0IHdpbGwgZm9yY2UgYSBzeW1ib2wgdG8gYSBzcGVjaWZpYyB2YWx1ZSB3aXRob3V0IGNv
bnNpZGVyaW5nCj4gPiA+IGl0cyBkZXBlbmRlbmNpZXMuIEFzIGEgcmVzdWx0LCB0aGUgaTJjLWsx
IGRyaXZlciB3aWxsIGZhaWwgdG8gYnVpbGQKPiA+ID4gd2hlbiBPRiBvciBDT01NT05fQ0xLIGFy
ZSBkaXNhYmxlZC4KPiA+ID4gCj4gPiA+IFRoZSByZWFzb24gZm9yIHJlbW92aW5nIEkyQ19LMSBp
bnN0ZWFkIG9mIGFkZGluZyBhIGRlcGVuZHMgb24gY29uZGl0aW9uCj4gPiA+IGlzIHRvIGtlZXAg
dGhlIHBvc3NpYmlsaXR5IGZvciBvdGhlciBTb0NzIHRvIHVzZSB0aGlzIFBNSUMuCj4gPiA+IAo+
ID4gPiBbLi4uXQo+ID4gCj4gPiBBcHBsaWVkLCB0aGFua3MhCj4gPiAKPiA+IFsxLzRdIG1mZDog
c2ltcGxlLW1mZC1pMmM6IHJlbW92ZSBzZWxlY3QgSTJDX0sxCj4gPiAgICAgICBjb21taXQ6IGVj
ZjZiYzQ3NGFlOTdjNDA0ZTIxMjViNDEzZWIwZWYzNjI3YjAzYzUKPiBIaSBMZWUsCj4gCj4gSSB0
aGluayB5b3UgZGlkbid0IG5vdGljZSB0aGlzIHJlcGx5IFsxXQo+IChNYXliZSBiZWNhdXNlIGhl
IHdhcyByZXBseWluZyB0byB0aGUgY292ZXIgbGV0dGVyKS4KPiAKPiBBcyBBdXJlbGllbiBtZW50
aW9uZWQsIHRoZSBjdXJyZW50IHNodXRkb3duL3JlYm9vdCAoYW5kIHBvc3NpYmx5IHRoZSByZWd1
bGF0b3IKPiBhcyB3ZWxsKSBpbnRlbmRzIHRvIHVzZSB0aGUgYGRlZmF1bHQgTUZEX1NQQUNFTUlU
X1AxYC4KPiBTbyBpZiB0aGVyZeKAmXMgbm8gYGRlZmF1bHQgbSBpZiBBUkNIX1NQQUNFTUlUYCwK
PiB0aGUgZGVmYXVsdCB2YWx1ZSBpbiBzdWJkZXZpY2VzIG1heSBub3QgbWFrZSBtdWNoIHNlbnNl
Lgo+IAo+IEJ1dCBkb27igJl0IHdvcnJ5IOKAlCB0byBtYWtlIHRoaW5ncyBlYXNpZXIgZm9yIHlv
dSwgSeKAmWxsIHNlbmQgYW4gYWRkaXRpb25hbAo+IHBhdGNoIGJhc2VkIG9uIHlvdXIgYnJhbmNo
IChpbiB0aGlzIHNlcmllcykuCj4gCj4gSG93IGRvZXMgdGhhdCBzb3VuZD8KCkdvIGZvciBpdC4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
