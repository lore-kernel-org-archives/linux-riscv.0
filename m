Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DED4E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Glo3/CwkFyEZiWxN8EHsfjT7UVPcoNtMcxH6i54Sgyw=; b=XFlOeiQF3uA/F0
	jn5YL9e6NHYqf3ITkxxAsCsxwDK52s8TWENQ7GbjRlSkM4ZHZJHRAHTRLhMUisAr7WNFmDis2WDFg
	ksTdTcJhPeQ/yOadba5Ucv/OWh5qEWalcferCTi3nFeGwrBDl3fEastqLsuDj66bj1J6CS6L9kSPD
	kLCfcKG00t30zuAhmYONGWa/F2uUSXdBffPV3LS1Nj0nyuDwG4NPaO/jnE2wXZgAEEr9PngZxcvcV
	I5FKUUNtw8cPBpeDqLTXY3rqct3WnNYUqmifM8DaK0NLNB1GccS47GPYSMKnnW5GQdFzLNqxHSg93
	kNkh0XpnwXf1uy7YVmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdNz-00000009Yrm-28Zm;
	Mon, 23 Dec 2024 08:01:55 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdMB-00000009Yes-1bmw;
	Mon, 23 Dec 2024 08:00:05 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D012140E0288;
	Mon, 23 Dec 2024 07:59:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IM0pXPZd7px8; Mon, 23 Dec 2024 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1734940795; bh=oLmiO6e1v7+WwnKur2gbXxPFrWqAvAvJYXOalhGYmh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwAS/XG2uaILqi2tnPoMceO1SFvcdwgB2eUP+lF0E3qtxPsrkKvNIAdwvcYOwYLbg
	 VvqRX9HbNopYUz0E8WqlR4+hwS4evjJxGuAOGasHGtlugkVJp9ywpiKC8EbDZ422zm
	 muU9ukFK3vu7hlaK35oICq0nKKtYMvBJQy2OPsR+mvKsFD61IL8Mw2MAlMJkEryItZ
	 Tzude+wGqe0Sw9wWIR9qCEh9iQ+cGYRJHeuycqd23zgYmnzkMpT5N1DW0p6NrAgCYf
	 olFh8rx2BkdY5or8KF6raR/v2Ni/IFGcDQKB5uSqrYJiXVWNpgp+jX4ZxJgjDbURJ4
	 cSrvSAzFi4ZxrvHZ1a2k5YfgSAP6AQYRPi9NLJBbrvSRcSIni8b7sSzt4BURfuxCE2
	 r4sJGrTU/6kz8jXjqNQu+e5JVOpZaEHuyoW5vdTmIKsc1KmSM8jxmKbimkXbQrlsIH
	 90+POUXhp51ZscIRGQuA125qI7jngipHuMx2xQIaDiLgkkm892NzJLWoWCASuUcIjP
	 t7xw06sq/JRCWhb65oG60xkW3rPq6o8p+BSEtePeDRS1FBXX3NANrTP8cZLWwcZ34D
	 4b4E4Fx232+BRVdx65v4LFgXYODS/oGKPtkkdO7V+2SrY5pMunLK7ADoymYz7xZnXg
	 ml+quzLMltF9PXnz4EArbLUs=
Received: from nazgul.tnic (2-228-221-6.ip193.fastwebnet.it [2.228.221.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C580D40E0286;
	Mon, 23 Dec 2024 07:58:32 +0000 (UTC)
Date: Mon, 23 Dec 2024 08:58:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Weikang Guo <guoweikang.kernel@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sam Creasey <sammy@sammy.net>, Huacai Chen <chenhuacai@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Geoff Levand <geoff@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	kasan-dev@googlegroups.com, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v7] mm/memblock: Add memblock_alloc_or_panic interface
Message-ID: <20241223075811.GAZ2kYEwZ93CYkatrD@fat_crate.local>
References: <20241222111537.2720303-1-guoweikang.kernel@gmail.com>
 <Z2kNTjO8hXzN66bX@kernel.org>
 <CAOm6qnkRUMnVGj7tnem822nRpJ8R6kFVf6B4W9MhMSBQY8X7Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOm6qnkRUMnVGj7tnem822nRpJ8R6kFVf6B4W9MhMSBQY8X7Kg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_000003_680721_6F408919 
X-CRM114-Status: GOOD (  14.18  )
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

T24gTW9uLCBEZWMgMjMsIDIwMjQgYXQgMDM6MzI6MDFQTSArMDgwMCwgV2Vpa2FuZyBHdW8gd3Jv
dGU6Cj4gRmlyc3Qgb2YgYWxsLCB0aGFuayB5b3UgZm9yIHlvdXIgcmVtaW5kZXIgYW5kIHBhdGll
bmNlLiBJbiBmYWN0LCB0aGlzCj4gaXMgdGhlIGZpcnN0IHRpbWUgSSByZWNlaXZlZCBhIHBhdGNo
IGRpc2N1c3Npb24gd2hlbiBzdWJtaXR0aW5nIGEKPiBwYXRjaC4KPiBBYm91dCBSZXZpZXdlZC1i
eSBvciBBY2tlZC1ieSB0YWdzLCBJIHdpbGwgbm90IGFkZCBpdCBteXNlbGYgaW4gdGhlCj4gZnV0
dXJlLiBSZWdhcmRpbmcgdGhpcyBwYXRjaCwgZG8gSSBuZWVkIHRvIHByb3ZpZGUgYSBuZXcgcGF0
Y2ggdG8KPiB1cGRhdGUgaXQ/IE9yIHdpbGwgeW91IG1vZGlmeSBpdD8gIExvb2tpbmcgZm9yd2Fy
ZCB0byB5b3VyIHJlcGx5CgpJdCBpcyBhbGwgZXhwbGFpbmVkIGhlcmU6CgpodHRwczovL2tlcm5l
bC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3MvZGV2ZWxvcG1lbnQtcHJvY2Vzcy5odG1sCgpH
byByZWFkIGl0IHdoaWxlIHdhaXRpbmcgaW5zdGVhZCBvZiBzcGFtbWluZyBldmVyeW9uZS4KCkxl
bW1lIGdldCB5b3VyIHN0YXJ0ZWQgb24gdGhhdCByZWFkaW5nOgoKIkRvbuKAmXQgZ2V0IGRpc2Nv
dXJhZ2VkIC0gb3IgaW1wYXRpZW50CgpBZnRlciB5b3UgaGF2ZSBzdWJtaXR0ZWQgeW91ciBjaGFu
Z2UsIGJlIHBhdGllbnQgYW5kIHdhaXQuIFJldmlld2VycyBhcmUKYnVzeSBwZW9wbGUgYW5kIG1h
eSBub3QgZ2V0IHRvIHlvdXIgcGF0Y2ggcmlnaHQgYXdheS4KCk9uY2UgdXBvbiBhIHRpbWUsIHBh
dGNoZXMgdXNlZCB0byBkaXNhcHBlYXIgaW50byB0aGUgdm9pZCB3aXRob3V0CmNvbW1lbnQsIGJ1
dCB0aGUgZGV2ZWxvcG1lbnQgcHJvY2VzcyB3b3JrcyBtb3JlIHNtb290aGx5IHRoYW4gdGhhdCBu
b3cuCllvdSBzaG91bGQgcmVjZWl2ZSBjb21tZW50cyB3aXRoaW4gYSBmZXcgd2Vla3MgKHR5cGlj
YWxseSAyLTMpOyBpZiB0aGF0CmRvZXMgbm90IGhhcHBlbiwgbWFrZSBzdXJlIHRoYXQgeW91IGhh
dmUgc2VudCB5b3VyIHBhdGNoZXMgdG8gdGhlIHJpZ2h0CnBsYWNlLiBXYWl0IGZvciBhIG1pbmlt
dW0gb2Ygb25lIHdlZWsgYmVmb3JlIHJlc3VibWl0dGluZyBvciBwaW5naW5nCnJldmlld2VycyAt
IHBvc3NpYmx5IGxvbmdlciBkdXJpbmcgYnVzeSB0aW1lcyBsaWtlIG1lcmdlIHdpbmRvd3MuIgoK
LS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jpcy4KCmh0dHBzOi8vcGVvcGxlLmtlcm5lbC5vcmcv
dGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
