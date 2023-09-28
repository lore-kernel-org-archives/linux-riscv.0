Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3BFCE7B17
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHlMH/YBuWdzVXEzT/HpablZcX1YTXlD0JH+OK0xsJg=; b=kGfIaxEj5AeKH5
	jyQnSDs97NmQ6mgwzzike78DngHJWSE+bOwMjiWtbZxsN3cW38omPs4hMNRy7Kg9w2EIzzJvzBFjL
	U3rnWEOnTQOKK1mI0lm09m4Hbpw6MQle/dcXIPzJmup2lJCvVy1z39jIu/F4P3f3PlmoX3uytDJ6p
	NxTh+/bVP0tUsmpVShe9bk8CUGwPMIk0kHV2tJoWFU4dvfIENbWnSPc5Nr19suLgAUfL87HSr/KSb
	PpHAaqAtCjkzbsI4dOuIx0QZ4vaDxp7wyHCgCV6YGACmgrLURFglT1sWB5Tlf3EzqTdkLNVIPt1Vv
	+ROmCUjnH2kiiKYUQc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloXP-002vrS-0d;
	Thu, 28 Sep 2023 10:46:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloXK-002vn2-00
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 10:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC08DCE1D0A;
	Thu, 28 Sep 2023 10:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0B0C433C7;
	Thu, 28 Sep 2023 10:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695897981;
	bh=kqJ++Rtdj7thsbKhHQVDminaG5K5K/+2jonSvvV1OpI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h56YuQk9tKBjh3ZLFmkdR1KFT/a/1Qy0YOYw1+/ycZU2SnOa0+F/Ax1ZohhZzj3sH
	 j2tLFCIBr65xLu9vGLM0s5lQQ1+dhLseeQGEPbcGPEiGiKZhZpyZCKQ9ic4AsW0le5
	 xvsdrQyA7defQpCwH2FUVKFAn8ltwKB9DmU3wcpkTK5gs0XNXpNayPBg2NRYR4UW2q
	 E/CpltTDUHQzDDzVcv2c9N8QUXKDaQbQEZkM8G7/pK7ksT2Lm2RlgzvNgoJO5phiGc
	 6bm+VAwEdC0p7xyb5TR0lwC3ZH7TCSSscKEumwsFv10Z8QAyJciK+rchXIWvKbZ5e4
	 /eDW3DSPYb+zA==
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
Subject: Re: [PATCH bpf-next v2 2/6] riscv, bpf: Unify 32-bit zero-extension
 to emit_zextw
In-Reply-To: <20230919035839.3297328-3-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-3-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 12:46:18 +0200
Message-ID: <877coao9s5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_034626_646218_66E7A7E2 
X-CRM114-Status: UNSURE (   4.00  )
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
aXRfemV4dHcgd3JhcHBlciB0byB1bmlmeSBhbGwgdGhlIDMyLWJpdAo+IHplcm8tZXh0ZW5zaW9u
IG9wZXJhdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWku
Y29tPgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
