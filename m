Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755DDE77199
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ri5UUe6L7ayGPscYwHAIp2pr7fTy6rCi15dvRji9v0=; b=1LFtvTrGuvlcRV
	rCHrvqEKKZ6+tSBhQAYSfs3GjIWgPrpQSCYFht+x5RtLMszJKReeYSCuVykQdgHtEcZ+y4o/i17ZT
	IxJaJmVpYIIhOftcObk8yWI5Iz8yiiGutdC+Nf60oxtU2+YOMHMsJlbf7wnt6WmiKgldVJRuDV3yq
	qHC2sGH4Rz1Fa6FhfyF7vXkwFrMgTK7SwnVlNs/AUZQGTUo9gtSqsATJOQRDoMj+fUzxQ2dC8+iAv
	Sqpeqttvv8RViInyL2FE1sa5U2kZ8cXZOYE99pFfkvVQ7tIL6xA4FP6BYJvJj8wjuZ6fgVsR+7HUT
	Y60Z6qwcm9ekQFP7kB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCr-0000000Cdiz-3qFU;
	Thu, 09 Jan 2025 16:16:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCp-0000000CdiH-31op
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D7B85C5BDF;
	Thu,  9 Jan 2025 16:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E99C4CED6;
	Thu,  9 Jan 2025 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439383;
	bh=1F5eIseTUkjVCc2h24GfQ7JMZM/Tnc1tqemDD6ZG91U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hn4f0k6BA8hefxug0N0Gxer4jyNj1q9wu5V+YCMr8OVvOUEMMM3nxaGiBdEx5vvo5
	 3yj76VTNX6P8tCOwKsY8kVHk6Z8NdmUYiZiNTPgsF6ePEXPeNwQWXPEFS3vcDg/dyW
	 cLee8moO1FRKu3mDXiBfwU8wy9kLLPB17CbZlQ8JrJz/lC3qqZyFrErIwp/SLG/8IY
	 D5IAPikRVmW7hDtZ6EvTY4h6bLu4CG4VVWU5TvwfixB3U45nt/9d6mjN3CeCcldUsn
	 bYPUalU/ZYq3GyYGuMyp6xdkfONZboC9vLC3yeG34gx6M5xvj8UKmol6raTgKqnJG1
	 8L85yNNG9WNVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB122380A97D;
	Thu,  9 Jan 2025 16:16:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: module: use a plain variable for list_head instead
 of a pointer
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643940449.1375203.11421611509133898262.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:44 +0000
References: <20241127142519.3038691-1-cleger@rivosinc.com>
In-Reply-To: <20241127142519.3038691-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 charlie@rivosinc.com, zhangkai@iscas.ac.cn, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081623_795559_6C7CEC68 
X-CRM114-Status: UNSURE (   8.09  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgMjcgTm92
IDIwMjQgMTU6MjU6MTcgKzAxMDAgeW91IHdyb3RlOgo+IHJlbF9oZWFkJ3MgbGlzdF9oZWFkIG1l
bWJlciwgcmVsX2VudHJ5LCBkb2Vzbid0IG5lZWQgdG8gYmUgYWxsb2NhdGVkLAo+IGl0cyBzdG9y
YWdlIGNhbiBqdXN0IGJlIHBhcnQgb2YgdGhlIGFsbG9jYXRlZCByZWxfaGVhZC4gUmVtb3ZlIHRo
ZQo+IHBvaW50ZXIgd2hpY2ggYWxsb3dzIHRvIGdldCByaWQgb2YgdGhlIGFsbG9jYXRpb24gYXMg
d2VsbCBhcyBhbiBleGlzdGluZwo+IG1lbW9yeSBsZWFrIGZvdW5kIGJ5IEthaSBaYW5nIHVzaW5n
IGttZW1sZWFrLgo+IAo+IFJlcG9ydGVkLWJ5OiBLYWkgWmhhbmcgPHpoYW5na2FpQGlzY2FzLmFj
LmNuPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4K
PiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW3YyXSByaXNj
djogbW9kdWxlOiB1c2UgYSBwbGFpbiB2YXJpYWJsZSBmb3IgbGlzdF9oZWFkIGluc3RlYWQgb2Yg
YSBwb2ludGVyCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvMDNmMGI1NDg1Mzdm
CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
