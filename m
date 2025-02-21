Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85433C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7D3dRi2rFsDJhUJ/q8xs0tmoR5cMcZ4lIRa9gkwff6E=; b=gxiy7vu8//TCGE
	9IZhjptJNBKN4kybyZ83GgUv21Y3U5OZXBYI4RD+UiVk0M80FUltHho0NXRU/4ThOIycUIHnfbrKk
	ItG9FYe4CzVeTB3/j+zaVoLfFaAtd0XFitPL6h7sMn8NRyP6L+ZzXevguZhIZLUmnzuwDHqEMn0RU
	gZS2J6VW0AU5J/5QWxZhS26vRV8F8TvNTpojRyJAT9nBcbw95LHZ8oBkVzbmJuIHgCSLN9qjoMVWC
	h0v/MNyI4Lmref18hwb+WeqjzMeA2q7o4jvZxWPM4+mtOrdG9uFPwzSYJzcstDLLZ9faMa1wOEt/8
	D8ru+5mVloaIyZYfvBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQO3-00000005CTS-0wcJ;
	Fri, 21 Feb 2025 10:36:03 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQBg-00000005AJ9-2wVv
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 10:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740133390;
	bh=UNb8a2gN3+1bqIY2UlUBT79h0w78rJrfN5H29nStXmA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WtMABoZrJ/YKP84/osWAcdY5B60fkN/JuxWW8xzNbjVy2h4F0XQ0zhJSSJ9Ku7A+K
	 6uan4Fj0VBrfWJYj4K/a9k5ayZKfjgHB9cE8hXP+mwZsup3bGuoNAtm2jOZ5/Rsb8y
	 6N+i35/XTLe1qKDunHFEB7/NIqsLRmY8V1h1WsYE=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 651B91A3F60;
	Fri, 21 Feb 2025 05:23:08 -0500 (EST)
Message-ID: <f0c15994e7a79f6cd0c82930c0dfebb50458c941.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: vDSO: Remove --hash-style=sysv
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Guo Ren <guoren@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Fangrui Song <i@maskray.me>
Cc: WANG Xuerui <kernel@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>,
  Tiezhu Yang <yangtiezhu@loongson.cn>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-arch@vger.kernel.org
Date: Fri, 21 Feb 2025 18:23:07 +0800
In-Reply-To: <CAAhV-H5_bKtO2mAFmfcZvD0pn9RhTA+UPjv7K574uPKxZbxX=g@mail.gmail.com>
References: <20250221092523.85632-1-xry111@xry111.site>
	 <CAAhV-H5_bKtO2mAFmfcZvD0pn9RhTA+UPjv7K574uPKxZbxX=g@mail.gmail.com>
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_022316_750345_22686988 
X-CRM114-Status: GOOD (  12.96  )
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

T24gRnJpLCAyMDI1LTAyLTIxIGF0IDE3OjQ3ICswODAwLCBIdWFjYWkgQ2hlbiB3cm90ZToKPiBI
aSwgUnVveWFvLAo+IAo+IE9uIEZyaSwgRmViIDIxLCAyMDI1IGF0IDU6MjXigK9QTSBYaSBSdW95
YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4gd3JvdGU6Cj4gPiAKPiA+IGdsaWJjIGFkZGVkIHN1cHBv
cnQgZm9yIC5nbnUuaGFzaCBpbiAyMDA2IGFuZCAuaGFzaCBoYXMgYmVlbiBvYnNvbGV0ZWQKPiA+
IGZhciBiZWZvcmUgdGhlIGZpcnN0IExvb25nQXJjaCBDUFUgd2FzIHRhcGVkLsKgIFVzaW5nCj4g
PiAtLWhhc2gtc3R5bGU9c3lzdiBtaWdodCBpbXBseSB1bmFkZHJlc3NlZCBpc3N1ZXMgYW5kIGNv
bmZ1c2UgcmVhZGVycy4KPiA+IAo+ID4gSW4gdGhlIHBhc3Qgd2UgcmVhbGx5IGhhZCBhbiB1bmFk
ZHJlc3NlZCBpc3N1ZTogdGhlIHZkc28gc2VsZnRlc3RzIGRpZAo+ID4gbm90IGtub3cgaG93IHRv
IHByb2Nlc3MgLmdudS5oYXNoLsKgIEJ1dCBpdCBoYXMgYmVlbiBhZGRyZXNzZWQgYnkgY29tbWl0
Cj4gPiBlMDc0NmJkZTZmODIgKCJzZWxmdGVzdHMvdkRTTzogc3VwcG9ydCBEVF9HTlVfSEFTSCIp
IG5vdy4KPiA+IAo+ID4gSnVzdCBkcm9wIHRoZSBvcHRpb24gYW5kIHJlbHkgb24gdGhlIGxpbmtl
ciBkZWZhdWx0LCB3aGljaCBpcyBsaWtlbHkKPiA+ICJib3RoIiAoQU9TQykgb3IgImdudSIgKEFy
Y2gsIERlYmlhbiwgR2VudG9vLCBMRlMpIG9uIGFsbCBMb29uZ0FyY2gKPiA+IGRpc3Ryb3MuCj4g
V2hhdCBhYm91dCBjaGFuZ2luZyB0byAiLS1oYXNoLXN0eWxlPWJvdGgiIGFzIG1vc3QgYXJjaGl0
ZWN0dXJlcyBkbz8KCklNTyB3ZSBhcmUgbW9yZSBjbG9zZSB0byBBUk02NCBmb3IgdGhlIGFzcGVj
dCB0aGF0IHRoZXJlIGFyZSBubyBsaWJjCihnbGliYyBvciBtdXNsKSByZWxlYXNlcyBsYWNraW5n
IEdOVSBoYXNoIHN1cHBvcnQsIHNvIEkgcHJlZmVyIHRoZSBBUk02NAp3YXkuCgpNYXliZSB0aGlz
IHNob3VsZCBiZSBjaGFuZ2VkIGZvciBzb21lIG9mIG90aGVyIGFyY2hpdGVjdHVyZXMgKFJJU0Mt
ViBhbmQKQy1TS1k/KSBhcyB3ZWxsIGJlY2F1c2UgSSBndWVzcyB0aGUgb25seSByZWFzb24gdGhl
eSB1c2VkICJib3RoIiB3YXMKImhleSwgd2l0aG91dCB0aGlzIHRoZSBzZWxmIHRlc3RzIGRvbid0
IHdvcmsgb24gRGViaWFuIiBidXQgdGhpcyBpcwpyZXNvbHZlZCBub3cuICBBZGRpbmcgYSBmZXcg
cmVjaXBpZW50cyBhbmQgQ2MgZm9yIGRpc2N1c3Npb24uCgotLSAKWGkgUnVveWFvIDx4cnkxMTFA
eHJ5MTExLnNpdGU+ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwg
WGlkaWFuIFVuaXZlcnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
