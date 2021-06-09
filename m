Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F814C48BCF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 17:12:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 365DF61376
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 17:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 365DF61376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cekdrZ6uow13JP5b8yzOrKOUqFFZVCHFLHHL/a0HxSE=; b=KtG1ld3p1zDOEt
	bFeJOed0o1BHl2fgADUxqv6eYNujWhO42b7yZ5mfbF21B73IKbFOltukeTntJ0+t0H6Yur3ym2OPy
	JFnV/+IHm4yLkPctHLo5PTYK0UbYUBL/LKUsWe+CqVairuCn7DAgKO5rCUmx2oCA2GKyqADtOeM0q
	WjMAwaK8p1giteXRnLg1YfvedzvCEqkVfJpMH3Irlt0Yya4YId4K53bpCau2BY/J/iJWNWo8wquYH
	gDeh6jafWLyBKd1rT1gzVkuzhFpE46etWknt0ovUFRfuzTAKMJoe4A9PtDBmgocrteFzjabr1hikO
	V9+FIR4B+NCox+Ud4PSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr1ke-00FDc2-Co; Wed, 09 Jun 2021 17:12:24 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr0sw-00EqwS-Pa; Wed, 09 Jun 2021 16:16:57 +0000
Received: by mail-oi1-f171.google.com with SMTP id a26so4902997oie.11;
 Wed, 09 Jun 2021 09:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QqWyDoHhoXoYqgs2T5kEgvQV6Y0xJvZ2rX9HVCOuEYs=;
 b=EKpjJS/XPWdmd2q5e1W7p1kmHenTN5RsPZekWowTs+yyQfEFKwYmn2AwWmPbfFZv8g
 IDHWnEVwSLPs8bqobfBA8+D0h0Tr1zS4GrnOMGtJjU3HgIcT0GiKkxfuRH3dtHrdgXk+
 eECKLEgRcJuefSQFkc1uDyGLYweNncB9O0Nce12GRCDY6pJ5qRdONw/zihXMgk983lRi
 aqtjxSwi9CIFeihepfqAjMpR8svmSCHDtSaq6eZ4wBO5b5dLsdmMGYSYVmxcN7DSmvqK
 UI847L+V9FtOBb3tb067ckgsT0bbAdL1UhO138ktR3/OFkskV2HuzBgiqMPbwVpuYD/g
 1xcw==
X-Gm-Message-State: AOAM531JxbL+hHM+n22UW2PPnwPcQB7Vx8ovqdTfHJbq0rSKfHfTFGoj
 6FLk9uUMFxiKNGn2KDMvfQ==
X-Google-Smtp-Source: ABdhPJzsAd6hH99fyWkSdFSubrSBtcEU6Syfei/UK9V4M+8nsK/xgWCP3h2i6sLExsfayBEMCekg5w==
X-Received: by 2002:aca:3e06:: with SMTP id l6mr270687oia.147.1623255412952;
 Wed, 09 Jun 2021 09:16:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i15sm86906ots.39.2021.06.09.09.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 09:16:52 -0700 (PDT)
Received: (nullmailer pid 3763296 invoked by uid 1000);
 Wed, 09 Jun 2021 16:16:43 -0000
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-riscv@lists.infradead.org,
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Atish Patra <atish.patra@wdc.com>,
 linux-pm@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Rob Herring <robh+dt@kernel.org>, Liush <liush@allwinnertech.com>,
 Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20210609122715.3389-8-anup.patel@wdc.com>
References: <20210609122715.3389-1-anup.patel@wdc.com>
 <20210609122715.3389-8-anup.patel@wdc.com>
Subject: Re: [PATCH v6 7/8] dt-bindings: Add common bindings for ARM and
 RISC-V idle states
Date: Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.618479.3763295.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_091654_872521_60A1E170 
X-CRM114-Status: GOOD (  13.98  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 09 Jun 2021 17:57:14 +0530, Anup Patel wrote:
> The RISC-V CPU idle states will be described in under the
> /cpus/idle-states DT node in the same way as ARM CPU idle
> states.
> 
> This patch adds common bindings documentation for both ARM
> and RISC-V idle states.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++++++++++++--
>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>  2 files changed, 217 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:

\ndoc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/idle-states.yaml
Warning: Documentation/devicetree/bindings/arm/psci.yaml references a file that doesn't exist: Documentation/devicetree/bindings/arm/idle-states.yaml
Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt: Documentation/devicetree/bindings/arm/idle-states.yaml
Documentation/devicetree/bindings/arm/psci.yaml: Documentation/devicetree/bindings/arm/idle-states.yaml

See https://patchwork.ozlabs.org/patch/1489849

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
