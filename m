Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8D0CD6E79
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 21:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbPgm2dpMXgyvSAckXxRsVNeN0UUvOCSHXm0/cI0M0k=; b=X0rh66nc9bEFAq
	wI+xxs+lzTCyQWEb+31lE01nbrLxaexD918qjJKqtTORqHPfdgAjBY9xlZztwcrTcYBZ8z6EXqLsQ
	6c0o5sC1rjRUXJcDzNO6Odbwqz6YvUOpxJHHSohG68IK2bJ+nzO/97iWN/WJaoP7sxZeWlA+GRigJ
	NaCE9J5goVm0nLzocG3pgbTqVVREzcBbF4zMX8wTZe+w0geeuilasvXfZ8N0LjqZ5RBd28KKwUpYb
	ZVWUK0zdtDct5ztoR4LOMJU80LTVsT/titEj/znq3Bp3mhJy6qIfDQ2hG1vMj+xGVO12KjZg6aRcX
	pBRidDQqGDMpIws8UPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh4g-00000004PAd-0ARt;
	Mon, 08 Jun 2026 20:59:58 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh4d-00000004PAG-3mDj
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 20:59:57 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gZ4DP2HrGz9tgY;
	Mon,  8 Jun 2026 22:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780952389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U+OfQweIOD1gShe2+QuxUov9IeGEl5ViBFprqcyr6fc=;
	b=t+EDzGgfSG0GZyqmiau5dOYEo2iquULVn1WY5kaoOiTUQLbnyd+XOiLbbHhU+PSqDz+LPx
	F0x3PnkQYGji0n60ArWtDXnCapCtxIyEUvslOaayKtf8gwY3CE85Fv4MQFF5I5ZxLcu+8d
	dHPTHBD10/43Cy7LXLo+kZTOxlV5nz5hrDHZ2nCADHPrKwYGhcUmk2aWXIo/QD93eMTTaL
	WuLTjOuQ0l2QcUBjij1awUA5Tso8H/7a/35ZEHxSRl2utkFR5hqIN4u5hwzsaA70lsrfVi
	LCiDpv/KkEhuBwur7VfmQpGwXDP7sr7usxqhJs+o93vDOqiIZ+VXFj/HCaSUsQ==
Message-ID: <e99b78d7aea835ab2960517e0c308b08538146ea.camel@mailbox.org>
Subject: Re: [PATCH v2 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
From: Maurice Hieronymus <mhi@mailbox.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Drew Fustini	 <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Michal Wilczynski
 <m.wilczynski@samsung.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <ukleinek@kernel.org>, 	linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	linux-pwm@vger.kernel.org
Date: Mon, 08 Jun 2026 22:59:36 +0200
In-Reply-To: <140FE1B3-73CA-45EA-B978-648A1A48B577@collabora.com>
References: <20260605-rate-exclusive-get-th1520-v2-0-695640bf7249@mailbox.org>
	 <140FE1B3-73CA-45EA-B978-648A1A48B577@collabora.com>
MIME-Version: 1.0
X-MBO-RS-ID: 4419fd374748a8af19f
X-MBO-RS-META: 8quwtpkkm6yeim94go9bw3qkw9e67cnd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_135956_111016_65ABBCAC 
X-CRM114-Status: GOOD (  10.59  )
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

T24gTW9uLCAyMDI2LTA2LTA4IGF0IDA4OjA4IC0wMzAwLCBEYW5pZWwgQWxtZWlkYSB3cm90ZToK
PiBIaSBNYXVyaWNlLAo+IAo+IFRoZXJlIGlzIHNvbWUgb25nb2luZyB3b3JrIHRvIGNvbnZlcnQg
Q2xrcyB0byBhIHR5cGUgc3RhdGUgcGF0dGVybgo+IFswXQo+IAo+IEkgd29uZGVyIGlmIHlvdSB3
b3VsZCBiZSB3aWxsaW5nIHRvIHJlYmFzZSBvbiB0b3Agb2YgdGhhdD8KPiBJIGNhbiBwdXNoIGEg
bmV3IHZlcnNpb24gaWYgc28uCkRlZmluaXRlbHkhIEp1c3QgbGV0IG1lIGtub3cgd2hlbiB5b3Ug
cHVzaGVkIGEgbmV3IHZlcnNpb24uIFRoYW5rcyBmb3IKdGhhdC4KPiAKPiBJdCBzZWVtcyBsaWtl
IHdlIGFyZSBtb3N0bHkgaW4gYWdyZWVtZW50IHdpdGggdGhhdCBzZXJpZXMsIGFuZCBvbmx5Cj4g
YSBmZXcgbml0cyBhcmUgbWlzc2luZy4KPiAKPiDigJQgRGFuaWVsCj4gCj4gWzBdOgo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwMTA3LWNsay10eXBlLXN0YXRl
LXYzLTAtNzdkM2UzZWU1OWMyQGNvbGxhYm9yYS5jb20vCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
