Return-Path: <SRS0=59R2=IS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EACC433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Mar 2021 08:48:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A58361968
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Mar 2021 08:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A58361968
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tlvr5bY9jj7B4+JZwsRER+u6kJ0I4coBOM+WQYBcs78=; b=Z2W2i3a3V1OWB/vk0lXcesIln
	aHFT0qrr6KlJP0/WDbEtrWD4YaRPrdm69tdYmGoqN1iKQ8efK+BDem9soVo8uvI5Zpxls1QuECFDz
	PxquXk/tuExGKf9/zf2mTP9bE2mL4Bs0gAmsDMLsQHZQ46Q1CDitUn1Eku901mZdRN4LJA9IITb/2
	qGFTa5758rMXKUcsLoaFn2rIwtyFjJnG+ne+2fStyv3t9OodFm+A/WJ8wnSzXevLLVVqtklenkUnh
	WO6+4xRcP3d6fNejI1StoA8H3n0z/vEXPw09xNDc85Vb4W1JM+asVcRCyCidP0cliTYGGdLDwQ3jb
	qy8qlcYyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNXHX-008fa1-Hr; Sat, 20 Mar 2021 08:48:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNXHT-008fZG-2o
 for linux-riscv@lists.infradead.org; Sat, 20 Mar 2021 08:48:25 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 39AEC40003;
 Sat, 20 Mar 2021 08:48:14 +0000 (UTC)
Subject: Re: [PATCH 0/3] Move kernel mapping outside the linear mapping
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <mhng-cf5d29ec-e941-4579-8c42-2c11799a8f2f@penguin>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <fdc52c40-3324-fc9a-ffda-926ced856a80@ghiti.fr>
Date: Sat, 20 Mar 2021 04:48:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <mhng-cf5d29ec-e941-4579-8c42-2c11799a8f2f@penguin>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_084823_208254_71C28872 
X-CRM114-Status: GOOD (  21.32  )
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

TGUgMy85LzIxIMOgIDk6NTQgUE0sIFBhbG1lciBEYWJiZWx0IGEgw6ljcml0wqA6Cj4gT24gVGh1
LCAyNSBGZWIgMjAyMSAwMDowNDo1MCBQU1QgKC0wODAwKSwgYWxleEBnaGl0aS5mciB3cm90ZToK
Pj4gSSBkZWNpZGVkIHRvIHNwbGl0IHN2NDggc3VwcG9ydCBpbiBzbWFsbCBzZXJpZXMgdG8gZWFz
ZSB0aGUgcmV2aWV3Lgo+Pgo+PiBUaGlzIHBhdGNoc2V0IHB1c2hlcyB0aGUga2VybmVsIG1hcHBp
bmcgKG1vZHVsZXMgYW5kIEJQRiB0b28pIHRvIHRoZSBsYXN0Cj4+IDRHQiBvZiB0aGUgNjRiaXQg
YWRkcmVzcyBzcGFjZSwgdGhpcyBhbGxvd3MgdG86Cj4+IC0gaW1wbGVtZW50IHJlbG9jYXRhYmxl
IGtlcm5lbCAodGhhdCB3aWxsIGNvbWUgbGF0ZXIgaW4gYW5vdGhlcgo+PiDCoCBwYXRjaHNldCkg
dGhhdCByZXF1aXJlcyB0byBtb3ZlIHRoZSBrZXJuZWwgbWFwcGluZyBvdXQgb2YgdGhlIGxpbmVh
cgo+PiDCoCBtYXBwaW5nIHRvIGF2b2lkIHRvIGNvcHkgdGhlIGtlcm5lbCBhdCBhIGRpZmZlcmVu
dCBwaHlzaWNhbCBhZGRyZXNzLgo+PiAtIGhhdmUgYSBzaW5nbGUga2VybmVsIHRoYXQgaXMgbm90
IHJlbG9jYXRhYmxlIChhbmQgdGhlbiB0aGF0IGF2b2lkcyB0aGUKPj4gwqAgcGVyZm9ybWFuY2Ug
cGVuYWx0eSBpbXBvc2VkIGJ5IFBJQyBrZXJuZWwpIGZvciBib3RoIHN2MzkgYW5kIHN2NDguCj4+
Cj4+IFRoZSBmaXJzdCBwYXRjaCBpbXBsZW1lbnRzIHRoaXMgYmVoYXZpb3VyLCB0aGUgc2Vjb25k
IHBhdGNoIGludHJvZHVjZXMgYQo+PiBkb2N1bWVudGF0aW9uIHRoYXQgZGVzY3JpYmVzIHRoZSB2
aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgbGF5b3V0IG9mIHRoZSAKPj4gNjRiaXQKPj4ga2VybmVsIGFu
ZCB0aGUgbGFzdCBwYXRjaCBpcyB0YWtlbiBmcm9tIG15IHN2NDggc2VyaWVzIHdoZXJlIEkgc2lt
cGx5IAo+PiBhZGRlZAo+PiB0aGUgZHVtcCBvZiB0aGUgbW9kdWxlcy9rZXJuZWwvQlBGIG1hcHBp
bmcuCj4+Cj4+IEkgcmVtb3ZlZCB0aGUgUmV2aWV3ZWQtYnkgb24gdGhlIGZpcnN0IHBhdGNoIHNp
bmNlIGl0IGNoYW5nZWQgZW5vdWdoIGZyb20KPj4gbGFzdCB0aW1lIGFuZCBkZXNlcnZlcyBhIHNl
Y29uZCBsb29rLgo+Pgo+PiBBbGV4YW5kcmUgR2hpdGkgKDMpOgo+PiDCoCByaXNjdjogTW92ZSBr
ZXJuZWwgbWFwcGluZyBvdXRzaWRlIG9mIGxpbmVhciBtYXBwaW5nCj4+IMKgIERvY3VtZW50YXRp
b246IHJpc2N2OiBBZGQgZG9jdW1lbnRhdGlvbiB0aGF0IGRlc2NyaWJlcyB0aGUgVk0gbGF5b3V0
Cj4+IMKgIHJpc2N2OiBQcmVwYXJlIHB0ZHVtcCBmb3Igdm0gbGF5b3V0IGR5bmFtaWMgYWRkcmVz
c2VzCj4+Cj4+IMKgRG9jdW1lbnRhdGlvbi9yaXNjdi9pbmRleC5yc3TCoMKgwqDCoMKgwqAgfMKg
IDEgKwo+PiDCoERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdMKgwqAgfCA2MSArKysr
KysrKysrKysrKysrKysrKysrCj4+IMKgYXJjaC9yaXNjdi9ib290L2xvYWRlci5sZHMuU8KgwqDC
oMKgwqDCoMKgIHzCoCAzICstCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmjCoMKg
wqDCoMKgwqAgfCAxOCArKysrKystCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmjCoMKgwqAgfCAzNyArKysrKysrKystLS0tCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
ZXRfbWVtb3J5LmggfMKgIDEgKwo+PiDCoGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuU8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDMgKy0KPj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuY8Kg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArLS0KPj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKysKPj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC92bWxp
bnV4Lmxkcy5TwqDCoMKgwqAgfMKgIDMgKy0KPj4gwqBhcmNoL3Jpc2N2L21tL2ZhdWx0LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTMgKysrKysKPj4gwqBhcmNoL3Jpc2N2L21tL2lu
aXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDgxICsrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCj4+IMKgYXJjaC9yaXNjdi9tbS9rYXNhbl9pbml0LmPCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDkgKysrKwo+PiDCoGFyY2gvcmlzY3YvbW0vcGh5c2FkZHIuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4gwqBhcmNoL3Jpc2N2L21tL3B0ZHVtcC5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCA2NyArKysrKysrKysrKysrKysrKysrLS0tLS0KPj4gwqAxNSBm
aWxlcyBjaGFuZ2VkLCAyNTggaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRpb25zKC0pCj4+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdAo+IAo+IFRo
aXMgZ2VuZXJhbGx5IGxvb2tzIGdvb2QsIGJ1dCBJJ20gZ2V0dGluZyBhIGJ1bmNoIG9mIGNoZWNr
cGF0Y2ggCj4gd2FybmluZ3MgYW5kIHNvbWUgY29uZmxpY3RzLCBkbyB5b3UgbWluZCBmaXhpbmcg
dGhvc2UgdXAgKGFuZCBpbmNsdWRpbmcgCj4geW91ciBvdGhlciBrYXNhbiBwYXRjaCwgYXMgdGhh
dCdzIGxpa2VseSB0byBjb25mbGljdCk/CgpJIGhhdmUganVzdCB0cmllZCB0byByZWJhc2UgdGhp
cyBvbiBmb3ItbmV4dCwgYW5kIHRoYXQgcXVpdGUgY29uZmxpY3RzIAp3aXRoIFZpdGFseSdzIFhJ
UCBwYXRjaCwgSSdtIGZpeGluZyB0aGlzIGFuZCBwb3N0IGEgdjMuCgpBbGV4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
