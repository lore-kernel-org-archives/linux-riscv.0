Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCD5C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wi4pnjs8GwBi8zUFCNikiabpZopZNOVlda/HNe3E12k=; b=gSooEw7TDJqiwH
	eRk0YP/wMPh1pNWZhEir/fklpAkPHRbzAMoNf0AQ8cEvs0oIIetlctC0msheOIayoQScpeBRZX10E
	bPdBNU0b/zFvJtbZUeV9GDiV1cG2RNPT+R9oCw0D6kz1SGBHrOtYZiSPFbGIYsoz9sddJSYzvdHkI
	XEAdZeYd2ezfKwi+nfGhs9Jg15GjEzQEif+FS47Ucs07rsCxJ3P5KKLaiXKQl9mg/I3l2Zn8tyfWB
	YNsUwXnBMLJPGPXmUrOQGg49/C6x+/u8CQTE4hDWZiwQ+78M5dtDRm3WjeqbF1R+hn4ewZ7gMELOu
	cuU8OHact6ipkZ9AaqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ExX-007L7k-3A;
	Wed, 29 Nov 2023 07:26:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ExV-007L6z-31
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 07:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1126161074;
	Wed, 29 Nov 2023 07:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E1FC433C7;
	Wed, 29 Nov 2023 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701242765;
	bh=biOcubOKNWe5u7s7FVXUwB6kp4z/tZ1yJjeXTA9SkOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dKRwAHHxEK5oEbB4OuN7Qe996knj1kcl+SeUFrJixP7nogiWlhFUHk71ZWjMVQqF3
	 Q3UCwTPnUgjH2npnOd/pG6pYmU/hqWwS4oyjTO9t6Kkf0LgWfaaFznmPjSVvhLGmd4
	 hokbwNlSYWbf/3B8LBv31oNJYY/EucBnOWb6dwn/fTzDAtevKsN91fc+uJjEjXxXMf
	 Rx91USHouCFSWsyWJJBAh0nW90HG8tFpnl5ycDkHUSYgKWI6EBGRLR1LOSIkJKBTBl
	 J28CNT48lL24GGnIqubtUoGSFMhgMsnoNkW1fV4e8QIDwLJod+ko9SlSfnmL2bj2ZI
	 TXNRfSRxghZug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Ron Economos <re@w6rz.net>, Samuel Holland
 <samuel.holland@sifive.com>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Charlie
 Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 0/2] riscv: Fix issues with module loading
In-Reply-To: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
References: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
Date: Wed, 29 Nov 2023 08:26:01 +0100
Message-ID: <87bkbd9g1i.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_232610_078641_83791075 
X-CRM114-Status: GOOD (  11.35  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgoKPiBNb2R1bGUg
bG9hZGluZyBkaWQgbm90IGFjY291bnQgZm9yIG11bHRpcGxlIHRocmVhZHMgY29uY3VycmVudGx5
IGxvYWRpbmcKPiBtb2R1bGVzLiBUaGlzIHBhdGNoIGZpeGVzIHRoYXQgaXNzdWUuIFRoZXJlIGlz
IGFsc28gYSBzbWFsbCBwYXRjaCB0byBmaXgKPiB0aGUgdHlwZSBvZiBhIF9fbGUxNiB2YXJpYWJs
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIE1ha2UgZnVuY3Rpb25zIG9ubHkgdXNlZCBp
bnRlcm5hbGx5IHN0YXRpYwo+IC0gRnJlZSBkYXRhIHN0cnVjdHVyZXMgb24ga21hbGxvYyBmYWls
dXJlIChBbmRyZWFzKQo+IC0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIzMTEyMi1tb2R1bGVfbGlua2luZ19mcmVlaW5nLXYzLTAtOGU5ZTQxMmEzMzA1QHJpdm9zaW5j
LmNvbQo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIENsZWFudXAgcG9pbnRlciBwYXNzaW5nIChTYW11
ZWwpCj4gLSBDb3JyZWN0IGluZGVudGF0aW9uIChTYW11ZWwpCj4gLSBDaGVjayBmb3Iga21hbGxv
YyBmYWlsdXJlcyAoU2FtdWVsKQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDIzMTEyMS1tb2R1bGVfbGlua2luZ19mcmVlaW5nLXYyLTEtOTc0YmZjZDM2NjRlQHJp
dm9zaW5jLmNvbQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFN1cHBvcnQgbGlua2luZyBtb2R1bGVz
IGNvbmN1cnJlbnRseSBhY3Jvc3MgdGhyZWFkcy4KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyMzExMjAtbW9kdWxlX2xpbmtpbmdfZnJlZWluZy12MS0xLWZmZjgx
ZDcyODlmY0ByaXZvc2luYy5jb20KPgo+IC0tLQo+IENoYXJsaWUgSmVua2lucyAoMik6Cj4gICAg
ICAgcmlzY3Y6IFNhZmVseSByZW1vdmUgZW50cmllcyBmcm9tIHJlbG9jYXRpb24gbGlzdAo+ICAg
ICAgIHJpc2N2OiBDb3JyZWN0IHR5cGUgY2FzdGluZyBpbiBtb2R1bGUgbG9hZGluZwoKSSBnb3Qg
aGl0IGJ5IHRoaXMgb24gUUVNVSBmb3IgNi43LXJjMzoKICB8IFVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyA2YjZiNmI2YjZiNmI2YjgzCiAg
fCBPb3BzIFsjMV0KICB8IE1vZHVsZXMgbGlua2VkIGluOgogIHwgQ1BVOiAzIFBJRDogMSBDb21t
OiBzeXN0ZW1kIE5vdCB0YWludGVkIDYuNy4wLXJjMyAjMQogIHwgSGFyZHdhcmUgbmFtZTogcmlz
Y3YtdmlydGlvLHFlbXUgKERUKQogIHwgZXBjIDogcHJvY2Vzc19hY2N1bXVsYXRlZF9yZWxvY2F0
aW9ucysweDcwLzB4MTYyCiAgfCAgcmEgOiBwcm9jZXNzX2FjY3VtdWxhdGVkX3JlbG9jYXRpb25z
KzB4OTYvMHgxNjIKICB8IGVwYyA6IGZmZmZmZmZmODAwMGM1MjggcmEgOiBmZmZmZmZmZjgwMDBj
NTRlIHNwIDogZmYyMDAwMDAwMDAyM2FiMAogIHwgIGdwIDogZmZmZmZmZmY4MjU3ZmVhMCB0cCA6
IGZmNjAwMDAwODA4NjAwNDAgdDAgOiBmZjYwMDAwMDgzOTM0ZDY4CiAgfCAgdDEgOiAwMDAwMDAw
MDAwMDAwMDA2IHQyIDogMDAwMDAwMDAwMDAwMDAwMiBzMCA6IGZmMjAwMDAwMDAwMjNiMzAKICB8
ICBzMSA6IDZiNmI2YjZiNmI2YjZiNmIgYTAgOiBmZmZmZmZmZjgwZWQ0OGQ4IGExIDogMDAwMDAw
MDAwMDAwMDAwMAogIHwgIGEyIDogZmYxYzAwMDAwNDBhOTYxMCBhMyA6IDAwMDAwMDAwMDAwMDAw
MDAgYTQgOiAwMDAwMDAwMDAwMDAwMDAwCiAgfCAgYTUgOiBmZjYwMDAwMDgzMmQ2OTkwIGE2IDog
ZmYxYzAwMDAwNDBlNGQxMCBhNyA6IDAwMDAwMDAwMGJiYjFkNmQKICB8ICBzMiA6IDAwMDAwMDAw
MDAwMDAwMjMgczMgOiAwMDAwMDAwMDAwMDAwMjMwIHM0IDogZmZmZmZmZmYwMjY0ZGQ0MAogIHwg
IHM1IDogMDAwMDAwMDAwMDAwMDAzZSBzNiA6IGZmZmZmZmZmODE0MDE4OTggczcgOiBmZmZmZmZm
ZjAyNjRkMDQwCiAgfCAgczggOiBmZjYwMDAwMDgzOTM0ZTgwIHM5IDogZmZmZmZmZmY4MjViNzI0
MCBzMTA6IGZmNjAwMDAwODM5MzRkZTAKICB8ICBzMTE6IGZmMjAwMDAwMDA3YTI1YjAgdDMgOiBm
ZmZmZmZmZjAyNjRkMDAwIHQ0IDogZmZmZmZmZmYwMjY0ZDA0MAogIHwgIHQ1IDogMDAwMDAwMDAw
MDAwMDAxNyB0NiA6IGZmNjAwMDAwODMzNjdlYjgKICB8IHN0YXR1czogMDAwMDAwMDIwMDAwMDEy
MCBiYWRhZGRyOiA2YjZiNmI2YjZiNmI2YjgzIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCiAgfCBb
PGZmZmZmZmZmODAwMGM1Mjg+XSBwcm9jZXNzX2FjY3VtdWxhdGVkX3JlbG9jYXRpb25zKzB4NzAv
MHgxNjIKICB8IFs8ZmZmZmZmZmY4MDAwY2E5YT5dIGFwcGx5X3JlbG9jYXRlX2FkZCsweDE0Mi8w
eDM3YQogIHwgWzxmZmZmZmZmZjgwMGU3OWYwPl0gbG9hZF9tb2R1bGUrMHgxNzIwLzB4MjI3Ywog
IHwgWzxmZmZmZmZmZjgwMGU4NzkwPl0gaW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4ODIvMHhiYQog
IHwgWzxmZmZmZmZmZjgwMGU4OTQwPl0gX19yaXNjdl9zeXNfZmluaXRfbW9kdWxlKzB4MTc4LzB4
MzAwCiAgfCBbPGZmZmZmZmZmODBlYzkxNjA+XSBkb190cmFwX2VjYWxsX3UrMHhjNi8weDE0Mgog
IHwgWzxmZmZmZmZmZjgwZWQ1Y2FjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDY0CiAgfCBD
b2RlOiAwNjBkIDM3ODMgMDEwZCAzODIzIGY4MDQgM2I4MyAwMThkIDYzODQgODM2MyAwYTk3IChh
OTAzKSAwMTg0IAogIHwgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCgpUaGlz
IHNlcmllcyByZXNvbHZlZCB0aGUgaXNzdWUgZm9yIG1lLgoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
