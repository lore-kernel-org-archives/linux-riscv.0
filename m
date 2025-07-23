Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC124C83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 21:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgft4U5VQaHGEFMOF4vnEtj63ZaRufiVzSyt4lHAEMs=; b=SgjG90fXRQfdzu
	H31CV/VaCOmSpDpbhOLjfJ85w8dGe9KCd5ORlCJa+M/jB8A5UEyscuXJnJlrWkQQuiht2J2CbZAdh
	PUYrFT5Gu+4LwrTLCTJqRdLWLtj8U2dly3kra81v0/1Sm5oddrCzh2cZuooMWPQreFKZW3XeOiIdm
	Q1qy+OPuKUTX98SJmUKnvqg9kyPCSx+7Np+pW4gmCyIZ2DGbIHuFCYq4dhXIl3DzMR1QN//1GYBEZ
	pt+6pqEdvJn+tx3jSPpUkJfV3WX6rcpjYitqfNwPvI78sewGX9ZB7DBbQJKCD5xCvg9jv1LylJQwy
	TcMZ1HKQDros3i3qEbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehRd-000000060VD-0K2G;
	Wed, 23 Jul 2025 21:56:13 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehRW-000000060Tr-3hZ6
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 21:56:11 +0000
Received: from [192.168.0.110] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowABHn19pWoFo4_WXBg--.21325S2;
	Thu, 24 Jul 2025 05:55:55 +0800 (CST)
Message-ID: <cc82c938-def3-4df6-9fc9-fc321af7d54a@iscas.ac.cn>
Date: Thu, 24 Jul 2025 05:55:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
To: Drew Fustini <fustini@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Drew Fustini <dfustini@tenstorrent.com>, Andy Chiu <andybnac@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250719033912.1313955-1-fustini@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250719033912.1313955-1-fustini@kernel.org>
X-CM-TRANSID: zQCowABHn19pWoFo4_WXBg--.21325S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr17CF1fJr15Zr4DGr4fGrg_yoW8Ww13pF
	sFgrsIkw1rZr4fAwnIqw4xuw4rKrZ5G3y5JFy3Kw42yayUGF90yrs8JayjqFy7Jry5GrW0
	vF4ru348Cw1UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUqiFxDUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_145607_287849_A71B4829 
X-CRM114-Status: GOOD (  11.19  )
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

T24gNy8xOS8yNSAxMTozOSwgRHJldyBGdXN0aW5pIHdyb3RlOgoKPiBGcm9tOiBEcmV3IEZ1c3Rp
bmkgPGRmdXN0aW5pQHRlbnN0b3JyZW50LmNvbT4KPgo+IENsb2JiZXJpbmcgdGhlIHZlY3RvciBy
ZWdpc3RlcnMgY2FuIHNpZ25pZmljYW50bHkgaW5jcmVhc2Ugc3lzdGVtIGNhbGwKPiBsYXRlbmN5
IGZvciBzb21lIGltcGxlbWVudGF0aW9ucy4gVG8gbWl0aWdhdGUgdGhpcyBwZXJmb3JtYW5jZSBp
bXBhY3QsIGEKPiBwb2xpY3kgbWVjaGFuaXNtIGlzIHByb3ZpZGVkIHRvIGFkbWluaXN0cmF0b3Jz
LCBkaXN0cm8gbWFpbnRhaW5lcnMsIGFuZAo+IGRldmVsb3BlcnMgdG8gY29udHJvbCB2ZWN0b3Ig
c3RhdGUgZGlzY2FyZCBpbiB0aGUgZm9ybSBvZiBhIHN5c2N0bCBrbm9iOgoKU28gSSBoYWQgYW4g
aWRlYTogSXMgaXQgcG9zc2libGUgdG8gYXZvaWQgcmVwZWF0ZWRseSBkaXNjYXJkaW5nIHRoZQpz
dGF0ZSBvbiBldmVyeSBzeXNjYWxsIGJ5IHNldHRpbmcgVlMgdG8gSW5pdGlhbCBhZnRlciBkaXNj
YXJkaW5nLCBhbmQKYXZvaWRpbmcgZGlzY2FyZGluZyB3aGVuIFZTIGlzIEluaXRpYWw/IFNvOgoK
aWYgKFZTID09IENsZWFuIHx8IFZTID09IERpcnR5KSB7CsKgIMKgIGNsb2JiZXI7CsKgIMKgIFZT
ID0gSW5pdGlhbDsKfQoKVGhpcyB3b3VsZCBhdm9pZCB0aGlzIHByb2JsZW0gd2l0aCBzeXNjYWxs
LWhlYXZ5IHVzZXIgcHJvZ3JhbXMgd2hpbGUKYWRkaW5nIG1pbmltdW0gb3ZlcmhlYWQgZm9yIGV2
ZXJ5dGhpbmcgZWxzZS4KCk5vdGUgdGhhdCBJIGhhdmVuJ3QgY2hlY2tlZCBjbG9zZWx5IG9uIGhv
dyBWUyA9IEluaXRpYWwgaXMgY3VycmVudGx5CnVzZWQgaW4gTGludXguIFRoaXMgbWlnaHQgcmVx
dWlyZSBjaGFuZ2VzIHRvIHZlY3RvciBpbml0IG1ha2UgdGhlIHJlYWxseQpmaXJzdC10aW1lIGlu
aXRpYWwgc3RhdGUgYW5kIHRoZSBhZnRlci1zeXNjYWxsIGluaXRpYWwgc3RhdGUgdGhlIHNhbWUu
Ck9yIG1heWJlIEkgbWlzdW5kZXJzdG9vZCBlbnRpcmVseS4KClZpdmlhbiAiZHJhbWZvcmV2ZXIi
IFdhbmcKCj4gL3Byb2Mvc3lzL2FiaS9yaXNjdl92X3ZzdGF0ZV9kaXNjYXJkCj4KPiBWYWxpZCB2
YWx1ZXMgYXJlOgo+Cj4gMDogRG8gbm90IGRpc2NhcmQgdmVjdG9yIHN0YXRlIGR1cmluZyBzeXNj
YWxsCj4gMTogRGlzY2FyZCB2ZWN0b3Igc3RhdGUgZHVyaW5nIHN5c2NhbGwKPgo+IFRoZSBpbml0
aWFsIHN0YXRlIGlzIGNvbnRyb2xsZWQgYnkgQ09ORklHX1JJU0NWX0lTQV9WX1ZTVEFURV9ESVND
QVJELgo+Cj4gRml4ZXM6IDk2NTdlOWI3ZDI1MyAoInJpc2N2OiBEaXNjYXJkIHZlY3RvciBzdGF0
ZSBvbiBzeXNjYWxscyIpCj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUB0
ZW5zdG9ycmVudC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi92ZWN0b3Iu
cnN0IHwgMTUgKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgIHwgMTAgKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5o
ICAgICB8ICA0ICsrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAgfCAx
NiArKysrKysrKysrKysrKystCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gWy4uLl0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
