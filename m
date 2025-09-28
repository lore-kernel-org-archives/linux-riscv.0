Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4DCCAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmwgQmEwU3mjpWNAG7gYaMn2kflma0CyFkSEpcKhl2A=; b=HZKrSl6RD1tUx7
	OldZBkuE3qOeZNAyEGLsdDyi7LrogqLIUjChnANu4B94L/K3bKT3MOwXIeCYBXmscjUYDXrmP8UHM
	FM9oo1yGv0xVUKNUkPD90UT129jWrENj6peNvz8AI+rDygKaFBvK6nG/w+BpmJQHh65GoJmq3sye2
	wIFVlenlk13PdLOEeX7QKpOyGC9mB0htDWUqNahGr0fdg05blkyGw3A53qibGeTLtegRE1kt8kM2l
	o+/kPY5si+R9YaTlABNDPoSmgx4QVbxrP5wB0eX1yzAPrziEj3be+TBWc3UvF0NUyVHDLC+kCc83D
	xOaIc1LpkrEnBQpZs72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2yWJ-000000004QJ-0jCU;
	Sun, 28 Sep 2025 21:01:23 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2yWF-000000004Pp-3a39
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 21:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=aupfVz7e9wplaDlsYMjDfHncbZB7faN8jTJ9BwCTw74=; b=h8PORjgsj4t28FG8t0P54L2Rfu
	1KOok0ak82wgdvmBgnhNzzMNuvgXD/oIYYr3hdZaaWUnL6oqsLTWBjmeLCWY5x1RvP/66QV7hGqQQ
	A158LZCzybAQr9k78vVXJCpx2Xg/U8ORw+3vRpwOWy432Pi9anmusm6F1hQJM/37WJoVKtubhXiaC
	DFLcA6uTbinxM7m3JSnbXhYdDf5yBw0LJ/kTiZGlIF8YSIv9wIlEzyCABAPPuk3plzQ1xKXehHYWy
	ZQZGPymt6NiXYwhJtISiknvxQmNZKvqAp740HYUVzFgjeZemeH6W7Rqk5//5leSVjHK7JZFp3o99e
	QdzkYHxg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v2yW1-001iHZ-1z;
	Sun, 28 Sep 2025 23:01:05 +0200
Date: Sun, 28 Sep 2025 23:01:00 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
Message-ID: <aNmiDIUzx5eUEOQT@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
 <20250927220824.1267318-3-aurelien@aurel32.net>
 <E15EF3B2FD46EFE7+aNiYuset7FKRo_4C@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E15EF3B2FD46EFE7+aNiYuset7FKRo_4C@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_140120_351533_A68BBD1F 
X-CRM114-Status: GOOD (  21.97  )
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

T24gMjAyNS0wOS0yOCAxMDowOCwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiBIaSBBdXJlbGllbiwg
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+IE9uIFN1biwgU2VwIDI4LCAyMDI1IGF0IDEyOjA3
OjQxQU0gKzAyMDAsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gQWRkIGEgInNwYWNlbWl0LXAx
LXJlYm9vdCIgY2VsbCBmb3IgdGhlIFNwYWNlbWlUIFAxIGNoaXAuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3NpbXBsZS1t
ZmQtaTJjLmMgYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gPiBpbmRleCA2OTZiNjAy
MDUxMjYwLi4yZTg2ZWZiMGM4MmI4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tZmQvc2ltcGxl
LW1mZC1pMmMuYwo+ID4gKysrIGIvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYwo+ID4gQEAg
LTk5LDYgKzk5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHNwYWNlbWl0
X3AxX3JlZ21hcF9jb25maWcgPSB7Cj4gPiAgfTsKPiA+ICAKPiA+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1mZF9jZWxsIHNwYWNlbWl0X3AxX2NlbGxzW10gPSB7Cj4gPiArCXsgLm5hbWUgPSAic3Bh
Y2VtaXQtcDEtcmVib290IiwgfSwKPiBJ4oCZbSBub3Qgc3VyZSBpZiB0aGlzIG5hbWUgaXMgdGhl
IGJlc3QgZml0IGhlcmUuCj4gU2luY2UgdGhlIGRyaXZlciBhbHNvIGltcGxlbWVudHMgcmVib290
IGFuZCBwb3dlci1vZmYgZnVuY3Rpb25hbGl0eSwKPiB3b3VsZCBpdCBtYWtlIG1vcmUgc2Vuc2Ug
dG8gY2FsbCBpdCBzcGFjZW1pdC1wMS1wb3dlcj8KPiBJ4oCZbGwgbGVhdmUgaXQgdXAgdG8geW91
LgoKSSBzZWUgeW91ciBwb2ludCwgZm9yIHRoaXMgZHJpdmVyIG5hbWluZyBldmVyeXRoaW5nIHdh
cyBhbW9uZyB0aGUgbW9zdCAKY29tcGxleCB0aGluZ3MuIEkgaGF2ZSBjaG9zZW4gInNwYWNlbWl0
LXAxLXJlYm9vdCIgdG8gYmUgY29uc2lzdGVudCB3aXRoICAKdGhlIG5hbWluZyB1c2VkIGluIHRo
ZSBkcml2ZXIgaXRzZWxmLiBJIGNob3NlIHRoZW0gZnJvbSByZWNlbnRseSBhZGRlZCAKZHJpdmVy
cyBzdXBwb3J0aW5nIGJvdGggcG93ZXJvZmYgYW5kIHJlc2V0LCB0aGF0IHNlZW1zIHRvIGFsbCB1
c2UgdGhlIAp0ZXJtIHJlYm9vdC4KCj4gT3RoZXJ3aXNlLCBMR1RNLgo+IAo+IFJldmlld2VkLWJ5
OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+ICAJ
eyAubmFtZSA9ICJzcGFjZW1pdC1wMS1yZWd1bGF0b3IiLCB9LAo+ID4gIAl7IC5uYW1lID0gInNw
YWNlbWl0LXAxLXJ0YyIsIH0sCj4gPiAgfTsKPiA+IC0tIAo+ID4gMi40Ny4yCj4gPiAKPiA+IAo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo+IAoKLS0gCkF1cmVsaWVuIEphcm5vICAgICAgICAgICAgICAgICAgICAgICAgICBHUEc6
IDQwOTZSLzFEREQ4QzlCCmF1cmVsaWVuQGF1cmVsMzIubmV0ICAgICAgICAgICAgICAgICAgICAg
aHR0cDovL2F1cmVsMzIubmV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
