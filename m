Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD1060A2622
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 02:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPJKvXL0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJpLugyq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=65IISRJ/fO39yCHoawhcNMrnukOGo7btId2FVXkosDk=; b=kPJKvXL08Cb7nAas3cxEE2synH
	Hmb4OmegfV+gE39i6OGwtZiJqzvTd/o3Mc0pb/oDoCdE/y8CrBEPUi5JuugB8dfC0vPIlpcoymE4+
	7Z9e8ftrKSILfqfOXVvjmIptkS0DATWDTgUzNalluMXlj8urS22MvjxzhNYRzwgm4tq8SLgi3kFz2
	28jl+VoLsIuOuGyhD+cKJGC5neboRjMmwLMMPOFYIMDOUm+Wga5b79Mo4gwHxkKMyuW0IFX0KdYOa
	QqnKobMYXacRZnplktumTEH4gElD4Mg1cOq3DrVd/ilFN7j9VLEgDGGhOUymgTKRg7YO7jW3fQe1U
	/Hgc+l7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbyD-00000002Ctb-0Va4;
	Tue, 10 Nov 2026 02:52:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbyB-00000002CtT-3HRE
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 02:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C9463511;
	Tue, 10 Nov 2026 02:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAF21F008A5;
	Tue, 10 Nov 2026 02:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279142;
	bh=/BigNl2VaL7rLRFpYi5hoO1tJBWhV6OR4KSa4Cct7es=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TJpLugyqYyxeMgKLUGB+H96hePV0GSh/2Rbr1BFcoWE5f3cWlnQ6LSUxvXsVQg8Qr
	 8ZResATyzXsxTssItZD/nyaJcSp8lWwF1xjaFsEDZOwPwa2yRSp7E7txAa6RRJT7kW
	 Pnl0oFCiMy083W2Byvp/CZbjAkcLnwvPuZCHwOKWiu9rVKS/7Tj3DulPWMH7e09tKa
	 hAh5A6dkJO4t0wDM+6Jq5v6SM4UikmO8blGVDozrImcts3gPQQItExgtuWNhRe3GuE
	 MV0bEXYQLx44Eld4mqeFa6s6SCeW0pA4GjT0HdhWg8GtUMS+adutZWq0bfDq+ADlnf
	 zaf8GIrM0Ae/g==
From: Namhyung Kim <namhyung@kernel.org>
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
 Chen Pei <cp0613@linux.alibaba.com>
In-Reply-To: <20261105-csky_c930_pmu-v3-1-3f33e6b3d259@kernel.org>
References: <20261105-csky_c930_pmu-v3-1-3f33e6b3d259@kernel.org>
Subject: Re: [PATCH v3] perf vendor events riscv: Add C-SKY C930 JSON file
Message-Id: <179427914192.13444.10026998542210349507.b4-ty@kernel.org>
Date: Mon, 09 Nov 2026 18:52:21 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 06:31:20 +0000, GUO Ren (XuanTie) wrote:

> Add PMU event descriptions for the C-SKY C930 core so perf can list and
> select its hardware events by name instead of requiring raw event codes.
> The events cover core counters, branch prediction, instruction fetch,
> integer execution, load/store operations, vector and floating-point
> execution, caches and TLBs.
> 
> Add a mapfile.csv entry matching mvendorid 0x5b7 and marchid
> 0x8000000009201600, allowing any mimpid, to select the C930 event table.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
