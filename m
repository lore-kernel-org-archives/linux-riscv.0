Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7451EC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 01:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGKTtKP2OHyc6V6H+BZoOGadZYSKksTng5mu3wcVPDM=; b=j8wMr+ag15L/Ju
	wRbukePwXViz+wt1ujiAnZvT4opceeK7siLTMz35pUrMmXZTJcv+zCog8TIlW3qlKLqxKQ8NgL65J
	b8UebnhH1PtDcwUB5aHEYn+mZTQTLFRQUAJAATLWl08CP4yc7ionzxdY7NnKc2VBK/VwX87zd3Rdn
	R9aE9w6XiEjkYjQ9S840I3RHq35wClotv8p6fWeV+l4hKs7AIfUsi0BkGtP+pyZhiM4Efylh/ILii
	pDw5erGvJ8jHpQO/G20HuV6w7dHna0X3AauiwHobEejgieD6cJOIftuV/8Cig1oJVN0Z77YWOlhcB
	jYYPk+38lysqJ3CFzLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZvx-00GIOw-AA; Thu, 05 Jan 2023 23:46:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZDf-00Fsw4-Lo
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 23:00:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 91E80B81B07;
	Thu,  5 Jan 2023 23:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B454C433EF;
	Thu,  5 Jan 2023 23:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672959616;
	bh=BGCX8lkKaNvfirMazSGGcGK0Qxa9sByloCjt7nCQRoU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UQ3+MksAZC20zTZVswmy3PregvLQZdaeYZs8A5z3DKvw6Ze/WJd6yhQkdL8UL5h17
	 FDeL/IU59lLMN1VNZD/wZ5JsUzceszNW2zQnSMtyYQsTisxyP1rFwlS1p+R8k+lUfW
	 lvuc/peDABG/kaNGeQ563UP7tGkYsRUcl16XFaUen5w5qUrLGGJzKMrOXs3otODo3Q
	 SPw721PUS9Rx/EqmZzWKTzXtr2wyRL3+VWtQfnKhfNBGl0wd4Toss8GakYwBxd0xrp
	 rJ3j4dEJ09WTRAzvmMyWAPuPEdCsIbDET27C2OW2SMdcOb60p8u0zegR9k9986ol4B
	 SMMdTWvBOGYEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23419E5724A;
	Thu,  5 Jan 2023 23:00:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, kprobes: Stricter c.jr/c.jalr decoding
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167295961613.27641.13795817742406776564.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jan 2023 23:00:16 +0000
References: <20230102160748.1307289-1-bjorn@kernel.org>
In-Reply-To: <20230102160748.1307289-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_150019_965887_B76ACC46 
X-CRM114-Status: UNSURE (   9.13  )
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
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIE1vbiwgIDIgSmFu
IDIwMjMgMTc6MDc6NDggKzAxMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBJbiB0aGUgY29tcHJlc3NlZCBpbnN0cnVjdGlvbiBleHRl
bnNpb24sIGMuanIsIGMuamFsciwgYy5tdiwgYW5kIGMuYWRkCj4gaXMgZW5jb2RlZCB0aGUgZm9s
bG93aW5nIHdheSAoZWFjaCBpbnN0cnVjdGlvbiBpcyAxNmIpOgo+IAo+IC0tLSstKy0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tKy0tCj4gMTAwIDAgcnMxWzQ6MF0hPTAgICAgICAgMDAwMDAgMTAgOiBj
LmpyCj4gMTAwIDEgcnMxWzQ6MF0hPTAgICAgICAgMDAwMDAgMTAgOiBjLmphbHIKPiAxMDAgMCAg
cmRbNDowXSE9MCByczJbNDowXSE9MCAxMCA6IGMubXYKPiAxMDAgMSAgcmRbNDowXSE9MCByczJb
NDowXSE9MCAxMCA6IGMuYWRkCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBs
aW5rczoKICAtIHJpc2N2LCBrcHJvYmVzOiBTdHJpY3RlciBjLmpyL2MuamFsciBkZWNvZGluZwog
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2IyZDQ3M2E2MDE5ZQoKWW91IGFyZSBh
d2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczov
L2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
