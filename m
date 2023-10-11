Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C656CD6E60
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Dsd3W1IgirvGwu8+g0mDaKZ0uMgYQtSNHUrZ3EKtxc=; b=D1zcg4RjgF7BPD
	/GXLj1YV3ZDyTwoNKMwGxobxhNh0DWqk0q2Q1RQTrmbgpjA/Gp2F8+J3b+sr4zzKPB8kPbdNAryy5
	Jt6FoBsBH7c7YBsf1LIpCiEYS5DFuls/K2d5O6FXN9cPXkbW6jyqwvGsJ0FlTazAGmN2KksjpuZR9
	W9ee8cj9ja4FcPmbv93bJ89jJksGOPp4lQXQDx13137gGyzEOqVn27L82nyA7oiLjhK+K25em/Rwg
	obu2aFmliNMOnAjS181fWY/aIXM6bYWYU60UOAq/xh8Xt2HMMYr6dlGPr5VCvmAEf/nh2mViiUqGN
	Vq730SsJBpwLqd6hFwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXqj-00FnNT-2H;
	Wed, 11 Oct 2023 11:58:01 +0000
Received: from cpanel10.indieserve.net ([199.212.143.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXqg-00FnJi-04
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7HThHjVRjaAH3M5PNDjGoOnPbrAsZmPdBw6j8Z6DAOg=; b=vH+QURGhl7qJKCl73dZvEEy4e2
	BtbnXKO+Nf9Rl5Xo1hDz+AioHNOCTqN1aTamuPjvNfBWJR2N059mEiy92xojopCqJvsRrzZKHJWWT
	5r13HuKWgnmEBBO4meqTlArPTAE95YPB6GvXed7NNcK3+zEuCVs0yHpmEB96mChdVpz1DBelnMM+y
	UDuWC9+ja1UHLwu01OrB2Vmicgi3KtEXTg1rc9fjoFFUWwHWD85aDHNUS2KudOa08RtHYwDgWtn1b
	2/FBs5Ch/+nau2me+4sqcIih2qPGYEbXG5mvrIOQXVZXDM0yGCOmLfutY7E+xJtHj+dAp8A5tfLvF
	DuDT7vhQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53422 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqXXS-006uiT-2a;
	Wed, 11 Oct 2023 07:38:08 -0400
Date: Wed, 11 Oct 2023 07:37:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
    Palmer Dabbelt <palmer@rivosinc.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, 
    Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>, 
    Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 01/13] riscv: fatorize hwprobe ISA extension
 reporting
In-Reply-To: <20231011111438.909552-2-cleger@rivosinc.com>
Message-ID: <548c87a3-d1a7-a6ba-64e6-ddde97da2ae4@crashcourse.ca>
References: <20231011111438.909552-1-cleger@rivosinc.com> <20231011111438.909552-2-cleger@rivosinc.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_045758_154982_7891300B 
X-CRM114-Status: UNSURE (   0.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


  correct misspelling of "fatorize" in subject line

rday

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
