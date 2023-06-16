Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE172EB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHPuOnBLZOeB1hmgJVMHBXekHpwtvaa1E9n6ScOXaaM=; b=eeOW11iwLTghWz
	MFz12bhs7Fn6xsBFhFPzPVAHpAlgax/RFUKRJUZDNl2oSWdOMhDUXOTfj2P+01+wz4Dg5FHAPmwew
	bif9/3oBG1f1EJx27QTSiKTs+gmAAGZqnj+NW5dVSbzWGayEvCll06xTJmX74lt4Ug9ANqftKSEhC
	nUkKEIrpSpHUPex37FUBQcX34GsH6/RsN9Y6n42dTw1APCnST3uQ4Al+/DkDd6+eOCuxzfziZ+3hX
	db63Q2GZLQIHcYtt8xkctdyOyF5IkE95XD+5P8OSj78mA3l/httl7q6PCXHHk2PB+vIxMVxkIYv0w
	fGyQG5TUH8orD+8Y44SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7t2-000RZU-17;
	Fri, 16 Jun 2023 11:45:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7sy-000RX0-1Z;
	Fri, 16 Jun 2023 11:45:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7401961EB6;
	Fri, 16 Jun 2023 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29582C433C8;
	Fri, 16 Jun 2023 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686915898;
	bh=SBlkM7J7cvJwutjgEGnThrak9ds+eyJewMFlSVnYUvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dr7CzoJHNGeu3w3PgQKLWgVwS9T8cogmFWxroVNKHQZDVRo1UlUd3ic6QqjbwPyzL
	 OrTkekqfG41TcJ3iuPiKUyrB43uuzPMT/0N+uNrFSxpmmBrDSUdTB52vLORYSlSGYC
	 zBPrNwFYpqJ6pHwJkfuoCJg83QW4DoAAZMoW7rg5cWa/X5mOB3ohe76UHlwkbmHF3A
	 /s/K3g9D3SAsQdF/x03HA66saxLvv2vv83w0xLa5tpsgpmppcvsyNqXALWojA66hpv
	 A4m1rairPJ1Asf5I3bxm4yZMgl9hnWw00dt40QPDw754Cvio4MJWVbW7zmCUuCnxMU
	 OmX7v0eMaso5Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen
 <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Kent Overstreet
 <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@kernel.org>, Nadav Amit <nadav.amit@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>, Russell King
 <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 12/12] kprobes: remove dependcy on CONFIG_MODULES
In-Reply-To: <20230616085038.4121892-13-rppt@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-13-rppt@kernel.org>
Date: Fri, 16 Jun 2023 13:44:55 +0200
Message-ID: <87r0qbmy14.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_044500_564268_C52D48E2 
X-CRM114-Status: GOOD (  10.79  )
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

TWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEZyb206ICJNaWtlIFJh
cG9wb3J0IChJQk0pIiA8cnBwdEBrZXJuZWwub3JnPgo+Cj4ga3Byb2JlcyBkZXBlbmRlZCBvbiBD
T05GSUdfTU9EVUxFUyBiZWNhdXNlIGl0IGhhcyB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yCj4gY29k
ZS4KCkkgdGhpbmsgeW91IGNhbiByZW1vdmUgdGhlIE1PRFVMRVMgZGVwZW5kZW5jeSBmcm9tIEJQ
Rl9KSVQgYXMgd2VsbDoKCi0tODwtLQpkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9LY29uZmlnIGIv
a2VybmVsL2JwZi9LY29uZmlnCmluZGV4IDJkZmUxMDc5Zjc3Mi4uZmE0NTg3MDI3ZjhiIDEwMDY0
NAotLS0gYS9rZXJuZWwvYnBmL0tjb25maWcKKysrIGIva2VybmVsL2JwZi9LY29uZmlnCkBAIC00
MSw3ICs0MSw2IEBAIGNvbmZpZyBCUEZfSklUCiAgICAgICAgYm9vbCAiRW5hYmxlIEJQRiBKdXN0
IEluIFRpbWUgY29tcGlsZXIiCiAgICAgICAgZGVwZW5kcyBvbiBCUEYKICAgICAgICBkZXBlbmRz
IG9uIEhBVkVfQ0JQRl9KSVQgfHwgSEFWRV9FQlBGX0pJVAotICAgICAgIGRlcGVuZHMgb24gTU9E
VUxFUwogICAgICAgIGhlbHAKICAgICAgICAgIEJQRiBwcm9ncmFtcyBhcmUgbm9ybWFsbHkgaGFu
ZGxlZCBieSBhIEJQRiBpbnRlcnByZXRlci4gVGhpcyBvcHRpb24KICAgICAgICAgIGFsbG93cyB0
aGUga2VybmVsIHRvIGdlbmVyYXRlIG5hdGl2ZSBjb2RlIHdoZW4gYSBwcm9ncmFtIGlzIGxvYWRl
ZAotLTg8LS0KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
