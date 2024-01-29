Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAB7C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tW4SGmPXxw7btMhfVtJnGcAtktl5E+/mPXkwvUwyKEQ=; b=cuwgk1EwzVoaoV
	TqYUeYKwBUB7aRbAlPpYVeCgT0ivRciC7iQo+rmYqPtvnNJhlcsA5OS8EiCKKhwgE8Y4GWA0URzRN
	2dSNF2Em8gLPifeEWof2h4ClWmvgwLYJWk3rwJsnkS6J+POqdaIH7Swt6q6l/JoTvfKfeYd1hqnQ4
	XgKFEz4B/N8UBX8ZFhaaThl98ZZ/demjoZEYIAnsQx32A9hnmDQgWoQpKpo+ZmmkV9pQgbof6iq1K
	2UUfZ9INgb4to5Za/SXuJXwLKAnL+Uwt6B70AHQ5/RD4V8+QfXOLR9G+a0DaJ3Op0xvfozlB3GHX6
	gxT4WXNKnDwuL//CZt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUVL9-0000000Dic9-3z2N;
	Mon, 29 Jan 2024 17:22:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUVL7-0000000DibU-3JXG
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 17:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 469F86239F
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA360C433F1
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706548923;
	bh=JYBbAYWNibVPSsm2aZM9pxXWuL6jTBf0j8mHiaK44Ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WuSJcWsKXENTUCDGo/2nsNi6XSHrUZkGChuEAemYPjjWcD24F3le6iVqtY5fwq+UK
	 dHRcUvJZnQPfqFvyR8tEV0GnOh5pPWNl3rmy5mb35Ox3L+Mxp6T5T5hQ7+7gV6gAL1
	 l6HCG62UU0EHCKnyebU+Ti+Bh1ECzWaKwuDdJnixKEqgf7mU+j5enjgXz9SkeXWyav
	 AIpWIf3fuc5wt3yzSwoGrtZHY4xrn35E6Suj5d+7w/LlBI+4oVTqHPLFnm1zFD59EB
	 akVkxhg9PAkJ5oh6k/W4QYOTg/5/VuExl0z8aV7Kj1j6HqKvZKij4FAXSL6cQT4/UO
	 KAcKErCsFpkBg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cf4fafa386so31201981fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 09:22:02 -0800 (PST)
X-Gm-Message-State: AOJu0YxK7JH3og7MN+GX8of8w9gEek2bwDFL8ZUl5PTPvZ0kKDbTt6GS
	Bx3HbGQOx0eVxaspSFBnUrLT+RnphsL8LPsvxuCF14WRfcMFw7dYUY04OAIPUOAIeVExcroLpCZ
	JzC8bgnGBdCWm9VLeHGKURgB6aPo=
X-Google-Smtp-Source: AGHT+IG0VAb/ekeITVOF0bS7rfDDvzjNwelO3EtNC/hYjAZLD6sUGghOToyiYKiqSggijHySxsSuWcZVmbTpRn3TFGY=
X-Received: by 2002:a2e:b8d1:0:b0:2cf:457e:61fa with SMTP id
 s17-20020a2eb8d1000000b002cf457e61famr4993469ljp.37.1706548921169; Mon, 29
 Jan 2024 09:22:01 -0800 (PST)
MIME-Version: 1.0
References: <20240123103241.2282122-1-pulehui@huaweicloud.com> <20240123103241.2282122-2-pulehui@huaweicloud.com>
In-Reply-To: <20240123103241.2282122-2-pulehui@huaweicloud.com>
From: Song Liu <song@kernel.org>
Date: Mon, 29 Jan 2024 09:21:49 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5fr5-wz1Q_AvuVCwSJ=byE+wVrKcKXrnJQjshn8Hc-sw@mail.gmail.com>
Message-ID: <CAPhsuW5fr5-wz1Q_AvuVCwSJ=byE+wVrKcKXrnJQjshn8Hc-sw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/3] bpf: Use precise image size for struct_ops trampoline
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_092233_895517_A9B8D586 
X-CRM114-Status: GOOD (  10.68  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMjozMuKAr0FNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gRm9yIHRyYW1wb2xpbmUgdXNpbmcgYnBmX3Byb2dfcGFjaywgd2UgbmVlZCB0byBnZW5l
cmF0ZSBhIHJ3X2ltYWdlCj4gYnVmZmVyIHdpdGggc2l6ZSBvZiAoaW1hZ2VfZW5kIC0gaW1hZ2Up
LiBGb3IgcmVndWxhciB0cmFtcG9saW5lLCB3ZSB1c2UKPiB0aGUgcHJlY2lzZSBpbWFnZSBzaXpl
IGdlbmVyYXRlZCBieSBhcmNoX2JwZl90cmFtcG9saW5lX3NpemUgdG8gYWxsb2NhdGUKPiByd19p
bWFnZS4gQnV0IGZvciBzdHJ1Y3Rfb3BzIHRyYW1wb2xpbmUsIHdlIGFsbG9jYXRlIHJ3X2ltYWdl
IGRpcmVjdGx5Cj4gdXNpbmcgY2xvc2UgdG8gUEFHRV9TSVpFIHNpemUuIFdlIGRvIG5vdCBuZWVk
IHRvIGFsbG9jYXRlIGZvciB0aGF0IG11Y2gsCj4gYXMgdGhlIHBhdGNoIHNpemUgaXMgdXN1YWxs
eSBtdWNoIHNtYWxsZXIgdGhhbiBQQUdFX1NJWkUuIExldCdzIHVzZQo+IHByZWNpc2UgaW1hZ2Ug
c2l6ZSBmb3IgaXQgdG9vLgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVh
d2VpLmNvbT4KCkFja2VkLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
