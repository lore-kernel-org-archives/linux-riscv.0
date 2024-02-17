Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5ACC48BEF
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 02:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K8e/lsHgrLwB6uDgeCqL6Eb493+G/QcTvihc35tWwJ8=; b=QwhwG9TpE28Mg0CY9cwNeNNuec
	4kDC62hPqtGmQIxhlhbK3bZyuAPFXjhoq51cuOKwSOzEQgv/9Cqdw5pHQRIFHB/PDtreM9ppX8Del
	GERLc46yHo/22kVVejUx6wWW6IQt+ggxN9EOvQJpBrLPs++7+Q5OVZIACbkPL6/MARfzeuWGnc9lL
	30V8/tJFLrt2W/lxrlnFo4dutO496jzADxpYBy02SEjDYlVt18C5xPJ1ymgIsGMCUNvKRurQ0gkxL
	nhKkOXopp/DhORGLStSL2B0g4HqPbtobG9GnRA+ZZ8m98d0tr2U9g9eyVFK8r+ddVSp5jwAGNH05W
	HdQpiBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbAWP-00000004VRy-2i10;
	Sat, 17 Feb 2024 02:33:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbAWL-00000004VPU-14lx;
	Sat, 17 Feb 2024 02:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C8EFCE2961;
	Sat, 17 Feb 2024 02:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798E9C433C7;
	Sat, 17 Feb 2024 02:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708137216;
	bh=xyzc60yatFJ3EIuSM28pD2LFLavyJBimUvLYWwSqGOI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=sTJPW/eQmSYM5jfvpY6brmYtaPWJNo3jj3LCMDHpbISyWvMJywnH9SUxckYqsYXwe
	 Met6WrkeJNvdVxVqKCHOGe3QcOqdiiJJSwUFmv4/uotyTysZtcCGHW4Ozz4JaX9rg4
	 qQFYSq3iKbrJq01AHOQkYrAmIV6NNo3jPmhpgvr5Cwk//ixNXVww3fpOp1P4j/Y4zg
	 UOViqq42bLAFVDQuSCFY3LYzXKZajVbyNleMyesM1Q0GmGq5lBOkX4V2EcBgBkR+iC
	 7GDGmzoRRW0Ki6PaNObjW8F3YG4GDJsrVSQaoZHWTrN5MmEBEwTyP8ZfKJbQFeLUha
	 GEzJccGP/sANw==
Date: Fri, 16 Feb 2024 20:33:35 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, 
 Andrew Jones <ajones@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>, 
 Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, 
 linux-doc@vger.kernel.org, Will Deacon <will@kernel.org>, 
 kvm@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
 kaiwenxue1@gmail.com, Ian Rogers <irogers@google.com>, 
 Yang Jihong <yangjihong1@huawei.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, devicetree@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jiri Olsa <jolsa@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
 Adrian Hunter <adrian.hunter@intel.com>, kvm-riscv@lists.infradead.org, 
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
 John Garry <john.g.garry@oracle.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>, 
 Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Christian Brauner <brauner@kernel.org>, James Clark <james.clark@arm.com>, 
 Weilin Wang <weilin.wang@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20240217005738.3744121-9-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
 <20240217005738.3744121-9-atishp@rivosinc.com>
Message-Id: <170813721337.1034359.14079032178586114678.robh@kernel.org>
Subject: Re: [PATCH RFC 08/20] dt-bindings: riscv: add Ssccfg ISA extension
 description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_183341_674310_9D4FE468 
X-CRM114-Status: GOOD (  11.46  )
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


On Fri, 16 Feb 2024 16:57:26 -0800, Atish Patra wrote:
> Add description for the Ssccfg extension.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: found a tab character where an indentation space is expected
./Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: found a tab character where an indentation space is expected
  in "<unicode string>", line 125, column 24
  in "<unicode string>", line 131, column 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240217005738.3744121-9-atishp@rivosinc.com

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
