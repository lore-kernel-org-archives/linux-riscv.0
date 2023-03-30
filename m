Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89EEC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 04:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaVelaWpQCBx+FPxk8GB7nNRK4K3WC++iaUsJvTJal4=; b=OnTe0BMSyAfAFn
	fbkJiPhJLJFHKt18/neeLK9iMWbFH/9nd3gu6GuRTELFf0yUNL7+5YMbiWN//OGyzaYdPW2gxZfU5
	1p8qAM796FPVctBl+isne8JpP+7yIJw9djrw4Cc/5E+YkOSNXEqQ3qmPfIRz+ouAMfeLYR22/hxBR
	ooo4t6N2yK6LHWS5Ibm3LhoP01b8ks7Q25mda4BzOipYgHxEGGqyuYuMSZv4lzgEPKFLlvXE68+ZW
	/iSontLh392NyDupG6HI3bVNcn+GR4H2giD7jfjiuRdXVljqwxmUl7DQlUCiAd3TvReGNfBGy+/fv
	1nhhFn4wdayrK8+gn+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjUG-002Tu9-2Q;
	Thu, 30 Mar 2023 04:02:08 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjUB-002Tsd-2t
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 04:02:06 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 35151100005;
	Thu, 30 Mar 2023 04:01:51 +0000 (UTC)
Message-ID: <6931ad6c-8183-33ef-5127-815cd5d84f17@ghiti.fr>
Date: Thu, 30 Mar 2023 06:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 0/1] riscv: Allow to downgrade paging mode from the
 command line
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, alexghiti@rivosinc.com
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, bjorn@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <mhng-4507ad68-27bd-4d29-bb72-8d8f5bc27e34@palmer-ri-x1c9a>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-4507ad68-27bd-4d29-bb72-8d8f5bc27e34@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_210204_200014_CBA94D96 
X-CRM114-Status: GOOD (  24.41  )
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

T24gMy8yOS8yMyAxOTo1OSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVHVlLCAyOCBGZWIg
MjAyMyAwNzo0NjoyOCBQU1QgKC0wODAwKSwgYWxleGdoaXRpQHJpdm9zaW5jLmNvbSB3cm90ZToK
Pj4gVGhpcyBuZXcgdmVyc2lvbiBnZXRzIHJpZCBvZiB0aGUgbGltaXRhdGlvbiB0aGF0IHByZXZl
bnRlZCBLQVNBTiBrZXJuZWxzCj4+IHRvIHVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBwYXJhbWV0
ZXJzLgo+Pgo+PiBXaGlsZSBsb29raW5nIGludG8gS0FTTFIsIEkgZmVsbCBvbnRvIGNvbW1pdCBh
YWNkMTQ5YjYyMzggKCJhcm02NDogaGVhZDoKPj4gYXZvaWQgcmVsb2NhdGluZyB0aGUga2VybmVs
IHR3aWNlIGZvciBLQVNMUiIpOiBpdCBhbGxvd3MgdG8gdXNlIHRoZSBmZHQKPj4gZnVuY3Rpb25z
IHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcyB3aXRoIEtBU0FOIGVuYWJsZWQgYnkgc2lt
cGx5Cj4+IGNvbXBpbGluZyBhIG5ldyB2ZXJzaW9uIG9mIHRob3NlIGZ1bmN0aW9ucyB3aXRob3V0
IGluc3RydW1lbnRhdGlvbi4KPj4KPj4gSSBoYWQgdG8gY2hhbmdlIHRoZSBoYW5kbGluZyBvZiB0
aGUgY29tbWFuZCBsaW5lIHBhcnNpbmcgdG8gbWFrZSB0aGUKPj4gY29kZSBzZWxmLWNvbnRhaW5l
ZCBpbiBrZXJuZWwvcGkvY21kX2Vhcmx5LmMgdG8gYXZvaWQgY2FsbGluZyB0b28gbWFueQo+PiBf
X3BpIHByZWZpeGVkIGZ1bmN0aW9ucyBmcm9tIG91dHNpZGUgdGhpcyBmaWxlLgo+Pgo+PiBJJ2xs
IHVzZSB0aGlzIGFwcHJvYWNoIGxpa2UgYXJtNjQgdG8gaGFuZGxlIHRoZSBleHRyYWN0aW9uIG9m
IHRoZSByYW5kb20KPj4gc2VlZGkgZnJvbSB0aGUgZGV2aWNlIHRyZWUgZm9yIEtBU0xSLgo+Pgo+
PiBiYXNlLWNvbW1pdDogZWI5YmU4MzEwYzU4ICgiUklTQy1WOiBhZGQgYSBzcGluX3NoYWRvd19z
dGFjayAKPj4gZGVjbGFyYXRpb24iKQo+Cj4gSSBoYXZlIHRoYXQgaW4gbXkgdHJlZSwgSSdtIHN0
aWxsIGdldHRpbmcgYSBidW5jaCBvZiBib290IGZhaWx1cmVzIAo+IHRob3VnaC7CoCBJIGNhbiB0
cnkgdG8gZ2V0IGEgbGlzdCBpZiB5b3UncmUgbm90IHNlZWluZyBhbnksIGJ1dCBJJ20gCj4ga2lu
ZCBvZiBzdHVjayBvbiBzb21lIG90aGVyIHN0dWZmIGZvciBhIGJpdC4uLgoKCkkgc2VudCB5ZXN0
ZXJkYXkgYSB2OSB3aGljaCBmaXhlcyB0aGUgbWVkbG93IGJvb3QgaXNzdWVzIHlvdSBtZW50aW9u
ZWQsIApJIGRpZCBub3QgaGF2ZSBhbnkgYm9vdCBmYWlsdXJlcyBhZnRlciB0aGF0IG9uIG15IHNp
ZGUuCgoKPgo+PiB2ODoKPj4gLSBGaXggTExWTSBsZCB3YXJuaW5nIGJ5IG1vdmluZyB0aGUgc2Vj
dGlvbiAuaW5pdC5zZGF0YSBmcm9tCj4+IMKgIGtlcm5lbC9waS9zdHJpbmcuYyBpbnRvIHRoZSBu
ZXdseSBjcmVhdGVkIHNlY3Rpb24gLmluaXQucGlkYXRhCj4+Cj4+IHY3Ogo+PiAtIFJlYmFzZWQg
b24gdG9wIG9mIGZvci1uZXh0IHdoaWNoIGludHJvZHVjZXMgbG90cyBvZiBlcnJvcnMgKHRoYW5r
cyB0bwo+PiDCoCB0aGUgcGF0Y2h3b3JrIENJKQo+PiAtIEFkZCBfX05PX0ZPUlRJRlkgdG8gYXZv
aWQgdW5kZWZpbmVkIF9fcGlfZm9ydGlmeV9wYW5pYwo+PiAtIEFkZCBhbiBhbGlhcyB0byBvdXIg
bmV3bHkgaW50cm9kdWNlZCBzdHJsZW4KPj4gLSBSZW1vdmUgX19pbml0IGFzIHNlY3Rpb25zIGFy
ZSBhbHJlYWR5IHByZWZpeGVkIGluIHRoZSBNYWtlZmlsZQo+PiAtIEludHJvZHVjZSBuZXcgc2Vj
dGlvbiBmb3Iga2VybmVsL3BpL3N0cmluZy5jIHRvIHF1aWV0IHRoZSBmb2xsb3dpbmcKPj4gwqAg
d2FybmluZ3MgKG9uY2Ugd2UgaGF2ZSBhbGwgdGhlIHN0cmluZyBmdW5jdGlvbnMsIHdlJ2xsIGJl
IGFibGUgdG8gZ2V0Cj4+IMKgIHJpZCBvZiB0aGlzKToKPj4KPj4gd2FybmluZzogb3JwaGFuIHNl
Y3Rpb24gYC5pbml0X19idWdfdGFibGUnIGZyb20gCj4+IGBhcmNoL3Jpc2N2L2tlcm5lbC9waS9z
dHJpbmcucGkubycgYmVpbmcgcGxhY2VkIGluIHNlY3Rpb24gCj4+IGAuaW5pdF9fYnVnX3RhYmxl
Jwo+PiB3YXJuaW5nOiBvcnBoYW4gc2VjdGlvbiBgLmluaXQuc3JvZGF0YS5jc3Q4JyBmcm9tIAo+
PiBgYXJjaC9yaXNjdi9rZXJuZWwvcGkvc3RyaW5nLnBpLm8nIGJlaW5nIHBsYWNlZCBpbiBzZWN0
aW9uIAo+PiBgLmluaXQuc3JvZGF0YS5jc3Q4Jwo+Pgo+PiB2NjoKPj4gLSBGaXggbGx2bSB3YXJu
aW5nIGJ5IGZvcndhcmQgZGVjbGFyaW5nIHNldF9zYXRwX21vZGVfZnJvbV9jbWRsaW5lCj4+Cj4+
IHY1Ogo+PiAtIEhhbmRsZSBudWxsIGNvbW1hbmQgbGluZSwgVGhhbmtzIEJqw7ZybiEKPj4gLSBB
ZGQgUkIvVEIgZnJvbSBCasO2cm4KPj4KPj4gdjQ6Cj4+IC0gSW50cm9kdWNlIHBpLyBmb3IgS0FT
QU4gdG8gd29yawo+Pgo+PiB2MzoKPj4gLSBNYXNzYWdlIGNvbW1pdCBsb2cgdG8gbWFrZSBubzRs
dmwgY2xlYXJlciwgYXMgYXNrZWQgYnkgQ29ub3IKPj4gLSBBZGQgYSBub3RlIHRvIGtlcm5lbC1w
YXJhbWV0ZXJzLnR4dCByZWdhcmRpbmcgdGhlIGltcG9zc2liaWxpdHkgdG8gdXNlCj4+IMKgIHRo
b3NlIHBhcmFtZXRlcnMgd2hlbiBLQVNBTiBpcyBlbmFibGVkLCBhcyBzdWdnZXN0ZWQgYnkgQ29u
b3IKPj4gLSBBZGQgUkIgZnJvbSBCasO2cm4KPj4KPj4gdjI6Cj4+IC0gSG9ub3IgQ01ETElORV9F
WFRFTkQgYW5kIENNRExJTkVfRk9SQ0UgYXMgbm90aWNlZCBieSBCasO2cm4KPj4KPj4KPj4gQWxl
eGFuZHJlIEdoaXRpICgxKToKPj4gwqAgcmlzY3Y6IEFsbG93IHRvIGRvd25ncmFkZSBwYWdpbmcg
bW9kZSBmcm9tIHRoZSBjb21tYW5kIGxpbmUKPj4KPj4gwqAuLi4vYWRtaW4tZ3VpZGUva2VybmVs
LXBhcmFtZXRlcnMudHh0wqDCoMKgwqDCoMKgwqDCoCB8wqAgNSArLQo+PiDCoGFyY2gvcmlzY3Yv
a2VybmVsL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKwo+PiDCoGFyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAzNyArKysrKysrKysrKwo+PiDCoGFyY2gvcmlzY3Yva2VybmVsL3Bp
L2NtZGxpbmVfZWFybHkuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDYyICsrKysrKysrKysrKysrKysr
KysKPj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgOCArKysKPj4gwqBhcmNoL3Jpc2N2L2xpYi9tZW1jcHkuU8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsKPj4gwqBhcmNoL3Jp
c2N2L2xpYi9tZW1tb3ZlLlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDIgKwo+PiDCoGFyY2gvcmlzY3YvbGliL3N0cmxlbi5TwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+PiDCoGFyY2gvcmlzY3YvbW0vaW5p
dC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAz
NiArKysrKysrKystLQo+PiDCoDkgZmlsZXMgY2hhbmdlZCwgMTQ4IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3Bp
L01ha2VmaWxlCj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3BpL2Nt
ZGxpbmVfZWFybHkuYwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
