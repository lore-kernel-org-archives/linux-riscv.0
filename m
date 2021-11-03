Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC03CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 07:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 764D3610FC
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 07:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 764D3610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iwloszdc1IUonfAOjnBMPQcx1XgUofcVpxu+tMHFYxk=; b=05zdClB/tRetP/FpGBtnoKJlZd
	mzAJkRm9KMCpgwY3GryyXdHSksdaO8cr7yAFiDPH5cPUSt76TxLU9ZKH9OuRVicsELaj1JYlSn3Bd
	N6JUIgzzhuVOSSjGtzEkbxBtl2ZsmVQ5VBMz++XNAVqtsFVnrvFaBdGlBcM1kP82lW4y58IVT4G+b
	rKafk0yU5hDNGop2sVi2phWabd09NC6gVjnsVUA9gcm2VrMhyVOZ65ijN99F2VvWAfuC5evGVr/8i
	84h9QJgRQqXaZXbov+s0XueVOLwBrS4dxVVv2v87zum02OmnzhgUeB3NoJ5GxZxI/jwncUFYk4y3I
	sPNxQNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miAfn-004Q0C-L4; Wed, 03 Nov 2021 07:27:03 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miAfk-004PyF-9b
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 07:27:02 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HkdZS0sGcz1DJ8Z;
 Wed,  3 Nov 2021 15:24:48 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 15:26:51 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 15:26:49 +0800
Subject: Re: [PATCH bpf-next] riscv, bpf: fix some compiler error
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
References: <20211102145642.724820-1-tongtiangen@huawei.com>
 <CAJ+HfNg1Ki=1Zc+ThW-ynvtDo5=fNAUK-XV08-icz-nY9CNoUQ@mail.gmail.com>
 <448599f5-e773-6ab5-bdaf-289f583edf01@huawei.com>
 <CAJ+HfNj_p36trWFzdyxVVgykrPVq=OvKcYq61w2QyKsHwa0gDw@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, bpf
 <bpf@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <f3ed7e48-c565-9147-eca0-6298a36b3d61@huawei.com>
Date: Wed, 3 Nov 2021 15:26:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJ+HfNj_p36trWFzdyxVVgykrPVq=OvKcYq61w2QyKsHwa0gDw@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_002700_994616_D407DBCF 
X-CRM114-Status: GOOD (  20.01  )
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

CgpPbiAyMDIxLzExLzMgMTQ6MTAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gT24gV2VkLCAzIE5v
diAyMDIxIGF0IDA0OjA2LCB0b25ndGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNvbT4gd3Jv
dGU6Cj4+Cj4gWy4uLl0KPj4+Cj4+IEhpIEJqw7ZybjoKPj4gIEZyb20gdGhlIHBlcnNwZWN0aXZl
IG9mIGRldmVsb3BtZW50LCBpbnRyb2R1Y2UgYXNtL2V4dGFibGUuaCBpcyBhbHNvIHByZXBhcmUg
Zm9yIHRoZQo+PiBzdWJzZXF1ZW50IG1vZGlmaWNhdGlvbiBvZiBleGNlcHRpb25fdGFibGVfZW50
cnksIHN1Y2ggYXM6Cj4+ICAgIDEuIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzEwLzIwLzU5
MQo+PiAgICAyLiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjEx
MDE5MTYwMjE5LjUyMDItMTEtbWFyay5ydXRsYW5kQGFybS5jb20vCj4+Cj4+IFRoZXJlZm9yZSwg
dGhlIHByb3RvdHlwZSBkZWNsYXJhdGlvbnMgYW5kIGRlZmluaXRpb25zIHJlbGF0ZWQgdG8ga2Vy
bmVsIGNvbmZpZyBhcmUgcGxhY2VkIGluIGhlYWQgZmlsZSwKPj4gd2hpY2ggY2FuIGF2b2lkIGNv
bXBpbGVyIGVycm9yIGFuZCBzaW1wbGlmeSB0aGUgcmVuZGVyaW5nIG9mIGZ1bmN0aW9ucy4KPj4K
Pgo+IFN1cmUsIGJ1dCAqdGhpcyogcGF0Y2ggaXMgYWJvdXQgZ2V0dGluZyB0aGUgYnJva2VuIFJW
MzIgYnVpbGQgdG8gd29yaywKPiBhaW1lZCBmb3IgdGhlIGJwZiB0cmVlLiBNb3ZpbmcgdGhlIGV4
dGFibGUuaCBpcyB1bnJlbGF0ZWQsIGFuZCBzaG91bGQKPiBub3QgYmUgZG9uZSBoZXJlLiBJTU8g
aXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgdGhpcyBwYXRjaCBzbWFsbC9lYXN5Cj4gdG8gcmVh
ZC4gSSBjYW4ndCByZWFsbHkgc2VlIGhvdyB0aGlzIHBhdGNoIGhlbHBzLCB3aGVuIG1lcmdpbmcg
d2l0aAo+IEppc2hlbmcncyB3b3JrLgo+Cj4gLi4uYW5kIEkgc3RpbGwgdGhpbmsgdGhhdDoKPiAt
LTg8LS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMgYi9hcmNoL3Jpc2N2
L21tL2V4dGFibGUuYwo+IGluZGV4IDE4YmYzMzgzMDNiNi4uZGRiN2QzYjk5ZTg5IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvbW0vZXh0YWJsZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9leHRh
YmxlLmMKPiBAQCAtMTEsNyArMTEsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4KPiAtI2lmZGVmIENPTkZJR19CUEZfSklUCj4g
KyNpZiBkZWZpbmVkKENPTkZJR19CUEZfSklUKSAmJiBkZWZpbmVkKENPTkZJR19BUkNIX1JWNjRJ
KQo+ICBpbnQgcnZfYnBmX2ZpeHVwX2V4Y2VwdGlvbihjb25zdCBzdHJ1Y3QgZXhjZXB0aW9uX3Rh
YmxlX2VudHJ5ICpleCwKPiBzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gICNlbmRpZgo+Cj4gQEAg
LTIzLDcgKzIzLDcgQEAgaW50IGZpeHVwX2V4Y2VwdGlvbihzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiAgICAgICAgIGlmICghZml4dXApCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gLSNp
ZmRlZiBDT05GSUdfQlBGX0pJVAo+ICsjaWYgZGVmaW5lZChDT05GSUdfQlBGX0pJVCkgJiYgZGVm
aW5lZChDT05GSUdfQVJDSF9SVjY0SSkKPiAgICAgICAgIGlmIChyZWdzLT5lcGMgPj0gQlBGX0pJ
VF9SRUdJT05fU1RBUlQgJiYgcmVncy0+ZXBjIDwgQlBGX0pJVF9SRUdJT05fRU5EKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gcnZfYnBmX2ZpeHVwX2V4Y2VwdGlvbihmaXh1cCwgcmVncyk7Cj4g
ICNlbmRpZgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IGluZGV4IDJjYTM0NWM3YjBiZi4uNjM3
MmEyMzU1MjJkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMK
PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gQEAgLTQ1OSw2ICs0NTks
OCBAQCBzdGF0aWMgaW50IGVtaXRfY2FsbChib29sIGZpeGVkLCB1NjQgYWRkciwgc3RydWN0Cj4g
cnZfaml0X2NvbnRleHQgKmN0eCkKPiAgI2RlZmluZSBCUEZfRklYVVBfT0ZGU0VUX01BU0sgICBH
RU5NQVNLKDI2LCAwKQo+ICAjZGVmaW5lIEJQRl9GSVhVUF9SRUdfTUFTSyAgICAgIEdFTk1BU0so
MzEsIDI3KQo+Cj4gK2ludCBydl9icGZfZml4dXBfZXhjZXB0aW9uKGNvbnN0IHN0cnVjdCBleGNl
cHRpb25fdGFibGVfZW50cnkgKmV4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBwdF9yZWdzICpyZWdzKTsKPiAgaW50IHJ2X2JwZl9maXh1cF9leGNlcHRpb24oY29uc3Qgc3Ry
dWN0IGV4Y2VwdGlvbl90YWJsZV9lbnRyeSAqZXgsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+IC0tPjgtLQo+Cj4gaXMgbXVjaCBz
aW1wbGVyLgoKQWRkaW5nIGEgZnVuY3Rpb24gZGVjbGFyYXRpb24gaW4gYnBmX2ppdF9jb21wNjQu
YyBmaWxlIGNhbm5vdCBmaXggdGhpcyBjb21waWxlciBlcnJvcjoKCi4uLi4Kd2hlbiBDT05GSUdf
QlBGX0pJVCBhbmQgQ09ORklHX0FSQ0hfNjRJIGlzIG9wZW4sIFRoZXJlIGlzIHRoZSBmb2xsb3dp
bmcgY29tcGlsZXIgZXJyb3IgKFc9MSk6CiAgIGVycm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yICdydl9icGZfZml4dXBfZXhjZXB0aW9uJwouLi4uCgpUbyBmaXggdGhpcyBjb21waWxlciBl
cnJvciwgeW91IG5lZWQgdG8gbWFrZSBhIGRlY2xhcmF0aW9uIGluIGEgaGVhZGVyIGZpbGUsIHdo
aWNoIGlzIGFsc28KdGhlIHJlYXNvbiBmb3IgaW50cm9kdWNpbmcgZXh0YWJsZS5oLgoKQmVmb3Jl
IG1ha2luZyB0aGlzIHBhdGNoLCBJIHRob3VnaHQgYWJvdXQgdGhpcyBjaGFuZ2UsIGJ1dCBvbiB0
aGUgd2hvbGUsIEkgdGhpbmsgdGhlIG1vZGlmaWNhdGlvbgpzY2hlbWUgb2YgYWRkaW5nIGhlYWRl
ciBmaWxlcyBtb3ZlZCBtZS47LSkKCj4KPgo+Cj4gVGhvdWdodHM/Cj4gQmrDtnJuCj4KPgo+Cj4K
Pj4gVGhhbmtzLgo+PiBUb25nLgo+Pgo+Pj4KPj4+IEJqw7Zybgo+Pj4gLgo+Pj4KPiAuCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
