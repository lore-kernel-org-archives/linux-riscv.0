Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB0BCE7B19
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDrYZcCSW/79xEsFH5rbdJUHqp+YTc0sG0nxg6Pn4y8=; b=PVJauht+Ej+288
	byQ6PaFiKJ4daKpmzV0iisZylbmOCyyZUce954hp5iB8ytDwxT4pwidcyHbQ/VlVjRWuvXszc1vmV
	zQUJVFxZzp1Vr9uh24/vmazXKbJOLHDtin0fEjq0SHNFTa1FZK/ak2ivtNGF41qW2TAeIxwcR+N3S
	dbSBykW2+3+jGL2VwRMrjGfXqKqEOF9kz8QGKCjKCJwcIoopespJDQsK32c0k2rWs+Svnj4DDsd/b
	CIM4SvFHShtN+U2JVlAoXO79dVuIQ8EHIGrXJisphNXseZza2213NPQzJGrvuUR9wXmHps6JVX+NA
	rs789lCkC7qQ4yZkdnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloQr-002tdP-0v;
	Thu, 28 Sep 2023 10:39:45 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloQk-002tUs-2w
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 10:39:42 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Rx92f2Jkqz4f3nT7
	for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 18:39:22 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgCHHd3bVxVlJRxmBg--.31819S2;
	Thu, 28 Sep 2023 18:39:24 +0800 (CST)
Message-ID: <8fd3cb4e-bcf0-44d4-b907-7e0795ee90ce@huaweicloud.com>
Date: Thu, 28 Sep 2023 18:39:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
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
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <87lecqobyb.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87lecqobyb.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: gCh0CgCHHd3bVxVlJRxmBg--.31819S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1UZw45CrWkGw17tw1UZFb_yoW8ZFyxpa
	9xua17K3yvgrWSkwnFqF18JFZ5WF4fA3WYyr1aqw1Fya1UCr92gF47KF4j9a48Zrs2k3Wj
	vF4jqa1Duw4DZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_033939_342600_39CE07BF 
X-CRM114-Status: GOOD (  20.57  )
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

CgpPbiAyMDIzLzkvMjggMTc6NTksIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEZyb206IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4+Cj4+IEluIHRoZSBjdXJyZW50IFJWNjQgSklULCBpZiB3ZSBqdXN0
IGRvbid0IGluaXRpYWxpemUgdGhlIFRDQyBpbiBzdWJwcm9nLAo+PiB0aGUgVENDIGNhbiBiZSBw
cm9wYWdhdGVkIGZyb20gdGhlIHBhcmVudCBwcm9jZXNzIHRvIHRoZSBzdWJwcm9jZXNzLCBidXQK
Pj4gdGhlIFRDQyBvZiB0aGUgcGFyZW50IHByb2Nlc3MgY2Fubm90IGJlIHJlc3RvcmVkIHdoZW4g
dGhlIHN1YnByb2Nlc3MKPj4gZXhpdHMuIFNpbmNlIHRoZSBSVjY0IFRDQyBpcyBpbml0aWFsaXpl
ZCBiZWZvcmUgc2F2aW5nIHRoZSBjYWxsZWUgc2F2ZWQKPj4gcmVnaXN0ZXJzIGludG8gdGhlIHN0
YWNrLCB3ZSBjYW5ub3QgdXNlIHRoZSBjYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8KPj4gcGFzcyB0
aGUgVENDLCBvdGhlcndpc2UgdGhlIG9yaWdpbmFsIHZhbHVlIG9mIHRoZSBjYWxsZWUgc2F2ZWQg
cmVnaXN0ZXIKPj4gd2lsbCBiZSBkZXN0cm95ZWQuIFNvIHdlIGltcGxlbWVudGVkIG1peGluZyBi
cGYyYnBmIGFuZCB0YWlsY2FsbHMKPj4gc2ltaWxhciB0byB4ODZfNjQsIGkuZS4gdXNpbmcgYSBu
b24tY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvIHRyYW5zZmVyCj4+IHRoZSBUQ0MgYmV0d2VlbiBm
dW5jdGlvbnMsIGFuZCBzYXZpbmcgdGhhdCByZWdpc3RlciB0byB0aGUgc3RhY2sgdG8KPj4gcHJv
dGVjdCB0aGUgVENDIHZhbHVlLiBBdCB0aGUgc2FtZSB0aW1lLCB3ZSBhbHNvIGNvbnNpZGVyIHRo
ZSBzY2VuYXJpbwo+PiBvZiBtaXhpbmcgdHJhbXBvbGluZS4KPiAKPiBIaSEKPiAKPiBUaGUgUklT
Qy1WIEpJVCB0cmllcyB0byBtaW5pbWl6ZSB0aGUgc3RhY2sgdXNhZ2UsIGUuZy4gaXQgZG9lc24n
dCBoYXZlIGEKPiBmaXhlZCBwcm8vZXBpbG9ndWUgbGlrZSBzb21lIG9mIHRoZSBvdGhlciBKSVRz
LiBJIHRoaW5rIHdlIGNhbiBkbyBiZXR0ZXIKPiBoZXJlLCBzbyB0aGF0IHRoZSBwYXNzLVRDQy12
aWEtcmVnaXN0ZXIgY2FuIGJlIHVzZWQsIGFuZCB0aGUgYWRkaXRpb25hbAo+IHN0YWNrIGFjY2Vz
cyBjYW4gYmUgYXZvaWRlZC4KPiAKPiBUb2RheSwgdGhlIFRDQyBpcyBwYXNzZWQgdmlhIGEgcmVn
aXN0ZXIgKGE2KSBhbmQgY2FuIGJlIHZpZXdlZCBhcyBhCj4gInN0YXRlIiB2YXJpYWJsZS90cmFu
c3BhcmVudCBhcmd1bWVudC9yZXR1cm4gdmFsdWUuIEFzIHlvdSBwb2ludCBvdXQsIHdlCj4gbG9v
c2UgdGhpcyB3aGVuIHdlIGRvIGEgY2FsbC4gT24gKGFueSkgY2FsbHMgd2UgbW92ZSB0aGUgVEND
IHRvIGEKPiBjYWxsZWUtc2F2ZWQgcmVnaXN0ZXIuCj4gCj4gV0RZVCBhYm91dCB0aGUgZm9sbG93
aW5nIHNjaGVtZToKPiAKPiAxIFBpY2t1cCB0aGUgYXJtNjQgYnBmMmJwZi90YWlsbWl4IG1lY2hh
bmlzbSBvZiBqdXN0IGNsZWFyaW5nIHRoZSBUQ0MKPiAgICBmb3IgdGhlIG1haW4gcHJvZ3JhbS4K
PiAyIEZvciBCUEYgaGVscGVyIGNhbGxzLCBtb3ZlIFRDQyB0byBzNiwgcGVyZm9ybSB0aGUgY2Fs
bCwgYW5kIHJlc3RvcmUKPiAgICBhNi4gRGl0byBmb3Iga2Z1bmMgY2FsbHMgKEJQRl9QU0VVRE9f
S0ZVTkNfQ0FMTCkuCj4gMyBGb3IgYWxsIG90aGVyIGNhbGxzLCBhNiBpcyBwYXNzZWQgdHJhbnNw
YXJlbnRseS4KPiAKPiBGb3IgMiBicGZfaml0X2dldF9mdW5jX2FkZHIoKSBjYW4gYmUgdXNlZCB0
byBkZXRlcm1pbmUgaWYgdGhlIGNhbGxlZSBpcwo+IGEgQlBGIGhlbHBlciBvciBub3QuCj4gCj4g
SW4gc3VtbWFyeTsgRGV0ZXJtaW5lIGluIHRoZSBKSVQgaWYgd2UncmUgbGVhdmluZyBCUEYtbGFu
ZCwgYW5kIG5lZWQgdG8KPiBtb3ZlIHRoZSBUQ0MgdG8gYSBjYWxsZWUtc2F2ZWQgcmVnLCBvciBu
b3QsIGFuZCBzYXZlIHVzIGEgYnVuY2ggb2Ygc3RhY2sKPiBzdG9yZS9sb2Fkcy4KPiAKClNvcnJ5
LCBJIGFtIG9uIGhvbGlkYXksIHdpbGwgZGVhbCB3aXRoIGl0IGFmdGVyIHRoZSBob2xpZGF5LgoK
PiAKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
