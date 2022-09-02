Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD5ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6EXuvlYCD+B7oD6+WdL9pWh5YEh+qiST2l2d8Em+ys=; b=t6D0Oz1iPK8sWu
	869uXFyBsZrQxf/VZow2F2L+1i0/ggppwiPNb9NBCCqNwQeRsdEEE+3Su66itRhaW8Ia1KYQct/ta
	TEupsRjw0xK2DZCgGRUVZvZHXc7sVMgDXEaJ9k1U78nVzDamQwtsdjvV8DUHETnRR/Rkb6nU0Z20a
	OMj7vti6Dt51BcuXOMmVv2mHcjZ4xj/QnT1ql27CR5svzE5F8UA/xocMBwBPcXEZY8BQ1VFm5wG41
	ycydaOccjL4DPLrZ8PbIwyLhJL/hLgFVt1rP9EPI5ckOdEAiPyz3UyGDekFi1dn0jF4A8VCSo7m9M
	TZfU9XfystspbZuj9f0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3yT-003RtB-Ud; Fri, 02 Sep 2022 10:32:33 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3yP-003RhD-TC
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 10:32:32 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MJvJq08Pnz1N7l9;
	Fri,  2 Sep 2022 18:28:43 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 18:32:24 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 18:32:24 +0800
Message-ID: <7e80ab98-606e-a65a-3d82-b17f5426c485@huawei.com>
Date: Fri, 2 Sep 2022 18:32:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH] riscv:lib: optimize memcmp with ld insn
To: <Conor.Dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220831130754.93422-1-zouyipeng@huawei.com>
 <594e8d95-c039-6c8f-4669-6c9a514cbc91@microchip.com>
 <eeb9bb24-15b1-3b8f-bc52-a2c6e4a39716@huawei.com>
 <02ad1ccf-6a38-9539-a66f-2faaeeddc715@microchip.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <02ad1ccf-6a38-9539-a66f-2faaeeddc715@microchip.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_033230_302013_74D7E253 
X-CRM114-Status: GOOD (  14.57  )
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

CuWcqCAyMDIyLzkvMSAyMzo0MCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20g5YaZ6YGTOgo+
IE9uIDAxLzA5LzIwMjIgMTQ6NTMsIFlpcGVuZyBab3Ugd3JvdGU6Cj4+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQo+Pgo+PiDlnKggMjAyMi84LzMxIDIxOjE2LCBDb25vci5Eb29s
ZXlAbWljcm9jaGlwLmNvbSDlhpnpgZM6Cj4+PiBPbiAzMS8wOC8yMDIyIDE0OjA3LCBZaXBlbmcg
Wm91IHdyb3RlOgo+Pj4+IHJpc2N2OmxpYjogb3B0aW1pemUgbWVtY21wIHdpdGggbGQgaW5zbgo+
Pj4gTWlub3Igbml0OiAicmlzY3Y6IGxpYjoKPj4gb2sKPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUKPj4+Pgo+Pj4+IEN1cnJlbnRseSBtZW1jbXAgd2FzIGltcGxlbWVudGVk
IGluIGMgY29kZShsaWIvc3RyaW5nLmMpLCB3aGljaCBjb21wYXJlCj4+Pj4gbWVtb3J5IHBlciBi
eXRlLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCB1c2UgbGQgaW5zbiBjb21wYXJlIG1lbW9yeSBwZXIg
d29yZCB0byBpbXByb3ZlLiBGcm9tIHRoZSB0ZXN0Cj4+Pj4gUmVzdWx0cywgdGhpcyB3aWxsIHRh
a2Ugc2V2ZXJhbCB0aW1lcyBvcHRpbWl6ZWQuCj4+PiBIZXkgWWlwZW5nLAo+Pj4gQ291bGQgeW91
IHNoYXJlIHNvbWUgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgdGVzdHMgeW91IGRpZD8KPj4+
IFRoZSB0ZXN0IHJlc3VsdHMgc2hvd2luZyB0aGUgJSBpbXByb3ZlbWVudCB3b3VsZCBiZSBuaWNl
IDopCj4+PiBUaGFua3MsCj4+PiBDb25vci4KPj4gT2Zjb3Vyc2UsIEJ1dCBNeSBib2FyZCB3YXMg
bm90IHJlYWR5LCBTbyBpIGp1c3QgdGVzdCB0aGlzIHBhdGNoIG9uIHFlbXUKPj4gUlY2NCAmIFJW
MzIgLgo+Pgo+PiBBbGxvYyA4LDQsMUtCIGJ1ZmZlciB0byBjb21wYXJlLCBlYWNoIGxvb3AgMTBr
IHRpbWVzLgo+IEkgZml4ZWQgdGhhdCB1cCBzaW5jZSBpdCB3YXMgZmFpcmx5IHVucmVhZGFibGUu
Lgo+Cj4gU2l6ZShCKSBNaW4obnMpIEFWRyhucykgLy9iZWZvcmUKPgo+IDhrICAgICAgNDA4MDAg
ICA0NjMxNgo+IDRrICAgICAgMjY1MDAgICAzMjMwMgo+IDFrICAgICAgMTU2MDAgICAxNzk2NQo+
Cj4gU2l6ZShCKSBNaW4obnMpIEFWRyhucykgLy9hZnRlcgo+Cj4gOGsgICAgICAxNjEwMCAgIDIx
MjgxCj4gNGsgICAgICAxNDIwMCAgIDE2NDQ2Cj4gMWsgICAgICAxMjQwMCAgIDE0MzE2ClNvcnJ5
LCB0aGUgdGV4dCBmb3JtYXQgaXMgYnJva2VuIGFuZCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciBm
aXggdGhhdCB1cC4KPgo+IEkgdGhpbmsgcHV0dGluZyB0aGlzIGludG8gdGhlIGNvbW1pdCBtZXNz
YWdlIHdvdWxkIGJlIG5pY2UuCj4KPiBJIGFtIG5vIHdoaXp6IG9uIHRoZXNlIGtpbmRzIG9mIHRo
aW5ncywgYnV0IHdpdGggdGhlIGNvbW1pdCBtZXNzYWdlCj4gZml4ZWQgdXA6Cj4gUmV2aWV3ZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CldpbGwgcHV0dGlu
ZyB0aGlzIGluIHYyIGFuZCB0aGFua3MgYWdhaW4uCj4+Pj4gU2lnbmVkLW9mZi1ieTogWWlwZW5n
IFpvdSA8em91eWlwZW5nQGh1YXdlaS5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgwqAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zdHJpbmcuaCB8wqAgMyArKwo+Pj4+ICDCoMKgIGFyY2gvcmlzY3YvbGli
L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+Pj4gIMKgwqAgYXJjaC9yaXNjdi9s
aWIvbWVtY21wLlPCoMKgwqDCoMKgwqDCoMKgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4+Pj4gIMKgwqAgMyBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4+
Pj4gIMKgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbGliL21lbWNtcC5TCj4+Pj4K
Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdHJpbmcuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc3RyaW5nLmgKPj4+PiBpbmRleCA5MDkwNDkzNjY1NTUuLjMzMzdi
NDNkMzgwMyAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0cmluZy5o
Cj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdHJpbmcuaAo+Pj4+IEBAIC0xOCw2
ICsxOCw5IEBAIGV4dGVybiBhc21saW5rYWdlIHZvaWQgKl9fbWVtY3B5KHZvaWQgKiwgY29uc3Qg
dm9pZCAqLCBzaXplX3QpOwo+Pj4+ICDCoMKgICNkZWZpbmUgX19IQVZFX0FSQ0hfTUVNTU9WRQo+
Pj4+ICDCoMKgIGV4dGVybiBhc21saW5rYWdlIHZvaWQgKm1lbW1vdmUodm9pZCAqLCBjb25zdCB2
b2lkICosIHNpemVfdCk7Cj4+Pj4gIMKgwqAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqX19tZW1t
b3ZlKHZvaWQgKiwgY29uc3Qgdm9pZCAqLCBzaXplX3QpOwo+Pj4+ICsjZGVmaW5lIF9fSEFWRV9B
UkNIX01FTUNNUAo+Pj4+ICtleHRlcm4gaW50IG1lbWNtcChjb25zdCB2b2lkICosIGNvbnN0IHZv
aWQgKiwgc2l6ZV90KTsKPj4+PiArCj4+Pj4gIMKgwqAgLyogRm9yIHRob3NlIGZpbGVzIHdoaWNo
IGRvbid0IHdhbnQgdG8gY2hlY2sgYnkga2FzYW4uICovCj4+Pj4gIMKgwqAgI2lmIGRlZmluZWQo
Q09ORklHX0tBU0FOKSAmJiAhZGVmaW5lZChfX1NBTklUSVpFX0FERFJFU1NfXykKPj4+PiAgwqDC
oCAjZGVmaW5lIG1lbWNweShkc3QsIHNyYywgbGVuKSBfX21lbWNweShkc3QsIHNyYywgbGVuKQo+
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvbGli
L01ha2VmaWxlCj4+Pj4gaW5kZXggMjVkNWM5NjY0ZTU3Li43MDc3M2JmMGM0NzEgMTAwNjQ0Cj4+
Pj4gLS0tIGEvYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2xp
Yi9NYWtlZmlsZQo+Pj4+IEBAIC0zLDYgKzMsNyBAQCBsaWItecKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCArPSBkZWxheS5vCj4+Pj4gIMKgwqAgbGliLXnCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IG1lbWNweS5vCj4+Pj4gIMKgwqAgbGliLXnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IG1lbXNldC5vCj4+Pj4gIMKgwqAgbGliLXnC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IG1lbW1vdmUubwo+Pj4+ICtsaWIt
ecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gbWVtY21wLm8KPj4+PiAgwqDC
oCBsaWItJChDT05GSUdfTU1VKcKgwqDCoMKgwqAgKz0gdWFjY2Vzcy5vCj4+Pj4gIMKgwqAgbGli
LSQoQ09ORklHXzY0QklUKcKgwqDCoCArPSB0aXNoaWZ0Lm8KPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2xpYi9tZW1jbXAuUyBiL2FyY2gvcmlzY3YvbGliL21lbWNtcC5TCj4+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjgzYWYxYzQzM2U2
Zgo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9tZW1jbXAuUwo+
Pj4+IEBAIC0wLDAgKzEsNTkgQEAKPj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seSAqLwo+Pj4+ICsvKgo+Pj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgem91eWlw
ZW5nQGh1YXdlaS5jb20KPj4+PiArICovCj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+
Cj4+Pj4gKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9leHBvcnQuaD4KPj4+PiArI2luY2x1ZGUgPGFz
bS9hc20uaD4KPj4+PiArCj4+Pj4gKy8qIGFyZ3JtZW50czoKPj4+PiArKiBhMDogYWRkcjAKPj4+
PiArKiBhMTogYWRkcjEKPj4+PiArKiBhMjogc2l6ZQo+Pj4+ICsqLwo+Pj4+ICsjZGVmaW5lIGFk
ZHIwwqAgYTAKPj4+PiArI2RlZmluZSBhZGRyMcKgIGExCj4+Pj4gKyNkZWZpbmUgbGltaXTCoCBh
Mgo+Pj4+ICsKPj4+PiArI2RlZmluZSBkYXRhMMKgIGEzCj4+Pj4gKyNkZWZpbmUgZGF0YTHCoCBh
NAo+Pj4+ICsjZGVmaW5lIHRtcMKgwqDCoCB0Mwo+Pj4+ICsjZGVmaW5lIGFhZGRywqAgdDQKPj4+
PiArI2RlZmluZSByZXR1cm4gYTAKPj4+PiArCj4+Pj4gKy8qIGxvYWQgYW5kIGNvbXBhcmUgKi8K
Pj4+PiArLm1hY3JvIExEX0NNUCBvcCBkMCBkMSBhMCBhMSBvZmZzZXQKPj4+PiArwqDCoMKgwqDC
oMKgIFxvcCBcZDAsIDAoXGEwKQo+Pj4+ICvCoMKgwqDCoMKgwqAgXG9wIFxkMSwgMChcYTEpCj4+
Pj4gK8KgwqDCoMKgwqDCoCBhZGRpIFxhMCwgXGEwLCBcb2Zmc2V0Cj4+Pj4gK8KgwqDCoMKgwqDC
oCBhZGRpIFxhMSwgXGExLCBcb2Zmc2V0Cj4+Pj4gK8KgwqDCoMKgwqDCoCBzdWIgdG1wLCBcZDAs
IFxkMQo+Pj4+ICsuZW5kbQo+Pj4+ICsKPj4+PiArRU5UUlkobWVtY21wKQo+Pj4+ICvCoMKgwqDC
oMKgwqAgLyogdGVzdCBsaW1pdCBhbGlnZW5kIHdpdGggU1pSRUcgKi8KPj4+PiArwqDCoMKgwqDC
oMKgIGFuZGkgdG1wLCBsaW1pdCwgU1pSRUcgLSAxCj4+Pj4gK8KgwqDCoMKgwqDCoCAvKiBsb2Fk
IHRhaWwgKi8KPj4+PiArwqDCoMKgwqDCoMKgIGFkZCBhYWRkciwgYWRkcjAsIGxpbWl0Cj4+Pj4g
K8KgwqDCoMKgwqDCoCBzdWIgYWFkZHIsIGFhZGRyLCB0bXAKPj4+PiArwqDCoMKgwqDCoMKgIGFk
ZCBsaW1pdCwgYWRkcjAsIGxpbWl0Cj4+Pj4gKwo+Pj4+ICsuTGxvb3BXb3JkOgo+Pj4+ICvCoMKg
wqDCoMKgwqAgc2x0dSB0bXAsIGFkZHIwLCBhYWRkcgo+Pj4+ICvCoMKgwqDCoMKgwqAgYmVxeiB0
bXAsIC5MbG9vcEJ5dGUKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoCBMRF9DTVAgUkVHX0wgZGF0
YTAgZGF0YTEgYWRkcjAgYWRkcjEgU1pSRUcKPj4+PiArwqDCoMKgwqDCoMKgIGJlcXogdG1wLCAu
TGxvb3BXb3JkCj4+Pj4gK8KgwqDCoMKgwqDCoCBqIC5McmV0dXJuCj4+Pj4gKwo+Pj4+ICsuTGxv
b3BCeXRlOgo+Pj4+ICvCoMKgwqDCoMKgwqAgc2x0dSB0bXAsIGFkZHIwLCBsaW1pdAo+Pj4+ICvC
oMKgwqDCoMKgwqAgYmVxeiB0bXAsIC5McmV0dXJuCj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqAg
TERfQ01QIGxidSBkYXRhMCBkYXRhMSBhZGRyMCBhZGRyMSAxCj4+Pj4gK8KgwqDCoMKgwqDCoCBi
ZXF6IHRtcCwgLkxsb29wQnl0ZQo+Pj4+ICsuTHJldHVybjoKPj4+PiArwqDCoMKgwqDCoMKgIG12
IHJldHVybiwgdG1wCj4+Pj4gK8KgwqDCoMKgwqDCoCByZXQKPj4+PiArRU5EKG1lbWNtcCkKPj4+
PiArRVhQT1JUX1NZTUJPTChtZW1jbXApOwo+Pj4+IC0tIAo+Pj4+IDIuMTcuMQo+Pj4+Cj4+IC0t
IAo+PiBSZWdhcmRzLAo+PiBZaXBlbmcgWm91Cj4+Ci0tIApSZWdhcmRzLApZaXBlbmcgWm91CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
