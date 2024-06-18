Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF4C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oE7ugb9GxeABDRrLm8In6qZPz/yi6G/gmvRqLCFwx30=; b=tuM7SrUKIVjjaAtM919N/ag0bZ
	c5U9ruZs05GGImnOuUmZbh+ejEqCAUhLtfxPEk7vW/f25wlXSsEFeY55W00L88gQsKynmVClnfPZf
	MPhojfY7aJuCNVNVHHLeicJn1DMeHYF+9WDHVSsePsNqgEtZxoWueE8m440/8L7RhbVcCYUhCAAdC
	wdYfskuw/oNCZdSpDwGgGIoiQdMPM7xVgkc6VPehF9F2JE4z9/VNqipMEyRqqNchAhWrz337K5aar
	4Qgz30qrwkNsj8N1+saqtE185qedCOOIgnk78E/xp56hJ5pj1kzqhIDy5pVXnDGxT8uKy3ORzloGT
	nhIfr5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJc5u-0000000FwJq-1Kls;
	Tue, 18 Jun 2024 16:54:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJc5r-0000000FwHY-1mdE
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 16:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14D5461A4D;
	Tue, 18 Jun 2024 16:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EFBC4AF66;
	Tue, 18 Jun 2024 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718729641;
	bh=M3dXsTI8S1ItZw3XuJcDiIRq8FIhqSg2BtRyqdaJxVo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Et6DxZZltQp4/HaVCgZjMhEBk28Q79+FXmjjPL2hNSAHrM5jtLcG3O95YjBagmz9x
	 uYpc6hg8HqPrHQBfoa4QvwJe2FuuhSMRVTKoR8HUt+RuATBY08ytPuS156lRGgvrh7
	 hf0Wh/PjZOzNw7OIb9KRgLqDkHpalRWdjw2CTdnKzoARdkxCkc+pnf7G7MvVdjXPkS
	 DipApUS6tAwIX+V+IJqa7E5QtYI94nqxGU3QVdUKnEloTrAa743CstsR30tKG6Xm5d
	 o/SfpcjacozJAoroYyVzYyoRl3TCuIxSb2e2ixFrtNM4T9yLmAzC9vDaEQUuiqFF7P
	 CLuNR64Uwsm7Q==
Date: Tue, 18 Jun 2024 10:54:00 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yuntao Dai <d1581209858@live.com>
Cc: conor+dt@kernel.org, jassisinghbrar@gmail.com, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 inochiama@outlook.com, aou@eecs.berkeley.edu, palmer@dabbelt.com, 
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, 
 unicorn_wang@outlook.com, krzk+dt@kernel.org
In-Reply-To: <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
References: <SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
Message-Id: <171872963677.3062707.7560457462678270333.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs
 mailbox
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_095403_623624_7CA1B25B 
X-CRM114-Status: UNSURE (   8.82  )
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


On Tue, 18 Jun 2024 23:12:33 +0800, Yuntao Dai wrote:
> Add devicetree bindings documentation for Sophgo cv18x SoCs mailbox
> 
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> ---
>  .../mailbox/sophgo,cv1800b-mailbox.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml: recvid: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml: sendto: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM

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
