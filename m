Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52526C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R67j+YlY/uDQHmYh0T45e5vYBmW4/Knu2/PVkCLGjvA=; b=ERmeTpGJU0UkkF
	s4m0/DqUebvrASyvL2Zmpf1+ZYIhrQK64XiZYudkEDo9KMPrmHiNpL95MvxqVuBXXo6TJIYSm9O8W
	5sRI3J5CRfqUShwaUDhjAxP3GxZFg4C3664DcmeUS2VC8cghUw9t0XZkPlQ08awHvqMbX5kmCv6bJ
	A/PXlNbVfVjEX9DGtnnEh+IxdaoBNM+/zPLTnX/DY8O4tGxvqGvIMvraGC04xlQDt0eEuANRUA6cf
	+LnC7sIEzFjH3icTl/5VclL6Qj2WqwaaNqyuW74GDjqjuPe72QCmjZgJ8GjsGB2jDRzPc0F3zWaBw
	lBaemLrpm7RzNMlHwefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPM3M-008u1T-2h;
	Mon, 15 Jan 2024 12:26:56 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPM3J-008u0S-0l
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 12:26:55 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TDBG55HT5z4f3lg2
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:26:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id C0C911A016E
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:26:43 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgB3fG6DJKVlY6KqAw--.51273S2;
	Mon, 15 Jan 2024 20:26:43 +0800 (CST)
Message-ID: <c33984f0-57dc-4833-a96d-164425fc7578@huaweicloud.com>
Date: Mon, 15 Jan 2024 20:26:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 6/6] riscv, bpf: Optimize bswap insns with Zbb
 support
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-7-pulehui@huaweicloud.com>
 <87pm22mu79.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87pm22mu79.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: gCh0CgB3fG6DJKVlY6KqAw--.51273S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw15ZF1kZrW7WF4fKrW8Crg_yoW5urWfpa
	s8Kr4rCay8trsrt34DWa1jgw43GF43tFnFvr1fJFZ5JrWjvr48G3WUKr4FkryUAryfCa15
	uF1DKrnIk3WUKFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UdxhLUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_042653_612866_EC0EE8BD 
X-CRM114-Status: GOOD (  13.18  )
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

CgpPbiAyMDIzLzkvMjggMTk6MDgsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEZyb206IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4+Cj4+IE9wdGltaXplIGJzd2FwIGluc3RydWN0aW9ucyBieSByZXY4
IFpiYiBpbnN0cnVjdGlvbiBjb25iaW5lZCB3aXRoIHNybGkKPj4gaW5zdHJ1Y3Rpb24uIEFuZCBP
cHRpbWl6ZSAxNi1iaXQgemVyby1leHRlbnNpb24gd2l0aCBaYmIgc3VwcG9ydC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdC5oICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiAgIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCA1MCArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMo
KyksIDQ4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdC5oIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4+IGluZGV4IDk0NGJkZDZlNC4uYTA0
ZWVkNjcyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKPj4gKysrIGIv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4+IEBAIC0xMTM1LDEyICsxMTM1LDc5IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBlbWl0X3NleHR3KHU4IHJkLCB1OCBycywgc3RydWN0IHJ2X2ppdF9jb250
ZXh0ICpjdHgpCj4+ICAgCWVtaXRfYWRkaXcocmQsIHJzLCAwLCBjdHgpOwo+PiAgIH0KPj4gICAK
Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X3pleHRoKHU4IHJkLCB1OCBycywgc3RydWN0IHJ2
X2ppdF9jb250ZXh0ICpjdHgpCj4+ICt7Cj4+ICsJaWYgKHJ2emJiX2VuYWJsZWQoKSkgewo+PiAr
CQllbWl0KHJ2emJiX3pleHRoKHJkLCBycyksIGN0eCk7Cj4+ICsJfSBlbHNlIHsKPj4gKwkJZW1p
dF9zbGxpKHJkLCBycywgNDgsIGN0eCk7Cj4+ICsJCWVtaXRfc3JsaShyZCwgcmQsIDQ4LCBjdHgp
Owo+PiArCX0KPj4gK30KPj4gKwo+IAo+IFByZWZlciBlYXJseS1leGl0Lgo+IAo+PiAgIHN0YXRp
YyBpbmxpbmUgdm9pZCBlbWl0X3pleHR3KHU4IHJkLCB1OCBycywgc3RydWN0IHJ2X2ppdF9jb250
ZXh0ICpjdHgpCj4+ICAgewo+PiAgIAllbWl0X3NsbGkocmQsIHJzLCAzMiwgY3R4KTsKPj4gICAJ
ZW1pdF9zcmxpKHJkLCByZCwgMzIsIGN0eCk7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIGlubGlu
ZSB2b2lkIGVtaXRfYnN3YXAodTggcmQsIHMzMiBpbW0sIHN0cnVjdCBydl9qaXRfY29udGV4dCAq
Y3R4KQo+PiArewo+PiArCWlmIChydnpiYl9lbmFibGVkKCkpIHsKPj4gKwkJaW50IGJpdHMgPSA2
NCAtIGltbTsKPj4gKwo+PiArCQllbWl0KHJ2emJiX3JldjgocmQsIHJkKSwgY3R4KTsKPj4gKwkJ
aWYgKGJpdHMpCj4+ICsJCQllbWl0X3NybGkocmQsIHJkLCBiaXRzLCBjdHgpOwo+PiArCX0gZWxz
ZSB7Cj4+ICsJCWVtaXRfbGkoUlZfUkVHX1QyLCAwLCBjdHgpOwo+PiArCj4+ICsJCWVtaXRfYW5k
aShSVl9SRUdfVDEsIHJkLCAweGZmLCBjdHgpOwo+PiArCQllbWl0X2FkZChSVl9SRUdfVDIsIFJW
X1JFR19UMiwgUlZfUkVHX1QxLCBjdHgpOwo+PiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9S
RUdfVDIsIDgsIGN0eCk7Cj4+ICsJCWVtaXRfc3JsaShyZCwgcmQsIDgsIGN0eCk7Cj4+ICsJCWlm
IChpbW0gPT0gMTYpCj4+ICsJCQlnb3RvIG91dF9iZTsKPj4gKwo+PiArCQllbWl0X2FuZGkoUlZf
UkVHX1QxLCByZCwgMHhmZiwgY3R4KTsKPj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdf
VDIsIFJWX1JFR19UMSwgY3R4KTsKPj4gKwkJZW1pdF9zbGxpKFJWX1JFR19UMiwgUlZfUkVHX1Qy
LCA4LCBjdHgpOwo+PiArCQllbWl0X3NybGkocmQsIHJkLCA4LCBjdHgpOwo+PiArCj4+ICsJCWVt
aXRfYW5kaShSVl9SRUdfVDEsIHJkLCAweGZmLCBjdHgpOwo+PiArCQllbWl0X2FkZChSVl9SRUdf
VDIsIFJWX1JFR19UMiwgUlZfUkVHX1QxLCBjdHgpOwo+PiArCQllbWl0X3NsbGkoUlZfUkVHX1Qy
LCBSVl9SRUdfVDIsIDgsIGN0eCk7Cj4+ICsJCWVtaXRfc3JsaShyZCwgcmQsIDgsIGN0eCk7Cj4+
ICsJCWlmIChpbW0gPT0gMzIpCj4+ICsJCQlnb3RvIG91dF9iZTsKPj4gKwo+PiArCQllbWl0X2Fu
ZGkoUlZfUkVHX1QxLCByZCwgMHhmZiwgY3R4KTsKPj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBS
Vl9SRUdfVDIsIFJWX1JFR19UMSwgY3R4KTsKPj4gKwkJZW1pdF9zbGxpKFJWX1JFR19UMiwgUlZf
UkVHX1QyLCA4LCBjdHgpOwo+PiArCQllbWl0X3NybGkocmQsIHJkLCA4LCBjdHgpOwo+PiArCj4+
ICsJCWVtaXRfYW5kaShSVl9SRUdfVDEsIHJkLCAweGZmLCBjdHgpOwo+PiArCQllbWl0X2FkZChS
Vl9SRUdfVDIsIFJWX1JFR19UMiwgUlZfUkVHX1QxLCBjdHgpOwo+PiArCQllbWl0X3NsbGkoUlZf
UkVHX1QyLCBSVl9SRUdfVDIsIDgsIGN0eCk7Cj4+ICsJCWVtaXRfc3JsaShyZCwgcmQsIDgsIGN0
eCk7Cj4+ICsKPj4gKwkJZW1pdF9hbmRpKFJWX1JFR19UMSwgcmQsIDB4ZmYsIGN0eCk7Cj4+ICsJ
CWVtaXRfYWRkKFJWX1JFR19UMiwgUlZfUkVHX1QyLCBSVl9SRUdfVDEsIGN0eCk7Cj4+ICsJCWVt
aXRfc2xsaShSVl9SRUdfVDIsIFJWX1JFR19UMiwgOCwgY3R4KTsKPj4gKwkJZW1pdF9zcmxpKHJk
LCByZCwgOCwgY3R4KTsKPj4gKwo+PiArCQllbWl0X2FuZGkoUlZfUkVHX1QxLCByZCwgMHhmZiwg
Y3R4KTsKPj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIFJWX1JFR19UMSwgY3R4
KTsKPj4gKwkJZW1pdF9zbGxpKFJWX1JFR19UMiwgUlZfUkVHX1QyLCA4LCBjdHgpOwo+PiArCQll
bWl0X3NybGkocmQsIHJkLCA4LCBjdHgpOwo+PiArb3V0X2JlOgo+PiArCQllbWl0X2FuZGkoUlZf
UkVHX1QxLCByZCwgMHhmZiwgY3R4KTsKPj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdf
VDIsIFJWX1JFR19UMSwgY3R4KTsKPj4gKwo+PiArCQllbWl0X212KHJkLCBSVl9SRUdfVDIsIGN0
eCk7Cj4+ICsJfQo+PiArfQo+IAo+IERlZmluaXRlbHkgZWFybHktZXhpdCBmb3IgdGhpcyBvbmUh
Cj4gCj4gVGhpcyBmdW5jdGlvbiByZWFsbHkgc2hvdy1jYXNlcyB3aHkgWkJCIGlzIG5pY2UhIDst
KQo+IAo+IEknbGwgdGFrZSB0aGUgbmV4dCByZXYgb2Ygc2VyaWVzIGZvciBhIHRlc3QhCj4gCgpP
a2F5LCB0aGUgcmVsZXZhbnQgbW9kaWZpY2F0aW9ucyB3aWxsIGJlIHByZXNlbnRlZCBpbiB2MyBh
bmQgd2lsbCBiZSAKc2VudCBzb29uLgoKPiAKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
