Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6222BC44524
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvOcCTEnNpAByqCFir6E2oUp8WMc2fYoF3iPLCvZchA=; b=UQwsHq6ssuBrHe
	VaZbr/5WGZjdgpe0x2qK2LCRKQn3tCMPRskaFJNLGGieuG5txK4lMw8kVyZtecKTcU6TSj1xQQpZu
	YFMFUW4YUExChKcA1VXKoANk8gQBqGkq78v02sqlYzeFUTXjU754zUEUz300LOlNX7S45D3RLKkqb
	a++QF0QzVYi0OJo27womU+9Eq7rA+XO8Ycj2KOnz6HuvslZSaAFvKSBz/T2fjjq0vbdguGwIJOj66
	+S6WJBlXpK3/zgDop+ErTvFihdfvtmA9Qp/Yv1/2DOgIINmoS0FKwl5vfqUtEKXhC9XkCl+W2Mcm+
	uo+t+J8Ma1JoECoQO5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliMf-000000064bE-41FI;
	Mon, 20 Jul 2026 07:24:38 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKT-000000063Fp-1h1a
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso7438417a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532141; x=1785136941; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFLZdi7jBgOetxqkL5F8Xn6PniUl5aE+NCedsWROBE0=;
        b=fhyxD343C08mn7EgSf/DUyYvI89fITuDooZmRWu/j0GHJU1pfCmzBKRuav9VhveOyc
         sBW3Q2BFFcfZ7hAhDBgRszBuaaG8YzkwKZ8YbtX4UaDplF/nXZ1XqRcKCI37BOZHa0PL
         rTZ5mRhEl8K2FyIrPTnmltrNZ8MYfDEnv2cct0w4vSOL3mhCVf4Lb4J2DCzpJgwZ3al6
         gFXe9LNLK27xEKTDzWF0ZnmNt5WfPIyiR1mv4+b2xjVX76RBlOsHWZ4sF+p35LwoGusx
         9Qbviy660BYmcZ6EvZSA1QJGGm+sTgdiowlJACEV4joSnmSBu1rwVjPgcU9qTlY+RolZ
         lipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532141; x=1785136941;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFLZdi7jBgOetxqkL5F8Xn6PniUl5aE+NCedsWROBE0=;
        b=KIFhEpxRo7cwjcbXk+/tIdjveDhu1yZ39WaO1z7hkEMcIGsgGvk7i6vP76yx6SRVXM
         44UP8+ufYkvbUISe0OHqx6FuctKFcrMTTtiXf5WodvPrpfo7sS9IAiEFVFkLyS71UpVe
         cnkqlwaZZ61aZRmv/pwhC3dGazrJSw4JUXkrf64meR6alZsMcaAr96pRU3vftoSZz4Gi
         FfODwr4A3/69W0Alb7Hr+RFH0BFEycGwVlNutnOzarQwTtgUs8cfEzx+AwH8txq72ptf
         Kc9l76QGm3ka8zbZnxOZpiY3ltALuoCKWC+4J2C0/FJgUxvZ1vFi35fpJAHczy67LtCU
         2+ig==
X-Forwarded-Encrypted: i=1; AHgh+RrLWgc69eQEfdrnmCXWYxeghrG/dM5HeOp3DqSP3A1mpXaSHw79le3shtQjKdE+DA38nNnMSGv8zv+gLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwREDc8k/4J7cwBPQrW68HjKBXI/vezVi5EPy96RSIgKnVfDRu9
	MJhnMTp7s7t0LQ3iBIWB0/NOAs1EqwJL4EmYEIuJ7bFLFEanlzUje7b5
X-Gm-Gg: AR+sD12Ft57YJnknK7wWqg+A6I3mzL48/lXoLvGJPzG1gqMwbpVRuxYPemmIj20qzsh
	u2n5Qbjg46uih+bLTFexNSS/QXw+ddMdIUQuFq2HvIBsMfaWXPkMwV4kq5oa+8YC4FrZG8QeElm
	R7Kp4c/JxIxAbIiU22EkAVM//NBGelWYmFOGSE77dKXPQSkP4w8nQvsExUEwdDj0cb7y0nLRG1X
	2mmhrxgUSJWFKxSOYOLpxLeoFWRwCkwo+SmdAHPKsLe2cQ2PlF4/xnkj7iSwOkkEK3eUgxRQjkg
	YcZ1gdTwyr/pYrc0rk+gGYUOHf3JCPeWoYAxTC2tYTKEa8xTlw3nHuC8CrUtXu7McA9nm2D5hfB
	02/f5S5qYLztTYe6Dw40aLhfTzVHaE76OE3drXNGIuDRrrx5+pwaE4NT3gU1lxkL7qfUHoZdzbA
	exDFYNgZGb7r6kf4QBXW6eX0hN86vq
X-Received: by 2002:a17:90b:224e:b0:38e:7f52:c8c1 with SMTP id 98e67ed59e1d1-38e7f52c9e2mr3426881a91.28.1784532140841;
        Mon, 20 Jul 2026 00:22:20 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:20 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery
 mechanism
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
In-Reply-To: <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211938.543975.7016109597042850635.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=1181;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=SBkUBV3inMBinSlE2EXReUKlgUw2jSOCC8j8xgqt8Ys=;
 b=kTziE623vXoAa+JDEunw6f10OBNK2smh4OC+4caPgYt5rsl1d/L9P/MzNiS/0bUGjTtCy0tKZ
 nYPopmmArSXADJnnKy4KEiAAwcwHjgpz6bWgMPJYTo3ZdyCSTOe1n8J
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002221_608656_80D22DAB 
X-CRM114-Status: GOOD (  13.71  )
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

On Wed, 01 Jul 2026 01:47:00 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 74d934238821..c20f1e33c65d 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
> [ ... skip 15 lines ... ]
> +	 * in S-mode via Supervisor Counter delegation.
> +	 */
> +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> +	    riscv_isa_extension_available(NULL, SSCSRIND))
> +		static_branch_enable(&riscv_pmu_cdeleg_available);

This needs to not only check that smcdeleg is supported in linux, but
also that it is supported in the SBI implementation correct? Trying to
boot this on OpenSBI before 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and
smcdeleg") will fail on an illegal instruction in
rvpmu_deleg_find_ctrs() while trying to access the scountinhibit csr in
the patch "RISC-V: perf: Implement supervisor counter delegation
support". The proper mstateen bits need to be set for this to work
without crashing.

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
