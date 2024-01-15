Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924B7C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uruUo4X3SMy9B3+ilv+b5DybB7/FoU1ufkqEt17dBlE=; b=zO9NurWBg6ZSEg
	UF2zRuDLDfoF4W9Ob4MRX82XR6MeoV6tq5qpi53NZcHA902x4blw6lRvLjbea2P5KNy5sIgYNxnUu
	Mp2NJMkSY+lN3AvPgg5Pa8Y0YfX7nwfr2lvnKFd+rtAKQZyCCvHINoErqe3EhPPwGl6AQDlNc8E/j
	d90muM8IbNKU9tzSTLrS8BR24aRH5sPjost2EO5YG2AVwCu0g0RHi2BPdc9fSwGkvaGdLZE1a45Sa
	bIqySzK2rZfvaW8FVTTVJ7KkURMiR2hFgdnK8ig02KkiNZ0L9A8dN5jgyVZ5EvWCiHt+gSisvBO2W
	DlQJknXhfcRmDzfoPBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPLzm-008tfE-20;
	Mon, 15 Jan 2024 12:23:14 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPLzj-008tdL-1j
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 12:23:13 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TDB9k6h6Qz4f3jJ4
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:22:50 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 0C3341A0172
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:22:53 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgAHDnCbI6VlFlyqAw--.55742S2;
	Mon, 15 Jan 2024 20:22:52 +0800 (CST)
Message-ID: <421fcfcd-6be6-4dfc-9948-3b57c7517538@huaweicloud.com>
Date: Mon, 15 Jan 2024 20:22:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 0/6] Zbb support and code simplification for
 RV64 JIT
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
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <87h6neo9vh.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87h6neo9vh.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: gCh0CgAHDnCbI6VlFlyqAw--.55742S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy5ZFWrWFyfKrWkGr1UGFg_yoW3ZFX_ua
	1qy3sIv3W0vryfJw43tan5WFZ7Ar4DKryDur1jgr1Uu34UZrs5Cw1vvrn5AaykWan0kF9F
	qFs0vF1jyr129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_042311_760950_942C91CF 
X-CRM114-Status: UNSURE (   6.44  )
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

CgpPbiAyMDIzLzkvMjggMTg6NDQsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEFkZCBaYmIgc3VwcG9ydCBbMF0g
dG8gb3B0aW1pemUgY29kZSBzaXplIGFuZCBwZXJmb3JtYW5jZSBvZiBSVjY0IEpJVC4KPj4gTWVh
bndoaWxlLCBhZGp1c3QgdGhlIGNvZGUgZm9yIHVuaWZpY2F0aW9uIGFuZCBzaW1wbGlmaWNhdGlv
bi4gVGVzdHMKPj4gdGVzdF9icGYua28gYW5kIHRlc3RfdmVyaWZpZXIgaGF2ZSBwYXNzZWQsIGFz
IHdlbGwgYXMgdGhlIHJlbGF0aXZlCj4+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4KPiAKPiBO
aWNlIHdvcmshCj4gCj4gRGlkIHlvdSBtZWFzdXJlIGhvdyB0aGUgaW5zdHJ1Y3Rpb24gY291bnQg
Y2hhbmdlZCBmb3IsIHNheSwgdGVzdF9icGYua28KPiBhbmQgdGVzdF9wcm9ncz8gPgoKU29ycnkg
Zm9yIG5vdCByZXNwb25kaW5nIGZvciBzbyBsb25nLgoKSSBtYWRlIHN0YXRpc3RpY3Mgb24gdGhl
IG51bWJlciBvZiBib2R5IGluc3RydWN0aW9ucyBhbmQgdGhlIGNoYW5nZXMgYXJlIAphcyBmb2xs
b3dzOgoKdGVzdF9wcm9nczoKMS4gdmVyaWZpZXJfbW92c3g6IDI2MCAtPiAyMjQKMi4gdmVyaWZp
ZXJfYnN3YXA6IDE4MCAtPiA1NgoKdGVzdF9icGYua286CjEuIE1PVlNYOiAxNTQgLT4gMTQ2CjIu
IEJTV0FQOiAzMzYgLT4gMTM2CgpXZSBjYW4gc2VlIHRoYXQgdGhlIGNoYW5nZSBpbiBCU1dBUCBp
cyBvYnZpb3VzLCBhbmQgdGhlIGNoYW5nZSBpbiBNT1ZTWCAKaXMgaW4gbGluZSB3aXRoIGV4cGVj
dGF0aW9ucy4KCj4gCj4gQmrDtnJuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
