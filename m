Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD54CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvEVy2HC/ewGdarz+BNYAy71srq/SsM/1Dp0+CpHG6Y=; b=t1ZVxvFSPGwJZm
	88XiQmLnV4bPZKaYm1TUcNN5ef6AyIuiUOqkaOcfrZV6gWp9TGqfOaOYb+nHoMdBcX3tlBXmBNf/U
	8Y8e+FZAWGw1lqZBY7cv7w9gRsNBiztbLe6Y60dYNe3Uud+q8RMVP9JLrLtBa+kmM+z5Y9BLwtIPX
	pV3DiH2HdZ5J2U66MBoglRwPjBi9Ryn9aMJiC+pkoOI9nsVWEj+Fs7EJExATpQZW0QpNrZL5gcC1y
	RYUirKqVXjFB2UDb9Fu3eS3bays7NBjlssCijaCyRVTqarXxiRjPWYdEm/aNUerssWQ7FmEtt9EVV
	HXEetWqfYRodqqj/9UTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxV9-0000000FNaa-2znI;
	Wed, 03 Apr 2024 10:05:51 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxV6-0000000FNXs-1XMH
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 10:05:50 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4V8gNs28gDz4f3khw
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 18:05:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id CC3241A016E
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 18:05:39 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgD3R2ryKQ1m0FhPJA--.17610S2;
	Wed, 03 Apr 2024 18:05:39 +0800 (CST)
Message-ID: <d6eae62b-60fd-4f3c-92e4-7ea5f1c4fc68@huaweicloud.com>
Date: Wed, 3 Apr 2024 18:05:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: Stefan O'Rear <sorear@fastmail.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Manu Bretelle <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <ed3debc9-f2a9-41fb-9cf9-dc6419de5c01@huaweicloud.com>
 <87cyr7rgdn.fsf@all.your.base.are.belong.to.us>
 <20240402-ample-preview-c84edb69db1b@spud>
 <871q7nr3mq.fsf@all.your.base.are.belong.to.us>
 <20240403-gander-parting-a47c56401716@spud>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20240403-gander-parting-a47c56401716@spud>
X-CM-TRANSID: gCh0CgD3R2ryKQ1m0FhPJA--.17610S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur17Aw43Cw47GF15Xr15twb_yoW5Ar13pa
	95KF4Ika1DJr12y3sFyr48WrySvr1rCF45Grn8Gry8Awn8XF1xKrW2gr15CF97urZ7Kw1a
	vr48Jry2y3Z0yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU13rcDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_030548_761673_02C71881 
X-CRM114-Status: GOOD (  23.07  )
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

Ck9uIDIwMjQvNC8zIDk6MjAsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBUdWUsIEFwciAwMiwg
MjAyNCBhdCAwOTowMDo0NVBNICswMjAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IAo+Pj4+IEkg
c3RpbGwgdGhpbmsgTGVodWkncyBwYXRjaCBpcyBjb3JyZWN0OyBCdWlsZGluZyBhIGtlcm5lbCB0
aGF0IGNhbiBib290Cj4+Pj4gb24gbXVsdGlwbGUgcGxhdGZvcm1zICh3LyBvciB3L28gWmJiIHN1
cHBvcnQpIGFuZCBub3QgaGF2aW5nIFpiYiBpbnNuIGluCj4+Pj4gdGhlIGtlcm5lbCBwcm9wZXIs
IGFuZCBpZmYgWmJiIGlzIGF2YWlsYWJsZSBhdCBydW4tdGltZSB0aGUgQlBGIEpJVCB3aWxsCj4+
Pj4gZW1pdCBaYmIuCj4+Pgo+Pj4gVGhpcyBzZW50ZW5jZSBpcyAtRU5PUEFSU0UgdG8gbWUsIGRp
ZCB5b3UgYWNjaWRlbnRhbGx5IG9taXQgc29tZSB3b3Jkcz8KPj4+IEFkZGl0aW9uYWxseSBoZSBj
b25maWcgb3B0aW9uIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggYnVpbGRpbmcga2VybmVscyB0aGF0
Cj4+PiBib290IG9uIG11bHRpcGxlIHBsYXRmb3JtcywgaXQgb25seSBjb250cm9scyB3aGV0aGVy
IG9wdGltaXNhdGlvbnMgZm9yIFpiYgo+Pj4gYXJlIGJ1aWx0IHNvIHRoYXQgaWYgWmJiIGlzIGRl
dGVjdGVkIHRoZXkgY2FuIGJlIHVzZWQuCj4+Cj4+IFVnaCwgc29ycnkgYWJvdXQgdGhhdCEgSSdt
IHByb2JhYmx5IGNvbmZ1c2VkIG15c2VsZi4KPiAKPiBSZWFkaW5nIHRoaXMgYmFjaywgSSBhIGJ1
bmNoIG9mIHdvcmRzIHRvbywgc28gbm8gd29ycmllcy4uLgo+IAo+Pj4+IEZvciB0aGVzZSBraW5k
IG9mIG9wdGltaXphdGlvbnMsIChJTU8pIGl0J3MgYmV0dGVyIHRvIGxldCB0aGUgQlBGIEpJVAo+
Pj4+IGRlY2lkZSBhdCBydW4tdGltZS4KPj4+Cj4+PiBXaHkgaXMgYnBmIGEgZGlmZmVyZW50IGNh
c2UgdG8gYW55IG90aGVyIHVzZXIgaW4gdGhpcyByZWdhcmQ/Cj4+PiBJIHRoaW5rIHRoYXQgdGhl
IGNvbW1pdCBtZXNzYWdlIGlzIG1pc2xlYWRpbmcgYW5kIG5lZWRzIHRvIGJlIGNoYW5nZWQsCj4+
PiBiZWNhdXNlIHRoZSBwb2ludCAidGhlIGhhcmR3YXJlIGlzIGNhcGFibGUgb2YgcmVjb2duaXNp
bmcgdGhlIFpiYgo+Pj4gaW5zdHJ1Y3Rpb25zIGluZGVwZW5kZW50bHkuLi4iIGlzIGNvbXBsZXRl
bHkgdW5yZWxhdGVkIHRvIHRoZSBwdXJwb3NlCj4+PiBvZiB0aGUgY29uZmlnIG9wdGlvbi4gT2Yg
Y291cnNlIHRoZSBoYXJkd2FyZSB1bmRlcnN0YW5kaW5nIHRoZSBvcHRpb24KPiAKPiBUaGlzIHNo
b3VsZCBoYXZlIGJlZW4gInVuZGVyc3RhbmRpbmcgdGhlIGluc3RydWN0aW9ucyIuLi4KPiAKPj4+
IGhhcyBub3RoaW5nIHRvIGRvIHdpdGgga2VybmVsIGNvbmZpZ3VyYXRpb24uIFRoZSBjb21taXQg
bWVzc2FnZSBuZWVkcyB0bwo+Pj4gZXhwbGFpbiB3aHkgYnBmIGlzIGEgc3BlY2lhbCBjYXNlIGFu
ZCBpcyBleGVtcHQgZnJvbSBhbgo+IAo+IEFuZCB0aGlzIHMvZnJvbSBhbi8vLi4uCj4gCj4+PiBJ
IHRvdGFsbHkgdW5kZXJzdGFuZCBhbnkgcG9pbnQgYWJvdXQgYnBmIGJlaW5nIGRpZmZlcmVudCBp
biB0ZXJtcyBvZgo+Pj4gbmVlZGluZyB0b29sY2hhaW4gc3VwcG9ydCwgYnV0IElJUkMgaXQgd2Fz
IEkgd2hvIHBvaW50ZWQgb3V0IHVwLXRocmVhZC4KPiAKPiBBbmQgInBvaW50ZWQgdGhhdCBvdXQi
Lgo+IAo+IEkgYWx3YXlzIG1ha2UgYSBtZXNzIG9mIHRoZXNlIGVtYWlscyB0aGF0IEkgcmUtd3Jp
dGUgc2V2ZXJhbCB0aW1lcyA6KQo+IAo+Pj4gVGhlIHBhcnQgb2YgdGhlIGNvbnZlcnNhdGlvbiB0
aGF0IHlvdSdyZSByZXBseWluZyB0byBoZXJlIGlzIGFib3V0IHRoZQo+Pj4gc2VtYW50aWNzIG9m
IHRoZSBLY29uZmlnIG9wdGlvbiBhbmQgdGhlIG9yaWdpbmFsIHBhdGNoIG5ldmVyIG1lbnRpb25l
ZAo+Pj4gdHJ5aW5nIHRvIGF2b2lkIGEgZGVwZW5kZW5jeSBvbiB0b29sY2hhaW5zIGF0IGFsbCwg
anVzdCBrZXJuZWwKPj4+IGNvbmZpZ3VyYXRpb25zLiBUaGUgdG9vbGNoYWluIHJlcXVpcmVtZW50
cyBJIGRvbid0IHRoaW5rIGFyZSBldmVuIHN1cGVyCj4+PiBoYXJkIHRvIGZ1bGZpbGwgZWl0aGVy
IC0gdGhlIGxhc3QgMyB2ZXJzaW9ucyBvZiBsZCBhbmQgbGxkIGFsbCBtZWV0IHRoZQo+Pj4gY3Jp
dGVyaWEuCj4+Cj4+IFRoYW5rcyBmb3IgbWFraW5nIGl0IG1vcmUgY2xlYXIsIGFuZCBJIGFncmVl
IHRoYXQgdGhlIHRvb2xjaGFpbgo+PiByZXF1aXJlbWVudHMgYXJlIG5vdCBoYXJkIHRvIGZ1bGZ1
bGwuCj4+Cj4+IE15IHZpZXcgaGFzIGJlZW4gdGhhdCAiQlBGIGlzIGxpa2UgdXNlcmxhbmQiLCBi
dXQgSSByZWFsaXplIG5vdyB0aGF0J3MKPj4gb2RkLgo+IAo+IFllYWgsIEkgY2FuIHVuZGVyc3Rh
bmQgdGhhdCBwZXJzcGVjdGl2ZSwgYnV0IGl0IGRvZXMgc2VlbSByYXRoZXIgb2RkIHRvCj4gc29t
ZW9uZSB0aGF0IGlzbid0IGEgYnBmLWlzdC4KPiAKPj4gTGV0J3MgbWFrZSBCUEYgc2ltaWxhciB0
byB0aGUgcmVzdCBvZiB0aGUgUlYga2VybmVsLiBJZiBaQkI9biwgdGhlbgo+PiB0aGUgQlBGIEpJ
VCBkb2Vzbid0IGtub3cgYWJvdXQgZW1pdHRpbmcgWmJiLgo+IAoKSGkgQ29ub3IgYW5kIEJqw7Zy
biwKClRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4gSSB0b3RhbGx5IGFncmVlIHdpdGggd2hh
dCB5b3Ugc2FpZCwgCiJDT05GSUdfUklTQ1ZfSVNBX1pCQiBvbmx5IGNvbnRyb2xzIHdoZXRoZXIg
b3B0aW1pemF0aW9ucyBmb3IgWmJiIGFyZSAKYnVpbHQgc28gdGhhdCBpZiBaYmIgaXMgZGV0ZWN0
ZWQgdGhleSBjYW4gYmUgdXNlZC4iLgoKU2luY2UgdGhlIGluc3RydWN0aW9ucyBlbWl0ZWQgYnkg
YnBmIGppdCBhcmUgaW4ga2VybmVsIHNwYWNlLCB0aGV5IApzaG91bGQgaW5kZWVkIGJlIGFsaWdu
ZWQgaW4gdGhpcyByZWdhcmQuCgpQUzogSXQncyBhIGJpdCBkaWZmaWN1bHQgdG8gdW5kZXJzdGFu
ZCB0aGlzLPCfmIUgaWYgSSdtIHdyb25nIHBsZWFzZSBkb24ndCAKaGVzaXRhdGUgdG8gdGVsbCBt
ZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
