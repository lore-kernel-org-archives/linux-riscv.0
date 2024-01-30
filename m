Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C727EC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 17:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1zYOAyFv8Zi/g/2F+rTDD+LXrropxxxTeBLP75JyeA=; b=P1MBBeVgffEByO
	UaFtbDgXFZw2KKkZ+x4fmFWHzU+VlqklLQ2drE8Vx62D4XGLFIRvUh1NCyZaYqOQVgTbEhbh+Bqha
	wHK9gMajYvIMvr/GFn9jROk2xn6Gk6opSv1DM2vdXyP4vFWTqZZpXYf/xA3VSsjz6BZuyjzr1+Hnm
	Y6v9KdT81pqVUYcFwMF2h0EKbI22s2qOHw9wr4zDNOxaWcA/KjfBpRopEJTZkzmVwPZsSu8QGSOC6
	VZweWiiEy+Nx9EiIxipFKiBt+xlAe9E00NM6Rbo0VCPG0SjLW7FkE12tkQ+T/CAAuEjPotY3SHH/W
	oaFaYzJDBzZn5jwvJc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUs5T-0000000HawW-1r4W;
	Tue, 30 Jan 2024 17:39:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUs5R-0000000Havd-11Nn
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 17:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B12AC60F29;
	Tue, 30 Jan 2024 17:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3129C43390;
	Tue, 30 Jan 2024 17:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706636392;
	bh=1bdXVoog3gCDNm4UnOcpyOfs3ya81qai/EuCHrPGD4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DiCvA2Ng1qXQ14DmbfbH/Pyme8b5Jrw2NHgNKywxJL3R4Jqpu/zrAGeyx3xTiNwvv
	 //MiLj3dme1qnqDixiOLfriedtlVsJanELS4MM3cS9D2kxgymmvxWpoMQcrDFo/0hh
	 k7tS3gCehGtTLXLQFHhtwW/Sqi/DuOSbn0b6U0oXSMWEsv06i8nxe+2l31Clg46H6F
	 LSa1pR9hK8MsFFZWc8zI75oM+9Jh3fEzjMPp4FKxi4ZQ0g0xJXxBPPHCo2kW5PliKZ
	 hETKYRjcKDVzkWQujOjDL5Sj9iYN9dmJQlml0fHWSvRBzDVR2SJcTYAdUUAgFw6Mgd
	 AL1Fyuyl8Zrpg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Hou Tao <houtao1@huawei.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 0/2] Enable inline bpf_kptr_xchg() for RV64
In-Reply-To: <20240130124659.670321-1-pulehui@huaweicloud.com>
References: <20240130124659.670321-1-pulehui@huaweicloud.com>
Date: Tue, 30 Jan 2024 18:39:49 +0100
Message-ID: <87jznqoh3u.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_093953_347489_5ECB8712 
X-CRM114-Status: UNSURE (   5.55  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IFRoaXMgcGF0Y2gg
aXMgdGhlIFJWNjQgaW1wbGVtZW50YXRpb24gb2YgaW5saW5lIGJwZl9rcHRyX3hjaGcoKVswXS4g
UlY2NAo+IEpJVCBzdXBwb3J0cyA2NC1iaXQgQlBGX1hDSEcgYXRvbWljIGluc3RydWN0aW9ucy4g
QXQgdGhlIHNhbWUgdGltZSwgdGhlCj4gdW5kZXJseWluZyBpbXBsZW1lbnRhdGlvbiBvZiB4Y2hn
KCkgYW5kIGF0b21pYzY0X3hjaGcoKSBpbiBSVjY0IGJvdGggYXJlCj4gcmF3X3hjaGcoKSB0aGF0
IHN1cHBvcnRlZCA2NC1iaXQuIFRoZXJlZm9yZSBpbmxpbmUgYnBmX2twdHJfeGNoZygpIHdpbGwK
PiBoYXZlIGVxdWl2YWxlbnQgc2VtYW50aWNzLiBMZXQncyBpbmxpbmUgaXQgZm9yIGJldHRlciBw
ZXJmb3JtYW5jZS4KPgo+IGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI0MDEw
NTEwNDgxOS4zOTE2NzQzLTEtaG91dGFvQGh1YXdlaWNsb3VkLmNvbSBbMF0KCkFja2VkLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
