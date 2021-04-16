Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E63FC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 05:26:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA7A061073
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 05:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA7A061073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bGdj91CmwSyD5yvi7OIiEEqmSw+ZNu+p+oCNaN8B0+g=; b=hh76qMaQQidB08yNHEy8IsG7V
	+Hv7VOke0EkoySfAxeyP4Xas+F/+i+Q6WlllL2cn91EzLHQYIBJhxkNreESK+tq2vnk7XF85Mp7mo
	Y2UzmXSeVtv0anEbuETGLeZshEahd40KdHXlc87iH83+wZ6LZ1GBHrSwKPuqBEkxWpEA2xktBTohm
	A8qYPElqXocveO+GOrOWPjuzFRfAMliqBedRsSfAzQLGhTcgML3AEFtBqFwItjKx0kTf7vihgDc7R
	PpKDSvfsHM/IXeJCo8Pgi2vwtalDpfGeuuDh0yGTp5/RVyvgHoOZoQvdyfi1f+3vUsKyCI9UvdjeX
	qj58mZe+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXGzi-000sJz-1K; Fri, 16 Apr 2021 05:26:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXGzG-000sHj-Ip; Fri, 16 Apr 2021 05:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=A6KPRQGRVA4xNZXcXEz8s6U1mU+el1jbxaGJ0CBwm08=; b=z25JLFpRncA8XysrbDdvohSZxh
 cJ8A8ai9F8ZCMZJf6P7x9zbPjUaDrcgoRTeA9apKP42qQD4OT/NHbwCwszT8Mpt8aZn/EXRzLdMYb
 5D/Y+JmxlbHQF1NF/JhmhmbMDtEWN3C/SWdFSg+gneuU1YLKOo31CE/llaayB+zuqy3SfuSi3OPTt
 kwipWF/Ex2RNuMDEt65gqCeMq9kW2nkpAIG0RLWwhkf0ZvM3gzJjN4m692x0qbiFtCnhpGqAUADFC
 b1vg/T34lBtTwXww5NCyrOMnTnEEOpoMTFDGT2093DDLhpyOEFQGTTqXLwAEaYSl232OjmTVYhTo7
 mmukPSTg==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXGzD-0095X6-I5; Fri, 16 Apr 2021 05:25:49 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FM4Rj5BTJzB09bL;
 Fri, 16 Apr 2021 07:25:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IiPlMveTf2d4; Fri, 16 Apr 2021 07:25:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FM4Rj3d6HzB09bK;
 Fri, 16 Apr 2021 07:25:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E55D8B81C;
 Fri, 16 Apr 2021 07:25:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2-smQfjtxhxm; Fri, 16 Apr 2021 07:25:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F75E8B81A;
 Fri, 16 Apr 2021 07:25:37 +0200 (CEST)
Subject: Re: [PATCH v1 4/5] mm: ptdump: Support hugepd table entries
To: Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <f41a177a0fd5a71db616e586a9ec5c51102c6656.1618506910.git.christophe.leroy@csgroup.eu>
 <87zgxzyvn3.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0e7b9312-888c-2e53-b7fd-a887fd9fb429@csgroup.eu>
Date: Fri, 16 Apr 2021 07:25:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <87zgxzyvn3.fsf@dja-thinkpad.axtens.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_222547_765496_99EB5899 
X-CRM114-Status: GOOD (  17.36  )
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

SGkgRGFuaWVsLAoKTGUgMTYvMDQvMjAyMSDDoCAwMToyOSwgRGFuaWVsIEF4dGVucyBhIMOpY3Jp
dMKgOgo+IEhpIENocmlzdG9waGUsCj4gCj4+IFdoaWNoIGh1Z2VwZCwgcGFnZSB0YWJsZSBlbnRy
aWVzIGNhbiBiZSBhdCBhbnkgbGV2ZWwKPj4gYW5kIGNhbiBiZSBvZiBhbnkgc2l6ZS4KPj4KPj4g
QWRkIHN1cHBvcnQgZm9yIHRoZW0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPj4gLS0tCj4+ICAgbW0vcHRkdW1wLmMg
fCAxNyArKysrKysrKysrKysrKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vcHRkdW1wLmMgYi9tbS9w
dGR1bXAuYwo+PiBpbmRleCA2MWNkMTZhZmIxYzguLjZlZmRiOGMxNWE3ZCAxMDA2NDQKPj4gLS0t
IGEvbW0vcHRkdW1wLmMKPj4gKysrIGIvbW0vcHRkdW1wLmMKPj4gQEAgLTExMiwxMSArMTEyLDI0
IEBAIHN0YXRpYyBpbnQgcHRkdW1wX3B0ZV9lbnRyeShwdGVfdCAqcHRlLCB1bnNpZ25lZCBsb25n
IGFkZHIsCj4+ICAgewo+PiAgIAlzdHJ1Y3QgcHRkdW1wX3N0YXRlICpzdCA9IHdhbGstPnByaXZh
dGU7Cj4+ICAgCXB0ZV90IHZhbCA9IHB0ZXBfZ2V0KHB0ZSk7Cj4+ICsJdW5zaWduZWQgbG9uZyBw
YWdlX3NpemUgPSBuZXh0IC0gYWRkcjsKPj4gKwlpbnQgbGV2ZWw7Cj4+ICsKPj4gKwlpZiAocGFn
ZV9zaXplID49IFBHRElSX1NJWkUpCj4+ICsJCWxldmVsID0gMDsKPj4gKwllbHNlIGlmIChwYWdl
X3NpemUgPj0gUDREX1NJWkUpCj4+ICsJCWxldmVsID0gMTsKPj4gKwllbHNlIGlmIChwYWdlX3Np
emUgPj0gUFVEX1NJWkUpCj4+ICsJCWxldmVsID0gMjsKPj4gKwllbHNlIGlmIChwYWdlX3NpemUg
Pj0gUE1EX1NJWkUpCj4+ICsJCWxldmVsID0gMzsKPj4gKwllbHNlCj4+ICsJCWxldmVsID0gNDsK
Pj4gICAKPj4gICAJaWYgKHN0LT5lZmZlY3RpdmVfcHJvdCkKPj4gLQkJc3QtPmVmZmVjdGl2ZV9w
cm90KHN0LCA0LCBwdGVfdmFsKHZhbCkpOwo+PiArCQlzdC0+ZWZmZWN0aXZlX3Byb3Qoc3QsIGxl
dmVsLCBwdGVfdmFsKHZhbCkpOwo+PiAgIAo+PiAtCXN0LT5ub3RlX3BhZ2Uoc3QsIGFkZHIsIDQs
IHB0ZV92YWwodmFsKSwgUEFHRV9TSVpFKTsKPj4gKwlzdC0+bm90ZV9wYWdlKHN0LCBhZGRyLCBs
ZXZlbCwgcHRlX3ZhbCh2YWwpLCBwYWdlX3NpemUpOwo+IAo+IEl0IHNlZW1zIHRvIG1lIHRoYXQg
cGFzc2luZyBib3RoIGxldmVsIGFuZCBwYWdlX3NpemUgaXMgYSBiaXQgcmVkdW5kYW50LAo+IGJ1
dCBJIGd1ZXNzIGl0IGRvZXMgcmVkdWNlIHRoZSBpbXBhY3Qgb24gZWFjaCBhcmNoJ3MgY29kZT8K
CkV4YWN0bHksIGFzIHNob3duIGFib3ZlLCB0aGUgbGV2ZWwgY2FuIGJlIHJlLWNhbGN1bGF0ZWQg
YmFzZWQgb24gdGhlIHBhZ2Ugc2l6ZSwgYnV0IGl0IHdvdWxkIGJlIGEgCnVubmVjZXNzYXJ5IGlt
cGFjdCBvbiBhbGwgYXJjaGl0ZWN0dXJlcyBhbmQgd291bGQgZHVwbGljYXRlIHRoZSByZS1jYWxj
dWxhdGlvbiBvZiB0aGUgbGV2ZWwgd2hlcmVhcyAKaW4gbW9zdCBjYXNlcyB3ZSBnZXQgaXQgZm9y
IGZyZWUgZnJvbSB0aGUgY2FsbGVyLgoKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gRGFuaWVsCj4gCj4+
ICAgCj4+ICAgCXJldHVybiAwOwo+PiAgIH0KPj4gLS0gCj4+IDIuMjUuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
