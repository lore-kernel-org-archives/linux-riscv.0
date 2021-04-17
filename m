Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59581C433ED
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 17:27:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3972610CD
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 17:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3972610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CljMqN2VGl2xGfejgSRgPMV5bWUfdKwGJ+DTmIUUjG8=; b=X+B+AmUWsJ7/+95oFb+CCl/zn
	2zdip/Btf/sPMsMGmsC8qB1KXzt/k4sqlsvgifRRA1SaLxc1L8ZHkSI+KXEsFSaen4WSHyw1pYiLB
	l0toSl2fWUH4jIFZoY2LHVa8ePSQ9QPJLSus32XPcGjV5GCbOZIpk7+FS9YzfZDcBxBIRH04K9XmS
	RGY1oLfviz7m+vUGf5GWz5eHsheiC7QwMZn/AXzbbA4g/blGlqTseLv5V6Z5Q9kZmGbNKvHlA1ouD
	GFAPQtrq5rQX5fF8nsJ3lF0brnytNzVdPXI70RnPJH7NVdXS1uM3DwmJkFApCRp0g0hAJUIydcN/C
	lqy7NRLDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXoiV-005qD6-NC; Sat, 17 Apr 2021 17:26:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXoiS-005qCV-Gu
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 17:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=On5c/ZGGJhSlObpkSo0BSTAa8iWyj8i8MJVorIMxnKA=; b=ZYYZYj657PkqHh7A/GU0t3C27F
 OH0n1iTFlUcDRlhYaCxVjJ4esAKUjzFjKZRtKMzPE3olQgAC8ayUiUWL5QqIQj/OqfU6WPd49p7rX
 4igdZy2gZHsJ8l5bWyN2RemOsE73or9tPPoYzUzmn5LVxO8x0jscp+Rd8+OgzhP6RxNCdNmgX9jcs
 +0jFoHM1WSH8n8S524Clhuu9r6kBtOpDf6tC16jNQzMpF18nCb43QHRgScSJO3+gIzGqxTz0Ra7jm
 s+4Pqf1gSvX5zmi4cDwC1y9fXxg22a3oywK8jbN8SIoD6l3UE4ZTz2uxy8U9nWJW9SR/i3H0Zuh6I
 GPTSFTXA==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXoiP-00A7jJ-Fn
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 17:26:43 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 39881E0003;
 Sat, 17 Apr 2021 17:26:37 +0000 (UTC)
Subject: Re: [PATCH] riscv: Protect kernel linear mapping only if
 CONFIG_STRICT_KERNEL_RWX is set
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: anup@brainfault.org, corbet@lwn.net,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, aryabinin@virtuozzo.com, glider@google.com,
 dvyukov@google.com, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <mhng-9ab3280b-4523-4892-9f9a-338f55df8108@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <72130961-0419-9b1f-e88e-aa1e933f2942@ghiti.fr>
Date: Sat, 17 Apr 2021 13:26:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <mhng-9ab3280b-4523-4892-9f9a-338f55df8108@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_102641_825142_9DD08AC2 
X-CRM114-Status: GOOD (  24.02  )
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

TGUgNC8xNi8yMSDDoCAxMjozMyBQTSwgUGFsbWVyIERhYmJlbHQgYSDDqWNyaXTCoDoKPiBPbiBG
cmksIDE2IEFwciAyMDIxIDAzOjQ3OjE5IFBEVCAoLTA3MDApLCBhbGV4QGdoaXRpLmZyIHdyb3Rl
Ogo+PiBIaSBBbnVwLAo+Pgo+PiBMZSA0LzE2LzIxIMOgIDY6NDEgQU0sIEFudXAgUGF0ZWwgYSDD
qWNyaXTCoDoKPj4+IE9uIFRodSwgQXByIDE1LCAyMDIxIGF0IDQ6MzQgUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPj4+Pgo+Pj4+IElmIENPTkZJR19TVFJJQ1RfS0VS
TkVMX1JXWCBpcyBub3Qgc2V0LCB3ZSBjYW5ub3Qgc2V0IGRpZmZlcmVudCAKPj4+PiBwZXJtaXNz
aW9ucwo+Pj4+IHRvIHRoZSBrZXJuZWwgZGF0YSBhbmQgdGV4dCBzZWN0aW9ucywgc28gbWFrZSBz
dXJlIGl0IGlzIGRlZmluZWQgYmVmb3JlCj4+Pj4gdHJ5aW5nIHRvIHByb3RlY3QgdGhlIGtlcm5l
bCBsaW5lYXIgbWFwcGluZy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0
aSA8YWxleEBnaGl0aS5mcj4KPj4+Cj4+PiBNYXliZSB5b3Ugc2hvdWxkIGFkZCAiRml4ZXM6IiB0
YWcgaW4gY29tbWl0IHRhZyA/Cj4+Cj4+IFllcyB5b3UncmUgcmlnaHQgSSBzaG91bGQgaGF2ZSBk
b25lIHRoYXQuIE1heWJlIFBhbG1lciB3aWxsIHNxdWFzaCBpdCBhcwo+PiBpdCBqdXN0IGVudGVy
ZWQgZm9yLW5leHQ/Cj4gCj4gWWEsIEknbGwgZG8gaXQuwqAgTXkgdGVzdGluZyBib3ggd2FzIGp1
c3QgdGllZCB1cCBsYXN0IG5pZ2h0IGZvciB0aGUgcmM4IAo+IFBSLCBzbyBJIHRocmV3IHRoaXMg
b24gZm9yLW5leHQgdG8gZ2V0IHRoZSBidWlsZGJvdHMgdG8gdGFrZSBhIGxvb2suIAo+IEl0J3Mg
YSBiaXQgdG9vIGxhdGUgdG8gdGFrZSBzb21ldGhpbmcgZm9yIHRoaXMgd2VlaywgYXMgSSB0cnkg
dG8gYmUgCj4gcHJldHR5IGNvbnNlcnZhdGl2ZSB0aGlzIGxhdGUgaW4gdGhlIGN5Y2xlLsKgIFRo
ZXJlJ3MgYW5vdGhlciBrcHJvYmVzIGZpeCAKPiBvbiB0aGUgbGlzdCBzbyBpZiB3ZSBlbmQgdXAg
d2l0aCBhbiByYzggSSBtaWdodCBzZW5kIHRoaXMgYWxvbmcgd2l0aCAKPiB0aGF0LCBvdGhlcndp
c2UgdGhpcydsbCBqdXN0IGdvIG9udG8gZm9yLW5leHQgYmVmb3JlIHRoZSBsaW5lYXIgbWFwIAo+
IGNoYW5nZXMgdGhhdCBleGVyY2lzZSB0aGUgYnVnLgo+IAo+IFlvdSdyZSBtb3JlIHRoYW4gd2Vs
Y29tZSB0byBqdXN0IGRpZyB1cCB0aGUgZml4ZXMgdGFnIGFuZCByZXBseSwgbXkgCj4gc2NyaXB0
cyBwdWxsIGFsbCB0YWdzIGZyb20gcmVwbGllcyAoanVzdCBsaWtlIFJldmlld2ViLWJ5KS7CoCBP
dGhlcndpc2UgCj4gSSdsbCBkbyBpdCBteXNlbGYsIG1vc3QgcGVvcGxlIGRvbid0IHJlYWxseSBw
b3N0IEZpeGVzIHRhZ3MgdGhhdCAKPiBhY2N1cmF0ZWx5IHNvIEkgZ28gdGhyb3VnaCBpdCBmb3Ig
cHJldHR5IG11Y2ggZXZlcnl0aGluZyBhbnl3YXkuCgpIZXJlIGl0IGlzOgoKRml4ZXM6IDRiNjdm
NDhkYTcwNyAoInJpc2N2OiBNb3ZlIGtlcm5lbCBtYXBwaW5nIG91dHNpZGUgb2YgbGluZWFyIG1h
cHBpbmciKQoKVGhhbmtzLAoKPiAKPiBUaGFua3MgZm9yIHNvcnRpbmcgdGhpcyBvdXQgc28gcXVp
Y2tseSEKPiAKPj4KPj4+Cj4+PiBPdGhlcndpc2UgaXQgbG9va3MgZ29vZC4KPj4+Cj4+PiBSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPj4KPj4gVGhhbmsgeW91
IQo+Pgo+PiBBbGV4Cj4+Cj4+Pgo+Pj4gUmVnYXJkcywKPj4+IEFudXAKPj4+Cj4+Pj4gLS0tCj4+
Pj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDggKysrKy0tLS0KPj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
ZXR1cC5jCj4+Pj4gaW5kZXggNjI2MDAzYmI1ZmNhLi5hYjM5NGQxNzNjZDQgMTAwNjQ0Cj4+Pj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3NldHVwLmMKPj4+PiBAQCAtMjY0LDEyICsyNjQsMTIgQEAgdm9pZCBfX2luaXQgc2V0dXBf
YXJjaChjaGFyICoqY21kbGluZV9wKQo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBzYmlfaW5p
dCgpOwo+Pj4+Cj4+Pj4gLcKgwqDCoMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RSSUNU
X0tFUk5FTF9SV1gpKQo+Pj4+ICvCoMKgwqDCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1NU
UklDVF9LRVJORUxfUldYKSkgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHByb3RlY3Rfa2VybmVsX3RleHRfZGF0YSgpOwo+Pj4+IC0KPj4+PiAtI2lmIGRlZmluZWQoQ09O
RklHXzY0QklUKSAmJiBkZWZpbmVkKENPTkZJR19NTVUpCj4+Pj4gLcKgwqDCoMKgwqDCoCBwcm90
ZWN0X2tlcm5lbF9saW5lYXJfbWFwcGluZ190ZXh0X3JvZGF0YSgpOwo+Pj4+ICsjaWZkZWYgQ09O
RklHXzY0QklUCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvdGVjdF9rZXJu
ZWxfbGluZWFyX21hcHBpbmdfdGV4dF9yb2RhdGEoKTsKPj4+PiDCoCAjZW5kaWYKPj4+PiArwqDC
oMKgwqDCoMKgIH0KPj4+Pgo+Pj4+IMKgICNpZmRlZiBDT05GSUdfU1dJT1RMQgo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqAgc3dpb3RsYl9pbml0KDEpOwo+Pj4+IC0tIAo+Pj4+IDIuMjAuMQo+Pj4+Cj4+
Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo+Pj4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
