Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B224EFB518A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6xorMNUZVGqF3YscvqhLcpB6ILGw4p6jPRoXkX9RYg=; b=oPDiAEAWLeqPPB
	pxDVe1tqC+JN1LqI1j4sR5AOdMkXGTepR/Y/DMOVLtX+FLgNAGqRc9iSkTixGl/c7y9LVqZbemlrE
	/Mkr/+7KjHTzx0Fod0kfhyHHrgAA4l4syxWqdzL2zou5rpvgXKlk5TJXr1t1OlHeBVcNX6hKvwQAS
	PQg4PpBNGr0s7DM8hRI9mjeLq0werxuNswr7lkARXZPBJTx2jMr5PrI/qu/pvOFEp0lZgz8LgCUZn
	VO77JY60a59gyN2FE0+QFHAcsbGcsHUmkP/S7vn+QjyXNk2yMrF6DjTF7aTMzHUx4t7fY4C3DONSb
	ANTYs0JpAUBPAWptpK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCblB-0000000HDly-3QgX;
	Tue, 14 Apr 2026 11:16:49 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbl5-0000000HDku-22AU;
	Tue, 14 Apr 2026 11:16:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fw1tg2RzczKHMhC;
	Tue, 14 Apr 2026 19:16:27 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 59F194056D;
	Tue, 14 Apr 2026 19:16:35 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgDXyAMRIt5pWY9+AQ--.18262S2;
	Tue, 14 Apr 2026 19:16:35 +0800 (CST)
Message-ID: <5b7bb008-ac7b-41a5-9ee6-bdef6cd33d98@huaweicloud.com>
Date: Tue, 14 Apr 2026 19:16:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/2] bpf, arm64: Remove redundant
 bpf_flush_icache() after pack allocator finalize
Content-Language: en-US
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260413191111.3426023-1-puranjay@kernel.org>
 <20260413191111.3426023-2-puranjay@kernel.org>
 <dd645fcf-76dc-4c68-8b6f-1a168cafd44f@huaweicloud.com>
 <CANk7y0js0YxPFX1HqpYumN-ji6-OkKi4YO5=CRz8nx8aTzYxPw@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <CANk7y0js0YxPFX1HqpYumN-ji6-OkKi4YO5=CRz8nx8aTzYxPw@mail.gmail.com>
X-CM-TRANSID: cCh0CgDXyAMRIt5pWY9+AQ--.18262S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWxJw1kJry5GFWkGFW8tFb_yoW8Aw4UpF
	WfA3Z8KF4kXw4Dur10gF48XFySyws7JayUJ3WrCF9ak34Yvr97KFy3Kw409Fn0kryruw4j
	vF4jywsxuFy5ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_041643_935892_E2F8A81E 
X-CRM114-Status: GOOD (  11.80  )
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

T24gNC8xNC8yMDI2IDU6MzggUE0sIFB1cmFuamF5IE1vaGFuIHdyb3RlOgo+IE9uIFR1ZSwgQXBy
IDE0LCAyMDI2IGF0IDI6NTbigK9BTSBYdSBLdW9oYWkgPHh1a3VvaGFpQGh1YXdlaWNsb3VkLmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIDQvMTQvMjAyNiAzOjExIEFNLCBQdXJhbmpheSBNb2hhbiB3cm90
ZToKPj4+IGJwZl9mbHVzaF9pY2FjaGUoKSBjYWxscyBmbHVzaF9pY2FjaGVfcmFuZ2UoKSB0byBj
bGVhbiB0aGUgZGF0YSBjYWNoZQo+Pj4gYW5kIGludmFsaWRhdGUgdGhlIGluc3RydWN0aW9uIGNh
Y2hlIGZvciB0aGUgSklUZWQgY29kZSByZWdpb24uIEhvd2V2ZXIsCj4+PiBzaW5jZSBjb21taXQg
MWRhZDM5MWRhZWYxICgiYnBmLCBhcm02NDogdXNlIGJwZl9wcm9nX3BhY2sgZm9yIG1lbW9yeQo+
Pj4gbWFuYWdlbWVudCIpLCB0aGlzIGZsdXNoIGlzIHJlZHVuZGFudC4KPj4+Cj4+PiBicGZfaml0
X2JpbmFyeV9wYWNrX2ZpbmFsaXplKCkgY29waWVzIHRoZSBKSVRlZCBpbnN0cnVjdGlvbnMgdG8g
dGhlIFJPWAo+Pj4gcmVnaW9uIHZpYSBicGZfYXJjaF90ZXh0X2NvcHkoKSAtPiBhYXJjaDY0X2lu
c25fY29weSgpIC0+IF9fdGV4dF9wb2tlKCksCj4+PiBhbmQgX190ZXh0X3Bva2UoKSBhbHJlYWR5
IGNhbGxzIGZsdXNoX2ljYWNoZV9yYW5nZSgpIG9uIHRoZSB3cml0dGVuCj4+PiByYW5nZS4gVGhl
IHN1YnNlcXVlbnQgYnBmX2ZsdXNoX2ljYWNoZSgpIHJlcGVhdHMgdGhlIHNhbWUgY2FjaGUKPj4+
IG1haW50ZW5hbmNlIG9uIGFuIG92ZXJsYXBwaW5nIHJhbmdlLCBpbmNsdWRpbmcgYW4gdW5uZWNl
c3Nhcnkgc2Vjb25kCj4+PiBzeW5jaHJvbm91cyBJUEkgdG8gYWxsIENQVXMgdmlhIGtpY2tfYWxs
X2NwdXNfc3luYygpLgo+Pj4KPj4KPj4gU28gaWNhY2hlIGlzIGZsdXNoZWQgdHdpY2U6IG9uY2Ug
cGVyIGluc3RydWN0aW9uIGFuZCBhZ2FpbiBhZnRlciBhbGwKPj4gaW5zdHJ1Y3Rpb25zIGFyZSBj
b3BpZWQuIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gcmVtb3ZlIHRoZSBwZXItaW5zdHJ1Y3Rpb24K
Pj4gZmx1c2ggYW5kIHJldGFpbiB0aGUgc2luZ2xlIGZpbmFsIGZsdXNoIHRvIGF2b2lkIHJlcGVh
dGluZyBmbHVzaCBvdmVyaGVhZAo+PiBmb3IgZWFjaCBpbnN0cnVjdGlvbi4KPiAKPiBObywgYnBm
X2ppdF9iaW5hcnlfcGFja19maW5hbGl6ZSgpIGlzIGNhbGxlZCBhdCB0aGUgZW5kIGFmdGVyIHRo
ZQo+IHdob2xlIHByb2dyYW0gaXMgaml0ZWQsIGFuZCBpdCBjYWxsczogYnBmX2FyY2hfdGV4dF9j
b3B5KHJvX2hlYWRlciwKPiByd19oZWFkZXIsIHJ3X2hlYWRlci0+c2l6ZSk7IHdoaWNoIGRvZXMg
YWFyY2g2NF9pbnNuX2NvcHkoZHN0LCBzcmMsCj4gbGVuKSwgdGhpcyBjYWxscyBfX3RleHRfcG9r
ZSgpIHdoaWNoIGNvcGllcyB0aGUgd2hvbGUgcHJvZ3JhbSBhbmQgdGhlbgo+IGRvZXMgZmx1c2hf
aWNhY2hlX3JhbmdlKCh1aW50cHRyX3QpYWRkciwgKHVpbnRwdHJfdClhZGRyICsgbGVuKTsgb25j
ZS4KPiBUaGlzIGlzIGNvcnJlY3QsIGFmdGVyIHRoaXMgd2UgZG9uJ3QgbmVlZCB0byBjYWxsIGZs
dXNoX2ljYWNoZV9yYW5nZSgpCj4gb24gdGhlIHNhbWUgcmFuZ2UgYWdhaW4uCj4gCj4gSWYgd2Ug
aGFkIGJlZW4gY2FsbGluZyBmbHVzaF9pY2FjaGVfcmFuZ2UoKSBmb3IgZWFjaCBpbnN0cnVjdGlv
biwgdGhlCj4gc3lzdGVtIHdvdWxkIGhhbmcgZHVlIHRvIHRoZSBzdG9ybSBvZiBJUElzLgpSaWdo
dCwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24hCgpMR1RNLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
