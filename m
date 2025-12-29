Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E593E92FC4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yvM3G0+a9fafloJUmkFRAMv108rEF1BL+89bHqHx8E=; b=cBQeWv2Q1WTj8m
	LbRq+PihZP3JsxuvAoOz0nnF3Xpta8Z6tdyY32SM45L6jlZDsN9T+0+N4UccM9Z8Iu2pnaDKb1Z1k
	QLsALnJmTyNLnr+Si0RHfOTzJLA5YhTEkNivq10bmMw6tEGwnxxdbod9NR5t58jD9zE8Fk+OHFihT
	FKm2eibYHm7FdrSpI1qKu9Rc7IWUdzWJzA1SoGn63cURuMb/GL3gA53jTiz8qim3wX1UpZRYDV6dv
	mui6sysIM3ui5dpc13Uhidc9XuD/hAGxElEi/14Ya3E38mj9FNYudKmO+N1jvNcBhJtgq9wgE+NCV
	e1nj3azBnOui9WOez1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaI5a-00000003xCC-2jNg;
	Mon, 29 Dec 2025 18:35:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaI5Y-00000003xBp-1OdH
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 18:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69473432E9;
	Mon, 29 Dec 2025 18:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EF6C4CEF7;
	Mon, 29 Dec 2025 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767033326;
	bh=eG2cXpjbEn5KgR3sqGbsjKORgaU2dlYeuXkzKF8Mu+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tJiTqQdxcxiahCt/5Na42Sqqnb6QMNXBFsKWCsh/jwM7SZm5uZJ6HLYmiAziNGUIM
	 bStVvsBKeMwq3158DF+MVo9QN/3PmTb3lyOHtcBb4uKosJIhW1HwdKEgIRXdhJLqIv
	 Aze3DO85ITf1QVHZwt8J08+vxDRRz+G7IJLe4q9AeAEu/dotyEun9ursQ2VT4iGuwF
	 /uUam40Exa8qQD64T3RwaQSpZhRY3Q8GKi1W2craqo9vuRBjDKQdEdaMErKFYMrgrL
	 I+Qs35NIYKKJSezvh7BHgJsqWQugepNS5WIMPfLeYt/RvPpPpf/xHw5lAuaNu5cPsR
	 klwqXccc4oIpw==
Message-ID: <398ca47d-19d4-4b26-98db-2bf283b6b0cb@kernel.org>
Date: Mon, 29 Dec 2025 19:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Andrew Morton <akpm@linux-foundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
 <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_103528_413987_8D4ED09C 
X-CRM114-Status: GOOD (  10.90  )
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

CgpMZSAyOC8xMi8yMDI1IMOgIDIzOjM1LCBBbmRyZXcgTW9ydG9uIGEgw6ljcml0wqA6Cj4gT24g
V2VkLCAyNCBEZWMgMjAyNSAxNzoyNToyNCArMDUzMCBTb3VyYWJoIEphaW4gPHNvdXJhYmhqYWlu
QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+IAo+PiBOb3RlIGZvciBiYWNrcG9ydGluZzogVGhpcyBm
aXggaXMgYSBwYXJ0aWFsIHJldHJpZXZhbCBvZiB0aGUgY29tbWl0Cj4+IG1lbnRpb25lZCBpbiB0
aGUgRml4ZXMgdGFnLiBJdCBpcyBvbmx5IHZhbGlkIG9uY2UgdGhlIGNoYW5nZSByZWZlcmVuY2Vk
Cj4+IGJ5IHRoZSBEZXBlbmRzLW9uIHRhZyBpcyBwcmVzZW50LiBXaGVuIGJhY2twb3J0aW5nIHRo
aXMgcGF0Y2gsIHRoZQo+PiBjb21taXQgbWVudGlvbmVkIGluIHRoZSBEZXBlbmRzLW9uIHRhZyBt
dXN0IGJlIGluY2x1ZGVkIGZpcnN0Lgo+Pgo+PiBMaW5rOiBodHRwczovL2V1cjAxLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm5lbC5v
cmclMkZhbGwlMkYyMDI1MDEyMTE1MDQxOS4xMzQyNzk0LTEtc291cmFiaGphaW4lNDBsaW51eC5p
Ym0uY29tJTJGJmRhdGE9MDUlN0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdD
OTNhOGY5MjVmYzAyNGZmOWMzZmUwOGRlNDY2MTZjM2IlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVm
NjlhMjAxMWJiNSU3QzAlN0MwJTdDNjM5MDI1NTgxNDA0MDI3MDY2JTdDVW5rbm93biU3Q1RXRnBi
R1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9p
SlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZz
ZGF0YT0zaVZVZGFNQldoRXhLa0RpViUyQkJmWXVmUFRLdmExZFZpa2h5UVNoT3E3bWMlM0QmcmVz
ZXJ2ZWQ9MCBbMV0KPj4gTGluazogaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGYWxsJTJGMjAy
NTAxMjgwNDMzNTguMTYzMzcyLTEtc291cmFiaGphaW4lNDBsaW51eC5pYm0uY29tJTJGJmRhdGE9
MDUlN0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDOTNhOGY5MjVmYzAyNGZm
OWMzZmUwOGRlNDY2MTZjM2IlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAl
N0MwJTdDNjM5MDI1NTgxNDA0MDUzMjA2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIw
ZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9J
am9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT1HYW1EZTJSODdT
ZHBGdXJuajlDbXQ5d09RdGtHTGdJTzF6N25sNVFQeGdZJTNEJnJlc2VydmVkPTAgWzJdCj4+IEZp
eGVzOiBjMjgzM2E1YmY3NWIgKCJodWdldGxiZnM6IGZpeCBjaGFuZ2VzIHRvIGNvbW1hbmQgbGlu
ZSBwcm9jZXNzaW5nIikKPj4gRGVwZW5kcy1vbjogMjM1NGFkMjUyYjY2ICgicG93ZXJwYy9tbTog
VXBkYXRlIGRlZmF1bHQgaHVnZXRsYiBzaXplIGVhcmx5IikKPiAKPiBUaGlzIHdpbGwgYmUgdGhl
IGZpcnN0ICJEZXBlbmRzLW9uOiIgaW4gaGlzdG9yeS4gIFdoaWNoIGlzIGEgaGludCB0aGF0Cj4g
d2UncmUgZG9pbmcgc29tZXRoaW5nIHdyb25nLiAgVGhpcyBpbm5vdmF0aW9uIHdpbGwgc3VyZWx5
IGZvb2wgYW55Cj4gZG93bnN0cmVhbSBhdXRvbWF0aW9uLiAgTGV0J3MgdXNlIGV4aXN0aW5nIHRv
b2xzIGlmIHBvc3NpYmxlLgoKV2hhdCBkbyB5b3UgbWVhbiBieSAiZmlyc3QgaW4gaGlzdG9yeSIg
PyBEbyB5b3UgbWVhbiBpdCdzIG5ldmVyIGJlZW4gCnVzZWQgYmVmb3JlID8gQXMgZmFyIGFzIEkg
Y2FuIHNlZSBpdCBoYXMgYmVlbiB1c2VkIHNldmVyYWwgdGltZXMgCmFscmVhZHkuIEZpcnN0IG9u
ZSB3YXMgaW4gMjAxNCB3aXRoIGNvbW1pdCBhMDg1NTA1NGU1OWIgKCJpd2x3aWZpOiBkdm06IApk
cm9wIG5vbiBWTyBmcmFtZXMgd2hlbiBmbHVzaGluZyIpCgpTYXNoYSwgZG8gdG9vbHMgdXNlIGl0
ID8KCiQgZ2l0IGxvZyB8IGdyZXAgIkRlcGVuZHMtb246ICIgfCB3YyAtbAoxMzcKCiQgZ2l0IGxv
ZyB8IGdyZXAgIkRlcGVuZHMtb246ICIgfCBoZWFkIC0xMAogICAgIERlcGVuZHMtb246IGUyZGFl
YzQ4OGM1NyAoIm5iZDogRml4IGh1bmd0YXNrIHdoZW4gbmJkX2NvbmZpZ19wdXQiKQogICAgIERl
cGVuZHMtb246IGFybTY0OiBkdHM6IG51dm90b246IENvbWJpbmUgTlBDTTg0NSByZXNldCBhbmQg
Y2xrIG5vZGVzCiAgICAgRGVwZW5kcy1vbjogMDU4NTE4YzIwOTIwICgibGFuZGxvY2s6IEFsaWdu
IHBhcnRpYWwgcmVmZXIgYWNjZXNzIApjaGVja3Mgd2l0aCBmaW5hbCBvbmVzIikKICAgICBEZXBl
bmRzLW9uOiBkNjE3ZjBkNzJkODAgKCJsYW5kbG9jazogT3B0aW1pemUgZmlsZSBwYXRoIHdhbGtz
IGFuZCAKcHJlcGFyZSBmb3IgYXVkaXQgc3VwcG9ydCIpCiAgICAgRGVwZW5kcy1vbjogN2NjYmUw
NzZkOTg3ICgibHNtOiBPbmx5IGJ1aWxkIGxzbV9hdWRpdC5jIGlmIApDT05GSUdfU0VDVVJJVFkg
YW5kIENPTkZJR19BVURJVCBhcmUgc2V0IikKICAgICBEZXBlbmRzLW9uOiAyNmYyMDQzODBhM2Mg
KCJmczogRml4IGZpbGVfc2V0X2Zvd25lciBMU00gaG9vayAKaW5jb25zaXN0ZW5jaWVzIikKICAg
ICBEZXBlbmRzLW9uOiBjb21taXQgMDQ1YjE0Y2E1YzM2ICgib2Y6IFdBUk4gb24gZGVwcmVjYXRl
ZCAKI2FkZHJlc3MtY2VsbHMvI3NpemUtY2VsbHMgaGFuZGxpbmciKQogICAgIERlcGVuZHMtb246
IHY2LjEyKyB3aXRoIFBSRUVNUFRfUlQgZW5hYmxlZAogICAgIERlcGVuZHMtb246IDA0NWIxNGNh
NWMzNiAoIm9mOiBXQVJOIG9uIGRlcHJlY2F0ZWQgCiNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxz
IGhhbmRsaW5nIikKICAgICBEZXBlbmRzLW9uOiBjb21taXQgYWVjODlkYzVkNDIxICgiYmxvY2s6
IGtlZXAgcV91c2FnZV9jb3VudGVyIGluIAphdG9taWMgbW9kZSBhZnRlciBkZWxfZ2VuZGlzayIp
CgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
