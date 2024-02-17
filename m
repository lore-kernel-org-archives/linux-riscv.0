Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B0C48260
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 02:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E5JZ5UCnsxVBZW6ULaHWQM4jJS+mr9x3L6a8/lH/Xx8=; b=Vle4GfeuWj/CD7zI350q/JivFR
	gAiO3/pR18qmZ6KWrS9h64LEroJNbGcUr9gmX0NtiYyYR1EFU9WIEjzYnZjzbUR7CQ8UTp8BpXaey
	ziFJtt5tNUwdTJ2N8ivMsuapXVBBR8fvPvXKgoJL/jN2xPh958dpcnXv0hCy3hT0BkRK+9sRZxhQV
	41/Q2pVrCNYfrkrXLuayBCrVb6GDnkMX4gaoNAu+yyY8ZM6a+nnOLcp8wP9P+y66OmQGGZ7LiXllC
	D4atFhObPladmvN6IlCkY8zM/kVji9Whq1Y3T2xmShaHomOkRXFhMD8trgda+m+1fPMz2ZJwuCiXC
	uXZdpcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbAWS-00000004VTZ-16kP;
	Sat, 17 Feb 2024 02:33:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbAWL-00000004VPZ-3eDF;
	Sat, 17 Feb 2024 02:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 02E9FCE2DA3;
	Sat, 17 Feb 2024 02:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0062DC433C7;
	Sat, 17 Feb 2024 02:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708137219;
	bh=haW+Geg9Bw9o5VNvbhSkBi54T3SIdZhLVbkvZSHVfug=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TAdqEnNFcSJfD3bOPI1EINwJx7FszBiVIwFOA3zMEaTkObGLRoZjOTratYn0b5Nna
	 yZfq/eY/nLs4qzPIKZ95OQQeGjSEySP3+ozJAt+oYBhtm82DoOZVXeMQsDo4X7hDmp
	 N6FxBrhpr+h8Jd0Sn7oyVjyHAUXKLCjkSiHAnyfmS8BjHEDO7N6BqwS5eHCW6mT8EJ
	 zrChd9I6JCiTMnmILWmQdOdy6Asx+wLWJCenXaEfEt9z1DU/bUxMqgtb6zGwl4pBdl
	 QAJLMWDV2TuvtZ9Jm++JJzBIHs88GYcFNOoR2yVm17FRw7wzFc6SJhbnF8D+Xzm2+R
	 6wwPzFNws8HGw==
Date: Fri, 16 Feb 2024 20:33:38 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Guo Ren <guoren@kernel.org>, 
 Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, 
 linux-perf-users@vger.kernel.org, Weilin Wang <weilin.wang@intel.com>, 
 Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yang Jihong <yangjihong1@huawei.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 kvm-riscv@lists.infradead.org, Evan Green <evan@rivosinc.com>, 
 Christian Brauner <brauner@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, 
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Kan Liang <kan.liang@linux.intel.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, kvm@vger.kernel.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, kaiwenxue1@gmail.com, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 James Clark <james.clark@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>
In-Reply-To: <20240217005738.3744121-11-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
 <20240217005738.3744121-11-atishp@rivosinc.com>
Message-Id: <170813721439.1034411.7264728567495824984.robh@kernel.org>
Subject: Re: [PATCH RFC 10/20] dt-bindings: riscv: add Smcntrpmf ISA
 extension description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_183342_284645_6AEC2C18 
X-CRM114-Status: GOOD (  11.07  )
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


On Fri, 16 Feb 2024 16:57:28 -0800, Atish Patra wrote:
> Add the description for Smcntrpmf ISA extension
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240217005738.3744121-11-atishp@rivosinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
