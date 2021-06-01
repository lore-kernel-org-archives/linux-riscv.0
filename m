Return-Path: <SRS0=0g6C=K3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E33C47083
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 03:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07DF611CA
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 03:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07DF611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4zHPuHEZGpiSn898ECaLd00tWgRvjOFI3jPuBXssn4=; b=MBYVKHce+t5O0Ymrj9zb/I27ur
	AuiLMg+J8ipj1l2H0FwSXJzkwteZjBeBo06dFs2pSeL5cw7t6jvr9YTsDF+edkuCKcw+E1KVUE8Es
	+UUb684juoasbnE2ZWUVW8w1ZVds6mk+pDgJg9DNRJ0Sxh6k3vtAovBqyIweevRT4xbA2A11Tkf6Q
	KY9hKdloTy0zKw1No69wxpTUr1Xo+BBAh8WFFz4UX09kjV3VP2H8N8OhuP8J1aVTrUhrwUtuQr/ie
	st3DEtqkytTMROqJiQ9OFuyqmT6Wc7cGTDlkKqGalPsHe6EPqREY2CPp/vITdx450tH3LLMtqgHFe
	ESU+XlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnv3z-00EQCw-Ae; Tue, 01 Jun 2021 03:27:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnv3v-00EQBa-C0
 for linux-riscv@lists.infradead.org; Tue, 01 Jun 2021 03:27:29 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FvHZj288jzYp4N;
 Tue,  1 Jun 2021 11:24:29 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 11:27:12 +0800
Received: from [10.174.177.231] (10.174.177.231) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 11:27:12 +0800
Subject: Re: [PATCH -next] riscv: mm: fix build errors caused by mk_pmd()
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <Atish.Patra@wdc.com>, <wangkefeng.wang@huawei.com>
References: <mhng-5dc6487a-bafb-471f-ac5c-f6ec93cd311c@palmerdabbelt-glaptop>
From: "Sunnanyong (Nanyong Sun, Intelligent Computing Solution Development
 Dep)" <sunnanyong@huawei.com>
Message-ID: <bb41e44d-b7aa-1522-1ffb-1b352aade064@huawei.com>
Date: Tue, 1 Jun 2021 11:27:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <mhng-5dc6487a-bafb-471f-ac5c-f6ec93cd311c@palmerdabbelt-glaptop>
X-Originating-IP: [10.174.177.231]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_202727_766528_34E9CC3B 
X-CRM114-Status: GOOD (  13.79  )
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

T24gMjAyMS81LzMwIDk6MjEsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgoKPiBPbiBTYXQsIDI5IE1h
eSAyMDIxIDE1OjQ1OjA0IFBEVCAoLTA3MDApLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4gT24g
TW9uLCAyNCBNYXkgMjAyMSAwMDowMjoyMCBQRFQgKC0wNzAwKSwgc3VubmFueW9uZ0BodWF3ZWku
Y29tIHdyb3RlOgo+Pj4gV2l0aCAicmlzY3Y6IG1tOiBhZGQgVEhQIHN1cHBvcnQgb24gNjQtYml0
IiwgbWtfcG1kKCkgZnVuY3Rpb24KPj4+IGludHJvZHVjZSBidWlsZCBlcnJvcnMsCj4+PiAxLmJ1
aWxkIHdpdGggQ09ORklHX0FSQ0hfUlYzMkk9eToKPj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oOiBJbiBmdW5jdGlvbiAnbWtfcG1kJzoKPj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oOjUxMzo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gCj4+PiBvZiBm
dW5jdGlvbiAncGZuX3BtZCc7Cj4+PiDCoGRpZCB5b3UgbWVhbiAncGZuX3BnZCc/IFstV2Vycm9y
PWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+Pj4KPj4+IDIuYnVpbGQgd2l0aCBDT05G
SUdfU1BBUlNFTUVNPXkgJiYgQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQPW4KPj4+IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oOiBJbiBmdW5jdGlvbiAnbWtfcG1kJzoKPj4+IGluY2x1
ZGUvYXNtLWdlbmVyaWMvbWVtb3J5X21vZGVsLmg6NjQ6MTQ6IGVycm9yOiBpbXBsaWNpdCAKPj4+
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdwYWdlX3RvX3NlY3Rpb24nOwo+Pj4gwqBkaWQgeW91
IG1lYW4gJ3ByZXNlbnRfc2VjdGlvbic/IAo+Pj4gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4+Pgo+Pj4gVXNlIG1hY3JvIGRlZmluaXRpb24gaW5zdGVhZCBvZiBpbmxp
bmUgZnVuY3Rpb24gZm9yIG1rX3BtZAo+Pj4gdG8gZml4IHRoZSBhYm92ZSBwcm9ibGVtcy5JdCBp
cyBzaW1pbGFyIHRvIHRoZSBta19wdGUgbWFjcm8uCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogTmFueW9uZyBT
dW4gPHN1bm5hbnlvbmdAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4gwqBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaCB8IDUgKy0tLS0KPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCAKPj4+IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmgKPj4+IGluZGV4IDRiNzA4YWUwODkxMC4uZjM1ZDljOTBkNGNiIDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCj4+PiBAQCAtNTA4LDEwICs1MDgsNyBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgcG1kX3BmbihwbWRfdCBwbWQpCj4+PiDCoMKgwqDCoCByZXR1cm4gKChf
X3BtZF90b19waHlzKHBtZCkgJiBQTURfTUFTSykgPj4gUEFHRV9TSElGVCk7Cj4+PiDCoH0KPj4+
Cj4+PiAtc3RhdGljIGlubGluZSBwbWRfdCBta19wbWQoc3RydWN0IHBhZ2UgKnBhZ2UsIHBncHJv
dF90IHByb3QpCj4+PiAtewo+Pj4gLcKgwqDCoCByZXR1cm4gcGZuX3BtZChwYWdlX3RvX3Bmbihw
YWdlKSwgcHJvdCk7Cj4+PiAtfQo+Pj4gKyNkZWZpbmUgbWtfcG1kKHBhZ2UsIHByb3QpwqDCoMKg
IHBmbl9wbWQocGFnZV90b19wZm4ocGFnZSksIHByb3QpCj4+Pgo+Pj4gwqBzdGF0aWMgaW5saW5l
IHBtZF90IHBtZF9tb2RpZnkocG1kX3QgcG1kLCBwZ3Byb3RfdCBuZXdwcm90KQo+Pj4gwqB7Cj4+
Cj4+IFRoYW5rcywgdGhpcyBpcyBvbiBmb3ItbmV4dC4KPgo+IFNvcnJ5LCBJIHdhc24ndCBsb29r
aW5nIGNsb3NlbHkgZW5vdWdoLsKgIEkgdGhpbmsgdGhlIGFjdHVhbCBwcm9ibGVtIAo+IGhlcmUg
aXMgdGhhdCBta19wbWQoKSBzaG91bGQgYmUgaW4gcGd0YWJsZS02NC5oLgo+IC4KCk1vdmluZyBt
a19wbWQoKSB0byBwZ3RhYmxlLTY0LmggY2FuIG9ubHkgc29sdmUgdGhlIGZpcnN0IHByb2JsZW0s
IGJ1dCAKbm90IHRoZSBzZWNvbmQuCgpUaGUgc2Vjb25kIG9uZSBuZWVkIG1rX3BtZCgpIGRlZmlu
ZWQgYXMgYSBtYWNybywgbGlrZSB0aGlzIHByZXZpb3VzIApzb2x1dGlvbjoKCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDE5MTAyMzAzMjMw
Mi4xNjAzODgtMS13YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbS8KCk9yIGRvIGkgbmVlZCB0byBt
b3ZlIHRoZSAnI2RlZmluZSBta19wbWQocGFnZSwgcHJvdCkgLi4uJyB0byBwZ3RhYmxlLTY0Lmgg
PwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
