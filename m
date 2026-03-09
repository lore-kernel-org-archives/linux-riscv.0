Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1569DEFCD71
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zonS5EsbqRKhQDc8f4BgSmyg5hfe3160DC3XLmbt/U=; b=rEGj3AnF2Z5MmJ
	tFRGF683n5ReqOouMK+6sUJg1LUgBea8hH2+0G1ZEo8oOT4kVRKN+8am+NDwIfW5hHVn9nZCOYw00
	L9HvrVc4SrR1M6YvrvHSdaDf3cdv8VFWhXs1c8e07XLwpjOgAT0dX0NY+OfqRkNhrkV5XnDIcF0Ji
	/rxXbBXKFUqvUPXaPGFoWOg8Qf4/vjS2uEzvRlMsYi0bGcnsGB49RgTpHWttAcmYZ1Dn4ViJaZvfb
	rhcU/jcrRZwaQHcct9IM3OLnYkHAHIMUmsRrHemcI1vconOqVECXIT25z9Y5bPQ+PannLANyGB027
	kX3dmpYT3EaUuSuGSZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXFj-000000071ls-3XTO;
	Mon, 09 Mar 2026 09:50:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXFh-000000071l4-06Si
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 09:50:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C278F43436;
	Mon,  9 Mar 2026 09:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6207BC4CEF7;
	Mon,  9 Mar 2026 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773049815;
	bh=qF+rTpY9M550oe79ajHmHXLP3gxU4cwesDY/G31jnuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJ1cV+Nvi9Fq6ynT/+6wAfyVweApjoImNgvtibGNGImu/lwJeDwf8IPpbisJtQJJm
	 y+LrfVt43dJBVqdIoUuJJQGmCLKGqgv4IOffY8mNPNdJjBBFuZgIIxbYifNlfzndnj
	 IFmPMy42BLih4CIkgJqbKg2JtAha6wmkLMqh6u/9I0Gl81KR3yGYkG84OYRP4Y1qQ9
	 9FxdYaw2zgIz6DzEb8C4cmXYfETLQNOrAAnOmv1e5TNeiPqMsArqw+dQ6sqnd01OrM
	 0iqtyAJwpZo2f3YP8PL4K4rdEVk7pSpy0f4nHMkeTlR0+oV27T6KaTm+S6DVK28tb7
	 5PgfYi+jcNkQg==
Date: Mon, 9 Mar 2026 09:50:09 +0000
From: Lee Jones <lee@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@riscstar.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add
 individual regulator supply properties
Message-ID: <20260309095009.GR183676@google.com>
References: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
 <177280476778.1042627.3296790673262334325.b4-ty@kernel.org>
 <20260306223958-GKB302167@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306223958-GKB302167@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_025017_081145_0423E480 
X-CRM114-Status: GOOD (  12.66  )
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

T24gU2F0LCAwNyBNYXIgMjAyNiwgWWl4dW4gTGFuIHdyb3RlOgoKPiBIaSBKb25lcywKPiAKPiBP
biAxMzo0NiBGcmkgMDYgTWFyICAgICAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIEZyaSwgMDYg
RmViIDIwMjYgMTA6MzI6MDIgKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+IEFkZCBzdXBw
bHkgcHJvcGVydGllcyB0aGF0IG1hdGNoIHRoZSBQMSBQTUlDJ3MgYWN0dWFsIGhhcmR3YXJlIHRv
cG9sb2d5Cj4gPiA+IHdoZXJlIGVhY2ggYnVjayBjb252ZXJ0ZXIgaGFzIGl0cyBvd24gVklOIHBp
biBhbmQgTERPIGdyb3VwcyBzaGFyZQo+ID4gPiBjb21tb24gaW5wdXQgcGlucy4gU3VwcGx5IG5h
bWVzIGFyZSBkZWZpbmVkIGFjY29yZGluZyB0byB0aGUgcGlub3V0Cj4gPiA+IG5hbWVzIGluIHRo
ZSBQMSBkYXRhc2hlZXQuCj4gPiA+IAo+ID4gPiBUaGUgZXhpc3RpbmcgInZpbi1zdXBwbHkiIGlz
IGRyb3BwZWQgZnJvbSB0aGUgYmluZGluZyBkb2N1bWVudCBhcyB0aGUKPiA+ID4gdXBkYXRlZCBz
cGFjZW1pdCBQMSBkcml2ZXIgbm8gbG9uZ2VyIHBhcnNlcyBpdC4gT25seSB0aGUgcGVyLXJhaWwg
bmFtZXMKPiA+ID4gKCJ2aW4xLXN1cHBseSIsICJ2aW4yLXN1cHBseSIsIC4uLikgYXJlIHN1cHBv
cnRlZC4KPiA+ID4gCj4gPiA+IFsuLi5dCj4gPiAKPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+IAo+
ID4gWzEvM10gZHQtYmluZGluZ3M6IG1mZDogc3BhY2VtaXQscDE6IEFkZCBpbmRpdmlkdWFsIHJl
Z3VsYXRvciBzdXBwbHkgcHJvcGVydGllcwo+ID4gICAgICAgY29tbWl0OiBlMTNlYmI0Y2ZjZmY0
Mzk5YTM0YzNhODljNDkzMDIwODk5YTQzMWY3Cj4gPiAKPiBOb3QgZnVyZSBpZiB0aGlzIHdpbGwg
Y2F1c2UgYSBjb25mbGljdCwgdGhlIHBhdGNoIGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2VkCj4gYnkg
TWFyaywgc2VlCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNzcyMDQ2NDM5MTEuMTY4
NTIzLjM3MjQ1NDg2OTIyMDA2NDc5NzguYjQtdHlAa2VybmVsLm9yZy8KCipmYWNlcGFsbSoKCi0t
IApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
