Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC1C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 13:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acJHFLyn/JXvR1pnLAqEO+2vM9VO/9VTp4FRH/zK1os=; b=ZSr0/Gh93oDtO2
	KNIQoJPP0/RUYa7wEmZLCTH+XhyLxfd59omnvQbLjmeB9jSPiQNVWNm4L24G/xlXDq7+jd0RvmoY5
	ykWHo3DUrWxiFzcGuu2/cARFRUKnwsCWJHRY9uP/PuvkexmWEQi5OsjcUfL/BajUCNr0JYmylEocb
	n8g/e8UH4Bvu3g7fx6RWaZAqP9reMaMNizYrm1XnXSHolMkyC+ABATHGQfxsPuPLxezz+GV5++gMD
	5X5y+MYXGVcPwUTIMpjcv+DJlfv/Ukiw4GFt/o6B/9KavnMtibtNitM4j6yx1xjQAMe0PU05+CjG4
	q+BUkldIrbwtT38LcHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTB6-00000003fsp-3ov6;
	Thu, 31 Jul 2025 13:18:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTB5-00000003fsT-0gej
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 13:18:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FB014477F;
	Thu, 31 Jul 2025 13:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AA9C4CEF4;
	Thu, 31 Jul 2025 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753967914;
	bh=Setdk4P0LfxRRgUblhfUiMB1mpM6wOnPj1k9C7xJ+eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrtH5N8ZTn11r98wDtyoPuCNbywhaLiKlTjNEgfpJ/MYE/ueVe5av8X9ILRQrhb16
	 mS3r96kKh9t0oR7lkViwtGeMY+rBqx2wELrNEo1Is+Zzk/zIiQSgRSH1IhYrFj7vzr
	 ORSi5DH0N6BqtvdXtfojBgAM7Bt3Qf/0P8fRxyRiqCRQgos2KjaMHs10fqj1AmLsTD
	 RZd3BM/J59xtxhiNcGN+hsTaClqOSrGzlznRRqhQLm0o4txNRQh45/nanuCwrWOkn+
	 oIVWx0Dn/xgMBcLcWWfp9FNqrOLMdgikCCaUDZoS27xf976zWdhGP7KDeD+B40oCC/
	 cuB42vd5zpd9A==
Date: Thu, 31 Jul 2025 14:18:27 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250731131827.GG1049189@google.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
 <20250726131003.3137282-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250726131003.3137282-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_061835_228898_EC4ABAA7 
X-CRM114-Status: GOOD (  13.60  )
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

T24gU2F0LCAyNiBKdWwgMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gQWxsIGRldmljZXMgc3Vw
cG9ydGVkIGJ5IHNpbXBsZSBNRkQgdXNlIHRoZSBzYW1lIDgtYml0IHJlZ2lzdGVyIDgtYml0Cj4g
dmFsdWUgcmVnbWFwIGNvbmZpZ3VyYXRpb24uICBUaGVyZSBpcyBhbiBvcHRpb24gYXZhaWxhYmxl
IGZvciBhIGRldmljZQo+IHRvIHNwZWNpZnkgYSBjdXN0b20gY29uZmlndXJhdGlvbiwgYnV0IG5v
IGV4aXN0aW5nIGRldmljZSB1c2VzIGl0Lgo+IAo+IFJhdGhlciB0aGFuIHJlcXVpcmluZyBhICJm
dWxsIiByZWdtYXAgY29uZmlndXJhdGlvbiB0byBiZSBwcm92aWRlZCB0bwo+IGNoYW5nZSBvbmx5
IHRoZSBtYXhfcmVnaXN0ZXIgdmFsdWUsIExlZSBKb25lcyBzdWdnZXN0ZWQgYWxsb3dpbmcKPiBt
YXhfcmVnaXN0ZXIgdG8gYmUgc3BlY2lmaWVkIGluIHRoZSBzaW1wbGVfbWZkX2RhdGEgc3RydWN0
dXJlLiAgVGhlCj4gOC1iaXQgcmVnaXN0ZXIgOC1iaXQgY29uZmlndXJhdGlvbiBpcyBzdGlsbCB1
c2VkIGJ5IGRlZmF1bHQsIGJ1dAo+IG1heF9yZWdpc3RlciBpcyBhbHNvIGFwcGxpZWQgaWYgaXQg
aXMgbm9uLXplcm8uCj4gCj4gSWYgYm90aCByZWdtYXBfY29uZmlnIGFuZCBtYXhfcmVnaXN0ZXIg
YXJlIHByb3ZpZGVkLCB0aGUgbWF4X3JlZ2lzdGVyCj4gZmllbGQgaW4gdGhlIHJlZ21hcF9jb25m
aWcgc3RydWN0dXJlIGlzIGlnbm9yZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBFbGRlciA8
ZWxkZXJAcmlzY3N0YXIuY29tPgo+IFN1Z2dlc3RlZC1ieTogTGVlIEpvbmVzIDxsZWVAa2VybmVs
Lm9yZz4KPiAtLS0KPiB2MTA6IC0gUmVuYW1lIHNpbXBsZV9yZWdtYXBfY29uZmlnKCkgLT4gc2lt
cGxlX3JlZ21hcF9jb25maWdfZ2V0KCkKPiAgICAgIC0gSW50cm9kdWNlIHNpbXBsZV9yZWdtYXBf
Y29uZmlnX3B1dCgpIHRvIGZyZWUgcmVnbWFwX2NvbmZpZwo+IAo+ICBkcml2ZXJzL21mZC9zaW1w
bGUtbWZkLWkyYy5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4g
IGRyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmggfCAgNSArLS0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKClRoaXMgaGFzIGdvbmUgZnJvbSBh
biBpbi1mdW5jdGlvbiAxMSBsaW5lIGNoYW5nZSB0byA1MCBsaW5lcyBhbmQgdGhlCmluY2x1c2lv
biBvZiAyIG5ldyBmdW5jdGlvbnMuICBBcyBtdWNoIGFzIEkgX3JlYWxseV8gYXBwcmVjaWF0ZSB0
aGUgdGltZQphbmQgZWZmb3J0IHlvdSBoYXZlIHB1dCBpbnRvIHRoaXMgWzBdLCB0aGUgYWRkZWQg
Y29tcGxleGl0eSBiZWluZyBhZGRlZApoZXJlIGRvZXNuJ3Qgc2l0IHJpZ2h0IHdpdGggbWUuICBI
b3cgd291bGQgeW91IGxpa2UgdG8gZ28gYmFjayB0byB5b3VyCnY0IGlkZWEgb2YgcHJvdmlkaW5n
IGEgYmVzcG9rZSByZWdtYXBfY29uZmlnIGZvciBmb3IgZGV2aWNlPwoKWzBdIEJlZXJzIG9uIG1l
IGZvciBzZW5kaW5nIHlvdSBkb3duIHRoaXMgcGF0aCEKCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
