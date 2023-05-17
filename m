Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4946DC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGWWC4k7Ggz35xtYw6rIqjYs5K6dqZU61vPFpSO+iFM=; b=Aa2ppv6wU9LSJl
	N+Mirhdn0a19CPUPTj8UTtU3ahUBEKQHJwMYjPC3Tob5AzesxevZ2rtINQyhVxrDv25m7iBcpyo46
	72otLVusT1pPa4aXO2HKjbPcq9WFS0wMpfU8aTsObYarzBxwBZy+obln8644fToUDZ92NFRtCDv3P
	gMBBClykXPX6Nf//KDgQH2c4zF0PWVu1S84YWtlXMiRDTWUzxvY/iVbdGqU4f0Cx2SRUgrDlfD6GR
	2uiGZuzB3kuLLTj9geMX69NGtIadKRTk3FOhQyWlWPqKwyKupnfEqORm/iJuW2tSqSG1BeZlB2it3
	BGYZsp0jcfVugTJR2/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzMHj-00Ambn-27;
	Wed, 17 May 2023 18:54:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzMHf-00AmbP-38
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 18:54:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0AAE63ADA;
	Wed, 17 May 2023 18:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15961C433EF;
	Wed, 17 May 2023 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684349638;
	bh=+nV7AD5yc8SFGB9+CLiAw9jnKXLbtK3VvYJuoM0ntT4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=owLL/OdV0KnOPxZoc0Qe/3k9OnRB6FRqrL1ix1teN0zMIYOZfySgsqTPoLvc1q99Q
	 yqDiv6kX7lxgUVNPvcrKU4RKbjixC20Pg4Rh09+shn780q5ee6t7x4LwSGXRMwBJju
	 8RtsYYmaiCxEHeBNDHm8hKYzCIK5iEBj3Qbt7m3roQOr9PYOrhhK7UQYj76R+p6sUx
	 5+c3+X/3o6jK66l+5ez5zLqB83L467JcKFN3u7RR0P5EtLKXYLekqJgWEiIZ6D4R0/
	 jeJybZ+ocEe6/jOxkztBBSA1WaNXyZLe/+qHBTWFyGW3quZIfGEFu1Q6avMKhS7PCR
	 LonE96kFPhCXw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: David Hildenbrand <david@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Oscar Salvador <osalvador@suse.de>,
 virtualization@lists.linux-foundation.org, linux@rivosinc.com, Alexandre
 Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 0/7] riscv: Memory Hot(Un)Plug support
In-Reply-To: <9aa7d030-19b5-01df-70c0-86d8d6ab86a6@redhat.com>
References: <20230512145737.985671-1-bjorn@kernel.org>
 <9aa7d030-19b5-01df-70c0-86d8d6ab86a6@redhat.com>
Date: Wed, 17 May 2023 20:53:55 +0200
Message-ID: <87zg62eqm4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_115400_070486_8751113E 
X-CRM114-Status: GOOD (  12.50  )
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

RGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gT24gMTIuMDUu
MjMgMTY6NTcsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPj4gCj4+IE1lbW9yeSBIb3QoVW4pUGx1ZyBzdXBwb3J0IGZvciB0
aGUgUklTQy1WIHBvcnQKPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQoKWy4uLl0KCj4KPiBDb29sIHN0dWZmISBJJ20gZmFpcmx5IGJ1c3kgcmlnaHQgbm93
LCBzbyBzb21lIGhpZ2gtbGV2ZWwgcXVlc3Rpb25zIHVwZnJvbnQ6CgpObyB3b3JyaWVzLCBhbmQg
bm8gcnVzaCEgSSdkIHNheSB0aGUgdjEgc2VyaWVzIHdhcyBtYWlubHkgZm9yIHRoZSBSSVNDLVYK
Zm9sa3MsIGFuZCBJJ3ZlIGdvdCB0b25zIG9mIChvZmZsaW5lKSBjb21tZW50cyBmcm9tIEFsZXgg
LS0gYW5kIHdpdGgKeW91ciBjb21tZW50cyBiZWxvdyBzb21lIG1vcmUgZGV0YWlscyB0byBmaWd1
cmUgb3V0LgoKPiBXaGF0IGlzIHRoZSBtZW1vcnkgc2VjdGlvbiBzaXplICh3aGljaCBpbXBsaWVz
IHRoZSBtZW1vcnkgYmxvY2sgc2l6ZSAKPiBhbmQpPyBUaGlzIGltcGxpZXMgdGhlIG1pbmltdW0g
RElNTSBncmFudWxhcml0eSBhbmQgdGhlIGhpZ2gtbGV2ZWwgCj4gZ3JhbnVsYXJpdHkgaW4gd2hp
Y2ggdmlydGlvLW1lbSBhZGRzIG1lbW9yeS4KCkl0J3MgMTI4TSAoMjcgYml0cykgLS0gKGxpa2Ug
YXJtNjQgYW5kIHg4Ni02ND8pLgoKPiBXaGF0IGlzIHRoZSBwYWdlYmxvY2sgc2l6ZSwgaW1wbHlp
bmcgdGhlIG1pbmltdW0gZ3JhbnVsYXJpdHkgdGhhdCAKPiB2aXJ0aW8tbWVtIGNhbiBvcGVyYXRl
IG9uPwoKTm90aGluZyBzcGVjaWFsIEFGQUlVOyBNQVhfT1JERVIgaXMgMTAsIHNvIFBBR0VfU0la
RSAoNEspICogMTAyNC4gSG1tLCBJCnJlYWxpemUgdGhhdCBJIG5lZWQgdG8gbG9vayBpbnRvIHNv
bWUgbW9yZSBkZXRhaWxzIG9mIHZpcnRpby1tZW0hIDotKQoKPiBPbiB4ODYtNjQgYW5kIGFybTY0
IHdlIGN1cnJlbnRseSB1c2UgdGhlIEFDUEkgU1JBVCB0byBleHBvc2UgdGhlIG1heGltdW0gCj4g
cGh5c2ljYWwgYWRkcmVzcyB3aGVyZSB3ZSBjYW4gc2VlIG1lbW9yeSBnZXR0aW5nIGhvdHBsdWdn
ZWQuIFsxXSBGcm9tIAo+IHRoYXQsIHdlIGNhbiBkZXJpdmUgdGhlICJtYXhfcG9zc2libGVfcGZu
IiBhbmQgcHJlcGFyZSB0aGUga2VybmVsIAo+IHZpcnR1YWwgbWVtb3J5IGxheW91cnQgKGVzcGVj
aWFsbHksIGRpcmVjdCBtYXApLgo+Cj4gSXMgc29tZXRoaW5nIHNpbWlsYXIgcmVxdWlyZWQgb24g
UklTQy1WPwoKWWVzISBSSVNDLVYgaXMgaW4gdGhlIHByb2dyZXNzIG9mIGdldHRpbmcgcHJvcGVy
IEFDUEkgc3VwcG9ydC4gVGhhbmtzCmZvciBwb2ludGluZyBtZSBpbiB0aGUgdGhlc2UgZGlyZWN0
aW9uczsgRm9vZCBmb3IgdGhvdWdodCB0aGF0IEknbGwKZGlnZXN0IGZvciB0aGUgbmV4dCB2ZXJz
aW9uLgoKCkNoZWVycywKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
