Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D40CA1015
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Im3KkHqPzwEIt6zZgxQSfKmNykOUzpET3rjRGqhci+I=; b=M4upswkSYRe2tF
	En4k7GLhBaMe/C5FoQ7EBiHJ99cCupI1Nehtz5sewilH6XwNzRwEiy7f7f1ZOWCjDiQN0QLtRW/3d
	xz+/wwrErdgOeqQyMghk2VoQW5m9CdQUoyeLYdhauZNnBagIbemR2hEYT5qkAAhXAljBOg0WDVW7r
	y42t80R8OYvMhdm1ou6AZU+RRrwr79Q26GP0bkSntKVs1oDIkogt49Smnka6LrNR8bcD5Zl5IcDqt
	aw2vJH+i5tTCmzSgSZmPdb8K6ei3RBpjZZN/+NVszODTEg4No3RU9MyhFaTF3fAjR3GTYWIuA5ckb
	9e+llFIgT0tNVmuQKq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4Uq-00000009uIj-1IO6;
	Thu, 04 Sep 2025 07:35:04 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4HU-00000009oxM-2OVA;
	Thu, 04 Sep 2025 07:21:17 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cHVwp4xsdz9sVh;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEv7Y2YJZkgd; Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cHVwp4BWrz9sVk;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 784388B764;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JZAEJLwTYdG3; Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 23FBF8B763;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Message-ID: <3b333f4e-9817-4a5b-bf0a-f8a9d33575e9@csgroup.eu>
Date: Thu, 4 Sep 2025 09:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] powerpc: Stop calling page_address() in
 free_pages()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-6-vishal.moola@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250903185921.1785167-6-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_002116_760726_14CEED98 
X-CRM114-Status: GOOD (  11.61  )
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

CgpMZSAwMy8wOS8yMDI1IMOgIDIwOjU5LCBWaXNoYWwgTW9vbGEgKE9yYWNsZSkgYSDDqWNyaXTC
oDoKPiBmcmVlX3BhZ2VzKCkgc2hvdWxkIGJlIHVzZWQgd2hlbiB3ZSBvbmx5IGhhdmUgYSB2aXJ0
dWFsIGFkZHJlc3MuIFdlCj4gc2hvdWxkIGNhbGwgX19mcmVlX3BhZ2VzKCkgZGlyZWN0bHkgb24g
b3VyIHBhZ2UgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaXNoYWwgTW9vbGEgKE9yYWNs
ZSkgPHZpc2hhbC5tb29sYUBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJpdGVzaCBIYXJqYW5p
IChJQk0pIDxyaXRlc2gubGlzdEBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgoKPiAtLS0KPiAgIGFyY2gvcG93ZXJw
Yy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9yYWRpeF9wZ3RhYmxlLmMKPiBpbmRleCBiZTUyM2U1ZmU5YzUuLjczOTc3ZGJhYmNmMiAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jCj4gKysr
IGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYwo+IEBAIC03ODAsNyAr
NzgwLDcgQEAgc3RhdGljIHZvaWQgX19tZW1pbml0IGZyZWVfdm1lbW1hcF9wYWdlcyhzdHJ1Y3Qg
cGFnZSAqcGFnZSwKPiAgIAkJd2hpbGUgKG5yX3BhZ2VzLS0pCj4gICAJCQlmcmVlX3Jlc2VydmVk
X3BhZ2UocGFnZSsrKTsKPiAgIAl9IGVsc2UKPiAtCQlmcmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25n
KXBhZ2VfYWRkcmVzcyhwYWdlKSwgb3JkZXIpOwo+ICsJCV9fZnJlZV9wYWdlcyhwYWdlLCBvcmRl
cik7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIF9fbWVtaW5pdCByZW1vdmVfcHRlX3RhYmxl
KHB0ZV90ICpwdGVfc3RhcnQsIHVuc2lnbmVkIGxvbmcgYWRkciwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
