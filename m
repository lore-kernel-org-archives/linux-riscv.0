Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4346C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 15:06:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64643611AE
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 15:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64643611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ks8P+g5o4iu0judtMyZ4Eu1DJRRQoos9lDiW8qusfNU=; b=cpRN5EHpEnjzdEJyMS2rbA4m8
	W3ZChkal6XjYgtTU9iP83p8hjtWGodbGt6gb2oAtA5ILGPNM4hcSMx266VRxGzCRo1SHfb1sqP+At
	zwJpI5sFdionAyue8GRg/rGA1gFul6yYlu/0K/vSr1lq29Lcbdp/vLhetlM/Z1R3Xu7m77F9l3i69
	7QJ5j7y2HNF2lm5NmrBAWUK1HfklN39p4YOjGdPX4X652vkaHJr43474+ZhgHuoV1aMnaiynv9Pev
	r5+jjblCBxXhF8yTVNLXNCPWIrxGi4+VydgPQ3PsP52vZTZUaV3PFR5TORJdpuP2Vl/8DjvHVIt1G
	ofh8fuXrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQ2M-002YDD-9q; Fri, 16 Apr 2021 15:05:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQ1s-002Y9b-PA; Fri, 16 Apr 2021 15:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=h9GLmuoWRBrIX8vKjsu3dNdsMPMTk+unES234zNjZnQ=; b=Z8XpdFwzgxcnzXzapZWm/V9NUw
 kZf98aLjGg6PgXzA7LprQo9qWUOzOwb/GuW1jKIYsHAns5BD/drRblVHIZW4ETaYFzNFAFRa6xqi8
 VmF6hYC5Oj/uRqp8v4gRoUJvKTPLDRFBb4GDXRz0Zbiwc0IkWElZUgPYe+xZzJZcjLbDUkN+9GT8w
 NF2h72OkqZInz0czomssgoFixEqinOhtCzHa+NWLvckndXf70wE4ICFRtAIE/wft6QfOA+41M0UqH
 OFr6ZI7DkeuKYtBCrWMWqWsQB6/y3xlJEQEpXFGJQo/uJjCkYlLwW+y9u1s0qS9LxEugEv3xesiv/
 fEPM9vBA==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQ1n-009UFK-24; Fri, 16 Apr 2021 15:05:07 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMKJB6MPwz9v3LN;
 Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nfnIuGVT2LDV; Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMKJB4wVtz9v3LK;
 Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F4968B851;
 Fri, 16 Apr 2021 17:05:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gM_a9XKodz3W; Fri, 16 Apr 2021 17:04:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EF558B84C;
 Fri, 16 Apr 2021 17:04:58 +0200 (CEST)
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
Message-ID: <b245cf06-f2e5-87a5-9a5e-64efc39d415a@csgroup.eu>
Date: Fri, 16 Apr 2021 17:04:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b6b5300d-35a0-3bc0-ad1d-f2af433ef27e@csgroup.eu>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_080503_442022_8250DEA1 
X-CRM114-Status: GOOD (  24.10  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDE2OjQwLCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4g
Cj4gCj4gTGUgMTYvMDQvMjAyMSDDoCAxNTowMCwgU3RldmVuIFByaWNlIGEgw6ljcml0wqA6Cj4+
IE9uIDE2LzA0LzIwMjEgMTI6MDgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pgo+Pj4KPj4+
IExlIDE2LzA0LzIwMjEgw6AgMTI6NTEsIFN0ZXZlbiBQcmljZSBhIMOpY3JpdMKgOgo+Pj4+IE9u
IDE2LzA0LzIwMjEgMTE6MzgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+
Pj4+IExlIDE2LzA0LzIwMjEgw6AgMTE6MjgsIFN0ZXZlbiBQcmljZSBhIMOpY3JpdMKgOgo+Pj4+
Pj4gVG8gYmUgaG9uZXN0IEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB3aHkgcG93ZXJwYyByZXF1
aXJlcyB0aGUgcGFnZV9zaXplIC0gaXQgYXBwZWFycyB0byBiZSAKPj4+Pj4+IHVzaW5nIGl0IHB1
cmVseSB0byBmaW5kICJob2xlcyIgaW4gdGhlIGNhbGxzIHRvIG5vdGVfcGFnZSgpLCBidXQgSSBo
YXZlbid0IHdvcmtlZCBvdXQgd2h5IHN1Y2ggCj4+Pj4+PiBob2xlcyB3b3VsZCBvY2N1ci4KPj4+
Pj4KPj4+Pj4gSSB3YXMgaW5kZWVkIGludHJvZHVjZWQgZm9yIEtBU0FOLiBXZSBoYXZlIGEgZmly
c3QgY29tbWl0IAo+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0
L2NhYmU4MTM4IHdoaWNoIHVzZXMgcGFnZSBzaXplIHRvIGRldGVjdCB3aGV0aGVyIGl0IGlzIAo+
Pj4+PiBhIEtBU0FOIGxpa2Ugc3R1ZmYuCj4+Pj4+Cj4+Pj4+IFRoZW4gY2FtZSBodHRwczovL2dp
dGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2IwMGZmNmQ4YyBhcyBhIGZpeC4gSSBjYW4n
dCByZW1lbWJlciB3aGF0IAo+Pj4+PiB0aGUgcHJvYmxlbSB3YXMgZXhhY3RseSwgc29tZXRoaW5n
IGFyb3VuZCB0aGUgdXNlIG9mIGh1Z2VwYWdlcyBmb3Iga2VybmVsIG1lbW9yeSwgY2FtZSBhcyBw
YXJ0IAo+Pj4+PiBvZiB0aGUgc2VyaWVzIAo+Pj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2NvdmVyL2NvdmVyLjE1ODk4NjY5ODQuZ2l0LmNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldS8gCj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IEFo
LCB0aGF0J3MgdXNlZnVsIGNvbnRleHQuIFNvIGl0IGxvb2tzIGxpa2UgcG93ZXJwYyB0b29rIGEg
ZGlmZmVyZW50IHJvdXRlIHRvIHJlZHVjaW5nIHRoZSBLQVNBTiAKPj4+PiBvdXRwdXQgdG8geDg2
Lgo+Pj4+Cj4+Pj4gR2l2ZW4gdGhlIGdlbmVyaWMgcHRkdW1wIGNvZGUgaGFzIGhhbmRsaW5nIGZv
ciBLQVNBTiBhbHJlYWR5IGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBkcm9wIHRoYXQgCj4+Pj4g
ZnJvbSB0aGUgcG93ZXJwYyBhcmNoIGNvZGUsIHdoaWNoIEkgdGhpbmsgbWVhbnMgd2UgZG9uJ3Qg
YWN0dWFsbHkgbmVlZCB0byBwcm92aWRlIHBhZ2Ugc2l6ZSB0byAKPj4+PiBub3RlcGFnZSgpLiBI
b3BlZnVsbHkgdGhhdCBtZWFucyBtb3JlIGNvZGUgdG8gZGVsZXRlIDspCj4+Pj4KPj4+Cj4+PiBZ
ZXMgLi4uIGFuZCBuby4KPj4+Cj4+PiBJdCBsb29rcyBsaWtlIHRoZSBnZW5lcmljIHB0ZHVtcCBo
YW5kbGVzIHRoZSBjYXNlIHdoZW4gc2V2ZXJhbCBwZ2RpciBlbnRyaWVzIHBvaW50cyB0byB0aGUg
c2FtZSAKPj4+IGthc2FuX2Vhcmx5X3NoYWRvd19wdGUuIEJ1dCBpdCBkb2Vzbid0IHRha2UgaW50
byBhY2NvdW50IHRoZSBwb3dlcnBjIGNhc2Ugd2hlcmUgd2UgaGF2ZSByZWd1bGFyIAo+Pj4gcGFn
ZSB0YWJsZXMgd2hlcmUgc2V2ZXJhbCAoaWYgbm90IGFsbCkgUFRFcyBhcmUgcG9pbnRpbmcgdG8g
dGhlIGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlIC4KPj4KPj4gSSdtIG5vdCBzdXJlIEkgZm9sbG93
IHF1aXRlIGhvdyBwb3dlcnBjIGlzIGRpZmZlcmVudCBoZXJlLiBCdXQgY291bGQgeW91IGhhdmUg
YSBzaW1pbGFyIGNoZWNrIGZvciAKPj4gUFRFcyBhZ2FpbnN0IGthc2FuX2Vhcmx5X3NoYWRvd19w
dGUgYXMgdGhlIG90aGVyIGxldmVscyBhbHJlYWR5IGhhdmU/Cj4+Cj4+IEknbSBqdXN0IHdvcnJp
ZWQgdGhhdCBwYWdlX3NpemUgaXNuJ3Qgd2VsbCBkZWZpbmVkIGluIHRoaXMgaW50ZXJmYWNlIGFu
ZCBpdCdzIGdvaW5nIHRvIGNhdXNlIAo+PiBwcm9ibGVtcyBpbiB0aGUgZnV0dXJlLgo+Pgo+IAo+
IEknbSB0cnlpbmcuIEkgcmV2ZXJ0ZWQgdGhlIHR3byBjb21taXRzIGIwMGZmNmQ4YyBhbmQgY2Fi
ZTgxMzguCj4gCj4gQXQgdGhlIG1vbWVudCwgSSBkb24ndCBnZXQgZXhhY3RseSB3aGF0IEkgZXhw
ZWN0OiBGb3IgbGluZWFyIG1lbW9yeSBJIGdldCBvbmUgbGluZSBmb3IgZWFjaCA4TSBwYWdlIAo+
IHdoZXJlYXMgYmVmb3JlIHJldmVydGluZyB0aGUgcGF0Y2hlcyBJIGdvdCBvbmUgMTZNIGxpbmUg
YW5kIG9uZSAxMTJNIGxpbmUuCj4gCj4gQW5kIGZvciBLQVNBTiBzaGFkb3cgYXJlYSBJIGdldCB0
d28gbGluZXMgZm9yIHRoZSAyeCA4TSBwYWdlcyBzaGFkb3dpbmcgbGluZWFyIG1lbSB0aGVuIEkg
Z2V0IG9uZSA0TSAKPiBsaW5lIGZvciBlYWNoIFBHRElSIGVudHJ5IHBvaW50aW5nIHRvIGthc2Fu
X2Vhcmx5X3NoYWRvd19wdGUuCj4gCj4gMHhmODAwMDAwMC0weGY4N2ZmZmZmIDB4MDcwMDAwMDDC
oMKgwqDCoMKgwqDCoMKgIDhNwqDCoCBodWdlwqDCoMKgwqDCoMKgwqAgcnfCoMKgwqDCoMKgwqAg
cHJlc2VudAo+IDB4Zjg4MDAwMDAtMHhmOGZmZmZmZiAweDA3ODAwMDAwwqDCoMKgwqDCoMKgwqDC
oCA4TcKgwqAgaHVnZcKgwqDCoMKgwqDCoMKgIHJ3wqDCoMKgwqDCoMKgIHByZXNlbnQKPiAweGY5
MDAwMDAwLTB4ZjkzZmZmZmYgMHgwMTQzMDAwMMKgwqDCoMKgwqDCoMKgwqAgNE3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHLCoMKgwqDCoMKgwqDCoCBwcmVzZW50Ci4uLgo+IDB4ZmVjMDAw
MDAtMHhmZWZmZmZmZiAweDAxNDMwMDAwwqDCoMKgwqDCoMKgwqDCoCA0TcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcsKgwqDCoMKgwqDCoMKgIHByZXNlbnQKPiAKPiBBbnkgaWRlYSA/Cj4g
CgoKSSB0aGluayB0aGUgZGlmZmVyZW50IHdpdGggb3RoZXIgYXJjaGl0ZWN0dXJlcyBpcyBoZXJl
OgoKCX0gZWxzZSBpZiAoZmxhZyAhPSBzdC0+Y3VycmVudF9mbGFncyB8fCBsZXZlbCAhPSBzdC0+
bGV2ZWwgfHwKCQkgICBhZGRyID49IHN0LT5tYXJrZXJbMV0uc3RhcnRfYWRkcmVzcyB8fAoJCSAg
IHBhICE9IHN0LT5sYXN0X3BhICsgUEFHRV9TSVpFKSB7CgoKSW4gYWRkaXRpb24gdG8gdGhlIGNo
ZWNrcyBldmVyeW9uZSBkbywgcG93ZXJwYyBhbHNvIGNoZWNrcyAicGEgIT0gc3QtPmxhc3RfcGEg
KyBQQUdFX1NJWkUiLgpBbmQgaXQgaXMgZGVmaW5pdGVseSBmb3IgdGhhdCB0ZXN0IHRoYXQgcGFn
ZV9zaXplIGFyZ3VtZW50IGFkZCBiZWVuIGFkZGVkLgoKSSBzZWUgdGhhdCBvdGhlciBhcmNoaXRl
Y3R1cmVzIGV4Y2VwdCBSSVNDViBkb24ndCBkdW1wIHRoZSBwaHlzaWNhbCBhZGRyZXNzLiBCdXQg
ZXZlbiBSSVNDViBkb2Vzbid0IAppbmNsdWRlIHRoYXQgY2hlY2suCgpUaGF0IHBoeXNpY2FsIGFk
ZHJlc3MgZHVtcCB3YXMgYWRkZWQgYnkgY29tbWl0IGFhYTIyOTUyOTI0NCAoInBvd2VycGMvbW06
IEFkZCBwaHlzaWNhbCBhZGRyZXNzIHRvIApMaW51eCBwYWdlIHRhYmxlIGR1bXAiKSBbaHR0cHM6
Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9hYWEyMjk1XQoKSG93IGRvIG90aGVy
IGFyY2hpdGVjdHVyZXMgZGVhbCB3aXRoIHRoZSBwcm9ibGVtIGRlc2NyaWJlZCBieSB0aGUgY29t
bWl0IGxvZyBvZiB0aGF0IHBhdGNoID8KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
