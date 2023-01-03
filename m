Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB567C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 08:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxB/dMt1+NAcMaC6Vyoc5qd27tYgwMQN3eJ4CaWkvys=; b=yt7bWgpslJzWrc
	GrIjDNcEEzD9p4yAWaqNDbVC5l8IDxt7QWP/JMUYJTfs6vD5LkmDq3I3Vfi5Ol7G8kzAhWGy0csbq
	WwYPN+UbJn1O6t5ZqwLACJYJhuFAweomnK50Mmr5+ioE7w0VUXx4MgTHheBow/lUhBhjKwa6cvCvN
	ORKogb5sLrpsPnrRDIWdKZtHWNuXyQA6IZ++hMtxQK9fcq475Jr8tinIncS0hw+VOL7E8FOa4Iqy4
	2fnVSZp5lNUTy4A9Slz68rlrVaLqmj7H0OOSgJ0nc7BqnjGdKjMPmRObIh9wka8JzVWP8MseKhTYQ
	xO+1y8iOtcpJ4mUmtC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcGE-000365-L2; Tue, 03 Jan 2023 08:03:02 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcEp-0002Tq-Hm
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:01:38 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NmQ7X0klRzJpYP;
	Tue,  3 Jan 2023 15:57:28 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 3 Jan 2023 16:01:26 +0800
Message-ID: <713f9f26-da42-eda8-c804-338d61b1557c@huawei.com>
Date: Tue, 3 Jan 2023 16:01:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH bpf-next 3/4] riscv, bpf: Add bpf_arch_text_poke
 support for RV64
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Pu Lehui
	<pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20221219133736.1387008-1-pulehui@huaweicloud.com>
 <20221219133736.1387008-4-pulehui@huaweicloud.com>
 <87v8looypd.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <87v8looypd.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_000135_862297_85F68722 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDIzLzEvMyAxNTozNywgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
Cj4+IGluZGV4IGJmNDcyMWE5OWEwOS4uZmE4YjAzYzUyNDYzIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMKPiAKPj4gQEAgLTEyNjYsNyArMTM4OSw3IEBAIGludCBicGZfaml0X2VtaXRf
aW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAq
Y3R4LAo+PiAgIAo+PiAgIHZvaWQgYnBmX2ppdF9idWlsZF9wcm9sb2d1ZShzdHJ1Y3QgcnZfaml0
X2NvbnRleHQgKmN0eCkKPj4gICB7Cj4+IC0JaW50IHN0YWNrX2FkanVzdCA9IDAsIHN0b3JlX29m
ZnNldCwgYnBmX3N0YWNrX2FkanVzdDsKPj4gKwlpbnQgaSwgc3RhY2tfYWRqdXN0ID0gMCwgc3Rv
cmVfb2Zmc2V0LCBicGZfc3RhY2tfYWRqdXN0Owo+PiAgIAlib29sIGlzX21haW5fcHJvZyA9IGN0
eC0+cHJvZy0+YXV4LT5mdW5jX2lkeCA9PSAwOwo+IAo+IFRoaXMgbGluZSBtYWdpY2FsbHkgYXBw
ZWFyZWQsIGFuZCBtYWtlcyBpdCBoYXJkIHRvIGFwcGx5IHRoZSBzZXJpZXMKPiB3aXRob3V0IGhh
Y2tpbmcgdGhlIHBhdGNoZXMgbWFudWFsbHkuIEdvaW5nIGZvcndhcmQsIHBsZWFzZSBzdXBwbHkg
YQo+IGJhc2UgdHJlZSBjb21taXQgdG8gdGhlIHNlcmllcyAob3IgYSBsaW5rIHRvIGEgY29tcGxl
dGUgZ2l0IHRyZWUpLgo+IAoKQSByZWJhc2UgdmVyc2lvbiBoYXMgYmVlbiByZXNlbmQgYXMgZm9s
bG93OgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjIxMjIwMDIxMzE5LjE2NTU4NzEt
MS1wdWxlaHVpQGh1YXdlaWNsb3VkLmNvbS8KCj4gCj4gQmrDtnJuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
