Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271FEC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyusJz+hGb2+o4JqrSvtZd04Orgcv3rIeZSpz7p2xt4=; b=4QkKzUdr3KxGPU
	OPwCM/6OZMdkGdaD21ZazH7Y9Os1ge39zghSuYSEqY0IiCjGsdYUX3Sa07wu4kvlPg5VlPxWhuOqD
	xLks8eotyErTuY0g6MMK3Rt0FI59ILRCv96zV2vs0/1gxzuOVBJMu2yw3AwWpnNim6DrF3P72GxwV
	D+KKvIj4bA7/apBzBQecFT5t3GQfGJZtJGLPHFob+iT8V7fS1ZT/gxgyIXbHXwsxKZEC17AdIMHTJ
	BNUhFSkE83rn4G+WF1Xc1LhuGma2xYWaALhRvgv4mKEe5SavfnOTp0cJhKiltsSbtYefcfqOTyy70
	GbDNHcf3tp8UHO/BkA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1uy-0000000BItt-03Gn;
	Mon, 04 Aug 2025 20:36:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1uv-0000000BItZ-3O28
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE9ACA55976;
	Mon,  4 Aug 2025 20:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39429C4CEE7;
	Mon,  4 Aug 2025 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754339780;
	bh=GO8rvGk02sRCddqfEgsRwqixNwiAebU7mXFuh9NuWl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I9YRPVMnB//PRNbbfMeCvtZOrFsvnU0M2gd4QzQSSs5LCVvdPmrhjwz3NQYK1M7JL
	 W7Oj/IaYa+AY0AMvUhs5Usg16Z0xLMNEeJyH4DY7uYkxEX8dY7b6XGJVQwyI20WBzy
	 8PBdJoi86C/Lnx6BnkTjU+AJBOzMrJa1Wfxl0ecVCUAUyUwE8w6gLVMUYdE3Hle2Hs
	 r44O6GMJ4Toklhani1i8BK3TBUDx4LEM/PApPjPJqRJywqA1GfjKifDfrsQLvhw78T
	 VNGKm5oSZrOfYGartPfsLdtT5dlMSp/NU5ZkQWHwR8t0e9XoOFSfpcZvbEb+xGw2zE
	 hSVDm8eXxaGWQ==
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
Subject: Re: [PATCH bpf-next 10/10] selftests/bpf: Enable arena atomics
 tests for RV64
In-Reply-To: <20250719091730.2660197-11-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-11-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:36:17 +0200
Message-ID: <87ectq3jum.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_133621_913688_F4579D0A 
X-CRM114-Status: UNSURE (   3.37  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBFbmFibGUgYXJlbmEgYXRvbWljcyB0ZXN0cyBm
b3IgUlY2NC4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+
CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
