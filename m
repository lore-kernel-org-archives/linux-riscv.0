Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC4FC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnVWZyffV7oQhm4doxuUEHlerKli9VAPX+V2JMKt6S0=; b=1yeN2TKVly5oOY
	JsB1XA5ZbGOF8NaxVoTgw+7t/YqNfNniZyO6j+gi38ZOVOMCoshXJmONLPo3I8RbyaAeu3Rmq7dG9
	HOF+Rzt5oM4mQPs8s1OhTAzzycAu1F1Ek4WlCdfvI4ZK3q/pl6Zrn1WqhqCM3u1wyMg0X1TerOZOz
	EKnMDmbPYKs2/+T+07q91MJXLyaWcmMpE0f8p7yxWFggX8N2nv8Z5CQk8RNU5AxOtQ8xecE73WMzm
	4pn+6qODbCx4rr7j4g4rdugkSwRxRhbolB91dRvBcyLqXyuLGMGEU2UAp+yDOKsgHY4Cl4RH8ibOA
	1jncccrt8oLEPeYWHNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV7sW-00000002p4d-3rUZ;
	Wed, 31 Jan 2024 10:31:36 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6o7-00000002Qdo-3Jmr
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 09:23:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TPxQN4cqrz4f3m7R
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 17:22:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 2A5771A0283
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 17:22:43 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgB3RxBiEbplO4QjCg--.58547S2;
	Wed, 31 Jan 2024 17:22:42 +0800 (CST)
Message-ID: <050c301e-dfd0-4488-bc3c-0287da838981@huaweicloud.com>
Date: Wed, 31 Jan 2024 17:22:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Andrew Jones <ajones@ventanamicro.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
 <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
 <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
 <8734ufwdic.fsf@all.your.base.are.belong.to.us>
 <b1bf2bc8-870d-40a4-9ad2-2b4ced34c43f@huawei.com>
 <87o7d2ohdi.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87o7d2ohdi.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: cCh0CgB3RxBiEbplO4QjCg--.58547S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw15Ww1fKr43ur4UKw1rZwb_yoW5Ar4fpr
	48JFWYkw4kGF17Krn7tF18WrW5tr4rJw13WrnrXFWUJFWq9w17Krs5J3Wj9F1kXryxKr10
	vFW3Xw1fua1jya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UWwZcUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_012300_225984_06C16603 
X-CRM114-Status: GOOD (  12.74  )
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

CgpPbiAyMDI0LzEvMzEgMTozNCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPiB3cml0ZXM6Cj4gCj4+IE9uIDIwMjQvMS8zMCAxNDoxOCwgQmrDtnJu
IFTDtnBlbCB3cm90ZToKPj4+IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+
IHdyaXRlczoKPj4+Cj4+Pj4gT24gMS8yOS8yNCAxMDoxMyBBTSwgUHUgTGVodWkgd3JvdGU6Cj4+
Pj4+IE9uIDIwMjQvMS8yOCAxOjE2LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4+Pj4gUHUgTGVo
dWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4+Pj4+Pgo+Pj4+Pj4+IEZyb206
IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBBZGQgbmVjZXNz
YXJ5IFpiYiBpbnN0cnVjdGlvbnMgaW50cm9kdWNlZCBieSBbMF0gdG8gcmVkdWNlIGNvZGUgc2l6
ZSBhbmQKPj4+Pj4+PiBpbXByb3ZlIHBlcmZvcm1hbmNlIG9mIFJWNjQgSklULiBNZWFud2hpbGUs
IGEgcnVudGltZSBkZXRldGVkIGhlbHBlciBpcwo+Pj4+Pj4+IGFkZGVkIHRvIGNoZWNrIHdoZXRo
ZXIgdGhlIENQVSBzdXBwb3J0cyBaYmIgaW5zdHJ1Y3Rpb25zLgo+Pj4+Pj4+Cj4+Pj4+Pj4gTGlu
azogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWJpdG1hbmlwL3JlbGVhc2VzL2Rvd25s
b2FkLzEuMC4wL2JpdG1hbmlwLTEuMC4wLTM4LWc4NjVlN2E3LnBkZiBbMF0KPj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+
Pj4+ICAgwqAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oIHwgMzIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4+Pj4+PiAgIMKgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25z
KCspCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5o
IGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4+Pj4+Pj4gaW5kZXggZTMwNTAxYjQ2ZjhmLi41
MWY2ZDIxNDA4NmYgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5o
Cj4+Pj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4+Pj4+Pj4gQEAgLTE4LDYg
KzE4LDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBydmNfZW5hYmxlZCh2b2lkKQo+Pj4+Pj4+ICAg
wqDCoMKgwqDCoCByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX0MpOwo+Pj4+Pj4+
ICAgwqAgfQo+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcnZ6YmJfZW5hYmxlZCh2b2lkKQo+
Pj4+Pj4+ICt7Cj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1Zf
SVNBX1pCQikgJiYgcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQkIp
Owo+Pj4+Pj4KPj4+Pj4+IEhtbSwgSSdtIHRoaW5raW5nIGFib3V0IHRoZSBJU19FTkFCTEVEKENP
TkZJR19SSVNDVl9JU0FfWkJCKSBzZW1hbnRpY3MKPj4+Pj4+IGZvciBhIGtlcm5lbCBKSVQgY29t
cGlsZXIuCj4+Pj4+Pgo+Pj4+Pj4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgYWZm
ZWN0cyB0aGUga2VybmVsIGNvbXBpbGVyIGZsYWdzLgo+Pj4+Pj4gU2hvdWxkIGl0IGJlIGVub3Vn
aCB0byBqdXN0IGhhdmUgdGhlIHJ1bi10aW1lIGNoZWNrPyBTaG91bGQgYSBrZXJuZWwKPj4+Pj4+
IGJ1aWx0IHcvbyBaYmIgYmUgYWJsZSB0byBlbWl0IFpiYiBmcm9tIHRoZSBKSVQ/Cj4+Pj4+Cj4+
Pj4+IE5vdCBlbm91Z2gsIGJlY2F1c2UgcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1Zf
SVNBX0VYVF9aQkIpIGlzCj4+Pj4+IGEgcGxhdGZvcm0gY2FwYWJpbGl0eSBjaGVjaywgYW5kIHRo
ZSBvdGhlciBvbmUgaXMgYSBrZXJuZWwgaW1hZ2UKPj4+Pj4gY2FwYWJpbGl0eSBjaGVjay4gV2Ug
Y2FuIHBhc3MgdGhlIGNoZWNrCj4+Pj4+IHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NW
X0lTQV9FWFRfWkJCKSB3aGVuCj4+Pj4+IENPTkZJR19SSVNDVl9JU0FfWkJCPW4uIEFuZCBteSBs
b2NhbCB0ZXN0IHByb3ZlIGl0Lgo+Pj4KPj4+IFdoYXQgSSdtIHRyeWluZyB0byBzYXkgKGFuZCBk
cmV3IGFzIHdlbGwgaW4gdGhlIG90aGVyIHJlcGx5KSBpcyB0aGF0Cj4+PiAicmlzY3ZfaGFzX2V4
dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQkIpIHdoZW4KPj4+IENPTkZJR19SSVNDVl9J
U0FfWkJCPW4iIHNob3VsZCBhbHNvIG1ha2UgdGhlIEpJVCBlbWl0IFpiYiBpbnNucy4gVGhlCj4+
PiBwbGF0Zm9ybSBjaGVjayBzaG91bGQgYmUgc3VmZmljaWVudC4KPj4KPj4gT29oLCB0aGlzIGlz
IHJlYWxseSBiZXlvbmQgbXkgZXhwZWN0YXRpb24uIFRoZSB0ZXN0X3Byb2dzIGNhbiBwYXNzIHdo
ZW4KPj4gd2l0aCBvbmx5IHBsYXRmb3JtIGNoZWNrIGFuZCBpdCBjYW4gcmVjb2duaXplIHRoZSB6
YmIgaW5zdHJ1Y3Rpb25zLiBOb3cKPj4gSSBrbm93IGl0LiBTb3JyeSBmb3IgbWlzbGVhZGluZy7w
n5mBCj4+Cj4+IEN1cmlvdXMgaWYgQ09ORklHX1JJU0NWX0lTQV9aQkIgaXMgc3RpbGwgbmVjZXNz
YXJ5Pwo+IAo+IFlvdSBkb24ndCBuZWVkIElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9aQkIp
IGZvciB0aGUgSklULCBidXQgdGhlCj4ga2VybmVsIG5lZWRzIGl0Lgo+IAo+IEZlZWwgZnJlZSB0
byBmb2xsb3cgdXAgd2l0aCBhIHBhdGNoIHRvIHJlbW92ZSBpdC4KPiAKCk1heWJlIHdlIGNhbiBp
bXBsZW1lbnQgbW9yZSBleHRlbnNpb25zIGFib3V0IGJpdG1hbmlwLgoKPiAKPiBDaGVlcnMsCj4g
QmrDtnJuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
