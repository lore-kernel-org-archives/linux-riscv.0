Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821EFC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 01:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyLZULK+0d3ir6btgd9lvPM5DrV1P8TEQsDbW4yLHv0=; b=SDhSJaG4+S5jqD
	WsH8sZjH4Sl67yKggzdN16d13h/3IWp8UrGDg92MScpnjAW1AzfcudYhIWCV/jwaogPU0oRR58O3z
	m1eAi73+h4PCSmiOrkarjrndixwSnzmjJ2EEk1NFxusdceCYbF3vTc7zzN1udNWjGRsNbd9UL42qy
	Xzrk15h3yipTGhr8GSzYFA+90xdspaBT53Gxe1yh9Klloqfu53Paw3OTK7R4hfwFNth5oxCQcibt4
	2x4ynuy0ySZDXdLkLhWfoe851Mcm00LqG619yLhA52+KhVTYNoXB8JF9hAW2fk5Esim2p/RXGL1t5
	P7xqH7Idn+hcRJfHO1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguei-0000000Dsc3-1rCC;
	Tue, 07 Jul 2026 01:31:24 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguef-0000000DsbS-3Vzq
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 01:31:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gvNwc3bhZzYQtKL
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 09:31:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 08133406A1
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 09:31:15 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDnFljhVkxqvRxPAQ--.41591S2;
	Tue, 07 Jul 2026 09:31:14 +0800 (CST)
Message-ID: <b4ca552c-58b6-49dd-bd83-dc27ca49368a@huaweicloud.com>
Date: Tue, 7 Jul 2026 09:31:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 0/6] Mixing bpf2bpf and tailcalls for RV64
Content-Language: en-US
To: Eduard Zingerman <eddyz87@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Pu Lehui <pulehui@huawei.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
 <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
 <d6647f5eb213d2ece82753285a79f28f600420d7.camel@gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <d6647f5eb213d2ece82753285a79f28f600420d7.camel@gmail.com>
X-CM-TRANSID: gCh0CgDnFljhVkxqvRxPAQ--.41591S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY37kC6x804xWl14x267AKxVW5JVWrJwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8C
	rVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxV
	WUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_GFv_Wryl4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_183122_056435_D0042BB6 
X-CRM114-Status: UNSURE (   7.38  )
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

CgpPbiAyMDI2LzcvNyAzOjI5LCBFZHVhcmQgWmluZ2VybWFuIHdyb3RlOgo+IE9uIE1vbiwgMjAy
Ni0wNi0yOSBhdCAxNjoyMSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiAKPiBIaSBCasO2
cm4sCj4gCj4gSSdtIHdvcmtpbmcgdGhyb3VnaCBicGYgcGF0Y2hlcyBxdWV1ZSBhbmQgaGF2ZSBh
IHF1ZXN0aW9uIHJlZ2FyZGluZwo+IHRoaXMgc2VyaWVzLiBXaGF0J3MgeW91ciBzdGFuY2UsIGRv
ZXMgaXQgbmVlZCBjaGFuZ2VzIG9yIGNhbiBJIGFwcGx5Cj4gaXQgdG8gYnBmLW5leHQ/CgpIaSBF
ZHVhcmQsCgpJIG5lZWQgdG8gc2VuZCBvdXQgYSBuZXcgdmVyc2lvbiB0byBhZGRyZXNzIHRoZSBp
c3N1ZSBzYXNoaWtvIG1lbnRpb25lZC4gCkl0J3MgYWxyZWFkeSBmaXhlZCBsb2NhbGx5LCBhbmQg
SSdsbCBzZW5kIGl0IG91dCBhZnRlciBCasO2cm4ncyByZXZpZXcgCmZlZWRiYWNrLgoKVGhhbmtz
LApMZWh1aQoKCj4gCj4gVGhhbmtzLAo+IEVkdWFyZAo+IAo+IFsuLi5dCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
