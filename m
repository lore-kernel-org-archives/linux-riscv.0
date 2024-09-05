Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B8BCD4F4E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 02:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIWNZI0c5t+ct5UWvvrbRLR5A7O+lpamTne4DGjFOa4=; b=JKKaXvhc2QSr4B
	K4ZBIeYH7kJvkxzFG3RmueVuziQx1BWYJW1T3EWQJ2GdNIOupTxzRNJ3pCP14d2W0J0rxGV53nv4q
	E6fRFKzKHu823R7r8+eLxfPZC0Q+b3O8YSdJMrAdyVmSsgJJERRdO2LDM1H28jT3YrVlIt6PIjchM
	BFmM9YY81j78R89riPzHVtaCNx61MXhmdBtn9xSPsFxwFf0EZttm9W8kqWkU1s1e19dk1Rr2wfOBa
	WXLYD7PDL5fidR47VinMa0mru0rG/1TcYFWFjG8Cky2HmX4KsB1C8aSIn2OyqXt1M+z/vhAoqzhcT
	MJl/KOsvztDMsbPs6T4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm2PA-00000006iWY-1QhE;
	Thu, 05 Sep 2024 02:39:28 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm2P5-00000006iRa-25AR
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 02:39:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wzk7s4dw2z4f3n5p
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 10:38:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 8842F1A0C7A
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 10:39:05 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgAHiMTIGdlmeCi2AQ--.35226S2;
	Thu, 05 Sep 2024 10:39:05 +0800 (CST)
Message-ID: <f7ada1f1-6a34-4414-8e45-9a912c74ad3b@huaweicloud.com>
Date: Thu, 5 Sep 2024 10:39:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/4] libbpf: Access first syscall argument
 with CO-RE direct read on arm64
Content-Language: en-US
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
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
 <79b30c83-ee5e-453d-981e-61f826cf82d7@huaweicloud.com>
 <CAEf4BzZ4M5GK6_hopdL-8k+=-g975LoY71r6_YKdj-PxXthaMg@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <CAEf4BzZ4M5GK6_hopdL-8k+=-g975LoY71r6_YKdj-PxXthaMg@mail.gmail.com>
X-CM-TRANSID: gCh0CgAHiMTIGdlmeCi2AQ--.35226S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFW7WFy8Jw1kZry8urWkCrg_yoWrCw18pF
	W8Ga4UCF18W34aka42g3y3GF13twsxtr4UXF97Ga4S9FWqgryrt3W2gFW3Cryavrs7CwsI
	vrnFkryxG3W7Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20240904_193924_146933_B312574F 
X-CRM114-Status: GOOD (  15.90  )
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

T24gOS81LzIwMjQgNDowNiBBTSwgQW5kcmlpIE5ha3J5aWtvIHdyb3RlOgo+IE9uIFNhdCwgQXVn
IDMxLCAyMDI0IGF0IDEyOjU34oCvQU0gWHUgS3VvaGFpIDx4dWt1b2hhaUBodWF3ZWljbG91ZC5j
b20+IHdyb3RlOgo+Pgo+PiBPbiA4LzMxLzIwMjQgMzoyNiBQTSwgWHUgS3VvaGFpIHdyb3RlOgo+
Pj4gT24gOC8zMS8yMDI0IDEyOjE5IFBNLCBQdSBMZWh1aSB3cm90ZToKPj4+PiBGcm9tOiBQdSBM
ZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4+Cj4+Pj4gQ3VycmVudGx5IFBUX1JFR1NfUEFS
TTEgU1lTQ0FMTCh4KSBpcyBjb25zaXN0ZW50IHdpdGggUFRfUkVHU19QQVJNMV9DT1JFCj4+Pj4g
U1lTQ0FMTCh4KSwgd2hpY2ggd2lsbCBpbnRyb2R1Y2UgdGhlIG92ZXJoZWFkIG9mIEJQRl9DT1JF
X1JFQUQoKSwgdGFraW5nCj4+Pj4gaW50byBhY2NvdW50IHRoZSByZWFkIHB0X3JlZ3MgY29tZXMg
ZGlyZWN0bHkgZnJvbSB0aGUgY29udGV4dCwgbGV0J3MgdXNlCj4+Pj4gQ08tUkUgZGlyZWN0IHJl
YWQgdG8gYWNjZXNzIHRoZSBmaXJzdCBzeXN0ZW0gY2FsbCBhcmd1bWVudC4KPj4+Pgo+Pj4+IFN1
Z2dlc3RlZC1ieTogQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9yZz4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+ICAg
IHRvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaCB8IDQgKystLQo+Pj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oIGIvdG9vbHMvbGliL2JwZi9icGZfdHJhY2lu
Zy5oCj4+Pj4gaW5kZXggZTdkOTM4MmVmZWIzLi4wNTFjNDA4ZTZhZWQgMTAwNjQ0Cj4+Pj4gLS0t
IGEvdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oCj4+Pj4gKysrIGIvdG9vbHMvbGliL2JwZi9i
cGZfdHJhY2luZy5oCj4+Pj4gQEAgLTIyMiw3ICsyMjIsNyBAQCBzdHJ1Y3QgcHRfcmVnc19fX3Mz
OTAgewo+Pj4+ICAgIHN0cnVjdCBwdF9yZWdzX19fYXJtNjQgewo+Pj4+ICAgICAgICB1bnNpZ25l
ZCBsb25nIG9yaWdfeDA7Cj4+Pj4gLX07Cj4+Pj4gK30gX19hdHRyaWJ1dGVfXygocHJlc2VydmVf
YWNjZXNzX2luZGV4KSk7Cj4+Pj4gICAgLyogYXJtNjQgcHJvdmlkZXMgc3RydWN0IHVzZXJfcHRf
cmVncyBpbnN0ZWFkIG9mIHN0cnVjdCBwdF9yZWdzIHRvIHVzZXJzcGFjZSAqLwo+Pj4+ICAgICNk
ZWZpbmUgX19QVF9SRUdTX0NBU1QoeCkgKChjb25zdCBzdHJ1Y3QgdXNlcl9wdF9yZWdzICopKHgp
KQo+Pj4+IEBAIC0yNDEsNyArMjQxLDcgQEAgc3RydWN0IHB0X3JlZ3NfX19hcm02NCB7Cj4+Pj4g
ICAgI2RlZmluZSBfX1BUX1BBUk00X1NZU0NBTExfUkVHIF9fUFRfUEFSTTRfUkVHCj4+Pj4gICAg
I2RlZmluZSBfX1BUX1BBUk01X1NZU0NBTExfUkVHIF9fUFRfUEFSTTVfUkVHCj4+Pj4gICAgI2Rl
ZmluZSBfX1BUX1BBUk02X1NZU0NBTExfUkVHIF9fUFRfUEFSTTZfUkVHCj4+Pj4gLSNkZWZpbmUg
UFRfUkVHU19QQVJNMV9TWVNDQUxMKHgpIFBUX1JFR1NfUEFSTTFfQ09SRV9TWVNDQUxMKHgpCj4+
Pj4gKyNkZWZpbmUgUFRfUkVHU19QQVJNMV9TWVNDQUxMKHgpICgoKGNvbnN0IHN0cnVjdCBwdF9y
ZWdzX19fYXJtNjQgKikoeCkpLT5vcmlnX3gwKQo+Pj4+ICAgICNkZWZpbmUgUFRfUkVHU19QQVJN
MV9DT1JFX1NZU0NBTEwoeCkgXAo+Pj4+ICAgICAgICBCUEZfQ09SRV9SRUFEKChjb25zdCBzdHJ1
Y3QgcHRfcmVnc19fX2FybTY0ICopKHgpLCBfX1BUX1BBUk0xX1NZU0NBTExfUkVHKQo+Pj4KPj4+
IENvb2whCj4+Pgo+Pj4gQWNrZWQtYnk6IFh1IEt1b2hhaSA8eHVrdW9oYWlAaHVhd2VpLmNvbT4K
Pj4+Cj4+Pgo+Pgo+PiBXYWl0LCBpdCBicmVha3MgdGhlIGZvbGxvd2luZyB0ZXN0Ogo+Pgo+IAo+
IFlvdSBtZWFuLCAqaWYgeW91IGNoYW5nZSB0aGUgZXhpc3RpbmcgdGVzdCBsaWtlIGJlbG93Kiwg
aXQgd2lsbCBicmVhaywKPiByaWdodD8gQW5kIHRoYXQncyBleHBlY3RlZCwgYmVjYXVzZSBhcm02
NCBoYXMKPiBBUkNIX0hBU19TWVNDQUxMX1dSQVBQRVIsIHdoaWNoIG1lYW5zIHN5c2NhbGwgcHRf
cmVncyBhcmUgYWN0dWFsbHkgbm90Cj4gdGhlIGtwcm9iZSdzIGN0eCwgc28geW91IGNhbid0IGRp
cmVjdGx5IGFjY2VzcyBpdC4gV2hpY2ggaXMgd2h5IHdlCj4gaGF2ZSBQVF9SRUdTX1BBUk0xX0NP
UkVfU1lTQ0FMTCgpIHZhcmlhbnRzLgo+IAo+IFNlZSBob3cgQlBGX0tTWVNDQUxMIG1hY3JvIGlz
IGltcGxlbWVudGVkLCB0aGVyZSBhcmUgdHdvIGNhc2VzOgo+IF9fX2JwZl9zeXN3YXBfYXJncygp
LCB3aGljaCB1c2VzIEJQRl9DT1JFX1JFQUQoKS1iYXNlZCBtYWNyb3MgdG8gZmV0Y2gKPiBhcmd1
bWVudHMsIGFuZCBfX19icGZfc3lzY2FsbF9hcmdzKCkgd2hpY2ggdXNlcyBkaXJlY3QgY3R4IHJl
YWRzLgo+CgpHb3QgaXQsIHRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLgoKPiAKPj4gLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL2JwZl9zeXNjYWxsX21hY3JvLmMKPj4g
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL2JwZl9zeXNjYWxsX21hY3Jv
LmMKPj4gQEAgLTQzLDcgKzQzLDcgQEAgaW50IEJQRl9LUFJPQkUoaGFuZGxlX3N5c19wcmN0bCkK
Pj4KPj4gICAgICAgICAgIC8qIHRlc3QgZm9yIFBUX1JFR1NfUEFSTSAqLwo+Pgo+PiAtICAgICAg
IGJwZl9wcm9iZV9yZWFkX2tlcm5lbCgmdG1wLCBzaXplb2YodG1wKSwgJlBUX1JFR1NfUEFSTTFf
U1lTQ0FMTChyZWFsX3JlZ3MpKTsKPj4gKyAgICAgICB0bXAgPSBQVF9SRUdTX1BBUk0xX1NZU0NB
TEwocmVhbF9yZWdzKTsKPj4gICAgICAgICAgIGFyZzEgPSB0bXA7Cj4+ICAgICAgICAgICBicGZf
cHJvYmVfcmVhZF9rZXJuZWwoJmFyZzIsIHNpemVvZihhcmcyKSwgJlBUX1JFR1NfUEFSTTJfU1lT
Q0FMTChyZWFsX3JlZ3MpKTsKPj4gICAgICAgICAgIGJwZl9wcm9iZV9yZWFkX2tlcm5lbCgmYXJn
Mywgc2l6ZW9mKGFyZzMpLCAmUFRfUkVHU19QQVJNM19TWVNDQUxMKHJlYWxfcmVncykpOwo+Pgo+
PiBGYWlsZWQgd2l0aCB2ZXJpZmllciByZWplY3Rpb246Cj4+Cj4+IDA6IFIxPWN0eCgpIFIxMD1m
cDAKPj4gOyBpbnQgQlBGX0tQUk9CRShoYW5kbGVfc3lzX3ByY3RsKSBAIGJwZl9zeXNjYWxsX21h
Y3JvLmM6MzMKPj4gMDogKGJmKSByNiA9IHIxICAgICAgICAgICAgICAgICAgICAgICA7IFIxPWN0
eCgpIFI2X3c9Y3R4KCkKPj4gOyBwaWRfdCBwaWQgPSBicGZfZ2V0X2N1cnJlbnRfcGlkX3RnaWQo
KSA+PiAzMjsgQCBicGZfc3lzY2FsbF9tYWNyby5jOjM2Cj4+IDE6ICg4NSkgY2FsbCBicGZfZ2V0
X2N1cnJlbnRfcGlkX3RnaWQjMTQgICAgICA7IFIwX3c9c2NhbGFyKCkKPj4gOyBpZiAocGlkICE9
IGZpbHRlcl9waWQpIEAgYnBmX3N5c2NhbGxfbWFjcm8uYzozOQo+PiAyOiAoMTgpIHIxID0gMHhm
ZmZmODAwMDgyZTBlMDAwICAgICAgIDsgUjFfdz1tYXBfdmFsdWUobWFwPWJwZl9zeXNjLnJvZGF0
YSxrcz00LHZzPTQpCj4+IDQ6ICg2MSkgcjEgPSAqKHUzMiAqKShyMSArMCkgICAgICAgICAgOyBS
MV93PTYwNwo+PiA7IHBpZF90IHBpZCA9IGJwZl9nZXRfY3VycmVudF9waWRfdGdpZCgpID4+IDMy
OyBAIGJwZl9zeXNjYWxsX21hY3JvLmM6MzYKPj4gNTogKDc3KSByMCA+Pj0gMzIgICAgICAgICAg
ICAgICAgICAgICA7IFIwX3c9c2NhbGFyKHNtaW49MCxzbWF4PXVtYXg9MHhmZmZmZmZmZix2YXJf
b2ZmPSgweDA7IDB4ZmZmZmZmZmYpKQo+PiA7IGlmIChwaWQgIT0gZmlsdGVyX3BpZCkgQCBicGZf
c3lzY2FsbF9tYWNyby5jOjM5Cj4+IDY6ICg1ZSkgaWYgdzEgIT0gdzAgZ290byBwYys5OCAgICAg
ICAgOyBSMF93PTYwNyBSMV93PTYwNwo+PiA7IHJlYWxfcmVncyA9IFBUX1JFR1NfU1lTQ0FMTF9S
RUdTKGN0eCk7IEAgYnBmX3N5c2NhbGxfbWFjcm8uYzo0Mgo+PiA3OiAoNzkpIHI4ID0gKih1NjQg
KikocjYgKzApICAgICAgICAgIDsgUjZfdz1jdHgoKSBSOF93PXNjYWxhcigpCj4+IDsgdG1wID0g
UFRfUkVHU19QQVJNMV9TWVNDQUxMKHJlYWxfcmVncyk7IEAgYnBmX3N5c2NhbGxfbWFjcm8uYzo0
Ngo+PiA4OiAoNzkpIHIxID0gKih1NjQgKikocjggKzI3MikKPj4gUjggaW52YWxpZCBtZW0gYWNj
ZXNzICdzY2FsYXInCj4+IHByb2Nlc3NlZCA4IGluc25zIChsaW1pdCAxMDAwMDAwKSBtYXhfc3Rh
dGVzX3Blcl9pbnNuIDAgdG90YWxfc3RhdGVzIDAgcGVha19zdGF0ZXMgMCBtYXJrX3JlYWQgMAo+
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
