Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C2CC10F15
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ed8saYCmIQ/uZuHUWGYfofHOZ4j+puZC/jvaFkQ4vhg=; b=WkrjkX8pbaMrFD35O/e8IsUjxw
	KHbMFIaYnxxVm68agg+BrWE+irQDS4Gr79imi1Cr+AWpjBH74nJjxY+Oz6gIfDDTTd4mTMZOgdEGC
	vqp4UAoZCrD28sm+Se5gbY7RuY02SQAaDDb0oE+ojXAXuKbe6LB6Fzcdj9cllCCgD4oKZRqbT49DY
	9yRjM5uhxG5mgtcPbHXrOvhn2UnEQpzwbSBIrMzD99FV5G0SVWEkKp+T6xi4T4WJ8zd0OCi3UEXC3
	UEgf38BCAAD2sOC45ArWrngcQOU0efCDd+d7Mk0VfOw9MNT5EKf88Ds1xOmqSzQimU7O06s/8mxI9
	TySbX7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDPk-0000000GqaT-2uVp;
	Tue, 23 Apr 2024 10:30:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDPh-0000000GqZU-2SwT
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 10:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B64BCE0174;
	Tue, 23 Apr 2024 10:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4519DC116B1;
	Tue, 23 Apr 2024 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713868210;
	bh=Kcu25Wy2mKzGHHHOIrNFUd5lOsB/u1AUSYF0v6r5G7s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=N7yCztiu+EF0YIuy0ljkgIUUwmfOoXwEU04MYE9PknADmgEscLjRQDGwfxZADMk7/
	 Rup2unQluYLp4kLw5Gs0zcDdAOXBAWCqyoktGil/EBAweoYaa8wWf6hl4wFB/GKD5+
	 a14WYgG49fNCWI36kEo/GbNr+nf0Yk+a/hCl2chF8VZuJweftSawUd1fYESllW3qIO
	 omMv8tUqkBVIkit+maEdXOS+GmKFwnG3LdHpBIKkgXDXXAJF6BnDwM5x5R9BuFJ3VB
	 u6F6NrGowrbe5Nk141yW7zDr11K20nMJGHsKsC0oC/fWMdqWLKamCObRnZdCcNrjnF
	 MXiXjKv4er/UQ==
Date: Tue, 23 Apr 2024 05:30:09 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: jeeheng.sia@starfivetech.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, conor@kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, leyfoon.tan@starfivetech.com, 
 palmer@dabbelt.com, conor+dt@kernel.org, aou@eecs.berkeley.edu, 
 paul.walmsley@sifive.com
In-Reply-To: <20240423072639.143450-3-joshua.yeong@starfivetech.com>
References: <20240423072639.143450-1-joshua.yeong@starfivetech.com>
 <20240423072639.143450-3-joshua.yeong@starfivetech.com>
Message-Id: <171386820810.3677783.5949839682682937606.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: cache: Add docs for StarFive
 Starlink cache controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_033013_848580_1763DF9D 
X-CRM114-Status: UNSURE (   9.16  )
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


On Tue, 23 Apr 2024 15:26:39 +0800, Joshua Yeong wrote:
> Add DT binding documentation used by StarFive's
> JH8100 SoC Starlink cache controller.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../cache/starfive,jh8100-starlink-cache.yaml | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/cache/starfive,starlink-500-cache.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240423072639.143450-3-joshua.yeong@starfivetech.com

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
