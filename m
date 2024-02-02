Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342D9C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1TiCut50F/J3JQCdgKXwxMjmDEIpCOJ6NeS16eIiEU=; b=u+LEvhNyjZx7ER
	aGc5C/8taPXstO1UT4vYMjCz0pikTFWir2i1r8jOA/hvimXtRpcNiqbxs5Vf7X98N9oWtt/ckxROY
	kKG8emAtLIgeGt4BLPj9MnCQPRJqWJ6ZL80CVXSL4wTjU1+ZHaldVKPTGKZMepz8AoTIUkRJKaWit
	/FJTCTZdenzTgTlsLabP781d5bnq7gtph4JYgwKrvLgG4YnIcyw52eIctGV74M18K8BK+oBOwI+ub
	JvaIgfBaYGAV9EZGapWnaoBctgVUCi18sx50Jn/CpSxbXnNmAEcPQNCbaxgmauNFm4HxGr8bJUk0w
	chBtnAPBnqgwrVf5AYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVq88-0000000B2SW-008x;
	Fri, 02 Feb 2024 09:46:40 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVq84-0000000B2QK-2GER
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 09:46:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TR9rx6ktdz4f3jXc
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 17:46:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 337FF1A017A
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 17:46:30 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgBXKRLzubxlJ_zxCg--.14664S2;
	Fri, 02 Feb 2024 17:46:28 +0800 (CST)
Message-ID: <1c0c1ede-8595-4420-9f70-004645895a71@huaweicloud.com>
Date: Fri, 2 Feb 2024 17:46:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 0/4] Mixing bpf2bpf and tailcalls for RV64
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>
Cc: bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Network Development <netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBl?=
 =?UTF-8?Q?l?= <bjorn@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>,
 Leon Hwang <hffilwlqm@gmail.com>
References: <20240201083351.943121-1-pulehui@huaweicloud.com>
 <1e7181e4-c4c5-d307-2c5c-5bf15016aa8a@iogearbox.net>
 <CAADnVQ+rLneO4t=YYmLYtc945Fz0=ucNTWZBxgvs8toFY-onRg@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAADnVQ+rLneO4t=YYmLYtc945Fz0=ucNTWZBxgvs8toFY-onRg@mail.gmail.com>
X-CM-TRANSID: cCh0CgBXKRLzubxlJ_zxCg--.14664S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWxXr15JF1kWF13ZF45GFg_yoWDZwb_WF
	9agFW8Ww1DZr17Ca18KFsY9r429FWqgry7KrW0gr9rCr1DGrn8GrnxGr9Yv345X3ZFg3Z8
	W3WYqryqqrZrujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_014636_944890_A87F0690 
X-CRM114-Status: GOOD (  11.99  )
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

CgpPbiAyMDI0LzIvMiAwOjE5LCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4gT24gVGh1LCBG
ZWIgMSwgMjAyNCBhdCAyOjU24oCvQU0gRGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94
Lm5ldD4gd3JvdGU6Cj4+Cj4+PiB3aWxsIGJlIGRlc3Ryb3llZC4gU28gd2UgaW1wbGVtZW50ZWQg
bWl4aW5nIGJwZjJicGYgYW5kIHRhaWxjYWxscwo+Pj4gc2ltaWxhciB0byB4ODZfNjQsIGkuZS4g
dXNpbmcgYSBub24tY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvIHRyYW5zZmVyCj4gLi4uCj4+IElp
dWMsIHRoaXMgc3RpbGwgbmVlZHMgYSByZXNwaW4gYXMgcGVyIHRoZSBvbmdvaW5nIGRpc2N1c3Np
b25zLiBBbHNvLAo+PiBpZiB5b3UgaGF2ZSB3b3JrZWQgb24gQlBGIHNlbGZ0ZXN0cyB3aGljaCBl
eGVyY2lzZSB0aGUgY29ybmVyIGNhc2UKPj4gYXJvdW5kIGE2LCBwbGVhc2UgaW5jbHVkZSB0aGVt
IGluIHRoZSBzZXJpZXMgYXMgd2VsbCBmb3IgY292ZXJhZ2UuCj4gCj4gSG9sZCBvbiwgZm9sa3Mu
Cj4gSSdtIG5vdCBzdXJlIGl0J3Mgc3VjaCBhIGNvZGUgaWRlYSB0byBzdXBwb3J0IHRhaWxjYWxs
cyBmcm9tIHN1YnByb2dzCj4gaW4gcmlzYy12Lgo+IFRoZXkncmUgYnJva2VuIG9uIHg4Ni02NCBh
bmQgc28gZmFyIHNldmVyYWwgYXR0ZW1wdHMgdG8gZml4IHRoZW0KPiB3ZXJlIG5vdCBzdWNjZXNz
ZnVsLgo+IElmIHdlIGRvbid0IGhhdmUgYSBmaXggc29vbiB3ZSB3aWxsIGRpc2FibGUgdGhpcyBm
ZWF0dXJlIGNvbXBsZXRlbHkKPiBpbiB0aGUgdmVyaWZpZXIuCj4gSW4gZ2VuZXJhbCB0YWlsY2Fs
bGluZyBmcm9tIHN1YnByb2dzIGlzIGEgbmljaGUgdXNlIGNhc2UuCj4gSWYgdGhlcmUgYXJlIHVz
ZXJzIHRoZXkgc2hvdWxkIHRyYW5zaXRpb24gdG8gdGFpbCBjYWxsIGZyb20gbWFpbiBwcm9nIG9u
bHkuCj4gCj4gU2VlCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmL0NBQURuVlFKMXN6cnk5
UDAwd3dlVkR1NGQwQVFvTV80OXFULV91ZWlydmdnQWlDWnJwd0BtYWlsLmdtYWlsLmNvbS8KCk9L
LCB3aWxsIGtlZXAgdHJhY2tpbmcuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
