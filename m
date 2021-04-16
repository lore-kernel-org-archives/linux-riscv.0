Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D2FC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 15:16:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 945886117A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 15:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 945886117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/gPp3nMS6r27fvxWHzuVdL4v0XZ+zWIMDUNGb2O8tLo=; b=MVex1PNmmgFyk7msGbeE/J9yH
	hhkWSm5pjdtm7fDrNsVUSed0Y/nRuXIcGpsLB1PdIwYrZG/zUbQw2przSSJ7zyxg3JVflnVmF7ISx
	dyl+LNSxeH9ru0KwIgxeq9Efbq9CTKNpWZ4tHTaDr8ysaE5lCu0YxEamtsjJjsKHcDRCdx9HgAq3v
	JigOPZ8dOuarjjutEUshkKOfHFYU2uz6S0PudHNgEF3z23yvPSoKyo0QOYVmeMcmiPlyj+5Wn3EuN
	4XIP6168JreXST2dAo1pi93Cxuxmo1tpJsZciHyh4acRoiakTnDEyXxZqPLTAw9+RudhEQHFvX2Jy
	taJkYcrsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQCc-002Zvp-4o; Fri, 16 Apr 2021 15:16:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQC0-002ZnA-Ri; Fri, 16 Apr 2021 15:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=IwHr0cA1983cUVw96On0lPMMq4UaxwAz1HPTd97q3Vg=; b=rmANpyw5LNl03YqHTDPst4ffZe
 I+Arvv/xYxw0pKEI6pNmLSTXsRF0npzl/viW7Z36DqPra/tF5fA9BDrhLK8E7TPOPjYeepT00gokR
 9UMgA3R2AR/tDrj2LA24yhxEKxijyFOy4ksobLBaCI4Vb35vIkyTwhYRP+qz6DWsyOOTCxurKjLqT
 tszuwD3J64cfNiQp++n/y22dVX2XxJAvoBxTRBeMcJ+bJqy0vu7ao1KBC5UImlA/y5fliVnf9lsrY
 CaxeUZV+1gazmXZ4RKmoufMYjBOnFAsGK89MK8ZyIxB1BpyfvBt3ahXO3EHIUus9b3cSMY9VBqP/7
 OmxmeO/Q==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQBv-009UhN-8Q; Fri, 16 Apr 2021 15:15:35 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMKXD004dz9v3Lf;
 Fri, 16 Apr 2021 17:15:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WK3DlU5pFCvu; Fri, 16 Apr 2021 17:15:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMKXC6BwFz9v3Ld;
 Fri, 16 Apr 2021 17:15:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 766108B84E;
 Fri, 16 Apr 2021 17:15:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5GrWiUHi_Hri; Fri, 16 Apr 2021 17:15:25 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5295F8B84C;
 Fri, 16 Apr 2021 17:15:24 +0200 (CEST)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Price <steven.price@arm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
 <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
 <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
 <6ff4816b-8ff6-19de-73a2-3fcadc003ccd@csgroup.eu>
 <e39d500a-2154-3c5d-9393-8bf53a567fad@arm.com>
 <b6b5300d-35a0-3bc0-ad1d-f2af433ef27e@csgroup.eu>
 <b245cf06-f2e5-87a5-9a5e-64efc39d415a@csgroup.eu>
Message-ID: <10adad00-14de-61b6-ce2a-bdde23a34bcf@csgroup.eu>
Date: Fri, 16 Apr 2021 17:15:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b245cf06-f2e5-87a5-9a5e-64efc39d415a@csgroup.eu>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_081531_625272_00909876 
X-CRM114-Status: GOOD (  26.19  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDE3OjA0LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4g
Cj4gCj4gTGUgMTYvMDQvMjAyMSDDoCAxNjo0MCwgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdMKg
Ogo+Pgo+Pgo+PiBMZSAxNi8wNC8yMDIxIMOgIDE1OjAwLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTC
oDoKPj4+IE9uIDE2LzA0LzIwMjEgMTI6MDgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4K
Pj4+Pgo+Pj4+IExlIDE2LzA0LzIwMjEgw6AgMTI6NTEsIFN0ZXZlbiBQcmljZSBhIMOpY3JpdMKg
Ogo+Pj4+PiBPbiAxNi8wNC8yMDIxIDExOjM4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+
Pj4KPj4+Pj4+Cj4+Pj4+PiBMZSAxNi8wNC8yMDIxIMOgIDExOjI4LCBTdGV2ZW4gUHJpY2UgYSDD
qWNyaXTCoDoKPj4+Pj4+PiBUbyBiZSBob25lc3QgSSBkb24ndCBmdWxseSB1bmRlcnN0YW5kIHdo
eSBwb3dlcnBjIHJlcXVpcmVzIHRoZSBwYWdlX3NpemUgLSBpdCBhcHBlYXJzIHRvIGJlIAo+Pj4+
Pj4+IHVzaW5nIGl0IHB1cmVseSB0byBmaW5kICJob2xlcyIgaW4gdGhlIGNhbGxzIHRvIG5vdGVf
cGFnZSgpLCBidXQgSSBoYXZlbid0IHdvcmtlZCBvdXQgd2h5IAo+Pj4+Pj4+IHN1Y2ggaG9sZXMg
d291bGQgb2NjdXIuCj4+Pj4+Pgo+Pj4+Pj4gSSB3YXMgaW5kZWVkIGludHJvZHVjZWQgZm9yIEtB
U0FOLiBXZSBoYXZlIGEgZmlyc3QgY29tbWl0IAo+Pj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3Rv
cnZhbGRzL2xpbnV4L2NvbW1pdC9jYWJlODEzOCB3aGljaCB1c2VzIHBhZ2Ugc2l6ZSB0byBkZXRl
Y3Qgd2hldGhlciBpdCBpcyAKPj4+Pj4+IGEgS0FTQU4gbGlrZSBzdHVmZi4KPj4+Pj4+Cj4+Pj4+
PiBUaGVuIGNhbWUgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9iMDBm
ZjZkOGMgYXMgYSBmaXguIEkgY2FuJ3QgcmVtZW1iZXIgd2hhdCAKPj4+Pj4+IHRoZSBwcm9ibGVt
IHdhcyBleGFjdGx5LCBzb21ldGhpbmcgYXJvdW5kIHRoZSB1c2Ugb2YgaHVnZXBhZ2VzIGZvciBr
ZXJuZWwgbWVtb3J5LCBjYW1lIGFzIHBhcnQgCj4+Pj4+PiBvZiB0aGUgc2VyaWVzIAo+Pj4+Pj4g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9jb3Zlci9j
b3Zlci4xNTg5ODY2OTg0LmdpdC5jaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUvIAo+Pj4+Pgo+
Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBBaCwgdGhhdCdzIHVzZWZ1bCBjb250
ZXh0LiBTbyBpdCBsb29rcyBsaWtlIHBvd2VycGMgdG9vayBhIGRpZmZlcmVudCByb3V0ZSB0byBy
ZWR1Y2luZyB0aGUgCj4+Pj4+IEtBU0FOIG91dHB1dCB0byB4ODYuCj4+Pj4+Cj4+Pj4+IEdpdmVu
IHRoZSBnZW5lcmljIHB0ZHVtcCBjb2RlIGhhcyBoYW5kbGluZyBmb3IgS0FTQU4gYWxyZWFkeSBp
dCBzaG91bGQgYmUgcG9zc2libGUgdG8gZHJvcCB0aGF0IAo+Pj4+PiBmcm9tIHRoZSBwb3dlcnBj
IGFyY2ggY29kZSwgd2hpY2ggSSB0aGluayBtZWFucyB3ZSBkb24ndCBhY3R1YWxseSBuZWVkIHRv
IHByb3ZpZGUgcGFnZSBzaXplIHRvIAo+Pj4+PiBub3RlcGFnZSgpLiBIb3BlZnVsbHkgdGhhdCBt
ZWFucyBtb3JlIGNvZGUgdG8gZGVsZXRlIDspCj4+Pj4+Cj4+Pj4KPj4+PiBZZXMgLi4uIGFuZCBu
by4KPj4+Pgo+Pj4+IEl0IGxvb2tzIGxpa2UgdGhlIGdlbmVyaWMgcHRkdW1wIGhhbmRsZXMgdGhl
IGNhc2Ugd2hlbiBzZXZlcmFsIHBnZGlyIGVudHJpZXMgcG9pbnRzIHRvIHRoZSBzYW1lIAo+Pj4+
IGthc2FuX2Vhcmx5X3NoYWRvd19wdGUuIEJ1dCBpdCBkb2Vzbid0IHRha2UgaW50byBhY2NvdW50
IHRoZSBwb3dlcnBjIGNhc2Ugd2hlcmUgd2UgaGF2ZSByZWd1bGFyIAo+Pj4+IHBhZ2UgdGFibGVz
IHdoZXJlIHNldmVyYWwgKGlmIG5vdCBhbGwpIFBURXMgYXJlIHBvaW50aW5nIHRvIHRoZSBrYXNh
bl9lYXJseV9zaGFkb3dfcGFnZSAuCj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIEkgZm9sbG93IHF1aXRl
IGhvdyBwb3dlcnBjIGlzIGRpZmZlcmVudCBoZXJlLiBCdXQgY291bGQgeW91IGhhdmUgYSBzaW1p
bGFyIGNoZWNrIGZvciAKPj4+IFBURXMgYWdhaW5zdCBrYXNhbl9lYXJseV9zaGFkb3dfcHRlIGFz
IHRoZSBvdGhlciBsZXZlbHMgYWxyZWFkeSBoYXZlPwo+Pj4KPj4+IEknbSBqdXN0IHdvcnJpZWQg
dGhhdCBwYWdlX3NpemUgaXNuJ3Qgd2VsbCBkZWZpbmVkIGluIHRoaXMgaW50ZXJmYWNlIGFuZCBp
dCdzIGdvaW5nIHRvIGNhdXNlIAo+Pj4gcHJvYmxlbXMgaW4gdGhlIGZ1dHVyZS4KPj4+Cj4+Cj4+
IEknbSB0cnlpbmcuIEkgcmV2ZXJ0ZWQgdGhlIHR3byBjb21taXRzIGIwMGZmNmQ4YyBhbmQgY2Fi
ZTgxMzguCj4+Cj4+IEF0IHRoZSBtb21lbnQsIEkgZG9uJ3QgZ2V0IGV4YWN0bHkgd2hhdCBJIGV4
cGVjdDogRm9yIGxpbmVhciBtZW1vcnkgSSBnZXQgb25lIGxpbmUgZm9yIGVhY2ggOE0gCj4+IHBh
Z2Ugd2hlcmVhcyBiZWZvcmUgcmV2ZXJ0aW5nIHRoZSBwYXRjaGVzIEkgZ290IG9uZSAxNk0gbGlu
ZSBhbmQgb25lIDExMk0gbGluZS4KPj4KPj4gQW5kIGZvciBLQVNBTiBzaGFkb3cgYXJlYSBJIGdl
dCB0d28gbGluZXMgZm9yIHRoZSAyeCA4TSBwYWdlcyBzaGFkb3dpbmcgbGluZWFyIG1lbSB0aGVu
IEkgZ2V0IG9uZSAKPj4gNE0gbGluZSBmb3IgZWFjaCBQR0RJUiBlbnRyeSBwb2ludGluZyB0byBr
YXNhbl9lYXJseV9zaGFkb3dfcHRlLgo+Pgo+PiAweGY4MDAwMDAwLTB4Zjg3ZmZmZmYgMHgwNzAw
MDAwMMKgwqDCoMKgwqDCoMKgwqAgOE3CoMKgIGh1Z2XCoMKgwqDCoMKgwqDCoCByd8KgwqDCoMKg
wqDCoCBwcmVzZW50Cj4+IDB4Zjg4MDAwMDAtMHhmOGZmZmZmZiAweDA3ODAwMDAwwqDCoMKgwqDC
oMKgwqDCoCA4TcKgwqAgaHVnZcKgwqDCoMKgwqDCoMKgIHJ3wqDCoMKgwqDCoMKgIHByZXNlbnQK
Pj4gMHhmOTAwMDAwMC0weGY5M2ZmZmZmIDB4MDE0MzAwMDDCoMKgwqDCoMKgwqDCoMKgIDRNwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBywqDCoMKgwqDCoMKgwqAgcHJlc2VudAo+IC4uLgo+
PiAweGZlYzAwMDAwLTB4ZmVmZmZmZmYgMHgwMTQzMDAwMMKgwqDCoMKgwqDCoMKgwqAgNE3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHLCoMKgwqDCoMKgwqDCoCBwcmVzZW50Cj4+Cj4+IEFu
eSBpZGVhID8KPj4KPiAKPiAKPiBJIHRoaW5rIHRoZSBkaWZmZXJlbnQgd2l0aCBvdGhlciBhcmNo
aXRlY3R1cmVzIGlzIGhlcmU6Cj4gCj4gIMKgwqDCoMKgfSBlbHNlIGlmIChmbGFnICE9IHN0LT5j
dXJyZW50X2ZsYWdzIHx8IGxldmVsICE9IHN0LT5sZXZlbCB8fAo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhZGRyID49IHN0LT5tYXJrZXJbMV0uc3RhcnRfYWRkcmVzcyB8fAo+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwYSAhPSBzdC0+bGFzdF9wYSArIFBBR0VfU0laRSkgewo+IAo+IAo+IEluIGFk
ZGl0aW9uIHRvIHRoZSBjaGVja3MgZXZlcnlvbmUgZG8sIHBvd2VycGMgYWxzbyBjaGVja3MgInBh
ICE9IHN0LT5sYXN0X3BhICsgUEFHRV9TSVpFIi4KPiBBbmQgaXQgaXMgZGVmaW5pdGVseSBmb3Ig
dGhhdCB0ZXN0IHRoYXQgcGFnZV9zaXplIGFyZ3VtZW50IGFkZCBiZWVuIGFkZGVkLgoKQnkgcmVw
bGFjaW5nIHRoYXQgdGVzdCBieSAocGEgLSBzdC0+c3RhcnRfcGEgIT0gYWRkciAtIHN0LT5zdGFy
dF9hZGRyZXNzKSBpdCB3b3JrcyBhZ2Fpbi4gU28gd2UgCmRlZmluaXRlbHkgZG9uJ3QgbmVlZCB0
aGUgcmVhbCBwYWdlIHNpemUuCgoKPiAKPiBJIHNlZSB0aGF0IG90aGVyIGFyY2hpdGVjdHVyZXMg
ZXhjZXB0IFJJU0NWIGRvbid0IGR1bXAgdGhlIHBoeXNpY2FsIGFkZHJlc3MuIEJ1dCBldmVuIFJJ
U0NWIGRvZXNuJ3QgCj4gaW5jbHVkZSB0aGF0IGNoZWNrLgo+IAo+IFRoYXQgcGh5c2ljYWwgYWRk
cmVzcyBkdW1wIHdhcyBhZGRlZCBieSBjb21taXQgYWFhMjI5NTI5MjQ0ICgicG93ZXJwYy9tbTog
QWRkIHBoeXNpY2FsIGFkZHJlc3MgdG8gCj4gTGludXggcGFnZSB0YWJsZSBkdW1wIikgW2h0dHBz
Oi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvYWFhMjI5NV0KPiAKPiBIb3cgZG8g
b3RoZXIgYXJjaGl0ZWN0dXJlcyBkZWFsIHdpdGggdGhlIHByb2JsZW0gZGVzY3JpYmVkIGJ5IHRo
ZSBjb21taXQgbG9nIG9mIHRoYXQgcGF0Y2ggPwo+IAo+IENocmlzdG9waGUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
