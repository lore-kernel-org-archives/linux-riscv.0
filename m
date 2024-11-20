Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F07D6395B
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Omah218pO6m69ye6aGACq9CpuNbyPFu6ToQ5zMDT1mg=; b=OEburHiUB6KLJ2
	A/mm2TnnY5W8tBDnvFmIkKAFHp/roqVyglruMpcbtWnh7R7WCpG6egtZO/q7Ow4RjfmrSvOKo04h4
	NXsnBg01kFIhsBQRd/bFCpmJFXyr8u82mavLff72MZXc08bgXyBd81dcU60BgUArPPU6nNRCV8WeT
	w/hzMfbj0Apf2Y4ffAiw4iVUxWYmER1/84b/Qca0c0UDFZTcD1BEcfmntnyMH/Jm4ktDcMUz6Jm9f
	9Kc2tkVf2NIHuFWrcV26pNeHz8Xj7Z6lhZbhh5J6kjDwEB6bKcpeKwxlGeKinwUjO5A8yVx8kdxhD
	yA+ECbhSyeKDGuN4d0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlcN-0000000FXZS-2CsO;
	Wed, 20 Nov 2024 14:23:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlcJ-0000000FXY4-2SNV
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 14:23:41 +0000
Received: from [192.168.2.4] (unknown [60.17.5.234])
	by APP-03 (Coremail) with SMTP id rQCowAAnyO3e8D1nwXouBA--.11733S2;
	Wed, 20 Nov 2024 22:23:27 +0800 (CST)
Message-ID: <c26cbfe04f9c50f5b721a9e954c1213b8c5b0508.camel@iscas.ac.cn>
Subject: Re: [PATCH] riscv: fix memory leakage in
 process_accumulated_relocations
From: laokz <zhangkai@iscas.ac.cn>
To: =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Walmsley
	 <paul.walmsley@sifive.com>, Dabbelt <palmer@dabbelt.com>, Ou
	 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Date: Wed, 20 Nov 2024 22:23:26 +0800
In-Reply-To: <ffcdbcbe-a5f6-48f4-a0a3-0d35c6c80050@rivosinc.com>
References: <35cab46a.6d145.19334919ed0.Coremail.zhangkai@iscas.ac.cn>
	 <ffcdbcbe-a5f6-48f4-a0a3-0d35c6c80050@rivosinc.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnyO3e8D1nwXouBA--.11733S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW3Ar4ruF4kCF1kKw45KFg_yoW5XFy8pr
	ykKFyDGrW8Cr4kJF4Utwn5Wry8C348A3WUWF15XFy7Jr13Ar40qF1jqr1Fgr4DJr48Jr1U
	Jr15tw1jvr1UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgtr4UUUUU
X-Originating-IP: [60.17.5.234]
X-CM-SenderInfo: x2kd0wxndlqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_062340_025447_43E3ADED 
X-CRM114-Status: GOOD (  16.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDI0LTExLTE5IGF0IDE3OjU3ICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gCj4gCj4gT24gMTYvMTEvMjAyNCAxMTo0MiwgemhhbmdrYWlAaXNjYXMuYWMuY27CoHdyb3Rl
Ogo+ID4gV2hlbiBtb2R1bGUgcmVsb2NhdGlvbiBpcyBkb25lLCBwcm9jZXNzX2FjY3VtdWxhdGVk
X3JlbG9jYXRpb25zKCkKPiA+IGZyZWVzIGFsbCBkeW5hbWljIGFsbG9jYXRlZCBtZW1vcnkuIHJl
bF9oZWFkX2l0ZXItJmd0O3JlbF9lbnRyeSBpcwo+ID4gbWlzc2VkIHRvIGZyZWUgdGhhdCBrbWVt
bGVhayBtaWdodCByZXBvcnQ6Cj4gPiAKPiA+IHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmZmZk
ODgwYzVmYzQwIChzaXplIDE2KToKPiA+IMKgIGNvbW0gImluc21vZCIsIHBpZCAxMTAxLCBqaWZm
aWVzIDQyOTUwNDUxMzgKPiA+IMKgIGhleCBkdW1wIChmaXJzdCAxNiBieXRlcyk6Cj4gPiDCoMKg
wqAgZTAgYzAgZjUgODcgZDggZmYgZmYgZmYgNjAgYzUgZjUgODcgZDggZmYgZmYgZmbCoAo+ID4g
Li4uLi4uLi5gLi4uLi4uLgo+ID4gwqAgYmFja3RyYWNlIChjcmMgZDJlY2IyMGMpOgo+ID4gwqDC
oMKgIFsmbHQ7MDAwMDAwMDBiMDE2NTVmNiZndDtdIGttYWxsb2NfdHJhY2Vfbm9wcm9mKzB4MjY4
LzB4MmY2Cj4gPiDCoMKgwqAgWyZsdDswMDAwMDAwMDZkYzAwNjdhJmd0O10KPiA+IGFkZF9yZWxv
Y2F0aW9uX3RvX2FjY3VtdWxhdGUuY29uc3Rwcm9wLjArMHhmMi8weDFhYQo+ID4gwqDCoMKgIFsm
bHQ7MDAwMDAwMDBlMWIyOWEzNiZndDtdIGFwcGx5X3JlbG9jYXRlX2FkZCsweDEzYy8weDM2ZQo+
ID4gwqDCoMKgIFsmbHQ7MDAwMDAwMDA3NTQzZjFmYiZndDtdIGxvYWRfbW9kdWxlKzB4NWM2LzB4
ODNlCj4gPiDCoMKgwqAgWyZsdDswMDAwMDAwMGFiY2UxMmU4Jmd0O10gaW5pdF9tb2R1bGVfZnJv
bV9maWxlKzB4NzQvMHhhYQo+ID4gwqDCoMKgIFsmbHQ7MDAwMDAwMDA0OTQxM2UzZCZndDtdIGlk
ZW1wb3RlbnRfaW5pdF9tb2R1bGUrMHgxMTYvMHgyMmUKPiA+IMKgwqDCoCBbJmx0OzAwMDAwMDAw
ZjliOThiODUmZ3Q7XSBfX3Jpc2N2X3N5c19maW5pdF9tb2R1bGUrMHg2Mi8weGFlCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEthaSBaaGFuZyA8emhhbmdrYWlAaXNjYXMuYWMuY24+Cj4gPiAtLS0K
PiA+IMKgYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMgfCAxICsKPiA+IMKgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9tb2R1bGUuYwo+ID4gYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+ID4gaW5kZXggMWNk
NDYxZjNkODcuLmY4YzNjNGI0N2RjIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
bW9kdWxlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gPiBAQCAtNjQz
LDYgKzY0Myw3IEBAIHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlvbnMoc3RydWN0IG1vZHVs
ZQo+ID4gKm1lLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Cj4gPiByZWxvY19oYW5kbGVyc1tjdXJyX3R5cGVdLmFjY3VtdWxhdGVfaGFuZGxlcigKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG1lLCBsb2NhdGlvbiwgYnVmZmVyKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShyZWxfaGVhZF9pdGVyLSZndDtyZWxfZW50cnkpOwo+
IAo+IEhleSBLYWksCj4gCj4gWW91ciBwYXRjaCBvdXRwdXQgaXMgbWVzc2VkIHVwIHByb2JhYmx5
IGR1ZSB0byBzb21lIGVuY29kaW5nIGlzc3VlLgoKU29ycnksIEkndmUgYWxyZWFkeSByZXNlbnQg
b25lLgoKPiBCdXQgbG9va25pZyBhdCBpdCBhbmQgdGhlIG1vZHVsZSBjb2RlLCBpdCBzZWVtcyBs
aWtlIHJlbF9lbnRyeSBkb2VzCj4gbm90Cj4gbmVlZCB0byBiZSBhIHBvaW50ZXIuIEl0IGNhbiBi
ZSBhIHBsYWluICJzdHJ1Y3QgbGlzdF9oZWFkIHJlbF9lbnRyeSIKPiBhbmQKCkkgZGlkbid0IGZp
bmQgdGhlIHBsYWluKG5vbmUgcG9pbnRlcikgdXNhZ2UuIFdoZXJlIHBsZWFzZT8KCj4gdGhlbiBz
aW1wbHkgcGFzcyB0aGUgbGlzdF9oZWFkIHBvaW50ZXIgcmF0aGVyIHRoYW4gYWxsb2NhdGluZy9m
cmVlaW5nCj4gaXQuIFRoYXQgcmVtb3ZlIGFuIGFsbG9jYXRpb24gYXMgd2VsbCBhcyBzb21lIG1l
bW9yeSBsZWFrLgo+IAo+IEJUVywgZm9yIGZpeGVzLCB5b3Ugc2hvdWxkIGFkZCBhIEZpeGVzOiB0
YWcgd2l0aCB0aGUgb3JpZ2luYWwgY29tbWl0Cj4gc2hhMSB0aGF0IGludHJvZHVjZWQgdGhlIGJ1
Zy4KVGhhbmsgeW91LiBJJ2xsIHRyeS4KCmxhb2t6Cgo+IFRoYW5rcywKPiAKPiBDbMOpbWVudAo+
IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJl
ZShyZWxfaGVhZF9pdGVyKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUoYnVja2V0X2l0ZXIpOwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
