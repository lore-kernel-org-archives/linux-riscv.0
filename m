Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B20CD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F//kQRxpJG/O+HuuwK/UhVSn/X2yvDysPdABZH7kv3w=; b=PBZw0ubtwPwVmL
	lUtQseaV9gJxIo9nmPd6QmQozj9xgvrjmZ7QAtLyByuiPdcYFQ8xv29v6AMKFRsgEixiB80bf/M+h
	2HRY7qRwqYo0ICy3InaF5yEnfKVxbTpnmWGSgIKzY9oHLzYyAIcDJcpE6fjcKjoOftlGZinq4Q5sG
	zRlQuYAHhAyYqEBlwl1C/8BbbJDWTnnW3GlvOmNliAsr1zgXV04ntE+2XY59pRItxEaEu2JcBoH08
	VpKbzpbrncprrhOAeH2VlFHUIfp4+cMXPWZ0wFy06m65hogUPYFDCoZFruxhH6YdybLzFRHbJpaZ6
	DkqyWTb3pBM2Hs/6oE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfvI-0000000ETNc-1FEV;
	Wed, 03 Jun 2026 07:21:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfvG-0000000ETMw-1ZV1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:21:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B92A444BE
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 07:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8D81F008A2
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471313;
	bh=gKkizs+f68UKcuJTGDD7IBI8qWtBY0VHFMDqy27eA5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZU1NwxED194mLKHYU8sGvVDm7lBEdNNqlJs/t9l8GR1Z3kctzLil3hYCsRHD/zA45
	 /GOjY0NkzhJRpAXtiwBTQkRJA80+umbuCdGBzGUf5WJHuBehjTV7EdimnSlR1vJ2PX
	 OEeJmiZQnirLX5eaQWmn7SFKagaOem4ccP+EGLjOfRIbrAbGc+E50+AG5kRc3DjSMt
	 /yOWrUlnZmVKwBPrnWXtxM9axON1/+R8z6K0K6feI9Gu3hjMKc9qU4GmOf14/HOgr9
	 WlLPpWUHE2Gn6+fm0KEEKBmXIeVU+p6VKYICKxOUlstf22nJ43lEftDhpMFSqvPgMc
	 DQylgcdaLdczQ==
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5177b1a7441so6491311cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/o1Iwx5NgcSxD1oHtnAF3rSsIUcbFZOJA+FMxVMwDj6pEVtanJorVHLNNTkMft9lUKG2Y40rhvu92CoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6nnWHkzn55UEQvzZqL3RJnj+w7dDavzfB+2hl7GCuGVBdvlEZ
	/VDxXhQtrTfEsvfYjt3OoCoN2/hrtQaDnvDGfmNDIYVxX/WrO9q05M5h/dsiGTtQz/Z4mhYEVWN
	qo6w1fHv/Uwe48aaKNtOTWRMV1g1lvfI=
X-Received: by 2002:a05:622a:8c16:b0:516:e189:3482 with SMTP id
 d75a77b69052e-51778705ae1mr32469561cf.29.1780471312590; Wed, 03 Jun 2026
 00:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260602205847.102825-1-varunrmallya@gmail.com> <20260602205847.102825-2-varunrmallya@gmail.com>
In-Reply-To: <20260602205847.102825-2-varunrmallya@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 3 Jun 2026 09:21:41 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNjWsEDUaEX0aqMMYhXFJDLqEVkhRw00eT3c453OR_FE3g@mail.gmail.com>
X-Gm-Features: AVHnY4IrrqIAKdlwh3i7VOvIUnpe1Vfg8EEQv7q2bfleL5garBpk7i54WjKiuvo
Message-ID: <CAJ+HfNjWsEDUaEX0aqMMYhXFJDLqEVkhRw00eT3c453OR_FE3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: use host CPU features in JIT disassembler
To: Varun R Mallya <varunrmallya@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	puranjay@kernel.org, menglong8.dong@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	pulehui@huawei.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_002154_439344_4CBF7CEB 
X-CRM114-Status: UNSURE (   6.64  )
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

T24gVHVlLCAyIEp1biAyMDI2IGF0IDIyOjU5LCBWYXJ1biBSIE1hbGx5YSA8dmFydW5ybWFsbHlh
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQYXNzIHRoZSBob3N0IENQVSBuYW1lIGFuZCBmZWF0dXJl
IHN0cmluZyB0bwo+IExMVk1DcmVhdGVEaXNhc21DUFVGZWF0dXJlcygpIGluc3RlYWQgb2YgdXNp
bmcgTExWTUNyZWF0ZURpc2FzbSgpLCBzbwo+IHRoZSBkaXNhc3NlbWJsZXIgY29ycmVjdGx5IGRl
Y29kZXMgQ1BVLXNwZWNpZmljIGluc3RydWN0aW9ucyBhbmQKPiBleHRlbnNpb25zIHN1Y2ggYXMg
UklTQy1WIGNvbXByZXNzZWQgYW5kIHZlY3RvciBpbnN0cnVjdGlvbnMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBWYXJ1biBSIE1hbGx5YSA8dmFydW5ybWFsbHlhQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
