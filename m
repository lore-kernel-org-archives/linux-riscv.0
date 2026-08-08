Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FE3C5AD2B
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 01:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2uTLnQltJ5deq3J1xgB9dcrcBhkbsS/S+nqQ0Ovd10=; b=vajWuEKNp0CCte
	devYIWZLxL5nchp/q1yucnEUynHju6DxTDjG0YM9ZKkH4EDX6xHOSgxVtCH97yi4Cjm0uJmRtzpej
	HdP+r29Ojrack6vhmZG+xc6zKJFyIu4IB+UJQzj7E6L6dO0WD3QJAmvFp6i0w0Zx8k72iZZAl+UE0
	yFRRAxA0WUQURaUWHS3wg08mztj1VVBZ6Oh98dDU2mlsEkpP2q4IhP1YG+P+WOUKpJ4x2wAAcHqlE
	QoicC58KX6p1jRBMpcMdkoG8820sSuRRuRCFuDNr4Vj2+RUIfkOGjErvu10Wo9+U+HAENxBtcr2Sx
	DF2IFmU2VfvwhVkoR9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsVUh-00000008wd5-0IMn;
	Sat, 08 Aug 2026 01:04:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsVUf-00000008wco-17nS;
	Sat, 08 Aug 2026 01:04:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A197241724;
	Sat,  8 Aug 2026 01:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E48C1F00A3A;
	Sat,  8 Aug 2026 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786151096;
	bh=GX7pXQdT14LYtoMBr1s9RIagYYeZR/7kvlKmfvzQVXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=bXYk6G3qZS6acVvu65NAnUAUrvGYgGDHTSwI0ovdC3DGP4CbnUi1pTkYGyL3OTwxx
	 2f3uGai7tOIyqH0Ge+u7n4xx0lP2B92dbkiewbEgP0iavldgBR1eX7DKSuykWMuHj/
	 STu5fh9hBeO3H+DnqLQyFMS48PaXhxf2L8ifxPaLoH6F4WqWLiBsC2dLmYC8qDVT51
	 Mu4038P3fs1RpA2Xh1C/L4WU+EDgX8+cN8B8cQmggccWbolTPyvJk57Qda/l1dDZ+Z
	 27KSEnqCGNvHlxTEBG8+RdiEa+zqKTD6yqumSjffCSa64KDHp0IZp3XtI+sXNivZDW
	 brNkDyM43SEvg==
Date: Fri, 7 Aug 2026 19:04:54 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
In-Reply-To: <920aee80-5297-4d70-a1ea-616976db7f70@linux.dev>
Message-ID: <09a1260b-aa91-f993-e81e-0c636cfd7942@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-5-7909f863a645@meta.com> <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org> <920aee80-5297-4d70-a1ea-616976db7f70@linux.dev>
MIME-Version: 1.0
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

On Wed, 5 Aug 2026, Atish Patra wrote:

> On 8/4/26 5:39 PM, Paul Walmsley wrote:
> > On Wed, 1 Jul 2026, Atish Patra wrote:
> > 
> > > From: Atish Patra <atishp@rivosinc.com>
> > > 
> > > The indirect CSR requires multiple instructions to read/write CSR.
> > > Add a few helper functions for ease of usage.
> > > 
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > 
> > Thanks.  These macros seem better implemented as static inline functions.
> > That also nicely aligns the code with what you write in the patch
> > description.
> 
> I don't think inlining these macros in the following way will work because of
> the following reason. It won't build once anything calls it.
> 
> csr_read()/csr_write() stringify the CSR argument straight into the inline asm
> template:

Yes, you're right; I should have caught that.  Too bad, there are multiple 
keyhole CSR index registers in use, otherwise it would have been a 
reasonable thing to do.

What's up with the subsequent followup message?  Looks like a 
cut-and-paste from an LLM.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
