Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689D8CA100B
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKkbCA0guybSw/NwWGWn4J4DPXQuP+ZqkJxiVVc7oVE=; b=ZtU++XkaaLJv9h
	BdNgVl58Mjb8t/X+fH9VH9A6zLd/Nfv4WZQWyfbhdT1YOTlhgISPJF/0HKO+eBDZvdQisjbVf9r3U
	J81cTVmZ7z2QtrpGoM4jWKQmK4JXPUPVb3VQ1m4mSNKwx2iHbFEw2xMRqg14ZM4hLWQUCnNmfhjVO
	l0ngoHUtkqVIw3FIntxar75sOvTT9JyoBTetNYrh1GhBUoDldF6Z/xjVw7+aGx/U7CfLwpORhYx4w
	RwgogpDn24pEpUqJLGu463Ia7h+TnsRT9z5syFNHkLdDIRISxy85zlaTU77qYU84tUDmXlj2oHF1G
	PqKGXwyUwf67/zQ4KGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skIzF-00000008tfR-1qOo;
	Sat, 31 Aug 2024 07:57:33 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skIys-00000008tbt-2PzZ
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 07:57:13 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WwnR12hgjz4f3lDJ
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 15:56:45 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 046691A12BE
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 15:57:01 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgCnGYDLzNJmO_LeDA--.44445S2;
	Sat, 31 Aug 2024 15:57:00 +0800 (CST)
Message-ID: <79b30c83-ee5e-453d-981e-61f826cf82d7@huaweicloud.com>
Date: Sat, 31 Aug 2024 15:57:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/4] libbpf: Access first syscall argument
 with CO-RE direct read on arm64
Content-Language: en-US
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
 <20240831041934.1629216-3-pulehui@huaweicloud.com>
 <2379c139-6457-49dc-84fa-0d60ce226f2a@huaweicloud.com>
In-Reply-To: <2379c139-6457-49dc-84fa-0d60ce226f2a@huaweicloud.com>
X-CM-TRANSID: gCh0CgCnGYDLzNJmO_LeDA--.44445S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCry3Xr1rZr4UJw1DCw1rZwb_yoW5tw13pF
	W8Ca4UCr18u3yjka42g3y3JF13Jws8tw48JF93Ga4S9FWjgryFq3W2gFWakryavrs7Gwsx
	ZrnFkry0q3W2v3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
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
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_005711_323489_3222C57F 
X-CRM114-Status: GOOD (  11.38  )
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

T24gOC8zMS8yMDI0IDM6MjYgUE0sIFh1IEt1b2hhaSB3cm90ZToKPiBPbiA4LzMxLzIwMjQgMTI6
MTkgUE0sIFB1IExlaHVpIHdyb3RlOgo+PiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWku
Y29tPgo+Pgo+PiBDdXJyZW50bHkgUFRfUkVHU19QQVJNMSBTWVNDQUxMKHgpIGlzIGNvbnNpc3Rl
bnQgd2l0aCBQVF9SRUdTX1BBUk0xX0NPUkUKPj4gU1lTQ0FMTCh4KSwgd2hpY2ggd2lsbCBpbnRy
b2R1Y2UgdGhlIG92ZXJoZWFkIG9mIEJQRl9DT1JFX1JFQUQoKSwgdGFraW5nCj4+IGludG8gYWNj
b3VudCB0aGUgcmVhZCBwdF9yZWdzIGNvbWVzIGRpcmVjdGx5IGZyb20gdGhlIGNvbnRleHQsIGxl
dCdzIHVzZQo+PiBDTy1SRSBkaXJlY3QgcmVhZCB0byBhY2Nlc3MgdGhlIGZpcnN0IHN5c3RlbSBj
YWxsIGFyZ3VtZW50Lgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlp
QGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5j
b20+Cj4+IC0tLQo+PiDCoCB0b29scy9saWIvYnBmL2JwZl90cmFjaW5nLmggfCA0ICsrLS0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaCBiL3Rvb2xzL2xpYi9icGYv
YnBmX3RyYWNpbmcuaAo+PiBpbmRleCBlN2Q5MzgyZWZlYjMuLjA1MWM0MDhlNmFlZCAxMDA2NDQK
Pj4gLS0tIGEvdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oCj4+ICsrKyBiL3Rvb2xzL2xpYi9i
cGYvYnBmX3RyYWNpbmcuaAo+PiBAQCAtMjIyLDcgKzIyMiw3IEBAIHN0cnVjdCBwdF9yZWdzX19f
czM5MCB7Cj4+IMKgIHN0cnVjdCBwdF9yZWdzX19fYXJtNjQgewo+PiDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgb3JpZ194MDsKPj4gLX07Cj4+ICt9IF9fYXR0cmlidXRlX18oKHByZXNlcnZlX2Fj
Y2Vzc19pbmRleCkpOwo+PiDCoCAvKiBhcm02NCBwcm92aWRlcyBzdHJ1Y3QgdXNlcl9wdF9yZWdz
IGluc3RlYWQgb2Ygc3RydWN0IHB0X3JlZ3MgdG8gdXNlcnNwYWNlICovCj4+IMKgICNkZWZpbmUg
X19QVF9SRUdTX0NBU1QoeCkgKChjb25zdCBzdHJ1Y3QgdXNlcl9wdF9yZWdzICopKHgpKQo+PiBA
QCAtMjQxLDcgKzI0MSw3IEBAIHN0cnVjdCBwdF9yZWdzX19fYXJtNjQgewo+PiDCoCAjZGVmaW5l
IF9fUFRfUEFSTTRfU1lTQ0FMTF9SRUcgX19QVF9QQVJNNF9SRUcKPj4gwqAgI2RlZmluZSBfX1BU
X1BBUk01X1NZU0NBTExfUkVHIF9fUFRfUEFSTTVfUkVHCj4+IMKgICNkZWZpbmUgX19QVF9QQVJN
Nl9TWVNDQUxMX1JFRyBfX1BUX1BBUk02X1JFRwo+PiAtI2RlZmluZSBQVF9SRUdTX1BBUk0xX1NZ
U0NBTEwoeCkgUFRfUkVHU19QQVJNMV9DT1JFX1NZU0NBTEwoeCkKPj4gKyNkZWZpbmUgUFRfUkVH
U19QQVJNMV9TWVNDQUxMKHgpICgoKGNvbnN0IHN0cnVjdCBwdF9yZWdzX19fYXJtNjQgKikoeCkp
LT5vcmlnX3gwKQo+PiDCoCAjZGVmaW5lIFBUX1JFR1NfUEFSTTFfQ09SRV9TWVNDQUxMKHgpIFwK
Pj4gwqDCoMKgwqDCoCBCUEZfQ09SRV9SRUFEKChjb25zdCBzdHJ1Y3QgcHRfcmVnc19fX2FybTY0
ICopKHgpLCBfX1BUX1BBUk0xX1NZU0NBTExfUkVHKQo+IAo+IENvb2whCj4gCj4gQWNrZWQtYnk6
IFh1IEt1b2hhaSA8eHVrdW9oYWlAaHVhd2VpLmNvbT4KPiAKPiAKCldhaXQsIGl0IGJyZWFrcyB0
aGUgZm9sbG93aW5nIHRlc3Q6CgotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJv
Z3MvYnBmX3N5c2NhbGxfbWFjcm8uYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYv
cHJvZ3MvYnBmX3N5c2NhbGxfbWFjcm8uYwpAQCAtNDMsNyArNDMsNyBAQCBpbnQgQlBGX0tQUk9C
RShoYW5kbGVfc3lzX3ByY3RsKQoKICAgICAgICAgLyogdGVzdCBmb3IgUFRfUkVHU19QQVJNICov
CgotICAgICAgIGJwZl9wcm9iZV9yZWFkX2tlcm5lbCgmdG1wLCBzaXplb2YodG1wKSwgJlBUX1JF
R1NfUEFSTTFfU1lTQ0FMTChyZWFsX3JlZ3MpKTsKKyAgICAgICB0bXAgPSBQVF9SRUdTX1BBUk0x
X1NZU0NBTEwocmVhbF9yZWdzKTsKICAgICAgICAgYXJnMSA9IHRtcDsKICAgICAgICAgYnBmX3By
b2JlX3JlYWRfa2VybmVsKCZhcmcyLCBzaXplb2YoYXJnMiksICZQVF9SRUdTX1BBUk0yX1NZU0NB
TEwocmVhbF9yZWdzKSk7CiAgICAgICAgIGJwZl9wcm9iZV9yZWFkX2tlcm5lbCgmYXJnMywgc2l6
ZW9mKGFyZzMpLCAmUFRfUkVHU19QQVJNM19TWVNDQUxMKHJlYWxfcmVncykpOwoKRmFpbGVkIHdp
dGggdmVyaWZpZXIgcmVqZWN0aW9uOgoKMDogUjE9Y3R4KCkgUjEwPWZwMAo7IGludCBCUEZfS1BS
T0JFKGhhbmRsZV9zeXNfcHJjdGwpIEAgYnBmX3N5c2NhbGxfbWFjcm8uYzozMwowOiAoYmYpIHI2
ID0gcjEgICAgICAgICAgICAgICAgICAgICAgIDsgUjE9Y3R4KCkgUjZfdz1jdHgoKQo7IHBpZF90
IHBpZCA9IGJwZl9nZXRfY3VycmVudF9waWRfdGdpZCgpID4+IDMyOyBAIGJwZl9zeXNjYWxsX21h
Y3JvLmM6MzYKMTogKDg1KSBjYWxsIGJwZl9nZXRfY3VycmVudF9waWRfdGdpZCMxNCAgICAgIDsg
UjBfdz1zY2FsYXIoKQo7IGlmIChwaWQgIT0gZmlsdGVyX3BpZCkgQCBicGZfc3lzY2FsbF9tYWNy
by5jOjM5CjI6ICgxOCkgcjEgPSAweGZmZmY4MDAwODJlMGUwMDAgICAgICAgOyBSMV93PW1hcF92
YWx1ZShtYXA9YnBmX3N5c2Mucm9kYXRhLGtzPTQsdnM9NCkKNDogKDYxKSByMSA9ICoodTMyICop
KHIxICswKSAgICAgICAgICA7IFIxX3c9NjA3CjsgcGlkX3QgcGlkID0gYnBmX2dldF9jdXJyZW50
X3BpZF90Z2lkKCkgPj4gMzI7IEAgYnBmX3N5c2NhbGxfbWFjcm8uYzozNgo1OiAoNzcpIHIwID4+
PSAzMiAgICAgICAgICAgICAgICAgICAgIDsgUjBfdz1zY2FsYXIoc21pbj0wLHNtYXg9dW1heD0w
eGZmZmZmZmZmLHZhcl9vZmY9KDB4MDsgMHhmZmZmZmZmZikpCjsgaWYgKHBpZCAhPSBmaWx0ZXJf
cGlkKSBAIGJwZl9zeXNjYWxsX21hY3JvLmM6MzkKNjogKDVlKSBpZiB3MSAhPSB3MCBnb3RvIHBj
Kzk4ICAgICAgICA7IFIwX3c9NjA3IFIxX3c9NjA3CjsgcmVhbF9yZWdzID0gUFRfUkVHU19TWVND
QUxMX1JFR1MoY3R4KTsgQCBicGZfc3lzY2FsbF9tYWNyby5jOjQyCjc6ICg3OSkgcjggPSAqKHU2
NCAqKShyNiArMCkgICAgICAgICAgOyBSNl93PWN0eCgpIFI4X3c9c2NhbGFyKCkKOyB0bXAgPSBQ
VF9SRUdTX1BBUk0xX1NZU0NBTEwocmVhbF9yZWdzKTsgQCBicGZfc3lzY2FsbF9tYWNyby5jOjQ2
Cjg6ICg3OSkgcjEgPSAqKHU2NCAqKShyOCArMjcyKQpSOCBpbnZhbGlkIG1lbSBhY2Nlc3MgJ3Nj
YWxhcicKcHJvY2Vzc2VkIDggaW5zbnMgKGxpbWl0IDEwMDAwMDApIG1heF9zdGF0ZXNfcGVyX2lu
c24gMCB0b3RhbF9zdGF0ZXMgMCBwZWFrX3N0YXRlcyAwIG1hcmtfcmVhZCAwCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
