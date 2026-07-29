Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B06AC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ySZs7Yhr17JDgi8WcGKqlCBW1y8qGWHNZXcK3J1NWmM=; b=44OkgAhKjmMhYhR+pr5M4ciDU9
	UDRsPaaWBsF+4p4Y96TBZD5fAeKx6LDMdK5cmxrdTY7dfnkGLvJJS7UtaVbx9IIFSM3EiThfF4Ijo
	piukfayBuduvtjZYdxcQA7a/fskR2mr5oVf/3cfBFbEZ2wjYCh0nYy6cpnXzjfGcoydPu4U6KzVFB
	88Qu8cec+6AZAazX5vtJfM0pGnUreoMTViDtPDnpZdRGk8WuaNqAUG9Ox0Pnaq5xzkkC+zuNQaHKJ
	Aouo9Y6aKdX4ulgId8p45ORvqelgCLegLjGqZkPxbFOqo/woalljnkfAXWTFCgUaW3yaxFy5E/iZ9
	uIwlRrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8gI-00000008mGa-3ORW;
	Wed, 29 Jul 2026 18:07:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8gH-00000008mGO-3Xtv
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 18:07:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EDAF26001D;
	Wed, 29 Jul 2026 18:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FA11F000E9;
	Wed, 29 Jul 2026 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785348420;
	bh=LfVo/5pspi7nSOnwGr07fdJGZ3XUZxg5tX6GJjgn0I8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Oy3WZX3V8SgdlrdI9eD0k11Icsgg9aRKtE0lgNAZElHusC8aqnRKu3bzFh5wstaSg
	 5qAYdcZTLLWFGcpyFjiu2hzT8yRTs/cohj6Y/xs5HT+AbplhWHrCOJ1uoXwQxOy9BX
	 xWAqHsdYqKZeTnc8C85Fq55kEXkPiEINKcmD9bYxJ0WEqo28no+28dwdQBo053mCVG
	 QugWGcWlkrh/PjVv2Fw+vatfxsbWvExc+HyqGYRG+1S4YPVBM4bC8mI5qxnxhpmVX1
	 TB7qbWEHGUmBoogwWEOCxJ4D4Czwg49oLfRRdd/jFLyBkWXwpM3jl5iDHUMaAEcp8f
	 T8GzYgbhrdvLQ==
Date: Wed, 29 Jul 2026 13:06:59 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: anup@brainfault.org, guodong@riscstar.com, 
 pincheng.plct@isrc.iscas.ac.cn, alex@ghiti.fr, aou@eecs.berkeley.edu, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 michal.simek@amd.com, dave.patel@riscstar.com, pjw@kernel.org, 
 linux-riscv@lists.infradead.org, zhangchunyan@iscas.ac.cn, 
 raymond.mao@riscstar.com, palmer@dabbelt.com, greentime.hu@sifive.com, 
 dfustini@oss.tenstorrent.com, luxu.kernel@bytedance.com, 
 conor+dt@kernel.org, akpm@linux-foundation.org, scott@riscstar.com, 
 jim.shu@sifive.com, krzk+dt@kernel.org, robin.randhawa@sifive.com, 
 zong.li@sifive.com, pawandeep.oza@oss.qualcomm.com, nick.hu@sifive.com, 
 samuel.holland@sifive.com, darshan.prajapati@einfochips.com, 
 junhui.liu@pigmoral.tech, dlan@kernel.org
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
In-Reply-To: <20260729163908.249838-3-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
Message-Id: <178534841698.3259786.10094204605740986474.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
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


On Thu, 30 Jul 2026 00:39:07 +0800, Yu-Chien Peter Lin wrote:
> Add per-hart DT properties for the RISC-V Worlds architecture:
> riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> platform-defined values are primarily used by M-mode firmware
> to configure World ID CSRs and restrict WID usage across
> privilege levels.
> 
> Also add schema validation rules to enforce valid property
> combinations based on the ISA extensions present.
> 
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 61 +++++++++++++++
>  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260729163908.249838-3-peter.lin@sifive.com

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
