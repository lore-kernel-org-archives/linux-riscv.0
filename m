Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39F2CD4F59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 06:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFHTfEoWRJANcbJP3ZgaSZio5yy1hxun1PJtPfKQeWM=; b=u/yDzE5fH3cRKn
	YLAGtUB8hRckm0RtPeBoQTVpLxe6Pz2FX38/WwQQ1UWMpGrKRhBDqDgg9jMqOsJN1jNKJ5jEnFPqH
	fP8g/xQoARXwd7YzZjL2dGAdNnXXP1B0Zpn0jtwWDQU5Qx9BEdxtakniUomYHVxKxUn1brQ+ZdAUo
	yS6B8pz4eUaSoWEVSWWFU1hyfJdkzzwd5d07S6ao94TE4VIT7N2/uT8d6CfBIPNOlULZoLyHnPM3e
	6YxeVLj11YKT12T1nCJZiA6ObqmhJ/4pQIc0UloK6qqtYa8UbLjqPWf7y3S2hFHp6S1p9jmFAFUQL
	4Q78/U3mrbraVEy98zRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6Cx-00000007Dvi-46xc;
	Thu, 05 Sep 2024 06:43:08 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6CF-00000007Dch-0JOF
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 06:42:25 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WzqXZ5FFQz4f3kpS
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 14:42:06 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 15BF81A0359
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 14:42:17 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgBHfGHHUtlmsrbFAQ--.19928S2;
	Thu, 05 Sep 2024 14:42:16 +0800 (CST)
Message-ID: <c587edd1-811b-4cc2-8738-a01196bab274@huaweicloud.com>
Date: Thu, 5 Sep 2024 14:42:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/4] libbpf: Access first syscall argument
 with CO-RE direct read on arm64
Content-Language: en-US
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
 <20240831041934.1629216-3-pulehui@huaweicloud.com>
 <CAEf4BzYQx95PzRyivNgGWwL_ytB1=Z8eVGe_ejYHvdiCyjMJzA@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAEf4BzYQx95PzRyivNgGWwL_ytB1=Z8eVGe_ejYHvdiCyjMJzA@mail.gmail.com>
X-CM-TRANSID: Syh0CgBHfGHHUtlmsrbFAQ--.19928S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4DCFy5JF4ruFyrWrWDXFb_yoW8tw4UpF
	WUCa4UKw18Ww4jkas2gayavF13tws5trnrGF97GasakFyDKr95Wa42qrZ09w4avryUJ3yF
	vr9Fkr18C3W7Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_234223_828161_B4433A7D 
X-CRM114-Status: GOOD (  13.87  )
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

CgpPbiAyMDI0LzkvNSA0OjIxLCBBbmRyaWkgTmFrcnlpa28gd3JvdGU6Cj4gT24gRnJpLCBBdWcg
MzAsIDIwMjQgYXQgOToxN+KAr1BNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4g
d3JvdGU6Cj4+Cj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Cj4+IEN1
cnJlbnRseSBQVF9SRUdTX1BBUk0xIFNZU0NBTEwoeCkgaXMgY29uc2lzdGVudCB3aXRoIFBUX1JF
R1NfUEFSTTFfQ09SRQo+PiBTWVNDQUxMKHgpLCB3aGljaCB3aWxsIGludHJvZHVjZSB0aGUgb3Zl
cmhlYWQgb2YgQlBGX0NPUkVfUkVBRCgpLCB0YWtpbmcKPj4gaW50byBhY2NvdW50IHRoZSByZWFk
IHB0X3JlZ3MgY29tZXMgZGlyZWN0bHkgZnJvbSB0aGUgY29udGV4dCwgbGV0J3MgdXNlCj4+IENP
LVJFIGRpcmVjdCByZWFkIHRvIGFjY2VzcyB0aGUgZmlyc3Qgc3lzdGVtIGNhbGwgYXJndW1lbnQu
Cj4+Cj4+IFN1Z2dlc3RlZC1ieTogQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9yZz4K
Pj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4gLS0tCj4+
ICAgdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oIHwgNCArKy0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaCBiL3Rvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaAo+
PiBpbmRleCBlN2Q5MzgyZWZlYjMuLjA1MWM0MDhlNmFlZCAxMDA2NDQKPj4gLS0tIGEvdG9vbHMv
bGliL2JwZi9icGZfdHJhY2luZy5oCj4+ICsrKyBiL3Rvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcu
aAo+PiBAQCAtMjIyLDcgKzIyMiw3IEBAIHN0cnVjdCBwdF9yZWdzX19fczM5MCB7Cj4+Cj4+ICAg
c3RydWN0IHB0X3JlZ3NfX19hcm02NCB7Cj4+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgb3JpZ194
MDsKPj4gLX07Cj4+ICt9IF9fYXR0cmlidXRlX18oKHByZXNlcnZlX2FjY2Vzc19pbmRleCkpOwo+
Pgo+PiAgIC8qIGFybTY0IHByb3ZpZGVzIHN0cnVjdCB1c2VyX3B0X3JlZ3MgaW5zdGVhZCBvZiBz
dHJ1Y3QgcHRfcmVncyB0byB1c2Vyc3BhY2UgKi8KPj4gICAjZGVmaW5lIF9fUFRfUkVHU19DQVNU
KHgpICgoY29uc3Qgc3RydWN0IHVzZXJfcHRfcmVncyAqKSh4KSkKPj4gQEAgLTI0MSw3ICsyNDEs
NyBAQCBzdHJ1Y3QgcHRfcmVnc19fX2FybTY0IHsKPj4gICAjZGVmaW5lIF9fUFRfUEFSTTRfU1lT
Q0FMTF9SRUcgX19QVF9QQVJNNF9SRUcKPj4gICAjZGVmaW5lIF9fUFRfUEFSTTVfU1lTQ0FMTF9S
RUcgX19QVF9QQVJNNV9SRUcKPj4gICAjZGVmaW5lIF9fUFRfUEFSTTZfU1lTQ0FMTF9SRUcgX19Q
VF9QQVJNNl9SRUcKPj4gLSNkZWZpbmUgUFRfUkVHU19QQVJNMV9TWVNDQUxMKHgpIFBUX1JFR1Nf
UEFSTTFfQ09SRV9TWVNDQUxMKHgpCj4+ICsjZGVmaW5lIFBUX1JFR1NfUEFSTTFfU1lTQ0FMTCh4
KSAoKChjb25zdCBzdHJ1Y3QgcHRfcmVnc19fX2FybTY0ICopKHgpKS0+b3JpZ194MCkKPiAKPiBJ
dCB3b3VsZCBwcm9iYWJseSBiZSBiZXN0IChmb3IgY29uc2lzdGVuY3kpIHRvIHN0aWNrIHRvIHVz
aW5nCj4gX19QVFJfUEFSTTFfU1lTQ0FMTF9SRUcgaW5zdGVhZCBvZiBoYXJkLWNvZGluZyBvcmln
X3gwIGhlcmUsIG5vPyBJJ2xsCj4gZml4IGl0IHVwIHdoaWxlIGFwcGx5aW5nLiBTYW1lIGZvciBw
YXRjaCAjMSBhbmQgIzQuCj4gCj4gSXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNhbiBkb3VibGUt
Y2hlY2sgdGhhdCBmaW5hbCBwYXRjaGVzIGluCj4gYnBmLW5leHQvbWFzdGVyIGNvbXBpbGUgYW5k
IHdvcmsgd2VsbCBmb3IgYXJtNjQsIHMzOTB4LCBhbmQgUlY2NCAoYXMgSQo+IGNhbid0IHJlYWxs
eSB0ZXN0IHRoYXQgbXVjaCBsb2NhbGx5KS4KCkkgY2hlY2sgdGhhdCBsb2NhbGx5IHdpdGggY3Jv
c3MtcGxhdGZvcm0gdm10ZXN0IG9uIFJWNjQsIGl0IGxvb2tzIGdvb2Q6CgpTdW1tYXJ5OiA1Njkv
Mzk0NCBQQVNTRUQsIDEwNCBTS0lQUEVELCAwIEZBSUxFRAoKYW5kIEJQRiBDSSBtZWV0IGhhcHB5
IG9uIGFybTY0LCBzMzkweC4KCgo+IAo+IAo+IAo+PiAgICNkZWZpbmUgUFRfUkVHU19QQVJNMV9D
T1JFX1NZU0NBTEwoeCkgXAo+PiAgICAgICAgICBCUEZfQ09SRV9SRUFEKChjb25zdCBzdHJ1Y3Qg
cHRfcmVnc19fX2FybTY0ICopKHgpLCBfX1BUX1BBUk0xX1NZU0NBTExfUkVHKQo+Pgo+PiAtLQo+
PiAyLjM0LjEKPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
