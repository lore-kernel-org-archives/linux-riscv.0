Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFE8D729E9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFIDdj/A/NeZN2JJ535oqmeW/UNaiOOpNGNwGVFMwdw=; b=EiyvjXKLiXrRa2
	f8Zpu/dYu1sov+Ubfk8F3zFy9nMFEZvY8B7fzmi7p4fOhkRYMyZKntWBWHMeygQubLG3BAFAhZxF6
	0rg6v+WaD0bB5op23TbI3I5hrMEhUu2yDMeP+jPefvCgqTDog+QDf7tkQAgrRcpOzVySaOTxBh9jK
	uDhu/8UDZQBg6aflokdVEm3AFrg4v8R5oyglwfiN2dNkpF9HSJ495DRVr7TNzWkwmzGthczqTMKgM
	Je1n4nfao4Xxb+MJnlPxL8f6MygyPftq5+j4Xaf7G0Bg0txiuq8qFH2J5t6mgTNrkhmiySD13vXcm
	rq4i2vji72IvaQH1CPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3jA-00000000a7t-0nmZ;
	Fri, 29 Nov 2024 16:20:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3j8-00000000a7F-0RAT
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 16:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22208A4019F;
	Fri, 29 Nov 2024 16:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEC7C4CECF;
	Fri, 29 Nov 2024 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732897216;
	bh=euN+eAhlu9UIjsZJy6+2NNI8i9i1qM3tGs8d5y8GE9U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vOUtq4HoFWjFonhi/D+d+uFXfo5g9tWybrvvz8U5M3uRSm8hKeRshXzM/t+R8sS+b
	 AAKWamZ4vuPsJUg/LFB7Lu5m02yk1MdsQeD2cArQfng9dptMbfOQGhFn+CTjuu4FjI
	 ES5k6tsf1XeJnz7K/NbQctCewXqfAVcUsnx5EREY9T6gQyM6dmpWI8yVXzemPMnJ3o
	 mPPtwGymJzwFNioSfCxnoQBq5u+/JWTJ0vKcg2VKEe1eYVahwtVFt9kO/jBK+2DMlQ
	 8hg5mjfvXexsYX3XcFuwAHod/ww0j+rPZlplWKVvsoORo4qD4pLRjaTvxmh59jTgGJ
	 VJwLDGUqLpWaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E4F380A944;
	Fri, 29 Nov 2024 16:20:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2] tools: Override makefile ARCH variable if defined,
 but empty
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173289723001.2112878.15562925301764191816.git-patchwork-notify@kernel.org>
Date: Fri, 29 Nov 2024 16:20:30 +0000
References: <20241127101748.165693-1-bjorn@kernel.org>
In-Reply-To: <20241127101748.165693-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 alexghiti@rivosinc.com, acme@redhat.com, jean-philippe@linaro.org,
 qmo@kernel.org, andrii.nakryiko@gmail.com, bjorn@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 davidlt@rivosinc.com, namhyung@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_082018_208091_2ABBA751 
X-CRM114-Status: GOOD (  11.70  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIGJwZi9icGYuZ2l0IChtYXN0ZXIpCmJ5
IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+OgoKT24gV2VkLCAyNyBOb3Yg
MjAyNCAxMToxNzo0NiArMDEwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+IAo+IFRoZXJlIGFyZSBhIG51bWJlciBvZiB0b29scyAoYnBmdG9v
bCwgc2VsZnRlc3RzKSwgdGhhdCByZXF1aXJlIGEKPiAiYm9vdHN0cmFwIiBidWlsZC4gSGVyZSwg
YSBib290c3RyYXAgYnVpbGQgaXMgYSBidWlsZCBob3N0IHZhcmlhbnQgb2YKPiBhIHRhcmdldC4g
RS5nLiwgYXNzdW1lIHRoYXQgeW91J3JlIHBlcmZvcm1pbmcgYSBicGZ0b29sIGNyb3NzLWJ1aWxk
IG9uCj4geDg2IHRvIHJpc2N2LCBhIGJvb3RzdHJhcCBidWlsZCB3b3VsZCB0aGVuIGJlIGFuIHg4
NiB2YXJpYW50IG9mCj4gYnBmdG9vbC4gVGhlIHR5cGljYWwgd2F5IHRvIHBlcmZvcm0gdGhlIGhv
c3QgYnVpbGQgdmFyaWFudCwgaXMgdG8gcGFzcwo+ICJBUkNIPSIgaW4gYSBzdWItbWFrZS4gSG93
ZXZlciwgaWYgYSB2YXJpYWJsZSBoYXMgYmVlbiBzZXQgd2l0aCBhCj4gY29tbWFuZCBhcmd1bWVu
dCwgdGhlbiBvcmRpbmFyeSBhc3NpZ25tZW50cyBpbiB0aGUgbWFrZWZpbGUgYXJlCj4gaWdub3Jl
ZC4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW2JwZix2
Ml0gdG9vbHM6IE92ZXJyaWRlIG1ha2VmaWxlIEFSQ0ggdmFyaWFibGUgaWYgZGVmaW5lZCwgYnV0
IGVtcHR5CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYvYy81MzdhMjUyNWVhZjcK
CllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJv
dC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
