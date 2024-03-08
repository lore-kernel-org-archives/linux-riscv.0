Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E096C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vc3A+Slk0hMVteLimUMuPJG5wruihtleJe9SZ29d5Lc=; b=aX94Cr2VLevMC8
	ELMjwXYPv3kDBJeTzq6gtWic45dtlySHZMotG+9iFdww8WISMkSzlJXkVvn0WOv9iiToNF84WwH+7
	qBQTfbqTKnwecZ352Mu0SP7BdJ8f8fQ89ugWswE0U3NpJgSt/jDtLvLnNhJjuxRLAT3hTxFweFhV2
	Wc/Urnmz5vxQ359QCqbNZh493ofaC1X9A09j0ARMtzGaXDBMnieny/b6W+8KoQEnMjM9zFlo8fpYS
	MiUsSb4lOinwq4VgT4vd+hkaQ/FiCFff2k57J2Y4ejhE/cwhREQRjph3s3LW44MgdnOYWa3c8cLGU
	52A3mXf2SeBWcf2lN3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribwH-00000009nGf-1v3k;
	Fri, 08 Mar 2024 15:15:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribwE-00000009nFN-0KR2
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 15:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 531A8CE28ED;
	Fri,  8 Mar 2024 15:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14120C433F1;
	Fri,  8 Mar 2024 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709910907;
	bh=kiBG6NDg0mdz/VQTJh0JeyINO/3FNBUFPbEEfObBu1U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D7xotcQe3A04Jva6aO95z5uwgSua5Kh8NIKGlm9gMf8NZn7Lh2SXPv8O+9Q/ctBbX
	 SE5/1uOnYkir0I8D3mMkxOy4240pGsl4Vlpg8NiFLkRgtw7thX5S2gyWytXw4zfllB
	 96Hd6aUc6P+yJGcvxlNfd3p1oKPIrfq/N+TVVGiDU3ute21NHvlP6DOvfQu7NrvxfH
	 +AYKncrCxuNeZnIdyIIQXlobvX4Mg+h5ugyQ/xg5ighezsIqijXzLB3SwuEtHfIuqh
	 in9lVWw+zzvQCPXPtcOaJVn2T+sOBMbEF4YxGPZTTZjzcmGpNvFME/2OF2jXNvKn3h
	 05Nh1GxfmGPOA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>,
 Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Song
 Shuai <suagrfillet@gmail.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, Al
 Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <CANk7y0jpKb8XUycKxHbsrJGEWcTvVDYFjM+A2VUe0JeZ2Y-Zbw@mail.gmail.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <CANk7y0gbQdYw0V+CEv-z8wFGXnki8KSn4c8+i0iZ1UFNCg7wJQ@mail.gmail.com>
 <87jzmdowp4.fsf@all.your.base.are.belong.to.us>
 <CANk7y0jpKb8XUycKxHbsrJGEWcTvVDYFjM+A2VUe0JeZ2Y-Zbw@mail.gmail.com>
Date: Fri, 08 Mar 2024 16:15:04 +0100
Message-ID: <87edckkb5z.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_071510_339467_6A04BDA1 
X-CRM114-Status: UNSURE (   8.12  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+PiBOb3csIEkg
dGhpbmsgYSBiZXR0ZXIgYXBwcm9hY2ggZm9yIFJJU0MtViB3b3VsZCBiZSBpbXBsZW1lbnRpbmcg
d2hhdCB4ODYKPj4gaGFzIChhcmNoX2Z0cmFjZV91cGRhdGVfdHJhbXBvbGluZSgpKSwgcmF0aGVy
IHRoYW4gQ0FMTF9PUFMgZm9yIFJJU0MtVi4KPj4KPj4gVGhvdWdodHM/Cj4KPiBJIGFtIGdvaW5n
IHRvIHNwaW4gc29tZSBwYXRjaGVzIGZvciBpbXBsZW1lbnRpbmcKPiBhcmNoX2Z0cmFjZV91cGRh
dGVfdHJhbXBvbGluZSgpIGZvcgo+IFJJU0MtViwgdGhlbiB3ZSBjYW4gY29tcGFyZSB0aGUgdHdv
IGFwcHJvYWNoZXMgYW5kIHNlZSB3aGljaCBpcwo+IGJldHRlci4gQnV0IEkgYWdyZWUKPiB0aGF0
IGFyY2hfZnRyYWNlX3VwZGF0ZV90cmFtcG9saW5lKCkgaXMgYSBiZXR0ZXIgYXBwcm9hY2ggZ2l2
ZW4gdGhhdAo+IHdlIGNhbiBqdW1wIGFueXdoZXJlCj4gd2l0aCBhdWlwYy9qYWxyLgoKWXVwLCBh
bmQgdGhlIHRleHQgc2l6ZSB3b250IGJsb3cgdXAuCgoKQ2hlZXJzLApCasO2cm4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
