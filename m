Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D1C87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7R4Kvbk/9L2Ypaah4YtcuD70pePydjjn/HxgD2pzQY=; b=aA1zaFc9IzyhL1
	4N6MYsS5CiL5EEPKzCWZJURfflzjGT8JJL4H3oCvs+SFr0P5gyQJJzMG637okpuIHjYeLSe2kB1r+
	LKM68iMxtPK1m90pXtSMWfvzEV4FxkaIK6qEl5+GIg1xRenQHccxs2BMjlVAws/IR59pI0+jXDNGo
	lZFuou/UWUa/IFlfMNyHetvhbIFNwtroEZSoZx+7Z4HkY9fhRmH1QW4AzGR7QIXTK0pG22/nkUzrE
	esxEJw5HUQeC59AhNqgosLJVHvQjzBOT+b5t6RvXJQPXTDRkdg26O4rRnXqtrVoXEyzmgWGfCMhlk
	mnXSj9+mdOBP/K5UagkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1oL-0000000BIMr-36xh;
	Mon, 04 Aug 2025 20:29:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1oJ-0000000BIMX-0GJr
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8782B5C5461;
	Mon,  4 Aug 2025 20:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD6FC4CEE7;
	Mon,  4 Aug 2025 20:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754339370;
	bh=4BPsES3b5klXzdk6RpmOqf1VgsIU8ZAY8khzKwSwfwk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iJjfFllp9A5t0b3evqDJ86gBmdgbLw5CO5nbxRfYOF6T6zvYvTJplqmOZMF4ThZIo
	 rfobGezjJOtX/4wBS1Vk8pP70muPLRhZvC7BSpdi9LBXuciPN6JVp4ZmbxfnGxAPlt
	 F2pr/W0FtNniSZnsJ2+qO5E4eRlppbsRuZougnurPEQoriP4vL/c6WS6GDjE/0waXr
	 KygzMNkPN6s9HyzUlxoVkon6bRUzRG3pIVdGKQYfE2IItRdcVRlP4mbp3Dc1o43HHX
	 1TGjSl/9ZjSU37FkaDT1TDUea1L8WdHxiUVUbvp/8tAE1RHZ8f6iRV1eS0AptBRwS1
	 ohcd9/z6+3Gnw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 04/10] riscv: Separate toolchain support
 dependency from RISCV_ISA_ZACAS
In-Reply-To: <20250719091730.2660197-5-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-5-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:29:27 +0200
Message-ID: <87qzxq3k60.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_132931_139684_A5A35C60 
X-CRM114-Status: UNSURE (   3.76  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBSVjY0IGJwZiBpcyBnb2luZyB0byBzdXBwb3J0
IFpBQ0FTIGluc3RydWN0aW9ucy4gTGV0J3Mgc2VwYXJhdGUKPiB0b29sY2hhaW4gc3VwcG9ydCBk
ZXBlbmRlbmN5IGZyb20gUklTQ1ZfSVNBX1pBQ0FTLgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgTGVo
dWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
