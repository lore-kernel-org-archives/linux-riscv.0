Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2995BEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 20:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TUbyBQzFsKbPMbNqwZL19YnZdmU5sgkPjgFU1gByTY=; b=VCn/8qz9AKWTnA
	CPBObxFKEzrKSCop5j2Z79a4H+qRktbjynhbFWR+DTymbcAdO/FSZ3TovRg6GesMrrbxEOU33V+ja
	8+v9Hyu2LVG/5ovjEkoQlpaaSuI7NMBq51EtfIFnevg4ogHJ+3fdHS0ZEj5qOrfnSoOv0o0sHeusK
	hL2xgWW++A1yb/z7Ai4I72xFUSWzTpYs1tqoJwm2A+ImHGH0UFPJqCKXkYxkt6TtxCmc3mL6CoFD5
	Wun6zx4Luu6GC7Sf3tvsvEv+jszBRz8Uw+1a3je6mHi8+nt2RSkFZMUqNhsrxPl4RTjmTu3/UBGJW
	RAa0gjCberRPXhpFDMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwx9-00F4am-1L;
	Fri, 21 Jul 2023 20:42:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwx6-00F4aF-30
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 20:42:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 505FC61D9F;
	Fri, 21 Jul 2023 20:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AACFC433C7;
	Fri, 21 Jul 2023 20:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689972135;
	bh=mF5hO4cnwx7N31AkSxnv7cO0zNt07otNtqJAFumdlE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eKjjfhikUtSgz9IY1Im/x92qqghAZ+amTqT6cStSSg0vRWwf399UbiMjxveCUBz54
	 6kXVIYY19sq2q0BExt6lyaKUG1j35X8LNwXHzcouFW7ET2PgcC8+wl/uR3beuea/nf
	 Qdyp7UiKi0vnnk5+3RCRNl+7WknYZkNJ60JaOClQKYiZDOeE8NsYkBcXmAs3PD4R4O
	 cVqK7lWoaxuMB8T1tPRqedTVbzrjgQ21+387A2qV0j13TN4cJBrbxI7P7XhN1Zmuh5
	 xB3P1bMj/p+gx4P+/+Z2d60iiDXjtNZRZsiMID4j+E64e3DWTRNucqm7iaRpPaXzwt
	 u2qQm8fZibvvw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Guo Ren <guoren@kernel.org>, Song Shuai
 <suagrfillet@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH v2] riscv, bpf: Adapt bpf trampoline to optimized riscv
 ftrace framework
In-Reply-To: <20230721100627.2630326-1-pulehui@huaweicloud.com>
References: <20230721100627.2630326-1-pulehui@huaweicloud.com>
Date: Fri, 21 Jul 2023 22:42:12 +0200
Message-ID: <87sf9hgfob.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_134217_011088_3F3AC157 
X-CRM114-Status: UNSURE (   9.91  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBDb21taXQgNjcyNGE3NmNmZjg1ICgicmlzY3Y6
IGZ0cmFjZTogUmVkdWNlIHRoZSBkZXRvdXIgY29kZSBzaXplIHRvCj4gaGFsZiIpIG9wdGltaXpl
cyB0aGUgZGV0b3VyIGNvZGUgc2l6ZSBvZiBrZXJuZWwgZnVuY3Rpb25zIHRvIGhhbGYgd2l0aAo+
IFQwIHJlZ2lzdGVyIGFuZCB0aGUgdXBjb21pbmcgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1Rf
Q0FMTFMgb2YgcmlzY3YKPiBpcyBiYXNlZCBvbiB0aGlzIG9wdGltaXphdGlvbiwgd2UgbmVlZCB0
byBhZGFwdCByaXNjdiBicGYgdHJhbXBvbGluZQo+IGJhc2VkIG9uIHRoaXMuIE9uZSB0aGluZyB0
byBkbyBpcyB0byByZWR1Y2UgZGV0b3VyIGNvZGUgc2l6ZSBvZiBicGYKPiBwcm9ncmFtcywgYW5k
IHRoZSBzZWNvbmQgaXMgdG8gZGVhbCB3aXRoIHRoZSByZXR1cm4gYWRkcmVzcyBhZnRlciB0aGUK
PiBleGVjdXRpb24gb2YgYnBmIHRyYW1wb2xpbmUuIE1lYW53aGlsZSwgd2UgbmVlZCB0byBjb25z
dHJ1Y3QgdGhlIGZyYW1lCj4gb2YgcGFyZW50IGZ1bmN0aW9uLCBvdGhlcndpc2Ugd2Ugd2lsbCBt
aXNzIG9uZSBsYXllciB3aGVuIHVud2luZGluZy4KPiBUaGUgcmVsYXRlZCB0ZXN0cyBoYXZlIHBh
c3NlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CgpJ
J2xsIGRvIGEgcHJvcGVyIHJldmlldyBsYXRlciAoc3RpbGwgb24gdmFjYXRpb24pLCBidXQgSSBy
YW4gdGhlCnRlc3RfcHJvZ3MgQlBGIHNlbGZ0ZXN0IHdpdGggdGhlIGZ0cmFjZSBzZXJpZXMgWzFd
IHdpdGggdGhpcyBwYXRjaCBvbgp0b3AuCgo4MSBtb3JlIHRlc3RzIHBhc3Mgd2l0aCBbMV0gcGx1
cyB0aGlzIHBhdGNoLCB3aGljaCBpcyBncmVhdCEKClByZS1wYXRjaGVzIFsyXSwgcG9zdC1wYXRj
aGVzIFszXS4KCkZlZWwgZnJlZSB0byBhZGQ6ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgoKCkJqw7ZybgoKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDIzMDYyNzExMTYxMi43NjExNjQtMS1zdWFncmZpbGxldEBnbWFpbC5jb20v
ClsyXSBodHRwOi8vaXguaW8vNEI5ZQpbM10gaHR0cDovL2l4LmlvLzRCOWYKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
