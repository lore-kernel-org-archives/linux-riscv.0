Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8D2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osi/EekDv4iuUbCKMakLI3v0stSqFdgeJsQlCkjSUOo=; b=LsL1pUxcaX2mFRlUBQAPWuwXvA
	rnRuzvSvEKCyl1YpCQvYlhzV5e+DXU4bGu5SdXxDPVf+0solUjiPLcPmxorZj0ZI+Dvkj9ieMKHgz
	PphpqRQPqvGIebMkJaEBOCJd2Qqpdcm/oPOKc+yz0+t4JSHWJ5IlI4tKl9PpiTSnREqsZsVwOYu+9
	IWOFzBO2lAYEKzjRzXrIg9jKNRikUiJbOXYfBMfi+anB3f7B5tO8QUw2lM+9nCRQVQonQlGyd5/21
	gjwEpekMFWwao3825ubyu5xRcRVbkxKwpD2V0dnjIdiJZIeGzqIHoysylDdkFnYDV3Ej0uuDgmLGA
	sbu7OyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nolgl-006ouy-7k; Wed, 11 May 2022 12:43:35 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nolgi-006otm-2M
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 12:43:33 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0VCwOcAr_1652273005; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VCwOcAr_1652273005) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 11 May 2022 20:43:26 +0800
Subject: Re: [PATCH] RISC-V: Remove IORESOURCE_BUSY flag for no-map reserved
 memory
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 anup@brainfault.org, wangkefeng.wang@huawei.com, rppt@kernel.org,
 alex@ghiti.fr, twd2.me@gmail.com, seanjc@google.com, petr.pavlu@suse.com,
 atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, jianghuaming.jhm@alibaba-inc.com,
 Nick Kossifidis <mick@ics.forth.gr>
References: <20220511112413.559734-1-xianting.tian@linux.alibaba.com>
 <4407c84b-a64f-51b0-fa96-388aaf3b3e35@redhat.com>
 <f12c2576-1bd4-970d-4435-59273c5de0fc@linux.alibaba.com>
Message-ID: <f214bb0b-41d9-18cc-9f22-f3a7918689c9@linux.alibaba.com>
Date: Wed, 11 May 2022 20:43:25 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f12c2576-1bd4-970d-4435-59273c5de0fc@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_054332_357337_ED390DD6 
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

CuWcqCAyMDIyLzUvMTEg5LiL5Y2IODozNywgWGlhbnRpbmcgVGlhbiDlhpnpgZM6Cj4KPiDlnKgg
MjAyMi81LzExIOS4i+WNiDg6MjcsIERhdmlkIEhpbGRlbmJyYW5kIOWGmemBkzoKPj4gT24gMTEu
MDUuMjIgMTM6MjQsIFhpYW50aW5nIFRpYW4gd3JvdGU6Cj4+PiBDb21taXQgMDBhYjAyN2EzYjgy
ICgiUklTQy1WOiBBZGQga2VybmVsIGltYWdlIHNlY3Rpb25zIHRvIHRoZSAKPj4+IHJlc291cmNl
IHRyZWUiKQo+Pj4gYWRkZWQgSU9SRVNPVVJDRV9CVVNZIGZsYWcgZm9yIG5vLW1hcCByZXNlcnZl
ZCBtZW1vcnksIHRoaXMgY2FzdWVkCj4+PiBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSBmYWlsZWQg
Zm9yIHRoZSBuby1tYXAgcmVzZXJ2ZWQgbWVtb3J5IGluIAo+Pj4gc3Vic2VxdWVudAo+Pj4gb3Bl
cmF0aW9ucyBvZiByZWxhdGVkIGRyaXZlciwgc28gcmVtb3ZlIHRoZSBJT1JFU09VUkNFX0JVU1kg
ZmxhZy4KPj4+Cj4+PiBUaGUgY29kZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlLAo+Pj4gZHRzOgo+
Pj4gwqDCoMKgwqBtZW0wOiBtZW1vcnlAYTAwMDAwMDAgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweGEwMDAwMDAwIDAgMHgxMDAwMDAwPjsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vLW1hcDsKPj4+IMKgwqDCoMKgwqDCoMKg
wqAgfTsKPj4+Cj4+PiDCoMKgwqDCoCZ0ZXN0IHsKPj4+IMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9
ICJva2F5IjsKPj4+IMKgwqDCoMKgwqDCoMKgIG1lbW9yeS1yZWdpb24gPSA8Jm1lbTA+Owo+Pj4g
wqDCoMKgwqB9Owo+Pj4KPj4+IGNvZGU6Cj4+PiDCoMKgwqDCoG5wID0gb2ZfcGFyc2VfcGhhbmRs
ZShwZGV2LT5kZXYub2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24iLCAwKTsKPj4+IMKgwqDCoMKgcmV0
ID0gb2ZfYWRkcmVzc190b19yZXNvdXJjZShucCwgMCwgJnIpOwo+Pj4gwqDCoMKgwqBiYXNlID0g
ZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsICZyKTsKPj4+IMKgwqDCoMKgLy8gYmFz
ZSA9IC1FQlVTWQo+Pj4KPj4+IEZpeGVzOiAwMGFiMDI3YTNiODIgKCJSSVNDLVY6IEFkZCBrZXJu
ZWwgaW1hZ2Ugc2VjdGlvbnMgdG8gdGhlIAo+Pj4gcmVzb3VyY2UgdHJlZSIpCj4+PiBSZXBvcnRl
ZC1ieTogSHVhbWluZyBKaWFuZyA8amlhbmdodWFtaW5nLmpobUBhbGliYWJhLWluYy5jb20+Cj4+
PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+PiBDQzogTmljayBL
b3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW50aW5n
IFRpYW4gPHhpYW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+Cj4+PiAtLS0KPj4+IMKgIGFy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMgfCAyICstCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4+IGluZGV4IDgz
NGViNjUyYTdiOS4uNzFmMjk2NmIxNDc0IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc2V0dXAuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+Pj4gQEAgLTIx
NCw3ICsyMTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9yZXNvdXJjZXModm9pZCkKPj4+
IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkobWVtYmxvY2tfaXNfbm9tYXAocmVn
aW9uKSkpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+bmFtZSA9ICJSZXNl
cnZlZCI7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPmZsYWdzID0gSU9SRVNPVVJD
RV9NRU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMt
PmZsYWdzID0gSU9SRVNPVVJDRV9NRU07Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+bmFtZSA9ICJTeXN0ZW0gUkFNIjsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+ZmxhZ3MgPSBJT1JFU09VUkNFX1NZ
U1RFTV9SQU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4+IEkgYXNzdW1lIHRoZSAiUmVzZXJ2ZWQiIHBh
cnQgaXMgZXNzZW50aWFsbHkgdW51c2VkIGJ5IHRoZSBrZXJuZWwgCj4+IGNvcnJlY3Q/Cj4KPiBJ
IHRoaW5rIHdlIG1heSB1c2UgaXQsIGFjdHVhbGx5IHdlIGZvdW5kIHRoZSBpc3N1ZSBpbiBvdXIg
cHJvZHVjdCAKPiBhZnRlciBtZXJnZWQga2R1bXAgZnVuY3Rpb25hbGl0eS4KPgo+IEFjdHVhbGx5
LCB0aGUgY29kZSBkaWRuJ3QgYWRkIElPUkVTT1VSQ0VfQlVTWSBmb3Igbm8tbWFwIHJlc2VydmVk
IAo+IG1lbW9yeSBiZWZvcmUgMDBhYjAyN2EzYjgyIG1lcmdlZCzCoCBzbyBpdCBpcyBhIHR5cG8g
Zm9yIGNvbW1pdCAKPiAwMGFiMDI3YTNiODIgdG8gYWRkIElPUkVTT1VSQ0VfQlVTWT8KClRoaXMg
aXMgYXJtNjQgY29kZSwgd2hpY2ggZG9lc24ndCBhZGQgSU9SRVNPVVJDRV9CVVNZIGZvciBuby1t
YXAgCnJlc2VydmVkIG1lbW9yeSwKCmFyY2gvYXJtNjQva2VybmVsL3NldHVwLmMKCiDCoMKgwqDC
oMKgwqDCoCBmb3JfZWFjaF9tZW1fcmVnaW9uKHJlZ2lvbikgewogwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJlcyA9ICZzdGFuZGFyZF9yZXNvdXJjZXNbaSsrXTsKIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobWVtYmxvY2tfaXNfbm9tYXAocmVnaW9uKSkgewogwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPm5hbWXCoCA9
ICJyZXNlcnZlZCI7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlcy0+ZmxhZ3MgPSBJT1JFU09VUkNFX01FTTsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5zdGFydCA9IApfX3Bmbl90b19waHlzKG1lbWJs
b2NrX3JlZ2lvbl9yZXNlcnZlZF9iYXNlX3BmbihyZWdpb24pKTsKIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5lbmQgPSAKX19wZm5fdG9fcGh5cyht
ZW1ibG9ja19yZWdpb25fcmVzZXJ2ZWRfZW5kX3BmbihyZWdpb24pKSAtIDE7Cgo+Cj4+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
