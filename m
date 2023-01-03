Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636CBC46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 07:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAq2AvUfHAQqVZBs4Gs7OTrHGfu+MT/DM1XehTKpDk8=; b=vkmXQDY4BLQdmX
	cb3DWX3YXwIiNSevs3gWnysTT1Y6XGibn9YShKsyePQxX+TyH4G7izHBEFZlAc++YHF6i57n/nB7G
	JRBAOdsBVXqFa2fq/XVyKmGLGIJ8FAlmqMN7XVnM0kJQJbxNVKCuav+KycIXWU+KniBqCq7Fsr7Xg
	/cC+giHjwc0WzT59r3yd3PlUzLf2m6bkAzu5PfTu5RMoLX6Yt56RCpThiRU4NBy5po1uey4JxONyq
	EJaOCmvYybh7NbmJY67QObnATVfbIgEqe8qKM5K46McwWos8DRlFu0Px7dG2BVMOaEqFylSt4UwoV
	SDP+AATXc85Iyb9ZQB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbsb-00HUcX-6H; Tue, 03 Jan 2023 07:38:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbrw-00HUQ8-0a
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 07:37:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30795B80E51;
	Tue,  3 Jan 2023 07:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FE4C433D2;
	Tue,  3 Jan 2023 07:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672731472;
	bh=+1+K/QMGEwB/t9nyEjns1p8p9ReMrS/m95IVeeWjbDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X5xqNylbdKKqVQfqkbksbhlW4tsgpB0FIoJT/BVb5+jvGU0iOh7fIINlPD3cF1m89
	 QPuEUm1whigKxqMb3sONrxLlrz07QjEpyFMKU9Nj78To6LwhEoUWphYy9DfG1jf+3C
	 bbpJiEKSBrhNaAYj6o6VMfpXs/gF2igh3KRyO/Tn/cdOJj3eKZE7MiakBnq1FijBQ5
	 gi+T8NAVQJaZVz4Q16SAUyx19U76SnGrwd1rAGVFUCpk0DHlUkKWpQekv7MDI5wXFq
	 9wSNQVLbxReD9Mw0YlV3aBm86EpAryp4bz02J1aOv88rZdh+e8pK6k8DMJlC8JMRUC
	 C5wi/oOP5iOCA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [RFC PATCH bpf-next 3/4] riscv, bpf: Add bpf_arch_text_poke
 support for RV64
In-Reply-To: <20221219133736.1387008-4-pulehui@huaweicloud.com>
References: <20221219133736.1387008-1-pulehui@huaweicloud.com>
 <20221219133736.1387008-4-pulehui@huaweicloud.com>
Date: Tue, 03 Jan 2023 08:37:50 +0100
Message-ID: <87v8looypd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_233756_556254_70C0C2FF 
X-CRM114-Status: UNSURE (   9.82  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYwo+IGluZGV4IGJmNDcyMWE5OWEwOS4uZmE4YjAzYzUyNDYzIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiArKysgYi9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXA2NC5jCgo+IEBAIC0xMjY2LDcgKzEzODksNyBAQCBpbnQgYnBmX2ppdF9l
bWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRl
eHQgKmN0eCwKPiAgCj4gIHZvaWQgYnBmX2ppdF9idWlsZF9wcm9sb2d1ZShzdHJ1Y3QgcnZfaml0
X2NvbnRleHQgKmN0eCkKPiAgewo+IC0JaW50IHN0YWNrX2FkanVzdCA9IDAsIHN0b3JlX29mZnNl
dCwgYnBmX3N0YWNrX2FkanVzdDsKPiArCWludCBpLCBzdGFja19hZGp1c3QgPSAwLCBzdG9yZV9v
ZmZzZXQsIGJwZl9zdGFja19hZGp1c3Q7Cj4gIAlib29sIGlzX21haW5fcHJvZyA9IGN0eC0+cHJv
Zy0+YXV4LT5mdW5jX2lkeCA9PSAwOwoKVGhpcyBsaW5lIG1hZ2ljYWxseSBhcHBlYXJlZCwgYW5k
IG1ha2VzIGl0IGhhcmQgdG8gYXBwbHkgdGhlIHNlcmllcwp3aXRob3V0IGhhY2tpbmcgdGhlIHBh
dGNoZXMgbWFudWFsbHkuIEdvaW5nIGZvcndhcmQsIHBsZWFzZSBzdXBwbHkgYQpiYXNlIHRyZWUg
Y29tbWl0IHRvIHRoZSBzZXJpZXMgKG9yIGEgbGluayB0byBhIGNvbXBsZXRlIGdpdCB0cmVlKS4K
CgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
