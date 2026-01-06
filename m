Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AAAC47BE2
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NgC8nSmfW/ZSiQIj6Lmjt9BG/ajLX5eerfNs7YqaSeE=; b=Fz8isCNjnAhktMp1Wz+boWGFMG
	ykpuSYEVxdKsRRi2b0TXcNrSQtB1QgkUSdl2H4JGx/ZZwNvF90te0DjLbdWHJ2ksuZr0mvZkTjExX
	ees8rt47QNOEsXpUMfIl7SQPQsiXrIEx0cetGmJR18GsT7ayX8WVV+nsA1Cc2yqwuMY+0l1uFHWuj
	8eZtmMFSX6rF7b0GAkTbDGabPjItc7jfEZxH1itb02WmMZ9U5cz9PguokDWhcxlE6262WSNZH/QZD
	PQ6b4TFOV8SwODdwcf1GwLpP4r0stdtjvWiRxLYdrERTT2pnRJ62s4r20n4xxUt6XYgvE0UyGsTrY
	aXzG5GWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4cr-0000000CpKB-46Pp;
	Tue, 06 Jan 2026 10:49:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4cp-0000000CpJK-2CGv
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 10:49:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB84343AF0;
	Tue,  6 Jan 2026 10:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778BCC116C6;
	Tue,  6 Jan 2026 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767696558;
	bh=Xb+h5SYWWvSkRROTlUNDQfcSyzPkTdiaZXJudKyt/vs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=a8JEB5pQYJ3qSa/sAUCsQA7nnQdcSlB7apzjxcN6PLujcME5h/9mXw2AHYMWsSnh+
	 2O2EGX3V5n9r3ub5Q0JWJQJA9OmtoqjCcnwXCOyfkc4CiJ0wIhFpaL+z9eb1aNZ8pL
	 XPeqyYpLqxJ+iQjH65Ui1fUs4H00hGhTEd2UiDxey5E8/FihsdMRMrgkBaDcNO371N
	 Y23tR7ERbOFXOPTDXYQKQv7w85g1LqCWLLbsvrbBaTVjeFS23ySlK/G6zlyU1jjHYI
	 D03iDAPjdFW9fJAqH0mdbaD5RlIRzMOjMn1mUrv3j+xOtkdpVe5cuc4DAXTaqEPu09
	 oHiIEPJsQuwlA==
Date: Tue, 06 Jan 2026 04:49:17 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, andriy.shevchenko@linux.intel.com, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 viresh.kumar@linaro.org, linux-riscv@lists.infradead.org, alex@ghiti.fr, 
 aou@eecs.berkeley.edu, sboyd@kernel.org, palmer@dabbelt.com, 
 krzk+dt@kernel.org, rahul@summations.net, rafael@kernel.org, 
 darshan.prajapati@einfochips.com, anup@brainfault.org, cyy@cyyself.name, 
 jassisinghbrar@gmail.com, michal.simek@amd.com, charlie@rivosinc.com, 
 pjw@kernel.org, dfustini@oss.tenstorrent.com, leyfoon.tan@starfivetech.com, 
 conor+dt@kernel.org, jms@oss.tenstorrent.com
To: Joshua Yeong <joshua.yeong@starfivetech.com>
In-Reply-To: <20260106092117.3727152-2-joshua.yeong@starfivetech.com>
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
 <20260106092117.3727152-2-joshua.yeong@starfivetech.com>
Message-Id: <176769655757.1087310.16557649549419031766.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: firmware: Add RPMI performance
 service message proxy bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_024919_581698_1ADC1654 
X-CRM114-Status: GOOD (  11.82  )
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


On Tue, 06 Jan 2026 17:21:12 +0800, Joshua Yeong wrote:
> Add device tree bindings for the RPMI performance service group based
> message proxy implemented by the SBI implementation (machine mode
> firmware or hypervisor).
> 
> The RPMI performance service group is defined by the RISC-V Platform
> Management Interface (RPMI) specification.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../firmware/riscv,rpmi-mpxy-performance.yaml | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/riscv,rpmi-mpxy-performance.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "riscv,rpmi-mpxy-clock" found in schemas matching "$id":
	http://devicetree.org/schemas/firmware/riscv,rpmi-mpxy-performance.yaml
	http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
Documentation/devicetree/bindings/firmware/riscv,rpmi-mpxy-performance.example.dtb: /example-0/performance: failed to match any schema with compatible: ['riscv,rpmi-mpxy-performance']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260106092117.3727152-2-joshua.yeong@starfivetech.com

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
