Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC88ACD5BAC
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XAdlHKhfQ82twwMSR+7PR32QH/3gP/mwMjZhDCKCk0=; b=NJELNs5cMk4Zbh
	nsOpQ9V607vdeN8Yz00pxEBDWiFqti04sHUFCTlvWDHQWBKGmFXt6GvNH6I5n/H7NidyqsIBjtGpW
	edPSHqkag99Vwy6Dpe2nkSGcpGIMt92NhlYnM3+Bt5uZzeMpWeQYQVTDzKo3wB20IjF2HrUhTJoeA
	0P4PRfvf3ZyWc2IxfOxGJT7dpIYTUqF63otoKyUogGUfAApHDK9DDqtpz+Y+AGk3jaTHolrY/BrZ0
	DGDJUpqg0vbk0CdqBm+U70kx6uiK1yC4iAYHg44Mo9zVhwknKB0RIqN4qlU83moZ3ASXPEVSqVgj3
	/G4Vf9sWbUGzEPMnOMIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQoEW-0000000DUfD-1kqh;
	Sat, 23 May 2026 15:25:48 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQoET-0000000DUei-3ybz
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 15:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779549940; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UoJtSar+/fAJsaOXr0Zc6Z6ZWQtDCIiC3uMrHWrlHksB66qkLrbObXeLkFYg0cXY6bWgPaCjhrWvZdztBIp0bmPQnque7sL+abZLuPfF0X8iqb1VjsMyGgXq0vVtgDrSkPIBzHCB/BwyMm6YWGRnUbb4kHRX0t4dXgsd3iAer6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779549940; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ypvOXGHmPfwupkJQo0lkg7l8Xmzz75cpEihNyUsSVws=; 
	b=IzPdXURskMJy9J2/DyTqVzJWpExN2QJYaWzYzqgNq6noNDkX5NwShdi8N/9ErzokoQBpJOVFOAiRTzoobvC+d1v3nkFV+KkJVYenxoKBP3hevW7HQZGgYQ64/S8vU0MI/wbGkUG4xUBt9sKFGUDg37NfawzCfld5XnWC8tSmHZQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779549940;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=ypvOXGHmPfwupkJQo0lkg7l8Xmzz75cpEihNyUsSVws=;
	b=Fge9WiM64DkZTehzmzJ23k1OxthuLN4BfpU0Qn8wj1wn2ClZxiLlDPU877PS7prK
	PtVECX/hWy1tGV8jK52goKSO06V3AEdqDZ/flpKUkZfTsC/dZyRZ4NZSeIcBGOfeWYK
	ebVCLuzFoIqk7Y2QWpRUciOEvWJqK0yZY1GSEWKo=
Received: by mx.zohomail.com with SMTPS id 1779549936497366.38328264930124;
	Sat, 23 May 2026 08:25:36 -0700 (PDT)
Date: Sat, 23 May 2026 23:25:18 +0800
From: Xukai Wang <kingxukai@zohomail.com>
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
User-Agent: Thunderbird for Android
In-Reply-To: <20260523-punctual-backslid-712c06f0db61@spud>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy> <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com> <20260522-removed-lyricism-7c879febc3b3@spud> <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com> <20260523-punctual-backslid-712c06f0db61@spud>
Message-ID: <75285B3F-92FD-48A4-84D1-6C2BF2FBCE17@zohomail.com>
MIME-Version: 1.0
Feedback-ID: zu08011227f17df843053cbf16afe5966500007938fc8c90888f46af5fc70e4e66e963e3d34c89acadaa1e39:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_082546_039965_AE20CBEC 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

Cgrkuo4gMjAyNuW5tDXmnIgyM+aXpSBHTVQrMDg6MDAgMjI6MDI6MzHvvIxDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IOWGmemBk++8mgo+T24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgMDM6
MDA6MTVQTSArMDgwMCwgWHVrYWkgV2FuZyB3cm90ZToKPj4gCj4+IE9uIDIwMjYvNS8yMyAwNDoz
OSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiA+IE9uIEZyaSwgTWF5IDIyLCAyMDI2IGF0IDA4OjU5
OjEyUE0gKzA4MDAsIFh1a2FpIFdhbmcgd3JvdGU6Cj4+ID4+IEZpeCBhbGwgc3BhcnNlIHdhcm5p
bmdzIGRldGVjdGVkIGR1cmluZyBMS1AgcmFuZGNvbmZpZyB0ZXN0aW5nOgo+PiA+PiAtIFJlcGxh
Y2UgcGxhaW4gaW50ZWdlciAwIHdpdGggTlVMTC4KPj4gPj4gLSBBZGQgc3RhdGljIG1vZGlmaWVy
IHRvIGsyMzBfcGxscyBhbmQgazIzMF9wbGxfZGl2cy4KPj4gPj4KPj4gPj4gUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiA+PiBDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjA1MjIwNzI0Lmo0WmVNM0tJLWxrcEBp
bnRlbC5jb20vCj4+ID4+IFNpZ25lZC1vZmYtYnk6IFh1a2FpIFdhbmcgPGtpbmd4dWthaUB6b2hv
bWFpbC5jb20+Cj4+ID4gRm9yZ290IHRvIHJlcGx5IGVhcmxpZXIsIGJ1dCBJIHdlbnQgYW5kIHNx
dWFzaGVkIHRoaXMgaW4uCj4+IFRoYW5rcyBDb25vciEKPgo+SSBkdW5ubyBpZiB5b3Ugc2F3IG15
IG1lc3NhZ2UgYWJvdXQgZ2l2aW5nIHdoYXQgSSBoYXZlIGluIG15Cj5icmFuY2hlcyBhIGdvLCBi
dXQgaWYgeW91IGNvdWxkIHRyeSB3aGF0J3MgaW4gdGhlIHJpc2N2LXNvYy1mb3ItbmV4dAo+YnJh
bmNoLCB0aGF0J2QgYmUgZ3JlYXQuIEp1c3QgdG8gbWFrZSBzdXJlIHRoYXQgSSBoYXZlIGFsbCB0
aGUgYml0cyBpbgo+cGxhY2UuCk9LLCBJIHdpbGwgcHVsbCByaXNjdi1zb2MtZm9yLW5leHQgYnJh
bmNoIGFuZCB0ZXN0IGl0IG9uIEsyMzAgaGFyZHdhcmUgaW1tZWRpYXRlbHkuIEFuZCB0aGVuIHJl
cG9ydCBiYWNrIHRoZSB0ZXN0IHJlc3VsdHMgYXMgc29vbiBhcyBwb3NzaWJsZS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
