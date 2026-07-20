Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FD7C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIyA3iQgVn5Ef1vzaaGTmw2nby+BaHcUPh6mT/aRNP4=; b=m76+PzBXiVMu7D
	hLa52rbZPIvJXIRDdvZ2KerTSPInwHeSca6xrd8nBqMRrOcUZiPjKWFOeN80sv0ABZwrQQWWo5AW/
	njRofrbULrjGDTCQ4g7zUG/nDek3QvyVoSaxZ32rqq1JBqnh5EbaX6cOXF7V7LCuHus/9XYSxhEgo
	8a44MMPGXzaQLjU5+OAqo5t9X627lXXK4bYQq3YVjixACZFbZ13NGdzHOTouTw6L2X3pDZJswrTCK
	+cSaCoJ3ofBoLpgv12ffxFkhVTDYdqwsjjJvRmI6Zj5cWJ4q0FJE09ER40NIvN6T+vSCHk0d3ZT8o
	X6Qbme/NU9nXeCTEw44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliL0-000000063Td-2FXm;
	Mon, 20 Jul 2026 07:22:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKN-000000063E3-1Atv
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:16 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2394891a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532135; x=1785136935; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7rDy2YQnZjC9nWpz521LfOBEMpKeq+JKB5BWp/OjrPo=;
        b=Bkr+3QwU4HpJAA3Yo4FCjLHlldJFtuOwNZ1OfyXxenW0VsqQ9tyo0uVWa+kt4QNUMK
         WWAHxcV6PBuj8sD/QDpK6Cvc/Netpt/zOPUy0SPIGnuEfivTPlrb9iMh2oW43EL6MtG9
         ZN4B7XZIqfgK3I8GGzcK2quHBjWKxldv0fAbbbJkpm2sfvepNuQ0iy1ErVGiFo8GxEA/
         FgcmAiQj73WnqVujSJJqRuxAFHe36I97yQDBHc07+U76A5C7YfKEwRTgU8OufBRZUsls
         ftKsZzPFT++eSPjNTNg8dpqnopDcQnCZNillOONeRQFP8bQkYxwSdgxkd7sQhun+7yQk
         BZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532135; x=1785136935;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rDy2YQnZjC9nWpz521LfOBEMpKeq+JKB5BWp/OjrPo=;
        b=mb1ICyMZZ7k/1o/tBw0P/svF3IzRZ78zhHC8u8CGHE5w3n3s3rv7usUKTPz+UAasOA
         6l2scughLWB0DXl/4t+SUwsHaltu7RTygVN9oKKFXXq8HXA+FDkHcbJdsKZvJlFU/RLs
         oLC+wOTvPsTi4QbplY4k17JWa2Zr0Dz5/bFMm0HUZWDTc91DE4pauZTqgun0vP9Z3hqC
         iswaPte+MtapsAkthV7CzPjTRrP+TQd08EusrNNCVvCIJOwCz5fe/AgZ5+4uJqdrc2Qe
         N4ydELKpGZXsm5UJKtqCc5VbeRWQ3xTQGaoiZRxsszwn/NPwaKdf1QIBmVG7fbY6UWbw
         6hdg==
X-Forwarded-Encrypted: i=1; AHgh+RqUggYVi6vwP74v2k4+pSPzsYLq9N00Y5wr6ynqn0vGCwm+i/XFClxhnoFpMZfRnFgAOvWUfGFUEp204A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE2I8epIy+iOCvbNRhBt6xh/HWQrMyIR+ruRWoRytyXTor7/NK
	SFhzNexRVq2sETPBe9ThAHVV9etKpf1px5kWKYAuGF6dKAyn5JfJ/z5E
X-Gm-Gg: AfdE7cn9wzQ/ykuyDgOD03rapJZVFIMeG+Ycy73nsuAmnxFREUtFZpFrrQvrtDsGumR
	pALF8Mw05NLIxO4LjceC9Ouj9VN55Ix0kzdvPa+VLeaqqYDUGWUPGWGOcuhA0Ete0tF+l/9ZvAJ
	jWcQezinPlXWBVR3qhw9O9BAlsfEJgH85tWR3NVG0SxryC5e81KklYVv20Ks043rFi7K8/pEGWP
	p4GXCg6ZlBkNO2BGvsukEWrBUoDxdhBDjEwtRLs8cSY4CzRbbYjbEOy+ZvYIPktF5RmCIIWv0S6
	IDBuTKjllwKCZIJCpDScjz05cnGdF0PZQ1yNS/silDu90Jb1/CqWTXtD/8JePBrbdq58Wo+Pfp6
	L8YxOymsroDBqOHpPeHfqttfMZ37jkp/mwrsl6zLGNLMBknvntIe7M1jRG4uI0EF0sh75Q4HR1/
	tbrDf/DzX2J2TFf2YKUwHXbhDrMh5uzs5xg3vlgaQ=
X-Received: by 2002:a17:90a:c887:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38e3d26a744mr19412579a91.14.1784532134670;
        Mon, 20 Jul 2026 00:22:14 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:14 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 06/22] RISC-V: Add Smcntrpmf extension parsing
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211935.543975.2748934407130948318.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=570;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=qBhu2iKzjNZfNhl5iANbL2aUfkBruPYxRqMle5qLLTc=;
 b=uKypJmhCBRm/kvczWTSaeADe6ZnWZKogPAT9RNWB2cU/VzqTs+HjCiYkmIUntLvKjnWbFfrXo
 mWWz+WSV1MiBTMwThyOj4KDk1SApmC68RTUbDpPAJQUlRKKfVIsL4JI
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002215_365346_062C7624 
X-CRM114-Status: UNSURE (   7.73  )
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

On Wed, 01 Jul 2026 01:46:54 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Smcntrpmf extension allows M-mode to enable privilege mode filtering
> for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> available in Ssccfg only if Smcntrpmf is present.
> 
> That's why, kernel needs to detect presence of Smcntrpmf extension and
> enable privilege mode filtering for cycle/instret counters.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
