Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4CEC44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krLkENqn8mVMbWWsOXtwLOpLoMkna2N82avcOuZtD+s=; b=uwI893qSOOjfke
	WIL/2MGIyreZi/Ox6hS+7PdbOorO8J5s1ptpimpn2APWbIo0v/SEqEzomQ+bm/QESRiQtCJ4ZZGuS
	6UHEvQCkv5ohMVerspw0E4Qr4+iNzAjh4KjW9FTg5CZvsocEhrq/KsgX1SQT5UuaBVkmnxoCdtHji
	gnvOE/Umj6vj3UhjTO3c1xTFUccMBS5y3DcTj0JmvH7IZLzzbBvatCxl8MW2K145oraHurQKnftwH
	JUbfCb+TozGEFkN/JDeZ0HSOGjyvMVUgI14/e3ajL4/04VAk6Ek1Cj8RfzoMq3VRtRPRd6buJvADH
	T1qszSq6zlwHMrSheGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKp-000000063P0-1WSb;
	Mon, 20 Jul 2026 07:22:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKL-000000063Cu-1zxI
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso7438302a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532132; x=1785136932; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOacMlllEAiItNG+TLG1ZIDGtvtY1fzk11Q/F1WHU44=;
        b=PN17x0GsTbFeQoGAZRpqA8qGLKQGXds7APMTvvd9KsQ1Q/SFhx+X2vz0EKDVsHstfi
         KBr+2SmZaKcMzu4Zn3byc977+29gq0+EwSKj4bplkTp4YaKU9nAozSfNkRnWNnoxsJ5i
         qp8uJ2uiYTHDbA28NHv3N4DcMCZy5lSySfYylLpn3vneZx2QyvXYktmcN75nvqtcBDiy
         xsdcYeZ+HOd/aerAH2aTGRUGK4cGwxQ9JAqsuMq/ykuuvtUCEbreZf9UXIhxs5gHhKrQ
         DYjJ3x2l26TFFyUi0mTL/2SoFwkvL+le7Qo9XpElOkU8sZnkz91pA68smE+Ue5ebn4lx
         LpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532132; x=1785136932;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOacMlllEAiItNG+TLG1ZIDGtvtY1fzk11Q/F1WHU44=;
        b=UVHQpXyXPWmHcLgveLBKG6cKjNFkDvlLWH3Dizs018NwFScSZ08zltqqlKj5X2JBGB
         wudT3U1FsBwV43A5oj3n1iM4dyO81rUyGH0ss2+azHLBGlpmji41eASaNEV1ahf1h2Jt
         PpT8raKws4KyHv9v0n4YBngXk/5Ru1XCDjP8YqlUYLT3z8RBF8ahFxxGHyiC/H2yIgGT
         TZqbi8Kl27X17xSIA7ge4PwpgswhmEdyci8SW0zeqovIGAZq9weaopB2RLbpCaRYc8xh
         /L9D/uc4evUqxQo1t+TeKgxYfk0aUjmh1JCUtbkxEgmFvd577iUn0Z6cztXrT9JCPxd9
         MQkw==
X-Forwarded-Encrypted: i=1; AHgh+RpcwXEHG6nVH/5JB+vHY73e2Ul2coFwNYhgVbuwUI1GmfBt2lZnFSbyd5eb9H6u8DZC/7eRZ3HFX0YmrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxap4kwHpXUJ//QiAcvTH5eDXnNpvnC1jH5CvzGR5zDBXDjXOEw
	9raV5ivCFV+rbIWcFlF5ngzzIIe3BOo/sp/+0DwM/ITJju/MCzFhN9H+
X-Gm-Gg: AfdE7cnHX3vr8R87DXAVLNee/QRds6Pm3VxSXqe/CQ6ozhhoaLoo6mjvHETrHlSE4mZ
	q2N35TQlR1RezYXuyVDcrpkeLCtatnFPF+XUbVeFP1PYv0G/SczK74HMbKRn5qwPTGvqV2tvcRZ
	oXTMWAJj2QeAwO9eIV6/RtodjzcHf3brMxwWe8yWiv08wIhTv/uu15le4Xx+CeXUumX89rTeebI
	TNjApJcXIkUG5mUG6Tz9o3jZZrkc2O0hRWo6wblpUSYaJXkLr66499Qg3TcXkR+nvyatlp4IcBn
	iTj9NY7odW8gdnfyj7AchNgJZxlK5HXIbls205lEmdfToUVWcErnGv4SFdihAEtpRcFQ2gle9kl
	rpwWMrT5IH/dOe7Qg8/BSeQL/CoOyhbYBqxEUzVavBw1C3hXufYtr1clCm8LnMa5e3m3dO+GZwo
	e9S2ePKKKlN3E4wqdmKuoIUaU/1/Dv
X-Received: by 2002:a17:90b:2f0c:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38e4b431074mr14088269a91.8.1784532132492;
        Mon, 20 Jul 2026 00:22:12 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:11 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
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
In-Reply-To: <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211935.543975.13003104709969920617.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=337;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=WLNuylhDoT/T1nhVqbXxx0oK9SVpgxKx6NkmkPvsdCI=;
 b=2xcWmRRAqDjGQXqwGbJnB+31tbqeAGCjzKohhI1vIvF8YponJ3EW8uJz4jNw+WI3VgGyavSGl
 gtdiuG9MO6vCHj8LYZ52PlJfVOl0LaepzbRROI9Qgxlnq4ieSx45ld+
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002213_552995_5EB4CE01 
X-CRM114-Status: UNSURE (   6.28  )
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

On Wed, 01 Jul 2026 01:46:53 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The indirect CSR requires multiple instructions to read/write CSR.
> Add a few helper functions for ease of usage.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
