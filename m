Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AD9E7D0AF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkRsupWF9PAL4HOGW2xthWAJAc7J9PCuEICLgoYt0q4=; b=vFB5DCsfwYFXQg
	mrLvHxyQOGVXW2ztiNfMSKd7fNM+8DS/Z1Hycrt0PkJULnyXT47UqwkXL4KdMd1UgeDi9ux/cvAUX
	7NL2rzk0TugYSrzGuC0GAMnao5WTc8T4vmOZawN8QOOfyr/9VPGo2oBGhbm7mh9nGm7ysppzF8/BQ
	we3y4n6lG/46rK6Q1BH5gHnqHRutfgY9WrBCGKJzvEyTW8CMiAM4tgjsNJtf+Mb3nOCrYY9KMucYv
	4PJNhnk5ATjjFVeaqGhjFTZyLaFl5WJHvxz6tt4x+SlD/dVFFrU/faghdxAxfRqqNEDwrbNFYIZGR
	lnOc66tCucN0ZbgHKNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRsl-007GfU-1W;
	Thu, 21 Sep 2023 22:10:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRsh-007Gd4-37;
	Thu, 21 Sep 2023 22:10:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99D0E620F4;
	Thu, 21 Sep 2023 22:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F884C433D9;
	Thu, 21 Sep 2023 22:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695334240;
	bh=N5hdFpyXSiGpYG0511NDyp6fv24cJcs4QSVnP7w1UAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wvqk0n6jq0ct52sblCUd8L/Xq8+N+SorW8zAWVSuS8RApVD17k7plQRRz/k5AtqcZ
	 GfT0CHWwJxWi4gUehtxR+8ljjuQTqjvYKgxWb2XNuVdjKevxRu1ENJFvPX5YXAHSbF
	 Ix9CdbGlyzCm8uVsj2Qxltwpt5fiLP3w48irVYCfZTdJDqTfRku6xjijf57j/ZypWU
	 97yg0mO2y5J78oLs+yCmKD+nXRc3T+EFcvHppUt3wuFXOaWZdvIvQ4j8dq0mhxHV1+
	 hn7FVpnRYo4KhRE7dodDocdh21fQMMb+Di7kRnH5vPdK32pTNVgx3GHtydByNaiHSX
	 2EmQpYW6b+alA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bff7d81b5eso25688251fa.0;
        Thu, 21 Sep 2023 15:10:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YyEvlimGmo/eGOhZNE0v99i3uOJSFldclY87Ur/lZqLxqZkQ50K
	y67cM80Kzj0N2rzM028EHlKqXIhw/yHfp4V21Cg=
X-Google-Smtp-Source: AGHT+IFpnRd6TFzlAtTmG0SVL+ey3URugDNbqT5vmaLEkxDXDZHK88BxPcak1tSmyXSq9q54rWpyKjCd5XFO26LBHOk=
X-Received: by 2002:a19:6903:0:b0:4fe:2d93:2b50 with SMTP id
 e3-20020a196903000000b004fe2d932b50mr5173357lfc.31.1695334238605; Thu, 21 Sep
 2023 15:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:10:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
Message-ID: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230921_151044_106057_1791E960 
X-CRM114-Status: GOOD (  13.98  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzDigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+ClsuLi5dCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2V4ZWNtZW0uaD4K
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZWxvYWRlci5oPgo+ICsKPiArc3RhdGljIHZvaWQgKmV4
ZWNtZW1fYWxsb2Moc2l6ZV90IHNpemUpCj4gK3sKPiArICAgICAgIHJldHVybiBtb2R1bGVfYWxs
b2Moc2l6ZSk7Cj4gK30KPiArCj4gK3ZvaWQgKmV4ZWNtZW1fdGV4dF9hbGxvYyhlbnVtIGV4ZWNt
ZW1fdHlwZSB0eXBlLCBzaXplX3Qgc2l6ZSkKPiArewo+ICsgICAgICAgcmV0dXJuIGV4ZWNtZW1f
YWxsb2Moc2l6ZSk7Cj4gK30KCmV4ZWNtZW1fdGV4dF9hbGxvYyAoYW5kIGxhdGVyIGV4ZWNtZW1f
ZGF0YV9hbGxvYykgYm90aCB0YWtlICJ0eXBlIiBhcwppbnB1dC4gSSBndWVzcyB3ZSBjYW4ganVz
dCB1c2UgZXhlY21lbV9hbGxvYyh0eXBlLCBzaXplKSBmb3IgZXZlcnl0aGluZz8KClRoYW5rcywK
U29uZwoKPiArCj4gK3ZvaWQgZXhlY21lbV9mcmVlKHZvaWQgKnB0cikKPiArewo+ICsgICAgICAg
LyoKPiArICAgICAgICAqIFRoaXMgbWVtb3J5IG1heSBiZSBSTywgYW5kIGZyZWVpbmcgUk8gbWVt
b3J5IGluIGFuIGludGVycnVwdCBpcyBub3QKPiArICAgICAgICAqIHN1cHBvcnRlZCBieSB2bWFs
bG9jLgo+ICsgICAgICAgICovCj4gKyAgICAgICBXQVJOX09OKGluX2ludGVycnVwdCgpKTsKPiAr
ICAgICAgIHZmcmVlKHB0cik7Cj4gK30KPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
