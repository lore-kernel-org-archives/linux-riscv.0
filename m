Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE8AC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuA0a473x/mMYGDts2Q2E2pXXclXASzhwLhRRKwU+hk=; b=ZhUKrzfSmiNOA0
	/vGBCcbmQ01sjupaZySuu90FtpNDB7bQ7xnyP/VJLpDUUdWKRepgLIXPpzkZkHaPKB5TcghNyzbhb
	m1u/gp6kFWHsEAWYzKBDRbX6BpJMAR//7f9CgPIQODM0PS0fk9A9dK7JAiJGP2+10NPQKC+CyCLR3
	5ZpBx6qnat2WJlrrxDMQrFmvvMxoRQrj1cWaxWN4Mp+zcm/wc/BhCN3V/dP3AzQjPHgQvh1TSMX/v
	/QHWWMOrvl5U8zkPt/cuRyTm3bgb+NUvRl0VbpNF9BFc1Q1iQVXY6yw/wtyKNbWgE/wLkJFuZAVO4
	FAY8O0e3wWwjsLV4KaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56Qo-007DHK-1Q;
	Fri, 02 Jun 2023 15:11:10 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56Qi-007DFR-0R
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 15:11:09 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5343c3daff0so1268252a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685718661; x=1688310661;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFjFf9QHgSHlj44B9KI6vj2WvMIUXClf6uC8Orp896M=;
        b=sZOmeXFx40HznLvZP3MtBtdm+lGPllVCu2O5BSqzyyMxXUEMK4UTbDUNRUl7DLtRnA
         klyFQh/2w5mnjdVujmROdH4EzHFRagXr5W/wbjs5nE+JMafxvCA9EVWbv+Ifno8XvG7Z
         xWRL+65CiBVxpO6a+ZS6ZiwdchnAF4spnitJC/5spZn8nFVb1BnTm29afQDct3BcKr7d
         4fDBkjkUlMgYjZrFZbv8nhOELLLwUYmNLHDubDpxT548HljZzkVQzttCA65dKJXtogJq
         YvmE0geSJdLx5qj/rddqcz79+a9+KilywkF0gK7bGYfYgXsVvzh+hJM2xQSpQR/qw7fD
         izBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685718661; x=1688310661;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFjFf9QHgSHlj44B9KI6vj2WvMIUXClf6uC8Orp896M=;
        b=eDbyEr2Y12Hml7AhHq8lX4n7oRdPzydQ7wNRZXzSfIcJbWlzwTdVNVqzWnsbhfTZKk
         dxqnT7pIF7JYG7TZTQvdGX+Y/blPye164D4S0oq/U372XuQHpw/PL2IJrWWo1Xp8U8+O
         K0gurkjmevR7t2Zml3p5ryoeV2D5p5c4F2kt2iacPG09YH3cqrSZYvSFPPwo8q7L02Mm
         rSCIgM/iZPbWocfIcUzI8O2/xHJ5uaWSioftVOly6m65YDEC8DxIf6obG9fkQoW7iNVa
         71JvdQBJH0WpFq2x4hN8/DD0ERhZzdk7Izi4Z8wckudVX8fsHWXc/axzqwd2jV9ESMje
         l7Xw==
X-Gm-Message-State: AC+VfDwUo6KpV1htpU2Lfq4LnnGHBNFzWTP5YtKDeBjPQyKgxSpZKmM4
	WthAMhl6IfuTVo30zfONJR81zw==
X-Google-Smtp-Source: ACHHUZ5m9nXzekMPUkJhtVrD6dDGKXCV96hCHhEhhL18NuaQnxAQmnEqUiIBBKbi4QiZM8Xq4hhD8g==
X-Received: by 2002:a17:902:dac4:b0:1ac:859a:5b5a with SMTP id q4-20020a170902dac400b001ac859a5b5amr332989plx.0.1685718661326;
        Fri, 02 Jun 2023 08:11:01 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902a38400b0019a5aa7eab0sm1511912pla.54.2023.06.02.08.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:11:00 -0700 (PDT)
In-Reply-To: <20230601095355.1168910-1-ism.hong@gmail.com>
References: <20230601095355.1168910-1-ism.hong@gmail.com>
Subject: Re: [PATCH] riscv: perf: Fix callchain parse error with kernel
 tracepoint events
Message-Id: <168571785998.17076.15304236067157396048.b4-ty@rivosinc.com>
Date: Fri, 02 Jun 2023 07:57:39 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ism.hong@realtek.com, Peter Zijlstra <peterz@infradead.org>,
  Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
  Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
  Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Ism Hong <ism.hong@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_081104_171315_8D0AA5DF 
X-CRM114-Status: UNSURE (   8.55  )
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


On Thu, 01 Jun 2023 17:53:55 +0800, Ism Hong wrote:
> For RISC-V, when tracing with tracepoint events, the IP and status are
> set to 0, preventing the perf code parsing the callchain and resolving
> the symbols correctly.
> 
>  ./ply 'tracepoint:kmem/kmem_cache_alloc { @[stack]=count(); }'
>  @:
>  { <STACKID4294967282> }: 1
> 
> [...]

Applied, thanks!

[1/1] riscv: perf: Fix callchain parse error with kernel tracepoint events
      https://git.kernel.org/palmer/c/9a7e8ec0d4cc

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
