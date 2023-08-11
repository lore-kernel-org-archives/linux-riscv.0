Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B25C04A6A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EY5kpJX99HE9Qikbt6Ll6sjG8FZjikzc1hV+4aH5TE=; b=RDpSrXr1ljWJi3
	FKMJfd2DYy4Js32RO+FIqM4ioEMfmOK7LWgED5QN0C1RR0+JuCg87NFomXL1sUoIhlmSQDXiqvFVe
	XQS1u+lYzR1hkwXNzuBN3xJsOUeuhDte2ZYf8vhsfWnEjr14w4UXlHAjFkwhEPKq1T8dZGHQ8PfGe
	0AHj2KUAC4PTls9847aAx8uIhpLMWle2Ghg2ZsVdQggCyEGjOE5FVvloHSscxR6k53615eyrx/KP9
	0j8a/0PH/hZLwvOU3EJHubcrOMZy6n4lLOlQQMaTDH4uQaZorZHkWEjORYzPZT+6rQKF6+8tu3Zze
	p+yVR8n8fbPAqi1MXhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOVT-009zVd-1u;
	Fri, 11 Aug 2023 09:32:31 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOVQ-009zTi-17
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 09:32:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C6EA1C0006;
	Fri, 11 Aug 2023 09:32:19 +0000 (UTC)
Message-ID: <c6bb8a63-2b61-1a24-c7ef-5bcf8dc9edcc@ghiti.fr>
Date: Fri, 11 Aug 2023 11:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: potential riscv special bug maybe found
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-riscv@lists.infradead.org
Cc: Bo YU <tsu.yubo@gmail.com>, Andreas Gruenbacher <agruenba@redhat.com>
References: <20230309151841.bomov6hq3ybyp42a@debian>
 <ZNOnCakhwIeue3yr@aurel32.net>
 <c16d0b21-6daf-997d-b9c1-0e25b5ddb534@ghiti.fr>
In-Reply-To: <c16d0b21-6daf-997d-b9c1-0e25b5ddb534@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_023228_542257_50B2689C 
X-CRM114-Status: GOOD (  22.20  )
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

SGkgQXVyw6lsaWVuLCBCbywKCk9uIDEwLzA4LzIwMjMgMTM6MDksIEFsZXhhbmRyZSBHaGl0aSB3
cm90ZToKPiBIaSBBdXLDqWxpZW4sIEJvLAo+Cj4KPiBPbiAwOS8wOC8yMDIzIDE2OjQ3LCBBdXJl
bGllbiBKYXJubyB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDIwMjMtMDMtMDkgMjM6MTgsIEJvIFlV
IHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gSSBhbSBzb3JyeSBpZiB0aGlzIGlzIG5vaXNlLgo+Pj4K
Pj4+IFNvbWUgZGF5cyBhZ28gSSBub3RpY2VkIHN0cmFjZSA2LjIgd2FzIGJ1aWx0IGZhaWxlZCBv
biByaXNjdjY0IGR1ZSB0bwo+Pj4gdGVzdCBjYXNlc1swXS4gVGhlcmUgaXMgb25lIHByb2dyYW0g
ZnJvbSBzdHJhY2UgY2FuIHJlcHJvZHVjZSBpdDoKPj4+Cj4+PiBgYGAKPj4+IC4vdGVzdHMvcmVh
ZC13cml0ZSBgYGAKPj4+Cj4+PiBJdCB3aWxsIGJlIGhhbmcuCj4+Pgo+Pj4gSW4gZmFjdCwgdGhl
IGlzc3VlIGhhcyBleGlzdGVkIHNpbmNlIDUuMTguIEkgYGdpdCBiaXNlY3RgIGFuZCBmaW5hbGx5
Cj4+PiBmb3VuZCBvdXQgdGhlIGlzc3VlIHdhcyBpbnRyb2R1Y2VkIGJ5IHRoZSBjb21taXRbMV06
Cj4+Pgo+Pj4gY29tbWl0IDYzMWY4NzFmMDcxNzQ2Nzg5ZTkyNDJlNTE0YWIwZjQ5MDY3ZmE5N2EK
Pj4+IEF1dGhvcjogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNvbT4KPj4+
IERhdGU6wqDCoCBUdWUgTm92IDkgMTI6NTY6MDYgMjAyMSArMDEwMAo+Pj4KPj4+IMKgwqDCoMKg
IGZzL2lvbWFwOiBGaXggYnVmZmVyZWQgd3JpdGUgcGFnZSBwcmVmYXVsdGluZwo+Pj4KPj4+IEkg
ZG8gbm90IHRoaW5rIHRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIHRoaXMgY29tbWl0LCBiZWNhdXNl
IGl0IGRvZXMgbm90Cj4+PiBhZmZlY3Qgb3RoZXJzIGFyY2ggZXhwZWN0IHJpc2N2IGFuZCBhZnRl
ciBJIHJldmVydGVkIGl0LCBpdCB3aWxsIHBhc3MKPj4+IGFsbCB0ZXN0IGNhc2VzIGZyb20gc3Ry
YWNlKFRoZXJlIGlzIHN0aWxsIG9uZSBjYXNlIGZhaWxlZCBvbiBxZW11LCBidXQKPj4+IHRoaXMg
aXMgYW5vdGhlciBzdG9yZSkuCj4+Pgo+Pj4gSSB0cnkgdG8gZGVidWcgc29tZXRoaW5nIGJ1dCBm
YWlsZWQuCj4+PiBXb3VsZCBiZSBhcHByZWNpYXRlZCBpdCBhbnkgaGVscC4KPj4gUGxlYXNlIGZp
bmQgYXR0YWNoZWQgYSBzaW1wbGVyIHJlcHJvZHVjZXIgZXh0cmFjdGVkIGZyb20gc3RyYWNlLCB3
aGljaAo+PiBzaG91bGQgbWFrZSB0aGUgaXNzdWUgZWFzaWVyIHRvIHJlcHJvZHVjZS4gSXQgaGFu
Z3Mgb24gcmlzY3Y2NCBhbmQgbmVlZHMKPj4gdG8gYmUga2lsbGVkIHdpdGggLTksIHdoaWxlIGl0
IHdvcmtzIGZpbmUgb24gYW1kNjQuCj4KPgo+IFRoYW5rcyBmb3IgdGhlIHJlcHJvZHVjZXIsIEkg
d2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtOiB0aGUgCj4ga2VybmVsIGlzIHN0dWNr
IHRyeWluZyB0byBjb3B5IGRhdGEgZnJvbSB1c2VyLCBJJ20gbG9va2luZyBpbnRvIGl0IAo+IHJp
Z2h0IG5vdyBhcyB0aGlzIHNlZW1zIHZlcnkgd2VpcmQuIE5vdGUgdGhhdCBJIHdpbGwgYmUgb24g
dmFjYXRpb24gYXQgCj4gdGhlIGVuZCBvZiB0aGUgd2VlaywgaWYgSSBkb24ndCBoYXZlIHRpbWUg
dG8gZml4IHRoaXMsIEknbGwgcG9zdCBteSAKPiBmaW5kaW5ncyBoZXJlLgo+CgpTbyBJIHdhcyBh
YmxlIHRvIGZpbmQgdGhlIHJvb3QgY2F1c2UgYW5kIEknbSBhYm91dCB0byBzZW5kIGEgZml4LCBi
dXQgaW4gCmEgbnVzdHNoZWxsLCBvdXIgY29weV9bZnJvbXx0b11fdXNlciBhbmQgY2xlYXJfdXNl
ciByb3V0aW5lcyBkbyBub3QgCnJldHVybiB0aGUgbnVtYmVyIG9mIGJ5dGVzIGVmZmVjdGl2ZWx5
IHdyaXR0ZW4gd2hlbiBhICJmaXh1cCBleGNlcHRpb24iIApoYXBwZW5zLCB3aGljaCBjYXVzZXMg
dGhlIGhhbmcgeW91IGJvdGggb2JzZXJ2ZWQuCgpUaGFuayB5b3UgdmVyeSBtdWNoIEF1csOpbGll
biBmb3IgdGhlIHJlcHJvZHVjZXIsIHRoYXQgcmVhbGx5IGhlbHBzIQoKQW5kIHRoYW5rcyBCbyBm
b3IgdGhlIGluaXRpYWwgcmVwb3J0IQoKQWxleAoKCj4KPiBUaGFua3MgYWdhaW4sCj4KPiBBbGV4
Cj4KPgo+PiBSZWdhcmRzCj4+IEF1cmVsaWVuCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
