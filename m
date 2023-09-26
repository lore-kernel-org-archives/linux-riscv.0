Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4903E7E635
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJhN1OvHDhUnADHEOly+DSZDSgRDm8BsyMCmKWWg114=; b=srrPARWnQwIJ6C
	GO7azPwfZm91WvegNaVptjny9haWkwKXilzVGXLvyVY60yi86asXI0+v6NUMWGAw14k8gFE8jUEb1
	ZExiDi57VqZYndmK/zEBJ585junPKnLeekf+E8hF+BtQc8xHJBHP0/brG1icp0pioyAPvNmU++39J
	9HcH22rkXa4BVsiUJ6XkVps55BxQnhwu6OGCPVLKV61fRhAXSj38+kyAAdj9yehcXfo7Mj5EODF+Y
	fT1ERiqETfWtb7bmGwl9Fbt7J+U7EJXUB8Ex8WT6V+TMTb3DMImB/KdkV43E7OaIl1Iw8x0jVP/Dm
	4lJiuNkrStYujXU+cWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql89O-00GTaW-08;
	Tue, 26 Sep 2023 13:30:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql89L-00GTZ2-2I
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 13:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C625CCE1361;
	Tue, 26 Sep 2023 13:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BF2C433C8;
	Tue, 26 Sep 2023 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695735049;
	bh=PDbcZR8qPDhdOJhOEKqwAYz8JhEa7RPGxuFdjlVwC70=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FIA+Tdrasc/f1J8sY5um2A/XD5UrwACQK+ZfQRk+MZKzf0k49rBfciCxJJdiLZtOK
	 zTIemt7kNlOCYgf1bvrx7hfivIZ0XS0f1hZWaU8SZlR2pEHXnwywxVW27K63MmmtZd
	 CYh7B47YFYJP0Exw0ruCDS1rJ4saPeEUQdHOMx+Aem3SXDw6booCMTZUaOECBU6YOq
	 lb6xGM20F24KCNsq7SDaK9R/CbJqYswFqcSGIurxJNmE0hOWNZWXr0jvvaDqr0j4wk
	 wbW3VUB0nxsMlz7HbVYr0OoupRaBeyFiNgp7itmAE/+eOUfJSQ5ThROpoylPdgR1p6
	 KA7v893YSk6aA==
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
Subject: Re: [PATCH bpf-next v2 0/6] Zbb support and code simplification for
 RV64 JIT
In-Reply-To: <20230919035839.3297328-1-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
Date: Tue, 26 Sep 2023 15:30:44 +0200
Message-ID: <8734z1oyd7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_063051_943673_2DB30B5F 
X-CRM114-Status: UNSURE (   4.87  )
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
CkFwb2xvZ2llcyBmb3IgdGhlIHJldmlldyBkZWxheS4gSSdtIHRyYXZlbGxpbmcsIGFuZCB3aWxs
IHBpY2sgaXQgdXAgQVNBUAp3aGVuIEknbSBiYWNrLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
