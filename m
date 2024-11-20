Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E177AD63936
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6u12Ao3XkzWKMbwxL/gPli/Z4T/BnTCPiUB5hIXLkQ=; b=IGcQhUAbKNOvO8
	6uR8axi99wEOAA6x0uM8O+HBGMQYfkW7PZsKo4mojHlICWx1uTMYYMKGTLUGsaf/iZuqr6YUJRTSs
	6RuN9ijMdrqeXb4qZVGqeiHkvjI4R9qEWsxdpYJIDtGN/XDOdfKGTvU0/qWHHI0Y8jL1eLd+LWLLQ
	mlIsaOdcViRvBs87KiajeNy+2cmk+NXEwkw9ModQA1lKn5j280NXXyt91T6W4u/X6QGw/8fEIRyQO
	52VVkz6dhs4BSuAV8mutIruSPQugN8gKjNLShhUzEtbkq/gwbs51bJRUBGre+yYS4XLa5dVAOULjb
	mwEZT5CujGWxgz6ti96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDki1-0000000FP5i-0iBO;
	Wed, 20 Nov 2024 13:25:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkhy-0000000FP58-2adw
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 13:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54859A43085;
	Wed, 20 Nov 2024 13:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D3EC4CECD;
	Wed, 20 Nov 2024 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732109125;
	bh=PSieHCoFZ55YqSWubEMSMVrhpXBeC7NlmdRgZteAHjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lcppw3e/uzSvAp+9e5qUUil3I+8wKhXjxzfzhKZIdKrgn+FQEegBUlvynONjCU1lU
	 TVu3qpC9oIRp224tiyV4pBtlJOHDPhC1ojStRump7eZDsRzFNEW0K9Ia1XlTTc1SAc
	 qjxNSK8YEd+0lL8xAxJEu7p/mbNs+EML2TgSnqs3LhplpS5VvfekZg5Cjn7RO3+4bi
	 dDGF9TvIcGapwcCo4w9oFFKgi+jocd6c1qPKD8SJorHj5VNg+gKmFaSDp60V86QkbB
	 JIsMjudbhLV8inXyAXV60G5uze30q+NQMvNFfYFGsjm2ZjIPBjwp2l4/pJIBR4dHoy
	 o2Zw3D4udBkDw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Quentin Monnet
 <qmo@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, David
 Abdurachmanov <davidlt@rivosinc.com>
Subject: Re: [PATCH] tools: Override makefile ARCH variable if defined, but
 empty
In-Reply-To: <20241106193208.290067-1-bjorn@kernel.org>
References: <20241106193208.290067-1-bjorn@kernel.org>
Date: Wed, 20 Nov 2024 14:25:22 +0100
Message-ID: <87r076nikd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_052526_719729_7125CC85 
X-CRM114-Status: GOOD (  11.99  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgdG9v
bHMgKGJwZnRvb2wsIHNlbGZ0ZXN0cyksIHRoYXQgcmVxdWlyZSBhCj4gImJvb3RzdHJhcCIgYnVp
bGQuIEhlcmUsIGEgYm9vdHN0cmFwIGJ1aWxkIGlzIGEgYnVpbGQgaG9zdCB2YXJpYW50IG9mCj4g
YSB0YXJnZXQuIEUuZy4sIGFzc3VtZSB0aGF0IHlvdSdyZSBwZXJmb3JtaW5nIGEgYnBmdG9vbCBj
cm9zcy1idWlsZCBvbgo+IHg4NiB0byByaXNjdiwgYSBib290c3RyYXAgYnVpbGQgd291bGQgdGhl
biBiZSBhbiB4ODYgdmFyaWFudCBvZgo+IGJwZnRvb2wuIFRoZSB0eXBpY2FsIHdheSB0byBwZXJm
b3JtIHRoZSBob3N0IGJ1aWxkIHZhcmlhbnQsIGlzIHRvIHBhc3MKPiAiQVJDSD0iIGluIGEgc3Vi
LW1ha2UuIEhvd2V2ZXIsIGlmIGEgdmFyaWFibGUgaGFzIGJlZW4gc2V0IHdpdGggYQo+IGNvbW1h
bmQgYXJndW1lbnQsIHRoZW4gb3JkaW5hcnkgYXNzaWdubWVudHMgaW4gdGhlIG1ha2VmaWxlIGFy
ZQo+IGlnbm9yZWQuCj4KPiBUaGlzIHNpZGUtZWZmZWN0IHJlc3VsdHMgaW4gdGhhdCBBUkNILCBh
bmQgdmFyaWFibGVzIGRlcGVuZGluZyBvbiBBUkNICj4gYXJlIG5vdCBzZXQuCj4KPiBXb3JrYXJv
dW5kIGJ5IG92ZXJyaWRpbmcgQVJDSCB0byB0aGUgaG9zdCBhcmNoLCBpZiBBUkNIIGlzIGVtcHR5
Lgo+Cj4gRml4ZXM6IDg4NTliMGRhNWFhYyAoInRvb2xzL2JwZnRvb2w6IEZpeCBjcm9zcy1idWls
ZCIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoK
QXJuYWxkby9QYWxtZXIvUXVlbnRpbjoKCkEgYml0IHVuc3VyZSB3aGF0IHRyZWUgdGhpcyBwYXRj
aCBzaG91bGQgZ28uIEl0J3MgdmVyeSBpbXBvcnRhbnQgZm9yIHRoZQpSSVNDLVYgYnVpbGRzLCBz
byBtYXliZSB2aWEgUGFsbWVyJ3MgUklTQy1WIHRyZWU/CgpPcGluaW9ucz8gSnVzdCB3YW50IHRv
IG1ha2Ugc3VyZSBpdCBkb2Vzbid0IGZhbGwgYmV0d2VlbiBhbnkgY2hhaXJzIQo6LSkKCgpCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
