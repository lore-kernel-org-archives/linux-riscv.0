Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B820C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPdBwjqQOx4i3JjI1IR6mXxGpk0zmXXLByC9bmLqbsk=; b=CJMCACxs7cTkeN
	KevI+OUnU5BEPAqQvFalXLe3tTIFLZskvXwm4Z8gIj18XYbaAuiD326j/Vjwii//6XYXLbYxkvo/H
	vHWbuSOTFB5fY/F6wEYRSQXj8hWDAZaDlFhJV3kPw289kuy29Tfp2yvlnVg0pR8pySjZJe0iL07Q1
	Ayu3cwYf32PltpUuNBIx00VhNBD9VFPwDLlZR38WX9J3jNEK2XaqSclu+ewYnwuhdJhqzC6GGSohR
	yE9LENSl9L3rKfwBRCUdJzE/f2iyLUJ2ofyfIssuRmsbLQdd1UconTt2f3kzzS6WiXMbVC8espL1c
	mcXSyF2RI0yye8TFUsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPQh-00BVOd-2Q;
	Fri, 12 May 2023 09:51:15 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPQe-00BVNn-1g
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 09:51:14 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 5C7EF24000C;
	Fri, 12 May 2023 09:51:04 +0000 (UTC)
Message-ID: <bea1128b-903c-a7d0-9929-d9667999bb6d@ghiti.fr>
Date: Fri, 12 May 2023 11:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH AUTOSEL 6.3 5/7] riscv: Unconditionnally select
 KASAN_VMALLOC if KASAN
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
References: <20230509035455.59524-1-sashal@kernel.org>
 <20230509035455.59524-5-sashal@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230509035455.59524-5-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_025112_693003_0B9F512E 
X-CRM114-Status: GOOD (  12.54  )
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

SGkgU2FzaGEsCgpPbiA1LzkvMjMgMDU6NTQsIFNhc2hhIExldmluIHdyb3RlOgo+IEZyb206IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPgo+IFsgVXBzdHJlYW0gY29t
bWl0IDg2NDA0NmM1MTJjMmNkODQxOGRjOTI4YjkxOTgxZmIxMmE4MDM5NmMgXQo+Cj4gSWYgS0FT
QU4gaXMgZW5hYmxlZCwgVk1BUF9TVEFDSyBkZXBlbmRzIG9uIEtBU0FOX1ZNQUxMT0Mgc28gZW5h
YmxlCj4gS0FTQU5fVk1BTExPQyB3aXRoIEtBU0FOIHNvIHRoYXQgd2UgY2FuIGVuYWJsZSBWTUFQ
X1NUQUNLIGJ5IGRlZmF1bHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwMjAz
MDc1MjMyLjI3NDI4Mi03LWFsZXhnaGl0aUByaXZvc2luYy5jb20KPiBTaWduZWQtb2ZmLWJ5OiBQ
YWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L0tjb25maWcg
fCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IGViN2YyOWE0
MTJmODcuLmQ2YWFkODRlZmI5NWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4g
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTExOCw2ICsxMTgsNyBAQCBjb25maWcgUklT
Q1YKPiAgIAlzZWxlY3QgSEFWRV9TWVNDQUxMX1RSQUNFUE9JTlRTCj4gICAJc2VsZWN0IElSUV9E
T01BSU4KPiAgIAlzZWxlY3QgSVJRX0ZPUkNFRF9USFJFQURJTkcKPiArCXNlbGVjdCBLQVNBTl9W
TUFMTE9DIGlmIEtBU0FOCj4gICAJc2VsZWN0IE1PRFVMRVNfVVNFX0VMRl9SRUxBIGlmIE1PRFVM
RVMKPiAgIAlzZWxlY3QgTU9EVUxFX1NFQ1RJT05TIGlmIE1PRFVMRVMKPiAgIAlzZWxlY3QgT0YK
CgpLQVNBTl9WTUFMTE9DIGlzIGJyb2tlbiBmb3IgYW55IGtlcm5lbCA8IDYuNCwgc28gdGhpcyBv
bmUgc2hvdWxkIG5vdCBiZSAKYmFja3BvcnRlZCB0byBhbnkga2VybmVsICg1LjE1LCA2LjEsIDYu
MiwgNi4zKS4KClRoYW5rcywKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
