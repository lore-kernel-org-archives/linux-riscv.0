Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3278DCCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49I1+jgpEfsFVyMqdrnqZCyrRqHPyKJl8K91155wdSQ=; b=r+YSHmbwKAJ5BR
	sDBU/42aozoJ3tCHN+mCIEw+3xG717WMrS8VwDc6DIlk+dOoonDu6FFqKzR8rKU+SpG8fZxAc+s86
	Bdodx58/8q++IQ5TwoJzz1YwKekCt/aLFmnqnrOzriz9fMfAPCsubNacJ8BDs5iQr70/IXxqzzyE7
	Jsj8rjrLApiflvrhfzqYT9PPzNm3mupJsSBbvkghIHeO4UipWLb/Yq0Dtqs9AKZ2Ev9gNWhtX8DrK
	RFuzkEnQcwhEwi16dB9n2mG4v8NAAF5vTRL/w6rdhaTaX/gmYjL7OPdOU0gaXwWiKo8xvtEaFoCtO
	wihOGoeqd6QfCPuHts4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmK2-0000000EahP-02fI;
	Wed, 05 Nov 2025 22:49:46 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmK0-0000000Eah4-13tk
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 22:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=7B7gYt+LYlqrQkECAw+Erqll5FdWOFdju69wPPGYGxM=; b=p9/HaLn80YendaEi5jpbR2NlAy
	mmLPxWqqxHK9lg4A6MmefTNtD17WB2gX1XXiiEEMjMwutwfEnpYic/hupIJwGxc7yBsM9ntzxsQ4D
	uC9d7qDgfARmpqYG+mB/lfWHr4w15x+D1OQuaW1GEqKY3vTaY+Ii+Fk/QSZxtpoF/mHIPi37dhJPW
	KexrSMMUp6GVBIfZj1YXqoyTDmj3dIYudXM3XwglXE9HOCJTjQyjUP7kmOD6iW/fqSBfJZbw/xxmz
	KHVCjFHztMyARI3qxDfDTkQGWhi6bh5+LKrd8JDv/osSeeHMMKyU9U++hj3iT1SHWCSrdiq2mgnsB
	rtgInH2g==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vGmJt-0000000Ag2k-3AUR;
	Wed, 05 Nov 2025 23:49:37 +0100
Date: Wed, 5 Nov 2025 23:49:37 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <aQvUgQvM48LsSzei@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_144944_296025_2710817C 
X-CRM114-Status: GOOD (  17.75  )
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

T24gMjAyNS0xMS0wNSAxNzo0MiwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiBPbiBXZWQsIE5vdiAw
NSwgMjAyNSBhdCAwOTozNDoyMUFNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBUdWUs
IDA0IE5vdiAyMDI1LCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+ID4gCj4gPiA+IE9uIE1vbiwgTm92
IDAzLCAyMDI1IGF0IDAxOjQ4OjMzQU0gKzAxMDAsIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOgo+
ID4gPiA+IAo+ID4gPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUgMDA6MDE6NTggKzAxMDAsIEF1cmVs
aWVuIEphcm5vIHdyb3RlOgo+ID4gPiA+ID4gVGhpcyBhZGRzIHBvd2Vyb2ZmL3JlYm9vdCBzdXBw
b3J0IGZvciB0aGUgU3BhY2VtaVQgUDEgUE1JQyBjaGlwLCB3aGljaCBpcwo+ID4gPiA+ID4gY29t
bW9ubHkgcGFpcmVkIHdpdGggdGhlIFNwYWNlbWlUIEsxIFNvQy4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gTm90ZTogRm9yIHJlbGlhYmxlIG9wZXJhdGlvbiwgdGhpcyBkcml2ZXIgZGVwZW5kcyBvbiBh
IHRoaXMgcGF0Y2ggdGhhdCBhZGRzCj4gPiA+ID4gPiBhdG9taWMgdHJhbnNmZXIgc3VwcG9ydCB0
byB0aGUgU3BhY2VtaVQgSTJDIGNvbnRyb2xsZXIgZHJpdmVyOgo+ID4gPiA+ID4gICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9zcGFjZW1pdC8yMDI1MTAwOS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5
MzY3ODcwMjg2QGxpbnV4LnNwYWNlbWl0LmNvbS8KPiBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+IGRlcGVuZGVuY3kgaXMgaGVyZS4K
Ck9oIGluZGVlZCwgSSBoYXZlIGZvcmdvdHRlbiBhYm91dCB0aGlzIHBhcnQuCgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBbLi4uXQo+ID4gPiA+IAo+ID4gPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+ID4g
PiAKPiA+ID4gPiBbMS8yXSBkcml2ZXI6IHJlc2V0OiBzcGFjZW1pdC1wMTogYWRkIGRyaXZlciBm
b3IgcG93ZXJvZmYvcmVib290Cj4gPiA+ID4gICAgICAgY29tbWl0OiAyODEyNGNjMGZiOGM3ZGMw
MWE2ODM0ZDIyNzM1MWUyNWQ5YTkyYzU4Cj4gPiA+IFNob3VsZCB3ZSBhcHBseSBpdCBub3c/IFRo
ZSBkZXBlbmRlbmN5IHBhdGNoIGhhc27igJl0IGJlZW4gbWVyZ2VkIHlldC4uLgo+ID4gCj4gPiBX
aGF0IGlzIHRoZSBkZXBlbmRlbmN5Pwo+IEkgcG9pbnQgaXQgb3V0IGFib3ZlLgo+IFdpdGhvdXQg
dGhpcyBwYXRjaCwgcmVib290IGFuZCBzaHV0ZG93biB3b3VsZCBlbmQgdXAgY2FsbGluZyB0aGUg
bm9uLWF0b21pYyBpMmNfdHJhbnNmZXIuCgpOb3RlIGhvd2V2ZXIgdGhpcyBpcyBub3QgYSBzdHJv
bmcgZGVwZW5kZW5jeSwgaXQgaXMgbmVlZGVkIHRvIG1ha2UgdGhlIApyZXNldCBvciBwb3dlciBv
ZmYgcmVsaWFibGUuIENhbGxpbmcgbm9uLWF0b21pYyBpMmNfdHJhbnNmZXIgbGVhZCB0byBhIApz
dWNjZXNzZnVsIHJlc2V0IG9yIHBvd2VyIG9mZiBhIGJpdCBtb3JlIHRoYW4gaGFsZiBvZiB0aGUg
dGltZS4KClJlZ2FyZHMKQXVyZWxpZW4KCi0tIApBdXJlbGllbiBKYXJubyAgICAgICAgICAgICAg
ICAgICAgICAgICAgR1BHOiA0MDk2Ui8xREREOEM5QgphdXJlbGllbkBhdXJlbDMyLm5ldCAgICAg
ICAgICAgICAgICAgICAgIGh0dHA6Ly9hdXJlbDMyLm5ldAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
