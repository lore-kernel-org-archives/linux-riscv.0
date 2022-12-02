Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD32C4708E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjPwlDD06mw1mqZvuI43NUo514PxbUlWmOlc52lDn1o=; b=5Ej5knttLdVZ2Q
	37V1vm3cUN3Gcc3dcmsmDQoNxYtwSRES8WVc5tt1zdzY4iaVvbBA1TIlFX8AohRv7pVvUwJJbHrzI
	oFrHz4ho9RQtUzyXqXOBm0wIBk005QKCt+t5i3sfZfP3gGMu3DgS9Y7fCtlgY0hP3IG9P/D4gZg3E
	VjydQSEnvfUk9PF0Jer+yaNE5dw6Fw/7JmqQgu5QmV25Jc/OV/noZiw0pt9Eu82fAGnWGAXgqXM/B
	3UR2jMw0s1vjQxN37a/dKE+MhzRTcjbwrXA+CybrxR8a4/TqX1ajx3Bz0NxGXtXZfqDc+KLgI0tQQ
	Raa3HYFHHvBnsSBBIOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12oI-00FCy0-5U; Fri, 02 Dec 2022 09:58:22 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12oD-00FCr8-Kf
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 09:58:20 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NNpKP6zRZz4f3tpw
	for <linux-riscv@lists.infradead.org>; Fri,  2 Dec 2022 17:58:01 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgCXrLcrzIljyuECBg--.34797S2;
	Fri, 02 Dec 2022 17:58:05 +0800 (CST)
Message-ID: <85c21f52-2059-f6bb-bbc1-d610cb107995@huaweicloud.com>
Date: Fri, 2 Dec 2022 17:58:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf] riscv, bpf: Emit fixed-length imm64 for
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
References: <20221130033806.2967822-1-pulehui@huaweicloud.com>
 <87h6yg1xlo.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87h6yg1xlo.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: Syh0CgCXrLcrzIljyuECBg--.34797S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw15ZF4xKry3WrWUXF1xGrg_yoW5XF13pF
	WUKw4fCF4kXr1xKr1aqr4Yqr1YyF40qF47Wr1aqay5Kryj9Fn29F1DKws8KasxZry8GF13
	JFyjgrnxCa4DA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_015818_044405_6DA60232 
X-CRM114-Status: GOOD (  16.39  )
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

CgpPbiAyMDIyLzExLzMwIDE5OjM4LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IFB1IExlaHVpIDxw
dWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVzOgo+IAo+PiBGcm9tOiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPgo+Pgo+PiBGb3IgQlBGX1BTRVVET19GVU5DIGluc3RydWN0aW9uLCB2
ZXJpZmllciB3aWxsIHJlZmlsbCBpbW0gd2l0aAo+PiBjb3JyZWN0IGFkZHJlc3NlcyBvZiBicGZf
Y2FsbHMgYW5kIHRoZW4gcnVuIGxhc3QgcGFzcyBvZiBKSVQuCj4+IFNpbmNlIHRoZSBlbWl0X2lt
bSBvZiBSVjY0IGlzIHZhcmlhYmxlLWxlbmd0aCwgd2hpY2ggd2lsbCBlbWl0Cj4+IGFwcHJvcHJp
YXRlIGxlbmd0aCBpbnN0cnVjdGlvbnMgYWNjb3Jyb2RpbmcgdG8gdGhlIGltbSwgaXQgbWF5Cj4+
IGJyb2tlIGN0eC0+b2Zmc2V0LCBhbmQgbGVhZCB0byB1bnByZWRpY3RhYmxlIHByb2JsZW0sIHN1
Y2ggYXMKPj4gaW5hY2N1cmF0ZSBqdW1wLiBTbyBsZXQncyBmaXggaXQgd2l0aCBmaXhlZC1sZW5n
dGggaW1tNjQgaW5zbnMuCj4gCj4gQWgsIG5pY2Ugb25lISBTbywgdGhlIHRoZSBpbnZhcmlhbnQg
ZG9lc24ndCBob2xkICh0aGUgaW1hZ2UgZ3JvdyBpbiB0aGUKPiBsYXN0IHBhc3MpLgo+IAo+PiBG
aXhlczogNjljMDg3YmE2MjI1ICgiYnBmOiBBZGQgYnBmX2Zvcl9lYWNoX21hcF9lbGVtKCkgaGVs
cGVyIikKPiAKPiBUaGlzIGlzIG9kZD8gVGhpcyBjYW4ndCBiZSB0aGUgcmlnaHQgRml4ZXMtdGFn
Li4uCj4gCgpPbmx5IEJQRl9QU0VVRE9fRlVOQyBpbnN0cnVjdGlvbiBuZWVkIGV4dHJhIGppdCBw
YXNzIGFmdGVyIHJlZmlsbCBpbW0gaW4gCmppdF9zdWJwcm9ncy4gT3RoZXJzLCBsaWtlIGJwZiBo
ZWxwZXIgY2FsbCwgd2lsbCB1cGRhdGUgY3R4LT5vZmZzZXQgaW4gCmppdCBpdGVyYXRpb25zLiBT
byB0aGUgZml4ZXMtdGFnIGlzIDY5YzA4N2JhNjIyNS4KCj4+IFNpZ25lZC1vZmYtYnk6IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGFyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvbXA2NC5jCj4+IGluZGV4IGViOTlkZjQxZmEzMy4uZjk4NGQ1ZmEwMTRiIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+ICsrKyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gQEAgLTEzOSw2ICsxMzksMzAgQEAgc3RhdGlj
IGJvb2wgaW5fYXVpcGNfamFscl9yYW5nZShzNjQgdmFsKQo+PiAgIAkJdmFsIDwgKCgxTCA8PCAz
MSkgLSAoMUwgPDwgMTEpKTsKPj4gICB9Cj4+ICAgCj4+ICsvKiBFbWl0IGZpeGVkLWxlbmd0aCBp
bnN0cnVjdGlvbnMgZm9yIDMyLWJpdCBpbW0gKi8KPj4gK3N0YXRpYyB2b2lkIGVtaXRfZml4ZWRf
aW1tMzIodTggcmQsIHMzMiB2YWwsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+PiArewo+
PiArCXMzMiB1cHBlciA9ICh2YWwgKyAoMVUgPDwgMTEpKSA+PiAxMjsKPj4gKwlzMzIgbG93ZXIg
PSAoKHZhbCAmIDB4ZmZmKSA8PCAyMCkgPj4gMjA7Cj4+ICsKPj4gKwllbWl0KHJ2X2x1aShyZCwg
dXBwZXIpLCBjdHgpOwo+PiArCWVtaXQocnZfYWRkaShyZCwgcmQsIGxvd2VyKSwgY3R4KTsKPj4g
K30KPj4gKwo+PiArLyogRW1pdCBmaXhlZC1sZW5ndGggaW5zdHJ1Y3Rpb25zIGZvciA2NC1iaXQg
aW1tICovCj4+ICtzdGF0aWMgdm9pZCBlbWl0X2ZpeGVkX2ltbTY0KHU4IHJkLCBzNjQgdmFsLCBz
dHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPj4gK3sKPj4gKwkvKiBDb21wZW5zYXRpb24gZm9y
IHNpZ24tZXh0ZW5zaW9uIG9mIHJ2X2FkZGkgKi8KPj4gKwlzMzIgaW1tX2hpID0gKHZhbCArICgx
VSA8PCAzMSkpID4+IDMyOwo+PiArCXMzMiBpbW1fbG8gPSB2YWw7Cj4+ICsKPj4gKwllbWl0X2Zp
eGVkX2ltbTMyKHJkLCBpbW1faGksIGN0eCk7Cj4+ICsJZW1pdF9maXhlZF9pbW0zMihSVl9SRUdf
VDEsIGltbV9sbywgY3R4KTsKPj4gKwllbWl0KHJ2X3NsbGkocmQsIHJkLCAzMiksIGN0eCk7Cj4+
ICsJZW1pdChydl9hZGQocmQsIHJkLCBSVl9SRUdfVDEpLCBjdHgpOwo+PiArfQo+IAo+IEhtbSwg
d2lsbCB0aGlzIHJlYWxseSBiZSBmaXhlZD8gV2UgY2FuIGVuZCB1cCB3aXRoIGNvbXByZXNzZWQK
PiBpbnN0cnVjdGlvbnMsIHdoaWNoIGNhbiB0aGVuIGJlIGEgbm9uLWNvbXByZXNzZWQgaW4gdGhl
IGxhc3QgcGFzcywgYW5kCj4gd2UgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtPwo+IAo+IFRoZSByYW5n
ZSBvZiB2YWxpZCBhZGRyZXNzIGZvciBSVjY0IChzdjM5IHRvIHN2NTcpIGFyZQo+IDB4ZmZmZmZm
ZmYwMDAwMDAwMCB0byAweGZmZmZmZmZmZmZmZmZmZmYsIHNvIEkgdGhpbmsgd2UgY2FuIGRvIGJl
dHRlcgo+IHRoYW4gNiBpbnNuLCBubz8gTXkgZ3V0IGZlZWxpbmcgKEkgbmVlZCB0byB0aW5rZXIg
YSBiaXQpIGlzIHRoYXQgNAo+IHNob3VsZCBiZSBzdWZmaWNpZW50Lgo+IAo+IE5vdGUgdGhhdCB3
b3JzdCBjYXNlIGZvciBhIGltbTY0IGxvYWQgYXJlIDggaW5zdHJ1Y3Rpb25zLCBidXQgdGhpcyBp
cwo+IG5vdCB0aGUgZ2VuZXJhbCBjYXNlLgo+IAo+IAo+IEJqw7ZybgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
