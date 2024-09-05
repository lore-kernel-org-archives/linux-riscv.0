Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3BCC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO15ipVgU2I+COrE8j4wm7amTRSXilunYHyO3Zl3zEg=; b=xTUs4592XIr+/VY+XDJLZ5B1zq
	zydeSx0qzzjgpDiQAAEh3LMx00gg7kHbuaSpG7Bs6vu2nQfLfGE8em6u2IcBCCZ4jhsiw8Py+WD6d
	Zpb3lCLWPjppu5F0kx/MSzMMBvINIT1XSHQMkzZWnLwz+Bo/M6I5qzISZ/VFFB/+Xwp/9BBLi92dD
	Fsw4SHFdbV2g1CB4KFM/5MVRRlANIde2hi/CRjsNEq1BxNJoMllzSa1coxvFYsYTxf2qp58+3PHpC
	LZtMeORXrimHpVviRHN6+sRguCBRdnl+Diw8N1uevIBTd382TUrK6H5226nx9hJw2HXzUEQTY2WKV
	mfhNLxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFcX-00000009BNt-2JBg;
	Thu, 05 Sep 2024 16:46:09 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smER9-00000008x5W-1aPC
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 15:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=W+748PDs7VWuitosbujGj48wCatW4hM4cT/gHZqGVis=; b=oBC/3jdg6uDXD1j+nEaBdQs0gm
	ZJUUOhWw3BPZpLheie6PSGgoRpV1spwGsLn3/0BlP+GIWLtxzfjPCtPafGMR3yebw53W4YkkgMSOD
	CKZhPFrsyLQtEmuKFqanh4bhJicMSCj24XSyt0fBhlGhJOGpbzCRlpI7tbaIg7N82/gexz4mM2Rec
	TlmA+x/ScSs6dGB3b/UZ6idVx7MIwy+10SCKaaXQX56qrefVbhnBBbZpDIpf+IqJsWfH87xzacHS0
	US9RQFRoQimB/oYy3goPysjxda7YVnO+0NzZFc/URuAqfABLP0wrNCATsc/zVBRY/0Lxn/BJmsiFi
	oU87IdIg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1smEQq-0002Hz-Bz; Thu, 05 Sep 2024 17:30:00 +0200
Received: from [178.197.248.23] (helo=linux.home)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1smEQo-000M2I-2G;
	Thu, 05 Sep 2024 17:29:59 +0200
Subject: Re: [PATCH bpf-next v3 03/10] selftests/bpf: Prefer static linking
 for LLVM libraries
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Mykola Lysenko <mykolal@fb.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
 <20240905081401.1894789-4-pulehui@huaweicloud.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <a0e6117a-12ae-388f-bb43-d32a219d08b5@iogearbox.net>
Date: Thu, 5 Sep 2024 17:29:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20240905081401.1894789-4-pulehui@huaweicloud.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27389/Thu Sep  5 10:33:25 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_083019_440670_4D5546C3 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/5/24 10:13 AM, Pu Lehui wrote:
> From: Eduard Zingerman <eddyz87@gmail.com>
> 
> It is not always convenient to have LLVM libraries installed inside CI
> rootfs images, thus request static libraries from llvm-config.
> 
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Eduard Zingerman <eddyz87@gmail.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Tested-by: Daniel Borkmann <daniel@iogearbox.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
