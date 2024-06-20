Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1F6C27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 02:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owO+c+h964BsqiBTAE+OB9MTNttlGz6x4A+IpL0/ovI=; b=Emk8gZzvOIpJwh
	6/rNlsRzXFOuo0T0V8NcyIEa4enuZlNQHu4ZL8hThfCWNtzRmpn08q1qkVgICjcSq23Ls1p5J9OZU
	NmSCut4hvVBnIVxF8p8XiK1cm/LALKbF1fhj3i9JVGFoWq+Jomu2KYgiikumbff7pzKgodzXrkTNg
	HHAvr8xe3nZWpcBohXyWbfYo9AKiIx/eoWvlDbp6cM7QTWr9dNBIYkaHPfP4LPX3dgi1sBGWr6Njw
	VHxFgFwcmsFQImi3XP3rBm3NlUqqrlXOtjfpIcThu5k9j4eHsgHG3YwsVnYCDkwt95H5bk5jPcs5O
	40VbJlyMCQG5sBo4k+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK7dg-00000003N5r-18MP;
	Thu, 20 Jun 2024 02:35:04 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK7db-00000003N4f-3DjL
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 02:35:03 +0000
Received: from [192.168.12.218] (unknown [121.237.44.152])
	by APP-05 (Coremail) with SMTP id zQCowACnrgIzlXNmuyXEEQ--.59667S2;
	Thu, 20 Jun 2024 10:34:28 +0800 (CST)
Message-ID: <426b4cba-28c2-4f47-9db5-70df477c9634@iscas.ac.cn>
Date: Thu, 20 Jun 2024 10:34:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] riscv: Expose orig_a0 in the user_regs_struct
 structure
To: Charlie Jenkins <charlie@rivosinc.com>
References: <cover.1718693532.git.zhouquan@iscas.ac.cn>
 <d4c7da80b72375c75836303bc744e4db9eeec218.1718693532.git.zhouquan@iscas.ac.cn>
 <ZnOARMA1I0yRoNh8@ghost>
Content-Language: en-US
From: Quan Zhou <zhouquan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, oleg@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 shuah@kernel.org
In-Reply-To: <ZnOARMA1I0yRoNh8@ghost>
X-CM-TRANSID: zQCowACnrgIzlXNmuyXEEQ--.59667S2
X-Coremail-Antispam: 1UD129KBjvJXoWxArWxAFWfXryUuF1rXw4DCFg_yoW5XF1DpF
	ZakwnFkF4kury8K342va15Xr1jywsxG347KrWfJ345ta4jyFW5WrnxKwn8Jrn3Ja90qFyI
	qFyagry3Aan8ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU82YLPUUUUU==
X-Originating-IP: [121.237.44.152]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiCQ8OBmZzQb3X9gAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_193500_230991_6CABED35 
X-CRM114-Status: GOOD (  19.83  )
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

Ck9uIDIwMjQvNi8yMCAwOTowNSwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+IE9uIFdlZCwgSnVu
IDE5LCAyMDI0IGF0IDEwOjAxOjI3QU0gKzA4MDAsIHpob3VxdWFuQGlzY2FzLmFjLmNuIHdyb3Rl
Ogo+PiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Pgo+PiBFeHBvc2Ug
b3JpZ19hMCB0byB1c2Vyc3BhY2UgdG8gZW5zdXJlIHRoYXQgdXNlcnMgY2FuIG1vZGlmeQo+PiB0
aGUgYWN0dWFsIHZhbHVlIG9mIGBhMGAgaW4gdGhlIHRyYWNlZCBwcm9jZXNzIHRocm91Z2ggdGhl
Cj4+IHB0cmFjZShQVFJBQ0VfU0VUUkVHU0VULCAuLi4pIHBhdGguIFNpbmNlIHVzZXJfcmVnc19z
dHJ1Y3QgaXMKPj4gYSBzdWJzZXQgb2YgcHRfcmVncywgd2UgYWxzbyBuZWVkIHRvIGFkanVzdCB0
aGUgcG9zaXRpb24gb2YKPj4gdGhlIG9yaWdfYTAgZmllbGQgaW4gcHRfcmVncyB0byBhY2hpZXZl
IHRoZSBjb3JyZWN0IGNvcHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1
YW5AaXNjYXMuYWMuY24+Cj4+IC0tLQo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNl
LmggICAgICB8IDQgKystLQo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2Uu
aCB8IDIgKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oCj4+IGluZGV4IGI1YjBhZGNjODVjMS4u
MzdmNDhkNDBhZTQ2IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFj
ZS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmgKPj4gQEAgLTQ1LDEy
ICs0NSwxMiBAQCBzdHJ1Y3QgcHRfcmVncyB7Cj4+ICAgCXVuc2lnbmVkIGxvbmcgdDQ7Cj4+ICAg
CXVuc2lnbmVkIGxvbmcgdDU7Cj4+ICAgCXVuc2lnbmVkIGxvbmcgdDY7Cj4+ICsJLyogYTAgdmFs
dWUgYmVmb3JlIHRoZSBzeXNjYWxsICovCj4+ICsJdW5zaWduZWQgbG9uZyBvcmlnX2EwOwo+PiAg
IAkvKiBTdXBlcnZpc29yL01hY2hpbmUgQ1NScyAqLwo+PiAgIAl1bnNpZ25lZCBsb25nIHN0YXR1
czsKPj4gICAJdW5zaWduZWQgbG9uZyBiYWRhZGRyOwo+PiAgIAl1bnNpZ25lZCBsb25nIGNhdXNl
Owo+PiAtCS8qIGEwIHZhbHVlIGJlZm9yZSB0aGUgc3lzY2FsbCAqLwo+PiAtCXVuc2lnbmVkIGxv
bmcgb3JpZ19hMDsKPj4gICB9Owo+PiAgIAo+PiAgICNkZWZpbmUgUFRSQUNFX1NZU0VNVQkJCTB4
MWYKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaAo+PiBpbmRleCBhMzgyNjhiMTlj
M2QuLjNlMzdmODBjYjNlOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL3B0cmFjZS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2Uu
aAo+PiBAQCAtNTQsNiArNTQsOCBAQCBzdHJ1Y3QgdXNlcl9yZWdzX3N0cnVjdCB7Cj4+ICAgCXVu
c2lnbmVkIGxvbmcgdDQ7Cj4+ICAgCXVuc2lnbmVkIGxvbmcgdDU7Cj4+ICAgCXVuc2lnbmVkIGxv
bmcgdDY7Cj4+ICsJLyogYTAgdmFsdWUgYmVmb3JlIHRoZSBzeXNjYWxsICovCj4+ICsJdW5zaWdu
ZWQgbG9uZyBvcmlnX2EwOwo+PiAgIH07Cj4+ICAgCj4+ICAgc3RydWN0IF9fcmlzY3ZfZl9leHRf
c3RhdGUgewo+PiAtLSAKPj4gMi4zNC4xCj4+Cj4gVGhpcyBpcyBhIGdvb2QgYWRkaXRpb24hCj4K
PiBTaW5jZSBvcmlnX2EwIGlzIG5vIGxvbmdlciBhdCB0aGUgYm90dG9tIG9mIHB0X3JlZ3MsIE1B
WF9SRUdfT0ZGU0VUIGlzCj4gbm93IGluY29ycmVjdC4KPgo+IENhbiB5b3UgYWRqdXN0IHRoZSB2
YWx1ZSBvZjoKPgo+ICNkZWZpbmUgTUFYX1JFR19PRkZTRVQgb2Zmc2V0b2Yoc3RydWN0IHB0X3Jl
Z3MsIG9yaWdfYTApCj4KPiBpbiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oIHRvIGJl
Ogo+Cj4gI2RlZmluZSBNQVhfUkVHX09GRlNFVCBvZmZzZXRvZihzdHJ1Y3QgcHRfcmVncywgY2F1
c2UpCj4KPiBUaGlzIGlzIHNvbWV0aGluZyB0aGF0IGlzIHZlcnkgZWFzeSB0byBtaXNzLiBJIHRo
aW5rIGl0IHdvdWxkIGJlCj4gdmFsdWFibGUgdG8gbGVhdmUgYSBjb21tZW50IGF0IHRoZSB0b3Ag
b2Ygc3RydWN0IHB0X3JlZ3MgcG9pbnRpbmcgb3V0Cj4gdGhhdCBNQVhfUkVHX09GRlNFVCBuZWVk
cyB0byBiZSBhZGp1c3RlZCBpZiBzdHJ1Y3QgcHRfcmVncyBjaGFuZ2VzLgo+Cj4gLSBDaGFybGll
Cj4KT2gsIGdvb2QgaWRlYSHCoCBJJ20gc29ycnkgZm9yIG1pc3Npbmcgc3VjaCBhbiBpbXBvcnRh
bnQgcG9pbnQgZWFybGllci4KCk9uY2UgZW5vdWdoIGluZm9ybWF0aW9uIGlzIGdhdGhlcmVkIGZy
b20gdGhpcyBSRkMsIEkgd2lsbCBpbmNsdWRlIHdoYXQgCnlvdSBtZW50aW9uZWQgaW4gdGhlIFYx
IHNlcmllcy4KClRoYW5rcywKUXVhbgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
