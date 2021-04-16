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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79877C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 13:01:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF56A61107
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 13:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF56A61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C9AMtrFmLgvBJYXqESeu1XQ3Mto2DJEFm2erdyWrTUc=; b=bFwMMBC5bI9JFE8Fe9JZakyBN
	iiOFcmrsWZJh191bTWG/O3kYDontS+K5upvFUwxpMaMGkfr++abWeQmSc1rstpnu4U2WBDx3xWC4+
	61/D72e2zFdBLMiAEpNKZ4auS9hLUGITn75fQaPIQFaD2U6Po4lbIxxMxH58+LL5AA3lON3jKKQkg
	gw35Ns3cKU75qqstUqDHMThFgHozHiSMtpICEOZ00kvK3ZKkz9XONVBCVUbzftnRhY6HUlYxZUiK+
	QsxOuS0Z/SOWV4ivB11i038RnQBrXlwXx11JvWVj8R2za4+DuONenVW3Ip2UIC8ZHWktabnbCfqTi
	JwygZqlKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXO5j-0029Sa-FM; Fri, 16 Apr 2021 13:00:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXO5T-0029Po-EP; Fri, 16 Apr 2021 13:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jfZsi8V+Y8kzx8B7ZD328Q+jSmGm3e81PFHNG5vxjZo=; b=HviPWTkiSOVmcLkF8Vl/yocYn/
 uHvvFTv8alhAUwcIWMwCFRxDGGGk5MgKHwo8nsqEDNkXmm3Yr4smgBVwOPzu9YxkU383eWuG9S/zQ
 GkYU8juusXDTq01nJABmK81QmQy7MpJ2cp7S80/OlxsmrpaIk7QrGLPgnwhlkGkH0yom162iN0XPB
 +XUsFtO5vdhSboq2K5CKPzTcYUVlbHv1RPJm4ApF1Rz77VfjpqJVPqa87lt4/84w6hQvJqisukyb5
 qpAuMBxWdFYmYO4VSlBoezt8XSDj5PYty2e7aQtikQQf3iDxh0K9DiHOyiX2c0dVbF8ok6NMtMM9j
 G9evJcng==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lXO5O-009NTB-0e; Fri, 16 Apr 2021 13:00:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7604111B3;
 Fri, 16 Apr 2021 06:00:35 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E1B33F85F;
 Fri, 16 Apr 2021 06:00:33 -0700 (PDT)
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
 <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
 <6ff4816b-8ff6-19de-73a2-3fcadc003ccd@csgroup.eu>
From: Steven Price <steven.price@arm.com>
Message-ID: <e39d500a-2154-3c5d-9393-8bf53a567fad@arm.com>
Date: Fri, 16 Apr 2021 14:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6ff4816b-8ff6-19de-73a2-3fcadc003ccd@csgroup.eu>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_060038_161212_C94F4F6A 
X-CRM114-Status: GOOD (  25.37  )
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

T24gMTYvMDQvMjAyMSAxMjowOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAx
Ni8wNC8yMDIxIMOgIDEyOjUxLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPj4gT24gMTYvMDQv
MjAyMSAxMTozOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Cj4+Pgo+Pj4gTGUgMTYvMDQv
MjAyMSDDoCAxMToyOCwgU3RldmVuIFByaWNlIGEgw6ljcml0wqA6Cj4+Pj4gT24gMTUvMDQvMjAy
MSAxODoxOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Pj4gSW4gb3JkZXIgdG8gc3VwcG9y
dCBsYXJnZSBwYWdlcyBvbiBwb3dlcnBjLCBub3RlcGFnZSgpCj4+Pj4+IG5lZWRzIHRvIGtub3cg
dGhlIHBhZ2Ugc2l6ZSBvZiB0aGUgcGFnZS4KPj4+Pj4KPj4+Pj4gQWRkIGEgcGFnZV9zaXplIGFy
Z3VtZW50IHRvIG5vdGVwYWdlKCkuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPj4+Pj4gLS0tCj4+Pj4+IMKg
IGFyY2gvYXJtNjQvbW0vcHRkdW1wLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+Pj4+IMKg
IGFyY2gvcmlzY3YvbW0vcHRkdW1wLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+Pj4+IMKg
IGFyY2gvczM5MC9tbS9kdW1wX3BhZ2V0YWJsZXMuYyB8wqAgMyArKy0KPj4+Pj4gwqAgYXJjaC94
ODYvbW0vZHVtcF9wYWdldGFibGVzLmPCoCB8wqAgMiArLQo+Pj4+PiDCoCBpbmNsdWRlL2xpbnV4
L3B0ZHVtcC5owqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4+PiDCoCBtbS9wdGR1bXAuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTYgKysrKysrKystLS0tLS0t
LQo+Pj4+PiDCoCA2IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQo+Pj4+Pgo+Pj4+IFsuLi5dCj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9wdGR1bXAuYyBiL21t
L3B0ZHVtcC5jCj4+Pj4+IGluZGV4IGRhNzUxNDQ4ZDBlNC4uNjFjZDE2YWZiMWM4IDEwMDY0NAo+
Pj4+PiAtLS0gYS9tbS9wdGR1bXAuYwo+Pj4+PiArKysgYi9tbS9wdGR1bXAuYwo+Pj4+PiBAQCAt
MTcsNyArMTcsNyBAQCBzdGF0aWMgaW5saW5lIGludCBub3RlX2thc2FuX3BhZ2VfdGFibGUoc3Ry
dWN0IAo+Pj4+PiBtbV93YWxrICp3YWxrLAo+Pj4+PiDCoCB7Cj4+Pj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IHB0ZHVtcF9zdGF0ZSAqc3QgPSB3YWxrLT5wcml2YXRlOwo+Pj4+PiAtwqDCoMKgIHN0LT5u
b3RlX3BhZ2Uoc3QsIGFkZHIsIDQsIHB0ZV92YWwoa2FzYW5fZWFybHlfc2hhZG93X3B0ZVswXSkp
Owo+Pj4+PiArwqDCoMKgIHN0LT5ub3RlX3BhZ2Uoc3QsIGFkZHIsIDQsIHB0ZV92YWwoa2FzYW5f
ZWFybHlfc2hhZG93X3B0ZVswXSksIAo+Pj4+PiBQQUdFX1NJWkUpOwo+Pj4+Cj4+Pj4gSSdtIG5v
dCBjb21wbGV0ZWx5IHN1cmUgd2hhdCB0aGUgcGFnZV9zaXplIGlzIGdvaW5nIHRvIGJlIHVzZWQg
Zm9yLCAKPj4+PiBidXQgbm90ZSB0aGF0IEtBU0FOIHByZXNlbnRzIGFuIGludGVyZXN0aW5nIGNh
c2UgaGVyZS4gV2Ugc2hvcnQtY3V0IAo+Pj4+IGJ5IGRldGVjdGluZyBpdCdzIGEgS0FTQU4gcmVn
aW9uIGF0IGEgaGlnaCBsZXZlbCAoUEdEL1A0RC9QVUQvUE1EKSAKPj4+PiBhbmQgaW5zdGVhZCBv
ZiB3YWxraW5nIHRoZSB0cmVlIGRvd24ganVzdCBjYWxsIG5vdGVfcGFnZSgpICpvbmNlKiAKPj4+
PiBidXQgd2l0aCBsZXZlbD09NCBiZWNhdXNlIHdlIGtub3cgS0FTQU4gc2V0cyB1cCB0aGUgcGFn
ZSB0YWJsZSBsaWtlIAo+Pj4+IHRoYXQuCj4+Pj4KPj4+PiBIb3dldmVyIHRoZSBvbmUgY2FsbCBh
Y3R1YWxseSBjb3ZlcnMgYSBtdWNoIGxhcmdlciByZWdpb24gLSBzbyB3aGlsZSAKPj4+PiBQQUdF
X1NJWkUgbWF0Y2hlcyB0aGUgbGV2ZWwgaXQgZG9lc24ndCBtYXRjaCB0aGUgcmVnaW9uIGNvdmVy
ZWQuIAo+Pj4+IEFGQUlDVCB0aGlzIHdpbGwgbGVhZCB0byBvZGQgcmVzdWx0cyBpZiB5b3UgZW5h
YmxlIEtBU0FOIG9uIHBvd2VycGMuCj4+Pgo+Pj4gSHVtIC4uLi4gSSBzdWNjZXNzZnVsbHkgdGVz
dGVkIGl0IHdpdGggS0FTQU4sIEkgbm93IHJlYWxpc2UgdGhhdCBJIAo+Pj4gdGVzdGVkIGl0IHdp
dGggQ09ORklHX0tBU0FOX1ZNQUxMT0Mgc2VsZWN0ZWQuIEluIHRoaXMgc2l0dWF0aW9uLCAKPj4+
IHNpbmNlIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvYWYzZDBhNjg2
IHdlIGRvbid0IAo+Pj4gaGF2ZSBhbnkgY29tbW9uIHNoYWRvdyBwYWdlIHRhYmxlIGFueW1vcmUu
Cj4+Pgo+Pj4gSSdsbCB0ZXN0IGFnYWluIHdpdGhvdXQgQ09ORklHX0tBU0FOX1ZNQUxMT0MuCj4+
Pgo+Pj4+Cj4+Pj4gVG8gYmUgaG9uZXN0IEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB3aHkgcG93
ZXJwYyByZXF1aXJlcyB0aGUgCj4+Pj4gcGFnZV9zaXplIC0gaXQgYXBwZWFycyB0byBiZSB1c2lu
ZyBpdCBwdXJlbHkgdG8gZmluZCAiaG9sZXMiIGluIHRoZSAKPj4+PiBjYWxscyB0byBub3RlX3Bh
Z2UoKSwgYnV0IEkgaGF2ZW4ndCB3b3JrZWQgb3V0IHdoeSBzdWNoIGhvbGVzIHdvdWxkIAo+Pj4+
IG9jY3VyLgo+Pj4KPj4+IEkgd2FzIGluZGVlZCBpbnRyb2R1Y2VkIGZvciBLQVNBTi4gV2UgaGF2
ZSBhIGZpcnN0IGNvbW1pdCAKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9j
b21taXQvY2FiZTgxMzggd2hpY2ggdXNlcyBwYWdlIAo+Pj4gc2l6ZSB0byBkZXRlY3Qgd2hldGhl
ciBpdCBpcyBhIEtBU0FOIGxpa2Ugc3R1ZmYuCj4+Pgo+Pj4gVGhlbiBjYW1lIGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvYjAwZmY2ZDhjIGFzIGEgCj4+PiBmaXguIEkg
Y2FuJ3QgcmVtZW1iZXIgd2hhdCB0aGUgcHJvYmxlbSB3YXMgZXhhY3RseSwgc29tZXRoaW5nIGFy
b3VuZCAKPj4+IHRoZSB1c2Ugb2YgaHVnZXBhZ2VzIGZvciBrZXJuZWwgbWVtb3J5LCBjYW1lIGFz
IHBhcnQgb2YgdGhlIHNlcmllcyAKPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9saW51eHBwYy1kZXYvY292ZXIvY292ZXIuMTU4OTg2Njk4NC5naXQuY2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1LyAKPj4KPj4KPj4KPj4gQWgsIHRoYXQncyB1c2VmdWwgY29udGV4dC4g
U28gaXQgbG9va3MgbGlrZSBwb3dlcnBjIHRvb2sgYSBkaWZmZXJlbnQgCj4+IHJvdXRlIHRvIHJl
ZHVjaW5nIHRoZSBLQVNBTiBvdXRwdXQgdG8geDg2Lgo+Pgo+PiBHaXZlbiB0aGUgZ2VuZXJpYyBw
dGR1bXAgY29kZSBoYXMgaGFuZGxpbmcgZm9yIEtBU0FOIGFscmVhZHkgaXQgc2hvdWxkIAo+PiBi
ZSBwb3NzaWJsZSB0byBkcm9wIHRoYXQgZnJvbSB0aGUgcG93ZXJwYyBhcmNoIGNvZGUsIHdoaWNo
IEkgdGhpbmsgCj4+IG1lYW5zIHdlIGRvbid0IGFjdHVhbGx5IG5lZWQgdG8gcHJvdmlkZSBwYWdl
IHNpemUgdG8gbm90ZXBhZ2UoKS4gCj4+IEhvcGVmdWxseSB0aGF0IG1lYW5zIG1vcmUgY29kZSB0
byBkZWxldGUgOykKPj4KPiAKPiBZZXMgLi4uIGFuZCBuby4KPiAKPiBJdCBsb29rcyBsaWtlIHRo
ZSBnZW5lcmljIHB0ZHVtcCBoYW5kbGVzIHRoZSBjYXNlIHdoZW4gc2V2ZXJhbCBwZ2RpciAKPiBl
bnRyaWVzIHBvaW50cyB0byB0aGUgc2FtZSBrYXNhbl9lYXJseV9zaGFkb3dfcHRlLiBCdXQgaXQg
ZG9lc24ndCB0YWtlIAo+IGludG8gYWNjb3VudCB0aGUgcG93ZXJwYyBjYXNlIHdoZXJlIHdlIGhh
dmUgcmVndWxhciBwYWdlIHRhYmxlcyB3aGVyZSAKPiBzZXZlcmFsIChpZiBub3QgYWxsKSBQVEVz
IGFyZSBwb2ludGluZyB0byB0aGUga2FzYW5fZWFybHlfc2hhZG93X3BhZ2UgLgoKSSdtIG5vdCBz
dXJlIEkgZm9sbG93IHF1aXRlIGhvdyBwb3dlcnBjIGlzIGRpZmZlcmVudCBoZXJlLiBCdXQgY291
bGQgeW91IApoYXZlIGEgc2ltaWxhciBjaGVjayBmb3IgUFRFcyBhZ2FpbnN0IGthc2FuX2Vhcmx5
X3NoYWRvd19wdGUgYXMgdGhlIApvdGhlciBsZXZlbHMgYWxyZWFkeSBoYXZlPwoKSSdtIGp1c3Qg
d29ycmllZCB0aGF0IHBhZ2Vfc2l6ZSBpc24ndCB3ZWxsIGRlZmluZWQgaW4gdGhpcyBpbnRlcmZh
Y2UgYW5kIAppdCdzIGdvaW5nIHRvIGNhdXNlIHByb2JsZW1zIGluIHRoZSBmdXR1cmUuCgpTdGV2
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
