Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF09C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 13:15:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14415613EB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 13:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14415613EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6BxfHklUIJ/GGkxiILkOCCF3jmjKVbEgf/O5msYNm44=; b=ZrwDjk5L9CMe7JgL/baY6jXNw
	LXgfynP71JkY55OpZGkdHoHQyoD7bqMI9PnMKmYXKeXBffHmsxoLaF0mPN5p5ghy2/Q6p1hqiI3WK
	K8EpSNOd3kZ0XTZiWtBtXGvAa+mcezQm7xCbZHA+oFlOPMoCJn5aoTnbTolbuaE1G3/XlMTHbr7Ac
	EU4pXY+BfWZkZOaeTn8D2auqgqTT7E9Hnyqpnv6YptW0HQ6lRGDDeT8FX/LvOGCSfWWMwmFQrajcu
	OwiebdmnqiF6Iy1mX00EWj3dcCrEjnqlEjUaVeomoy/6+d5vwkf9vzYzvTYN5QhTuBilSKXteIlK4
	fptQ9G55A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYTjq-009wCx-4P; Mon, 19 Apr 2021 13:14:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTjX-009w8m-Gl; Mon, 19 Apr 2021 13:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1HZR++e3SCm9vfIt/W6h4c6VNinuxCEZ2ZSrN2CJx0g=; b=nYr26wIt7v05zOW8HYF7/ZYhwz
 6TP10pNSW/bD0bM0ivvLC+xB+S2L3WPEI9UUAqe61cAOoL+vh6zw7DQeCf4pfUZYjUDd0HCfD+5Ln
 AZ2Ji14UgozJErSGgcaOTn1gQPh3JR3gd6xmLsvDZ1rQ7m0ghdoJ5OhWsWb7S2uGkiHd8ZHeTKBLo
 VOS+a9VaV7bVUoiyxLisOqT6OtoHiJFUQrXhunkJWhUqFSU7NRn0wf/WUpkA3Kac3QtpsdtGmF5fO
 VZMyTzDu8PTbfOYwrDX6IAJRs/pFq+FqOEwkhBmVH5znuDy6XNksh6CV8kRG38WPhwPBJufZdDZCF
 ni6JWrDg==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTjR-00BNxa-RE; Mon, 19 Apr 2021 13:14:34 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FP6j54THDz9txv8;
 Mon, 19 Apr 2021 15:14:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yKDNb47P5hGT; Mon, 19 Apr 2021 15:14:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FP6j53cN4z9txv7;
 Mon, 19 Apr 2021 15:14:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 866238B7B4;
 Mon, 19 Apr 2021 15:14:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CgC9R0HVBL9q; Mon, 19 Apr 2021 15:14:22 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB4DA8B7BD;
 Mon, 19 Apr 2021 15:14:21 +0200 (CEST)
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <627ee414-2f78-94e3-b77b-1013f52e77e3@csgroup.eu>
Date: Mon, 19 Apr 2021 15:14:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_061430_201436_56DB0ED9 
X-CRM114-Status: GOOD (  15.11  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDEyOjUxLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPiBPbiAx
Ni8wNC8yMDIxIDExOjM4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAxNi8w
NC8yMDIxIMOgIDExOjI4LCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPj4+IE9uIDE1LzA0LzIw
MjEgMTg6MTgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pgo+Pj4gVG8gYmUgaG9uZXN0IEkg
ZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB3aHkgcG93ZXJwYyByZXF1aXJlcyB0aGUgcGFnZV9zaXpl
IC0gaXQgYXBwZWFycyB0byBiZSB1c2luZyAKPj4+IGl0IHB1cmVseSB0byBmaW5kICJob2xlcyIg
aW4gdGhlIGNhbGxzIHRvIG5vdGVfcGFnZSgpLCBidXQgSSBoYXZlbid0IHdvcmtlZCBvdXQgd2h5
IHN1Y2ggaG9sZXMgCj4+PiB3b3VsZCBvY2N1ci4KPj4KPj4gSSB3YXMgaW5kZWVkIGludHJvZHVj
ZWQgZm9yIEtBU0FOLiBXZSBoYXZlIGEgZmlyc3QgY29tbWl0IAo+PiBodHRwczovL2dpdGh1Yi5j
b20vdG9ydmFsZHMvbGludXgvY29tbWl0L2NhYmU4MTM4IHdoaWNoIHVzZXMgcGFnZSBzaXplIHRv
IGRldGVjdCB3aGV0aGVyIGl0IGlzIGEgCj4+IEtBU0FOIGxpa2Ugc3R1ZmYuCj4+Cj4+IFRoZW4g
Y2FtZSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2IwMGZmNmQ4YyBh
cyBhIGZpeC4gSSBjYW4ndCByZW1lbWJlciB3aGF0IHRoZSAKPj4gcHJvYmxlbSB3YXMgZXhhY3Rs
eSwgc29tZXRoaW5nIGFyb3VuZCB0aGUgdXNlIG9mIGh1Z2VwYWdlcyBmb3Iga2VybmVsIG1lbW9y
eSwgY2FtZSBhcyBwYXJ0IG9mIHRoZSAKPj4gc2VyaWVzIAo+PiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2NvdmVyL2NvdmVyLjE1ODk4NjY5ODQuZ2l0
LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8gCj4gCj4gCj4gQWgsIHRoYXQncyB1c2VmdWwg
Y29udGV4dC4gU28gaXQgbG9va3MgbGlrZSBwb3dlcnBjIHRvb2sgYSBkaWZmZXJlbnQgcm91dGUg
dG8gcmVkdWNpbmcgdGhlIEtBU0FOIAo+IG91dHB1dCB0byB4ODYuCj4gCj4gR2l2ZW4gdGhlIGdl
bmVyaWMgcHRkdW1wIGNvZGUgaGFzIGhhbmRsaW5nIGZvciBLQVNBTiBhbHJlYWR5IGl0IHNob3Vs
ZCBiZSBwb3NzaWJsZSB0byBkcm9wIHRoYXQgZnJvbSAKPiB0aGUgcG93ZXJwYyBhcmNoIGNvZGUs
IHdoaWNoIEkgdGhpbmsgbWVhbnMgd2UgZG9uJ3QgYWN0dWFsbHkgbmVlZCB0byBwcm92aWRlIHBh
Z2Ugc2l6ZSB0byAKPiBub3RlcGFnZSgpLiBIb3BlZnVsbHkgdGhhdCBtZWFucyBtb3JlIGNvZGUg
dG8gZGVsZXRlIDspCj4gCgpMb29raW5nIGF0IGhvdyB0aGUgZ2VuZXJpYyBwdGR1bXAgY29kZSBo
YW5kbGVzIEtBU0FOLCBJJ20gYSBiaXQgc2NlcHRpYy4KCklJVUMsIGl0IGlzIGNoZWNraW5nIHRo
YXQga2FzYW5fZWFybHlfc2hhZG93X3B0ZSBpcyBpbiB0aGUgc2FtZSBwYWdlIGFzIHRoZSBwZ3Rh
YmxlIHJlZmVycmVkIGJ5IHRoZSAKUE1EIGVudHJ5LiBCdXQgd2hhdCBoYXBwZW5zIGlmIHRoYXQg
UE1EIGVudHJ5IGlzIHJlZmVycmluZyBhbm90aGVyIHBndGFibGUgd2hpY2ggaXMgaW5zaWRlIHRo
ZSBzYW1lIApwYWdlIGFzIGthc2FuX2Vhcmx5X3NoYWRvd19wdGUgPwoKU2hvdWxkbid0IHRoZSB0
ZXN0IGJlCgoJaWYgKHBtZF9wYWdlX3ZhZGRyKHZhbCkgPT0gbG1fYWxpYXMoa2FzYW5fZWFybHlf
c2hhZG93X3B0ZSkpCgkJcmV0dXJuIG5vdGVfa2FzYW5fcGFnZV90YWJsZSh3YWxrLCBhZGRyKTsK
CgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
