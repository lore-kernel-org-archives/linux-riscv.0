Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FA8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:57:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46D6610E9
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C46D6610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nA3EvX9l8o6gO4TRZdfoULao0UkrT8jvKs90no8GLEI=; b=gXyMB1LqfqWwAfsJIZm/CW6ENh
	Xn7l1KPsV2b5albBnPE3p4SJqIy/mtXJOCJ1Z7naftq/60rFjZYuhM6WmzauiB3vNey0Mdozy7Yth
	rSac+CTOwbGc8p+Qo4O4tqCLUjHMheVxrTeNr5eo/LqQwhZG9gsfsIT57E2jv9Cae34YB6FFuPY59
	ltjbQXJQo1pwd3XsFVjrKekUipnkNZzsnMDFNOL8EzE+VjySmxFpmH0iYcsB1F/sxhQq9J/CxmB5a
	xkDV1DJsVO38eWGG92vJe7YY/xgsoII/tlq+0aMtW7RePXdV+VZRbQt/ebdNShs/2PwIf6zhNG+9M
	AonqWbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNtOB-006EMA-76; Wed, 08 Sep 2021 08:57:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNtO7-006EKr-JL
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 08:57:01 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 82B11240014;
 Wed,  8 Sep 2021 08:56:47 +0000 (UTC)
Subject: Re: [PATCH v2 -next] riscv: mm: remove redundant trampoline PGD for
 64bit
To: Nanyong Sun <sunnanyong@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 wangkefeng.wang@huawei.com, tiantao6@hisilicon.com, qiuwenbo@phytium.com.cn,
 rppt@kernel.org, jszhang@kernel.org, mick@ics.forth.gr
References: <mhng-ea598bd7-cae0-4b60-83c5-b862a664116d@palmerdabbelt-glaptop>
 <150d9366-c042-3119-d86f-163b579d91b4@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <13c4d471-dc3b-32d8-6535-36d3862592d4@ghiti.fr>
Date: Wed, 8 Sep 2021 10:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <150d9366-c042-3119-d86f-163b579d91b4@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_015659_957970_14AF21EC 
X-CRM114-Status: GOOD (  37.61  )
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

SGkgTmFueW9uZywKCkxlIDgvMDkvMjAyMSDDoCAwODo0MiwgTmFueW9uZyBTdW4gYSDDqWNyaXTC
oDoKPiAKPiBPbiAyMDIxLzgvMTQgNjowOCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+IE9uIE1v
biwgMDIgQXVnIDIwMjEgMDU6NDM6MDIgUERUICgtMDcwMCksIGFsZXhAZ2hpdGkuZnIgd3JvdGU6
Cj4+PiBIaSBOYW55b25nLAo+Pj4KPj4+IExlIDI4LzA3LzIwMjEgw6AgMTM6NTUsIEFsZXggR2hp
dGkgYSDDqWNyaXTCoDoKPj4+Pgo+Pj4+Cj4+Pj4gTGUgMjgvMDcvMjAyMSDDoCAwNDo0OSwgTmFu
eW9uZyBTdW4gYSDDqWNyaXTCoDoKPj4+Pj4gUmVtb3ZlIHJlZHVuZGFudCB0cmFtcG9saW5lIFBH
RCBmb3IgNjRiaXQgYW5kIGFkZCBtb3JlIGNvbW1lbnQKPj4+Pj4gZm9yIHdoeSAzMmJpdCBzeXN0
ZW1zIG5lZWQgdHJhbXBvbGluZSBQR0QuCj4+Pj4+Cj4+Pj4+Cj4+Pj4+ICtsb2FkX2tlcm5lbF9w
Z2Q6Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFN3
aXRjaCB0byBrZXJuZWwgcGFnZSB0YWJsZXMuwqAgQSBmdWxsIGZlbmNlIGlzIG5lY2Vzc2FyeQo+
Pj4+PiBpbiBvcmRlciB0bwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGF2b2lkIHVzaW5nIHRo
ZSB0cmFtcG9saW5lIHRyYW5zbGF0aW9ucywgd2hpY2ggYXJlIG9ubHkKPj4+Pj4gY29ycmVjdCBm
b3IKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiB0aGUgZmlyc3Qgc3VwZXJwYWdlLsKgIEZldGNo
aW5nIHRoZSBmZW5jZSBpcyBndWFybnRlZWQgCj4+Pj4+IHRvIHdvcmsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBiZWNhdXNlIHRoYXQgZmlyc3Qgc3VwZXJwYWdlIGlzIHRyYW5zbGF0ZWQgdGhl
IHNhbWUgd2F5Lgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgY3NydyBDU1JfU0FUUCwgYTIKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNmZW5jZS52bWEKPj4+
Pj4gKwo+Pj4+PiArbG9hZF9kb25lOgo+Pj4+PiDCoMKgwqDCoMKgIC8qIFNldCB0cmFwIHZlY3Rv
ciB0byBzcGluIGZvcmV2ZXIgdG8gaGVscCBkZWJ1ZyAqLwo+Pj4+PiDCoMKgwqDCoMKgIGxhIGEw
LCAuTHNlY29uZGFyeV9wYXJrCj4+Pj4+IMKgwqDCoMKgwqAgY3NydyBDU1JfVFZFQywgYTAKPj4+
Cj4+Pgo+Pj4gSSBzdXBwb3NlIHN0dmVjIHdhcyBzZXQgdGhpcyB3YXkgdG8gY2F0Y2ggYW55IHBy
b2JsZW0gd2l0aCBlYXJseV9wZ19kaXIsCj4+PiB5b3UgbW92ZWQgdGhhdCBhbmQgdGhlbiB0aGlz
IGRlZmVhdHMgdGhpcyBvcmlnaW5hbCBwdXJwb3NlLgo+Pgo+IEhpIEFsZXgsCj4gCj4gIMKgwqDC
oCBJIGRvbid0IHRoaW5rIHNvLCBiZWZvcmUgc2V0IGVhcmx5X3BnX2RpciB0byBzYXRwLCBpdCdz
IHRoZSAKPiBwaHlzaWNhbCBhZGRyZXNzIHdvcmxkLCB3ZSBtdXN0IHNldCBzdHZlYyBhcwo+IAo+
IHRoZSBmaXJzdCBwbGFjZSBpbiB2aXJ0dWFsIGFkZHJlc3Mgd29ybGQgd2Ugd2FudCBqdW1wIHRv
LiBBbmQgSSBkb24ndCAKPiB0aGluayAiLkxzZWNvbmRhcnlfcGFyayAiIGNhbiBjYXRjaAo+IAo+
IHByb2JsZW0gb2YgYmFkIGVhcmx5X3BnX2RpciwgaWYgdGhlIGJhc2ljIHBhZ2UgdGFibGUgaXMg
d3JvbmcsIENQVSBhbHNvIAo+IGNhbiBub3QgZ28gdG8gdGhlIHZpcnR1YWwgYWRkcmVzcyBzdG9y
ZWQgaW4gc3R2ZWMgY29ycmVjdGx5LgoKQnV0IEkgdGhpbmsgdGhlbiB0aGF0IGl0IGxvb3BzIGZv
cmV2ZXIgYXQgdGhlIHN0dmVjIGFkZHJlc3Mgd2hpY2ggYWxsb3dzIAp0byBrbm93IHdoZXJlIHRo
ZSBib290IGZhaWxlZC4KCj4gCj4gTW9yZSwgaW4gdGhlIG9yaWdpbmFsIGNvZGUsIGJlZm9yZSBz
ZXQgdHJhbXBvbGluZV9wZ19kaXIsIHdoYXQgaWYgdGhlIAo+IHRyYW1wb2xpbmVfcGdfZGlyIGhh
ZCBhIHByb2JsZW0/CgpZb3UncmUgcmlnaHQgYnV0IHRoaXMgZGVidWcgJ2ZlYXR1cmUnIHdhcyBu
b3QgaW5zdGFsbGVkLCBJIGd1ZXNzIApzb21lYm9keSBoYWQgYSBoYXJkIHRpbWUgYXQgc29tZSBw
b2ludCB3aXRoIHRoZSBlYXJseSBwYWdlIHRhYmxlIGFuZCBub3QgCnRoZSB0cmFtcG9saW5lIDop
CgpBbnl3YXksIEkgd2FzIGp1c3QgcG9pbnRpbmcgdGhhdCB5b3UgJ2Jyb2tlJyB0aGUgY3VycmVu
dCB3YXkgdGhpbmdzIHdvcmsgCmFuZCB1bmxlc3MgdGhpcyBpcyBmb3IgYW4gZXhwbGljaXQgZ29v
ZCByZWFzb24sIHRoYXQgc2hvdWxkIG5vdCBoYXBwZW4uCgo+IAo+PiBFc3NlbnRpYWxseS4KPj4K
Pj4gVGhlIHNwZWNpZmljIGlzc3VlIGlzIHRoYXQgdGhlIEpUQUcgZGVidWcgc3BlYyBpcyBkZWZp
bmVkIChvciBhdCBsZWFzdCAKPj4gd2FzIHdoZW4gSSB3YXMgdXNpbmcgaXQsIGl0J3MgYmVlbiB5
ZWFycyBzaW5jZSBJJ3ZlIG5lZWRlZCB0byBkbyB0aGF0KSAKPj4gaW4gdGVybXMgb2YgY29tbWl0
dGVkIGluc3RydWN0aW9ucy7CoCBUaHVzIGlmIHlvdSBlbmQgdXAgaW4gYSBwb3NpdGlvbiAKPj4g
d2hlcmUgdGhlIHByb2Nlc3NlciBpcyB1bmFibGUgdG8gY29tbWl0IGFuIGluc3RydWN0aW9uIHlv
dSBhbHNvIGxvc2UgCj4+IHRoZSBhYmlsaXR5IHRvIGRvIGFueXRoaW5nIG1lYW5pbmdmdWwgd2l0
aCB0aGUgZGVidWdnZXIsIHRodXMgCj4+IGVzc2VudGlhbGx5IGxvY2tpbmcgdXAgdGhlIHN5c3Rl
bS4KPj4KPj4gVGhlIG1vc3QgY29tbW9uIHdheSB0byBlbmQgdXAgaW4gYSBzaXR1YXRpb24gd2hl
cmUgdGhlIHByb2Nlc3NvciBpcyAKPj4gdW5hYmxlIHRvIGNvbW1pdCBhbiBpbnN0cnVjdGlvbiBp
cyB0byBoYXZlIGEgZmF1bHQgd2l0aCBhbiBpbnZhbGlkIAo+PiB0cmFwIHZlY3RvcjogbWF5YmUg
ZGFuZ2xpbmcgZnJvbSBNLW1vZGUsIHRoZSBsYXN0IGJvb3QsIHJlc2V0LCAKPj4gd2hhdGV2ZXIu
wqAgVGhlbiBhcyBzb29uIGFzIHlvdSB0YWtlIGEgdHJhcCB0aGUgc3lzdGVtIGxvY2tzIHVwLsKg
IEFueSAKPj4gdHJhcCBiZWZvcmUgd2UgaGF2ZSBhIHdvcmtpbmcgdHJhcCBoYW5kbGVyIGlzIGEg
YnVnLCBidXQgaXQncyB3YXkgCj4+IGhhcmRlciB0byBkZWJ1ZyB0aGluZ3Mgd2hlbiB0aGUgZGVi
dWdnZXIgZG9lc24ndCBmdW5jdGlvbi4KPj4KPj4gVGhlcmUgaXMgb2YgY291cnNlIG5vIHdheSB0
byBmdW5kYW1lbnRhbGx5IHByZXZlbnQgdGhlc2Ugc29ydCBvZiAKPj4gbm8tY29tbWl0YWJsZS1p
bnN0cnVjdGlvbiBzaXR1YXRpb25zLCBidXQgSSBnb3QgaW50byB0aGUgaGFiYml0IG9mIAo+PiBq
dXN0IHNldHRpbmcgdXAgYSB0cml2aWFsIHRyYXAgZW50cnkgcG9pbnQgQVNBUCAtLSBpdCBwcm9i
YWJseSB0b29rIGEgCj4+IGRvemVuIHJvdW5kcyBvZiB0cnlpbmcgdG8gZGVidWcgdGhlIGRlYnVn
Z2VyIG9ubHkgdG8gcmVhbGl6ZSBpdCB3YXMgCj4+IHBlciBzcGVjIHRvIGhhbmcsIGJ1dCB0aGF0
IGlkaW9tIGV2ZW50dWFsbHkgY3JlcHQgaW50byBwcmV0dHkgbXVjaCAKPj4gZXZlcnl0aGluZy4K
Pj4KPj4gTm90IHN1cmUgaWYgdGhlIGRlYnVnIHNwZWMgaXMgc3RpbGwgd3JpdHRlbiB0aGlzIHdh
eSAob3IgaWYgZGVidWdnZXJzIAo+PiByZXNwZWN0IGl0KSwgYXMgSSBoYXZlbid0IGhhZCB0byB1
c2Ugb25lIGluIGEgd2hpbGUuCj4+Cj4+Pgo+Pj4KPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4+Pj4gaW5kZXggYWM0
ODc0MmZhNmZjLi4zMDZmY2IyMzM0ZmEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
aW5pdC5jCj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+Pj4+IEBAIC0yMTksMTMg
KzIxOSwxNyBAQCB1bnNpZ25lZCBsb25nIHBmbl9iYXNlIF9fcm9fYWZ0ZXJfaW5pdDsKPj4+Pj4g
wqAgRVhQT1JUX1NZTUJPTChwZm5fYmFzZSk7Cj4+Pj4+IMKgIHBnZF90IHN3YXBwZXJfcGdfZGly
W1BUUlNfUEVSX1BHRF0gX19wYWdlX2FsaWduZWRfYnNzOwo+Pj4+PiArI2lmbmRlZiBDT05GSUdf
NjRCSVQKPj4+Pj4gwqAgcGdkX3QgdHJhbXBvbGluZV9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX3Bh
Z2VfYWxpZ25lZF9ic3M7Cj4+Pj4+ICsjZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4+Pgo+Pj4K
Pj4+IEFzIHN0YXRlZCBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJzdCwg
aXQgaXMgYmV0dGVyIHRvIHVzZQo+Pj4gX19tYXliZV91bnVzZWQgcmF0aGVyIHRoYW4gI2lmZGVm
cy4KPj4+Cj4+Pgo+IEknbSBhZnJhaWQgdGhhdCBfX21heWJlX3VudXNlZCBjYW4gbm90IHNhdmUg
b25lIHBhZ2UgbWVtb3J5IGhlcmUuCgpXaGF0IGRvIHlvdSBtZWFuPwoKPj4+Cj4+PiBPdmVyYWxs
IHRoaXMgdmVyc2lvbiBhZGRzIG1vcmUgY29tcGxleGl0eSB0byBhc3NlbWJseSBjb2RlIHRoYW4g
SQo+Pj4gdGhvdWdodCwgYnV0IEkgZG9uJ3Qgc2VlIGFueSB3YXkgdG8gaW1wcm92ZSB0aGF0ICh3
aGljaCBkb2VzIG5vdCBtZWFuCj4+PiB0aGVyZSBpc24ndCEpLgo+Pj4KPj4+IFRoYW5rcywKPj4+
Cj4+PiBBbGV4Cj4+Pgo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcsIGxldCBtZSBmaWd1cmUgb3V0
IGEgYmV0dGVyIHNvbHV0aW9uLgo+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+Pj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+Pj4+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+Cj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
