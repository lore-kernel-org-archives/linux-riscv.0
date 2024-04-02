Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C049AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgpAxDsu169gPseEBG3bZrW902LEMdPn5l1veEMgFP0=; b=ivGZcL6Y20zX1e
	PqYH103pu72hKd/2luPD5kkjeCn0CWPkcwraFrCiFTkh/4v1KWtefsJ5eOTOlqW8PE1MGQGtXpjZp
	y6uId1ZFlzhnjsSzuHDqPfMWdQk77xj+uEHsK4nP972UR30rL1pyMcMvX9Xw+Ek7ji1Ang/4gHTqq
	I0iZObCghfi7psbhKwa8QLZemznjA6Pj+TGuGxlTv2X8kUacS81zI51xnfAj4QpKesO0T1vRAbfza
	P16LM2EyWcyOg2Yo3am3wTuMzf65vqvNgnwDTc4mosqVcOAMZ7KvU3pYOVOiFMPywZoeo1PwLz1Gs
	vAEKvxZI46fyfid4eKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrc5g-0000000ApDx-133v;
	Tue, 02 Apr 2024 11:14:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrc5e-0000000ApCt-0pXM
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 11:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32958CE1B26;
	Tue,  2 Apr 2024 11:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB6DC433F1;
	Tue,  2 Apr 2024 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712056443;
	bh=yU3K+x6V4mI+yyO9moASq0ZRGkVzd9BUouUOy0FupEg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MRyTGaz6lpX+nputpagH/tmjwEMeTzZCafdimJ5AUMg/jfayewlFDUKRqXoUQ0TNf
	 ZyWpfne0cLPL4VSzCfn935XOlqZR3evboLei5rU1FH52Tuj3ANln68pvR84P/dRFH2
	 Ln2ZYC8mvqCfXIwLpt5uARrWKZ3FSuJQv4cc4IMrLt/DBO2vGLp2gRQlWk2/DJsUjy
	 D+LswAAGDczSFEKWBncXcXvcj2nXVMsMqTxkIO+qpQ2YcauQtz7UNVL8Zdemz8zoPC
	 dhgI9AATdKYm4eLDlXaHlhhuPlGZCUcduuHb04vMrh+N5JsM8aPXKaITqbPD78stLY
	 lPiB28KCav7wQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 4/7] riscv: Simplify text patching loops
In-Reply-To: <20240327160520.791322-5-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
 <20240327160520.791322-5-samuel.holland@sifive.com>
Date: Tue, 02 Apr 2024 13:13:59 +0200
Message-ID: <87h6gkrp8o.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_041406_452835_746E187E 
X-CRM114-Status: UNSURE (   6.04  )
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

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gVGhp
cyByZWR1Y2VzIHRoZSBudW1iZXIgb2YgdmFyaWFibGVzIGFuZCBtYWtlcyB0aGUgY29kZSBlYXNp
ZXIgdG8gcGFyc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjI6Cj4gIC0gRnVydGhlciBz
aW1wbGlmeSBwYXRjaF9pbnNuX3NldCgpL3BhdGNoX2luc25fd3JpdGUoKSBsb29wIGNvbmRpdGlv
bnMKPiAgLSBVc2UgbWluKCkgaW5zdGVhZCBvZiBtaW5fdCgpIHNpbmNlIGJvdGggc2lkZXMgYXJl
IHVuc2lnbmVkIGxvbmcKClRoYW5rcyBmb3IgYWRkcmVzc2luZyB0aGUgY2hhbmdlcyEgTmljZSBj
bGVhbnVwIQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
