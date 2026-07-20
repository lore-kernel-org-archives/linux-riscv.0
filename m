Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7433C44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 19:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYR1rNefLpQJrxDHR3pUDm8b1a6U8BDqDOT1Ve+cBbM=; b=fz5F9Gv0dCpgPL
	YJbRqzL1VkgNBW9z0SRFlYTuA6auWmYpCMDIt8X9XVtJ4KZzBUXVUAesSe67SKFSq3dQ9zRLpZPi6
	F7d+kX/1Rf/lncBAqLyBZC1Hcy4TN+JmSxHoh5lrFF35rArybBnyKzITewQsj9rXlv754vj9ytEt5
	qxhj0yWPnux/rWm1MW9nC8CB0O4M7ng2G8Qq6yZyxVbftAYfjWAzkcYPlB5WdXTxh4C5FeRq9lXgR
	rbf1qxpDGSoC9stENnkbC6GsGdLEXeHZbrTu1XGHL2V6TP8vgM349ee9O7rNfQXR2ZwoOXWB1M46A
	B9u/tznBhb60d8ZvixRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZZ-00000007k2C-34TC;
	Mon, 20 Jul 2026 19:22:41 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZW-00000007k15-3KNy
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 19:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=buSulj0niMnq8+3SEkE2va6OH4OHLuTOlnVTBykjR9Y=; b=RF8KOPKpqr5W+Gi68jazESixL7
	yHKrPoTrXZEm/XxyQKZo3DMkebc2werCHOBh7p0MrXnVVg/H5E48HFSW5Qi+SOw1yjZ0bk7tx1ixq
	gdOP9Usu13lStgDIxxPtVhDdF/k/1e4qd5zi0Uroeyl7xyijJHsaHNr2Cni2CwnXZPVbVsNOOA7N0
	W/hiIYXCI6rCNZeruFI7+7eN3hOX+m9i5fZcfTpqU78boC743lxmEJ11bMVIrbV66hLMull0tdRQd
	EOAkkRiGl+Ap7hvS6Vu6iPtEGkcsGCECbPzQP1yU269JAiiteqgB1kVwd1GVnguZGw7We5/d+MFyl
	1anKhC0A==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wltYs-00000000450-2U7y;
	Mon, 20 Jul 2026 15:21:58 -0400
Message-ID: <f32b1d2d272e9eafaf0a68be236c84a0585a62e3.camel@surriel.com>
Subject: Re: [PATCH RFC v3 2/6] riscv/mm: add untagged_addr_remote_unlocked()
From: Rik van Riel <riel@surriel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 	kernel-team@meta.com, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes	 <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka	 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan	 <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti	
 <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Date: Mon, 20 Jul 2026 15:21:58 -0400
In-Reply-To: <e9703d2e-f815-4d96-b5ce-074aba281f76@linux.dev>
References: <20260720115741.239657-1-usama.arif@linux.dev>
	 <13ec2603d5cbfdc493939f182b71e5133c26af54.camel@surriel.com>
	 <46dc1b58-f2de-492a-9da5-a5c429c19a10@linux.dev>
	 <51c0025d2eb885ff1f4775e4d9ffcf34f478f378.camel@surriel.com>
	 <e9703d2e-f815-4d96-b5ce-074aba281f76@linux.dev>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_122238_831750_F4806924 
X-CRM114-Status: GOOD (  14.22  )
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

T24gTW9uLCAyMDI2LTA3LTIwIGF0IDE5OjQ2ICswMTAwLCBVc2FtYSBBcmlmIHdyb3RlOgo+IAo+
IFNvIG15IHVuZGVyc3RhbmRpbmcgZnJvbSBleHBsb3JpbmcgdGhpcyBjb2RlIGlzLCBhbmQgaG9w
ZWZ1bGx5Cj4gc29tZW9uZQo+IGluIENDIGZyb20gcmlzY3YgY2FuIGNvcnJlY3QgbWUsIGZvciBl
eGFtcGxlOgo+IAo+IFRhZ2dlZCBwb2ludGVyOsKgIDB4YWJjZDAwMDAxMjM0NTY3OAo+IFBNTEVO
IDE2OsKgwqDCoMKgwqDCoMKgIDB4MDAwMDAwMDAxMjM0NTY3OAo+IFBNTEVOIDc6wqDCoMKgwqDC
oMKgwqDCoCAweGZmY2QwMDAwMTIzNDU2NzgKPiAKPiBUaGUgdGFyZ2V0IFZNQSBtaWdodCBiZSBh
dCAweDEyMzQ1Njc4LCBidXQgYXBwbHlpbmcgUE1MRU4gNwo+IHRvIHRoYXQgdGFnZ2VkIHBvaW50
ZXIgZG9lcyBub3QgcHJvZHVjZSB0aGF0IGFkZHJlc3MuCj4gCj4gUHJldmlvdXNseSwgdGhlIG9y
ZGVyIHdhczoKPiAKPiBUYWtlIG1tYXAgcmVhZCBsb2NrLgo+IFJlYWQgcG1sZW4uCj4gVW50YWcg
dGhlIGFkZHJlc3MuCj4gTG9vayB1cCB0aGUgVk1BLgo+IAo+IENoYW5naW5nIFBNTEVOIHRha2Vz
IHRoZSBtbWFwIHdyaXRlIGxvY2suIFRoZSByZWFkIGFuZCB3cml0ZQo+IG9wZXJhdGlvbnMgd2Vy
ZSB0aGVyZWZvcmUgc2VyaWFsaXplZC4KPiAKPiBUaGUgbmV3IG9yZGVyIGlzOgo+IAo+IFJlYWQg
cG1sZW4gd2l0aG91dCBtbWFwIGxvY2suCj4gVW50YWcgdGhlIGFkZHJlc3MuCj4gQXR0ZW1wdCB0
aGUgcGVyLVZNQSBsb29rdXAuCj4gUG9zc2libHkgdGFrZSBtbWFwIGxvY2sgbGF0ZXIuCj4gQ29u
dGludWUgdXNpbmcgdGhlIGFscmVhZHktdW50YWdnZWQgYWRkcmVzcy4KPiAKPiBBIGNvbmN1cnJl
bnQgUE1MRU4gY2hhbmdlIGNhbiBvY2N1ciBiZXR3ZWVuIHRob3NlIG9wZXJhdGlvbnM/CgpJIHN1
cHBvc2UgaXQgY291bGQsIGJ1dCB3aGF0IGFyZSB0aGUgcG9zc2libGUgb3V0Y29tZXMgaGVyZT8K
Ci0gV2UgZmFpbCB0byB1bnRhZyB0aGUgYWRkcmVzcywgdGhlIHZtYSBsb29rdXAKICBmYWlscywg
YW5kIHdlIGZhaWwgdG8gYWNjZXNzIG1lbW9yeS4KCi0gVGhlIGFkZHJlc3MgaXMgYWxyZWFkeSB1
bnRhZ2dlZCwgbWFwcyB0byBhCiAgVk1BLCBhbmQgdGhlIGFjY2VzcyBzdWNjZWVkcy4KCkFyZSB0
aGVyZSBhbnkgb3RoZXJzPwoKVGhlIFZNQXMgb2YgdGhlIHByb2Nlc3MgbmVlZCB0byBiZSBpbiB0
aGUgYm90dG9tCnBhcnQgb2YgdGhlIGFkZHJlc3Mgc3BhY2UsIHJpZ2h0PyBUaGUgcGFydCB3aGVy
ZQp1bnRhZ2dlZCBhZGRyZXNzZXMgc2l0LgoKRm9yIHRoaW5ncyBsaWtlIC9wcm9jLzxwaWQ+L2Nt
ZGxpbmUgd2Ugc2hvdWxkCmF1dG9tYXRpY2FsbHkgZ2V0IGFuIGFkZHJlc3Mgd2l0aG91dCBhbnkg
b2YgdGhlCmhpZ2ggYml0cyBzZXQuCgpGb3IgdGhpbmdzIGxpa2UgcHRyYWNlIHBlZWsgLyBwb2tl
LCBCUEYgcHJvY2VzcwphY2Nlc3NlcywgYW5kIG90aGVycywgSSByZWFsbHkgZG8gbm90IGtub3cg
aWYKdGhvc2UgY291bGQgZ2V0IHRhZ2dlZCBhZGRyZXNzZXMuLi4KCldoYXQgYXJlIHRoZSBmYWls
dXJlcyB3ZSBuZWVkIHRvIHByb3RlY3QgYWdhaW5zdD8KCldoYXQgaWYgc29tZXRoaW5nIGNvbWVz
IGluIHdpdGggYSB0YWdnZWQgYWRkcmVzcywKYnV0IHRoZSBwcm9jZXNzIGRpc2FibGVzIHRhZ2dp
bmcgd2hpbGUgdGhhdApzb21ldGhpbmcgd2FpdHMgZm9yIHRoZSBtbWFwX2xvY2s/CgpEb2VzIHRo
YXQgcmVwcm9kdWNlIHRoZSBmYWlsdXJlIGNhc2UsIHdpdGhvdXQKYW55IGxvY2tpbmcgY2hhbmdl
cz8KPiAKCj4gCgotLSAKQWxsIFJpZ2h0cyBSZXZlcnNlZC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
