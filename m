Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BB7C3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mm1a0lpJS5DyEHneYw0lzZz5fdQGst8wHZvOs+BYICs=; b=SGRREOiVUZphu0
	qW3rLFsbNFSW+LPbKmwYtZTTtvB4rLEiP5g2gn9zkbZgOA+l+1roF0++sAXFyDiAKyr6XCAc+qdoR
	bcSoeDlyhVzgMzoPgQsUI3+sgA83VWvyk80RfoBUIqApcoXR82AFHX8MvnTNAHncMfb9oF4+fg+5b
	D+OslWxrif629v3tjnL/tyEJAGymK/fmeRP5qKGxm9ACSSbYYXbchp6q9OQTdqgB+DKRQX1yXD3PO
	4ySfWfuLUzJXqyHy2JgCPRxrUp1l+MPaPYz0J0FilNZK5JF8KH0dFpFpf7asuCYA3OVNJjMMaCZOA
	std6sF23sR/AyDTQfvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsMx-001IAH-1h;
	Wed, 23 Aug 2023 18:14:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsMu-001I9n-1z
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:14:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 131B363067;
	Wed, 23 Aug 2023 18:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A293FC433C8;
	Wed, 23 Aug 2023 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692814451;
	bh=6WYbdQvbaUTU7jAYsOoRLczdc6WiEmOJqx1owqQdczY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jnp9OnkqCFGBj/h9OTMFiamfq/+P0dMbhMG2wym3WRwS3We453QbP6a6Naa6WA/55
	 d4lxewnPO9sJ/eOFdW8Id7q+oLH+qu5WfYDQfCvEZsEqA4fHS1ZXjl/MCVrHUqcm2V
	 rQnTACprz2PN91Wy6YquXbrmyxgR7JTtwCnIMQ5ArUm5o9SmwEW1AslQAiAZraDgQF
	 h2tDxxbMKoaqy+zaiPzYbMLAi/oaijp+DPUTHk158fgQD2Ywb/PZFPbzgyDYkg8qH9
	 1W3Xw4IOX9qUdj1RLfiTo/cEPzNfdE8Ln2S04DCPkN4s+5vlwAgONpQFbmC2McakrT
	 EjkJ7PP63sJqw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri
 Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai
 <xukuohai@huawei.com>, Puranjay Mohan <puranjay12@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 3/7] riscv, bpf: Support sign-extension mov insns
In-Reply-To: <20230823231059.3363698-4-pulehui@huaweicloud.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-4-pulehui@huaweicloud.com>
Date: Wed, 23 Aug 2023 20:14:07 +0200
Message-ID: <87pm3dlj80.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_111412_693736_F1654875 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgc3VwcG9ydCBzaWduLWV4dGVuc2lvbiBt
b3YgaW5zdHJ1Y3Rpb25zIGZvciBSVjY0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQu
YyB8IDE0ICsrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBpbmRleCBmZDM2Y2Ix
NzEwMWEuLmQxNDk3MTgyY2FjZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IEBAIC0x
MDQ3LDcgKzEwNDcsMTkgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNuKGNvbnN0IHN0cnVjdCBicGZf
aW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgsCj4gIAkJCWVtaXRfemV4dF8z
MihyZCwgY3R4KTsKPiAgCQkJYnJlYWs7Cj4gIAkJfQo+IC0JCWVtaXRfbXYocmQsIHJzLCBjdHgp
Owo+ICsJCXN3aXRjaCAoaW5zbi0+b2ZmKSB7Cj4gKwkJY2FzZSAwOgo+ICsJCQllbWl0X212KHJk
LCBycywgY3R4KTsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSA4Ogo+ICsJCWNhc2UgMTY6Cj4gKwkJ
CWVtaXRfc2xsaShycywgcnMsIDY0IC0gaW5zbi0+b2ZmLCBjdHgpOwo+ICsJCQllbWl0X3NyYWko
cmQsIHJzLCA2NCAtIGluc24tPm9mZiwgY3R4KTsKCllvdSdyZSBjbG9iYmVyaW5nIHRoZSBzb3Vy
Y2UgcmVnaXN0ZXIgKHJzKSBoZXJlLCB3aGljaCBpcyBjb3JyZWN0LgoKKFNpZGUgbm90ZTogTWF5
YmUgaXQncyB0aW1lIHRvIGFkZCBaYmIgc3VwcG9ydCB0byB0aGUgSklUIHNvb24hIDstKSkKCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
