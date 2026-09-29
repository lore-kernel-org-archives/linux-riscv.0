Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C70CA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCpPe7nY/TQv9v0WIuu8x6J9WL+0mKplEJZmUB7sF4w=; b=S5+LWskHFk3SS2
	cztC/T0P3qa4TMOS5bWrRs9r+XTD4U1DDkhSBnTpPSg5+3OjrOJlWBcQwM8vtfi2veyjFWMjbtKSm
	fvJqhfgYv4jD9Q1jMfYK8Jk9tjWLyQmmp2BbLoh7M7m/Wja6ehRBox4N2NwKVXZD5vchT7CdWfAqU
	bZaIrrzwpJJQwdSvzijCbkNPEa6jo7XDUVVyMcyWPKS957t+VOA5zOWz1qJtxK9NW+70yO4xR+mgK
	Q9X1xG4Z7QTV4Fu1r3IINkHheGQPTmIQjplAS+Aj76ghEfuWgpM/ZUpp4cmVT9H5zLNvwv+7ykzRV
	v9DoTSnHMU89JvdDnw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBULT-00000002zzg-0Vkt;
	Tue, 29 Sep 2026 09:41:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBULR-00000002zyg-3CA1
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 09:41:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D11142A0A;
	Tue, 29 Sep 2026 09:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57051F00893;
	Tue, 29 Sep 2026 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674913;
	bh=+F5NumrZf1XyIZbQp91DpBQmedu/Ecq+2WveBOr2pps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=di9ZkO5KspEV6z4evgG83zBoudsAPd4OAJTLUsZbjopg08XUdO0h2CvjtAM/m7GvZ
	 UcaKiUtYl8RSDOcJGUYicjHrUgEzPDFlAsp2Mlq8tfcIsI9brGeRa4v59dRSLaf9jr
	 ENqMa7FgPAb0v6uI1Fa3P5r43kM7QdPC0+RUmoLzeyqN35lNpn6xdCv2TjlomdgdY6
	 KbyS5AnAFHNULK9BypuiYVpaJHDzobxM5nMVRGdBSXn8RuvI0xoDeQj4NzGG8c3BxO
	 2Et8qZ7KPAGTlIMeafsQGTMJxxjfErPumMiFiZZSHHMKirE7dzI6Qk8NpAParF87BX
	 3d9+Qj/wCmXZw==
Date: Tue, 29 Sep 2026 11:41:47 +0200
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
Message-ID: <aruH26spDeM8O9dh@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org>
 <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
 <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
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

T24gVHVlLCBTZXAgMjksIDIwMjYgYXQgMTE6MTE6NTVBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIFBhdWwsIFRob3JzdGVuLAo+IAo+IE9uIFNhdCwgMjYgU2VwdCAyMDI2
IGF0IDAxOjQ4LCBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBU
aHUsIDI0IFNlcCAyMDI2LCBUaG9yc3RlbiBCbHVtIHdyb3RlOgo+ID4gPiBSZXBsYWNlIGhhcmQt
Y29kZWQgc3RyaW5ncyB3aXRoIHRoZSBzdHJfc3VwcG9ydGVkX3Vuc3VwcG9ydGVkKCkgaGVscGVy
Lgo+ID4gPiBUaGlzIHVuaWZpZXMgdGhlIG91dHB1dCBhbmQgaGVscHMgdGhlIGxpbmtlciB3aXRo
IGRlZHVwbGljYXRpb24sIHdoaWNoCj4gPiA+IGNhbiByZXN1bHQgaW4gYSBzbWFsbGVyIGJpbmFy
eS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogVGhvcnN0ZW4gQmx1bSA8Ymx1bUBrZXJuZWwu
b3JnPgo+ID4KPiA+IFRoYW5rcywgcXVldWVkIGZvciB2Ny40Lgo+IAo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCBhMDY3NzY1NjViOWU3MzUxICgicmlzY3Y6Cj4g
cHJvY2VzczogVXNlIHN0cl9zdXBwb3J0ZWRfdW5zdXBwb3J0ZWQoKSBpbiBjb21wYXRfbW9kZV9k
ZXRlY3QoKSIpCj4gaW4gcmlzY3YvZm9yLW5leHQuCj4gCj4gVGhpcyBmYWlscyB0byBidWlsZDoK
PiAKPiAgICAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jOiBJbiBmdW5jdGlvbiDigJhjb21w
YXRfbW9kZV9kZXRlY3TigJk6Cj4gICAgIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYzoxMzg6
MTc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZgo+IGZ1bmN0aW9uIOKAmHN0cl9zdXBw
b3J0ZWRfdW5zdXBwb3J0ZWTigJkKPiBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbl0KPiAgICAgICAxMzggfCAgICAgICAgICAgICAgICAgc3RyX3N1cHBvcnRlZF91bnN1cHBv
cnRlZChjb21wYXRfbW9kZV9zdXBwb3J0ZWQpKTsKPiAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IGFzIGl0IGhhcyBhIGhhcmQgZGVwZW5k
ZW5jeSBvbiBjb21taXQgNTM4M2NmMjgwZWY0ZjAwYgo+ICgibGliL3N0cmluZ19jaG9pY2VzOiBB
ZGQgc3RyX3N1cHBvcnRlZF91bnN1cHBvcnRlZCgpCj4gaGVscGVyIiksIHdoaWNoIGlzIG9ubHkg
cHJlc2VudCBpbiB0aGUgZm9yLW5leHQgYnJhbmNoIG9mCj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVycy14ODYuZ2l0
LgoKSGkgR2VlcnQsCgpJdCdzIGFsc28gaW4gbGludXgtbmV4dDoKCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0
Lz9pZD01MzgzY2YyODBlZjRmMDBiMTVmMWQ5ZTJhMjg4NmQwZDAyYzAxMThiCgpUaGFua3MsClRo
b3JzdGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
