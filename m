Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C7C3ABDD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGFNZxUbuxakamZqGaM4SDr5LrvjFS7/203oUcFc5wE=; b=x9aQpoFGxiIbc5
	pNFvI7+QzfsUHBB705lC5WJ9pkRkjU6s0Tr+jrgL1WfsGX0ea+JYe6Npq1LR7iqYwXC4kQBbW9id7
	NpdYMVbZ1EP+ZRf94aYoJ8tpAvM2ySO/PjB16IX3dpWcwchnaAFaclDr9c/wQ2WXIW+9sdTpiOKNo
	Co5aJ/eVD5Hpzw2ZGH77Jv+t+8V4Fxx9d5hkdCmsUG1mTTN9e2yjArV8rZ40FLbFm7l06fORZmkQA
	aur/y8eG7u1xlW2opAwg9btBdKBCY4ec67eKZSbGLQ4dsePc23YKDSdSCAzGN2nmWINBj1Z0Z0R6/
	3DsEDoLLyiE6bnwvyCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQyG-0000000Dhfu-0dtD;
	Tue, 20 May 2025 17:41:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQvH-0000000Dh8y-0wBp;
	Tue, 20 May 2025 17:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 875FD5C596D;
	Tue, 20 May 2025 17:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E04C4CEE9;
	Tue, 20 May 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747762718;
	bh=VGaDhBtg0n9ra9pI5cqVWokgALf7WrZel6+4231gxXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W2dFTZpAcl9M+nfc1r9xaDZCJk8TLn67XmTY8rdFlL6tQ3H6x08/Itbbx3g/eApix
	 Dss9HxHoifsrAihzkzYOEEYsJ7bFueP8jkPDp20DleaNQ0gf5dy2hpkB3ZwCo0bQMS
	 pIe5ScVI19r2WcAY0fYDmxmzoLEvAg1Thy7i1o8rL7MfhB0M1UX+DVys/jR+lZGvwF
	 pQhnTVQtpx9hOzvQlgRlgLk9daRYqmLAP1Jscou9wWSfCATsexWNrPecHuHfaKNWBt
	 5OKdFpE5uZeb7rq7gEROMefo9pyMd/3R7yG31av6Ei3J9yUc+UGQlnfBFqj/6Lj1IL
	 +30Ae3besJmug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Himanshu
 Chauhan
 <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Xu Lu
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 1/4] riscv: add SBI SSE extension definitions
In-Reply-To: <20250516152355.560448-2-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
 <20250516152355.560448-2-cleger@rivosinc.com>
Date: Tue, 20 May 2025 19:38:35 +0200
Message-ID: <87ldqri3ms.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_103839_303535_AC96E75A 
X-CRM114-Status: UNSURE (   4.31  )
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

Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IEFkZCBuZWVk
ZWQgZGVmaW5pdGlvbnMgZm9yIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyBleHRlbnNp
b24gWzFdLgo+IFRoaXMgZXh0ZW5zaW9uIGVuYWJsZXMgdGhlIFNCSSB0byBpbmplY3QgZXZlbnRz
IGludG8gc3VwZXJ2aXNvciBzb2Z0d2FyZQo+IG11Y2ggbGlrZSBBUk0gU0RFSS4KPgo+IFsxXSBo
dHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJzL21lc3NhZ2UvNTE1Cj4KPiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpBZnRlciB5b3Ug
cmV2aWV3ZWQgdGhlIGNoZWNrcGF0Y2ggb3V0cHV0LCBmZWVsIGZyZWUgdG8gYWRkOgoKUmV2aWV3
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
