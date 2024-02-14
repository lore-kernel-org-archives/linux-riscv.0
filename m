Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7064AC48260
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 02:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZvCU1RHrsYTIheDxurmSAu3ph1IdoODQtdC1qOULwbU=; b=cKoEQ2VKOu5cn5703B9CqBRKqU
	dFIMo+M+TPdnZ5Nwz6y09FCQzsLK8lumCh0LMZnQiiB2XzwttqtnNif2CwkI2pCG1KUxPzLMSFkWs
	FMpWig0fz6Ox8qJrPZ5foB+SOQLPBOZqVLhaG8VQ+VyhiYAapCowzdPK7UIBecmPk3Zfz+48HsvrU
	ZaYWjQL+hb5L64MKtb7U1MZ7Ck/6RHNtXf2jQQ0SOw7wLhw1X95UNns4W62NaLOb6g1gzFT0MJqtx
	4/d9mIQIPRYuPbQmXRUe5AFB1emWOi+2ocIbwVYnkCGyTSeIb0p8nuIYG0xWlPjkzgK0akPPkr5q+
	sobS4r8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra4uL-0000000BVfS-3sDL;
	Wed, 14 Feb 2024 02:21:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra4uI-0000000BVdJ-0evw
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 02:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3A756177D;
	Wed, 14 Feb 2024 02:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA38C433C7;
	Wed, 14 Feb 2024 02:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707877313;
	bh=oGA8Zybm6NlRQ7jaj1sY+qjLjdoZy0Kj7v2TUM0bTpw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eOvlzN6DaLNwBvUZauy7PAast2Pw+KkeEEirwWhSXY0EDNlpEO0rVTUTY3j5UNaWc
	 J1P35mCN6WmtgY0IyLWgbgmPUjuKQZhDCLu8YowvFHUCWSMZaaXH9J32yOu1Vqx5Hq
	 MlM1yrp0DHNz1BbXXOr/rf8I/1cuMCMFNa83g9zHDha/OTuXtrh+6Clj2M9rYYo83w
	 fzk21WFTPuOCmAQDnZnnfIZR6sXz+GtH/9iL8G+brHky32DqIjEXlLhqhiF1Kwvn8n
	 SPG373QnH5vfTprzTF2PRXpTjuqvgxGtoKIyr2BBYz4RzPZ702c6aDAZfhpYdXKxt2
	 t1n2qwWBLpzgg==
Date: Tue, 13 Feb 2024 20:21:51 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
 dlan@gentoo.org, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
 Liu Gui <kenneth.liu@sophgo.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Chao Wei <chao.wei@sophgo.com>, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <IA1PR20MB4953DA1000B825CA29E3BD11BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953D95E8657A480813767FCBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953DA1000B825CA29E3BD11BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-Id: <170787731083.3026929.8244516804059249825.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sophgo: Add top misc
 controller of CV18XX/SG200X series SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_182154_307188_71B6BF2A 
X-CRM114-Status: GOOD (  12.41  )
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


On Wed, 14 Feb 2024 09:35:54 +0800, Inochi Amaoto wrote:
> CV18XX/SG200X series SoCs have a special top misc system controller,
> which provides register access for several devices. In addition to
> register access, this system controller also contains some subdevices
> (such as dmamux).
> 
> Add bindings for top misc controller of CV18XX/SG200X series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml:35:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dts'
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml:35:1: found a tab character where an indentation space is expected
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml:35:1: found a tab character where an indentation space is expected
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/IA1PR20MB4953DA1000B825CA29E3BD11BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com

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
