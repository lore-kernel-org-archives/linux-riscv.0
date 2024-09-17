Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07632C3601D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtLUgb7tybT/pfTu7aTrbh4Ir9GFyNVqhA+f1VQZnz4=; b=pD0PVFkslsYX/J
	LuvC4wD2Uqd6Vvv/Q8xfG1ao7xW/bI8stqkyHPLBHMZc5zWW5xxFYUv5Q0TcRd0NpnC9rQxBFgzbZ
	6AbqudTn0XNam+r2csPiIOlRLvJBNNa6omInNqg1RuV9/NKBr6XHiIqE3x5K9b0IDEF7nHv9Ka8Wr
	MaLKQVSfJbSfIPjG9iOen/PWfTPmtWJP/GUry4CFd1tEL8bzUFw9Z8bj73Ewkac9k5OF+xLP4Fc2W
	vFEiInJOBMJIwBXSIeiyx7YRqIs086iK+wM8I/Znv+CWcGB9oai3ws4cCdkzZLVau2+PVqqueBHKC
	U3xFTgLXqugI+/ICvh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp2-00000006Avl-2j6z;
	Tue, 17 Sep 2024 13:00:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXoz-00000006AtU-0QK4
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DBE75C564A;
	Tue, 17 Sep 2024 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951CFC4CECD;
	Tue, 17 Sep 2024 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578043;
	bh=T/IyP9pgWZ80Y0k3xaS/Zgh3pLNXXlXoZNG7fPR+7wA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u1r6ZdXkNJTnOEqfd5h/3+uxFCPmIfJo7LVA5fD7RmdXH5D2PZ007IRdDE0huLZBL
	 l8OM2xdDox6JggxrSQama0UcKKPsoItWU86mNo2jivz2LSmWa6WYKoPkAgylbbgPXE
	 VdyRjiXfi5Y7dDYxMDqh2onhJta0nS4xYN15ljVUK+OzIlJm3jVoN1q+QwoSYrq8Tl
	 4R0NUtW4wkH9db/guo3Rop0L3MrTnK5s44XvJudvQtZmaSeyBQA527OG3QJHtx6JbK
	 IFhx5zHQVRaGmfdNVUzg8Cgj/YWyA99exbme6ROXRxYpNRDyGhLzvInt3qFVD8zVHy
	 NpwzYpD0qoRmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71C173809A80;
	Tue, 17 Sep 2024 13:00:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv: stacktrace: Add USER_STACKTRACE support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657804401.126252.11110872057144476877.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:44 +0000
References: <20240708032847.2998158-1-ruanjinjie@huawei.com>
In-Reply-To: <20240708032847.2998158-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, bjorn@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 dev.mbstr@gmail.com, samuel.holland@sifive.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060045_228707_A3A9C89B 
X-CRM114-Status: UNSURE (   9.24  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1u
ZXh0KQpieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46CgpPbiBNb24sIDgg
SnVsIDIwMjQgMTE6Mjg6NDUgKzA4MDAgeW91IHdyb3RlOgo+IEFkZCBSSVNDLVYgVVNFUl9TVEFD
S1RSQUNFIHN1cHBvcnQsIGFuZCBmaXggdGhlIGZwIGFsaWdubWVudCBidWcKPiBpbiBwZXJmX2Nh
bGxjaGFpbl91c2VyKCkgYnkgdGhlIHdheSBhcyBCasO2cm4gcG9pbnRlZCBvdXQuCj4gCj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIEZpeCB0aGUgZnAgYWxpZ25tZW50IGJ1ZyBpbiBwZXJmX2NhbGxjaGFp
bl91c2VyKCkuCj4gLSBSZW1vdmUgdGhlIExUUCBtZXNzYWdlIGFzIEJqw7ZybiBzdWdnZXN0ZWQu
Cj4gLSBBZGQgdGhlIHVzZXJzdGFjayB0cmFjZSB0ZXN0IGluZm8uCj4gCj4gWy4uLl0KCkhlcmUg
aXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFt2MywxLzJdIHJpc2N2OiBGaXggZnAgYWxp
Z25tZW50IGJ1ZyBpbiBwZXJmX2NhbGxjaGFpbl91c2VyKCkKICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcmlzY3YvYy8yMmFiMDg5NTVlYTEKICAtIFt2MywyLzJdIHJpc2N2OiBzdGFja3RyYWNl
OiBBZGQgVVNFUl9TVEFDS1RSQUNFIHN1cHBvcnQKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cmlzY3YvYy8xYTc0ODMzMTgyNzQKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVl
dC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRj
aHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
