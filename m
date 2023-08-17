Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82BCEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfYE8hE4ZKZVZtrbvZ+eAQCz3dSvTEhSe8Lnmgn/UDA=; b=c1N17ClXlCKjJf
	GeZ4FZAgq2PZlLTwdzmuciRb5Fj44vPg2d3HcQi+3TDuYUT/lOnh0Z3v+p/KGIvGXRFAYULf79Qbr
	2G8Hb5l/maqiLTH/fj0kI0iUPrJoEcEBw97Wqh5il748vltUkEj9xD2n7HssWUMSGas9J9y9wS7Bq
	oe02X1g51wrdeBCdKmp3GV190QNa0jVs4Mjjn8n0RzOOjjDTMVq6HnMrTrcYAa0hsHGTjb/wZlNv1
	cGCFJluxxHbVmiCvmRqvqZRSe6mvDaZZZMSUzU2uNtaZctyEcsNDlB3Nsr++vJ52qlXWvxXeFx9Xx
	cyCMjrBoiJVPEg1tbqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZEe-005vj2-1Y;
	Thu, 17 Aug 2023 09:24:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZEb-005vht-12
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 09:24:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bdc19b782aso38627005ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692264242; x=1692869042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KPbt6Jr4uE4XqkroaxTN40QvL9ZRwcamAUU0Alom8Ec=;
        b=rI6iWAqTfcbFXuRszbw0kH7S7Efm8TDPPaTRvQfqQAODkeiPGEer1xsAgnG42yVQr9
         L3URCg142nt5JV7OT34bh5MdV49Y/N9+vDCDkRWeow95/CTCqjeWhbS+mjW1SKxpI+D9
         J9WzjfnihA0HQ3OQ22c1eO5ymIPPiWyFE5N0svVLR+mDVK7ijU0cJsuqAty+bKyRlhSv
         iDYIQEtErdogHHIlKmTtsWRXCgeDabvOQyFBJjASvlFsk/Z9c3v+5wNsoGVLF9E3UmxC
         iHBnf1Bbvrssr9ej6ikHkdY6q0moHRV3UoyFuEbAsd0tnfbURsGaT6Ui11pgMfahVMUN
         f6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692264242; x=1692869042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPbt6Jr4uE4XqkroaxTN40QvL9ZRwcamAUU0Alom8Ec=;
        b=liYtifvKlJ3IXlKm0qrFTzumoe57HFSuTkOGs89ybq39xQblRsZfBqhlg/6wKjq8Su
         H0L6Tgb1wX+JLB5vUFmhRt1aWGT8KPcSjw5SGvkkBkpFNVbiNJLzSPbePXAdjgNkoYfx
         eDMOATJGUs/Hp7V4TaqQRi3AuiTA/rvbQ+mDfN70QO66BdlVXPqHhRTgDgY82Uii4F0O
         FbAmL2H6fdXj1ox8qw+hjLDLVLXWiQhMAoR+D49jGO8WTNkhAXiZ6ksznN1DcZ+HOSQ8
         FTk53iseEYKQ3niNCfSZVeyUDaSY8g+WkGrizBD6fkceyK9Ar8qHgHxSuwLbr6n8tMKC
         18Ug==
X-Gm-Message-State: AOJu0YwST8oDxHjFucIgy3causXpCLIu5yhB4pKHNn5Egf81nFKesACh
	eKK1juu6guReEGKXzfhSQwRL+Q==
X-Google-Smtp-Source: AGHT+IFk70YzOl9gPu9ed6IJstA4fhK4tebZKjgbqrU2bEbbFU9mBw3Ch4/wFSeVGfyDH7rTfUpgxw==
X-Received: by 2002:a17:902:bd89:b0:1b8:95a1:847c with SMTP id q9-20020a170902bd8900b001b895a1847cmr3827038pls.40.1692264242560;
        Thu, 17 Aug 2023 02:24:02 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-204.hinet-ip.hinet.net. [211.75.219.204])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709027c9600b001b8a85489a3sm14600942pll.262.2023.08.17.02.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 02:24:02 -0700 (PDT)
Date: Thu, 17 Aug 2023 17:23:53 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf parse-regs: Refactor architecture functions
Message-ID: <20230817092353.GB176609@leoy-huanghe.lan>
References: <20230606014559.21783-1-leo.yan@linaro.org>
 <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
 <ZNvCxM/ULdUfzHtR@kernel.org>
 <ZNvHx+KxIL6JzEl/@kernel.org>
 <ZNvJdsVmmAWLmfH6@kernel.org>
 <ZNvKjeFkXY8ezf9e@kernel.org>
 <20230816020715.GA135657@leoy-huanghe.lan>
 <ZNy3D6DV3Q9YjxKd@kernel.org>
 <ZNy3jg7xxBp4161E@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNy3jg7xxBp4161E@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_022405_412029_72025252 
X-CRM114-Status: GOOD (  15.35  )
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

On Wed, Aug 16, 2023 at 08:48:30AM -0300, Arnaldo Carvalho de Melo wrote:

[...]

> > And move that to perf-tools-next, we can go on from there.
> > 
> > The above is because we don't define CONFIG_PERF_REGS for these
> > architectures and thus that variable ends up not being used, so I'm
> > fixing up like below, in the cset where you made DWARF_MINIMAL_REGS
> > receive the arch parameter.
> 
> I added this to the cset commit message:
> 
> Committer notes:
> 
> Make DWARF_MINIMAL_REGS() an inline function, so that we can use the
> __maybe_unused attribute for the 'arch' parameter, as this will avoid a
> build failure when that variable is unused in the callers. That happens
> when building on unsupported architectures, the ones without
> HAVE_PERF_REGS_SUPPORT defined.

Looks good to me, thanks for fixing.

Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
