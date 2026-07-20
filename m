Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63968C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+Zq0nUl3VElXIigo/m+z0ZBirD74ji6qyINpErhhGc=; b=0I6q41B03/mctT
	EPmMcOGU0P80aGZSbFBepyO35qlfY+/z4RunTRDWuWYXrHJDeqjjTvgrQXpGBSNfLJoy4xepCWcUR
	co1mTJCFK+u6qz1pOYrAMT1EFBA6b0uVhFXvRCRjKGicGUCF/0vPPxgK2xtg0alE7rn9O3SpystRy
	tVCG+sFJDxsgnU1qomz02wHQfr3hzsEIPFCRs32IHIyuB/JGfZZ+VNsi/hGlMMSKvoxyo8Szwwt2x
	OT1ouVqrnxlN2RhRQy7XQQEkNcKe0jRSoyROpR5nGRLNWtOt77rXtUnQeR+n/hGWMj9nK2xp8pyOQ
	ar4u/cHtPB2EwQfopNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKJ-000000063CV-3Fv6;
	Mon, 20 Jul 2026 07:22:11 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKG-000000063AZ-303c
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e08baf860so7345610a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532126; x=1785136926; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0fm7uYEG5s4l2Qi1Q3lmMTkR8sLj78MMwG9bX9Qa+qk=;
        b=FyITGyJLBJZrr8Dyd/qBNSXjZb1ETOP46RHLCYXHel3skPnRqtNsjSzMcLfZ1Q7uNQ
         jtC4Hauhv5aOkdJ3sPrOyLDEHSzFF0nsa6Yu0jIKOXdV1lJkgXuT953wJkzjYPD0uC6W
         eTJg3LGHaF5HFUWN70AkQ5j+XW0eIBnWgGYY2QlAowXhvSGuROwMVOfzuXygWFekMsEf
         KnEgvMp29nyjrl3UvmxJY58g82VkBYgd8u+w8q3z+Fm4ZN82U8SaR/+R75KUQPQXNTdy
         D8NARp1sBmIMkLwvgRvtEG2IC95Sn7m6ClaHXRpJs2XWyFZsJrYTur99EDTOv7BnH3yR
         VkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532126; x=1785136926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fm7uYEG5s4l2Qi1Q3lmMTkR8sLj78MMwG9bX9Qa+qk=;
        b=EaaVQ/I4uKGKqRDngVFs7WssRbBjfs/1jardh73sxC8YdFgs8srs6IC7bPRpX/mg3K
         P3DEcywVvG6Qdep9UsAllplgWD8LR0PybSONtzcI+z5jQRdnkAzeQ+fLne+2wqNToIUp
         vNMhHa4gxy2igffHNPIaqLLJWm04gdeBtj0lJir6O2LFWZDb+EUQM4WNuHYs7PtLD9AW
         gtb24Fk6a8Taq+Uur57B3ZCPiPqFrfcI8GqbhAREWyZrGokHIoqHQgJ3fbh5NY13I9wK
         SyJvxl+Z5IQCru51BrgmfOwoN6g8S2QlOaCA+uqx5VlXXhXL20+xYzo4pUpfdekYjLf0
         vw4w==
X-Forwarded-Encrypted: i=1; AHgh+Rrt7fkHhc7RJ1ol+QnoYLMxk89YbwVAnX6BVdzALz52FSAkn8M9DYN2apN5fqg/mDXMFLqk+laGjcabBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySJoJMN7+/IyiTH2PfaeFBOyRZMKgXvfIRjzHZcCNUUmXWePMz
	JY1b9lh3ifNdfV5qwGj6FJTWAv+yYjkAMphqoT/ATjjiREzUmqDb947w
X-Gm-Gg: AfdE7cmo/JnDCOEAlBQcz653upw6Gaeq4CAQ8Lmkf+7vjkM/57tKLIhzrEP3X4kTwdR
	6dISC6yjezDj+DF1VQuCYlvwVXCunmnbguPdkbkgE/401uv1+s5sXo93SEolkUZYL91SHIU2w9y
	/GWZkll91JhrUwDQRXred+XteD4owOJdQF8HivYpJJSArKfMT29CjvcDhFsRqdcYzpXs3qiBljZ
	L2vtQwYc1GkXz8yInwoqGCeQA/l+8i+BRnkTtfjmPAdWPtPCi7XI01EMgsT3gQyn37/0mDe/GkD
	1pXKO3RzPrIk42s2PSFIdG3cKKanE9Fig2V1Aw3f9DyTDkRVx2Eb20DaSqS6CzYj59VjwHfrWke
	PKpIbFn2VXnVQvILChhr05XsojSsEps+pCkvHwgmonPv84akV5TdKJHt+9lqhc+vS6on49FdjkI
	nrYL4OYBTcwKEO6ARebYKPbUk756w/
X-Received: by 2002:a17:90b:184d:b0:38d:858c:834d with SMTP id 98e67ed59e1d1-38e4b47726fmr13853861a91.17.1784532126260;
        Mon, 20 Jul 2026 00:22:06 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:05 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 01/22] RISC-V: perf: fix resource cleanup on driver
 probe failure
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
In-Reply-To: <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211932.543975.10206534637071583934.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=522;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=ysgPHA/+x7CEppuRQZHdHoo9X3ZDd6yInqnds9Ij0bo=;
 b=qvIZNCLm5+fXN3DnRuew6aKjZnISyDx8ToUDRMjQnEAf9oEg+M6noqRVyXRmMKpzp0n+0SKqQ
 v5ga/susCSiBn1ylxb3JFmtsT1uI3nl6wtJUgUv4oCsU6GIAT34AFQ0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002208_748976_0F5F698C 
X-CRM114-Status: UNSURE (   8.00  )
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

On Wed, 01 Jul 2026 01:46:49 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Sashiko pointed out various UAF and memory leak issues around
> pmu_sbi_device_probe() error paths.
> 
> If the probe fails, here are list of cleanups needed.
> a. Already registered pmu must be freed
> b. per cpu IRQ must be released
> c. pmu_ctr_list data structure must be freed
> d. cpu hotplug state must be cleaned up only if added.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
