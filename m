Return-Path: <SRS0=xwO/=IL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB7BC433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 09:31:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 435BD64F1D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 09:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 435BD64F1D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zWVX0FA9DJ/zVx8sD8mFcyYXEj/5QfgnQwHV+ew0XzI=; b=XC6xikpenaGKYD+8ItX90q0El
	guA5Zkf9wDuQa++i4+bLUxPc4C30EQv5MgNcLpcpT0pGh4pfgPQxrdaQ/JJCgz6RRuPq4ZqY8EIf0
	cj6JiBZMClGewbm9DmrqK5IZ3jz6CtzABrJSkqkApyClKefgZ4N7SuP8vGbxxh2oKhigXoTzaq0dO
	+rKf70gCfZ2/uDx7YrLJZ0pDgHgG/+qWsPfd2ndtO1kwvb/hLMLKcFs5sx1Eh3hj2XtXA7hqfKTwx
	vo7e9J3R/QjEhSYnViXXe80ZpHU+2cvKBANyx3Ye75qNoSOxstQ1VIYl6p+NT6RG1lgOV2LFBtPr7
	O9FQTmS7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lL0bq-00D4eh-0v; Sat, 13 Mar 2021 09:30:58 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lL0Xq-00D4TQ-LC
 for linux-riscv@lists.infradead.org; Sat, 13 Mar 2021 09:27:11 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8C6861C0008;
 Sat, 13 Mar 2021 09:26:47 +0000 (UTC)
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
Message-ID: <0bb85388-c4e1-523a-9bf3-0ccec6c4041e@ghiti.fr>
Date: Sat, 13 Mar 2021 04:26:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <mhng-cf5d29ec-e941-4579-8c42-2c11799a8f2f@penguin>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_092710_286662_CA52BF5D 
X-CRM114-Status: GOOD (  21.21  )
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

SGkgUGFsbWVyLAoKTGUgMy85LzIxIMOgIDk6NTQgUE0sIFBhbG1lciBEYWJiZWx0IGEgw6ljcml0
wqA6Cj4gT24gVGh1LCAyNSBGZWIgMjAyMSAwMDowNDo1MCBQU1QgKC0wODAwKSwgYWxleEBnaGl0
aS5mciB3cm90ZToKPj4gSSBkZWNpZGVkIHRvIHNwbGl0IHN2NDggc3VwcG9ydCBpbiBzbWFsbCBz
ZXJpZXMgdG8gZWFzZSB0aGUgcmV2aWV3Lgo+Pgo+PiBUaGlzIHBhdGNoc2V0IHB1c2hlcyB0aGUg
a2VybmVsIG1hcHBpbmcgKG1vZHVsZXMgYW5kIEJQRiB0b28pIHRvIHRoZSBsYXN0Cj4+IDRHQiBv
ZiB0aGUgNjRiaXQgYWRkcmVzcyBzcGFjZSwgdGhpcyBhbGxvd3MgdG86Cj4+IC0gaW1wbGVtZW50
IHJlbG9jYXRhYmxlIGtlcm5lbCAodGhhdCB3aWxsIGNvbWUgbGF0ZXIgaW4gYW5vdGhlcgo+PiDC
oCBwYXRjaHNldCkgdGhhdCByZXF1aXJlcyB0byBtb3ZlIHRoZSBrZXJuZWwgbWFwcGluZyBvdXQg
b2YgdGhlIGxpbmVhcgo+PiDCoCBtYXBwaW5nIHRvIGF2b2lkIHRvIGNvcHkgdGhlIGtlcm5lbCBh
dCBhIGRpZmZlcmVudCBwaHlzaWNhbCBhZGRyZXNzLgo+PiAtIGhhdmUgYSBzaW5nbGUga2VybmVs
IHRoYXQgaXMgbm90IHJlbG9jYXRhYmxlIChhbmQgdGhlbiB0aGF0IGF2b2lkcyB0aGUKPj4gwqAg
cGVyZm9ybWFuY2UgcGVuYWx0eSBpbXBvc2VkIGJ5IFBJQyBrZXJuZWwpIGZvciBib3RoIHN2Mzkg
YW5kIHN2NDguCj4+Cj4+IFRoZSBmaXJzdCBwYXRjaCBpbXBsZW1lbnRzIHRoaXMgYmVoYXZpb3Vy
LCB0aGUgc2Vjb25kIHBhdGNoIGludHJvZHVjZXMgYQo+PiBkb2N1bWVudGF0aW9uIHRoYXQgZGVz
Y3JpYmVzIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgbGF5b3V0IG9mIHRoZSAKPj4gNjRiaXQK
Pj4ga2VybmVsIGFuZCB0aGUgbGFzdCBwYXRjaCBpcyB0YWtlbiBmcm9tIG15IHN2NDggc2VyaWVz
IHdoZXJlIEkgc2ltcGx5IAo+PiBhZGRlZAo+PiB0aGUgZHVtcCBvZiB0aGUgbW9kdWxlcy9rZXJu
ZWwvQlBGIG1hcHBpbmcuCj4+Cj4+IEkgcmVtb3ZlZCB0aGUgUmV2aWV3ZWQtYnkgb24gdGhlIGZp
cnN0IHBhdGNoIHNpbmNlIGl0IGNoYW5nZWQgZW5vdWdoIGZyb20KPj4gbGFzdCB0aW1lIGFuZCBk
ZXNlcnZlcyBhIHNlY29uZCBsb29rLgo+Pgo+PiBBbGV4YW5kcmUgR2hpdGkgKDMpOgo+PiDCoCBy
aXNjdjogTW92ZSBrZXJuZWwgbWFwcGluZyBvdXRzaWRlIG9mIGxpbmVhciBtYXBwaW5nCj4+IMKg
IERvY3VtZW50YXRpb246IHJpc2N2OiBBZGQgZG9jdW1lbnRhdGlvbiB0aGF0IGRlc2NyaWJlcyB0
aGUgVk0gbGF5b3V0Cj4+IMKgIHJpc2N2OiBQcmVwYXJlIHB0ZHVtcCBmb3Igdm0gbGF5b3V0IGR5
bmFtaWMgYWRkcmVzc2VzCj4+Cj4+IMKgRG9jdW1lbnRhdGlvbi9yaXNjdi9pbmRleC5yc3TCoMKg
wqDCoMKgwqAgfMKgIDEgKwo+PiDCoERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdMKg
wqAgfCA2MSArKysrKysrKysrKysrKysrKysrKysrCj4+IMKgYXJjaC9yaXNjdi9ib290L2xvYWRl
ci5sZHMuU8KgwqDCoMKgwqDCoMKgIHzCoCAzICstCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wYWdlLmjCoMKgwqDCoMKgwqAgfCAxOCArKysrKystCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmjCoMKgwqAgfCAzNyArKysrKysrKystLS0tCj4+IMKgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zZXRfbWVtb3J5LmggfMKgIDEgKwo+PiDCoGFyY2gvcmlzY3Yva2VybmVsL2hl
YWQuU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKy0KPj4gwqBhcmNoL3Jpc2N2L2tlcm5l
bC9tb2R1bGUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArLS0KPj4gwqBhcmNoL3Jpc2N2L2tl
cm5lbC9zZXR1cC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKysKPj4gwqBhcmNoL3Jpc2N2
L2tlcm5lbC92bWxpbnV4Lmxkcy5TwqDCoMKgwqAgfMKgIDMgKy0KPj4gwqBhcmNoL3Jpc2N2L21t
L2ZhdWx0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTMgKysrKysKPj4gwqBhcmNo
L3Jpc2N2L21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDgxICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tCj4+IMKgYXJjaC9yaXNjdi9tbS9rYXNhbl9pbml0LmPC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKysrKwo+PiDCoGFyY2gvcmlzY3YvbW0vcGh5c2FkZHIu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4gwqBhcmNoL3Jpc2N2L21tL3B0ZHVt
cC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2NyArKysrKysrKysrKysrKysrKysrLS0t
LS0KPj4gwqAxNSBmaWxlcyBjaGFuZ2VkLCAyNTggaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRpb25z
KC0pCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0
LnJzdAo+IAo+IFRoaXMgZ2VuZXJhbGx5IGxvb2tzIGdvb2QsIGJ1dCBJJ20gZ2V0dGluZyBhIGJ1
bmNoIG9mIGNoZWNrcGF0Y2ggCj4gd2FybmluZ3MgYW5kIHNvbWUgY29uZmxpY3RzLCBkbyB5b3Ug
bWluZCBmaXhpbmcgdGhvc2UgdXAgKGFuZCBpbmNsdWRpbmcgCj4geW91ciBvdGhlciBrYXNhbiBw
YXRjaCwgYXMgdGhhdCdzIGxpa2VseSB0byBjb25mbGljdCk/CgoKSSBmaXhlZCBhIGZldyBjaGVj
a3BhdGNoIHdhcm5pbmdzIGFuZCByZWJhc2VkIG9uIHRvcCBvZiBmb3ItbmV4dCBidXQgaGFkIApu
b3QgY29uZmxpY3RzLgoKSSBoYXZlIGp1c3Qgc2VudCB0aGUgdjIuCgpUaGFua3MsCgpBbGV4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
