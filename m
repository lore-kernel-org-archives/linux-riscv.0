Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA559C5475B
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4JhkNWxCHQP3pV3RH8WCMCfzsUFNakftYpQTJGwvryQ=; b=lB0K+knQnS9YYwPpTBbqAEZmwd
	dCVKWdrT9tRm6a34fYlrKEw38GDckEisVh41Jrx3i+ZmbJoIIzN03RIK4QGGOaRyaCRploAlJQ7gn
	ttVfg0SScPjzVGR/iWpBj0vQnbgYU96aHzoqRSP9CDvTg7fBur8RxfmR1NAbeqhXIuoLkl7DqwAhy
	d4zX1gPXr6cLfyYSGjxwXF2Or8AEXSlD9zUuRt5yv553ipqVu7NayR92e1l7C0e2Pf16+Inqr45U0
	cvet4owpWCpUsym2opDYGtUAfXHpi35lgZfXwzmi1WofJ1N7+KDO1I4ZAcWupF6fxVC3Ms38srvZD
	1P0wMKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbYvc-00000006zyl-2QSq;
	Sun, 18 Feb 2024 04:37:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbYvZ-00000006zyK-3tcx
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 04:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 206FA60B2C;
	Sun, 18 Feb 2024 04:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C32C433F1;
	Sun, 18 Feb 2024 04:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708231040;
	bh=h3RWMSFzQ43bwF1fjlbqaQGi2ketXLn+Xpm4l+hTDYQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FFoCOLO2nWXkDFaFeqf7iq7bPS6dp4XgkEVvo+CvdSla1wdfuWD7noFAv+b0OyuVu
	 QikzkxPjJWE5YWA/wyUZ1sMziIkiBVhwQ0gRHbdO6zHhlHpyvihh36mIu9JKfO5SEA
	 BTUI9faQJE2Hf9RIPbCrmbwS0jUy9IsIbXPb5Nc7V5JzkOuLl7mOZodNdd7NLtTcQR
	 41xV7GvhgHqblRGyljpZH1t/NAn5/odhhFiTyaag+LDOlQ/ifhAH+sF3Bp9I67bXzm
	 Re2n1TMz26iQ+8fahRp++IhndRe9sIQxU7HENY7Hk3ah2oVz++gYok+fnQ6tnrZ+d3
	 G7/xILvay2+OA==
Date: Sat, 17 Feb 2024 22:37:18 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: haijiao.liu@sophgo.com, paul.walmsley@sifive.com, guoren@kernel.org, 
 inochiama@outlook.com, chao.wei@sophgo.com, devicetree@vger.kernel.org, 
 aou@eecs.berkeley.edu, conor@kernel.org, robh+dt@kernel.org, 
 samuel.holland@sifive.com, linux-clk@vger.kernel.org, 
 Chen Wang <unicorn_wang@outlook.com>, jszhang@kernel.org, 
 palmer@dabbelt.com, mturquette@baylibre.com, 
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, 
 sboyd@kernel.org, richardcochran@gmail.com, xiaoguang.xing@sophgo.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <0de0c16b9ff02a1b9c0d013ba0a71199e536387a.1708223519.git.unicorn_wang@outlook.com>
References: <cover.1708223519.git.unicorn_wang@outlook.com>
 <0de0c16b9ff02a1b9c0d013ba0a71199e536387a.1708223519.git.unicorn_wang@outlook.com>
Message-Id: <170823103463.3760729.17194959615041908023.robh@kernel.org>
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: sophgo: add clkgen for
 SG2042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_203722_040686_BA4F4B24 
X-CRM114-Status: UNSURE (   9.92  )
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


On Sun, 18 Feb 2024 10:51:37 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the clock generator of divider/mux and gates working
> for other subsystem than RP subsystem for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/clock/sophgo,sg2042-clkgen.yaml  |  49 ++++++++
>  .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 111 ++++++++++++++++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/0de0c16b9ff02a1b9c0d013ba0a71199e536387a.1708223519.git.unicorn_wang@outlook.com

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
