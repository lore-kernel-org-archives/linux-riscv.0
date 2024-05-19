Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303EEC25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 19:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8qcbuYScumOcDdUkAGQ9AqpFQdLFVFn8V1vqFmAMJh0=; b=FHQKYy32vwxLm6zPUdsvxDI3IX
	g9HGkRlZcecUmetquNsv/JNYyDwG+z3wPH4mSf1kkHpjKoC86DntEj48pHCgtLZqM4hX+rr8+Ui9q
	lT7g7wP1nPLjgvjXw57EM0iC0GrTHhksiK4bCsCohL9jEaA83S9aWle8uoBmW6KAJPE+gsxDn7YYW
	VQdG1pWrufMtr4iguyyjNAdDM9LUWO0CP7idteTyVkseWJa5892GgzYvkEkXE1ticlCDO91Exv2Mr
	5GF6sujPheJw7dHW4iKewTXHxs78796RTyG7qLYTHcU+edvqOnjNSfxXpHXDSZc/lS3OoT9uhTagW
	TUs0r7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8mGy-0000000CcGr-1baj;
	Sun, 19 May 2024 19:32:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8mGv-0000000CcG0-1sqV
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 19:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31716CE0A2C;
	Sun, 19 May 2024 19:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781EEC32781;
	Sun, 19 May 2024 19:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716147155;
	bh=1GvbBfv2XOQYFaJwoRDiUHVxHSxTdIHoGwILpB6AiwQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RV+ciD7zn2cE5WPaK6Rr58GtDcZbvGDrRevdKoGmzdpmxR4IwAS90F+AJ8NNUNZlF
	 aqmzascLg5BYDyR6OfAfji8wCDwULp7NONZlZyaGTSKaNj/NI+qk/df77ipsb49oEK
	 oH/Cq96ycdom81nSHCQwDQ+2SAelCcbCw0ilsAfbajpC4c1JbSAb4CP98H/n9neURg
	 3o1ekOeseaBGKMa4uv2enWt2CkciNc6R5bCzlZkq0HVHZ5vCVXVvPiMaX46VmWRFyf
	 Q63Dse0E3zv3p+06Ov1PH3IZvTbQox7eKspaOjRbhl7cY9Y+Qv5R+m5ZnXb+Q9giao
	 2oG3+xER9iqcg==
Date: Sun, 19 May 2024 14:32:34 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, 
 Kanak Shilledar <kanakshilledar111@protonmail.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240519175906.138410-3-kanakshilledar111@protonmail.com>
References: <20240519175906.138410-1-kanakshilledar111@protonmail.com>
 <20240519175906.138410-3-kanakshilledar111@protonmail.com>
Message-Id: <171614715439.2941344.11264816105918092609.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: cpus: add ref to
 interrupt-controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_123241_708048_5EFC1963 
X-CRM114-Status: GOOD (  11.05  )
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


On Sun, 19 May 2024 23:29:06 +0530, Kanak Shilledar wrote:
> removed the redundant properties for interrupt-controller
> and provide reference to the riscv,cpu-intc.yaml which defines
> the interrupt-controller. making the properties for riscv
> interrupt-controller at a central place.
> 
> Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 22 +------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.yaml: properties:interrupt-controller: 'oneOf' conditional failed, one must be fixed:
	Additional properties are not allowed ('$ref' was unexpected)
	'type' is a required property
		hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/interrupts.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240519175906.138410-3-kanakshilledar111@protonmail.com

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
