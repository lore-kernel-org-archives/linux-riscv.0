Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A601C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X3/IdsjZ8qPonvP9pcz+sRL5eI/ju2H7Js6OxOacPvE=; b=gqEhaTEkYYHMxYl7P+Id3xrgFW
	ZiVK3dN3wqN1/EWPtv2mBH7gjD6FoKfO5xWIfaiqzssm78IMI1apCrJlibI+dweboFnNEs9EPsvew
	Iq5JNKCi/FLo18lEbIR+hsKPfx1Ry8XqvjXvl2LvTJUr6ol2+obapWV+brA4lHJAou4lI7PpakWJ4
	ONb8V8OL7CxLxA8xZRHy6J876DFLC2UoxUxOhnDFKbgZQcCVQaExSRlqnrZ3fUhJN8E+JRfU6wqyC
	6yvxlRq0lWXle3w3j9xxOvcmGvsSxNgerx5isfWgZzfOjMEgrek5qkkDBs2Mke7KXCuIgnBRXs255
	ZIuUPPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8gI-00000008mGe-3kj4;
	Wed, 29 Jul 2026 18:07:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8gI-00000008mGP-0Wlw
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 18:07:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8EC043D9A;
	Wed, 29 Jul 2026 18:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6220A1F00A3A;
	Wed, 29 Jul 2026 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785348421;
	bh=GxH/r7+adCfOo3v2pAd+rEyUjiBUoOm+f3CHIqF+c3M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FIoeCB4OiM6hKu3j9xG+F9sYFXH4FYo1vOy/tJDbSeMVrp53n+5J4sNJyuSNdfWSL
	 dYrU91KJ+PC+Shxlr7lVoN4V6ud4/0xUulDk/w7vKNW2rbnYDjqUL/wTa9V/zszDg7
	 UtG5708Wh1Vt6Mx71ym6W5n0RphL++edE6KtXAL7LxDp8+m5N1entN+h//1x0+Hmv+
	 773PCW4LLjTfgZyHp/cZzYV+rSzb8XOt2v/1L7E4H6KUvY4NNyXQsHXd3f38Hlbkv4
	 RkcH9shNJmm8xep3Djaq9/NHvkWoWg/ampFYdnrH0DI+go97qlUk1rrTXQ87bPJ6BC
	 MyREDatYZxdLQ==
Date: Wed, 29 Jul 2026 13:07:00 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: guodong@riscstar.com, pjw@kernel.org, zhangchunyan@iscas.ac.cn, 
 conor+dt@kernel.org, greentime.hu@sifive.com, robin.randhawa@sifive.com, 
 dfustini@oss.tenstorrent.com, raymond.mao@riscstar.com, 
 dave.patel@riscstar.com, pincheng.plct@isrc.iscas.ac.cn, 
 linux-kernel@vger.kernel.org, darshan.prajapati@einfochips.com, 
 linux-riscv@lists.infradead.org, junhui.liu@pigmoral.tech, 
 akpm@linux-foundation.org, dlan@kernel.org, jim.shu@sifive.com, 
 devicetree@vger.kernel.org, luxu.kernel@bytedance.com, krzk+dt@kernel.org, 
 zong.li@sifive.com, anup@brainfault.org, michal.simek@amd.com, 
 scott@riscstar.com, alex@ghiti.fr, samuel.holland@sifive.com, 
 aou@eecs.berkeley.edu, pawandeep.oza@oss.qualcomm.com, palmer@dabbelt.com, 
 nick.hu@sifive.com
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
In-Reply-To: <20260729163908.249838-4-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
Message-Id: <178534841831.3259884.2854898669055783798.robh@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
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


On Thu, 30 Jul 2026 00:39:08 +0800, Yu-Chien Peter Lin wrote:
> Add YAML binding schema for the SiFive wgChecker, a programmable
> access controller integrated in the interconnect fabric of RISC-V
> Worlds-capable SoCs.
> 
> wgChecker enforces World ID (WID) based access control on downstream
> bus transactions. Each checker slot encodes a 2-bit permission field
> per WID (read/write), enabling fine-grained memory partitioning and
> device isolation between execution contexts. Violations are reported
> via bus errors, interrupts, or both, selectable and lockable per slot.
> 
> The binding registers wgChecker as an access-controllers provider.
> Consumers (i.e. its protected device) reference it via the standard
> access-controllers phandle to declare their access requirements.
> 
> Also document the sifive,trustedwid property for the /cpus node,
> identifying the privileged WID authorized to configure all checkers
> on the platform.
> 
> Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
>  .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
>  2 files changed, 365 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sifive/sifive,wgchecker2.example.dtb: uart@1c1000 (ns16550a): $nodename:0: 'uart@1c1000' does not match '^serial(@.*)?$'
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
Documentation/devicetree/bindings/sifive/sifive,wgchecker2.example.dtb: uart@1c1000 (ns16550a): Unevaluated properties are not allowed ('access-controllers', 'reg-names' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260729163908.249838-4-peter.lin@sifive.com

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
