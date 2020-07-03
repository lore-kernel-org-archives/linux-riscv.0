Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E4EC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 05:22:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD14206BE
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 05:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R1R7dH2s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD14206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nbNYOd2gfwrdaVO2eNhL9NCmgyhcSwIDG34VK8zaFmU=; b=R1R7dH2svNezZXnmaFedNgPOw
	TgcTiU26uL84TZqbztLnZCgaUaufMD3+KnowwVjcHyCp0j1onaEglwsgQKu1xDj9SJtoCY74zyvix
	VIuN78DkGDEYHhcxaSkQHuwkzCm1vjHCDznpX7Ag8QTsDoGfrzz4kukKGx426BCi4GiJxwJX/zG2i
	HlMuc+rsy8jF8uco/yquvFC0B5+nAiHHpsEoQNX9SBpVwS1e31rzeZghMJqYsRf007KFrYUW8sEGJ
	l5t/V9oB0loV+UJbXdoLSqf4uykAYZP02leXGrYVzSsOFaWrpJRJq7f6UUpunVFnAxgx2gVKt0J17
	U5JEielwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrE9q-0000pX-Qu; Fri, 03 Jul 2020 05:22:42 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrE9o-0000ov-Sr
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 05:22:42 +0000
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.11] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6C99860002;
 Fri,  3 Jul 2020 05:22:34 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 0/8] Introduce sv48 support
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-718df9bf-f140-4343-80a1-402f89c0c5ba@palmerdabbelt-glaptop1>
Message-ID: <3a3a95ad-dddc-6246-6ec9-bea61f0e1766@ghiti.fr>
Date: Fri, 3 Jul 2020 01:22:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <mhng-718df9bf-f140-4343-80a1-402f89c0c5ba@palmerdabbelt-glaptop1>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_012241_267316_5DD45069 
X-CRM114-Status: GOOD (  25.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: anup@brainfault.org, linux-kernel@vger.kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKTGUgNy8xLzIwIMOgIDI6MjcgUE0sIFBhbG1lciBEYWJiZWx0IGEgw6ljcml0
wqA6Cj4gT24gV2VkLCAwMyBKdW4gMjAyMCAwMToxMDo1NiBQRFQgKC0wNzAwKSwgYWxleEBnaGl0
aS5mciB3cm90ZToKPj4gVGhpcyBwYXRjaHNldCBpbXBsZW1lbnRzIHN2NDggc3VwcG9ydCBhdCBy
dW50aW1lLiBUaGUga2VybmVsIHdpbGwgdHJ5IHRvCj4+IGJvb3Qgd2l0aCA0LWxldmVsIHBhZ2Ug
dGFibGUgYW5kIHdpbGwgZmFsbGJhY2sgdG8gMy1sZXZlbCBpZiB0aGUgSFcgCj4+IGRvZXMgbm90
Cj4+IHN1cHBvcnQgaXQuCj4+Cj4+IFRoZSBiaWdnZXN0IGFkdmFudGFnZSBpcyB0aGF0IHdlIG9u
bHkgaGF2ZSBvbmUga2VybmVsIGZvciA2NGJpdCwgd2hpY2gKPj4gaXMgd2F5IGVhc2llciB0byBt
YWludGFpbi4KPj4KPj4gRm9sZGluZyB0aGUgNHRoIGxldmVsIGludG8gYSAzLWxldmVsIHBhZ2Ug
dGFibGUgaGFzIGFsbW9zdCBubyBjb3N0IGF0Cj4+IHJ1bnRpbWUuIEJ1dCBhcyBtZW50aW9uZWQg
UGFsbWVyLCB0aGUgcmVsb2NhdGFibGUgY29kZSBnZW5lcmF0ZWQgaXMgbGVzcwo+PiBwZXJmb3Jt
YW50Lgo+Pgo+PiBBdCB0aGUgbW9tZW50LCB0aGVyZSBpcyBubyB3YXkgdG8gYnVpbGQgYSAzLWxl
dmVsIHBhZ2UgdGFibGUgCj4+IG5vbi1yZWxvY2F0YWJsZQo+PiA2NGJpdCBrZXJuZWwuIFdlIGFn
cmVlZCB0aGF0IGRpc3RyaWJ1dGlvbnMgd2lsbCB1c2UgdGhpcyBydW50aW1lIAo+PiBjb25maWd1
cmF0aW9uCj4+IGFueXdheSwgYnV0IFBhbG1lciBwcm9wb3NlZCB0byBpbnRyb2R1Y2UgYSBuZXcg
S2NvbmZpZywgd2hpY2ggSSB3aWxsIAo+PiBkbyBsYXRlcgo+PiBhcyBzdjQ4IHN1cHBvcnQgd2Fz
IGFza2VkIGZvciA1LjguCj4gCj4gU29ycnkgSSB3YXNuJ3QgY2xlYXIgbGFzdCB0aW1lLCBidXQg
dGhpcyBzdGlsbCBoYXMgdGhlIHNhbWUgZnVuZGFtZW50YWwgCj4gaXNzdWU6Cj4gaXQgZm9yY2Vz
IDY0LWJpdCBrZXJuZWxzIHRvIGJlIHJlbG9jYXRhYmxlLCB3aGljaCBpbXBvc2VzIGEgcGVyZm9y
bWFuY2UKPiBwZW5hbHR5LsKgIFdlIGRvbid0IGhhdmUgYW55IGhhcmR3YXJlIHRoYXQgY2FuIGFj
dHVhbGx5IHRha2UgYWR2YW50YWdlIG9mIAo+IHN2NDgsCj4gc28gSSBkb24ndCB3YW50IHRvIHRh
a2UgYW55dGhpbmcgdGhhdCBwZW5hbGl6ZXMgd2hhdCBwZW9wbGUgYXJlIGFjdHVhbGx5IAo+IHVz
aW5nCj4gaW4gb3JkZXIgdG8gYWRkIGEgZmVhdHVyZSBwZW9wbGUgY2FuJ3QgdXNlLgo+IAo+IEkn
ZCBiZSBPSyB0YWtpbmcgdGhpcyBpZiBzdjQ4IHN1cHBvcnQgc2ltcGx5IGRlcGVuZGVkIG9uIGEg
cmVsb2NhdGFibGUgCj4ga2VybmVsLAo+IGFzIHRoZW4gdXNlcnMgd2hvIHdhbnQgdGhlIGZhc3Rl
ciBrZXJuZWwgY291bGQgc3RpbGwgYnVpbGQgb25lLsKgIEkgZG9uJ3QgCj4gd2FudAo+IHRvIHRh
a2Ugc29tZXRoaW5nIHRoYXQgZm9yY2VzIGFsbCA2NC1iaXQga2VybmVscyB0byBiZSByZWxvY2F0
YWJsZS4KCkluZGVlZCwgSSBoYWQgbm90IHVuZGVyc3Rvb2QgdGhhdCB0aGlzIHdhcyBhIHJlcXVp
cmVtZW50LiBJIHdpbGwgYWRkIGEgCnBhdGNoIG9uIHRvcCBvZiB0aGlzIG9uZSBpbnRyb2R1Y2lu
ZyBhIG5ldyBjb25maWcsIEkgaGF2ZSB0byB0aGluayBhYm91dCBpdC4KCkJ1dCBldmVuIGlmIEkg
dW5kZXJzdGFuZCB0aGF0IHRoZSBuZXcgbGV2ZWwgb2YgaW5kaXJlY3Rpb24gY29taW5nIHdpdGgg
ClBJRSB3aWxsIGJlIHNsb3dlciwgaXMgdGhpcyBuZXcgY29uZmlnIHdvcnRoIGl0ID8gQ2FuIHdl
IGJlbmNobWFyayAKc29tZWhvdyB0aGUgcGVyZm9ybWFuY2UgbG9zcyA/IElNSE8gSSB0aGluayB0
aGF0IHRoaXMgY29uZmlnIHdpbGwgZ2V0IApicm9rZW4gb3ZlciB0aW1lIGJ5IGxhY2sgb2YgdGVz
dGluZyBiZWNhdXNlIEkgYmVsaWV2ZSBkaXN0cmlidXRpb25zIHdpbGwgCmdvIGZvciBLQVNMUiBr
ZXJuZWwgd2hpY2ggcmVxdWlyZXMgdGhlIHJlbG9jYXRhYmlsaXR5IHByb3BlcnR5IGFueXdheS4K
CkFsZXgKCj4gCj4+IEZpbmFsbHksIHRoZSB1c2VyIGNhbiBub3cgYXNrIGZvciBzdjM5IGV4cGxp
Y2l0bHkgYnkgdXNpbmcgdGhlIAo+PiBkZXZpY2UtdHJlZQo+PiB3aGljaCB3aWxsIHJlZHVjZSBt
ZW1vcnkgZm9vdHByaW50IGFuZCByZWR1Y2UgdGhlIG51bWJlciBvZiBtZW1vcnkgCj4+IGFjY2Vz
c2VzCj4+IGluIGNhc2Ugb2YgVExCIG1pc3MuCj4+Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IMKgICog
TW92ZSB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgdG8gcGd0YWJsZS5oIGluIHBhdGNoIDUvNyBhcyBz
dWdnZXN0ZWQgCj4+IGJ5IEFudXAKPj4gwqAgKiBSZXN0b3JlIG1tdS10eXBlIHByb3BlcnRpZXMg
aW4gcGF0Y2ggNiBhcyBzdWdnZXN0ZWQgYnkgQW51cAo+PiDCoCAqIEZpeCB1bnVzZWQgdmFyaWFi
bGUgaW4gcGF0Y2ggNSB0aGF0IHdhcyB1c2VkIGluIHBhdGNoIDYKPj4gwqAgKiBGaXggU1BBUlNF
TUVNIGJ1aWxkIChwYXRjaCAyIHdhcyBtb2RpZmllZCBzbyBJIGRyb3BwZWQgdGhlIAo+PiBSZXZp
ZXdlZC1ieSkKPj4gwqAgKiBBcHBsaWVkIHZhcmlvdXMgUmV2aWV3ZWQtYnkKPj4KPj4gQWxleGFu
ZHJlIEdoaXRpICg4KToKPj4gwqAgcmlzY3Y6IEdldCByaWQgb2YgY29tcGlsZSB0aW1lIGxvZ2lj
IHdpdGggTUFYX0VBUkxZX01BUFBJTkdfU0laRQo+PiDCoCByaXNjdjogQWxsb3cgdG8gZHluYW1p
Y2FsbHkgZGVmaW5lIFZBX0JJVFMKPj4gwqAgcmlzY3Y6IFNpbXBsaWZ5IE1BWFBIWVNNRU0gY29u
ZmlnCj4+IMKgIHJpc2N2OiBQcmVwYXJlIHB0ZHVtcCBmb3Igdm0gbGF5b3V0IGR5bmFtaWMgYWRk
cmVzc2VzCj4+IMKgIHJpc2N2OiBJbXBsZW1lbnQgc3Y0OCBzdXBwb3J0Cj4+IMKgIHJpc2N2OiBB
bGxvdyB1c2VyIHRvIGRvd25ncmFkZSB0byBzdjM5IHdoZW4gaHcgc3VwcG9ydHMgc3Y0OAo+PiDC
oCByaXNjdjogVXNlIHBndGFibGVfbDRfZW5hYmxlZCB0byBvdXRwdXQgbW11IHR5cGUgaW4gY3B1
aW5mbwo+PiDCoCByaXNjdjogRXhwbGljaXQgY29tbWVudCBhYm91dCB1c2VyIHZpcnR1YWwgYWRk
cmVzcyBzcGFjZSBzaXplCj4+Cj4+IMKgYXJjaC9yaXNjdi9LY29uZmlnwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzQgKystLS0KPj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5owqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+PiDCoGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZml4bWFwLmjCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BhZ2UuaMKgwqDCoMKgwqDCoCB8wqAgMTUgKysrCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ2FsbG9jLmjCoMKgwqAgfMKgIDM2ICsrKysrKwo+PiDCoGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS02NC5oIHzCoCA5NyArKysrKysrKysrKysrLQo+PiDCoGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgIHzCoCAzMSArKysrLQo+PiDCoGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc3BhcnNlbWVtLmjCoCB8wqDCoCA2ICstCj4+IMKgYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIzICsrLS0KPj4gwqBhcmNoL3Jp
c2N2L2tlcm5lbC9oZWFkLlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0KPj4gwqBh
cmNoL3Jpc2N2L21tL2NvbnRleHQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICst
Cj4+IMKgYXJjaC9yaXNjdi9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxOTQgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+PiDCoGFyY2gvcmlzY3YvbW0vcHRk
dW1wLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNDkgKysrKystLQo+PiDCoDEzIGZp
bGVzIGNoYW5nZWQsIDQxMiBpbnNlcnRpb25zKCspLCA4MiBkZWxldGlvbnMoLSkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
