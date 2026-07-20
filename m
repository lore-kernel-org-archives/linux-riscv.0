Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258A5C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwb81g+Ss+JTkKJ3BA18xJAu/adnKRz41yygGHs+uts=; b=YLkMgwEcloc06d
	cKay1PqeJt3+HWfmXsSaQAoojrFHzh0aJ8bEVXH+eYBVCOMO+rfRCOcadvNB1XGXSyMtyDEAPTIK6
	LrvinqavZIm4eIWjWVoqDkm6aaybolxBlYKxjA0R1mwM/JxAzJJGuqIZEeFcaymSGEZvVYnZzJpr2
	8xuQbhMI/aljTm7gJyJdIIs8ER3BZ6GjsuJ3PdMdAgfH42bFJQwC0rGFc6PI9G8WaGkH2WhdTb1GU
	NBmdFaW8775M0Ak/ChDu8vtsDf2cZH+fKMIVmX+5RhN5Gr0NgTdWOiDh9zzSZx2mSm5hhgXkeDGUe
	+OAvO359rB3qG1HOvGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKe-000000063Ld-3sbT;
	Mon, 20 Jul 2026 07:22:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKH-000000063Ay-1U6r
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3811f512167so9664930a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532128; x=1785136928; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hoe1W98CSBa+YkLX38wWaTngexSk74Jy9AAITrPfnPk=;
        b=b0bOIroB81Hial9riGHEXlwMr3Q4SuSjhaQMfNv3cu2DprAv803uQ700W3k1Oip53E
         wBpW3GFU5ocoEL56x4PA3em43ruJmz/UFnw6lNDc3bMmQi/7HLyBwmUT+nv8owqt4n5j
         aopTmVxo8PnMtS1wajtYqdGc71xpdoWSbhikidu/3AS7k5IcMp9YvqOCBUveeAGRjEA4
         pf6NSazjoR3kjGGM0JFu1vFulYihku4RrY8YNVIsZX8wM4LcZhm1KqqrI4KFkMTxqhvV
         7HRIiglxurPpuU5Y/Zp+XIvSyIn/dnUayjB0MeBO7yHC9taFmYlAwCfJhjsAMHRYDMsi
         NA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532128; x=1785136928;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoe1W98CSBa+YkLX38wWaTngexSk74Jy9AAITrPfnPk=;
        b=lso0qQqIa4rv5TwoRNyU5xcc3i3IY9yiRDsTEj+9IkQEtk5JSxqdsi2EC31b4isG2V
         v9nhemWRRxl6B/8acqSi9dCvpB6yI3yfnM1BZuOrnTEnYjB0WrA4+E0e8+oBB5RfMqRm
         0c29VfEq7ExrqfU7RHmtIlH9eRF6B8x5geQtehcHOUNpGq+KyY/IGm1Ye1tEQvNr5RIj
         fIyeQhC3EVpIFxQPZz6cfH3ZMA0MrKEIqHMu7QLRz+Vvh2MD1EzYceVDWddqZU78tmXo
         ap/dU8PblqmZEnzSiVUT6f72yN2G/ExcPsrVikPUj5HtvUYRwNgiFoVALMVOrOvu4yVe
         hA8w==
X-Forwarded-Encrypted: i=1; AHgh+RprYNgn2naC97VK+vyWlqOI4BbEI0ITukBYgqhKdCq2URRlCaE136vnfwzIacO87rb/4ulL4kR1PzU4xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZCEBk7yfw/8kmgD+zdUySwKp/EaPe8CaCULjaH4u9RFdZIka1
	+OQ1iCE5iMlQV96wnnusZkDLrylNsJzyDQIglpR25mnh1MOXbWNVfdD0
X-Gm-Gg: AfdE7clKsISZeBeK9O9S60TbwIQB6mfpB3Q2nkzi6x4pkgz4s9QiEc3/hXoy4OAozg9
	PRGOPpVJMevY/LHI0ToK1/rmXGgHbNkYE779bLsc6nFuZQQKW83Ye6eLyUz8AYSGgSY/Drbl15d
	aiT2ZwSCEENbTRB7RGNEcfOepPGchX+zUYn8nRf23tyEC4JMMguS+LWOBM+t5kE6gw206obOYrD
	hyhRSIi9NzjXsWkBnDlt3AdKSqMi6SyVeeHn7SmXUfw+laYpBvYy2zGdHz3kA0kh6A8ICf4WwX1
	cXeixfDGBjUVlDrhdfzJGlZ+M1htfPQJMW9dZGceCbseKZ/6qsrGB+819NX8YMtAF1b3Zr4wiiD
	PnL0ivxltkVnpzpSMkAmIZz+rwRCTaxnXS4ZurkJradiXcEy22H75tg9cAARQCpfkZNZLQyqjsS
	1VhJzLQwxtL93RXbAFvhtSUkssz/S2
X-Received: by 2002:a17:90b:2dc1:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38e4b3e11a5mr12667239a91.7.1784532128413;
        Mon, 20 Jul 2026 00:22:08 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:07 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 02/22] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
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
In-Reply-To: <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211933.543975.15394351403928013443.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=499;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=xUnX5r+Ia5wVgu4C1yKp3zoGNGvehdD6dHdKzah5/1w=;
 b=gaVMb42HHyFvagjdkvfaJQqBc2LDpVy6wSQthTX+5Ypqsv04XzByg2JJZ4XU6Awm8QUW1AkTp
 0CtWpu9FKJiCRPIERoLZ072mXxUjc9vgES0WvUzRignXw4Q2xPqF4Px
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002209_404126_7D0E532B 
X-CRM114-Status: UNSURE (   7.27  )
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

On Wed, 01 Jul 2026 01:46:50 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> This adds definitions of new CSRs and bits defined in Sxcsrind ISA
> extension. These CSR enables indirect accesses mechanism to access
> any CSRs in M-, S-, and VS-mode. The range of the select values
> and ireg will be define by the ISA extension using Sxcsrind extension.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
