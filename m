Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF55C352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6zJhxpB2hM6KwYFnfbBPxAwL3S3+liIcVFLkydCfhE=; b=1Px1IetoOS1CGk
	k1yFEE+JyRAIFy4wDWyAy+4Vc9H/IoSFYWNae29tI0Sd6z/WrH/yF6zmQnP7MgWIdztHVzjkWsKGB
	+gai/g6MM+xZghNfANkUuaCvZaaRthpdIWoYhyoP2mQzV5colhfy1yr96PYTeRuTXaNJInOtzCQ2x
	8ggS6zUJvVBC4ELIKCi3GRrBfHUZWFLjsN+8zUbX/vrOAIae0laOfEuRDvT3ngpb8M6PMXMgW7yL6
	QVczl5JjpyVhT2id0A8ApWlP+wiRv4meG4uVhnvTocqouehQzrLv9RgkxUxnvZHPFD6VzL0og+Y2X
	ue4/7fqdMdtrgUc/n6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TXZ-0054sf-Q6; Tue, 06 Dec 2022 08:43:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TXW-0054hO-7o
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 08:43:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DC302B817F6;
	Tue,  6 Dec 2022 08:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21606C433D6;
	Tue,  6 Dec 2022 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670316175;
	bh=/uuvuXgxZ5ZLrdsqrg9NhzM2RQM4AhSfL3k25vRXOq4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K5Fx+UCPvzDZ57iIqGv6A6/V0/YFagMy6dGQhsdNCzNkO15+X6FCQs76HvbjnaJiz
	 J7oTopzvH1whEtTzfGHU4+Dt2TUlk7ZAFnBVSRvygwYlvjzw77vVZj5+AVLzJ7pG/L
	 6mcAc2pT+q7s21NSTcItegl5mFfjJBr/x/YTfyGGgm05rVqrnTQKCY1g2GfgnX+2Os
	 92FdTONc0qM+aNYRrBNx4ZGw9dNU0tA3POc57D3D0YW4BEoTbFUZK1XuFx67naeIC+
	 j7hdpiJSUhqfzHVT99if05sDidfeh29Wa+qAbhNoyWFIElyHzIXFnrmuIW6G5Q7boP
	 Ah9uc7fabHHuA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf v2] riscv, bpf: Emit fixed-length instructions for
 BPF_PSEUDO_FUNC
In-Reply-To: <0620000f-4d06-de15-09d9-24b5b0c47410@huaweicloud.com>
References: <20221202094837.3872444-1-pulehui@huaweicloud.com>
 <87y1rq848x.fsf@all.your.base.are.belong.to.us>
 <0ade59ea-6863-4d68-607c-22e4b9405a0d@huaweicloud.com>
 <87359t3r0h.fsf@all.your.base.are.belong.to.us>
 <0620000f-4d06-de15-09d9-24b5b0c47410@huaweicloud.com>
Date: Tue, 06 Dec 2022 09:42:52 +0100
Message-ID: <87359szzw3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_004258_440461_25DAEB33 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pu Lehui <pulehui@huaweicloud.com> writes:

>> Wouldn't that work?
>> 
>
> It definitely works. But auipc+addi may be some holes, while 
> lui+addi+slli support all the address of kernel and module. And this 
> might be help for the future feature porting.

We're already using auipc/jalr for calls, and I'd say it *very* unlikely
that we'll hit the non-covered range. I'd say go with auipc/addi +
error, and we can change if this really is a problem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
