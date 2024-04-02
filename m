Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE240C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAnH7uTX0RjXzLs3gsYhGFaBA2oohx8oN5wOZcZcNQo=; b=I6lrWIDL+HrF1A
	vb9X86GOnEbgVmfATRTnQe9DpVetqJcsWmswro/+q1P/gCzLRyy+DFp9MjxqtzkaCC9XVnEtCPsqk
	0AS82osVuHcM/FShzKqNzCGIjrysp0uDpVlwhc2CxA+9bCSSdyae+SlY25/05fkqGeqxswz+YDN7B
	ab/ebo7IBtIoA0MGMAntBgDC74N/WD4kHx75btJrTfBdxfYWb+pEgThTHd3MHlHyAAZo1AZgyMkfw
	iwEt09jB4kc77Mu8tdSkh9BhB7A97YQSz2Em7hJ8Hlr/WUGCyWkUsudQllUfC/4mo10/wOVAz/dMd
	eQG2tTZn3RWWsqODUgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrf6r-0000000BZhA-3SOK;
	Tue, 02 Apr 2024 14:27:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrf6o-0000000BZg5-41SW
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 14:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 454DA60EE6;
	Tue,  2 Apr 2024 14:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC12C433F1;
	Tue,  2 Apr 2024 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712068049;
	bh=IzdgC28MCw382UmcvE80JbhG7kFhsjaPi3qZble+/xc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YCFwJB0bPOnFodPVyWzYmgybAvddl2vQVOuciUH3pi/+hSrYYoNIOb05ZCfIA9B36
	 rLgIbNX0aBjC2m78e9ccK+8WIspvxrLd41yAwLXT501ap4yHAnUmQWHxnwcAN7HPVc
	 +YN8MyH0ay8Y6tedjiayxHUSiKv3tC4vTaRK9aae5/EQs9rt34aPFjL/DJmxjO7x0V
	 zZMo58NzYH//7jm0o4kcv9wfaxAO3qnq1KViwPQkZAXMfp7eWQs1pQb8kwV/HqlALS
	 N0bUDRfQldmpy0pPEzraCWp54To21/iNs0UNDfqDvK3sbHbWO06f2Qpkzm9z2JQDJO
	 hh40dD82AO4iA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Manu Bretelle
 <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
In-Reply-To: <20240328124916.293173-3-pulehui@huaweicloud.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
Date: Tue, 02 Apr 2024 16:27:26 +0200
Message-ID: <878r1vrga9.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_072731_124170_729D9C56 
X-CRM114-Status: UNSURE (   5.01  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBUaGlzIHBhdGNoIHJlbGF4ZXMgdGhlIHJlc3Ry
aWN0aW9ucyBvbiB0aGUgWmJiIGluc3RydWN0aW9ucy4gVGhlIGhhcmR3YXJlCj4gaXMgY2FwYWJs
ZSBvZiByZWNvZ25pemluZyB0aGUgWmJiIGluc3RydWN0aW9ucyBpbmRlcGVuZGVudGx5LCBlbGlt
aW5hdGluZwo+IHRoZSBuZWVkIGZvciByZWxpYW5jZSBvbiBrZXJuZWwgY29tcGlsZSBjb25maWd1
cmF0aW9ucy4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+
CgpTaG91bGQgdGhpcyBwYXRjaCByZWFsbHkgYmUgcGFydCBvZiB0aGlzIHNlcmllcz8KCgpCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
