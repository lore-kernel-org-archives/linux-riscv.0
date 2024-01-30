Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFEFC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5Zf+M0Ghl/WdwmfKpVCr2hGmBu3l7fojpaV2//OfaI=; b=nlL2otZYsB3qNN
	P/4wLJRw7Ku5L4zx+7vvgPUmXcXdxpAdbHFKy8wpj3KiXmEoWSIK/Mbwv12mB7UBKrgstWfj0coVR
	eyFgC1qKl2HhTTyD492e4GXD7Xcjw56cGT9adCNCColU+aMUwT3vW/KFqgaR4SZzfdcGnaQ+RZbof
	ruF+xqQMz1K0Jm+HQuNvMYPZsagjUPQABREGEi7nUunKAg4OHmKSDMKtya2tIjPX5yHDbfv1VPdjn
	lWuXBQEtGFU923zSWgTTspDg1sSM1laADMomn+vp1Z8ApFISFOAXUKdZ0MzOMC5XRi3ovl57oMF8K
	MkHBsDEQjCO5Vxbozb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqcS-0000000HIT6-2JTe;
	Tue, 30 Jan 2024 16:05:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqcQ-0000000HIRU-1Pj8
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 16:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC4D1CE1B5B;
	Tue, 30 Jan 2024 16:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821A9C433F1;
	Tue, 30 Jan 2024 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630743;
	bh=XNZMtU9+NSZPjnlFT4YalaCcT7iFvu8+aCgq4SJNd0A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mAylsLi7KI3habSsXIBFUxmtVp/tIwg5DU6P0+JwN4GBwB1qLMTbD9X0iFEqUd6fW
	 GXEt64guYmUQMVMtu416Z8ENRTrqLRbg17l/bVau274uMGtvxxGj2zjpAC+Tsq5dlk
	 YK+NwQ7ODYLB+SUBWR5rMWpJK1200L9Du5nPMY1OTfBC1r4wLjcy2Zwi3H65kJdnRs
	 gOsKSwOHm2Moc7LbYuLBJ24Hp/wBI9VtaF5acZtSH0ghnGT8JeMOJnoIYVhKG3WBlX
	 cr2iuoTxl8ge+X3JSKGrArwa0TxrHYWXe0wYWDKdZrRbzyH25hFY73OSEXcRWBagIz
	 3KFoPDuALG6vA==
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
Subject: Re: [PATCH bpf-next v2 3/4] riscv, bpf: Add RV_TAILCALL_OFFSET
 macro to format tailcall offset
In-Reply-To: <20240130040958.230673-4-pulehui@huaweicloud.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
 <20240130040958.230673-4-pulehui@huaweicloud.com>
Date: Tue, 30 Jan 2024 17:05:41 +0100
Message-ID: <878r46q016.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_080550_572263_C004A80F 
X-CRM114-Status: UNSURE (   4.26  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgUlZfVEFJTENBTExfT0ZGU0VUIG1hY3Jv
IHRvIGZvcm1hdCB0YWlsY2FsbCBvZmZzZXQsIGFuZCBjb3JyZWN0IHRoZQo+IHJlbGV2YW50IGNv
bW1lbnRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4K
CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
