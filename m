Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B04CC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 03:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaAauxJdjHZuHtQczuNeDRZxXfCN8Kz/ofgSapeQGgU=; b=q813plUBQBCKuC
	+QSAFporEpXLk25h21JStAdZ7Uy427xu1jNmBRf2sLUfulLsPcMLSstB0ufFY0XWKyqDnmL/Yqokd
	LvxCCCfGCgzukLgHUFgxiRpUh0zZdD7++fIIG3XNbiSGQ52HIAXt8n1NLhwShuyodxLPcf7HVC3Ub
	uSsP9i7ArftO+q4teIQ4NbJDIjdXjLGjjMhDitPPAutFToeL5ex4UPqGUNylpKw+Yxdfb8ISImBfG
	aW6q4ODG8xnAm8wQuBewwHfsz0/MuioIjbtQo5p3xH/k9/LJgi8BUh5zWTqx5iDLsvR3ex8t/Kz49
	kK7q/0+7Cu7DmK7D6gKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Omb-00Ggnd-5D; Tue, 06 Dec 2022 03:38:13 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2OmY-00Gg6R-0r
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 03:38:12 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NR5hq3Cl9z4f3nVJ
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 11:37:47 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgDX+tcNuY5jyn7xBg--.3634S2;
	Tue, 06 Dec 2022 11:37:50 +0800 (CST)
Message-ID: <0ade59ea-6863-4d68-607c-22e4b9405a0d@huaweicloud.com>
Date: Tue, 6 Dec 2022 11:37:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf v2] riscv, bpf: Emit fixed-length instructions for
 BPF_PSEUDO_FUNC
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Pu Lehui <pulehui@huawei.com>
References: <20221202094837.3872444-1-pulehui@huaweicloud.com>
 <87y1rq848x.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87y1rq848x.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: gCh0CgDX+tcNuY5jyn7xBg--.3634S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw15ZF4ftw15Zw17WrW3ZFb_yoW5WF48pr
	W5KFy3CayvqrnrGF12yr4jvr1aqF4vqayxKr1UK34Yk3W2gF4IkF1DG390k3Z5ZFW8Gw13
	JF4j9rsxCa4DZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07UZ18PUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_193810_458348_54CB4A9A 
X-CRM114-Status: GOOD (  14.03  )
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

CgpPbiAyMDIyLzEyLzIgMTg6NTQsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEZyb206IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4+Cj4+IEZvciBCUEZfUFNFVURPX0ZVTkMgaW5zdHJ1Y3Rpb24sIHZl
cmlmaWVyIHdpbGwgcmVmaWxsIGltbSB3aXRoCj4+IGNvcnJlY3QgYWRkcmVzc2VzIG9mIGJwZl9j
YWxscyBhbmQgdGhlbiBydW4gbGFzdCBwYXNzIG9mIEpJVC4KPj4gU2luY2UgdGhlIGVtaXRfaW1t
IG9mIFJWNjQgaXMgdmFyaWFibGUtbGVuZ3RoLCB3aGljaCB3aWxsIGVtaXQKPj4gYXBwcm9wcmlh
dGUgbGVuZ3RoIGluc3RydWN0aW9ucyBhY2NvcnJvZGluZyB0byB0aGUgaW1tLCBpdCBtYXkKPj4g
YnJva2UgY3R4LT5vZmZzZXQsIGFuZCBsZWFkIHRvIHVucHJlZGljdGFibGUgcHJvYmxlbSwgc3Vj
aCBhcwo+PiBpbmFjY3VyYXRlIGp1bXAuIFNvIGxldCdzIGZpeCBpdCB3aXRoIGZpeGVkLWxlbmd0
aCBpbnN0cnVjdGlvbnMuCj4+Cj4+IEZpeGVzOiA2OWMwODdiYTYyMjUgKCJicGY6IEFkZCBicGZf
Zm9yX2VhY2hfbWFwX2VsZW0oKSBoZWxwZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8
cHVsZWh1aUBodWF3ZWkuY29tPgo+PiBTdWdnZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQu
YyB8IDIwICsrKysrKysrKysrKysrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+IGlu
ZGV4IGViOTlkZjQxZmEzMy4uOTcyM2YzNGY3YTA2IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2
L25ldC9icGZfaml0X2NvbXA2NC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmMKPj4gQEAgLTEzOSw2ICsxMzksMTkgQEAgc3RhdGljIGJvb2wgaW5fYXVpcGNfamFscl9y
YW5nZShzNjQgdmFsKQo+PiAgIAkJdmFsIDwgKCgxTCA8PCAzMSkgLSAoMUwgPDwgMTEpKTsKPj4g
ICB9Cj4+ICAgCj4+ICsvKiBFbWl0IGZpeGVkLWxlbmd0aCBpbnN0cnVjdGlvbnMgZm9yIGFkZHJl
c3MgKi8KPj4gK3N0YXRpYyB2b2lkIGVtaXRfYWRkcih1OCByZCwgdTY0IGFkZHIsIHN0cnVjdCBy
dl9qaXRfY29udGV4dCAqY3R4KQo+PiArewo+PiArCXU2NCBpcCA9ICh1NjQpKGN0eC0+aW5zbnMg
KyBjdHgtPm5pbnNucyk7Cj4+ICsJczY0IG9mZiA9IGFkZHIgLSBpcDsKPj4gKwlzNjQgdXBwZXIg
PSAob2ZmICsgKDEgPDwgMTEpKSA+PiAxMjsKPj4gKwlzNjQgbG93ZXIgPSAoKG9mZiAmIDB4ZmZm
KSA8PCA1MikgPj4gNTI7Cj4+ICsKPj4gKwllbWl0KHJ2X2F1aXBjKHJkLCB1cHBlciksIGN0eCk7
Cj4+ICsJZW1pdChydl9hZGRpKHJkLCByZCwgbG93ZXIpLCBjdHgpOwo+PiArfQo+IAo+IE5pY2Uh
IFR3byBpbnN0cnVjdGlvbnMgYXJlIGJldHRlciB0aGFuIDYhIDotKQo+IAo+IE9uZSBmaW5hbCB0
aGluZy4gUGxlYXNlIGFkZCBhIHNhbml0eSBjaGVjaywgdGhhdCB0aGUgcmFuZ2UgaXMgY29ycmVj
dCwKPiBlLmcuOgo+IAo+ICAgIGlmICghKGFkZHIgJiYgaW5fYXVpcGNfYWRkaV9yYW5nZShvZmYp
KSkKPiAgICAgICByZXR1cm4gLTE7Cj4gCgpIaSBCasO2cm4sCgpTb3JyeSBmb3IgcmVwbHlpbmcg
c28gbGF0ZS4gRm9yIEJQRl9QU0VVRE9fRlVOQyBpbnN0cnVjdGlvbiwgdmVyaWZpZXIgCndpbGwg
c2V0IGluc25bMF0uaW1tIGFuZCBpbnNuWzFdLmltbSB0byAxIHRoYXQgbWFrZSBhZGRyIHRvIDB4
MTAwMDAwMDAxIApiZWZvcmUgZXh0cmEgcGFzcywgYW5kIGFsc28gY3R4LT5pbnNucyBpcyBOVUxM
IGluIGl0ZXJhdGlvbiBzdGFnZSwgYWxsIApvZiB0aGVzZSBtYWtlIG9mZiBvdXQgb2YgcmFuZ2Ug
b2YgQVVJUEMtQURESSByYW5nZSwgYW5kIHJldHVybiBmYWlsZWQuIApXZSBjb3VsZCBhZGQgc29t
ZSBzcGVjaWFsIGhhbmRsaW5nIGF0IGRpZmZlcmVudCBzdGFnZXMsIGJ1dCB0aGF0IHNlZW1zIGEg
CmxpdHRsZSB3ZWlyZC4gQnkgdGhlIHdheSwgSSBkbyBub3QgcmVhbGx5IGxpa2UgZW1pdF9hZGRy
IGZ1bmN0aW9uIHdpdGggCnJldHVybiB2YWx1ZS4KCldoaWxlIGEgcHJvcGVyIGFkZHJlc3MgaXMg
YXQgbGVhc3QgMkIgYWxpZ25tZW50LCBhbmQgdGhlIHZhbGlkIGFkZHJlc3MgCmlzIGZyb20gMHhm
ZmZmZmZmZjAwMDAwMDAwIHRvIDB4ZmZmZmZmZmZmZmZmZmZmZiwgd2UgY2FuIG1ha2UgYWRkcmVz
cyAKc2hpZmVkIDEgcGxhY2UgdG8gcmlnaHQsIGFuZCBhZGRyID4+IDEgd2lsbCBhbHdheXMgaW4g
dGhlIHJhbmdlIG9mIApBVUlQQy1BRERJIHJhbmdlLiBXZSBjYW4gZ2V0IHJpZCBvZiB0aGUgcmFu
Z2UgZGV0ZWN0aW9uLiBUaGUgCmltcGxlbWVudGF0aW9uIGlzIGFzIGZvbGxvd3M6CgpzdGF0aWMg
dm9pZCBlbWl0X2FkZHIodTggcmQsIHU2NCBhZGRyLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0
eCkKewogICAgICAgICAgczY0IGltbSA9IGFkZHIgPj4gMTsKICAgICAgICAgIHM2NCB1cHBlciA9
IChpbW0gKyAoMSA8PCAxMSkpID4+IDEyOwogICAgICAgICAgczY0IGxvd2VyID0gaW1tICYgMHhm
ZmY7CgogICAgICAgICAgZW1pdChydl9sdWkocmQsIHVwcGVyKSwgY3R4KTsKICAgICAgICAgIGVt
aXQocnZfYWRkaShyZCwgcmQsIGxvd2VyKSwgY3R4KTsKICAgICAgICAgIGVtaXQocnZfc2xsaShy
ZCwgcmQsIDEpLCBjdHgpOwp9CgpXaGF0IGRvIHlvdSB0aGluaz8KClJlZ2FyZHMsCkxlaHVpCgo+
IEhhdmUgYSBsb29rIGF0IGVtaXRfanVtcF9hbmRfbGluaygpLgo+IAo+IAo+IFRoYW5rcyEKPiBC
asO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
