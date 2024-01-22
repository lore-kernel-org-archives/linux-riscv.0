Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A557EC47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhpxWxyGH4TGpI++6TbOSgiKg+HZH063tBgdCA8XQtQ=; b=IFkwAC1oXPy4Lw
	Ghv+3a0uuAftOpedTfhwarR8Xns8m6jAd6GWeEYydqjl6qP8N26a65dblK4XY8CyF2LH3pLcpWWTi
	HBHWMnHgFwF7Hs+XJx8hnfNHtJTOTzXsDe21TF6w9IwSsgXz1NyVc5slxRaRDqo/OsjB4dgUHtOln
	a+YXEi/RDaFgr11x+EkWSKhQ/jQVj612fCT0HxqZ94/IVjcPBPcBJfUPqPgRkahLI7NZasCfr+oH+
	eWIMIm98y/EqIBk8ErhHAXXFeV7AHeTGXMJGKw6qfGdcwkAaUUULpMN9aIkljKLAITYrPeMgwieXM
	nTsc15LsPID69ms+CXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvMo-00CPkN-2a;
	Mon, 22 Jan 2024 14:33:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvMm-00CPjf-0c
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 14:33:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F302461493;
	Mon, 22 Jan 2024 14:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D4BC433F1;
	Mon, 22 Jan 2024 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705934012;
	bh=8gCK9vmYYbOmXz91aeGohAAbZ9CT8MPYBv+dkby9x6g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SS2SBpYwtQoQnArem80S7dL4zsJ2zVdK5bcRSlUrJvQR1V4o1MX2/RfEXhr9/r13A
	 8b/Ncj+rdng+0cBrQCZUlCPpusOa/m/AL7HtQ+i4xEtIxxEqFg5Ybs2XPI5U/ZIQBN
	 g2/jqv+0ts2Mg3+qaoG8mMPGgsxV91EkU5UJmdhcE04PsnBWN0fXBTnzEaBSYFPDmb
	 zFp78QiqOC/cORxGM2AVJgujShJlIiDsZvo3dUyqMmh9nZjMUBSMRQwETCXBiP3lEc
	 e6SZkwL0F2xpO5Q7GgkOAINufxnQ/y7qEUtCEszbU6e+6QBtVT+i0zk9dzjWG3vKC7
	 KkERSGly33Jug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code
 simplification for RV64 JIT
In-Reply-To: <20240115131235.2914289-1-pulehui@huaweicloud.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
Date: Mon, 22 Jan 2024 15:33:29 +0100
Message-ID: <87il3lqvye.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_063336_290247_14E8D0A3 
X-CRM114-Status: UNSURE (   5.60  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEFkZCBaYmIgc3Vw
cG9ydCBbMF0gdG8gb3B0aW1pemUgY29kZSBzaXplIGFuZCBwZXJmb3JtYW5jZSBvZiBSVjY0IEpJ
VC4KPiBNZWFud2hpbGUsIGFkanVzdCB0aGUgY29kZSBmb3IgdW5pZmljYXRpb24gYW5kIHNpbXBs
aWZpY2F0aW9uLiBUZXN0cwo+IHRlc3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFz
c2VkLCBhcyB3ZWxsIGFzIHRoZSByZWxhdGl2ZQo+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4K
Pgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1iaXRtYW5pcC9yZWxlYXNl
cy9kb3dubG9hZC8xLjAuMC9iaXRtYW5pcC0xLjAuMC0zOC1nODY1ZTdhNy5wZGYgWzBdCj4KPiB2
MyByZXNlbmQ6Cj4gLSByZXNlbmQgZm9yIG1haWwgYmUgdHJlYXRlZCBhcyBzcGFtLgo+Cj4gdjM6
Cj4gLSBDaGFuZ2UgdG8gZWFybHktZXhpdCBjb2RlIHN0eWxlIGFuZCBtYWtlIGNvZGUgbW9yZSBl
eHBsaWNpdC4KCkxlaHVpLAoKU29ycnkgZm9yIHRoZSBkZWxheS4gSSdtIGNoYXNpbmcgYSBzdHJ1
Y3Rfb3BzIFJJU0MtViBCUEYgcmVncmVzc2lvbiBpbgo2LjgtcmMxLCBJIHdpbGwgbmVlZCB0byB3
cmFwIG15IGhlYWQgYXJvdW5kIHRoYXQgcHJpb3IgcmV2aWV3aW5nCnByb3Blcmx5LgoKCkJqw7Zy
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
