Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7F8CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ERnpTEiCA9dpAtyeFBEAEJkxdPN9vm8CZJ6dFeAWWQ=; b=ah8/6ifDWmDQkv
	0XKnpWjUkxyrOqUgpa3DQ7THlDxalR5d01SGES4aQXKrafL+/skl9/Hv/XAsUXvus9QqNR9Blcc7U
	wsevHfFb1uAIoBbfd52WW0/mPr+JuYhXh6BEy2qp4Ye2CtGlzXGDNyD3KBlLZzF1i1HldCSDZXe9/
	739YpdLE5tjHmjtjWhA8vENcq/cNXtrvTrhIsCP5XXx9yNz33NBBfKhFF1m/fYovlxJHz7NDcfhrP
	bx/qzBlFGdFTPPB0O3tH64CRYMuZ9rfTBZG9C4XJbb5BIc1MVspZDvh16my8RNQYE7gwlIjxsSLlK
	DqpvkwLbxZXbLxc9Of7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxiD-0000000FS0G-0Z7J;
	Wed, 03 Apr 2024 10:19:21 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxi9-0000000FRwg-0xil
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 10:19:19 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4V8ghN3b5Tz4f3l2H
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 18:19:00 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 0AB431A0390
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 18:19:07 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgCn+GoZLQ1mRk5QJA--.18103S2;
	Wed, 03 Apr 2024 18:19:06 +0800 (CST)
Message-ID: <bb6e839e-c840-4374-8014-5493cad45bdc@huaweicloud.com>
Date: Wed, 3 Apr 2024 18:19:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Content-Language: en-US
To: Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Manu Bretelle <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <878r1vrga9.fsf@all.your.base.are.belong.to.us>
 <5005fb56-086c-2aa7-e28b-83f0fc51f988@iogearbox.net>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <5005fb56-086c-2aa7-e28b-83f0fc51f988@iogearbox.net>
X-CM-TRANSID: gCh0CgCn+GoZLQ1mRk5QJA--.18103S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWUGrWUJry7tF4xKF18Grg_yoWktwcE9r
	Z2yr92vw4rA3Z2y3Z3Cr15Wr4DGr4xGFy8AF10qr98Xwn3Xa1kCan8Xr1fCa13X3yxJr9x
	Kan0qF4ayr1agjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_031917_798303_DA96A6FF 
X-CRM114-Status: GOOD (  11.52  )
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

CgpPbiAyMDI0LzQvMyAwOjAzLCBEYW5pZWwgQm9ya21hbm4gd3JvdGU6Cj4gT24gNC8yLzI0IDQ6
MjcgUE0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNs
b3VkLmNvbT4gd3JpdGVzOgo+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4K
Pj4+Cj4+PiBUaGlzIHBhdGNoIHJlbGF4ZXMgdGhlIHJlc3RyaWN0aW9ucyBvbiB0aGUgWmJiIGlu
c3RydWN0aW9ucy4gVGhlIAo+Pj4gaGFyZHdhcmUKPj4+IGlzIGNhcGFibGUgb2YgcmVjb2duaXpp
bmcgdGhlIFpiYiBpbnN0cnVjdGlvbnMgaW5kZXBlbmRlbnRseSwgCj4+PiBlbGltaW5hdGluZwo+
Pj4gdGhlIG5lZWQgZm9yIHJlbGlhbmNlIG9uIGtlcm5lbCBjb21waWxlIGNvbmZpZ3VyYXRpb25z
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+
Cj4+IFNob3VsZCB0aGlzIHBhdGNoIHJlYWxseSBiZSBwYXJ0IG9mIHRoaXMgc2VyaWVzPwo+IAo+
IE5vLCB0aGF0IHNob3VsZCBiZSBzdWJtaXR0ZWQgaW5kZXBlbmRlbnRseS4KPiAKCk15IGluaXRp
YWwgdGhvdWdodCB3YXMgdGhhdCBJIGRpZG4ndCBlbmFibGUgQ09ORklHX1JJU0NWX0lTQV9aQkIg
aW4gCmNvbmZpZy5yaXNjdjY0LCBzbyBJIHNob3VsZCBsb29zZW4gdGhpcyByZXN0cmljdGlvbiB0
byBlbmFibGUgemJiIApvcHRpbWl6YXRpb24uIEl0IGNvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoaXMg
c2VyaWVzLgoKQnkgdGhlIHdheSwgYWZ0ZXIgcmVhZGluZyB3aGF0IENvbm9yIGFuZCBCasO2cm4g
c2FpZCwgSSB0aGluayB3ZSBzaG91bGQgCmFsaWduIHdpdGgga2VybmVsIHNlbWF0aWMsIHRoYXQg
aXMsIGVtaXQgemJiIHdoZW4gQ09ORklHX1JJU0NWX0lTQV9aQkIgCmlzIGVuYWJsZWQgYW5kIHNv
IHRoYXQgaWYgWmJiIGlzIGRldGVjdGVkIHRoZXkgY2FuIGJlIHVzZWQuCgo+IEFsc28sIGdpdmVu
IEVkdWFyZCdzIGNvbW1lbnQsIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBhZGQgdGhl
Cj4gaW5zdHJ1Y3Rpb25zIHRvIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9SRUFETUUucnN0
IGV2ZW4gaWYgbm90IGluCj4gYSBwZXJmZWN0IHNoYXBlLCBidXQgaXQgd291bGQgZ2l2ZSBkZXZl
bG9wZXJzIGEgY2hhbmNlIHRvIGdldCBzdGFydGVkLgo+IAo+IFRoYW5rcywKPiBEYW5pZWwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
