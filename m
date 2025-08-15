Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A01CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBd+v2a+oWnsLwFEctzuPKxHD23a5O4+6ZTUCk+zwO8=; b=LnVaQv9fz5qIAG
	cNwFM+pmbYv7Bpe+A9SLQZdipumM2RQVYxRrX5dN4kOoxDsQYzdtJ4v7+M3lEuQWhn+DRmFKzZ63w
	Dk8XDy1tHn+0BlzBUYK8qNiTnZhyUqVPkdiQ1zN0az5+OTfPLzbS8shKa5ZMV/XrdGKp0DvUweE2u
	QFhCoi7WqI6Mt2KoiJ62Tlv7WlAjExIvUzNukTd8Dr4SXh3fy1Y/1c8UUKywfKXq4tTD3/WHdAUsU
	O5+aHSOicEVs1YJGD6yqgBNhhS6kZoH2ZY3/GxRRVknd3iweqCfG2UDX/CLEk624HPHmXgPI8fb+G
	CsHQl0WzPmhafVwznBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwtt-00000002vSH-1bsd;
	Fri, 15 Aug 2025 16:03:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuzj-00000002f0X-2ded
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 14:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9AF45C6DA0;
	Fri, 15 Aug 2025 14:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3304C4CEEB;
	Fri, 15 Aug 2025 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755266482;
	bh=skS0HIs2v5vTHHIpHmAGLv/El95Pa4L+GCcYF6GXMd8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iSKFht4bNG0Zxcrzot6TWVgG93pguYaNTqkda5W8BXAVUX8RA6nqCaTYjwM8GeR42
	 5/DDBkCGlf2kGWIlmbC+l+f69oYR+9eCdr7aBE4dIgWS/pQeWG4gBPRUTOFQ5DbhaO
	 N78iG/ObPhKn6WAnXG2p17Pd2qJZjV1hLEdJVObjEC/EDbXXpW6zl72mOYn7chpVM6
	 ropI+yfUYlcPXm+oGtP4XqN50rWu9VJ04B4hfIXVkFLTvJJWCxTrXoxKKZv/mm9lX+
	 sBfa9kOqB3WiTyczqPjYh+fS/R30TsTYhFRUw7kPXW9NfDIqjUPKeQnFm72fmgkPgD
	 1i9LFIlORW/5w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Pu Lehui <pulehui@huawei.com>, Puranjay Mohan
 <puranjay@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv, bpf: fix reads of thread_info.cpu
In-Reply-To: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
Date: Fri, 15 Aug 2025 16:01:19 +0200
Message-ID: <87tt2865w0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_070123_705052_1E6429EF 
X-CRM114-Status: UNSURE (   8.35  )
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

UmFkaW0hCgpSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVz
OgoKPiBIZWxsbywKPgo+IFRoZXNlIHBhdGNoZXMgYXJlIHJlbGF0ZWQgdG8gYSByZWNlbnRseSBx
dWV1ZWQgc2VyaWVzIFsxXSB0aGF0IGZpeGVzIHRoZQo+IHNhbWUgYnVncyBpbiBub3JtYWwgY29k
ZS4gIFRoYXQgc2VyaWVzIGZpbmlzaGVzIHdpdGggYSBwYXRjaCB0aGF0IHdvdWxkCj4gaGF2ZSBl
eHBvc2VkIHRoZSBCUEYgYnVncywgYnV0IGx1Y2tpbHkgaXQgd29uJ3QgZ2V0IG1lcmdlZCB1bnRp
bCB2Ni4xOC4KPgo+IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgQlBGIHRvIHZlcmlmeSB0aGF0
IGl0IGVtaXRzIHRoZSBjb3JyZWN0IGNvZGUKPiBub3csIHNvIGFueSBwb2ludGVycyBhcmUgd2Vs
Y29tZS4KPgo+IDE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNzI1
MTY1NDEwLjI4OTY2NDEtMy1ya3JjbWFyQHZlbnRhbmFtaWNyby5jb20vCgpBcG9sb2dpZXMgZm9y
IHRoZSBzbG93IHJldmlldyEKCkZvciB0aGUgc2VyaWVzOgoKQWNrZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2
b3NpbmMuY29tPiAjIFFFTVUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
