Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E0C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkZ21ZD01NM7LXcE8yAxstMPkskmgv7GyicAzYOL6kg=; b=z5X0G4mRkdwJss
	MVE2yoJAAuFImi/S/bg0Y+f7c24+aD+0E1WWqou0nVR9oPoishkSMo5/8ZDRjmV8gAhQhKIw9E99J
	3zqamLUt9QJo+3Ni0e0PcxNzxW9qgQHYY1jYEDJyzohURvw2Vse3F+ogQiYSSnHDHdAXGKFzybQY1
	QcdCmz4LKeXvBzRnb/bkrLaC8tWFUpUavwjYkmnWg1JjXTAuyXcfjyMn+q2rOMHZoOpNg+aPOSK/2
	ODFZ7Sof5BknwUJfDkExqBO/IINZ3HptelP1WYz3OEgTAkMojf+dleki8FDUCtn1kGGFoDPMrrr3w
	Qqvm01nnDUytkSNs0qxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1rc-0000000BIcg-0TK4;
	Mon, 04 Aug 2025 20:32:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1rZ-0000000BIc9-0AcQ
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2E96A55AF4;
	Mon,  4 Aug 2025 20:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4675C4CEF0;
	Mon,  4 Aug 2025 20:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754339571;
	bh=Oz3qdUQptaVyyIeecrQbI/P2BVjPtce/YqRDIENIsn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=poAF1fWYETD5JZJ5G3g6mEJv/elwzab8VawLlayZjSMUerd5gLQ+8Y1fj1r0PEGkO
	 9LYL75KrXjcAk7jLr1wuMuhNTzy+NR+D3cTYjQanlmG3xOd8M0QMielTy4ILBgkzpO
	 CiHZzot+4rXhnbgxYIzZCNHwYhzV764yPJUj+R3P4wPpaEA53uDropOJ98TqD8NAYh
	 jwnlyMBlTdotRtbn406xtAOHgARV+kWYRFcYykGMf0YlaUt9/d24BPv4QQ7BP5+htz
	 r0fFSo2gAN50OhZdMM8cQC0vlc0cv8XY/VbPn2HXLBFrQYXD+KuuDQJa4fRkqw85iO
	 HyLpYYSQljhiw==
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
Subject: Re: [PATCH bpf-next 06/10] riscv, bpf: Add Zacas instructions
In-Reply-To: <20250719091730.2660197-7-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-7-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:32:48 +0200
Message-ID: <87ikj23k0f.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_133253_146014_0C859977 
X-CRM114-Status: UNSURE (   3.59  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgWmFjYXMgaW5zdHJ1Y3Rpb25zIGludHJv
ZHVjZWQgYnkgWzBdIHRvIHJlZHVjZSBjb2RlIHNpemUgYW5kCj4gaW1wcm92ZSBwZXJmb3JtYW5j
ZSBvZiBSVjY0IEpJVC4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdmFyY2hpdmUv
cmlzY3YtemFjYXMvcmVsZWFzZXMvZG93bmxvYWQvdjEuMC9yaXNjdi16YWNhcy5wZGYgWzBdCj4g
U2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
