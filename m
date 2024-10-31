Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E41FD767E9
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSzxa6ELWczLM1g8o1c4XXlQXXkXm8LIoX88sXsrkXs=; b=Xrb8Y6tD+lP8ns
	7ReGUPZWM0XAELxGv/Yb2NPwP2BBmfF2CtBIfO/849yedx5SI3kg1cV9D0i6B5fRUgNUV52XVcclQ
	lrIrp1LTKesuIOK4Wk7FMDSBJoBEz8F6MXXEgJ1Q4ruU4u59VTq3yDZ1t/khh5huSwjKqv5GPO8vb
	Ai/1Sjj9elcmhw+T3GcxNilKtOu/eNgNTPyknw1BLZEOZ2o1kZSh2GthjRo6JEdnfGOjYl33n9FBP
	FPzVp0OEVkX10N+ahr6DciD4fwJeuC2g1uDyugezlJEcdCz+mWdKk0nr1Gfh8OsXbHWv37je6T9tx
	Vz+/gIa3OWGPx2PTKcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yjk-00000004JPo-3tx7;
	Thu, 31 Oct 2024 17:13:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YiQ-00000004JCA-3RQp
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 17:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DB25A44713;
	Thu, 31 Oct 2024 17:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CBCC4CEC3;
	Thu, 31 Oct 2024 17:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730394729;
	bh=6XG12ERMkjluHM55pynix1a/P08nWWDLaHkkO2E/a4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JYXzwXFtMAOhWtK47qQ6/k29acp0Q5tPe1uZlyNHUyJvg04rZ6wM058RzdNRXJrJ4
	 3LP+Peu2t6aSi7s8XbWPB7SyewWIZPJg4DjR4z10XAUdXq86QxfmkIoMJ+5Ktb8/ux
	 eFTwgaXOKW8XgsEGpyHcpvqenGtfxUH4unRcoureAK4APt+Y4hapxxp1gbR+xE+zSs
	 4/Pw40PFj7gmDVq08pUCpJIVFbznmovIJfe80XO4dYF99h7SA4Ox14UEtjmAiUA1BK
	 mPVm+wcoETa9z4PexMALOlZLTDUMa1LHSFjNJUZkmQjXWzmfeGTyJwggXAfyb8mA1I
	 4HDkRh594kHaQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Cc: =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20241024190353.46737-1-bjorn@kernel.org>
References: <20241024190353.46737-1-bjorn@kernel.org>
Subject: Re: [PATCH] perf, riscv: Wire up perf trace support for RISC-V
Message-Id: <173039472904.1704862.15241557863386801558.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 10:12:09 -0700
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_101210_950474_4532D4BF 
X-CRM114-Status: UNSURE (   5.57  )
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

T24gVGh1LCAyNCBPY3QgMjAyNCAxMjowMzo1MSAtMDcwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToK
Cj4gUklTQy1WIGRvZXMgbm90IGN1cnJlbnRseSBzdXBwb3J0IHBlcmYgdHJhY2UsIHNpbmNlIHRo
ZSBzeXN0ZW0gY2FsbAo+IHRhYmxlIGlzIG5vdCBnZW5lcmF0ZWQuCj4gCj4gUGVyZm9ybSB0aGUg
Y29weS9wYXN0ZSBleGVyY2lzZSwgd2lyaW5nIHVwIFJJU0MtViBzeXN0ZW0gY2FsbCB0YWJsZQo+
IGdlbmVyYXRpb24uCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gcGVyZi10b29scy1uZXh0LCB0
aGFua3MhCgpCZXN0IHJlZ2FyZHMsCk5hbWh5dW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
