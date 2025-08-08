Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C59CA0EC0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jj8IOKSGpury+hL0jpRGK21OoNmKf5DdaBtEEmjLAjw=; b=tr3ZQtNx2CsA6t
	8CqdhTewmWxOHxA4xVvPuiXqs0EG7aePoBC33eP9OkicefF035tip5nIeMt5hXkRybkp1Zbq9S/YJ
	30LbUynQ4oNDVjT55T+NkKPQfsY+AUIaSIvcEbSw3q0VA9q0zh3JQQ4cQeI7nqkIf2xDCQ62gI2uq
	lsBQ9bQ1u9cCTjqauvKCdmDbKJglLvLprDmZBgAD5Z/tKZ4EwK+U+UHJ8abKhw3pXgG2LhnAOtuoY
	jptRnUXgiC7M18WBNtpDJF7hIw7+bwT4f7YaE4WoNQT6liVMzpeYIFwSFQPUHAHYfYJr5Fh2zKb6S
	qL/7AlUAuWRQaIQrFcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukI68-00000002Hb0-2Sik;
	Fri, 08 Aug 2025 08:05:08 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHs3-00000002FsX-1r20;
	Fri, 08 Aug 2025 07:50:36 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4bywkg3Mhqz9sS7;
	Fri,  8 Aug 2025 09:33:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-UTSoBBRo41; Fri,  8 Aug 2025 09:33:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4bywkg2Vk1z9sRy;
	Fri,  8 Aug 2025 09:33:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F40D8B770;
	Fri,  8 Aug 2025 09:33:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UAt1KEdP_5VW; Fri,  8 Aug 2025 09:33:47 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F8218B763;
	Fri,  8 Aug 2025 09:33:46 +0200 (CEST)
Message-ID: <59ce87be-0a0a-4f6b-b439-bc7a4a037fc2@csgroup.eu>
Date: Fri, 8 Aug 2025 09:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com
Cc: bhe@redhat.com, hca@linux.ibm.com, andreyknvl@gmail.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 davidgow@google.co, glider@google.com, dvyukov@google.com, alex@ghiti.fr,
 agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250807194012.631367-1-snovitoll@gmail.com>
 <20250807194012.631367-2-snovitoll@gmail.com>
 <22872a3f-85dc-4740-b605-ba80b5a3b1bc@csgroup.eu>
 <CACzwLxiVURgamkv2ws5sK9BQVMz7VPSWGy_aQb+MT8jtv03d3Q@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CACzwLxiVURgamkv2ws5sK9BQVMz7VPSWGy_aQb+MT8jtv03d3Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_005035_644892_FC4E0485 
X-CRM114-Status: GOOD (  10.88  )
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

CgpMZSAwOC8wOC8yMDI1IMOgIDA5OjI2LCBTYWJ5cnpoYW4gVGFzYm9sYXRvdiBhIMOpY3JpdMKg
Ogo+IE9uIEZyaSwgQXVnIDgsIDIwMjUgYXQgMTA6MDPigK9BTSBDaHJpc3RvcGhlIExlcm95Cj4g
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC91bS9LY29uZmlnIGIvYXJjaC91bS9LY29uZmlnCj4+PiBpbmRleCA5MDgzYmZkYjc3My4uYTEy
Y2MwNzJhYjEgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3VtL0tjb25maWcKPj4+ICsrKyBiL2FyY2gv
dW0vS2NvbmZpZwo+Pj4gQEAgLTUsNiArNSw3IEBAIG1lbnUgIlVNTC1zcGVjaWZpYyBvcHRpb25z
Igo+Pj4gICAgY29uZmlnIFVNTAo+Pj4gICAgICAgIGJvb2wKPj4+ICAgICAgICBkZWZhdWx0IHkK
Pj4+ICsgICAgIHNlbGVjdCBBUkNIX0RFRkVSX0tBU0FOIGlmIFNUQVRJQ19MSU5LCj4+Cj4+IE5v
IG5lZWQgdG8gYWxzbyB2ZXJpZnkgS0FTQU4gaGVyZSBsaWtlIHBvd2VycGMgYW5kIGxvb25nYXJj
aCA/Cj4gCj4gU29ycnksIEkgZGlkbid0IHF1aXRlIHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uLgo+
IEkndmUgdmVyaWZpZWQgcG93ZXJwYyB3aXRoIEtBU0FOIGVuYWJsZWQgd2hpY2ggc2VsZWN0cyBL
QVNBTl9PVVRMSU5FLAo+IGFzIGZhciBhcyBJIHJlbWVtYmVyLCBhbmQgR0VORVJJQyBtb2RlLgoK
VGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXI6CgoJc2VsZWN0IEFSQ0hfREVGRVJfS0FTQU4gaWYgU1RB
VElDX0xJTksKCmlzIGVub3VnaCA/IFNob3VsZG4ndCBpdCBiZToKCglzZWxlY3QgQVJDSF9ERUZF
Ul9LQVNBTiBpZiBLQVNBTiAmJiBTVEFUSUNfTElOSwoKTGlrZSBmb3IgcG93ZXJwYyBhbmQgbG9v
bmdhcmNoID8KCgo+IAo+IEkgaGF2ZW4ndCB0ZXN0ZWQgTG9vbmdBcmNoIGJvb3RpbmcgdmlhIFFF
TVUsIG9ubHkgdGVzdGVkIGNvbXBpbGF0aW9uLgo+IEkgZ3Vlc3MsIEkgbmVlZCB0byB0ZXN0IHRo
ZSBib290LCB3aWxsIHRyeSB0byBsZWFybiBob3cgdG8gZG8gaXQgZm9yCj4gcWVtdS1zeXN0ZW0t
bG9vbmdhcmNoNjQuIFdvdWxkIGJlIGhlbHBmdWwgTG9vbmdBcmNoIGRldnMgaW4gQ0MgY2FuCj4g
YXNzaXN0IGFzIHdlbGwuCj4gCj4gU1RBVElDX0xJTksgaXMgZGVmaW5lZCBmb3IgVU1MIG9ubHku
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
