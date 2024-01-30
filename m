Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD1C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ipmb6yJ3XrNIAQRAlILkavWYjRBA03faQnyiMR0/Ftc=; b=h2kDhbYWe1PI8L
	H7arpUlq21sQRd34JIEo3xxD2IsU8dbaU10Fbpb7ObthHjBcoRi45JudLjW/D89SMnBHkuX/1QGzU
	8B1iNqNrJEz27Z41DKIexa0uIArrCP5U36AllOvsbEiMSiz9vP2+Qyfj/MyiwEST+apL9M0I4j/q2
	Q0XTNiSisVf+TGWOfSMUUYp3r2Ifje/xkL33EmqJUI8RiODYJM9T7PHszxVFHwnWKB/OzbWtYC3ey
	jOEHnX0AZe0TPYAZsFfwqKNORaoo8WjzCPvaK0UsHu1a0E9HfZHNd/FX8P3qZZhiKcM/edBkVgU4D
	PgykhDNq2RDUaky227AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqbU-0000000HI8H-0vGp;
	Tue, 30 Jan 2024 16:04:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqbR-0000000HI7C-2RSa
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 16:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18C4C60BBC;
	Tue, 30 Jan 2024 16:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B38C433F1;
	Tue, 30 Jan 2024 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630688;
	bh=Jxs0gSnJOiGvbx3haHRNhLP2dKu0vcPnwZd0IxIGE8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Eu+DgKHUZYDBRukwGg6Zyh/V+BTZIkO7AO7alGt5EIl+jABBBBVTQHEZhhh7l5JNv
	 2hRM8qdMm4kR7NgORdhjfwwzlBn6LM9iYbZrFjep+H1Uug6WL+AWSOr8tBeaBpumZz
	 CVr5S+C+oZFjeiilqC2YLvctETR4FlyQMpNxIjiZhk8zAkOHl44X6PJk5gfx/MlTm8
	 zcMO/Mg9fKpdsqeuu7X/YbijWWlA0Dad9FYmwnPQfPDhs5WnKYzXW9dvqQi2EEmlYM
	 MZHwCVIVj+KWZ4dZnS+o0x2IebdREKFDxZ6uB5j3Dfnudli5pyB+5JpalA/oCcucmt
	 kYfhcOLbazXJA==
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
Subject: Re: [PATCH bpf-next v2 1/4] riscv, bpf: Remove redundant
 ctx->offset initialization
In-Reply-To: <20240130040958.230673-2-pulehui@huaweicloud.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
 <20240130040958.230673-2-pulehui@huaweicloud.com>
Date: Tue, 30 Jan 2024 17:04:46 +0100
Message-ID: <87h6iuq02p.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_080449_713409_7CD1591B 
X-CRM114-Status: UNSURE (   4.63  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBUaGVyZSBpcyBubyBnYWluIGluIGluaXRpYWxp
emluZyBjdHgtPm9mZnNldCBhbmQgcHJldl9pbnNucywgYW5kCj4gY3R4LT5vZmZzZXQgaXMgYWxy
ZWFkeSB6ZXJvLWluaXRpYWxpemVkLiBMZXQncyByZW1vdmUgdGhpcyBjb2RlLgo+Cj4gU2lnbmVk
LW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkFja2VkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
