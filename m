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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C86C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 11:09:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7964561152
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 11:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7964561152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fL7hhtJ6FvOmXhVF5cZ17TbBgMCcm/NECUwzcZYk0Uc=; b=ZHnZPowZ32GmhRwH38SRM0YfF
	TGmkSGP8oya6Hks32FnTCG9ErfxiHEBXf3Sp0Kv+p6WP/Bpc1Z+rUtVasr11qNrr6YrxTnyCfi9lk
	ob+iIwinSQ+Mo1fvp0qfGaZMbCxSRB4Brv4mbZpe8wz+bh4kfBS8GgzkZPHSyrfdv8VU/FlZRKiqp
	M7JUUuCX+Dwqf8uEBtpWI0zGB+/3uBpUaxBi9X6XYW2S/D3JiG46in/wPEQOT74WH0o8RZZ2lzHzL
	DWmsJ91BYqUE7amEOFbFGoOzm4UiEMiAn3/lZQrTKsF/DbNeyZEl2CpLRzo/EPKpqwZtz0i5nO/68
	N5PO6JwNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXMLD-001rnG-Ux; Fri, 16 Apr 2021 11:08:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMKu-001rif-Uw; Fri, 16 Apr 2021 11:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=y0958y0ubXQKrzhjZE7acJV0clhm61oD9gw25WLQ+n4=; b=Qux/D/xzcC5hazjcc0JDD+3xxD
 /qw2K8CR+gKQLZW2fu+j1gf37/7qxXuBPy86JHlMr/L9/4O8zrmwJ1PrhGSeYiq56cNgUlT4JFBZG
 /WREQOktJcvBtkxtuPjQF851DKNtBHc3UPVqrGVPiE3lbSkISapRwqPs3zW26SRhVGg+XTPOlnsfJ
 xJ8F2J9rlDU86WpVMiqknnGCIwNZTeRzKG6IWTlxI1n+qMXa8xFcI7kD+w1Q+pUHRVQO1JKABvESg
 GPX5SlBCw11lRsq0tGuqpBKCnyDhWB0JGkDKhhoV9mnXYQR3Rye0CI7ToPQ2G4HW96SC7S8fd73DS
 mQAYSc/g==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMKr-009Iqr-3m; Fri, 16 Apr 2021 11:08:31 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FMD3F2534z9vBKy;
 Fri, 16 Apr 2021 13:08:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uWkPYTn7eSjH; Fri, 16 Apr 2021 13:08:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FMD3F1Bmrz9vBKv;
 Fri, 16 Apr 2021 13:08:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 476858B83A;
 Fri, 16 Apr 2021 13:08:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nrkV0nkn-42U; Fri, 16 Apr 2021 13:08:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0214D8B81A;
 Fri, 16 Apr 2021 13:08:24 +0200 (CEST)
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
Message-ID: <6ff4816b-8ff6-19de-73a2-3fcadc003ccd@csgroup.eu>
Date: Fri, 16 Apr 2021 13:08:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_040829_497191_E4B4CE9B 
X-CRM114-Status: GOOD (  21.86  )
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
MjEgMTg6MTgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4gSW4gb3JkZXIgdG8gc3VwcG9y
dCBsYXJnZSBwYWdlcyBvbiBwb3dlcnBjLCBub3RlcGFnZSgpCj4+Pj4gbmVlZHMgdG8ga25vdyB0
aGUgcGFnZSBzaXplIG9mIHRoZSBwYWdlLgo+Pj4+Cj4+Pj4gQWRkIGEgcGFnZV9zaXplIGFyZ3Vt
ZW50IHRvIG5vdGVwYWdlKCkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+Pj4gLS0tCj4+Pj4gwqAgYXJjaC9h
cm02NC9tbS9wdGR1bXAuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4+PiDCoCBhcmNoL3Jp
c2N2L21tL3B0ZHVtcC5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4+IMKgIGFyY2gvczM5
MC9tbS9kdW1wX3BhZ2V0YWJsZXMuYyB8wqAgMyArKy0KPj4+PiDCoCBhcmNoL3g4Ni9tbS9kdW1w
X3BhZ2V0YWJsZXMuY8KgIHzCoCAyICstCj4+Pj4gwqAgaW5jbHVkZS9saW51eC9wdGR1bXAuaMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4+PiDCoCBtbS9wdGR1bXAuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTYgKysrKysrKystLS0tLS0tLQo+Pj4+IMKgIDYg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+
IFsuLi5dCj4+Pj4gZGlmZiAtLWdpdCBhL21tL3B0ZHVtcC5jIGIvbW0vcHRkdW1wLmMKPj4+PiBp
bmRleCBkYTc1MTQ0OGQwZTQuLjYxY2QxNmFmYjFjOCAxMDA2NDQKPj4+PiAtLS0gYS9tbS9wdGR1
bXAuYwo+Pj4+ICsrKyBiL21tL3B0ZHVtcC5jCj4+Pj4gQEAgLTE3LDcgKzE3LDcgQEAgc3RhdGlj
IGlubGluZSBpbnQgbm90ZV9rYXNhbl9wYWdlX3RhYmxlKHN0cnVjdCBtbV93YWxrICp3YWxrLAo+
Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBwdGR1bXBfc3RhdGUgKnN0ID0gd2Fsay0+
cHJpdmF0ZTsKPj4+PiAtwqDCoMKgIHN0LT5ub3RlX3BhZ2Uoc3QsIGFkZHIsIDQsIHB0ZV92YWwo
a2FzYW5fZWFybHlfc2hhZG93X3B0ZVswXSkpOwo+Pj4+ICvCoMKgwqAgc3QtPm5vdGVfcGFnZShz
dCwgYWRkciwgNCwgcHRlX3ZhbChrYXNhbl9lYXJseV9zaGFkb3dfcHRlWzBdKSwgUEFHRV9TSVpF
KTsKPj4+Cj4+PiBJJ20gbm90IGNvbXBsZXRlbHkgc3VyZSB3aGF0IHRoZSBwYWdlX3NpemUgaXMg
Z29pbmcgdG8gYmUgdXNlZCBmb3IsIGJ1dCBub3RlIHRoYXQgS0FTQU4gcHJlc2VudHMgCj4+PiBh
biBpbnRlcmVzdGluZyBjYXNlIGhlcmUuIFdlIHNob3J0LWN1dCBieSBkZXRlY3RpbmcgaXQncyBh
IEtBU0FOIHJlZ2lvbiBhdCBhIGhpZ2ggbGV2ZWwgCj4+PiAoUEdEL1A0RC9QVUQvUE1EKSBhbmQg
aW5zdGVhZCBvZiB3YWxraW5nIHRoZSB0cmVlIGRvd24ganVzdCBjYWxsIG5vdGVfcGFnZSgpICpv
bmNlKiBidXQgd2l0aCAKPj4+IGxldmVsPT00IGJlY2F1c2Ugd2Uga25vdyBLQVNBTiBzZXRzIHVw
IHRoZSBwYWdlIHRhYmxlIGxpa2UgdGhhdC4KPj4+Cj4+PiBIb3dldmVyIHRoZSBvbmUgY2FsbCBh
Y3R1YWxseSBjb3ZlcnMgYSBtdWNoIGxhcmdlciByZWdpb24gLSBzbyB3aGlsZSBQQUdFX1NJWkUg
bWF0Y2hlcyB0aGUgbGV2ZWwgCj4+PiBpdCBkb2Vzbid0IG1hdGNoIHRoZSByZWdpb24gY292ZXJl
ZC4gQUZBSUNUIHRoaXMgd2lsbCBsZWFkIHRvIG9kZCByZXN1bHRzIGlmIHlvdSBlbmFibGUgS0FT
QU4gb24gCj4+PiBwb3dlcnBjLgo+Pgo+PiBIdW0gLi4uLiBJIHN1Y2Nlc3NmdWxseSB0ZXN0ZWQg
aXQgd2l0aCBLQVNBTiwgSSBub3cgcmVhbGlzZSB0aGF0IEkgdGVzdGVkIGl0IHdpdGggCj4+IENP
TkZJR19LQVNBTl9WTUFMTE9DIHNlbGVjdGVkLiBJbiB0aGlzIHNpdHVhdGlvbiwgc2luY2UgCj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvYWYzZDBhNjg2IHdlIGRv
bid0IGhhdmUgYW55IGNvbW1vbiBzaGFkb3cgcGFnZSB0YWJsZSAKPj4gYW55bW9yZS4KPj4KPj4g
SSdsbCB0ZXN0IGFnYWluIHdpdGhvdXQgQ09ORklHX0tBU0FOX1ZNQUxMT0MuCj4+Cj4+Pgo+Pj4g
VG8gYmUgaG9uZXN0IEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB3aHkgcG93ZXJwYyByZXF1aXJl
cyB0aGUgcGFnZV9zaXplIC0gaXQgYXBwZWFycyB0byBiZSB1c2luZyAKPj4+IGl0IHB1cmVseSB0
byBmaW5kICJob2xlcyIgaW4gdGhlIGNhbGxzIHRvIG5vdGVfcGFnZSgpLCBidXQgSSBoYXZlbid0
IHdvcmtlZCBvdXQgd2h5IHN1Y2ggaG9sZXMgCj4+PiB3b3VsZCBvY2N1ci4KPj4KPj4gSSB3YXMg
aW5kZWVkIGludHJvZHVjZWQgZm9yIEtBU0FOLiBXZSBoYXZlIGEgZmlyc3QgY29tbWl0IAo+PiBo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2NhYmU4MTM4IHdoaWNoIHVz
ZXMgcGFnZSBzaXplIHRvIGRldGVjdCB3aGV0aGVyIGl0IGlzIGEgCj4+IEtBU0FOIGxpa2Ugc3R1
ZmYuCj4+Cj4+IFRoZW4gY2FtZSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29t
bWl0L2IwMGZmNmQ4YyBhcyBhIGZpeC4gSSBjYW4ndCByZW1lbWJlciB3aGF0IHRoZSAKPj4gcHJv
YmxlbSB3YXMgZXhhY3RseSwgc29tZXRoaW5nIGFyb3VuZCB0aGUgdXNlIG9mIGh1Z2VwYWdlcyBm
b3Iga2VybmVsIG1lbW9yeSwgY2FtZSBhcyBwYXJ0IG9mIHRoZSAKPj4gc2VyaWVzIAo+PiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2NvdmVyL2NvdmVy
LjE1ODk4NjY5ODQuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8gCj4gCj4gCj4gQWgs
IHRoYXQncyB1c2VmdWwgY29udGV4dC4gU28gaXQgbG9va3MgbGlrZSBwb3dlcnBjIHRvb2sgYSBk
aWZmZXJlbnQgcm91dGUgdG8gcmVkdWNpbmcgdGhlIEtBU0FOIAo+IG91dHB1dCB0byB4ODYuCj4g
Cj4gR2l2ZW4gdGhlIGdlbmVyaWMgcHRkdW1wIGNvZGUgaGFzIGhhbmRsaW5nIGZvciBLQVNBTiBh
bHJlYWR5IGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBkcm9wIHRoYXQgZnJvbSAKPiB0aGUgcG93
ZXJwYyBhcmNoIGNvZGUsIHdoaWNoIEkgdGhpbmsgbWVhbnMgd2UgZG9uJ3QgYWN0dWFsbHkgbmVl
ZCB0byBwcm92aWRlIHBhZ2Ugc2l6ZSB0byAKPiBub3RlcGFnZSgpLiBIb3BlZnVsbHkgdGhhdCBt
ZWFucyBtb3JlIGNvZGUgdG8gZGVsZXRlIDspCj4gCgpZZXMgLi4uIGFuZCBuby4KCkl0IGxvb2tz
IGxpa2UgdGhlIGdlbmVyaWMgcHRkdW1wIGhhbmRsZXMgdGhlIGNhc2Ugd2hlbiBzZXZlcmFsIHBn
ZGlyIGVudHJpZXMgcG9pbnRzIHRvIHRoZSBzYW1lIAprYXNhbl9lYXJseV9zaGFkb3dfcHRlLiBC
dXQgaXQgZG9lc24ndCB0YWtlIGludG8gYWNjb3VudCB0aGUgcG93ZXJwYyBjYXNlIHdoZXJlIHdl
IGhhdmUgcmVndWxhciBwYWdlIAp0YWJsZXMgd2hlcmUgc2V2ZXJhbCAoaWYgbm90IGFsbCkgUFRF
cyBhcmUgcG9pbnRpbmcgdG8gdGhlIGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlIC4KCkNocmlzdG9w
aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
