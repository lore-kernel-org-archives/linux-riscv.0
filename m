Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A28E7D0AF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 22:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kua5TPOxFMOncrOJslfZC8/KvjNCbTfYrNn9wG7CTi0=; b=cXMXrDLkBgdrQW
	hIp8/LiaqoZYHOdZNZhi4qfEPn1YQrAlGwO7/FYj5evzgAWZimOAvz/P4tfuIFvIZwo8DsOGqX2B7
	/XFEbrYFUXfs3iokTJzvIPEuM0o8BxEWweIMGwv6rsn4yJr1GFK4R+2HQY/jG+Cr0n5DVjdjx3gv9
	PVkXJaa0UR/nkw7Nsk0Sh6ubGY0VKaHO32qRpub92Yvw5xMFCnGQLfi8OvLB3Jdar4zmjOB2SmhrX
	dtp+y9PfozIMNf6gL1r9sY2mY0hrMFUo8uB7VAneNvSb6m4LmA9EdzOK8wHhA9M5sNaZ5C1JZcV4H
	U9pJlpOK4EyWeBe/MzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRx4-007HCi-2i;
	Thu, 21 Sep 2023 22:15:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRx1-007HB3-1v;
	Thu, 21 Sep 2023 22:15:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6EEB620E4;
	Thu, 21 Sep 2023 22:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B91C43397;
	Thu, 21 Sep 2023 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695334508;
	bh=j+YpilMLGCC5ERDcgjdZY/UEYbvSwBxJ4mCRlrG3+go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L+gPhURipQCVv5lQ6lMZEeHafe2Map2Z3SouhfPMvOq3LIN5npAvywgTLrdsrYoDw
	 lcSQt8Ka8fmcf1d8ZM8qIlXPNumlpX3JZKdESMC/KpenaIBv7uGMi+LUkvfCfO+Vlt
	 Ms3BphwgqclEjVmwfHiEkkrb7+Ta8zh3Ag+RqoFwGGlsIzXfHKrtVOjxsaXB9alIhH
	 JK+MwyCKXlDL+alHW9KkokkF6FFQuanhqMW2Sdmh2NRZkCVnTo9ppIcJLwe1SwZkYz
	 JQdTcMm4ZdnaSVT+CVcsNzzz7DKO5EXfQ9zO0FIrMF11/hIqK2vZeqyr2ZUZVULtBX
	 NHK7vuo8iml0w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50325ce89e9so2423456e87.0;
        Thu, 21 Sep 2023 15:15:08 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyj3u2xnZ+jM6sx5mkfk8s6V3sXxtSIh8VP5MD3lEFzipOBfARy
	hulG0LjMntp0xBVS2RYApUV46846+mE+XET8i9c=
X-Google-Smtp-Source: AGHT+IEOsdVYa+3bdtK+lEO/ooz4+HKzafq7xPbE1njdx3C8+57KFx3hJ2XTTULe0kNONSMtwPONNYKDgjY7yPaLcMU=
X-Received: by 2002:a05:6512:3254:b0:503:1c07:f7f9 with SMTP id
 c20-20020a056512325400b005031c07f7f9mr5552939lfr.29.1695334506735; Thu, 21
 Sep 2023 15:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:14:54 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
Message-ID: <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230921_151511_747371_A4045EB3 
X-CRM114-Status: GOOD (  14.62  )
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
cm5lbC5vcmc+IHdyb3RlOgo+ClsuLi5dCj4gKwo+ICsvKioKPiArICogZW51bSBleGVjbWVtX3R5
cGUgLSB0eXBlcyBvZiBleGVjdXRhYmxlIG1lbW9yeSByYW5nZXMKPiArICoKPiArICogVGhlcmUg
YXJlIHNldmVyYWwgc3Vic3lzdGVtcyB0aGF0IGFsbG9jYXRlIGV4ZWN1dGFibGUgbWVtb3J5Lgo+
ICsgKiBBcmNoaXRlY3R1cmVzIGRlZmluZSBkaWZmZXJlbnQgcmVzdHJpY3Rpb25zIG9uIHBsYWNl
bWVudCwKPiArICogcGVybWlzc2lvbnMsIGFsaWdubWVudCBhbmQgb3RoZXIgcGFyYW1ldGVycyBm
b3IgbWVtb3J5IHRoYXQgY2FuIGJlIHVzZWQKPiArICogYnkgdGhlc2Ugc3Vic3lzdGVtcy4KPiAr
ICogVHlwZXMgaW4gdGhpcyBlbnVtIGlkZW50aWZ5IHN1YnN5c3RlbXMgdGhhdCBhbGxvY2F0ZSBl
eGVjdXRhYmxlIG1lbW9yeQo+ICsgKiBhbmQgbGV0IGFyY2hpdGVjdHVyZXMgZGVmaW5lIHBhcmFt
ZXRlcnMgZm9yIHJhbmdlcyBzdWl0YWJsZSBmb3IKPiArICogYWxsb2NhdGlvbnMgYnkgZWFjaCBz
dWJzeXN0ZW0uCj4gKyAqCj4gKyAqIEBFWEVDTUVNX0RFRkFVTFQ6IGRlZmF1bHQgcGFyYW1ldGVy
cyB0aGF0IHdvdWxkIGJlIHVzZWQgZm9yIHR5cGVzIHRoYXQKPiArICogYXJlIG5vdCBleHBsY2l0
bHkgZGVmaW5lZC4KPiArICogQEVYRUNNRU1fTU9EVUxFX1RFWFQ6IHBhcmFtZXRlcnMgZm9yIG1v
ZHVsZSB0ZXh0IHNlY3Rpb25zCj4gKyAqIEBFWEVDTUVNX0tQUk9CRVM6IHBhcmFtZXRlcnMgZm9y
IGtwcm9iZXMKPiArICogQEVYRUNNRU1fRlRSQUNFOiBwYXJhbWV0ZXJzIGZvciBmdHJhY2UKPiAr
ICogQEVYRUNNRU1fQlBGOiBwYXJhbWV0ZXJzIGZvciBCUEYKPiArICogQEVYRUNNRU1fVFlQRV9N
QVg6Cj4gKyAqLwo+ICtlbnVtIGV4ZWNtZW1fdHlwZSB7Cj4gKyAgICAgICBFWEVDTUVNX0RFRkFV
TFQsCgpJIGZvdW5kIEVYRUNNRU1fREVGQVVMVCBtb3JlIGNvbmZ1c2luZyB0aGFuIGhlbHBmdWwu
CgpTb25nCgo+ICsgICAgICAgRVhFQ01FTV9NT0RVTEVfVEVYVCA9IEVYRUNNRU1fREVGQVVMVCwK
PiArICAgICAgIEVYRUNNRU1fS1BST0JFUywKPiArICAgICAgIEVYRUNNRU1fRlRSQUNFLAo+ICsg
ICAgICAgRVhFQ01FTV9CUEYsCj4gKyAgICAgICBFWEVDTUVNX1RZUEVfTUFYLAo+ICt9Owo+ICsK
Wy4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
