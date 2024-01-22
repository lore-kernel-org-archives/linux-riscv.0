Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7A5C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9gnO23z0wDVSR2kj/kgDuRjaplci38b3D6JTSAwCBE=; b=UfLf8a4532x0fn
	XuUug7943DNC6RKHEEUWPGqm1ucF58c6o6L1E6OhLgP0mX7ZKZvljVM/0QPnnexRGdZOaq7M3BVzN
	L0o9PgCuwt6OGsPI09ZeqQuPE57zgQMxmTXq9vsKw7tLKYFCjoZuZ3cn5TPEVjaDEtIpLD9BDcKre
	M7KMnM3bJsZHaBERD2HUV1ci40xavT0wwWFVemkKI2HBpH+26+E/rkS+9ko2JYMeYhQ/jZGp2tPuH
	dQf1euLY3yksfDqcVVDPGHwCiJ/X5iNjxD8QlaG3/G12w0wR8Xr8M4m/ZIE16StCWyLppbv9pdJ/L
	OoifTePsAi3Jpyyo3/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRw3r-00CfbY-1d;
	Mon, 22 Jan 2024 15:18:07 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRw3o-00CfYo-1I
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 15:18:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TJYkP18Z0z4f3lVl
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 23:17:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 6AF601A038B
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 23:17:55 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgCHqg0ih65l2k2mBg--.27335S2;
	Mon, 22 Jan 2024 23:17:55 +0800 (CST)
Message-ID: <f73cdabe-eba3-4842-8da2-a6316590eb1e@huaweicloud.com>
Date: Mon, 22 Jan 2024 23:17:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code
 simplification for RV64 JIT
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <87il3lqvye.fsf@all.your.base.are.belong.to.us>
 <baffbab8-721f-462a-8b58-64972f5eae70@huaweicloud.com>
 <878r4hqvgq.fsf@all.your.base.are.belong.to.us>
 <874jf5qudx.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <874jf5qudx.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: Syh0CgCHqg0ih65l2k2mBg--.27335S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1DJFy3Xr4DJrW3ZryUtrb_yoW8GrWDpF
	WrG3Wqya18tr1xCw10vFy0gFWUK3yYqr17Xr10qryY9r1qgry5KF4jvF1jkw1kCr4Igrya
	y3yYy347A34UAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_071804_789477_6A6997FA 
X-CRM114-Status: UNSURE (   8.15  )
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

CgpPbiAyMDI0LzEvMjIgMjM6MDcsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+IAo+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3
ZWljbG91ZC5jb20+IHdyaXRlczoKPj4KPj4+IE9uIDIwMjQvMS8yMiAyMjozMywgQmrDtnJuIFTD
tnBlbCB3cm90ZToKPj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRl
czoKPj4+Pgo+Pj4+PiBBZGQgWmJiIHN1cHBvcnQgWzBdIHRvIG9wdGltaXplIGNvZGUgc2l6ZSBh
bmQgcGVyZm9ybWFuY2Ugb2YgUlY2NCBKSVQuCj4+Pj4+IE1lYW53aGlsZSwgYWRqdXN0IHRoZSBj
b2RlIGZvciB1bmlmaWNhdGlvbiBhbmQgc2ltcGxpZmljYXRpb24uIFRlc3RzCj4+Pj4+IHRlc3Rf
YnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFzc2VkLCBhcyB3ZWxsIGFzIHRoZSByZWxh
dGl2ZQo+Pj4+PiB0ZXN0Y2FzZXMgb2YgdGVzdF9wcm9ncyouCj4+Pj4+Cj4+Pj4+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1iaXRtYW5pcC9yZWxlYXNlcy9kb3dubG9hZC8x
LjAuMC9iaXRtYW5pcC0xLjAuMC0zOC1nODY1ZTdhNy5wZGYgWzBdCj4+Pj4+Cj4+Pj4+IHYzIHJl
c2VuZDoKPj4+Pj4gLSByZXNlbmQgZm9yIG1haWwgYmUgdHJlYXRlZCBhcyBzcGFtLgo+Pj4+Pgo+
Pj4+PiB2MzoKPj4+Pj4gLSBDaGFuZ2UgdG8gZWFybHktZXhpdCBjb2RlIHN0eWxlIGFuZCBtYWtl
IGNvZGUgbW9yZSBleHBsaWNpdC4KPj4+Pgo+Pj4+IExlaHVpLAo+Pj4+Cj4+Pj4gU29ycnkgZm9y
IHRoZSBkZWxheS4gSSdtIGNoYXNpbmcgYSBzdHJ1Y3Rfb3BzIFJJU0MtViBCUEYgcmVncmVzc2lv
biBpbgo+Pj4+IDYuOC1yYzEsIEkgd2lsbCBuZWVkIHRvIHdyYXAgbXkgaGVhZCBhcm91bmQgdGhh
dCBwcmlvciByZXZpZXdpbmcKPj4+PiBwcm9wZXJseS4KPj4+Pgo+Pj4KPj4+IE9oLCBJIGFsc28g
Zm91bmQgdGhlIHByb2JsZW0gd2l0aCBzdHJ1Y3Qgb3BzIGFuZCBmaXhlZCBpdAo+IAo+IFB1LCB3
aXRoIHlvdXIgcGF0Y2ggYnBmX2l0ZXJfc2V0c29ja29wdCwgYnBmX3RjcF9jYSwgYW5kIGR1bW15
X3N0X29wcwo+IHBhc3NlcyEKPiAKPiBQbGVhc2Ugc3BpbiBhIHByb3BlciBmaXhlcyBwYXRjaCwg
YW5kIGZlZWwgZnJlZSB0byBhZGQ6Cj4gCj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+Cj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5v
cmc+Cj4gCgpJcyB0aGF0IGluIGEgaHVycnk/IElmIG5vdCwgSSB3b3VsZCBsaWtlIHRvIHNlbmQg
aXQgd2l0aCB0aGUgdXBjb21pbmcgCnBhdGNoc2V0LgoKPiAKPiBCasO2cm4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
