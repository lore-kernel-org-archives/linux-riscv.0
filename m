Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF87DCCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R2ASddD1yI7pnUfexRzJ9ju4y5kjx7QuQU032HoCKZk=; b=d8caJm6STW3xCXirOeG7TjLORY
	OeYZ+dFPA4Zrl2SEFANcx0N17r+g+ZHROWTdMN4SaM8l8dHegSh+0ucOUdr/u1of0gB87aO7iucCm
	H4q8VlFvDOb1MVnZLzkWRK9dvtwuA/Ra3OokS+HA8n3pJp2t1tbjq/6KvcrImUkJ7qHf5X8uC1xBO
	Np5RRYm/pP+mWa1p1GU8YE5u6odWASKw6bujtyyTYeMXpsXGA+eQn1e0v0NzbxjdtfXQmL0esmFvo
	cfEkQm/+Tj6Lm71XvRsoKwVFd7YZ0LFEA3qK6huqQWfNP75ydYFt/X2m1a9o9fvTuY0BSitnpZ0YF
	ziRdyQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ptt-00000006798-22Sc;
	Thu, 09 Oct 2025 12:37:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ptr-0000000678G-0U70
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 12:37:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A9FA4089B;
	Thu,  9 Oct 2025 12:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1255CC4CEF5;
	Thu,  9 Oct 2025 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760013458;
	bh=azd9FVCjk0aIj4ni+YQWAJAY9F/HKDjvW0AfWT0OlKo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lpVNI5GPx3+9zLTr6fIc28Kr+bKLW7kKmT4TlSKdjdwNxM9DoPkWtk3j3BZaDgklH
	 YuNjCvc4VqSq1v7swX3OuldWGdI3Z41FcJkecOo4F8DzPxKtn7jEDfLKkdzvkE/dpt
	 +Qe9nPnM/1mfGXsVpxp02XOtenfCd/kFeiAHLM3E8txzqil3zs/jMdng85Yu8I0kmZ
	 JQZeYZuoKYR4EAogYd16fbuqFnMYr9hnFI9UTk7K7j+w3BdCfLPVm6YiRGPglFU6QK
	 36uc9cA6hmhJ5a9utKKm0LYMhgS/tDprx3Xfadx5tktACf7FGGgrCR2HHaaBR8E54q
	 cIkI4jy9nU+Gw==
Date: Thu, 09 Oct 2025 07:37:36 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20251009015839.3460231-16-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-16-samuel.holland@sifive.com>
Message-Id: <176001310599.1845440.13113067302880070823.robh@kernel.org>
Subject: Re: [PATCH v2 15/18] dt-bindings: riscv: Describe physical memory
 regions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_053739_192699_B24AE7E1 
X-CRM114-Status: GOOD (  15.72  )
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


On Wed, 08 Oct 2025 18:57:51 -0700, Samuel Holland wrote:
> Information about physical memory regions is needed by both the kernel
> and M-mode firmware. For example, the kernel needs to know about
> noncacheable aliases of cacheable memory in order to allocate coherent
> memory pages for DMA. M-mode firmware needs to know about those aliases
> so it can protect itself from lower-privileged software.
> 
> The RISC-V Privileged Architecture delegates the description of Physical
> Memory Attributes (PMAs) to the platform. On DT-based platforms, it
> makes sense to put this information in the devicetree.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v2:
>  - Remove references to Physical Address Width (no longer part of Smmpt)
>  - Remove special first entry from the list of physical memory regions
>  - Fix compatible string in example
> 
>  .../bindings/riscv/physical-memory.yaml       | 91 +++++++++++++++++++
>  include/dt-bindings/riscv/physical-memory.h   | 44 +++++++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
>  create mode 100644 include/dt-bindings/riscv/physical-memory.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/physical-memory.example.dtb: / (beagle,beaglev-starlight-jh7100-r0): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251009015839.3460231-16-samuel.holland@sifive.com

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
