Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8F4CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 09:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LL6MK0ADoZvgkPbrfevZiCq111O3yRvtYunuh5hsR2c=; b=F3p1I53tX78zNN
	J4h2kpvj0VU7Mmk8jDkKb0QOMTHSQzB1bHHWnr3K2bf0ykzyeUpEOBpJDSgl+Rrw/5dODhZJy7Tsg
	r7oCPN1wnw2i8dStU4uTjB0rvbUwF98W+eo6F+z0KJ2oaLdwxsPoM84h/6Lw1K0qC2YpZdricBcoU
	wGukNkdJxPmtFAG3ICe5h5CHe6VkDiAKXLJH3O5DyLfKo1D4liBdG6cn4Hg1Kv4xHbQ0vrvHJk34b
	0a/57JzLOs1dQEyZ+4oK/XYV4cdrFOFgFfvu0gWFVWyJmLOOkTQOaOTPeZ3EUDYVQgLSSCYNnRdMX
	RP2n1VL1ZBSqnJjddmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZuQ-0000000DOR4-2kVZ;
	Wed, 05 Nov 2025 09:34:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZuP-0000000DOQf-2lDq
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 09:34:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFBAC60203;
	Wed,  5 Nov 2025 09:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB799C4CEFB;
	Wed,  5 Nov 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762335268;
	bh=CNrqEy8bwMXrl85WfuykS9g2llTPMr5i0jDD1EzDRZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXo442xp9UxvWEjC00AKsPpLYsZO8+DBfmkJYRGPI0roCO1LBJYM6meGIE8DUEGmJ
	 TcsYCCBc0Glg+q4TXtWj/44Vyq3eZlAIZcaVEBdj3EmELGpmrhPcvRGPtJBFyzWhhF
	 /e+kK+ArkXH8H0/tu+UzYkSY4Lk8lghMOe91xBTXOZ5xEVRDcyVYY+yEb6z2rEgPMd
	 hgZhAmBAac+znrUHuzr3AXlqpSvySBX9/tohznS6ZQNVt9lvhgmr90TYdOQPvbl694
	 RbRRIXQPYT9ui1egQFPw8yifhERfESTrjtPq6R3Z5reflIK0mgKkdjfwasgJIAhM1u
	 aQIEUB4dhDXPQ==
Date: Wed, 5 Nov 2025 09:34:21 +0000
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
Message-ID: <20251105093347.GD8064@google.com>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
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

T24gVHVlLCAwNCBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90ZToKCj4gT24gTW9uLCBOb3Yg
MDMsIDIwMjUgYXQgMDE6NDg6MzNBTSArMDEwMCwgU2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cj4g
PiAKPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUgMDA6MDE6NTggKzAxMDAsIEF1cmVsaWVuIEphcm5v
IHdyb3RlOgo+ID4gPiBUaGlzIGFkZHMgcG93ZXJvZmYvcmVib290IHN1cHBvcnQgZm9yIHRoZSBT
cGFjZW1pVCBQMSBQTUlDIGNoaXAsIHdoaWNoIGlzCj4gPiA+IGNvbW1vbmx5IHBhaXJlZCB3aXRo
IHRoZSBTcGFjZW1pVCBLMSBTb0MuCj4gPiA+IAo+ID4gPiBOb3RlOiBGb3IgcmVsaWFibGUgb3Bl
cmF0aW9uLCB0aGlzIGRyaXZlciBkZXBlbmRzIG9uIGEgdGhpcyBwYXRjaCB0aGF0IGFkZHMKPiA+
ID4gYXRvbWljIHRyYW5zZmVyIHN1cHBvcnQgdG8gdGhlIFNwYWNlbWlUIEkyQyBjb250cm9sbGVy
IGRyaXZlcjoKPiA+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFjZW1pdC8yMDI1MTAw
OS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2QGxpbnV4LnNwYWNlbWl0LmNvbS8KPiA+
ID4gCj4gPiA+IFsuLi5dCj4gPiAKPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+IAo+ID4gWzEvMl0g
ZHJpdmVyOiByZXNldDogc3BhY2VtaXQtcDE6IGFkZCBkcml2ZXIgZm9yIHBvd2Vyb2ZmL3JlYm9v
dAo+ID4gICAgICAgY29tbWl0OiAyODEyNGNjMGZiOGM3ZGMwMWE2ODM0ZDIyNzM1MWUyNWQ5YTky
YzU4Cj4gU2hvdWxkIHdlIGFwcGx5IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0Y2ggaGFzbuKA
mXQgYmVlbiBtZXJnZWQgeWV0Li4uCgpXaGF0IGlzIHRoZSBkZXBlbmRlbmN5PwoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
