Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B587C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNFV7WGQKEfK2pewVzldImCCXOvM/VOCY6ZE1idbdJE=; b=hhKK5dsY2HQcxj
	YavIiylkjl16Lour2Ku4/3diFgE3a29Oig1qj9wSpIXrqkQF4pHlXraChh/8oZ9THGHVrpjzIL6v2
	ibXalOmSyad3aDtjp8EJKWJ8JB78KHGzoNQMCo0R61iJZIVnpAhuVIUh+GHi1PXAMH+69tERLd34Q
	0a/sZXw8QWSctkiyNP1qY6cdpJelQ+PLqRS8NhFyMU0fg0f9xVwrrH7EWhidv8Rvmy4JdM3j8BYs2
	W+OPL59n2AcBQc6EGUujjsQNtbEG4On8R3HNFVBDNNqBZoHCyChjq5xaapvLzjWArNUoPZOz9oO5J
	I/MZE4POGKvHF8k4Xr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXMO-0000000657R-3W6t;
	Tue, 18 Mar 2025 13:52:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXK2-000000064fY-3Ub7
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 13:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCA415C57B4;
	Tue, 18 Mar 2025 13:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B49C4CEDD;
	Tue, 18 Mar 2025 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742305773;
	bh=1zucnD3tEe4wYl4tSlGXF5mjHYT1yVy/S6vsQstc4bQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eYok27mCmKGPT3OGy2YkfT9Qa8p73nscU5+GUAezalD2u4mo7NmmYtRrun5uB5R2D
	 WNzdXo1Nyx3xPFj8tTiH/FjOaqtNYjGn6bau2xz3FHDTCoe5SeuRQF7vZJ8LYEtPxE
	 mMx/7yh9nqUeb+nleXQgfXPkfL0PdI1/5Z/7BK9SRartn9O/2BrJ5Yt//DKqdF4Ct4
	 yatzSznfspSLVEHEkntaNn+Vb2WTm/v3XXKj5V1/4NTRteR83bIf44HBBuVGbpQ0OM
	 AMCIIDhwl7i7TFhGNMn8gULKGoDJ1qM5kjtXvtuaC+NE7FxMXbsyDwu8X1wNCdQT6J
	 2szfLEkxrAcCQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, "Steven Rostedt
 (Google)" <rostedt@goodmis.org>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH v2 1/2] riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER
 depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
In-Reply-To: <20250317031214.4138436-1-pulehui@huaweicloud.com>
References: <20250317031214.4138436-1-pulehui@huaweicloud.com>
Date: Tue, 18 Mar 2025 14:49:30 +0100
Message-ID: <87tt7q5tzp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_064934_923981_2D10E08C 
X-CRM114-Status: UNSURE (   5.64  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBDdXJyZW50bHksIGZncmFwaCBvbiByaXNjdiBy
ZWxpZXMgb24gdGhlIGluZnJhc3RydWN0dXJlIG9mCj4gRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdT
LiBIb3dldmVyLCBEWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MgbWF5IGJlCj4gdHVybmVkIG9mZiBv
biByaXNjdiwgd2hpY2ggd2lsbCBjYXVzZSB0aGUgZW5hYmxlZCBmZ3JhcGggdG8gYmUgYWJub3Jt
YWwuCj4gVGhlcmVmb3JlLCBsZXQncyBzZWxlY3QgSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVIg
ZGVwZW5kcyBvbgo+IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTLgo+Cj4gRml4ZXM6IGEz
ZWQ0MTU3YjdkOCAoImZncmFwaDogUmVwbGFjZSBmZ3JhcGhfcmV0X3JlZ3Mgd2l0aCBmdHJhY2Vf
cmVncyIpCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+
IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI1MDMxNjA4
MjAuZHZxTXBIMGctbGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
