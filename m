Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62FEFED3C3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M+DCwlDotjFZ1suQ4+Sf3BJRM6IwvdHUaKNI0gGCZTM=; b=LOnD46FOFY6SRN11GS9LLAPk81
	rG2wbTgtfXtV8nsMUjt8/0sL2F2Hngh2EtSffw9CE07HiZFywI8DkUwbYYkDphj422Xnh9HbFOOsL
	wW0i3IxYEvPIvw71HTimvMfLMucaQ9hjb7aN4ijEJn0Si1KIqc7QySzPKKZOl4j2LUrD+QXck/jrn
	C9US5Q7+sIY9dBo1by3/QXZ5uIlnXEx/euHmJcoylv9fET6OaQ7wNXNs31q6FsJWbFx4dGHYCMvVs
	fBe6Uma0M04LnKm9+b8SrwTsvM3D5/jKmSwTDM1mLj1f8SFYpdE14Ren+1owZ6rtLJrOP8PW9RCNu
	Qz9Mrd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGPM-0000000DDzp-3jZV;
	Fri, 24 Apr 2026 13:17:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGPL-0000000DDzh-1g5l
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 13:17:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51E4A6001A;
	Fri, 24 Apr 2026 13:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA5DC19425;
	Fri, 24 Apr 2026 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777036642;
	bh=ybYWfkYopakx2x/H9iLMUuFNckKVrkrunJzGWNRPBPw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MYbGyF7ZKB0B0T2ST0hSVrw6H53j9rp3+/VXCTELXocoSQ2yHnKefjWCXlymyiiR/
	 96CIXSwsKl8xUwfhcdxeWNna84uz0TursRhUw1rdZzujWCK13OMr78211ZRv/oydyF
	 StrM1723kFoXeybwKQUPxnZlJ70bVZeVcRuGXKQpa3+Lz5CiGX7Ois1iqRPqsJ+dY8
	 +LxKO0X16rS4ctu/9bLwetR9PajyI6YQqHyTfE6SwxCWc9kN03QwTITLfesJ3CcbVE
	 GRaZxXdyYWLAKxRjc89GbcFXPDg8nRnvlh6XBTK8UywaweOMXrMygs+IFbOZOenp8K
	 lRivV19PiZhEA==
Date: Fri, 24 Apr 2026 08:17:19 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-14-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-14-changhuang.liang@starfivetech.com>
Message-Id: <177703663942.3732468.14128027555396661004.robh@kernel.org>
Subject: Re: [PATCH v1 13/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per2-pinctrl
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


On Fri, 24 Apr 2026 04:13:23 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424111330.702272-14-changhuang.liang@starfivetech.com

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
