Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EA5C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 13:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y95hQNDfMOTZvQI3TnP0IzmhWxXOUX55D/OxvNVaHFY=; b=08apqk+LAKZ60I
	X64KPANI3Ut2yPMHK+SrwRKqm0/Nm97Rm8TB6WJvmqU1j8beE3HAIWAkAerRctg75SyO1lFM8QqZ1
	RwhL3ihoP1mzuYwuwQIlmg0EVB7vejnPn5csXKH0D4jGMisbWGPUTrDOVkA9Dwib1Sks6zBPY6vcl
	fV8xuPIu2L/HltZSTJUzkEaCG/insn63vLkLuIp9/iSpD/GlpMX5gCrhzDp862KAYkkknpKaxLo8/
	OHb+jYG1Q/Y7rG527b7IWMI/O0RThsv39wOVTA75SzDt54fNDhpK8bEtcjHdItBZq05GrFxAFMTaS
	f9VVmyps4sFU0ePevT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Me-0000000AYVT-3GsE;
	Mon, 19 Feb 2024 13:07:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3MY-0000000AYRT-1Lb9
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 13:07:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3822A60D45;
	Mon, 19 Feb 2024 13:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865D4C433F1;
	Mon, 19 Feb 2024 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708348032;
	bh=tP365zsU1kYrOfI9ft84/uMyXJKlWnv2A2UGYeSOJkE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WVDkV4M2vZwKC4EBVBgVUaHBe902q5NfdDVcoxBZdO96/lwSg2e17CQFklrVBHfj4
	 5JKW/IMlDqNuXSrwnI2rwjRGovTwlvUPo2Xs3wTZAP2vyCVFragNlOATZQ/Ec8mAr9
	 3QWhBZkGmIw5NXX8ZEm74z13V8rY1XO3v5mY6efQKlMjTBYG/qvr7eaFzKNEg+UPr5
	 s4hxKcxosy8GRbfaxyBqvlJeJlkLTune00A/+nFuTm3bkzhcVnZ5acvOMtEJlGoqAh
	 4n32Khwvd+xufvAHUQCwdHr4etPFf3ovT160bxnXUmxlbwiRkIX6vRNNRHa15fUcg3
	 8M5VvAsXYl0VQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 6/7] riscv: Use offset_in_page() in text patching functions
In-Reply-To: <20240212025529.1971876-7-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-7-samuel.holland@sifive.com>
Date: Mon, 19 Feb 2024 14:07:09 +0100
Message-ID: <87ttm4eh6q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_050714_513404_87BBDF04 
X-CRM114-Status: UNSURE (   4.36  )
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
cyBpcyBhIGJpdCBlYXNpZXIgdG8gcGFyc2UgdGhhbiB0aGUgZXF1aXZhbGVudCBiaXQgbWFuaXB1
bGF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5k
QHNpZml2ZS5jb20+CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
