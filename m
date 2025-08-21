Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB059CA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 06:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xImly252RFk7zAX9pf8WhWsReQN7xSdEFxR6I7POIM=; b=K9PQGux94v0Sfd
	oNjU92xNBamaUl0ug8kMyt3s8iVXNqmFtNjghmbGSRbqim+/0gMcORDL4L0qjTpJhJzAhLoHhvBcX
	YuNtE6ASaBXxOaqTc9AVmAXV0EgI1DyFWV+o4b4coX89qboqqBNfOUPr4skKpHBWeggPKxc2oyDyV
	Wo3e9xx9a+E/uBQ06G6nGVAB9lnYuHt1l0g51VF5rKcF3unTYFPciVz/ucnqcVRhZt0TqtbKepsWd
	dL2KFdtuoqxXl1Tl9KDOJYqeSYlh3Ajn1lD3UKwygVWqvycAXEV2Va0YMwTtKwM4pKur+H13YsaBj
	nirjw3JG1+EY5qYJ/LmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz4I-0000000Fzc7-2gxy;
	Thu, 21 Aug 2025 06:46:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoynL-0000000Fxaj-0nfb
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 06:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755757745;
	bh=oScGVxYxElRoNaNscAJZx59aF4CUHiYp5n6VK4Ekqhc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=f6Y2cmZRdX0cSOHMuO4FqsOTJux5OXhWeAM7PKzyf/AvbVdC/hR0Ut2G60gnCOcLd
	 WHkFIy04wlGPbqrVNOkRtzxXuwp40/FsjB5F/cNFoo0snKjrhjXDL9OvJ4gakMBvSe
	 EFxgn7j03S8bcHquAEPPCMNw0oIORItPyMCa7OF+/3w7YQRe8xSzOLp8XNNNs6ED6L
	 ktwquup+Hbdil2LZuNAafnNmwFe6WUmXd2bgLQGsXEYuQlB3Ieay6kKworuFEzSyUy
	 8RRpiEKY53Rq1mxHbMxoafLh4lvtLODu2WQT4ROM/v31gkqyjUlCzhRh22bEKigAsr
	 p4ja4/QcAy+YQ==
Received: from [192.168.100.175] (unknown [103.151.43.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1EA517E0458;
	Thu, 21 Aug 2025 08:29:00 +0200 (CEST)
Message-ID: <8e9d7c59-46b4-4e1b-8a55-1898302f5080@collabora.com>
Date: Thu, 21 Aug 2025 11:28:59 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, kernel@collabora.com
Subject: Re: [PATCH v2 4/8] selftests/mm: Add -Wunused family of flags
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
 <20250731160132.1795351-5-usama.anjum@collabora.com>
 <57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_232907_379109_51B02D49 
X-CRM114-Status: GOOD (  16.48  )
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

T24gOC8xOC8yNSAxOjE2IFBNLCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+IE9uIDMxLzA3LzIwMjUg
MTg6MDEsIE11aGFtbWFkIFVzYW1hIEFuanVtIHdyb3RlOgo+PiBbLi4uXQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW0vTWFrZWZpbGUgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9tbS9NYWtlZmlsZQo+PiBpbmRleCAyM2Q0YmY2MjE1NDY1Li5kNzVmMWVmZmNi
NzkxIDEwMDY0NAo+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9NYWtlZmlsZQo+
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9NYWtlZmlsZQo+PiBAQCAtMjAsNyAr
MjAsNiBAQCBlbmRpZgo+PiAgIyB0aHVzIHRyaWNraW5nIE1ha2UgKGFuZCB5b3UhKSBpbnRvIGJl
bGlldmluZyB0aGF0IEFsbCBJcyBXZWxsLCBpbiBzdWJzZXF1ZW50Cj4+ICAjIG1ha2UgaW52b2Nh
dGlvbnM6Cj4+ICAuREVMRVRFX09OX0VSUk9SOgo+PiAtCj4+ICAjIEF2b2lkIGFjY2lkZW50YWwg
d3JvbmcgYnVpbGRzLCBkdWUgdG8gYnVpbHQtaW4gcnVsZXMgd29ya2luZyBqdXN0IGEgbGl0dGxl
Cj4+ICAjIGJpdCB0b28gd2VsbC0tYnV0IG5vdCBxdWl0ZSBhcyB3ZWxsIGFzIHJlcXVpcmVkIGZv
ciBvdXIgc2l0dWF0aW9uIGhlcmUuCj4+ICAjCj4+IEBAIC0zNSw2ICszNCw3IEBAIE1BS0VGTEFH
UyArPSAtLW5vLWJ1aWx0aW4tcnVsZXMKPj4gIAo+PiAgQ0ZMQUdTID0gLVdhbGwgLU8yIC1JICQo
dG9wX3NyY2RpcikgJChFWFRSQV9DRkxBR1MpICQoS0hEUl9JTkNMVURFUykgJChUT09MU19JTkNM
VURFUykKPj4gIENGTEFHUyArPSAtV3VucmVhY2hhYmxlLWNvZGUKPj4gK0NGTEFHUyArPSAtV3Vu
dXNlZCAgLVd1bnVzZWQtcGFyYW1ldGVyIC1XdW51c2VkLWZ1bmN0aW9uIC1XdW51c2VkLWxhYmVs
IC1XdW51c2VkLXZhcmlhYmxlIC1XdW51c2VkLXZhbHVlCj4gCj4gLVdhbGwgaW1wbGllcyBhbGwg
b2YgdGhlc2UgZXhjZXB0IC1XdW51c2VkLXBhcmFtZXRlciAoYXQgbGVhc3QgYWNjb3JkaW5nCj4g
dG8gZ2NjKDEpKS4KSSdsbCByZW1vdmUgb3RoZXJzIGluIHNlcGFyYXRlIHBhdGNoLgoKPiAKPiBB
cyB0byAtV3VudXNlZC1wYXJhbWV0ZXIgSSBhbSBmcmFua2x5IG5vdCBjb252aW5jZWQgaXQncyB3
b3J0aCB0aGUKPiBoYXNzbGUuIFdlJ3JlIGdldHRpbmcgOTAgbGluZXMgY2hhbmdlZCBpbiBwYXRj
aCA2LTgganVzdCB0byBtYXJrCj4gcGFyYW1ldGVycyBhcyB1bnVzZWQsIGluIG90aGVyIHdvcmRz
IG5vaXNlIHRvIGtlZXAgdGhlIGNvbXBpbGVyIGhhcHB5Lgo+IEl0IGlzIG5vdCBlbmFibGVkIGJ5
IGRlZmF1bHQgaW4gdGhlIGtlcm5lbCBwcm9wZXIgcHJlY2lzZWx5IGJlY2F1c2UgaXQKPiBpcyBz
byBub2lzeSB3aGVuIGNhbGxiYWNrcyBhcmUgaW52b2x2ZWQuCj4gCj4gUGF0Y2ggNSBpcyBjbGVh
cmx5IGFuIGltcHJvdmVtZW50LCBidXQgSSdkIHJhdGhlciB0YWtlIGl0IHdpdGhvdXQKPiBhY3R1
YWxseSBlbmFibGluZyAtV3VudXNlZC1wYXJhbWV0ZXIuIFRoZSByZXN0IG9mIHRoaXMgcGF0Y2gg
aXNuJ3QgdGhhdAo+IHVzZWZ1bCBlaXRoZXIgSU1ITy4KUGF0Y2ggNSByZW1vdmVzIGdlbnVpbmVs
eSB1bnVzZWQgcGFyYW1ldGVycyBmbGFnZ2VkIGJ5IHRoZSBjb21waWxlci4gSWYgd2UKZHJvcCB0
aGUgLVd1bnVzZWQtcGFyYW1ldGVyIG9wdGlvbiwgaG93ZXZlciwgbmV3IHVudXNlZCBwYXJhbWV0
ZXJzIHdpbGwKY29udGludWUgdG8gY3JlZXAgaW4gd2l0aCBmdXR1cmUgcGF0Y2hlcy4gVGhlIGdv
YWwgb2YgZW5hYmxpbmcgdGhpcyB3YXJuaW5nCmlzIHRvIHN1cmZhY2Ugc3VjaCBpc3N1ZXMgZWFy
bHkgc28gZGV2ZWxvcGVycyBjYW4gYWRkcmVzcyB0aGVtIGR1cmluZwpkZXZlbG9wbWVudCwgcmF0
aGVyIHRoYW4gbGF0ZXIgZHVyaW5nIHJldmlldyBvciBkZWJ1Z2dpbmcuCgpMb25nIHRlcm0sIEni
gJlkIGxpa2UgdXMgdG8gcmVseSBtb3JlIG9uIGNvbXBpbGVyIGFuZCBzdGF0aWMgYW5hbHlzaXMg
anVzdCBsaWtlCmtlcm5lbCB0byBjYXRjaCB0aGVzZSBraW5kcyBvZiBwcm9ibGVtcyBwcm9hY3Rp
dmVseSwgaW5zdGVhZCBvZiB3YWl0aW5nIHVudGlsCnRoZXnigJlyZSByZXBvcnRlZCBvciBzb21l
b25lIGZpeGVzIHRoZW0gbGF0ZXIuIFdoaWxlIGl0IG1heSBmZWVsIGxpa2Ugbm9pc2UKaW5pdGlh
bGx5LCB0aGlzIGlzIGxhcmdlbHkgYSBvbmUtdGltZSBjbGVhbnVw4oCUb25jZSBkb25lLCBkZXZl
bG9wZXJzIHdpbGwKc2ltcGx5IGZpeCB3YXJuaW5ncyBhcyB0aGV5IGFyaXNlLCBrZWVwaW5nIHRo
ZSBjb2RlYmFzZSBjbGVhbmVyIGdvaW5nIGZvcndhcmQuCgo+IAo+IC0gS2V2aW4KCgotLSAKLS0t
ClRoYW5rcywKVXNhbWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
