Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856E9C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 14:41:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC14561073
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 14:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC14561073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GdtoR9UHM67jf26/GMKJh1r3xCJfs6YlHSGx07lh1Ko=; b=JAU7BXVNUcAfPd0XQ8TWoF3NN
	yUsFWLY56iZ5OLWRvwPGDOz0qr6yZnQL7RTuQ5QG2Gv8wcv91nUsXJBLA3oTC88EEBxX8wgVIvPGN
	HUzJPJ0IkhwVXfFZgIG4VLJcsxa/HkQv4pCZZVUCduoxZBkAHvHRQfcKRzRVc3JX1ZzHuVwdJEAH7
	RJxjqdB9okA+bF9yVzjKCIcNEIWiwB/mBiRPmBxgRBgLFKe16ICYgMfJJcU3FN2Db/tb+i6IGxklk
	+TQepuLcwy1BKg3/qHh+qC6qDkE6Uk6ljBKQKP1zlKVEhBZ/4mH44dGj19Vd1KlVJ/acZuaI9+N7Q
	0o6hlyaYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPfF-002S17-KB; Fri, 16 Apr 2021 14:41:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPeY-002Rk5-Sq; Fri, 16 Apr 2021 14:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=oJyTqDbbwhE94yn2bPx6Y3R5Zq07Fa23HCNX6JSJ9I8=; b=mlMUwUB1wv9geGrcdFDsHp1IHR
 hJCIbMiSTHucjL8UznhMZkVNM6bDzxB8g9YALgWHL1gT1l6SDHai8D7k/16lNYlrshEd9VWArFnlG
 AdMTwbyLSu44m+IeNvUyI7CyitKfj0V0VT09ij2UxMY7Wg/8dueK7lnY7CnQIlaKQtrOjSE+CtPUI
 NUZqoAUmA3vAQMuoTs2KJWHU+RmRe6/VaYhNp9kexAHL+inzZ+bfoHWfTvURvBVz/6h699SZy+WzS
 PSCoid95le+7fJj0KLptNarEu93J6Oqw8rISB7HjZAaxoVG2u/IOF9y9mtj8bfYTFnmCnL3B2G8jO
 YO2WICIw==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPeT-009Sk1-5T; Fri, 16 Apr 2021 14:41:01 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMJmN2hxGz9vBnG;
 Fri, 16 Apr 2021 16:40:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4QkMRAzEi_DN; Fri, 16 Apr 2021 16:40:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMJmN11tvz9vBnC;
 Fri, 16 Apr 2021 16:40:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 781F48B84E;
 Fri, 16 Apr 2021 16:40:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id D0sjjGIwO1la; Fri, 16 Apr 2021 16:40:53 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 91A338B84C;
 Fri, 16 Apr 2021 16:40:52 +0200 (CEST)
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
 <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
 <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
 <6ff4816b-8ff6-19de-73a2-3fcadc003ccd@csgroup.eu>
 <e39d500a-2154-3c5d-9393-8bf53a567fad@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b6b5300d-35a0-3bc0-ad1d-f2af433ef27e@csgroup.eu>
Date: Fri, 16 Apr 2021 16:40:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e39d500a-2154-3c5d-9393-8bf53a567fad@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_074057_573490_56B6E03D 
X-CRM114-Status: GOOD (  26.07  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDE1OjAwLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPiBPbiAx
Ni8wNC8yMDIxIDEyOjA4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAxNi8w
NC8yMDIxIMOgIDEyOjUxLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPj4+IE9uIDE2LzA0LzIw
MjEgMTE6MzgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IExlIDE2LzA0
LzIwMjEgw6AgMTE6MjgsIFN0ZXZlbiBQcmljZSBhIMOpY3JpdMKgOgo+Pj4+PiBPbiAxNS8wNC8y
MDIxIDE4OjE4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+Pj4gSW4gb3JkZXIgdG8gc3Vw
cG9ydCBsYXJnZSBwYWdlcyBvbiBwb3dlcnBjLCBub3RlcGFnZSgpCj4+Pj4+PiBuZWVkcyB0byBr
bm93IHRoZSBwYWdlIHNpemUgb2YgdGhlIHBhZ2UuCj4+Pj4+Pgo+Pj4+Pj4gQWRkIGEgcGFnZV9z
aXplIGFyZ3VtZW50IHRvIG5vdGVwYWdlKCkuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+Pj4+Pj4gLS0t
Cj4+Pj4+PiDCoCBhcmNoL2FybTY0L21tL3B0ZHVtcC5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAr
LQo+Pj4+Pj4gwqAgYXJjaC9yaXNjdi9tbS9wdGR1bXAuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
Ky0KPj4+Pj4+IMKgIGFyY2gvczM5MC9tbS9kdW1wX3BhZ2V0YWJsZXMuYyB8wqAgMyArKy0KPj4+
Pj4+IMKgIGFyY2gveDg2L21tL2R1bXBfcGFnZXRhYmxlcy5jwqAgfMKgIDIgKy0KPj4+Pj4+IMKg
IGluY2x1ZGUvbGludXgvcHRkdW1wLmjCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+Pj4+PiDC
oCBtbS9wdGR1bXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTYg
KysrKysrKystLS0tLS0tLQo+Pj4+Pj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+IFsuLi5dCj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvbW0vcHRkdW1wLmMgYi9tbS9wdGR1bXAuYwo+Pj4+Pj4gaW5kZXggZGE3NTE0NDhkMGU0Li42
MWNkMTZhZmIxYzggMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9tbS9wdGR1bXAuYwo+Pj4+Pj4gKysrIGIv
bW0vcHRkdW1wLmMKPj4+Pj4+IEBAIC0xNyw3ICsxNyw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IG5v
dGVfa2FzYW5fcGFnZV90YWJsZShzdHJ1Y3QgbW1fd2FsayAqd2FsaywKPj4+Pj4+IMKgIHsKPj4+
Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHB0ZHVtcF9zdGF0ZSAqc3QgPSB3YWxrLT5wcml2YXRlOwo+
Pj4+Pj4gLcKgwqDCoCBzdC0+bm90ZV9wYWdlKHN0LCBhZGRyLCA0LCBwdGVfdmFsKGthc2FuX2Vh
cmx5X3NoYWRvd19wdGVbMF0pKTsKPj4+Pj4+ICvCoMKgwqAgc3QtPm5vdGVfcGFnZShzdCwgYWRk
ciwgNCwgcHRlX3ZhbChrYXNhbl9lYXJseV9zaGFkb3dfcHRlWzBdKSwgUEFHRV9TSVpFKTsKPj4+
Pj4KPj4+Pj4gSSdtIG5vdCBjb21wbGV0ZWx5IHN1cmUgd2hhdCB0aGUgcGFnZV9zaXplIGlzIGdv
aW5nIHRvIGJlIHVzZWQgZm9yLCBidXQgbm90ZSB0aGF0IEtBU0FOIAo+Pj4+PiBwcmVzZW50cyBh
biBpbnRlcmVzdGluZyBjYXNlIGhlcmUuIFdlIHNob3J0LWN1dCBieSBkZXRlY3RpbmcgaXQncyBh
IEtBU0FOIHJlZ2lvbiBhdCBhIGhpZ2ggCj4+Pj4+IGxldmVsIChQR0QvUDREL1BVRC9QTUQpIGFu
ZCBpbnN0ZWFkIG9mIHdhbGtpbmcgdGhlIHRyZWUgZG93biBqdXN0IGNhbGwgbm90ZV9wYWdlKCkg
Km9uY2UqIGJ1dCAKPj4+Pj4gd2l0aCBsZXZlbD09NCBiZWNhdXNlIHdlIGtub3cgS0FTQU4gc2V0
cyB1cCB0aGUgcGFnZSB0YWJsZSBsaWtlIHRoYXQuCj4+Pj4+Cj4+Pj4+IEhvd2V2ZXIgdGhlIG9u
ZSBjYWxsIGFjdHVhbGx5IGNvdmVycyBhIG11Y2ggbGFyZ2VyIHJlZ2lvbiAtIHNvIHdoaWxlIFBB
R0VfU0laRSBtYXRjaGVzIHRoZSAKPj4+Pj4gbGV2ZWwgaXQgZG9lc24ndCBtYXRjaCB0aGUgcmVn
aW9uIGNvdmVyZWQuIEFGQUlDVCB0aGlzIHdpbGwgbGVhZCB0byBvZGQgcmVzdWx0cyBpZiB5b3Ug
ZW5hYmxlIAo+Pj4+PiBLQVNBTiBvbiBwb3dlcnBjLgo+Pj4+Cj4+Pj4gSHVtIC4uLi4gSSBzdWNj
ZXNzZnVsbHkgdGVzdGVkIGl0IHdpdGggS0FTQU4sIEkgbm93IHJlYWxpc2UgdGhhdCBJIHRlc3Rl
ZCBpdCB3aXRoIAo+Pj4+IENPTkZJR19LQVNBTl9WTUFMTE9DIHNlbGVjdGVkLiBJbiB0aGlzIHNp
dHVhdGlvbiwgc2luY2UgCj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Nv
bW1pdC9hZjNkMGE2ODYgd2UgZG9uJ3QgaGF2ZSBhbnkgY29tbW9uIHNoYWRvdyBwYWdlIHRhYmxl
IAo+Pj4+IGFueW1vcmUuCj4+Pj4KPj4+PiBJJ2xsIHRlc3QgYWdhaW4gd2l0aG91dCBDT05GSUdf
S0FTQU5fVk1BTExPQy4KPj4+Pgo+Pj4+Pgo+Pj4+PiBUbyBiZSBob25lc3QgSSBkb24ndCBmdWxs
eSB1bmRlcnN0YW5kIHdoeSBwb3dlcnBjIHJlcXVpcmVzIHRoZSBwYWdlX3NpemUgLSBpdCBhcHBl
YXJzIHRvIGJlIAo+Pj4+PiB1c2luZyBpdCBwdXJlbHkgdG8gZmluZCAiaG9sZXMiIGluIHRoZSBj
YWxscyB0byBub3RlX3BhZ2UoKSwgYnV0IEkgaGF2ZW4ndCB3b3JrZWQgb3V0IHdoeSBzdWNoIAo+
Pj4+PiBob2xlcyB3b3VsZCBvY2N1ci4KPj4+Pgo+Pj4+IEkgd2FzIGluZGVlZCBpbnRyb2R1Y2Vk
IGZvciBLQVNBTi4gV2UgaGF2ZSBhIGZpcnN0IGNvbW1pdCAKPj4+PiBodHRwczovL2dpdGh1Yi5j
b20vdG9ydmFsZHMvbGludXgvY29tbWl0L2NhYmU4MTM4IHdoaWNoIHVzZXMgcGFnZSBzaXplIHRv
IGRldGVjdCB3aGV0aGVyIGl0IGlzIGEgCj4+Pj4gS0FTQU4gbGlrZSBzdHVmZi4KPj4+Pgo+Pj4+
IFRoZW4gY2FtZSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2IwMGZm
NmQ4YyBhcyBhIGZpeC4gSSBjYW4ndCByZW1lbWJlciB3aGF0IHRoZSAKPj4+PiBwcm9ibGVtIHdh
cyBleGFjdGx5LCBzb21ldGhpbmcgYXJvdW5kIHRoZSB1c2Ugb2YgaHVnZXBhZ2VzIGZvciBrZXJu
ZWwgbWVtb3J5LCBjYW1lIGFzIHBhcnQgb2YgCj4+Pj4gdGhlIHNlcmllcyAKPj4+PiBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2NvdmVyL2NvdmVyLjE1
ODk4NjY5ODQuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8gCj4+Pgo+Pj4KPj4+Cj4+
Pgo+Pj4gQWgsIHRoYXQncyB1c2VmdWwgY29udGV4dC4gU28gaXQgbG9va3MgbGlrZSBwb3dlcnBj
IHRvb2sgYSBkaWZmZXJlbnQgcm91dGUgdG8gcmVkdWNpbmcgdGhlIEtBU0FOIAo+Pj4gb3V0cHV0
IHRvIHg4Ni4KPj4+Cj4+PiBHaXZlbiB0aGUgZ2VuZXJpYyBwdGR1bXAgY29kZSBoYXMgaGFuZGxp
bmcgZm9yIEtBU0FOIGFscmVhZHkgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGRyb3AgdGhhdCAK
Pj4+IGZyb20gdGhlIHBvd2VycGMgYXJjaCBjb2RlLCB3aGljaCBJIHRoaW5rIG1lYW5zIHdlIGRv
bid0IGFjdHVhbGx5IG5lZWQgdG8gcHJvdmlkZSBwYWdlIHNpemUgdG8gCj4+PiBub3RlcGFnZSgp
LiBIb3BlZnVsbHkgdGhhdCBtZWFucyBtb3JlIGNvZGUgdG8gZGVsZXRlIDspCj4+Pgo+Pgo+PiBZ
ZXMgLi4uIGFuZCBuby4KPj4KPj4gSXQgbG9va3MgbGlrZSB0aGUgZ2VuZXJpYyBwdGR1bXAgaGFu
ZGxlcyB0aGUgY2FzZSB3aGVuIHNldmVyYWwgcGdkaXIgZW50cmllcyBwb2ludHMgdG8gdGhlIHNh
bWUgCj4+IGthc2FuX2Vhcmx5X3NoYWRvd19wdGUuIEJ1dCBpdCBkb2Vzbid0IHRha2UgaW50byBh
Y2NvdW50IHRoZSBwb3dlcnBjIGNhc2Ugd2hlcmUgd2UgaGF2ZSByZWd1bGFyIAo+PiBwYWdlIHRh
YmxlcyB3aGVyZSBzZXZlcmFsIChpZiBub3QgYWxsKSBQVEVzIGFyZSBwb2ludGluZyB0byB0aGUg
a2FzYW5fZWFybHlfc2hhZG93X3BhZ2UgLgo+IAo+IEknbSBub3Qgc3VyZSBJIGZvbGxvdyBxdWl0
ZSBob3cgcG93ZXJwYyBpcyBkaWZmZXJlbnQgaGVyZS4gQnV0IGNvdWxkIHlvdSBoYXZlIGEgc2lt
aWxhciBjaGVjayBmb3IgCj4gUFRFcyBhZ2FpbnN0IGthc2FuX2Vhcmx5X3NoYWRvd19wdGUgYXMg
dGhlIG90aGVyIGxldmVscyBhbHJlYWR5IGhhdmU/Cj4gCj4gSSdtIGp1c3Qgd29ycmllZCB0aGF0
IHBhZ2Vfc2l6ZSBpc24ndCB3ZWxsIGRlZmluZWQgaW4gdGhpcyBpbnRlcmZhY2UgYW5kIGl0J3Mg
Z29pbmcgdG8gY2F1c2UgCj4gcHJvYmxlbXMgaW4gdGhlIGZ1dHVyZS4KPiAKCkknbSB0cnlpbmcu
IEkgcmV2ZXJ0ZWQgdGhlIHR3byBjb21taXRzIGIwMGZmNmQ4YyBhbmQgY2FiZTgxMzguCgpBdCB0
aGUgbW9tZW50LCBJIGRvbid0IGdldCBleGFjdGx5IHdoYXQgSSBleHBlY3Q6IEZvciBsaW5lYXIg
bWVtb3J5IEkgZ2V0IG9uZSBsaW5lIGZvciBlYWNoIDhNIHBhZ2UgCndoZXJlYXMgYmVmb3JlIHJl
dmVydGluZyB0aGUgcGF0Y2hlcyBJIGdvdCBvbmUgMTZNIGxpbmUgYW5kIG9uZSAxMTJNIGxpbmUu
CgpBbmQgZm9yIEtBU0FOIHNoYWRvdyBhcmVhIEkgZ2V0IHR3byBsaW5lcyBmb3IgdGhlIDJ4IDhN
IHBhZ2VzIHNoYWRvd2luZyBsaW5lYXIgbWVtIHRoZW4gSSBnZXQgb25lIDRNIApsaW5lIGZvciBl
YWNoIFBHRElSIGVudHJ5IHBvaW50aW5nIHRvIGthc2FuX2Vhcmx5X3NoYWRvd19wdGUuCgoweGY4
MDAwMDAwLTB4Zjg3ZmZmZmYgMHgwNzAwMDAwMCAgICAgICAgIDhNICAgaHVnZSAgICAgICAgcncg
ICAgICAgcHJlc2VudAoweGY4ODAwMDAwLTB4ZjhmZmZmZmYgMHgwNzgwMDAwMCAgICAgICAgIDhN
ICAgaHVnZSAgICAgICAgcncgICAgICAgcHJlc2VudAoweGY5MDAwMDAwLTB4ZjkzZmZmZmYgMHgw
MTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGY5NDAw
MDAwLTB4Zjk3ZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAg
ICAgcHJlc2VudAoweGY5ODAwMDAwLTB4ZjliZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAg
ICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGY5YzAwMDAwLTB4ZjlmZmZmZmYgMHgwMTQz
MDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZhMDAwMDAw
LTB4ZmEzZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAg
cHJlc2VudAoweGZhNDAwMDAwLTB4ZmE3ZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAg
ICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZhODAwMDAwLTB4ZmFiZmZmZmYgMHgwMTQzMDAw
MCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZhYzAwMDAwLTB4
ZmFmZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJl
c2VudAoweGZiMDAwMDAwLTB4ZmIzZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAg
ICAgICAgciAgICAgICAgcHJlc2VudAoweGZiNDAwMDAwLTB4ZmI3ZmZmZmYgMHgwMTQzMDAwMCAg
ICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZiODAwMDAwLTB4ZmJi
ZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2Vu
dAoweGZiYzAwMDAwLTB4ZmJmZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAg
ICAgciAgICAgICAgcHJlc2VudAoweGZjMDAwMDAwLTB4ZmMzZmZmZmYgMHgwMTQzMDAwMCAgICAg
ICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZjNDAwMDAwLTB4ZmM3ZmZm
ZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAow
eGZjODAwMDAwLTB4ZmNiZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAg
ciAgICAgICAgcHJlc2VudAoweGZjYzAwMDAwLTB4ZmNmZmZmZmYgMHgwMTQzMDAwMCAgICAgICAg
IDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZkMDAwMDAwLTB4ZmQzZmZmZmYg
MHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZk
NDAwMDAwLTB4ZmQ3ZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAg
ICAgICAgcHJlc2VudAoweGZkODAwMDAwLTB4ZmRiZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRN
ICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZkYzAwMDAwLTB4ZmRmZmZmZmYgMHgw
MTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZlMDAw
MDAwLTB4ZmUzZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAg
ICAgcHJlc2VudAoweGZlNDAwMDAwLTB4ZmU3ZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAg
ICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZlODAwMDAwLTB4ZmViZmZmZmYgMHgwMTQz
MDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAgcHJlc2VudAoweGZlYzAwMDAw
LTB4ZmVmZmZmZmYgMHgwMTQzMDAwMCAgICAgICAgIDRNICAgICAgICAgICAgICAgciAgICAgICAg
cHJlc2VudAoKQW55IGlkZWEgPwoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
