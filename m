Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8091AC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvNvlS4iUsi782V9G7iemmfnZX3k8b14uLViyku3uII=; b=rDSnOWpTvaDOJm
	eMS7mh+MWtdCNi2XCuSNx/UKLmabjQNvwZaKr200m7IlLs51pK2goYX2wKoVHVHGaXOzEkqXPVM2o
	mQw85gM1N471NMBiOUR/p4ivY8U9unYTHPzcsQ8gcKfew1qvwcFdHyxuP/BFnkYrtF9nn/NS1pnqZ
	LwCll4WWzeol3bpeORPIu76byd6Me4IqVapJB7DF/jjDCTmhqK0MNNgIHUtdl9zojPkdShjkzRSOs
	J8ApBIBBlJKK2gbtMyW3mt1Lbm/lXFGAEmbsg2QPNvpF0CiJwjGimbE8N5OAdAPSRr+WiZ0EsxmPR
	ijUh1qQVjim9D1PkiVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1zW-0000000BJDN-3uH5;
	Mon, 04 Aug 2025 20:41:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1zU-0000000BJD4-0sUJ
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DFD65C501F;
	Mon,  4 Aug 2025 20:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26153C4CEE7;
	Mon,  4 Aug 2025 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754340062;
	bh=9eAvV9+NQOhCQGj2xEDwZ+ZARU2tdDyFH3888WUmqVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RzI3PgT+EsQMvzjzNNKXZUi6v3EmOqmyIEPTb8hgjHPWM4AO/IErS8rEPTsKJ1skB
	 1P6/3QC5d2v6szNCEBMhTw/MsmVlTzCBYI7/LkvX58gmMBWX1ASL1nl5TEfncVzhfF
	 WbVMp4x401uBsqSiXikCfETtXYJ+vgX/nBYE+EiB61BUOsRXIyRPjXjrRPCR9HX2wY
	 WUDYrNvBLakqetrk2wfaKxUIDgR0ZtQGmwyE666uItbC/9J04BeiIJmaj9iSVtUcm+
	 N2pFdZwU5TlZJryNPospy2ah+Q9VlLG6MrQaL/52DEqw/03iu6UL/YBfsS72PMOsAP
	 eSzpLAtS7+3fw==
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
Subject: Re: [PATCH bpf-next 07/10] riscv, bpf: Optimize cmpxchg insn with
 Zacas support
In-Reply-To: <20250719091730.2660197-8-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-8-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:41:00 +0200
Message-ID: <87a54e3jmr.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_134104_289186_C6E96B55 
X-CRM114-Status: UNSURE (   3.34  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBPcHRpbWl6ZSBjbXB4Y2hnIGluc3RydWN0aW9u
IHdpdGggYW1vY2FzLncgYW5kIGFtb2Nhcy5kCj4gWmFjYXMgaW5zdHJ1Y3Rpb25zLgo+Cj4gU2ln
bmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
