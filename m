Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD30DF34C74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65nyqBHeKCoLD5fWQza0sQzQjsUikircYgXx2zx2JZc=; b=iMpJuCuOC30wpt
	oNM1bAphHxztArNQyRW217RvUl0DpWnc/VYuz5zOXIFhGWxlbZoCxLiXDHRqr4avxV+htL+VRgJ7p
	ektlK+D1SmPsYAeQL+ZOM6aOxSQHvz36EIlYevBOh/9YGdaO+D6MyDGt7VO4YRjuzT7p5t5xOzDsA
	GCPkEusBLVKfDGWyjUesFrg8eWtmsvhGWWe0KpsAtkpzPQOhlxJNpwBGfVupRfZpN155IOt6ZV8Ux
	oB/iccylzWi6fH7Z+pmHpBXG21Y0uqBkLjbVYkNLgrUJjQU35CMmUEwwIJ/0JtCCPZAZdRA0luYU4
	jqGIoZmyXSvuPgkJJ9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKxe-0000000G7no-3L2c;
	Mon, 13 Apr 2026 17:20:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKxb-0000000G7mG-40oM
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 17:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E810D44511
	for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 17:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A332C2BCFD
	for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100830;
	bh=Y1VX+P8oKWLTokXsXbxH9r3i6MRKz6cq07No9cqxGa4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hjx/j7EeQb3ovYPGcgHFrgVCclYE08OplfS9oT/yGLNHuzLisJZpRzLV3eZjrmdjB
	 hfHwN2AcfWQGGakTUlq7+7EAeGLSvhOiSYsofrjFWQaUxwcrg7lPshv6iBy3A2/hrv
	 nQZ9g23zvr9lf6q0UJF8BZYXzIoby59+URWoanrxR2P4vJanFR7EVgY+3NTgyePjyG
	 b/c+2aOcFMBIByTZz75EukZHTqr0xFgwIcuQg5Act6bDZEgIM1X2CuNlhY04AwEGns
	 lhDFafyG1ALEsyk+SoCF3Sden37R2DtH85Xu9mJgOI5djFUKG+zlj+U3iTKZS2z/TP
	 XFCypl8OUtKjQ==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506a747448dso38029011cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 10:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ83mw/sol7uc1vEn6fUy3hlVKrOKyyz2nGjJev2wxbAZ2Vcm2az+SimtFyUoqSeWFoFYAmZPS3WxnBobw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQr8qn7A+hSIkoMxTog7QpvbTjDHPEf7WNjjl9eO6mbZzfNmQA
	ydWkf3JAfftF4W+s4A2IRkgopvtmU4KnIEy0rhH54qm0AYk/Ltlf0JEj8Jty9al4oy0brbvaJq/
	TB1Xz9gtnk820v3oDz5PAmZh1MgGrmqY=
X-Received: by 2002:a05:622a:99a:b0:50d:8905:7cc7 with SMTP id
 d75a77b69052e-50dd5750f2amr228728281cf.0.1776100829547; Mon, 13 Apr 2026
 10:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260413123256.3296452-1-puranjay@kernel.org> <20260413123256.3296452-3-puranjay@kernel.org>
In-Reply-To: <20260413123256.3296452-3-puranjay@kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 13 Apr 2026 10:20:18 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5=qtjESDr-HQkxkYKrBFjpXAf3HRYOH5ESEd8Wvv9dYQ@mail.gmail.com>
X-Gm-Features: AQROBzB08PAYs8xzmtpFMbY0dd6o-2NWqQR25UWik8u6kWpL-cfIxQiCnEnElUw
Message-ID: <CAPhsuW5=qtjESDr-HQkxkYKrBFjpXAf3HRYOH5ESEd8Wvv9dYQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf, riscv: Remove redundant
 bpf_flush_icache() after pack allocator finalize
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_102032_046327_FB397B0F 
X-CRM114-Status: UNSURE (   9.95  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgNTozM+KAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IGJwZl9mbHVzaF9pY2FjaGUoKSBjYWxscyBmbHVzaF9p
Y2FjaGVfcmFuZ2UoKSB0byBjbGVhbiB0aGUgZGF0YSBjYWNoZQo+IGFuZCBpbnZhbGlkYXRlIHRo
ZSBpbnN0cnVjdGlvbiBjYWNoZSBmb3IgdGhlIEpJVGVkIGNvZGUgcmVnaW9uLiBIb3dldmVyLAo+
IHNpbmNlIGNvbW1pdCA0OGE4Zjc4YzUwYmQgKCJicGYsIHJpc2N2OiB1c2UgcHJvZyBwYWNrIGFs
bG9jYXRvciBpbiB0aGUKPiBCUEYgSklUIiksIHRoaXMgZmx1c2ggaXMgcmVkdW5kYW50Lgo+Cj4g
YnBmX2ppdF9iaW5hcnlfcGFja19maW5hbGl6ZSgpIGNvcGllcyB0aGUgSklUZWQgaW5zdHJ1Y3Rp
b25zIHRvIHRoZSBST1gKPiByZWdpb24gdmlhIGJwZl9hcmNoX3RleHRfY29weSgpIC0+IHBhdGNo
X3RleHRfbm9zeW5jKCksIGFuZAo+IHBhdGNoX3RleHRfbm9zeW5jKCkgYWxyZWFkeSBjYWxscyBm
bHVzaF9pY2FjaGVfcmFuZ2UoKSBvbiB0aGUgd3JpdHRlbgo+IHJhbmdlLiBUaGUgc3Vic2VxdWVu
dCBicGZfZmx1c2hfaWNhY2hlKCkgcmVwZWF0cyB0aGUgc2FtZSBjYWNoZQo+IG1haW50ZW5hbmNl
IG9uIGFuIG92ZXJsYXBwaW5nIHJhbmdlLgo+Cj4gUmVtb3ZlIHRoZSByZWR1bmRhbnQgYnBmX2Zs
dXNoX2ljYWNoZSgpIGNhbGwgYW5kIGl0cyBub3ctdW51c2VkCj4gZGVmaW5pdGlvbi4KPgo+IEZp
eGVzOiA0OGE4Zjc4YzUwYmQgKCJicGYsIHJpc2N2OiB1c2UgcHJvZyBwYWNrIGFsbG9jYXRvciBp
biB0aGUgQlBGIEpJVCIpCj4gU2lnbmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5
QGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4KCmRpdHRv
IG9uICNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
