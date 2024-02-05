Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BC6C4828D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0XkCdJ/6nCNrv+OqMxAbfmBbddLxiqNFqx+/nUSPm0=; b=oHUtmRgLxbgsLR
	aB5Y216DG6wrZ66b79EJQk6pLjOi1IzjGN0WIUuJ01M95w3UoTY+g2rJ+UwZd5XONseaCg7upaaBV
	eNHZeviZyUNcShvVPw4pT0Gsh1VpqsHFgjw56qnpg5CQA7IOftMCQ13SCTjTuW3Rv1+mmI/kAQShy
	Mo7ew551IND74NXReP6PT2cmiIZQBhDIcOIOnQnFeamqJoh+6ipnqYCIqsBrlb5qK0SEdEzMpYBR0
	tzBgeIFIqlpZIAWnKoepUMZEb53pUmqmcrH0Pvsd2b2kEvUhkmAiZ2SMwB6iIJXMwp2yDvaTorpMk
	gS1LN6/XlT6tY/AxT/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxMZ-000000031jW-1bQH;
	Mon, 05 Feb 2024 11:42:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxMW-000000031iB-3xDh
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 11:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FFBACE0E11;
	Mon,  5 Feb 2024 11:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9F4C433C7;
	Mon,  5 Feb 2024 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707133323;
	bh=mCWvEFnSCi2HdGggqDit3vI/8lP5Dx3NTbHsew0yjPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sOCUSp8VQUqg/ThvYrkaZt45+tGXrbrevpaHUcjx3Efjwb0NaoKZUZuJG4BA/HONs
	 GWXRMD2kPzGQh0RvVJPVIgclzPAPc0wMcGnBkVdoJLSZfrpDUi3i4z0zV/jQuHQp19
	 2ZwQOfgwSGaJW1cUnsBPtXGs5VwIor/S82MEwcXPU8CaYwx7pnZ7DJDvlpOppthSVy
	 gXpGE1uMjS5LS0706UjHS40rQxfeM1iBQupXj8EZarpXSYIF4m+cUmlvg3IhmpaqKt
	 L63esQJ8nSMtprkPxjpyR7zK2ssDyAK424dEmt4ykMEv4UGu0RqJVcy3xX6iwda/R6
	 nM0Q9bJ1ggTqQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel
 <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra
 <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: Don't use IPIs in flush_icache_all() when
 patching text
In-Reply-To: <87wmrj9m0b.fsf@all.your.base.are.belong.to.us>
References: <20240205042955.833752-1-apatel@ventanamicro.com>
 <d5e21238-89f4-444e-9c35-f4a28e01052e@ghiti.fr>
 <CAK9=C2XEmFBDB6R5f+L9++7ojhWb8rJK-e-vgFrDmsi2=DMOBw@mail.gmail.com>
 <87y1bzch0u.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2U9K+u2r8xNcguqpROKeDhKSBoQCrDW1Y_Qa_MU-SBqnw@mail.gmail.com>
 <87wmrj9m0b.fsf@all.your.base.are.belong.to.us>
Date: Mon, 05 Feb 2024 12:42:01 +0100
Message-ID: <87sf279lyu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_034209_176869_93CDF572 
X-CRM114-Status: UNSURE (   3.15  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBZdXAgKGFuZCB0aGFu
a3MgZm9yIHdvcmtpbmcgb24gaXQgQlRXISkuIEhtbSwgbWFraW5nIGl0IHBvc3NpYmxlIGZvcgo+
IENoYXJsaWUncyB3b3JrIFsxXSB0byBhdHRhY2ggdG8gY3B1X3N0b3BwZXI/IEJ1dCBtYXliZSB0
aGF0J3MgbW9yZQo+IHdvcmsuLi4KClRyaWdnZXIgZmluZ2VyLi4uCgpbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDAxMjQtZmVuY2VpLXYxMC0xLWEyNTk3MWY0MzAx
ZEByaXZvc2luYy5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
