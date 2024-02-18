Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76F8C4829E
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=03ud57yA0DBMi98jCE++BHS/a8/xYwV2SR09xeWotrs=; b=LUXa7F6rpqjp56UnXmYvXXaBEP
	yLw61+sm6Mvngk5qqrFTAfZe55ah8WuYc0KuDwx23Y59oEleAHHDkDrSMhLAGma+onYIuEccKQ73e
	GkYb2SIFp1NjGN1gXoktjD1Co/JZUDe6IpqWWDz+sXh0qi6PDXTC8Fnyc+HKZRoqEEMbsYDW89VYO
	BjoZP5lA2/TaN0zWnwOAb1uEgVn3zvB3dmIYWyfgvqkFiEy4ElJBuuzHXTr5UpT+wERD9crpKZJpk
	4bEY9gfhxNHrPqmmKp5vlDbMOINRZx6ViKg8lbtUtVyLQn8z1YqgB7/xLlYMHKoy8g16HyzFLly/s
	BYenFMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbYvZ-00000006zyL-3T8k;
	Sun, 18 Feb 2024 04:37:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbYvX-00000006zxy-2UGs
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 04:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B6BF60ABB;
	Sun, 18 Feb 2024 04:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D754C433C7;
	Sun, 18 Feb 2024 04:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708231037;
	bh=exc6W+a8mXo+2ygkupRksZ9kXb5L+MofMKETRqMMwRw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JMyCACXYbqQS/qYiI9BVz/gXOYm/kEHgzd2NafDorKoUhOihtdBZM5xDbLmFsEntV
	 Ph/aydKG11WEY9hPdSlIhv6Ntje684ioAiQLgx/TX7mPgMJ1Q4uMVkb92GkRIf239Y
	 e10XglzFdshBgUEU2rms9Wsb8OEBw3Q5xlWIyy3kgOnTpidGZqypW1ru3JV3HWcQDt
	 qBtG29X+mUP1h/EQLWHsCfExROWI4TsNPWP6YqNROhO1n8ZlOkyYDXasUDiLuovxHg
	 yBkrmahy9InxVGPHMqw/J9Pn1S3gaztGbGk296cnQN1oE8UEaVG6LF+goY7wmdsBQl
	 Pk3LrmXzQW4gQ==
Date: Sat, 17 Feb 2024 22:37:15 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 samuel.holland@sifive.com, krzysztof.kozlowski+dt@linaro.org, 
 inochiama@outlook.com, paul.walmsley@sifive.com, 
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, 
 richardcochran@gmail.com, sboyd@kernel.org, jszhang@kernel.org, 
 aou@eecs.berkeley.edu, xiaoguang.xing@sophgo.com, palmer@dabbelt.com, 
 guoren@kernel.org, conor@kernel.org, robh+dt@kernel.org, 
 Chen Wang <unicorn_wang@outlook.com>, haijiao.liu@sophgo.com, 
 chao.wei@sophgo.com, devicetree@vger.kernel.org
In-Reply-To: <a48dd91d5f9dbb7d25fd6c80ed130dc458ab6769.1708223519.git.unicorn_wang@outlook.com>
References: <cover.1708223519.git.unicorn_wang@outlook.com>
 <a48dd91d5f9dbb7d25fd6c80ed130dc458ab6769.1708223519.git.unicorn_wang@outlook.com>
Message-Id: <170823103355.3760667.6705991834604152271.robh@kernel.org>
Subject: Re: [PATCH v10 2/5] dt-bindings: clock: sophgo: add RP gate clocks
 for SG2042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_203719_700636_390889A4 
X-CRM114-Status: GOOD (  10.35  )
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


On Sun, 18 Feb 2024 10:51:19 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the gate clocks of RP subsystem for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/clock/sophgo,sg2042-rpgate.yaml  | 43 ++++++++++++++
>  .../dt-bindings/clock/sophgo,sg2042-rpgate.h  | 58 +++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.example.dts:21.29-30 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/a48dd91d5f9dbb7d25fd6c80ed130dc458ab6769.1708223519.git.unicorn_wang@outlook.com

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
