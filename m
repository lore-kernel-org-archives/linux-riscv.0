Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC81FC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 16:41:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBF96100B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 16:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBF96100B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Hflr5VH2NlVWXaqaZlAhgn1NwfBzdSatTF5GGML6XA=; b=f/WcB9FTeUF+wgTgrBOcX29EL
	NmHHPyQlPyBXDojKwhP1QXbe8t0ZA1sXkTPJ2C8eOrE6d3fnMN0N8SBJtVQx10ietQsH15rDRMZ5g
	pS3fMQqSzeizY6grRMcuRHoV6OjWFHTbdoO1bk18/7S2fY7kZq5NhCJW1TQ235BYGdUZ9gVlAKCnk
	YSJb7OdcAe+Zm2Xg/MHEypUZGxIR0cVSHZPF6hv/irSK6CWh+PlEmu6kp8ds+hoqYEykJgvuprJtO
	XUB+A7TuaMR1XUklcu6zm8dKRTHpci4+F4O3PTqA/uWDFTpgGEsay3iOQyVu5QNhf16tHh1tSoJFg
	F4onYx//Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYWxu-00AIxr-6M; Mon, 19 Apr 2021 16:41:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYWxi-00AIxA-4y; Mon, 19 Apr 2021 16:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ca4T0uw5ALbXrB4Orb14KQZ2p4eL1PV0HgeHBsxBPoY=; b=KxMVCdEjpcYSAuILZg5+u211xH
 QcmOyVAWwHiSj0/vH6vXXkDG8uS449K869yje/IALFJPf3jFY7Kerirnsf7+g3EnGOnHGpLv6HEzQ
 ypre6qPH8nR0taBwjuUwNTr6gO4WiDZ6W2aHmG95i2k9YCHU3BdCAO779WSyKWCHpI0flSRGAijX6
 qdOrkIAyMBJHoI6ZLStg/zVBWOUuSedfO8ABzd2S8yeXXBYxmO56wjZNAhBdLbqcEQIFgVR50Xxgk
 fVt5SZeaBcYXDq57ZoG0U8ePdes/rwzBBpo1vFQUl25Vsd75UjJsPzKtnGqRMWyk3qUZ0NPKx1JLZ
 YAPeL+xw==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYWxc-00BX3r-Dq; Mon, 19 Apr 2021 16:41:24 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPCHr05Bbz9vBmZ;
 Mon, 19 Apr 2021 18:41:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ByG0UeFaG4_7; Mon, 19 Apr 2021 18:41:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPCHq6Dlmz9vBmY;
 Mon, 19 Apr 2021 18:41:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D43E8B7C9;
 Mon, 19 Apr 2021 18:41:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nDGl7TOpMiLz; Mon, 19 Apr 2021 18:41:17 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56BD68B7C6;
 Mon, 19 Apr 2021 18:41:16 +0200 (CEST)
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
 <627ee414-2f78-94e3-b77b-1013f52e77e3@csgroup.eu>
 <4a76fbda-aa9d-867b-e2eb-a1951780aeec@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4cdd8dc0-34d6-11a3-f3b2-d6eb58c435c7@csgroup.eu>
Date: Mon, 19 Apr 2021 18:41:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <4a76fbda-aa9d-867b-e2eb-a1951780aeec@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_094120_815639_B5A6F6CA 
X-CRM114-Status: GOOD (  19.99  )
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

CgpMZSAxOS8wNC8yMDIxIMOgIDE2OjAwLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPiBPbiAx
OS8wNC8yMDIxIDE0OjE0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAxNi8w
NC8yMDIxIMOgIDEyOjUxLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPj4+IE9uIDE2LzA0LzIw
MjEgMTE6MzgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IExlIDE2LzA0
LzIwMjEgw6AgMTE6MjgsIFN0ZXZlbiBQcmljZSBhIMOpY3JpdMKgOgo+Pj4+PiBPbiAxNS8wNC8y
MDIxIDE4OjE4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBUbyBiZSBob25l
c3QgSSBkb24ndCBmdWxseSB1bmRlcnN0YW5kIHdoeSBwb3dlcnBjIHJlcXVpcmVzIHRoZSBwYWdl
X3NpemUgLSBpdCBhcHBlYXJzIHRvIGJlIAo+Pj4+PiB1c2luZyBpdCBwdXJlbHkgdG8gZmluZCAi
aG9sZXMiIGluIHRoZSBjYWxscyB0byBub3RlX3BhZ2UoKSwgYnV0IEkgaGF2ZW4ndCB3b3JrZWQg
b3V0IHdoeSBzdWNoIAo+Pj4+PiBob2xlcyB3b3VsZCBvY2N1ci4KPj4+Pgo+Pj4+IEkgd2FzIGlu
ZGVlZCBpbnRyb2R1Y2VkIGZvciBLQVNBTi4gV2UgaGF2ZSBhIGZpcnN0IGNvbW1pdCAKPj4+PiBo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2NhYmU4MTM4IHdoaWNoIHVz
ZXMgcGFnZSBzaXplIHRvIGRldGVjdCB3aGV0aGVyIGl0IGlzIGEgCj4+Pj4gS0FTQU4gbGlrZSBz
dHVmZi4KPj4+Pgo+Pj4+IFRoZW4gY2FtZSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGlu
dXgvY29tbWl0L2IwMGZmNmQ4YyBhcyBhIGZpeC4gSSBjYW4ndCByZW1lbWJlciB3aGF0IHRoZSAK
Pj4+PiBwcm9ibGVtIHdhcyBleGFjdGx5LCBzb21ldGhpbmcgYXJvdW5kIHRoZSB1c2Ugb2YgaHVn
ZXBhZ2VzIGZvciBrZXJuZWwgbWVtb3J5LCBjYW1lIGFzIHBhcnQgb2YgCj4+Pj4gdGhlIHNlcmll
cyAKPj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2
L2NvdmVyL2NvdmVyLjE1ODk4NjY5ODQuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8g
Cj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4gQWgsIHRoYXQncyB1c2VmdWwgY29udGV4dC4gU28gaXQgbG9v
a3MgbGlrZSBwb3dlcnBjIHRvb2sgYSBkaWZmZXJlbnQgcm91dGUgdG8gcmVkdWNpbmcgdGhlIEtB
U0FOIAo+Pj4gb3V0cHV0IHRvIHg4Ni4KPj4+Cj4+PiBHaXZlbiB0aGUgZ2VuZXJpYyBwdGR1bXAg
Y29kZSBoYXMgaGFuZGxpbmcgZm9yIEtBU0FOIGFscmVhZHkgaXQgc2hvdWxkIGJlIHBvc3NpYmxl
IHRvIGRyb3AgdGhhdCAKPj4+IGZyb20gdGhlIHBvd2VycGMgYXJjaCBjb2RlLCB3aGljaCBJIHRo
aW5rIG1lYW5zIHdlIGRvbid0IGFjdHVhbGx5IG5lZWQgdG8gcHJvdmlkZSBwYWdlIHNpemUgdG8g
Cj4+PiBub3RlcGFnZSgpLiBIb3BlZnVsbHkgdGhhdCBtZWFucyBtb3JlIGNvZGUgdG8gZGVsZXRl
IDspCj4+Pgo+Pgo+PiBMb29raW5nIGF0IGhvdyB0aGUgZ2VuZXJpYyBwdGR1bXAgY29kZSBoYW5k
bGVzIEtBU0FOLCBJJ20gYSBiaXQgc2NlcHRpYy4KPj4KPj4gSUlVQywgaXQgaXMgY2hlY2tpbmcg
dGhhdCBrYXNhbl9lYXJseV9zaGFkb3dfcHRlIGlzIGluIHRoZSBzYW1lIHBhZ2UgYXMgdGhlIHBn
dGFibGUgcmVmZXJyZWQgYnkgCj4+IHRoZSBQTUQgZW50cnkuIEJ1dCB3aGF0IGhhcHBlbnMgaWYg
dGhhdCBQTUQgZW50cnkgaXMgcmVmZXJyaW5nIGFub3RoZXIgcGd0YWJsZSB3aGljaCBpcyBpbnNp
ZGUgdGhlIAo+PiBzYW1lIHBhZ2UgYXMga2FzYW5fZWFybHlfc2hhZG93X3B0ZSA/Cj4+Cj4+IFNo
b3VsZG4ndCB0aGUgdGVzdCBiZQo+Pgo+PiDCoMKgwqDCoMKgaWYgKHBtZF9wYWdlX3ZhZGRyKHZh
bCkgPT0gbG1fYWxpYXMoa2FzYW5fZWFybHlfc2hhZG93X3B0ZSkpCj4+IMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIG5vdGVfa2FzYW5fcGFnZV90YWJsZSh3YWxrLCBhZGRyKTsKPiAKPiBOb3cgSSBj
b21lIHRvIGxvb2sgYXQgdGhpcyBjb2RlIGFnYWluLCBJIHRoaW5rIHlvdSdyZSByaWdodC4gT24g
YXJtNjQgdGhpcyBkb2Vzbid0IGNhdXNlIGEgcHJvYmxlbSAtIAo+IHBhZ2UgdGFibGVzIGFyZSBw
YWdlIHNpemVkIGFuZCBwYWdlIGFsaWduZWQsIHNvIHRoZXJlIGNvdWxkbid0IGJlIGFueSBub24t
S0FTQU4gcGd0YWJsZXMgc2hhcmluZyB0aGUgCj4gcGFnZS4gT2J2aW91c2x5IHRoYXQncyBub3Qg
bmVjZXNzYXJpbHkgdHJ1ZSBvZiBvdGhlciBhcmNoaXRlY3R1cmVzLgo+IAo+IEZlZWwgZnJlZSB0
byBhZGQgYSBwYXRjaCB0byB5b3VyIHNlcmllcyA7KQo+IAoKT2suCgpJJ2xsIGxlYXZlIHRoYXQg
b3V0c2lkZSBvZiB0aGUgc2VyaWVzLCBpdCBpcyBub3QgYSBzaG93IHN0b3BwZXIgYmVjYXVzZSBl
YXJseSBzaGFkb3cgcGFnZSAKZGlyZWN0b3JpZXMgYXJlIGFsbCB0YWdnZWQgX19ic3NfcGFnZV9h
bGlnbmVkIHNvIHdlIGNhbid0IGhhdmUgdHdvIG9mIHRoZW0gaW4gdGhlIHNhbWUgcGFnZSBhbmQg
aXQgCmlzIHJlYWxseSB1bmxpa2VseSB0aGF0IHdlJ2xsIGhhdmUgYW55IG90aGVyIHN0YXRpY2Fs
bHkgZGVmaW5lZCBwYWdlIGRpcmVjdG9yeSBpbiB0aGUgc2FtZSBwYWdlcyBlaXRoZXIuCgpBbmQg
Zm9yIHRoZSBzcGVjaWFsIGNhc2Ugb2YgcG93ZXJwYyA4eHggd2hpY2ggaXMgdGhlIG9ubHkgb25l
IGZvciB3aGljaCB3ZSBoYXZlIGJvdGggS0FTQU4gYW5kIApIVUdFUEQgYXQgdGhlIHRpbWUgYmVp
bmcsIHRoZXJlIGFyZSBvbmx5IHR3byBsZXZlbHMgb2YgcGFnZSBkaXJlY3RvcmllcyBzbyBubyBp
c3N1ZS4KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
