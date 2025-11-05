Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219ECCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOISEC9gguqbMYrOeIDjnZtbUN2YbfOzNkG5nFaXdaw=; b=k4eoq6BaE6d3l5
	xLDvnbgxhqVPwty0LidWutGpCxKB+31Ko6/1cGMXuKEU7m/oZgLAtDSJHYxUCV51L1lCA3XdY7Mlg
	T/YLpUq6hPVEqZLeq1RrQsyTBE9Onqc5RLMtN1625HNx9MmYS9Tk2JvRcJrxcK/XeLVMGIjW4ZFJk
	zyaKueKVxMNAVrgnG8pAXCdYVwDPYBoLmrts5knWhg86arynNPLDvqWkhH6sVloMhtqHhCnpjPv7/
	NZ9DHNqEyVncpKrAjhYkYQuiELMLxN8c3WO5tPQSmuHW8SKB3N9qnNr91K6fH70JT+ElenIc1UxkT
	t8NG6SYAQ8NJzVygKqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaUg-0000000DS5f-48Yh;
	Wed, 05 Nov 2025 10:11:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaUe-0000000DS5F-1DTe
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 10:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F33044AAE;
	Wed,  5 Nov 2025 10:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35224C19421;
	Wed,  5 Nov 2025 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762337515;
	bh=TYLyEsZW028QQNPW+jnT8umdzeFdblxH5eHQ+MnHmtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlRu5R3eFg5W/9sRgaBelrjZ58wK+S17lFMe3FRCKtFMneFa4ArxEX/SYkEQxLb8v
	 0S74KquyBevaWOsz9/rTsH7oE2zHALGDe8LQ4hfYRMehPC7TjOdLrLdI4u2Sk/4PgP
	 gptFeYjqulFgnMhNR8W62eb+HEyhTi2fpbTGc2SAWO2dD5JlzCVJ3y18QiyFMp2BZ/
	 MF6h5vKOTUAoQymbFRQZ6VD+/W99WNCLjte6oN3tAHKHomdZitLNMtykq3GZx80ayB
	 B4FX5Dify1oqE2RH+R8cWPEVc3IrrfZMv6NphZfh/e5+uBHcHmpfaYEvOUwrc3Dyjz
	 r5qA39nDUS54A==
Date: Wed, 5 Nov 2025 10:11:49 +0000
From: Lee Jones <lee@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <20251105101149.GH8064@google.com>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
 <20251105100856.GG8064@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251105100856.GG8064@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_021156_352110_B541803F 
X-CRM114-Status: GOOD (  18.72  )
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

T24gV2VkLCAwNSBOb3YgMjAyNSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBXZWQsIDA1IE5vdiAy
MDI1LCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+IAo+ID4gT24gV2VkLCBOb3YgMDUsIDIwMjUgYXQg
MDk6MzQ6MjFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBUdWUsIDA0IE5vdiAy
MDI1LCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiBPbiBNb24sIE5vdiAwMywg
MjAyNSBhdCAwMTo0ODozM0FNICswMTAwLCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gT24gTW9uLCAwMyBOb3YgMjAyNSAwMDowMTo1OCArMDEwMCwgQXVyZWxp
ZW4gSmFybm8gd3JvdGU6Cj4gPiA+ID4gPiA+IFRoaXMgYWRkcyBwb3dlcm9mZi9yZWJvb3Qgc3Vw
cG9ydCBmb3IgdGhlIFNwYWNlbWlUIFAxIFBNSUMgY2hpcCwgd2hpY2ggaXMKPiA+ID4gPiA+ID4g
Y29tbW9ubHkgcGFpcmVkIHdpdGggdGhlIFNwYWNlbWlUIEsxIFNvQy4KPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IE5vdGU6IEZvciByZWxpYWJsZSBvcGVyYXRpb24sIHRoaXMgZHJpdmVyIGRlcGVu
ZHMgb24gYSB0aGlzIHBhdGNoIHRoYXQgYWRkcwo+ID4gPiA+ID4gPiBhdG9taWMgdHJhbnNmZXIg
c3VwcG9ydCB0byB0aGUgU3BhY2VtaVQgSTJDIGNvbnRyb2xsZXIgZHJpdmVyOgo+ID4gPiA+ID4g
PiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3NwYWNlbWl0LzIwMjUxMDA5LWsxLWkyYy1hdG9t
aWMtdjQtMS1hODkzNjc4NzAyODZAbGludXguc3BhY2VtaXQuY29tLwo+ID4gXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiA+IGRlcGVu
ZGVuY3kgaXMgaGVyZS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFsuLi5dCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+ID4gPiA+IAo+ID4gPiA+ID4gWzEvMl0gZHJp
dmVyOiByZXNldDogc3BhY2VtaXQtcDE6IGFkZCBkcml2ZXIgZm9yIHBvd2Vyb2ZmL3JlYm9vdAo+
ID4gPiA+ID4gICAgICAgY29tbWl0OiAyODEyNGNjMGZiOGM3ZGMwMWE2ODM0ZDIyNzM1MWUyNWQ5
YTkyYzU4Cj4gPiA+ID4gU2hvdWxkIHdlIGFwcGx5IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0
Y2ggaGFzbuKAmXQgYmVlbiBtZXJnZWQgeWV0Li4uCj4gPiA+IAo+ID4gPiBXaGF0IGlzIHRoZSBk
ZXBlbmRlbmN5Pwo+ID4gSSBwb2ludCBpdCBvdXQgYWJvdmUuCj4gPiBXaXRob3V0IHRoaXMgcGF0
Y2gsIHJlYm9vdCBhbmQgc2h1dGRvd24gd291bGQgZW5kIHVwIGNhbGxpbmcgdGhlIG5vbi1hdG9t
aWMgaTJjX3RyYW5zZmVyLgo+IAo+IE9rYXksIHRoYW5rcy4gIEkgd2FzIG1vc3RseSBjaGVja2lu
ZyB0aGF0IHlvdSB3ZXJlbid0IHJlZmVycmluZyB0byB0aGUKPiBNRkQgcGF0Y2gsIHdoaWNoIGRv
ZXNuJ3QgcmVwcmVzZW50IGEgdHJ1ZSBkZXBlbmRlbmN5LgoKVG8gc2F2ZSBTZWJhc3RpYW4gc29t
ZSB0cm91YmxlLCBsZXQncyBrZWVwIHRoZSByZWJvb3QgcGF0Y2ggYXBwbGllZC4KCkknbGwgaG9s
ZCBvZmYgb24gdGhlIE1GRCBvbmUsIHdoaWNoIHdpbGwgZW5zdXJlIHRoYXQgcmVib290IGlzbid0
IHByb2JlZC4KCkxldCBtZSBrbm93IHdoZW4gdGhlIGRlcCBpcyBtZXJnZWQgYW5kIEknbGwgaG9v
dmVyIHVwIHRoZSByZXN0IG9mIHRoZSBzZXQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
