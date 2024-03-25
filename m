Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED29C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfRwVBHv752/BrVzo5n3WSGmeaObY2YauuZLmE1IJfM=; b=RqTune0vFDbvnm
	DNfHc/disyyio8TBx7Fuc7JLy54qSzqnypG9xmJfKwyN4Bxb6F/XliS0j/wF4wp6IcTg22NLW49pO
	TKfPqsfwgIKEcNyBCF/EhDahfNHrGtwjYDAQRkdcBu2qMumyX4bqAmU0VZH4JXMwa3Z3wNmA025ZW
	05CqOfOiym3eh0qv8BpRZeR9WsHDBRGwxPnzwykHLVTEyAHpkwz9PGaHVNgdm+DrlZEMnXj5Afjps
	6HFYmPW91lqNG7aCwj78qePnq3+Rj9fm8HbL4jb5USmuyD4vZbsCZFuupOHsRZ0oz6xJe3RNt90b6
	mp+RHQ2/A11FKY6KFzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqnD-00000001mBU-2MVl;
	Mon, 25 Mar 2024 20:19:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqn9-00000001m9w-178K
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:19:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 215EDCE1CF7;
	Mon, 25 Mar 2024 20:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC190C433F1;
	Mon, 25 Mar 2024 20:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711397972;
	bh=jHzWHipH1FUjrW3QmoX2gyQBJf9dn+dr+EwQqJeJ2Gc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bum2rFsu+JPbqMUpVZ1X5guR1xNpEttm8Bi0nI3fr55l93tXuus0BNLJLeKq6cFCd
	 caP7tYJXuxFtGlATVhMJ9W+JnBCc26LRFiqW8uAAJSUEmA+9jnmCwbcqaG45Y4E0/h
	 Vw2l8X+A14Yy2ImoX1HWxBHe0aObKGkgdI9of6Ojoq7Nfi/UwJMsFbwvLPT4aWoL1Z
	 eI26NO5jq5IGego/V4W6BppAreU9bQumYwzFBHyBd4z6RQIGRd0f/+RqOYNngXfZWz
	 xmU/KgNGbaNCTCVMYdVBIybqSj4/QaJ6gVsqqYBxP7pbOEUlzBc2ay/67VzrEF2O8o
	 YlSi505dIgR3Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Puranjay Mohan <puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf,riscv: Implement
 bpf_addr_space_cast instruction
In-Reply-To: <20240325-creamed-unlovely-4c80082e9b8c@spud>
References: <20240325155434.65589-1-puranjay12@gmail.com>
 <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
 <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
 <20240325-perpetual-liking-25f26e485b65@spud>
 <CANk7y0jtURUC6PWx5nSDigMpScUT+p3qd=hTtqJkCqAN+Nq32A@mail.gmail.com>
 <20240325-creamed-unlovely-4c80082e9b8c@spud>
Date: Mon, 25 Mar 2024 21:19:29 +0100
Message-ID: <87edby3vzi.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_131935_503501_978A0588 
X-CRM114-Status: UNSURE (   3.94  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+PiBJcyB0aGVyZSBhIHNl
cGFyYXRlIENJIGZvciBSSVNDViByZWxhdGVkIHN0dWZmPyBpcyBpdCBwdWJsaWM/Cj4KPiBJdCdz
IGJhc2VkIG91dHRhIHBhdGNod29yaywganVzdCBsaWtlIHRoZSBuZXRkZXYvYnBmIHN0dWZmOgo+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0LwoK
KnNhbGVzbWFuIG1vZGUgb24qCgouLi5hbmQgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGUgQ0kgKGFu
ZCBzb3VyY2UhKSBjYW4gYmUgZm91bmQgaGVyZToKCiAgaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4
LXJpc2N2L2dpdGh1Yi1jaS93aWtpCiAgaHR0cHM6Ly93aWtpLnJpc2Vwcm9qZWN0LmRldi9kaXNw
bGF5L0hPTUUvUG9DK0dpdGh1YitSdW5uZXJzK29uK0dLRQoKSW1wcm92ZW1lbnRzIGFyZSB2ZXJ5
IG11Y2ggd2VsY29tZS4gSXQncyBwcmV0dHkgbXVjaCBvbmx5IENvbm9yIGFuZCBtZQpkb2luZyBi
ZXN0IGVmZm9ydCBoYWNraW5nIG9uIHRoZSBDSS4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
