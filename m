Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A6CCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PklyAW2X9x1gie9Acr1jM5VQDAtzuzDfcj0vGTabFU=; b=vk4pJKnA02tA8t
	1GGUK2daz4s0bKNdM0mKgSwnrLQmRoGHjyGwXDPVN+3N9xh9Nl6mpo9bwDKmlXbRFk8DVJ2ORVcUL
	7yDp32JAKMa6uEDDFns9mNCSTRplnOuAwQ8ZGGduH6HGCuAIy7jRIJ6T7yaIZKekEwawofmTdKd4B
	rm5UHskz0F/8syPMX0uj22tZ6xaKw93x0kAyNJxDmLEeDgUoLcXAJWMVV5JLSvsqoROAXVKnlTUw9
	qKIQ4sO+yiQNbU1duVuSqxLjFwcuKeadQi2RCrd8hY5uGRu2NFk3GkhyX4zzr7YfTAkaL6Hy1Z+ZA
	7YmvpJ5tqg2D3BLsLWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoa-00000007R8g-0glb;
	Wed, 10 Apr 2024 14:20:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoU-00000007R42-2ZJO
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 213BA61DAF;
	Wed, 10 Apr 2024 14:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D93C43399;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758833;
	bh=4Kz3l5iBTcMk71coylVCtzT5pq2n7AmkPTmE+6qrX0w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B6qW9O7swP1wL84j3tLl3/lG+g8s/TCOA3SmRdcgQUwOvWQWxz5khRwK/tuIWnnjr
	 jH1eIOvAhhTzYmC4BTtxd2G89aiJd6ZoI/MVIFR2U9qSposi/TCbEWiDqOG75y38OW
	 FeNh/I4NybWZfbuC3Rtae438WkNoD59lJn67idghpWQZsj2G4sXghad1EHZpMmgBo+
	 VDTeNGg+tJecTiOkThtU5PXxmg9YWprKhCeyn5tLI6JX9AsaY7PbkTwHguohOLt5hM
	 YCIPficYT31yX65nnmtisdLu4ke3e47RiYqQuVzd5OXMmHkug7a8UNa2ba80V6pyBw
	 3lu3dSC9a5OrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 675D6CF21C7;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] selftests: sud_test: return correct emulated syscall value
 on RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275883341.18495.6912537160519241189.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:20:33 +0000
References: <20231206134438.473166-1-cleger@rivosinc.com>
In-Reply-To: <20231206134438.473166-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, shuah@kernel.org,
 krisman@collabora.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, palmer@rivosinc.com, bjorn@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_072034_725522_0C15767D 
X-CRM114-Status: UNSURE (   9.20  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFdlZCwgIDYg
RGVjIDIwMjMgMTQ6NDQ6MzcgKzAxMDAgeW91IHdyb3RlOgo+IEN1cnJlbnRseSwgdGhlIHN1ZF90
ZXN0IGV4cGVjdHMgdGhlIGVtdWxhdGVkIHN5c2NhbGwgdG8gcmV0dXJuIHRoZQo+IGVtdWxhdGVk
IHN5c2NhbGwgbnVtYmVyLiBUaGlzIGFzc3VtcHRpb24gb25seSB3b3JrcyBvbiBhcmNoaXRlY3R1
cmVzCj4gd2VyZSB0aGUgc3lzY2FsbCBjYWxsaW5nIGNvbnZlbnRpb24gdXNlIHRoZSBzYW1lIHJl
Z2lzdGVyIGZvciBzeXNjYWxsCj4gbnVtYmVyL3N5c2NhbGwgcmV0dXJuIHZhbHVlLiBUaGlzIGlz
IG5vdCB0aGUgY2FzZSBmb3IgUklTQy1WIGFuZCB0aHVzCj4gdGhlIHJldHVybiB2YWx1ZSBtdXN0
IGJlIGFsc28gZW11bGF0ZWQgdXNpbmcgdGhlIHByb3ZpZGVkIHVjb250ZXh0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdl
ZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gQWNrZWQtYnk6IFBh
bG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRo
ZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjJdIHNlbGZ0ZXN0czogc3VkX3Rlc3Q6IHJldHVy
biBjb3JyZWN0IGVtdWxhdGVkIHN5c2NhbGwgdmFsdWUgb24gUklTQy1WCiAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3Jpc2N2L2MvYmFjMjkyZTg0OWQ3CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5r
IHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtl
cm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
