Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A4EC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:39:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4ED56115B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4ED56115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X4REpDS1rVn6FRbeB4a4XvoKjAYnUm744Nvni7u4uFM=; b=DG/zR7WFBagUaW9fmLpt+hybh
	SVdU1JLrexVTp9vgv1HsxjlG+Cc+2B+tQOQM/JzFWHbZMyZ7YiIOuirbj5ucZ+NOA+U4AKD24YqId
	+ECrvxuJWeVb0e4m2sMciActqGcNK/62F1zYZnB7MMzXlOOP1tn3HvOuYQsXGjKjINUblp9zxzZfK
	TLRrlzV53qpfHFWOAyflXt18yDP6stxd/dpl7UAhi3Wyu0oAPxS4LIMmWoVQe2AYRuPmThRDVOLmQ
	R7CAucyNAxge0vff0R6Ac9nGhj4Q52TcilUjb0o8MuX6RPBUVOAmAfXLKow/ol14oWnKcJHUxbEmQ
	YFMmwSIbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXLse-001lKL-3o; Fri, 16 Apr 2021 10:39:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXLrs-001lC9-Aa; Fri, 16 Apr 2021 10:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Xe6M6b66w71Hbng1vE/04rLePEiAEXLqq+cSn2WXnh0=; b=FNqJ3vIgyo46uBreAhEnvAtyYl
 zaDBMfwzqjyTmW6OegnmZNh1tyHaiRoO0xIsgV98Li33aBPd5X988de5R1B1Kd4dJy++VIvPjN4Ez
 jRAAkXBDxT6BETbIcb5CTPMGLRWetMN5eEyD/cED0d960wzEj8BMX9PkY0Fv+kDNB1i2Go5zM3SIt
 A5p+h+YsMJsOAqDrkan0Vs5hg7GbvsjeSCmAOumHqrDE81RLS7IYxdkFBuAB4tb/DGoe+9CynjSSA
 q30TQuG1rDRvIEJ/pQRyM3jN/dYbPKsBmijxqMGO6NZ4NlVMHLdRFQMMquLgAbhVq+zrUSxeLlgu1
 moByoZew==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXLro-009Hdu-Qt; Fri, 16 Apr 2021 10:38:31 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMCNW3tv5z9v4WN;
 Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TGx8rBpOGfLa; Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMCNW2yYgz9v4WM;
 Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FD108B83B;
 Fri, 16 Apr 2021 12:38:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gxbf4EojfzU4; Fri, 16 Apr 2021 12:38:20 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CE338B83A;
 Fri, 16 Apr 2021 12:38:19 +0200 (CEST)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Steven Price <steven.price@arm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
Date: Fri, 16 Apr 2021 12:38:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_033829_190192_AD457F50 
X-CRM114-Status: GOOD (  20.26  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDExOjI4LCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPiBPbiAx
NS8wNC8yMDIxIDE4OjE4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+PiBJbiBvcmRlciB0byBz
dXBwb3J0IGxhcmdlIHBhZ2VzIG9uIHBvd2VycGMsIG5vdGVwYWdlKCkKPj4gbmVlZHMgdG8ga25v
dyB0aGUgcGFnZSBzaXplIG9mIHRoZSBwYWdlLgo+Pgo+PiBBZGQgYSBwYWdlX3NpemUgYXJndW1l
bnQgdG8gbm90ZXBhZ2UoKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+PiAtLS0KPj4gwqAgYXJjaC9hcm02NC9tbS9w
dGR1bXAuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4gwqAgYXJjaC9yaXNjdi9tbS9wdGR1
bXAuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4gwqAgYXJjaC9zMzkwL21tL2R1bXBfcGFn
ZXRhYmxlcy5jIHzCoCAzICsrLQo+PiDCoCBhcmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJsZXMuY8Kg
IHzCoCAyICstCj4+IMKgIGluY2x1ZGUvbGludXgvcHRkdW1wLmjCoMKgwqDCoMKgwqDCoMKgIHzC
oCAyICstCj4+IMKgIG1tL3B0ZHVtcC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4+IMKgIDYgZmlsZXMgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4+Cj4gWy4uLl0KPj4gZGlmZiAtLWdpdCBhL21t
L3B0ZHVtcC5jIGIvbW0vcHRkdW1wLmMKPj4gaW5kZXggZGE3NTE0NDhkMGU0Li42MWNkMTZhZmIx
YzggMTAwNjQ0Cj4+IC0tLSBhL21tL3B0ZHVtcC5jCj4+ICsrKyBiL21tL3B0ZHVtcC5jCj4+IEBA
IC0xNyw3ICsxNyw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IG5vdGVfa2FzYW5fcGFnZV90YWJsZShz
dHJ1Y3QgbW1fd2FsayAqd2FsaywKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBwdGR1bXBf
c3RhdGUgKnN0ID0gd2Fsay0+cHJpdmF0ZTsKPj4gLcKgwqDCoCBzdC0+bm90ZV9wYWdlKHN0LCBh
ZGRyLCA0LCBwdGVfdmFsKGthc2FuX2Vhcmx5X3NoYWRvd19wdGVbMF0pKTsKPj4gK8KgwqDCoCBz
dC0+bm90ZV9wYWdlKHN0LCBhZGRyLCA0LCBwdGVfdmFsKGthc2FuX2Vhcmx5X3NoYWRvd19wdGVb
MF0pLCBQQUdFX1NJWkUpOwo+IAo+IEknbSBub3QgY29tcGxldGVseSBzdXJlIHdoYXQgdGhlIHBh
Z2Vfc2l6ZSBpcyBnb2luZyB0byBiZSB1c2VkIGZvciwgYnV0IG5vdGUgdGhhdCBLQVNBTiBwcmVz
ZW50cyBhbiAKPiBpbnRlcmVzdGluZyBjYXNlIGhlcmUuIFdlIHNob3J0LWN1dCBieSBkZXRlY3Rp
bmcgaXQncyBhIEtBU0FOIHJlZ2lvbiBhdCBhIGhpZ2ggbGV2ZWwgCj4gKFBHRC9QNEQvUFVEL1BN
RCkgYW5kIGluc3RlYWQgb2Ygd2Fsa2luZyB0aGUgdHJlZSBkb3duIGp1c3QgY2FsbCBub3RlX3Bh
Z2UoKSAqb25jZSogYnV0IHdpdGggCj4gbGV2ZWw9PTQgYmVjYXVzZSB3ZSBrbm93IEtBU0FOIHNl
dHMgdXAgdGhlIHBhZ2UgdGFibGUgbGlrZSB0aGF0Lgo+IAo+IEhvd2V2ZXIgdGhlIG9uZSBjYWxs
IGFjdHVhbGx5IGNvdmVycyBhIG11Y2ggbGFyZ2VyIHJlZ2lvbiAtIHNvIHdoaWxlIFBBR0VfU0la
RSBtYXRjaGVzIHRoZSBsZXZlbCBpdCAKPiBkb2Vzbid0IG1hdGNoIHRoZSByZWdpb24gY292ZXJl
ZC4gQUZBSUNUIHRoaXMgd2lsbCBsZWFkIHRvIG9kZCByZXN1bHRzIGlmIHlvdSBlbmFibGUgS0FT
QU4gb24gcG93ZXJwYy4KCkh1bSAuLi4uIEkgc3VjY2Vzc2Z1bGx5IHRlc3RlZCBpdCB3aXRoIEtB
U0FOLCBJIG5vdyByZWFsaXNlIHRoYXQgSSB0ZXN0ZWQgaXQgd2l0aCAKQ09ORklHX0tBU0FOX1ZN
QUxMT0Mgc2VsZWN0ZWQuIEluIHRoaXMgc2l0dWF0aW9uLCBzaW5jZSAKaHR0cHM6Ly9naXRodWIu
Y29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9hZjNkMGE2ODYgd2UgZG9uJ3QgaGF2ZSBhbnkgY29t
bW9uIHNoYWRvdyBwYWdlIHRhYmxlIGFueW1vcmUuCgpJJ2xsIHRlc3QgYWdhaW4gd2l0aG91dCBD
T05GSUdfS0FTQU5fVk1BTExPQy4KCj4gCj4gVG8gYmUgaG9uZXN0IEkgZG9uJ3QgZnVsbHkgdW5k
ZXJzdGFuZCB3aHkgcG93ZXJwYyByZXF1aXJlcyB0aGUgcGFnZV9zaXplIC0gaXQgYXBwZWFycyB0
byBiZSB1c2luZyBpdCAKPiBwdXJlbHkgdG8gZmluZCAiaG9sZXMiIGluIHRoZSBjYWxscyB0byBu
b3RlX3BhZ2UoKSwgYnV0IEkgaGF2ZW4ndCB3b3JrZWQgb3V0IHdoeSBzdWNoIGhvbGVzIHdvdWxk
IAo+IG9jY3VyLgoKSSB3YXMgaW5kZWVkIGludHJvZHVjZWQgZm9yIEtBU0FOLiBXZSBoYXZlIGEg
Zmlyc3QgY29tbWl0IApodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2Nh
YmU4MTM4IHdoaWNoIHVzZXMgcGFnZSBzaXplIHRvIGRldGVjdCB3aGV0aGVyIGl0IGlzIGEgCktB
U0FOIGxpa2Ugc3R1ZmYuCgpUaGVuIGNhbWUgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xp
bnV4L2NvbW1pdC9iMDBmZjZkOGMgYXMgYSBmaXguIEkgY2FuJ3QgcmVtZW1iZXIgd2hhdCB0aGUg
CnByb2JsZW0gd2FzIGV4YWN0bHksIHNvbWV0aGluZyBhcm91bmQgdGhlIHVzZSBvZiBodWdlcGFn
ZXMgZm9yIGtlcm5lbCBtZW1vcnksIGNhbWUgYXMgcGFydCBvZiB0aGUgCnNlcmllcyAKaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9jb3Zlci9jb3Zlci4x
NTg5ODY2OTg0LmdpdC5jaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUvCgoKQ2hyaXN0b3BoZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
