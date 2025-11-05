Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6307DCCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gn9XuUJP7QhdlVJOyVek5a27oyeTIYP3usq4+dRxVJk=; b=GD3JEIA2a3oh09
	MEMiyZOeyHWsFWq8xCiXf3ubPCzuoKzsGASSfI/4eif1aZBCkjD/9PesFy5GUUrUZQ9wA4I4b1BAY
	g5yF7f5gNXfeoyuIDigmZDn6XhmWH6Ck82bQw3BGGU82aGJDBBfVVTksbPfHSIJ2d504v241eKXek
	CImn0aYAqTN1XOBT1cz7WRqzNuncSoL2WiAJ5Wuntrji5MyWdHMQlC5wU+yxAi9QuL7ARIqnk9v2p
	FNMbGt9ymmXPkEyS0y3MoZdKm58mzfd/Qvy6tfDNbkME2PKMSBJdt94lrIlO4cZwJaGrPe+esraRu
	iekUyHXIAOu7bCT++Ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaRt-0000000DRlJ-2bov;
	Wed, 05 Nov 2025 10:09:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaRs-0000000DRl8-1Iue
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 10:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54CDA60203;
	Wed,  5 Nov 2025 10:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE23DC4CEF8;
	Wed,  5 Nov 2025 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762337343;
	bh=cBgHojw5RM6tgrcR7jae+abslHQ0IK3ynWrHb++wOTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQOL2lY+WAFqDzkNhAEc0y7ZWmhpolFDBHNwVYGaP/1ce24yaW7mRUqQNklQKzIpr
	 1ewdESlf2FTCp/A5iTwyeJRk8BqdxmoteGZtSkOLZxJV0TVi9SjBJtBQtzFIYNkI+k
	 lx7Bxc4H8PMstQ90f4aBJKvRXQLC0DBzNJB7WJbulllLlIt0/+3Ae1GZAbL5zzCuS3
	 qD5kglj6rpngbcuP5XrghEF+URMH0sVzPcBdbAIxrZ6J3p8KvHyQmUEtWzKV9bKT7a
	 YFQSuKePREKPkmxxLhQD6c/AcCvVUGs5ZwvihLhlltTRuzxmeCJFe8DpvBLwyvOcpP
	 ynkVQmUkNvJog==
Date: Wed, 5 Nov 2025 10:08:56 +0000
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
Message-ID: <20251105100856.GG8064@google.com>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
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

T24gV2VkLCAwNSBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90ZToKCj4gT24gV2VkLCBOb3Yg
MDUsIDIwMjUgYXQgMDk6MzQ6MjFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gVHVl
LCAwNCBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+IAo+ID4gPiBPbiBNb24sIE5v
diAwMywgMjAyNSBhdCAwMTo0ODozM0FNICswMTAwLCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToK
PiA+ID4gPiAKPiA+ID4gPiBPbiBNb24sIDAzIE5vdiAyMDI1IDAwOjAxOjU4ICswMTAwLCBBdXJl
bGllbiBKYXJubyB3cm90ZToKPiA+ID4gPiA+IFRoaXMgYWRkcyBwb3dlcm9mZi9yZWJvb3Qgc3Vw
cG9ydCBmb3IgdGhlIFNwYWNlbWlUIFAxIFBNSUMgY2hpcCwgd2hpY2ggaXMKPiA+ID4gPiA+IGNv
bW1vbmx5IHBhaXJlZCB3aXRoIHRoZSBTcGFjZW1pVCBLMSBTb0MuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IE5vdGU6IEZvciByZWxpYWJsZSBvcGVyYXRpb24sIHRoaXMgZHJpdmVyIGRlcGVuZHMgb24g
YSB0aGlzIHBhdGNoIHRoYXQgYWRkcwo+ID4gPiA+ID4gYXRvbWljIHRyYW5zZmVyIHN1cHBvcnQg
dG8gdGhlIFNwYWNlbWlUIEkyQyBjb250cm9sbGVyIGRyaXZlcjoKPiA+ID4gPiA+ICAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvc3BhY2VtaXQvMjAyNTEwMDktazEtaTJjLWF0b21pYy12NC0xLWE4
OTM2Nzg3MDI4NkBsaW51eC5zcGFjZW1pdC5jb20vCj4gXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiBkZXBlbmRlbmN5IGlzIGhlcmUu
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFsuLi5dCj4gPiA+ID4gCj4gPiA+ID4gQXBwbGllZCwgdGhh
bmtzIQo+ID4gPiA+IAo+ID4gPiA+IFsxLzJdIGRyaXZlcjogcmVzZXQ6IHNwYWNlbWl0LXAxOiBh
ZGQgZHJpdmVyIGZvciBwb3dlcm9mZi9yZWJvb3QKPiA+ID4gPiAgICAgICBjb21taXQ6IDI4MTI0
Y2MwZmI4YzdkYzAxYTY4MzRkMjI3MzUxZTI1ZDlhOTJjNTgKPiA+ID4gU2hvdWxkIHdlIGFwcGx5
IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0Y2ggaGFzbuKAmXQgYmVlbiBtZXJnZWQgeWV0Li4u
Cj4gPiAKPiA+IFdoYXQgaXMgdGhlIGRlcGVuZGVuY3k/Cj4gSSBwb2ludCBpdCBvdXQgYWJvdmUu
Cj4gV2l0aG91dCB0aGlzIHBhdGNoLCByZWJvb3QgYW5kIHNodXRkb3duIHdvdWxkIGVuZCB1cCBj
YWxsaW5nIHRoZSBub24tYXRvbWljIGkyY190cmFuc2Zlci4KCk9rYXksIHRoYW5rcy4gIEkgd2Fz
IG1vc3RseSBjaGVja2luZyB0aGF0IHlvdSB3ZXJlbid0IHJlZmVycmluZyB0byB0aGUKTUZEIHBh
dGNoLCB3aGljaCBkb2Vzbid0IHJlcHJlc2VudCBhIHRydWUgZGVwZW5kZW5jeS4KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
