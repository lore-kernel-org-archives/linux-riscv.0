Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BAFC55184
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 00:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+fYDrK9B04x84cGvFSqdGjtLNJgSM2Q16LNjRgQiGE=; b=SjqfrS/8VD97F93qZIzvO2Hh3Q
	vrP0dwESsIiOiC11aMNY4px5Ibp9MJN3FhtSseGppf7mKYiXeDJxqGerWPWpO4NC4NQbaoSislBjt
	Vix7rEa+Zkm5FCZ4T7TMcMzKmoZL3sSGJq9Ci45b+2HLfG4zSM/B3rOi406oBSSMzSm3RwiaNqw6q
	MjVuzLV/Ysk4ZJo9UEkMug83rAa8wVGKDhyT768ZVjTNFS9tR0hHXO64f9E9a/NMDbOjfC6dCqLrd
	ZFDS+rIzkXVVVycWhNlHLTIji3BTV+7uPsGeMPpYMQ0XQlCi2nK/st4fs/AKMXCEww1E4isi6ovTj
	B/H2ijxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPjA-00000002zl8-1SqW;
	Wed, 05 Aug 2026 00:43:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPj8-00000002zkd-3Ll8;
	Wed, 05 Aug 2026 00:43:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1256860052;
	Wed,  5 Aug 2026 00:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325731F000E9;
	Wed,  5 Aug 2026 00:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785890601;
	bh=uj8TaDSojykJzia/9fgCjXBaQcA4KgvarKyhlliDZWk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=eZu88WOuoLZh8JmFXqwBHAwW3qol0PQnQh3Y4uDRoggiJjBExINnfXui6o2OYK2sJ
	 uEnhUKrz5zEbdCbPZgiMCCTypOaUS33nOuJFxw4+nEgraPYhLgcmHnXxvc5+4vbwtg
	 DG89qWxeat3UDSiKYOd0jyfgp0PjWNTe7aNLFvXO1/xPz8M4C55ATB/Cne1O7G8Lka
	 SiYiNjfpNB3GIDKu4JJz6CAgjFBNAcJOMhpPhPM3bHyEmMVKl9JBL54HHZ6QHqrFP3
	 Vi6vn49P2EG9dkw+wmPNpzqG3ZxPvsK458AEZan6VEtNv/6ozkhZ605KDrjMM3ITTX
	 83wF8i/uPKp8w==
Date: Tue, 4 Aug 2026 18:43:17 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 08/22] RISC-V: Add Sscfg extension CSR definition
In-Reply-To: <20260701-counter_delegation-v8-8-7909f863a645@meta.com>
Message-ID: <13bd0f22-cc17-ea60-5081-89d42e80dd5f@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-8-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-941318970-1785890601=:1383527"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-941318970-1785890601=:1383527
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds the scountinhibit CSR definition and S-mode accessible hpmevent
> bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
> counters directly from S-mode without invoking SBI calls to M-mode. It is
> also used to figure out the counters delegated to S-mode by the M-mode as
> well.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks, queued for v7.3 with the typo fixed in the subject line.


- Paul
--8323329-941318970-1785890601=:1383527
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-941318970-1785890601=:1383527--

