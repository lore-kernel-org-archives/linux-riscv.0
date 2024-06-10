Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA76C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 06:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=veEqr8cM9Cv+yMRoAu9htQG1MYKZxPpidAN2SntG+zc=; b=el+trltDvDfTNAMs4btoMruS6K
	ZeQhF8MB0KuNy3p7SF8qONvqeSVn22sPeFw/+dgGG85DqaefmdgZHkpe9HEEoaSNQBHvMSUMQOoL4
	HMyNwy9Hhw82WBk1NUO2G/8tCishQdgBj3EzHl3MeiSI5zinuoTDnCKnSqZGeZvLw3vq+/2ykpS8H
	ZazCHaeTeyCowWzIJDMH0NLPAwvvJClAU8TKHVjv8qdTJn6CJEwKPf3IR+iJ9Y86OjgTz64s3Kpks
	yRKjQYLLZVs6K9MFw27bz6RsqTdjhSrgY8paO35UWF+7RsdbPZqHwTv1v1iTH65YODhWeFTb3yu6p
	wfIcRuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGYV2-00000003yf7-1aTi;
	Mon, 10 Jun 2024 06:27:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGYUr-00000003ybZ-0w37
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 06:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB63760A4A;
	Mon, 10 Jun 2024 06:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B88FC2BBFC;
	Mon, 10 Jun 2024 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718000830;
	bh=46ontKYFYxBeCCy+CgEUCpaMHxEXAnXsVFaJAmuzFd4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bzcadobUAHWCAsVpT480gaT0KnUkKTEceCmaDDbtm6xomykD5xW9NEl/cU9kwvlo7
	 d/rM1rTG1tw55LKH1fWQ3/PLw4AD3TfFM4bUvU6VBrrJY1zcdULJKfPPRA5xr33SpV
	 UKRuQkhSCjxeJtl10wwV2fQd2sEwaufKqPrRcSPDONcWRNfgOUonB3LHRPX2ioT3Fi
	 G94UasDurkk8+B806ivHWRipGLfjuvYw+GZlnBOLschWwlYMzWVYaTNWAix4TIoljc
	 TZ1+svjB2kHXJ6rCIqhkWPu7LFLe5pcGnQc1g0OlWvhYJa53wg2jivRsm5AEfdjTXa
	 Hsnz9lqE3/Ryg==
Date: Mon, 10 Jun 2024 00:27:09 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Jisheng Zhang <jszhang@kernel.org>, linux-kselftest@vger.kernel.org, 
 Samuel Holland <samuel@sholland.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
 linux-kernel@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Shuah Khan <shuah@kernel.org>, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Evan Green <evan@rivosinc.com>, linux-doc@vger.kernel.org, 
 Guo Ren <guoren@kernel.org>
In-Reply-To: <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
Message-Id: <171800082930.1000302.5109301877296329341.robh@kernel.org>
Subject: Re: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_232713_425719_8206D223 
X-CRM114-Status: GOOD (  12.28  )
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


On Sun, 09 Jun 2024 21:45:07 -0700, Charlie Jenkins wrote:
> Add a property analogous to the vlenb CSR so that software can detect
> the vector length of each CPU prior to it being brought online.
> Currently software has to assume that the vector length read from the
> boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> instruction trap, so this property is required on such systems.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/thead.yaml: 'thead,vlenb' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com

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
