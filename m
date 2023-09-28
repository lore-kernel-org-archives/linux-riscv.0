Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA38CE7B17
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 10:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFs7KNfbTi6dyjd4AI3Hhxtwa7EoDbTXS6xLQXiSUQg=; b=cka8N9TyoINpgn
	M0/L2C4NNEfZqELZyj2jRWNASXTYMroXOpSmUZ5r//BIgjG24EMpzxGGsObNrX60Lp08s+Rd1z9zJ
	/xizmCFGniq7Tykj+eH3wAf5QltFIJhycDnj6SVA9Hj6CVTufbTa8y9O2qOUzw0dSQ1x8VxH0eM5h
	5TYAb/o8zbpxv24J8Vj3gTUlt2vUjhownM/SQHbgVqXqbYgmQlTV5TiMtobZMUauo25vV/jPikqXF
	IkMibs9rhvhzFIR8IOLQTwFbsz+bT1xNJm1bX5Ng8W80bDVh0NQanRTUaMb81cQn3HebJvKw+A7oH
	BYArIHMp8oQYIzk20gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloX0-002vep-1J;
	Thu, 28 Sep 2023 10:46:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloWx-002vcs-0D
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 10:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5097161215;
	Thu, 28 Sep 2023 10:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6EDC433C8;
	Thu, 28 Sep 2023 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695897962;
	bh=h+CNXH1b6Tz9pCCf5S9IaQ4Eb6+7xgTE44+TmH9sZW8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=THpJNRRpXy1xb+2sMAW+kvqp1dtP8aXZmfthzvlK38+OXQEowIh0VJ1mffL0zLUkT
	 QyL5PsTLVmJJHNQ9vrMwOncvfY/GFNLs2IFKBDwOQ8iJlI9eJOOwttlnL6C+t/RjaY
	 Aqho0D/vXyaiQpUAtScMv9abO0TTtc3nQF5bEL4OGH3eqGCwLXwOXNavSTKchMuKvI
	 aAQC34TA2jewdbmYki8umEkJSHo/tJkfucGtqPB8wo+dB8xTGeB21wNMxFJzUBqONE
	 mPHmyP4HDUggC/3kiFN0GLL0kq0d96lPyv/pXVopfYRQHgNE7tQSwSVD0l/Z+A7+VX
	 rZ/vxUE/iCYQg==
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
Subject: Re: [PATCH bpf-next v2 1/6] riscv, bpf: Unify 32-bit sign-extension
 to emit_sextw
In-Reply-To: <20230919035839.3297328-2-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-2-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 12:45:59 +0200
Message-ID: <87bkdmo9so.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_034603_162122_EB820DAD 
X-CRM114-Status: UNSURE (   3.98  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBGb3IgY29kZSB1bmlmaWNhdGlvbiwgYWRkIGVt
aXRfc2V4dHcgd3JhcHBlciB0byB1bmlmeSBhbGwgdGhlIDMyLWJpdAo+IHNpZ24tZXh0ZW5zaW9u
IG9wZXJhdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWku
Y29tPgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
