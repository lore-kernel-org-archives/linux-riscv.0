Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A443C47090
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mITXbEeDzCoe65jKaYE5oMOc4/LTzRuRGJXoGVqfOno=; b=r0bWJbiM5dRlIF
	GdgRKdu7q+EEFjmVn8i4IUWeBzSsyaxZ/Yxc+fL3osyhqC/IRuvVK4x4HdKvsNLs98TJUHqmmyZiz
	MUGgfrHfKaeY2Eyc0iFL4AR3pGcPqTGvuzSNbaa86pYNbFHD25J3AL0Mk/Bk0nOLBUK1P0NkvizBQ
	9abTN8LMCAEbSLMIeO70O8+Eqb/XX267kA9HZz+j7dGBujfkXX7cs41/b966EvbB3EZcedtiFQREG
	f6s0VjvSqaQj1HYJ3uX8HbZq5MaDjrECW5T2/0Mb0j/0ioYmQOXb8CAivd5NCaqND9COCb1NJFD3y
	pd+LanLO2k8lDZNfFmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TeD-005D8k-8V; Tue, 06 Dec 2022 08:49:53 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Te9-005CxS-KY
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 08:49:51 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NRDbp4lPNz15N9g;
	Tue,  6 Dec 2022 16:48:54 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 16:49:41 +0800
Message-ID: <db4c483d-d798-fcfa-1791-856f61decfd7@huawei.com>
Date: Tue, 6 Dec 2022 16:49:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf v2] riscv, bpf: Emit fixed-length instructions for
 BPF_PSEUDO_FUNC
Content-Language: en-US
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
References: <20221202094837.3872444-1-pulehui@huaweicloud.com>
 <87y1rq848x.fsf@all.your.base.are.belong.to.us>
 <0ade59ea-6863-4d68-607c-22e4b9405a0d@huaweicloud.com>
 <87359t3r0h.fsf@all.your.base.are.belong.to.us>
 <0620000f-4d06-de15-09d9-24b5b0c47410@huaweicloud.com>
 <87359szzw3.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <87359szzw3.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_004949_873714_B8FE4D47 
X-CRM114-Status: UNSURE (   4.06  )
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

CgpPbiAyMDIyLzEyLzYgMTY6NDIsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+PiBXb3VsZG4ndCB0aGF0IHdvcms/
Cj4+Pgo+Pgo+PiBJdCBkZWZpbml0ZWx5IHdvcmtzLiBCdXQgYXVpcGMrYWRkaSBtYXkgYmUgc29t
ZSBob2xlcywgd2hpbGUKPj4gbHVpK2FkZGkrc2xsaSBzdXBwb3J0IGFsbCB0aGUgYWRkcmVzcyBv
ZiBrZXJuZWwgYW5kIG1vZHVsZS4gQW5kIHRoaXMKPj4gbWlnaHQgYmUgaGVscCBmb3IgdGhlIGZ1
dHVyZSBmZWF0dXJlIHBvcnRpbmcuCj4gCj4gV2UncmUgYWxyZWFkeSB1c2luZyBhdWlwYy9qYWxy
IGZvciBjYWxscywgYW5kIEknZCBzYXkgaXQgKnZlcnkqIHVubGlrZWx5Cj4gdGhhdCB3ZSdsbCBo
aXQgdGhlIG5vbi1jb3ZlcmVkIHJhbmdlLiBJJ2Qgc2F5IGdvIHdpdGggYXVpcGMvYWRkaSArCj4g
ZXJyb3IsIGFuZCB3ZSBjYW4gY2hhbmdlIGlmIHRoaXMgcmVhbGx5IGlzIGEgcHJvYmxlbS4KCldl
bGwsIHRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSwgd2lsbCBzZW5kIG5ldyBzb29uLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
