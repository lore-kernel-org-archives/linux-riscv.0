Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD7ACCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AtrOlhwLrblNmyZexBA6riEiVJzFbBXcvF3gE+RarM=; b=UeNEDJEL3akIrM
	YI3hh6YtiGodD82gAEngftWPUfQclAPUPB0QUXR+NyTYKFMwcBelgRrDy0V6K40f6lIp6JK4TJFfx
	F1HGbK2KZef6jNejPJvKFXxkexd2brKe2LO6bonjvndFmElFxI5WpeEwKAC2kH3DdGCukYUYAC9Ml
	B3+olzTNzA9FYKSrtCVWORn0vhD+QgGvmlld6gvFkm7Tzaw2mHJz6Gix6mfsVmNORDsx614wLe2VU
	VWftDiWP2ifl09i0j/NxzsDKaWszrkCj25a61IeSm/i8a39zPUC8Ofpo8tOgM0x+jqEAk+aCqZ49T
	NHkPBLBg6KovmxU/0VQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lQ6-00000005P0M-0Nh6;
	Thu, 09 Oct 2025 07:50:38 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lQ3-00000005OzU-385m;
	Thu, 09 Oct 2025 07:50:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj22T4GVLz9sSy;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-hrpkSiMM5A; Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj22T2bCVz9sSq;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E1858B768;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iEsvyTlwygx4; Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4940A8B767;
	Thu,  9 Oct 2025 09:44:31 +0200 (CEST)
Message-ID: <1fb2259f-65e1-4cd0-ae70-b355843970e4@csgroup.eu>
Date: Thu, 9 Oct 2025 09:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-9-david@redhat.com>
 <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
 <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_005035_951513_E6E81DCD 
X-CRM114-Status: GOOD (  10.00  )
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

CgpMZSAwOS8xMC8yMDI1IMOgIDA5OjIyLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+
IE9uIDA5LjEwLjI1IDA5OjE0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+PiBIaSBEYXZpZCwK
Pj4KPj4gTGUgMDEvMDkvMjAyNSDDoCAxNzowMywgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTC
oDoKPj4+IExldCdzIGNoZWNrIHRoYXQgbm8gaHN0YXRlIHRoYXQgY29ycmVzcG9uZHMgdG8gYW4g
dW5yZWFzb25hYmxlIGZvbGlvIAo+Pj4gc2l6ZQo+Pj4gaXMgcmVnaXN0ZXJlZCBieSBhbiBhcmNo
aXRlY3R1cmUuIElmIHdlIHdlcmUgdG8gc3VjY2VlZCByZWdpc3RlcmluZywgd2UKPj4+IGNvdWxk
IGxhdGVyIHRyeSBhbGxvY2F0aW5nIGFuIHVuc3VwcG9ydGVkIGdpZ2FudGljIGZvbGlvIHNpemUu
Cj4+Pgo+Pj4gRnVydGhlciwgbGV0J3MgYWRkIGEgQlVJTERfQlVHX09OKCkgZm9yIGNoZWNraW5n
IHRoYXQgSFVHRVRMQl9QQUdFX09SREVSCj4+PiBpcyBzYW5lIGF0IGJ1aWxkIHRpbWUuIEFzIEhV
R0VUTEJfUEFHRV9PUkRFUiBpcyBkeW5hbWljIG9uIHBvd2VycGMsIAo+Pj4gd2UgaGF2ZQo+Pj4g
dG8gdXNlIGEgQlVJTERfQlVHX09OX0lOVkFMSUQoKSB0byBtYWtlIGl0IGNvbXBpbGUuCj4+Pgo+
Pj4gTm8gZXhpc3Rpbmcga2VybmVsIGNvbmZpZ3VyYXRpb24gc2hvdWxkIGJlIGFibGUgdG8gdHJp
Z2dlciB0aGlzIGNoZWNrOgo+Pj4gZWl0aGVyIFNQQVJTRU1FTSB3aXRob3V0IFNQQVJTRU1FTV9W
TUVNTUFQIGNhbm5vdCBiZSBjb25maWd1cmVkIG9yCj4+PiBnaWdhbnRpYyBmb2xpb3Mgd2lsbCBu
b3QgZXhjZWVkIGEgbWVtb3J5IHNlY3Rpb24gKHRoZSBjYXNlIG9uIHNwYXJzZSkuCj4+Pgo+Pj4g
UmV2aWV3ZWQtYnk6IFppIFlhbiA8eml5QG52aWRpYS5jb20+Cj4+PiBSZXZpZXdlZC1ieTogTG9y
ZW56byBTdG9ha2VzIDxsb3JlbnpvLnN0b2FrZXNAb3JhY2xlLmNvbT4KPj4+IFJldmlld2VkLWJ5
OiBMaWFtIFIuIEhvd2xldHQgPExpYW0uSG93bGV0dEBvcmFjbGUuY29tPgo+Pj4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+Cj4+IEkgZ2V0IGZv
bGxvd2luZyB3YXJuaW5nIG9uIHBvd2VycGMgd2l0aCBsaW51cyB0cmVlLCBiaXNlY3RlZCB0byBj
b21taXQKPj4gN2I0ZjIxZjVlMDM4ICgibW0vaHVnZXRsYjogY2hlY2sgZm9yIHVucmVhc29uYWJs
ZSBmb2xpbyBzaXplcyB3aGVuCj4+IHJlZ2lzdGVyaW5nIGhzdGF0ZSIpCj4gCj4gRG8geW91IGhh
dmUgdGhlIGtlcm5lbCBjb25maWcgYXJvdW5kPyBJcyBpdCAzMmJpdD8KPiAKPiBUaGF0IHdvdWxk
IGJlIGhlbHBmdWwuCgpUaGF0J3MgY29yZW5ldDY0X3NtcF9kZWZjb25maWcKCkJvb3Qgb24gUUVN
VSB3aXRoOgoKCXFlbXUtc3lzdGVtLXBwYzY0IC1zbXAgMiAtbm9ncmFwaGljIC1NIHBwY2U1MDAg
LWNwdSBlNTUwMCAtbSAxRwoKCgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
