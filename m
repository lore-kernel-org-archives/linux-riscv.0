Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005B5C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uq5GrK9csKVDgc0u+DYc0k7NuXMjvUe8Je80nLiVGD4=; b=3UOuM+kTxz8geM
	owB6fPrUiGq6l177d9CDI/WcrecFEZR2BksrWovQR21Uf2pJLaXJ1GI+nk/iID5CEUjbCuLCyoPVd
	oZzBJNeG1Pcnco02VdDc2Z+/1tBDjfAX1gGfu/wTqgV+O0322qnUPgcQ6he/zIfa9UbLCE8zaA6SG
	qN6PNeztpz42loJpmg0H8LexUwp7DVPL4kREhxBOJhhT1zW6iM90XeqaxiIDsP8XZbdmLis4AUFCi
	HKs5ViFcVaqFnSkSu+OW3UTPmaiZhirqCHo6sNctlqHAXNEuTIZh4La+jqNm9t8YCkU80Y5u8v3Ga
	bnzikTnBKFIa5UiVXZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqjQ-00000001lMY-40wx;
	Mon, 25 Mar 2024 20:15:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqjN-00000001lKT-3NGQ
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A1A81CE1CFD;
	Mon, 25 Mar 2024 20:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB76C433F1;
	Mon, 25 Mar 2024 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711397738;
	bh=VnLILID+B4AMhTkZ41ybygjTq3wYwO3V7O/AXYomsuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Cuh01lJp5vogSObIBpycMUzfX0whg8W2LHhV+rxvsyYYcy4Hn3vZH4GKGoaTSj6as
	 Ho9/uJJWQrZdOFyqv55geuMINcPN7mIrNVAReXXbHMKvCMZ72FAu/9z4yvE+OYz+i/
	 BOneQVelLQBCjs+4udPyGAb4w8zY8B1OAENKvSZ5qBCpFU25bbkoCvETuayzuj/YZW
	 GRx7gPPvhXJ1iCoiLPbKBqxG+wqNBEhF91cg4SJOStJkwOI4DhMPBC7IZwJosz7zwA
	 ywXg1UeD4cFpwxdmAfsPchSbxwRMO6zIvJbyzsf1UhNThOtbQQLaPtWWquNY/FVU+l
	 f+TYNDP8cHECg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Puranjay Mohan <puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf,riscv: Implement
 bpf_addr_space_cast instruction
In-Reply-To: <20240325-perpetual-liking-25f26e485b65@spud>
References: <20240325155434.65589-1-puranjay12@gmail.com>
 <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
 <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
 <20240325-perpetual-liking-25f26e485b65@spud>
Date: Mon, 25 Mar 2024 21:15:35 +0100
Message-ID: <87il1a3w60.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_131542_047134_723B3AA1 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEJqb3JuLCBkbyB5b3Ug
dGhpbmsgdGhlcmUncyBhbnl0aGluZyB3ZSBjYW4gZG8gYWJvdXQgdGhlc2Uga2luZGEKPiBtaXNs
ZWFkaW5nIENJIGZhaWx1cmVzIGZvciBicGYgc3R1ZmY/IFNvbWUgc3R1ZmYgdGhhdCB0b3VjaGVz
IGJwZgo+IGRlZmluaXRlbHkgaXMgd29ydGggdXMgYnVpbGRpbmcsIGJ1dCBzaG91bGQgd2UgdHJ5
IGFuZCBidWlsZCBpdCBvbiB0b3AKPiBvZiB0aGUgYnBmIHRyZWUgaW5zdGVhZD8KCklNTzogVGhl
IHdheSB0byBnbyBpcyBlbmFibGluZyBSViBzdXBwb3J0IGluIHRoZSBCUEYgQ0kgKEknbGwgZXhw
YW5kIG9uCnRoaXMgaW4gUHVyYW5qYXkncyBsYXRlciBtYWlsKSwgYW5kIGlnbm9yZSBCUEYgc2Vy
aWVzIGZvciB0aGUgUlYKcGF0Y2h3b3JrIENJLiBJIHRoaW5rIGhhdmluZyBtdWx0aXBsZSB0cmVl
cyBpbiB0aGUgUlYgQ0kgaXMgbm90IHdvcnRoCnRoZSBwYWluLi4uCgpTb3J0IG9mIHJlbGF0ZWQg
aXMgdGhhdCBJIHRoaW5rIGl0IGNvdWxkIGJlIHdvcnRod2hpbGUgb25seSBidWlsZGluZwpzZXJp
ZXMgdGhhdCBoYWQgc29tZSBodW1hbiBpbnRlcmFjdGlvbiAoYSBwYWlyIG9mIGV5ZXMgLS0gInll
cywgdGhpcwpkb2VzIG1ha2Ugc2Vuc2UgdG8gYnVpbGQiKS4gUmlnaHQgbm93IHdlJ3JlIGp1c3Qg
YnVpbGRpbmcgZXZlcnl0aGluZywKYW5kIHdlIGhhdmUgdG8gcGF5IChtb25leSAqYW5kKiB0aW1l
KSBmb3IgaXQuCgouLi5hbmQgdGhlbiB0aGUgQlBGIHNlcmllcyB3b3VsZCBlLmcuIG5vdCBiZSBi
dWlsdCBhdCB0aGUgUlYgUFcgQ0kuCgoKKEJ1dCBtb3N0bHkgbWUgdGhpbmtpbmcgb3V0IGxvdWQh
IDstKSkKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
