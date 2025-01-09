Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD62DE77199
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeXp8c+fzIrG4Kk0IR7NCuql2+Ofr4SU6aoYsrUdIWo=; b=LdcYQh2y7Ladpn
	DQBPecE0DTIwN+k6NPg8VSpRT7IjHAyvxV9PZPhue++hvdddk01sotQNqUJU26i70iXUIJQvbangc
	zNd4S27TT5hpbi9tV8qa2+hXdI3X16ovt3hp6nN9rK/IVVYkL2gZg0XtSGhaPlhLAlgQ1DPVo1O3v
	eYWekm4YQEDee98aTl2l8Fgl+mxQhpv2+KpsEKzhoSu1Lim6+FOz1uBF/JYAmHAGgaZFNKbOTmH92
	VFh781jF4uRFRsHAzRC7P+yqwUoSRKuyviFATKisvHjP03CblYWHMEIahdlF+k0Mf1uJW6+oyoEIQ
	KSKJmruBmOVkYhNvjImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCv-0000000Cdkp-1xUd;
	Thu, 09 Jan 2025 16:16:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCr-0000000Cdia-07sz
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8398D5C5C74;
	Thu,  9 Jan 2025 16:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF3FC4CED3;
	Thu,  9 Jan 2025 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439384;
	bh=w3VeTix6JtZLdXjlspY/iu/wBosmJyRn541J3NZAu9k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EWXcfwdUpe9+uWBpthJHLJRvOmAb93qeAenihLpChW2MMBfwjTUQvaksJs2sEaLvd
	 wbBvTztMr87+r+CER87NUd/GzmblrMPsLLfo7ZCE9sf1wmQoYo+yjaxJfltDSgQx3Q
	 HJ445IhBJ/wqngjh/ThH5c57wGzeJMYB6fhntCr2erioCptp1fnQdazsLRhiCGCNJD
	 cwxHC85A9qu3SlhHA2LIffdguNA8wlIxfWWX9E8bdgTk9ctXTI2bR5NDEx46K7XAuS
	 +8O2kmlBWEGhDJCBX+443aIPFIXHdCMHZe1Etk2iyFbKRd+B/tbL5p7Jrvje4tcFur
	 Gyzay/S6K9BQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CCE380A97D;
	Thu,  9 Jan 2025 16:16:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: module: remove relocation_head rel_entry member
 allocation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643940599.1375203.2018216601939564828.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:45 +0000
References: <20241128081636.3620468-1-cleger@rivosinc.com>
In-Reply-To: <20241128081636.3620468-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org, charlie@rivosinc.com,
 zhangkai@iscas.ac.cn, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081625_111740_29CA2C8C 
X-CRM114-Status: UNSURE (   8.59  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFRodSwgMjggTm92
IDIwMjQgMDk6MTY6MzQgKzAxMDAgeW91IHdyb3RlOgo+IHJlbG9jYXRpb25faGVhZCdzIGxpc3Rf
aGVhZCBtZW1iZXIsIHJlbF9lbnRyeSwgZG9lc24ndCBuZWVkIHRvIGJlCj4gYWxsb2NhdGVkLCBp
dHMgc3RvcmFnZSBjYW4ganVzdCBiZSBwYXJ0IG9mIHRoZSBhbGxvY2F0ZWQgcmVsb2NhdGlvbl9o
ZWFkLgo+IFJlbW92ZSB0aGUgcG9pbnRlciB3aGljaCBhbGxvd3MgdG8gZ2V0IHJpZCBvZiB0aGUg
YWxsb2NhdGlvbiBhcyB3ZWxsIGFzCj4gYW4gZXhpc3RpbmcgbWVtb3J5IGxlYWsgZm91bmQgYnkg
S2FpIFpoYW5nIHVzaW5nIGttZW1sZWFrLgo+IAo+IEZpeGVzOiA4ZmQ2YzUxNDIzOTUgKCJyaXNj
djogQWRkIHJlbWFpbmluZyBtb2R1bGUgcmVsb2NhdGlvbnMiKQo+IFJlcG9ydGVkLWJ5OiBLYWkg
WmhhbmcgPHpoYW5na2FpQGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxh
am9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4KPiBUZXN0ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+Cj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5r
czoKICAtIFt2M10gcmlzY3Y6IG1vZHVsZTogcmVtb3ZlIHJlbG9jYXRpb25faGVhZCByZWxfZW50
cnkgbWVtYmVyIGFsbG9jYXRpb24KICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy8w
M2YwYjU0ODUzN2YKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRv
dCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdi
b3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
