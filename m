Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB47EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UalQP8h+HvIkLoWKnwWiQvuoOlax29BvN685trsXkFs=; b=k8L7pfPq31Tbpo
	9wevKbYuai1Hm2FeXf97LKNaWHVLyl3gfpX4OuJ/kbkXSSl0WrYea0yQWi6I3ENkOCHHQpWLahdcG
	lvGeXi9PlT5twjTEl4LoOTFBMnTJiEgDgrzpwRB4j5wSaaOwtWM7YH2JfYxDFtILx9tMtQvQWK8n3
	FniFw9f59HPoQwdVWtWQ28gU7zsorP+O7nonE/Kh6jg2JQ6UJosGiboP4oi5xSn25+xD5ZKjDHo6l
	GF5A0y5j1UDVqqbrzm8W3BuWPT+aAf1QJpY+sPD9g13Bo+vp6bgTxh7TW1xV269QpkwrxDcE4FJSS
	WKJ2MtKakyIeUn9nYX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFth-001lm0-0u;
	Fri, 16 Jun 2023 20:18:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFtd-001lk5-39;
	Fri, 16 Jun 2023 20:18:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75F0A63EDC;
	Fri, 16 Jun 2023 20:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF3EC4339A;
	Fri, 16 Jun 2023 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946692;
	bh=U5Tl9qs4B0TBI/rIx4ZZgTkRwFm5uyKz4CPReQtXH/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LmBJJScQlLvxsT8+Ta1tCpM4WXI6TR8l8c5jV/lF5ZOrowqAfZjtpNM41tcPHiArX
	 +YH5I9st348UgQHncZvkjv1I8uf6/B9VIYKB/ZX5ShONmWppK4Z28CmWLldHUX++Co
	 tQHCqBzRDW0rngL+0918l5A/LKDXSOHiSUfIz3m/CZC9iQ5hn0r0gJTm/FmWwj/qLn
	 mAG9TY9iKVAQprNcopRBSELs+aKCJHBbKHSrnFdxygoqMhe72Gcymvj1seoYl1ETYg
	 kF9uj767lw3HcyBO4F7SRQUsfNpsVMh+rYJU6mMVRBqQdXG9XPM9gyQIez8ST13ZvP
	 VGJY2Pv9kdJTA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b4544200dcso15972471fa.1;
        Fri, 16 Jun 2023 13:18:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDyTsTI8zqZasLUxwZvqCu2T2SXbSCN4bH/szXXWe/E4QHDQtP6I
	GW4Oh+A080z1uvYv9/PrKt5ipFUZ3YMqfn/UzCg=
X-Google-Smtp-Source: ACHHUZ4zX0CYOJSSN4FGWX93J1VUIgZYXEOYsrGR9cSML7AlHx0h0qQhMxp9jkMOVU4u0KdCA43Yux1f/ue71yfnFUk=
X-Received: by 2002:a05:651c:225:b0:2b3:4fb7:8991 with SMTP id
 z5-20020a05651c022500b002b34fb78991mr2815162ljn.43.1686946690319; Fri, 16 Jun
 2023 13:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-11-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-11-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:17:57 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4C1zm72AkHfuo6Xz4+37AG4BgX_k2fM+xw536QeDQS+w@mail.gmail.com>
Message-ID: <CAPhsuW4C1zm72AkHfuo6Xz4+37AG4BgX_k2fM+xw536QeDQS+w@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] arch: make execmem setup available regardless of CONFIG_MODULES
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_131814_093180_BB2282A9 
X-CRM114-Status: GOOD (  13.16  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MuKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IGV4ZWNtZW0gZG9lcyBub3QgZGVwZW5kIG9uIG1vZHVsZXMsIG9uIHRoZSBj
b250cmFyeSBtb2R1bGVzIHVzZQo+IGV4ZWNtZW0uCj4KPiBUbyBtYWtlIGV4ZWNtZW0gYXZhaWxh
YmxlIHdoZW4gQ09ORklHX01PRFVMRVM9biwgZm9yIGluc3RhbmNlIGZvcgo+IGtwcm9iZXMsIHNw
bGl0IGV4ZWNtZW1fcGFyYW1zIGluaXRpYWxpemF0aW9uIG91dCBmcm9tCj4gYXJjaC9rZXJuZWwv
bW9kdWxlLmMgYW5kIGNvbXBpbGUgaXQgd2hlbiBDT05GSUdfRVhFQ01FTT15Cj4KPiBTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+Cj4gLS0tClsuLi5d
Cj4gKwo+ICtzdHJ1Y3QgZXhlY21lbV9wYXJhbXMgX19pbml0ICpleGVjbWVtX2FyY2hfcGFyYW1z
KHZvaWQpCj4gK3sKPiArICAgICAgIHU2NCBtb2R1bGVfYWxsb2NfZW5kOwo+ICsKPiArICAgICAg
IGthc2xyX2luaXQoKTsKCkFoYSwgdGhpcyBhZGRyZXNzZXMgbXkgY29tbWVudCBvbiB0aGUgZWFy
bGllciBwYXRjaC4gVGhhbmtzIQoKQWNrZWQtYnk6IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5vcmc+
CgoKPiArCj4gKyAgICAgICBtb2R1bGVfYWxsb2NfZW5kID0gbW9kdWxlX2FsbG9jX2Jhc2UgKyBN
T0RVTEVTX1ZTSVpFOwo+ICsKPiArICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMudGV4dC5w
Z3Byb3QgPSBQQUdFX0tFUk5FTDsKPiArICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMudGV4
dC5zdGFydCA9IG1vZHVsZV9hbGxvY19iYXNlOwo+ICsgICAgICAgZXhlY21lbV9wYXJhbXMubW9k
dWxlcy50ZXh0LmVuZCA9IG1vZHVsZV9hbGxvY19lbmQ7Cj4gKwo+ICsgICAgICAgZXhlY21lbV9w
YXJhbXMuaml0LnRleHQucGdwcm90ID0gUEFHRV9LRVJORUxfUk9YOwpbLi4uXQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
