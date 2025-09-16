Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0715BCAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eY1TKtRfxsqFu8w4gHMULkgpijl+xhZW6kIs0Fdc4lA=; b=R8j8GSRJBMVqtW
	7/nrPX5CFwJ432wBrtK98XXN32wPL8wyKLVZJk6e24+16NBsLH/HKeGgxQ5i7Y0f9f8yCSXGjvxdg
	/vfwj+j7rHwULFEGP8XxKbYoDRAVNnQ3VOl1YIorTl76vWoKrFzPF/RZkwhP5XRZzKaSbhKgHI9Pe
	HhUwy5n91BFF00BjoEnjvuJ8N9Pf1v7jZvAWIemISCMFiHwSqU00ktceQ3V53O1k++g4MAF2p+2VA
	merN8ykWoo1HRZgw/eV6K+Zn9S1jLP5HtasAWNq6jEVEN38MSH6NPvCPs+xAlH/8r0JSgEeBTE7lX
	LibX7k1xrQjV7HKIRKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUmV-00000007mE7-1Nz0;
	Tue, 16 Sep 2025 12:27:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUmS-00000007mCr-26wP
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 12:27:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31D83405AA;
	Tue, 16 Sep 2025 12:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107E0C4CEEB;
	Tue, 16 Sep 2025 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758025651;
	bh=PNIloqRamoe/Ge+tqcsD4qceDuD9HPaHcfIdp82zej4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1jzHQiJiKYPH1CgVKK4Ty4Hg5VhVK3z3t8zMDGq+GocyFcKU8bBAH4mz6zJmkSR/
	 GLv+WQIGKQ3jW8dhfqFqd+vDQ2KBAMYz8Vs6ZgyqBdPvuhLtKrxqO8hGlYTL/QFmJa
	 umaOAcoPFzYfyEtZxsvOugzqJm6O5OV3sHftIJv5AgTL/fm6mg1I0dIgKRsJkzblc0
	 PtUOqM+6PVr21bfBYZSmujcMX4qsoABOWuZwiQUyVEyAM9WbmxaiqhBBf36Y1u+9j4
	 sejSITCPRgzLOORWc+5hzCuQgWQ9AHnc9Mro0NmLJAgzoHnYUZbOONCyEgpp9cat9j
	 zZowNpBu2FqGA==
Date: Tue, 16 Sep 2025 13:27:24 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250916122724.GB3585920@google.com>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
 <20250916084229.GG1637058@google.com>
 <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_052732_569895_BDC0CC6B 
X-CRM114-Status: GOOD (  15.85  )
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

T24gVHVlLCAxNiBTZXAgMjAyNSwgTWFyayBCcm93biB3cm90ZToKCj4gT24gVHVlLCBTZXAgMTYs
IDIwMjUgYXQgMDk6NDI6MjlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gVGh1LCAx
MSBTZXAgMjAyNSwgTWFyayBCcm93biB3cm90ZToKPiA+ID4gT24gVGh1LCBTZXAgMTEsIDIwMjUg
YXQgMTE6MzY6NDFBTSAtMDUwMCwgQWxleCBFbGRlciB3cm90ZToKPiAKPiA+ID4gPiBIb3cgc2hv
dWxkIHRoZXNlIHR3byBwYXRjaGVzIGJlIG1lcmdlZD8gIE1hcmsgaGFzIHJldmlld2VkIHRoZQo+
ID4gPiA+IHJlZ3VsYXRvciBwYXRjaCAzIGFuZCBBbGV4YW5kcmUgaGFzIGFja2VkIHRoZSBSVEMg
cGF0Y2ggNC4KPiAKPiA+ID4gV2UnZCBib3RoIGhhdmUgYmVlbiBleHBlY3RpbmcgdGhlbSB0byBn
byB2aWEgTUZELgo+IAo+ID4gV2h5PyAgSSBkb24ndCBzZWUgYW55IGRlcGVuZGVuY2llcyBiZXR3
ZWVuIHRoZW0gKHVzdWFsbHkgYSBzaGFyZWQgTUZECj4gPiBoZWFkZXItZmlsZSkuICBJZiB0aGVy
ZSBhcmUgbm8gZGVwcywgaXQgc2hvdWxkIGJlIHRha2VuIHRocm91Z2ggaXRzIG93bgo+ID4gcmVw
bywgbm8/Cj4gCj4gSSB1c2VkIHRvIGp1c3QgYXBwbHkgdGhpbmdzIGJ1dCBhdCBzb21lIHBvaW50
IExpbnVzIGNvbXBsYWluZWQgYWJvdXQKPiBjYXNlcyB3aGVyZSB0aGUgTUZEIGVuZGVkIHVwIG5v
dCBnZXR0aW5nIG1lcmdlZCAobWlzc2luZyB0aGUgbWVyZ2UKPiB3aW5kb3cgb3Igd2hhdGV2ZXIp
IHNvIEkndmUgYmVlbiB0cmVhdGluZyB0aGVtIGxpa2UgdGhleSBoYWQgYW4gYWN0dWFsCj4gZGVw
ZW5kZW5jeS4KCk5vdCBzdXJlIEkndmUgc2VlbiBhbnkgb2YgdGhhdCBmcm9tIExpbnVzLCBidXQg
SSBkb24ndCBkb3VidCB5b3UuICBUaGUKTUZEIHBhcnQgaGFzIGJlZW4gbWVyZ2VkIG5vdywgc28g
aXQncyBzYXZlIHRvIGdvIGFoZWFkIGFuZCBhcHBseSB0aGUKUmVndWxhdG9yIHBhcnQuCgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
