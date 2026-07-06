Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4453C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJTBNYBLEizxmODBV7PSYxSNK+OB8+9uol+WANvU9VU=; b=As1g7JSrg/a/VI
	xo3lU8nOnMMkRJzHBY/aNbH6KEznQE/fPbV+vgnw4fq73cr6c0qK7QqoYJTCvka/FJrF4hlIWu3Tp
	2jyd7sGkUZVN7lAa+bSYtKBsXzUCmXSO+66ItrU1Zcivh3NaT9ixzQMxEJ44IdiFjk3ZeD+ZdSHCp
	DC+gi983AkV4u8/afcSg/Yi+WS6W3RctEe5OIY1cVvVzggAxh4sJejqhAa3vcLi99Av6eQoX1QS+9
	Cl2ahoR1Lbc8jZHqKUG4xF4Gt/HE8lp6gizKaUD8ctAjyUQw6Is1a0BsmL/d71X/b0E6oTzI/00pq
	bM2XcGu4mgftRfwYYBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdSB-0000000BhBC-2IGx;
	Mon, 06 Jul 2026 07:09:19 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdS8-0000000BhAX-025A
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 07:09:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gtwSt596gzYQtlX
	for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2026 15:09:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id E55274095A
	for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2026 15:09:03 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgDnzCiJVEtq7aPxAA--.22259S2;
	Mon, 06 Jul 2026 15:09:03 +0800 (CST)
Message-ID: <468262e0-43c6-46dd-a9dc-0b216f2beab1@huaweicloud.com>
Date: Mon, 6 Jul 2026 15:08:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 0/6] Mixing bpf2bpf and tailcalls for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Pu Lehui <pulehui@huawei.com>,
 Pu Lehui <pulehui@huaweicloud.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
 <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
X-CM-TRANSID: Syh0CgDnzCiJVEtq7aPxAA--.22259S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy8XF18CFy7WrWkAr1kKrg_yoW5CF1kpa
	97uw4ay34vqr4xuw47Ka1xJFWrGFZ3CayUAr15tr1rAF45Cryvkr17KFW0va45GrWvkw1j
	vr4jqan8Za1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_000916_424829_6CC134E8 
X-CRM114-Status: GOOD (  19.96  )
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

SGkgQmrDtnJuLAoKU29ycnkgZm9yIGxhdGUgcmVwbHkuCgpPbiAyMDI2LzYvMjkgMjI6MjEsIEJq
w7ZybiBUw7ZwZWwgd3JvdGU6Cj4gSGV5IQo+IAo+IE9uIE1vbiwgMjkgSnVuIDIwMjYgYXQgMTU6
NTYsIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JvdGU6Cj4+Cj4+IEZyb206
IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Cj4+IEluIHRoZSBjdXJyZW50IFJWNjQg
SklULCBpZiB3ZSBqdXN0IGRvbid0IGluaXRpYWxpemUgdGhlIFRDQyBpbiBzdWJwcm9nLAo+PiB0
aGUgVENDIGNhbiBiZSBwcm9wYWdhdGVkIGZyb20gdGhlIHBhcmVudCBwcm9jZXNzIHRvIHRoZSBz
dWJwcm9jZXNzLCBidXQKPj4gdGhlIHVwZGF0ZWQgVENDIG9mIHRoZSBwYXJlbnQgcHJvY2VzcyBj
YW5ub3QgYmUgcmVzdG9yZWQgd2hlbiB0aGUKPj4gc3VicHJvY2VzcyBleGl0cy4gU2luY2UgdGhl
IFJWNjQgVENDIGlzIGluaXRpYWxpemVkIGJlZm9yZSBzYXZpbmcgdGhlCj4+IGNhbGxlZSBzYXZl
ZCByZWdpc3RlcnMgaW50byB0aGUgc3RhY2ssIHdlIGNhbm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZl
ZAo+PiByZWdpc3RlciB0byBwYXNzIHRoZSBUQ0MsIG90aGVyd2lzZSB0aGUgb3JpZ2luYWwgdmFs
dWUgb2YgdGhlIGNhbGxlZQo+PiBzYXZlZCByZWdpc3RlciB3aWxsIGJlIGRlc3Ryb3llZC4gU28g
d2UgaW1wbGVtZW50ZWQgbWl4aW5nIGJwZjJicGYgYW5kCj4+IHRhaWxjYWxscyBzaW1pbGFyIHRv
IHg4Nl82NCwgaS5lLiB1c2luZyBhIG5vbi1jYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8KPj4gdHJh
bnNmZXIgdGhlIFRDQyBiZXR3ZWVuIGZ1bmN0aW9ucywgYW5kIHNhdmluZyB0aGF0IHJlZ2lzdGVy
IHRvIHRoZQo+PiBzdGFjayB0byBwcm90ZWN0IHRoZSBUQ0MgdmFsdWUuIEFzIGZvciB0aGUgdGFp
bGNhbGwgaGllcmFyY2h5IGlzc3VlLAo+PiBpbnNwaXJlZCBieSB0aGUgczM5MCdzIGxvdy1vdmVy
aGVhZCBhcHByb2FjaCwgd2Ugc3RvcmUgVENDIGZyb20KPj4gUlZfUkVHX1RDQyBiYWNrIHRvIHN0
YWNrIGFmdGVyIGNhbGxpbmcgYnBmMmJwZiBjYWxsIG9yIGNhbGxpbmcgb3JpZyBicGYKPj4gZnVu
YyBpbiBicGYgdHJhbXBvbGluZS4KPj4KPj4gSW4gYWRkaXRpb24sIHNvbWUgY29kZSBjbGVhbnMg
YXJlIGFsc28gYXR0YWNoZWQgdG8gdGhpcyBwYXRjaHNldC4KPj4KPj4gVGVzdHMgdGVzdF9icGYu
a28gYW5kIHRlc3RfdmVyaWZpZXIgaGF2ZSBwYXNzZWQsIGFzIHdlbGwgYXMgdGhlIHJlbGF0aXZl
Cj4+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4KPj4KPj4gdjQ6Cj4+IC0gRml4IHRhaWxjYWxs
IGhpZXJhcmNoeSBpc3N1ZS4KPj4gLSB1c2UgaXNfc3RydWN0X29wc190cmFtcCBoZWxwZXIgaW4g
YnBmIHRyYW1wb2xpbmUKPiAKPiBBbGV4ZWkgb3V0bGluZWQgc29tZSAobWFqb3IpIGNvbmNlcm5z
IG9uIHRoZSB3aG9sZSBtaXhpbmcgc2lkZSBvZgo+IHRoaW5ncyBbMF0uIEkgaGF2ZW4ndCBiZWVu
IGZvbGxvd2luZyB0aGF0IHNwYWNlIC0tIGRpZCBMZW9uIGhhdmUgYQoKWWVzLCBMZW9uIGFkZHJl
c3NlZCB0aGlzIGlzc3VlIHllYXJzIGFnbyBbMF0uIEhlIHNvbHZlZCBpdCBieSBwYXNzaW5nIAp0
aGUgVENDIFBUUiB0byB0aGUgc3VicHJvZywgZW5zdXJpbmcgdGhhdCB0aGUgdXBkYXRlZCBUQ0Mg
aXMgY29ycmVjdGx5IApwcm9wYWdhdGVkIGJhY2sgdXBvbiB0aGUgc3VicHJvZydzIHJldHVybi4g
SXQncyB0aW1lIGZvciByaXNjdjY0IHRvIAppbXBsZW1lbnQgdGhpcyBmZWF0dXJlLgoKWzBdIApo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FBRG5WUStUT0ZPQTBZYTRxenJMREZWMzMxdXha
eThheTBzdkJNdC0yU2g1RTB0cjJBQG1haWwuZ21haWwuY29tLwoKPiB3b3JrYXJvdW5kL2ZpeD8g
Q2FuIHlvdSBleHBsYWluIG1vcmUgaG93IHlvdSBmaXhlZCBpdCwgYW5kIHdoeSBpdAo+IHdvdWxk
IG1ha2Ugc2Vuc2UgdG8gYWRkIGl0IHRvIFJJU0MtViBub3c/CgpXaGVuIGRlYWxpbmcgd2l0aCB0
aGUgdGFpbGNhbGwgaGllcmFyY2h5IGlzc3VlLCB4NjQgYW5kIGFybTY0IGNoZWNrIGlmIGEgCnJl
Z2lzdGVyIGlzIGEgVENDIFBUUiByaWdodCBpbiB0aGUgZnVuY3Rpb24gcHJvbG9ndWUsIHdoaWNo
IG1heSBhZGRzIApzb21lIG92ZXJoZWFkLiBUbyBnZXQgYXJvdW5kIHRoaXMsIHJpc2N2NjQgcGxh
biB0byBwYXNzIHRoZSB1cGRhdGVkIFRDQyAKdmFsdWUgdG8gdGhlIHN0YWNrIHVzaW5nIHRoZSBU
Q0MgcmVnaXN0ZXIgYWZ0ZXIgY2FsbGluZyBhIHN1YnByb2cgb3IgYSAKdHJhbXBvbGluZSdzIG9y
aWdfY2FsbCwgd2hpY2ggc29tZXRoaW5nIHNpbWlsYXIgdG8gczM5MC4KCkJlY2F1c2Ugb2YgdGhp
cywgd2UgaGF2ZSB0byB1c2UgYSBjYWxsZXItc2F2ZWQgKG5vbi1jYWxsZWUtc2F2ZWQpIApyZWdp
c3RlciBmb3IgdGhlIFRDQy4gSWYgd2UgdXNlZCBhIGNhbGxlZS1zYXZlZCBvbmUsIHRoZSBvbGQg
VENDIHZhbHVlIAp3b3VsZCBqdXN0IGdldCByZXN0b3JlZCBieSBtaXN0YWtlIHdoZW4gdGhlIGZ1
bmN0aW9uIHJldHVybnMuCgpBcyBmb3IgdGhlIG92ZXJhbGwgcGxhbiBmb3IgbWl4aW5nIHRhaWxj
YWxscyBhbmQgYnBmMmJwZiwgdGhlIG1haW4gaWRlYSAKaXMgdG8ga2VlcCB0aGUgVENDIHZhbHVl
IG9uIHRoZSBzdGFjayBhbmQgcGFzcyBpdCBiZXR3ZWVuIGZ1bmN0aW9uIGNhbGxzIAp1c2luZyB0
aGF0IGNhbGxlci1zYXZlZCBUQ0MgcmVnaXN0ZXIuIFNpbmNlIHdlIG5lZWQgdG8gZ3JhYiB0aGUg
bGF0ZXN0IAp1cGRhdGVkIFRDQyB2YWx1ZSBhZnRlciBjYWxsaW5nIGEgc3VicHJvZyBvciBhIHRh
aWxjYWxsIGxlYWYgbm9kZSwgd2UgCmhhdmUgdG8gbWFrZSBzdXJlIHRoZSBwcm9sb2d1ZSBhbHdh
eXMgcHVzaGVzIHRoZSBUQ0MgdG8gdGhlIHN0YWNrLCBhbmQgCnRoZSBlcGlsb2d1ZSBhbHdheXMg
cmVzdG9yZXMgaXQgZnJvbSB0aGUgc3RhY2sgYmFjayBpbnRvIHRoZSBUQ0MgcmVnaXN0ZXIuCgo+
IAo+IFRoYW5rcywKPiBCasO2cm4KPiAKPiAKPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnBmL0NBQURuVlErckxuZU80dD1ZWW1MWXRjOTQ1RnowPXVjTlRXWkJ4Z3ZzOHRvRlktb25SZ0Bt
YWlsLmdtYWlsLmNvbS8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
