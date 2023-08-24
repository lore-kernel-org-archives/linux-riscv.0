Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE2EC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 01:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOHOEJuRihhF+LgsXW16GaWlZaluEi2UObwlXfRIe4g=; b=BnxkDsl4rDzjAu
	jws3kkvb9f4DAtrIwmAUW3ozAPY0FPej5AmoUu5zv8yRZ/J/9ZieCR5nlS8CGKdz/V4Vn2KqjKlkq
	LhwiS17iKDQrlUnVmuHItlLbB0KbGHPJwTV0Jx2GMIRjDBlsbd39OglC5WRL/E5WiVMPjC/uPmBWc
	lwXhaT3Ub5oKukZLDKyFnmn8IbJCYVbJ7jIFjGEGo+HUtytGsvZnnaVZFWkk2StW8i2jnhlS4H0Zd
	4KJ4G+FnAOhOXcXxEfh66vsiPeayn27wYdcQu1w1Iv0xXQx3XuKg7EMgcYE67VntykOdGsmxY5Ztf
	ka+r1c/dFYFzm4knitdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYyyi-001rwD-29;
	Thu, 24 Aug 2023 01:17:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYyyg-001rus-1F
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 01:17:39 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RWQ8B1qzzzNn3Y;
	Thu, 24 Aug 2023 09:13:46 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 24 Aug 2023 09:17:20 +0800
Message-ID: <490126e3-b5da-4523-11af-62a2a3c33514@huawei.com>
Date: Thu, 24 Aug 2023 09:17:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next 3/7] riscv, bpf: Support sign-extension mov insns
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Pu Lehui
	<pulehui@huaweicloud.com>, <linux-riscv@lists.infradead.org>,
	<bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai <xukuohai@huawei.com>,
	Puranjay Mohan <puranjay12@gmail.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-4-pulehui@huaweicloud.com>
 <87pm3dlj80.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <87pm3dlj80.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_181738_610376_3C0265A1 
X-CRM114-Status: UNSURE (   7.06  )
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

CgpPbiAyMDIzLzgvMjQgMjoxNCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gRnJvbTogUHUgTGVodWkgPHB1bGVo
dWlAaHVhd2VpLmNvbT4KPj4KPj4gQWRkIHN1cHBvcnQgc2lnbi1leHRlbnNpb24gbW92IGluc3Ry
dWN0aW9ucyBmb3IgUlY2NC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlA
aHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8
IDE0ICsrKysrKysrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+IGluZGV4IGZkMzZj
YjE3MTAxYS4uZDE0OTcxODJjYWNmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4g
QEAgLTEwNDcsNyArMTA0NywxOSBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0
IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPj4gICAJCQllbWl0
X3pleHRfMzIocmQsIGN0eCk7Cj4+ICAgCQkJYnJlYWs7Cj4+ICAgCQl9Cj4+IC0JCWVtaXRfbXYo
cmQsIHJzLCBjdHgpOwo+PiArCQlzd2l0Y2ggKGluc24tPm9mZikgewo+PiArCQljYXNlIDA6Cj4+
ICsJCQllbWl0X212KHJkLCBycywgY3R4KTsKPj4gKwkJCWJyZWFrOwo+PiArCQljYXNlIDg6Cj4+
ICsJCWNhc2UgMTY6Cj4+ICsJCQllbWl0X3NsbGkocnMsIHJzLCA2NCAtIGluc24tPm9mZiwgY3R4
KTsKPj4gKwkJCWVtaXRfc3JhaShyZCwgcnMsIDY0IC0gaW5zbi0+b2ZmLCBjdHgpOwo+IAo+IFlv
dSdyZSBjbG9iYmVyaW5nIHRoZSBzb3VyY2UgcmVnaXN0ZXIgKHJzKSBoZXJlLCB3aGljaCBpcyBj
b3JyZWN0LgoKYWxyaWdodCwgd2lsbCBmaXggaXQKCj4gCj4gKFNpZGUgbm90ZTogTWF5YmUgaXQn
cyB0aW1lIHRvIGFkZCBaYmIgc3VwcG9ydCB0byB0aGUgSklUIHNvb24hIDstKSkKPiAKPiAKPiBC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
