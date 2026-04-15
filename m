Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743FDFA0C35
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 06:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVZdxEII19wDV8vEQkRFXbsrhqAWA8765168qJ8xnhY=; b=QmbXKk68IQJ49p
	qeX28lg3Os47x/N5pN6NOzwSqUwFxyFxy23m7csAdTpDpeApyttj9GVbrkny9UVHbWBNDlCclfCmp
	B+i5suLCZQGc9ZBzWuT1mYGg3CjCebW8QXpqIOODmBKqd+xsTZLmYXdjI6JIA2uWxOXtQ2M8l+CdK
	NYuCSo6x+BJkYs01tzXdSGFQacuR2tPAiJERDryGqa67U2Kok0WjTCVedEHIJTUI1Kz2kUorz2seH
	JygS5/th2P+/wAMs92x+V71v8qe54I8Agz1V/G/CIO+kmlIU1En97vnWdQ2TXxmDoT2znbhdokW3h
	mv0t+42Lx7A61cuxVryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCu2l-00000000g4g-34Yk;
	Wed, 15 Apr 2026 06:48:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCu2i-00000000g3T-3JOX;
	Wed, 15 Apr 2026 06:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C884D41A70;
	Wed, 15 Apr 2026 06:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1D1C19424;
	Wed, 15 Apr 2026 06:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776235687;
	bh=uO1fFgRaYkEaX03uIGSllbIp0KmN4e8uhrxbiL7j6JA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wn6Hr/rv7RQ0mjmBpBGnHzSLGoawtRWrJKf8Yulby+TTpp7z1W2m+/e3q+cBeZYn8
	 9EULstKmB1P1aIGBA/hM7NfdL90zPADnWSMrSZUOJgfBI2Y0gYKo15ZH/8SN+3BCpi
	 LFdpD3kIOkfmc5kLWHOPn/7qJv2G9rdoWFZcqmWwEJGa7DK0r7DBeorJlYNCKX5hcM
	 Q22Qw/tg/rR1esDPVyaYxqkxnFQnTVF5/bVWUROMriQiIMAWyo9xVZRAIqfM9NCvMV
	 JvPvhMbjPkTiWVz5ZUzK2DMWWd8bbim3aFcilo4uxvNCEcTYhNnaiu0tF2t4jRv/Q5
	 DezCa9n7clYBA==
Message-ID: <9c33afea-7a64-456e-aa2f-bdcf7459b567@kernel.org>
Date: Wed, 15 Apr 2026 08:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 33/38] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
References: <20260410120044.031381086@kernel.org>
 <20260410120319.789114053@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260410120319.789114053@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_234808_866234_17AEAA5A 
X-CRM114-Status: GOOD (  14.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAxMC8wNC8yMDI2IMOgIDE0OjIxLCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBU
aGUgb25seSByZW1haW5pbmcgdXNhZ2Ugb2YgZ2V0X2N5Y2xlcygpIGlzIHRvIHByb3ZpZGUgcmFu
ZG9tX2dldF9lbnRyb3B5KCkuCj4gCj4gU3dpdGNoIHBvd2VycGMgb3ZlciB0byB0aGUgbmV3IHNj
aGVtZSBvZiBzZWxlY3RpbmcgQVJDSF9IQVNfUkFORE9NX0VOVFJPUFkKPiBhbmQgcHJvdmlkaW5n
IHJhbmRvbV9nZXRfZW50cm9weSgpIGluIGFzbS9yYW5kb20uaC4KPiAKPiBSZW1vdmUgYXNtL3Rp
bWV4LmggYXMgaXQgaGFzIG5vIGZ1bmN0aW9uYWxpdHkgYW55bW9yZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9yZz4KPiBDYzogTWljaGFlbCBFbGxl
cm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pgo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZwoKUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgKENTIEdST1VQKSA8Y2hsZXJveUBr
ZXJuZWwub3JnPgoKPiAtLS0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICB8
ICAgIDEgKwo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3JhbmRvbS5oIHwgICAxMyArKysr
KysrKysrKysrCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGltZXguaCAgfCAgIDIxIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCAyMSBkZWxldGlvbnMoLSkKPiAKPiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9LY29uZmlnCj4gQEAgLTE1MCw2ICsxNTAsNyBAQCBjb25maWcgUFBDCj4g
ICAJc2VsZWN0IEFSQ0hfSEFTX1BSRUVNUFRfTEFaWQo+ICAgCXNlbGVjdCBBUkNIX0hBU19QVERV
TVAKPiAgIAlzZWxlY3QgQVJDSF9IQVNfUFRFX1NQRUNJQUwKPiArCXNlbGVjdCBBUkNIX0hBU19S
QU5ET01fRU5UUk9QWQo+ICAgCXNlbGVjdCBBUkNIX0hBU19TQ0FMRURfQ1BVVElNRQkJaWYgVklS
VF9DUFVfQUNDT1VOVElOR19OQVRJVkUgJiYgUFBDX0JPT0szU182NAo+ICAgCXNlbGVjdCBBUkNI
X0hBU19TRVRfTUVNT1JZCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1NUUklDVF9LRVJORUxfUldYCWlm
IChQUENfQk9PSzNTIHx8IFBQQ184eHgpICYmICFISUJFUk5BVElPTgo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcmFuZG9tLmgKPiBAQCAtMCwwICsxLDEz
IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKyNpZm5kZWYg
X0FTTV9QT1dFUlBDX1JBTkRPTV9ICj4gKyNkZWZpbmUgX0FTTV9QT1dFUlBDX1JBTkRPTV9ICj4g
Kwo+ICsjaW5jbHVkZSA8YXNtL2NwdXRhYmxlLmg+Cj4gKyNpbmNsdWRlIDxhc20vdmRzby90aW1l
YmFzZS5oPgo+ICsKPiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHJhbmRvbV9nZXRfZW50
cm9weSh2b2lkKQo+ICt7Cj4gKwlyZXR1cm4gbWZ0YigpOwo+ICt9Cj4gKwo+ICsjZW5kaWYJLyog
X0FTTV9QT1dFUlBDX1JBTkRPTV9IICovCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3RpbWV4LmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGltZXguaAo+IEBAIC0x
LDIxICswLDAgQEAKPiAtLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiAt
I2lmbmRlZiBfQVNNX1BPV0VSUENfVElNRVhfSAo+IC0jZGVmaW5lIF9BU01fUE9XRVJQQ19USU1F
WF9ICj4gLQo+IC0jaWZkZWYgX19LRVJORUxfXwo+IC0KPiAtLyoKPiAtICogUG93ZXJQQyBhcmNo
aXRlY3R1cmUgdGltZXggc3BlY2lmaWNhdGlvbnMKPiAtICovCj4gLQo+IC0jaW5jbHVkZSA8YXNt
L2NwdXRhYmxlLmg+Cj4gLSNpbmNsdWRlIDxhc20vdmRzby90aW1lYmFzZS5oPgo+IC0KPiAtb3N0
YXRpYyBpbmxpbmUgY3ljbGVzX3QgZ2V0X2N5Y2xlcyh2b2lkKQo+IC17Cj4gLQlyZXR1cm4gbWZ0
YigpOwo+IC19Cj4gLSNkZWZpbmUgZ2V0X2N5Y2xlcyBnZXRfY3ljbGVzCj4gLQo+IC0jZW5kaWYJ
LyogX19LRVJORUxfXyAqLwo+IC0jZW5kaWYJLyogX0FTTV9QT1dFUlBDX1RJTUVYX0ggKi8KPiAK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
