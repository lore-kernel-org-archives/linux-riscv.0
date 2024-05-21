Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61692C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pr66N2HqJ8JfgJu5ZKmH8rwQ9EGpU/1SYej5lusaNqM=; b=3iK5AuZoFrkD5I
	A6AHKiITIWji/hl4xAHR7I/HCX5IMsmfmUn2xFkPf9O7eRPdNppckW5JoGOv6B+/bVQuLNBdtrQ5C
	oD/U3k0o4SB+WzYoFggWQvQS+b4Ky0wPCdFcPpHRpHsEQx9aaKZkyuX+NM52eWfMcfrfX6iYk1J97
	ReT21eQ76VaiYn3TsCBDsneZLSyjiGPNsoDK/D89LjqLnglRbHONath1NGGitp93fD8UTrRmuDCNY
	ff+HKDPwJIg5AknpLef/ea32TwDOhW/DdU7ErQqoqvu5PwLijX4mGTlTy3QzZFFI3aHZQ99cYKGA3
	JD4IV9CIjmTmcQ0cioUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9SSr-00000000WEZ-4209;
	Tue, 21 May 2024 16:35:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9SSp-00000000WDl-3jG9
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 16:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 054FACE103F;
	Tue, 21 May 2024 16:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA2AC2BD11;
	Tue, 21 May 2024 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716309342;
	bh=flYhV7d20dQSVWKKG9xe6WN4b57IFP0PEYtYsZvhEgI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OSnDxMBvwuZmzw1tj9S4tW3PKxmd2QDDX5Hs9M+GREWOOeCuYO8A2o5lxdeMgcrBP
	 HgpjrRpH2Fv2a9TgqbPZcKVK4ubavEPLcA2O0fHaLwzzIt6FohK6rbPtUmFiHRzZQ+
	 usIGPMVbj6Qg/P/fxj5GiHm/xqj0oa1XGLBu6bxhuTELspa5Cg+ZXtgLVzXogmv2el
	 5ohMQn2jiBrQTrk3P3s+/iX30+ZHyw+rFS3LLuM17nzzD+reEO+uUyW9rI6Mps3R/r
	 nqtw9VqHOkG5XbMGosKQIYPtq3aKMxk4wwsKQwQxE7YyNLyD2lvSD+2MlDm6L+yrVk
	 O4wvpONO9IlYw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Xiao Wang <xiao.w.wang@intel.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, luke.r.nels@gmail.com,
 xi.wang@gmail.com
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, pulehui@huawei.com, haicheng.li@intel.com, Xiao Wang
 <xiao.w.wang@intel.com>
Subject: Re: [PATCH] riscv, bpf: try RVC for reg move within BPF_CMPXCHG JIT
In-Reply-To: <20240519050507.2217791-1-xiao.w.wang@intel.com>
References: <20240519050507.2217791-1-xiao.w.wang@intel.com>
Date: Tue, 21 May 2024 18:35:39 +0200
Message-ID: <87a5kjdsx0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_093548_141538_7C641A43 
X-CRM114-Status: UNSURE (   4.92  )
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

WGlhbyBXYW5nIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+IHdyaXRlczoKCj4gV2UgY291bGQgdHJ5
IHRvIGVtaXQgY29tcHJlc3NlZCBpbnNuIGZvciByZWcgbW92ZSBvcGVyYXRpb24gZHVyaW5nIENN
UFhDSEcKPiBKSVQsIHRoZSBpbnN0cnVjdGlvbiBjb21wcmVzc2lvbiBoYXMgbm8gaW1wYWN0IG9u
IHRoZSBqdW1wIG9mZnNldHMgb2YKPiBmb2xsb3dpbmcgZm9yd2FyZCBhbmQgYmFja3dhcmQganVt
cCBpbnN0cnVjdGlvbnMuCgouLi5hbmQgYXQgc29tZSBwb2ludCB3ZSBzaG91bGQgc3RhcnQgc3Vw
cG9ydGluZyBaYWNhcyBhbmQgZnJpZW5kcywKaW5zdGVhZCBvZiBsci9zYy4KCj4gU2lnbmVkLW9m
Zi1ieTogWGlhbyBXYW5nIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+CgpBY2tlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
