Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AB1C3DA66
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 01:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJVPe/ZauXgeOC+wOJ1AuQjQ+RMt+hVqaACk/AGwkbo=; b=n9gnC15VajaBTH
	DcNQOM0WUU7c3FNdg+VzqhT/h3vyUdSrmxZ0AIrbneuug4O0ECtXgTMHasG/pu4+9C0jZA2WXrmxj
	I/alsxaF5KW+US9Hszlkm7b7g52fHc/Rx4nMvbDgQVkOKNpjmdhQvWbwe66GoPeUbRsfn3B9za6zx
	5f+/n6f1hlwQWIZ6510PhD7w3hrB6x7lYKr0askK22vbwxj7vcf8lZm4dRQjicCh4m0TJaetbK7h7
	T6BN0PyqkpL9wdpo/7W3ArM320VwMqAcb32oEG942kqSOAJ9/S8POqzpsENdu6clAE7FqjzM7meHR
	vbuDMTa4Lsm0Q4cLSH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYz4J-001sKL-0i;
	Thu, 24 Aug 2023 01:23:27 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYz4H-001sJY-0J
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 01:23:26 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RWQJV2zsDzVjt7;
	Thu, 24 Aug 2023 09:20:58 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 24 Aug 2023 09:23:14 +0800
Message-ID: <2c099f21-7e3a-6263-d9ba-013c5571671e@huawei.com>
Date: Thu, 24 Aug 2023 09:23:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next 7/7] selftests/bpf: Enable cpu v4 tests for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<alexei.starovoitov@gmail.com>
CC: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv
	<linux-riscv@lists.infradead.org>, bpf <bpf@vger.kernel.org>, Network
 Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai <xukuohai@huawei.com>,
	Puranjay Mohan <puranjay12@gmail.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-8-pulehui@huaweicloud.com>
 <87zg2hk44i.fsf@all.your.base.are.belong.to.us>
 <CAADnVQLu5twbe_UpiJrD0wKq1YyHzZbfzYhsW-mte7vDmyna5g@mail.gmail.com>
 <875y55tu5n.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <875y55tu5n.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_182325_424681_F81F3696 
X-CRM114-Status: UNSURE (   6.99  )
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

CgpPbiAyMDIzLzgvMjQgMzo1MCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBBbGV4ZWkgU3Rhcm92
b2l0b3YgPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyaXRlczoKPiAKPj4gT24gV2Vk
LCBBdWcgMjMsIDIwMjMgYXQgMTE6MjXigK9BTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPiB3cm90ZToKPj4+Cj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdy
aXRlczoKPj4+Cj4+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4+Pgo+
Pj4+IEVuYWJsZSBjcHUgdjQgdGVzdHMgZm9yIFJWNjQsIGFuZCB0aGUgcmVsZXZhbnQgdGVzdHMg
aGF2ZSBwYXNzZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBo
dWF3ZWkuY29tPgo+Pj4KPj4+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPgo+Pgo+PiBCam9ybiwKPj4KPj4gVGhhbmtzIGEgbG90IGZvciB0aGUgcXVpY2sgcmV2aWV3
IQo+PiBDb3VsZCB5b3UgZ2l2ZSBpdCBhIHNwaW4gYXMgd2VsbCBhbmQgaG9wZWZ1bGx5IGFkZCBU
ZXN0ZWQtYnkgPwo+Pgo+PiBXZSBzdGlsbCBoYXZlIHRpbWUgdG8gZ2V0IGl0IGludG8gYnBmLW5l
eHQgZm9yIHRoZSB1cGNvbWluZyBtZXJnZSB3aW5kb3cuCj4gCj4gSSdsbCBraWNrIGEgcnVuISBC
dXQgSSdkIGxpa2UgYSBjaGFuZ2UgdG8gbW92IDgvMTZiIHBhdGNoICgjMykgcHJpb3IKPiBwdWxs
aW5nLgo+IAo+PiBXZSBzdGlsbCBoYXZlIHRpbWUgdG8gZ2V0IGl0IGludG8gYnBmLW5leHQgZm9y
IHRoZSB1cGNvbWluZyBtZXJnZSB3aW5kb3cuCj4gCj4gQExlaHVpIERvIHlvdSBoYXZlIHRpbWUg
dG8gY29vayBhIHYyPwoKU29ycnkgZ3V5cyBmb3IgdGhlIGxhdGUgcmVwbHkgZHVlIHRvIHNsZWVw
LiBWMiBpcyByZWFkeSBhbmQgd2lsbCBzZW5kIHNvb24uCgo+IAo+IAo+IEJqw7ZybgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
