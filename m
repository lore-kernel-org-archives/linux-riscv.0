Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04793C87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxk6UQV0tq++3IX/IJt1pT31TzpP/IYNfNWtdBESOLw=; b=2SG6EoQLvQRXPD
	aCOl0l+NjXTHMvQNsEsxftZs/54iuRAYU517nfD5dzmX372xbLPuOKU25oBnTGGj62nP+4i1ImdfT
	oNVr7mTGE+vbW7COHyJc+mvR2faQzky1IUJi/R1M3MITWikeRUcUxeHRmBxXroqB7RUhgWXsC7dtM
	VSHCi4kOjzdLKd/dG6EWKgrKt5voJeFmlcHGk/6sWepnJY2cDTXqDBOcGyHUNthGbwvD+H5cTxxlP
	D7xASSjWqdW0QthTmKhuig/BKMiLxNB3IObR2FHwoRVfHtrssupSZdCoopWfeVpCXG+qNxmXebxIY
	BBCVsYe5FBIF9oM4vSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1lT-0000000BHs2-1E72;
	Mon, 04 Aug 2025 20:26:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1lR-0000000BHrf-0rmL
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57D6B5C578B;
	Mon,  4 Aug 2025 20:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F4AC4CEE7;
	Mon,  4 Aug 2025 20:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754339192;
	bh=2g+ZtCuz9i9TcOCHiTSR4G/KrKNvVE5KUDD6gEF1B1k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y5ndDOhVwr9I8AB/Z656guxCxKS4jZGcjY1uJzlMQlMbrPzckMFZCoqd0w8YfHvcA
	 uK+C//hiH5FEU86faicQviLtZo5tBzvp4BNUMn0VyKK19GKWN00p4Bp2KBQDshX1rO
	 QSCVlBc+I1I8Z4837aTTjCOXM4QwfDPdgBZPsecdblABrJql4lKCskK7FET7TvY3cs
	 DT9l0uNVxGQ9vL6sp0sKloHEN0QTeXEzf3qsQl09qTUk90h3+PLh2/D6wuvCpelCI6
	 rK0CGKIqdjdqgXn2MZ4KkGpuEGkpkwTvNhQqwlJW7jsP47pZ95bY7CqGqh262LbNWG
	 qpeQqLFBORsMA==
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
Subject: Re: [PATCH bpf-next 02/10] riscv, bpf: Extract emit_st() helper
In-Reply-To: <20250719091730.2660197-3-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-3-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:26:28 +0200
Message-ID: <87zfce3kaz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_132633_282248_083043ED 
X-CRM114-Status: UNSURE (   4.23  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBUaGVyZSdzIGEgbG90IG9mIHJlZHVuZGFudCBj
b2RlIHJlbGF0ZWQgdG8gc3RvcmUgZnJvbSBpbW1lZGlhdGUKPiBvcGVyYXRpb25zLCBsZXQncyBl
eHRyYWN0IGVtaXRfc3QoKSB0byBtYWtlIGNvZGUgbW9yZSBjb21wYWN0Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
