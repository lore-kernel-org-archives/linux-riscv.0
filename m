Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9215C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 07:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6zknkC9uA9wf7LnfaxnJECuP3HagwJ5jyPOQgixtSY=; b=s7oqho4Ijn2UAq
	TmMaYX44BZatgFMjTOdvqO0cDwXwjqauvkFuNK8MdaYUaYEmlYSFLzt0Fw0jtAcmpc90EGt3ZhSRk
	G31AXBrLkhoGh6X13t7ct97G1t7ZGun1yb/yg7NV8eEMEtijA2U7xdEfmjKahXf6mBn5KWZKMb1Kn
	EQ7iiIuMv8MjjgQuzIbReTCbOZGuuYPUvBbT4G/UcNXF1X6lJGzznR9MBaUSUtZZffFG9IXDd30M8
	QSi1E8LmCXBBDhJ4FkM5Vb6QEQ1YiCt7T7DFAfSi0f+nSWNAMAn/X/1CKxD5IsQJNcXW90SccWeyb
	ZjdjYyiM++WZ7fCKBD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU1I-0000000AA2p-40CS;
	Thu, 13 Feb 2025 07:52:24 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTz9-0000000A9ir-18UD
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 07:50:12 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ytn0M0XJrz9sRr;
	Thu, 13 Feb 2025 08:30:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uu8P4f59axSR; Thu, 13 Feb 2025 08:30:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ytn0K07lPz9sRk;
	Thu, 13 Feb 2025 08:30:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F36278B763;
	Thu, 13 Feb 2025 08:30:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Abk2ZXThmqKy; Thu, 13 Feb 2025 08:30:40 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B3D28B770;
	Thu, 13 Feb 2025 08:30:40 +0100 (CET)
Message-ID: <fc4954d8-3ea6-4542-a5e8-17da2bb9650d@csgroup.eu>
Date: Thu, 13 Feb 2025 08:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mm: Make GENERIC_PTDUMP dependent on MMU
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-4-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250213040934.3245750-4-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_235011_470587_76298520 
X-CRM114-Status: GOOD (  13.73  )
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

CgpMZSAxMy8wMi8yMDI1IMOgIDA1OjA5LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IFRoZXJlIGlzIG5vIHBhZ2UgdGFibGUgZHVtcCB3aXRob3V0IGEgTU1VLiBNYWtlIHRoaXMgZGVw
ZW5kZW5jeSBhdCBnZW5lcmljCj4gbGV2ZWwgYW5kIGRyb3AgdGhlIHNhbWUgZnJvbSByaXNjdiBw
bGF0Zm9ybSBpbnN0ZWFkLgo+IAo+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNp
Zml2ZS5jb20+Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gQ2M6
IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IGxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFu
ZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvS2Nv
bmZpZyB8IDIgKy0KPiAgIG1tL0tjb25maWcuZGVidWcgICB8IDEgKwo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggNzYxMmM1MmU5YjFl
Li5jNGNkYmE2NDYwYjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTExMiw3ICsxMTIsNyBAQCBjb25maWcgUklTQ1YKPiAg
IAlzZWxlY3QgR0VORVJJQ19JUlFfU0hPV19MRVZFTAo+ICAgCXNlbGVjdCBHRU5FUklDX0xJQl9E
RVZNRU1fSVNfQUxMT1dFRAo+ICAgCXNlbGVjdCBHRU5FUklDX1BDSV9JT01BUAo+IC0Jc2VsZWN0
IEdFTkVSSUNfUFREVU1QIGlmIE1NVQo+ICsJc2VsZWN0IEdFTkVSSUNfUFREVU1QCgpBcmUgeW91
IHN1cmUgdGhpcyB3b3JrcyBhcyBleHBlY3RlZCA/CgpTZWUgaHR0cHM6Ly9kb2NzLmtlcm5lbC5v
cmcva2J1aWxkL2tjb25maWctbGFuZ3VhZ2UuaHRtbCA6CgpOb3RlOgogICAgIHNlbGVjdCBzaG91
bGQgYmUgdXNlZCB3aXRoIGNhcmUuIHNlbGVjdCB3aWxsIGZvcmNlIGEgc3ltYm9sIHRvIGEgCnZh
bHVlIHdpdGhvdXQgdmlzaXRpbmcgdGhlIGRlcGVuZGVuY2llcy4gQnkgYWJ1c2luZyBzZWxlY3Qg
eW91IGFyZSBhYmxlIAp0byBzZWxlY3QgYSBzeW1ib2wgRk9PIGV2ZW4gaWYgRk9PIGRlcGVuZHMg
b24gQkFSIHRoYXQgaXMgbm90IHNldC4gSW4gCmdlbmVyYWwgdXNlIHNlbGVjdCBvbmx5IGZvciBu
b24tdmlzaWJsZSBzeW1ib2xzIChubyBwcm9tcHRzIGFueXdoZXJlKSAKYW5kIGZvciBzeW1ib2xz
IHdpdGggbm8gZGVwZW5kZW5jaWVzLgoKPiAgIAlzZWxlY3QgR0VORVJJQ19TQ0hFRF9DTE9DSwo+
ICAgCXNlbGVjdCBHRU5FUklDX1NNUF9JRExFX1RIUkVBRAo+ICAgCXNlbGVjdCBHRU5FUklDX1RJ
TUVfVlNZU0NBTEwgaWYgTU1VICYmIDY0QklUCj4gZGlmZiAtLWdpdCBhL21tL0tjb25maWcuZGVi
dWcgYi9tbS9LY29uZmlnLmRlYnVnCj4gaW5kZXggYTUxYTExNDk5MDlhLi5jMDg0MDY3NjBkMjkg
MTAwNjQ0Cj4gLS0tIGEvbW0vS2NvbmZpZy5kZWJ1Zwo+ICsrKyBiL21tL0tjb25maWcuZGVidWcK
PiBAQCAtMjE0LDYgKzIxNCw3IEBAIGNvbmZpZyBERUJVR19XWAo+ICAgCSAgSWYgaW4gZG91YnQs
IHNheSAiWSIuCj4gICAKPiAgIGNvbmZpZyBHRU5FUklDX1BURFVNUAo+ICsJZGVwZW5kcyBvbiBN
TVUKPiAgIAlib29sCj4gICAKPiAgIGNvbmZpZyBQVERVTVBfQ09SRQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
