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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE9DC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:54:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159D561166
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159D561166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IdK2NOo8oNHTJOkYowd+sJFn2O+hl8oWZUSzoFq/QGw=; b=lwz7dH7PJMshEpIim20sffmme
	khbFJwfEXLmbekvtyR6RMQEQXCou783nKD3Tg0MKuquCOUJIFBz6g+UVasBD6ZGrUacOFLJ0SSOwQ
	LpWk4BrvrhMw199dwEES3gmQI8lqaSJBVSXwgEB79/uEfp9q4als4P5xEoYuB0/NmBdg8TLqRymGR
	aPQGq2VelWK4e1JBEsM0kyOz87If2WmuvQjkFd1tbQ0uL58JQ0LsdkSsYBTk2CAh6SeLIRN8/Ck4t
	8l6zqgdoDMNoCYj5mNyq78RxeiUUIcUSdCamfWf6LKWnsjRVJBY7ULeR+EEi/eqz7mSLnUoEyEOos
	VWUK4yxbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXM74-001o5A-6P; Fri, 16 Apr 2021 10:54:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXM4M-001nKC-LJ; Fri, 16 Apr 2021 10:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0lxoeSgyk8/wN3n7dtazqbKraAfOBlVOxVvwPYiUy9Q=; b=twWgqpXmQTY+PdjKShdZF4sy8+
 iB+Hi3J6af/KhkjZ2e54cCBzvMUItoCvNaja86qv0Cm+ms/GQSYlC5wZcmCcHtnGNhHOuwRmW8oOo
 OsQUnqAIDFkl2qMuz5frlc0oNoPI7EeP4IGeZnzEkHg0xhpxz6KcJsN9/PIQNVoiK1Kr5+Gnj5Mf2
 J2F4XXDeRAU0jqDcI4lmDhSuzO8ftzGiXInpfa6+O25sbAbXdMCzZkoSd59CPT2tqKzN5BkrqtwM7
 ABBE9+/FWxnJ9e+BR98HWG2iJSHyitNb1bxs7ZvzvMQkWce4N26xTYsOVhlZoaE3fHvGCDvo7UOUp
 2g89/UXA==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lXM4I-009I2O-RY; Fri, 16 Apr 2021 10:51:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31375106F;
 Fri, 16 Apr 2021 03:51:21 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9123F85F;
 Fri, 16 Apr 2021 03:51:19 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
From: Steven Price <steven.price@arm.com>
Message-ID: <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
Date: Fri, 16 Apr 2021 11:51:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_035122_993446_100778DB 
X-CRM114-Status: GOOD (  25.02  )
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

T24gMTYvMDQvMjAyMSAxMTozOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAx
Ni8wNC8yMDIxIMOgIDExOjI4LCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPj4gT24gMTUvMDQv
MjAyMSAxODoxOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+IEluIG9yZGVyIHRvIHN1cHBv
cnQgbGFyZ2UgcGFnZXMgb24gcG93ZXJwYywgbm90ZXBhZ2UoKQo+Pj4gbmVlZHMgdG8ga25vdyB0
aGUgcGFnZSBzaXplIG9mIHRoZSBwYWdlLgo+Pj4KPj4+IEFkZCBhIHBhZ2Vfc2l6ZSBhcmd1bWVu
dCB0byBub3RlcGFnZSgpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9hcm02NC9t
bS9wdGR1bXAuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4+IMKgIGFyY2gvcmlzY3YvbW0v
cHRkdW1wLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+PiDCoCBhcmNoL3MzOTAvbW0vZHVt
cF9wYWdldGFibGVzLmMgfMKgIDMgKystCj4+PiDCoCBhcmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJs
ZXMuY8KgIHzCoCAyICstCj4+PiDCoCBpbmNsdWRlL2xpbnV4L3B0ZHVtcC5owqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQo+Pj4gwqAgbW0vcHRkdW1wLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDE2ICsrKysrKysrLS0tLS0tLS0KPj4+IMKgIDYgZmlsZXMgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4+Pgo+PiBbLi4uXQo+Pj4gZGlm
ZiAtLWdpdCBhL21tL3B0ZHVtcC5jIGIvbW0vcHRkdW1wLmMKPj4+IGluZGV4IGRhNzUxNDQ4ZDBl
NC4uNjFjZDE2YWZiMWM4IDEwMDY0NAo+Pj4gLS0tIGEvbW0vcHRkdW1wLmMKPj4+ICsrKyBiL21t
L3B0ZHVtcC5jCj4+PiBAQCAtMTcsNyArMTcsNyBAQCBzdGF0aWMgaW5saW5lIGludCBub3RlX2th
c2FuX3BhZ2VfdGFibGUoc3RydWN0IAo+Pj4gbW1fd2FsayAqd2FsaywKPj4+IMKgIHsKPj4+IMKg
wqDCoMKgwqAgc3RydWN0IHB0ZHVtcF9zdGF0ZSAqc3QgPSB3YWxrLT5wcml2YXRlOwo+Pj4gLcKg
wqDCoCBzdC0+bm90ZV9wYWdlKHN0LCBhZGRyLCA0LCBwdGVfdmFsKGthc2FuX2Vhcmx5X3NoYWRv
d19wdGVbMF0pKTsKPj4+ICvCoMKgwqAgc3QtPm5vdGVfcGFnZShzdCwgYWRkciwgNCwgcHRlX3Zh
bChrYXNhbl9lYXJseV9zaGFkb3dfcHRlWzBdKSwgCj4+PiBQQUdFX1NJWkUpOwo+Pgo+PiBJJ20g
bm90IGNvbXBsZXRlbHkgc3VyZSB3aGF0IHRoZSBwYWdlX3NpemUgaXMgZ29pbmcgdG8gYmUgdXNl
ZCBmb3IsIAo+PiBidXQgbm90ZSB0aGF0IEtBU0FOIHByZXNlbnRzIGFuIGludGVyZXN0aW5nIGNh
c2UgaGVyZS4gV2Ugc2hvcnQtY3V0IGJ5IAo+PiBkZXRlY3RpbmcgaXQncyBhIEtBU0FOIHJlZ2lv
biBhdCBhIGhpZ2ggbGV2ZWwgKFBHRC9QNEQvUFVEL1BNRCkgYW5kIAo+PiBpbnN0ZWFkIG9mIHdh
bGtpbmcgdGhlIHRyZWUgZG93biBqdXN0IGNhbGwgbm90ZV9wYWdlKCkgKm9uY2UqIGJ1dCB3aXRo
IAo+PiBsZXZlbD09NCBiZWNhdXNlIHdlIGtub3cgS0FTQU4gc2V0cyB1cCB0aGUgcGFnZSB0YWJs
ZSBsaWtlIHRoYXQuCj4+Cj4+IEhvd2V2ZXIgdGhlIG9uZSBjYWxsIGFjdHVhbGx5IGNvdmVycyBh
IG11Y2ggbGFyZ2VyIHJlZ2lvbiAtIHNvIHdoaWxlIAo+PiBQQUdFX1NJWkUgbWF0Y2hlcyB0aGUg
bGV2ZWwgaXQgZG9lc24ndCBtYXRjaCB0aGUgcmVnaW9uIGNvdmVyZWQuIAo+PiBBRkFJQ1QgdGhp
cyB3aWxsIGxlYWQgdG8gb2RkIHJlc3VsdHMgaWYgeW91IGVuYWJsZSBLQVNBTiBvbiBwb3dlcnBj
Lgo+IAo+IEh1bSAuLi4uIEkgc3VjY2Vzc2Z1bGx5IHRlc3RlZCBpdCB3aXRoIEtBU0FOLCBJIG5v
dyByZWFsaXNlIHRoYXQgSSAKPiB0ZXN0ZWQgaXQgd2l0aCBDT05GSUdfS0FTQU5fVk1BTExPQyBz
ZWxlY3RlZC4gSW4gdGhpcyBzaXR1YXRpb24sIHNpbmNlIAo+IGh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9jb21taXQvYWYzZDBhNjg2IHdlIGRvbid0IGhhdmUgYW55IAo+IGNvbW1v
biBzaGFkb3cgcGFnZSB0YWJsZSBhbnltb3JlLgo+IAo+IEknbGwgdGVzdCBhZ2FpbiB3aXRob3V0
IENPTkZJR19LQVNBTl9WTUFMTE9DLgo+IAo+Pgo+PiBUbyBiZSBob25lc3QgSSBkb24ndCBmdWxs
eSB1bmRlcnN0YW5kIHdoeSBwb3dlcnBjIHJlcXVpcmVzIHRoZSAKPj4gcGFnZV9zaXplIC0gaXQg
YXBwZWFycyB0byBiZSB1c2luZyBpdCBwdXJlbHkgdG8gZmluZCAiaG9sZXMiIGluIHRoZSAKPj4g
Y2FsbHMgdG8gbm90ZV9wYWdlKCksIGJ1dCBJIGhhdmVuJ3Qgd29ya2VkIG91dCB3aHkgc3VjaCBo
b2xlcyB3b3VsZCAKPj4gb2NjdXIuCj4gCj4gSSB3YXMgaW5kZWVkIGludHJvZHVjZWQgZm9yIEtB
U0FOLiBXZSBoYXZlIGEgZmlyc3QgY29tbWl0IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9jb21taXQvY2FiZTgxMzggd2hpY2ggdXNlcyBwYWdlIHNpemUgCj4gdG8gZGV0ZWN0
IHdoZXRoZXIgaXQgaXMgYSBLQVNBTiBsaWtlIHN0dWZmLgo+IAo+IFRoZW4gY2FtZSBodHRwczov
L2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2IwMGZmNmQ4YyBhcyBhIGZpeC4gSSAK
PiBjYW4ndCByZW1lbWJlciB3aGF0IHRoZSBwcm9ibGVtIHdhcyBleGFjdGx5LCBzb21ldGhpbmcg
YXJvdW5kIHRoZSB1c2Ugb2YgCj4gaHVnZXBhZ2VzIGZvciBrZXJuZWwgbWVtb3J5LCBjYW1lIGFz
IHBhcnQgb2YgdGhlIHNlcmllcyAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvbGludXhwcGMtZGV2L2NvdmVyL2NvdmVyLjE1ODk4NjY5ODQuZ2l0LmNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldS8gCgpBaCwgdGhhdCdzIHVzZWZ1bCBjb250ZXh0LiBTbyBpdCBsb29rcyBs
aWtlIHBvd2VycGMgdG9vayBhIGRpZmZlcmVudCAKcm91dGUgdG8gcmVkdWNpbmcgdGhlIEtBU0FO
IG91dHB1dCB0byB4ODYuCgpHaXZlbiB0aGUgZ2VuZXJpYyBwdGR1bXAgY29kZSBoYXMgaGFuZGxp
bmcgZm9yIEtBU0FOIGFscmVhZHkgaXQgc2hvdWxkIApiZSBwb3NzaWJsZSB0byBkcm9wIHRoYXQg
ZnJvbSB0aGUgcG93ZXJwYyBhcmNoIGNvZGUsIHdoaWNoIEkgdGhpbmsgbWVhbnMgCndlIGRvbid0
IGFjdHVhbGx5IG5lZWQgdG8gcHJvdmlkZSBwYWdlIHNpemUgdG8gbm90ZXBhZ2UoKS4gSG9wZWZ1
bGx5IAp0aGF0IG1lYW5zIG1vcmUgY29kZSB0byBkZWxldGUgOykKClN0ZXZlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
