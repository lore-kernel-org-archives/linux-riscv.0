Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB41C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3CfE8vXXqnSuE5yrLv0q4elFKcXfHk9M6BW/0AMzSY=; b=Rl1eCb8dgCmbOd
	bQQ3U7j4RjvpQ8B4JIP27drA7EKGOCCi3v4yXweWKDeBGCR5gll2Ne56m9z6DhW23EeUKiX1GMwBD
	mD1hU+q96kvrzGMUSCj/DDgPjBJtBGDPDJy8MUG91OvoGemJ5GSZ9gyf/pdTcF7xve//1OsbiQW89
	Ar1Fxq27BSCu9/Jax0x/GrUY6YUaQv8PyA5HlrLQHhhKo4mHQ2qEgAHVaXuJDIJRws/wqXG/uGRXY
	8ZSBMTkGhYpuNlJxrY6O95glfy9NlhZ3yYNu8S6iOZi1ju37EsXaUvDhBcQnmQHQyDvbAiMC3aiA1
	IQSPAiw0+ZBoRzhZ9GUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqbt-0000000HIHY-3mVb;
	Tue, 30 Jan 2024 16:05:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqbq-0000000HIFz-2vpO
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 16:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67727CE1B5B;
	Tue, 30 Jan 2024 16:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AF6C433C7;
	Tue, 30 Jan 2024 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630706;
	bh=DBArYt3O7YbnHeaa2xMlrJjlbXf9RshDy8kF0mLdvX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uzIUzbHv8e/qwu2wxd1x9xb8oI4wE+j4nDKnk6Jj5SWajcUxbNLbOWtXqu3nh2hsN
	 eFUMmhzZusitpdCNlv4BIsX9HBEIqH81vQpCBFPF/AQBANu4prr/C756V6hBQuEEqm
	 627yJMM/tlADyOzWGO0yvkuJ27YCPptPe7Mem1a1qt0dVLOLM3opqedQ8D/ExmRVcA
	 M/1W13yQ1smp7O3s3TSz6Mc3YsXioSryZ3OgDCHfqVAIvjFmgXJkpsvg4/zn6J/5v8
	 N1Slvg9FPFlsYjo7MB3MCBcI1TGRx4c9HbKZB8JN5paP+IC0QpjM/GJATK74EgtN1B
	 /bQPrDtA6QuQQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 2/4] riscv, bpf: Using kvcalloc to allocate
 cache buffer
In-Reply-To: <20240130040958.230673-3-pulehui@huaweicloud.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
 <20240130040958.230673-3-pulehui@huaweicloud.com>
Date: Tue, 30 Jan 2024 17:05:03 +0100
Message-ID: <87cytiq028.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_080514_925733_4A7F4213 
X-CRM114-Status: UNSURE (   5.11  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBJdCBpcyB1bm5lY2Vzc2FyeSB0byBhbGxvY2F0
ZSBjb250aW51b3VzIHBoeXNpY2FsIG1lbW9yeSBmb3IgY2FjaGUKPiBidWZmZXIsIGFuZCB3aGVu
IGVicGYgcHJvZ3JhbSBpcyB0b28gbGFyZ2UsIGl0IG1heSBjYXVzZSBtZW1vcnkKPiBhbGxvY2F0
aW9uIGZhaWx1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWku
Y29tPgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
