Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7265BEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpAHnDi/y+qM3wdX3AgJSFv3GOxKhoy/Q7HEYRf7ay0=; b=iQ4KALraK/2tY0
	9d94wYrTyazsk2xjmfWNq8rBRuqWxd0EGW1AW3PVmHuWlpGroJGhQP1j/Nykgfk80eoPu571GzfT6
	td1TMKG7WVgYR4rtx17XcPhZzcSZYB02lQ6GM66CCAAbxEA+6YPMg6qyLLLBEdZDwmZRvKOIL0enN
	Gv6+o0bfzIzyzg30W3ghiCnNxIy7mJOS2wsk91078y07D64rssplQraM3DlxXBYRPzhMePhh2CBRa
	96/Ncam22MqUOWrSmmgTiNGNkDxt87yBLKyiVGiZWw0tFUfn3zuhJMhcjKCD+TqEcgU67GSB4gaf1
	SXzmhAPbFFnOMJU3wsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUvx-00BQkr-2a;
	Thu, 20 Jul 2023 14:47:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUvt-00BQjv-2L
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 14:47:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5410C61B1D;
	Thu, 20 Jul 2023 14:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC089C433C8;
	Thu, 20 Jul 2023 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689864427;
	bh=OWSNdJ6+UGJVWhcZZSiyF3kHUOtArl1NIXk74sceGqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YoOzAfYBCM9JRb0ii9wk1NL308dgPR4vXqffEy+S64E2B2wD+TKjqBJCZG+x85XHt
	 0jfuD1hJ82NVMI1Zlt+SDRPA7T65rEe8ww+a6Pg6djAppTLBFP6V0GjK3h4apJiZn8
	 sMHh2zuwAWKUB234AhlPqz0atBXPScPEoB/LF7CnDUehI7Vd+WzShziOZCUJ496+7e
	 hP0R5KoLZPRVlcAFxc3dp5vMqqPkI9YiMGM7zFjBbLSIywYiGrU8zkUDOsi1r2zo0g
	 A2ycJh4EPaklOfC6pf34ZQBUbmlQqGprEA1yjNwwyjgBjzey06mh7zLjL/q5nq2gQt
	 9NuuRS+wpsLPw==
Received: (nullmailer pid 2635378 invoked by uid 1000);
	Thu, 20 Jul 2023 14:47:04 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, zong.li@sifive.com, linux-kernel@vger.kernel.org, Nick Hu <nick.hu@sifive.com>, vincent.chen@sifive.com, linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, peterz@infradead.org, greentime.hu@sifive.com, will@kernel.org, palmer@dabbelt.com, conor+dt@kernel.org
In-Reply-To: <20230720135125.21240-2-eric.lin@sifive.com>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
Message-Id: <168986442455.2635362.6562546888592020035.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private
 L2 cache controller
Date: Thu, 20 Jul 2023 08:47:04 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_074710_060227_72F64FA1 
X-CRM114-Status: UNSURE (   9.43  )
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


On Thu, 20 Jul 2023 21:51:19 +0800, Eric Lin wrote:
> This add YAML DT binding documentation for SiFive Private L2
> cache controller
> 
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Nick Hu <nick.hu@sifive.com>
> ---
>  .../bindings/cache/sifive,pl2cache.yaml       | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/sifive,ccache0.example.dtb: cache-controller@2010000: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/sifive,ccache0.example.dtb: cache-controller@2010000: 'interrupts', 'memory-region' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l2-cache: 'l3-cache' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.example.dtb: l3-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'l3-cache' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l3-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible:0: 'sifive,pl2cache1' was expected
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: compatible: ['cache'] is too short
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-sets' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'cache-size' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.example.dtb: l2-cache: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230720135125.21240-2-eric.lin@sifive.com

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
