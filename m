Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E4C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8ZM5PE2Z0uR2YA1zWuESz44KZmswGYnVX52o1rAUow=; b=1Zr73Ag1xAhYKI
	Kz4jwloSX8M4p1HR+WFINu1o7NW5Ox7j9NMv4VzCemRx48LORjEoQQWxSESq5L04y46aSUXX3bJ9B
	Z9yIM96ZItPixqZ/HrGRBqhqUAeaZq+VK9zaMNQCcf9lqawFBLrCEBfOlHJ/PkdzPgkWxB20llLeX
	Ep78hCBK/9gu19O0sVXRQGubN5H80zSfMarluWDUpqkbxduvee/eUQ5ZOT8vqMQ6u/vJsHbVKHjYn
	F7bCdsR3o5nLX0NDkTLXG2zAICvRs8npU97qcvsv6n3Rd31V3zx2daFxAmNIw80QyuyV0bw/afPmi
	JmquEUd/Tjk7dWhW8yYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq3F-00000008PEI-3mBS;
	Wed, 05 Mar 2025 14:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpomP-00000008Blp-3irC
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cB1DxsX8g+WgYZpFQF3xzyK6n2FY/ODCE60uSgp0XO8=; b=lkIQ07jHKYz8qY6Fpibb3QgQP0
	fQkC6KkldlFQAbHEh2OtxzaHusLWI/SqScJPO/IppHBkep/RC5qy2EH5biElpofhTo0i5FRYwEmt/
	DBT90VMp6H//QJynLp0nar20XAQ7fPmksgncJiTgXNur2Pauk7PYKNjikh7jBaBBHP8g7fAc6tfpc
	f8kTLFi2i0Dzow1jtNs9MwEb2E4ddLw8H5F+n/udc9Czs+oLbxuIdDXUns4VDITtibLeZoHwWk3WI
	KJ2hP5h9OTIvilxSDHvYLuRjk3d8/Ua3fdYYmc5skOoU2y3DePb+tMB9zeaYPE5UlskdtNKY7lNsn
	4er5hmcA==;
Received: from xry111.site ([89.208.246.23])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpomM-00000000Y9S-3KxM
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 13:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1741181228;
	bh=cB1DxsX8g+WgYZpFQF3xzyK6n2FY/ODCE60uSgp0XO8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gzOp9btd675nz7oHVq1TNOboLUEF3CpNFjY2HnMRh/CFxbVp+UUV1zpMNIeuVrIJV
	 2NQtinq7RTEwKbYykS7zcKl/+SqOfSoGa1qUkNLZpDQiBmmthTgOL8sFunEleETm3k
	 OUHea7Ij4e5FyjDxJcJV+rZLYptOEKXJd2bfJSAg=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A784866DBD;
	Wed,  5 Mar 2025 08:27:06 -0500 (EST)
Message-ID: <91797ac4bbe27d7d60b89053050e429bcd630db3.camel@xry111.site>
Subject: Ping: [PATCH 0/3] Drop explicit --hash-style= setting for new
From: Xi Ruoyao <xry111@xry111.site>
To: Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, Fangrui
 Song <i@maskray.me>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, linux-csky@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 05 Mar 2025 21:27:04 +0800
In-Reply-To: <20250224112042.60282-1-xry111@xry111.site>
References: <20250224112042.60282-1-xry111@xry111.site>
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_132719_067703_266F19EA 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

UGluZy4KCk9uIE1vbiwgMjAyNS0wMi0yNCBhdCAxOToyMCArMDgwMCwgWGkgUnVveWFvIHdyb3Rl
Ogo+IEZvciByaXNjdiwgY3NreSwgYW5kIExvb25nQXJjaCwgR05VIGhhc2ggaGFkIGFscmVhZHkg
YmVjb21lIHRoZSBkZS0KPiBmYWN0bwo+IHN0YW5kYXJkIHdoZW4gdGhleSBib3JuZWQsIHNvIHRo
ZXJlJ3Mgbm8gR2xpYmMvTXVzbCByZWxlYXNlcyBmb3IgdGhlbQo+IHdpdGhvdXQgR05VIGhhc2gg
c3VwcG9ydCwgYW5kIHRoZSB0cmFkaXRpb25hbCBTeXNWIGhhc2ggaXMganVzdAo+IHdhc3RpbmcK
PiBzcGFjZSBmb3IgdGhlbS4KPiAKPiBSZW1vdmUgdGhvc2Ugc2V0dGluZ3MgYW5kIGZvbGxvdyB0
aGUgZGlzdHJvIHRvb2xjaGFpbiBkZWZhdWx0LCB3aGljaAo+IGlzCj4gbGlrZWx5IC0taGFzaC1z
dHlsZT1nbnUuwqAgSW4gdGhlIHBhc3QgaXQgY291bGQgYnJlYWsgdkRTTyBzZWxmIHRlc3RzLAo+
IGJ1dCBub3cgdGhlIGlzc3VlIGhhcyBiZWVuIGFkZHJlc3NlZCBieSBjb21taXQKPiBlMDc0NmJk
ZTZmODIgKCJzZWxmdGVzdHMvdkRTTzogc3VwcG9ydCBEVF9HTlVfSEFTSCIpLgo+IAo+IFhpIFJ1
b3lhbyAoMyk6Cj4gwqAgcmlzY3Y6IHZEU086IFJlbW92ZSAtLWhhc2gtc3R5bGU9Ym90aAo+IMKg
IGNza3k6IHZEU086IFJlbW92ZSAtLWhhc2gtc3R5bGU9Ym90aAo+IMKgIExvb25nQXJjaDogdkRT
TzogUmVtb3ZlIC0taGFzaC1zdHlsZT1zeXN2Cj4gCj4gwqBhcmNoL2Nza3kva2VybmVsL3Zkc28v
TWFrZWZpbGXCoCB8IDIgKy0KPiDCoGFyY2gvbG9vbmdhcmNoL3Zkc28vTWFrZWZpbGXCoMKgwqAg
fCAyICstCj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgMiArLQo+IMKgMyBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCgotLSAKWGkg
UnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBh
bmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
