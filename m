Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D45C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 13:37:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C527B60E8B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 13:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C527B60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJFgR/hspYYhUJ9jQ8Y0xsg1pjXuYtOelLxCjsyuFbQ=; b=nBYlAqis8KTZyO
	A5wOZRFXv9O7kKZ+s4vK9bw9+sBbBJdbs2mETw8kMvUDtsJFhDICv9aYVYyZRlFT6wxRXNMZO8QmN
	BkR1WQvNPz5n9fhB7XdUZJazRoU55/2sg28aTfbzJ144UgEv7WjLwMazMlvOe6gH1GDpJc286xuQf
	CkC51rvAY+wTHIu8dFXWwGosqDoo7oRj5lR8DMf4g7CglZxMSgPyLWBSfKOiysGukMAXz9jzfK7LT
	QBLwnwi8VbuWeQmZV4YMZ5DZmh0HkAuLycwCRAlJI47JGQHjrKCxP7qlXPnCVcYVxDQK9tIK6NgPD
	iJv+kM8Ep5b3LzZ0hKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvUJ-009Xr6-6n; Mon, 11 Oct 2021 13:37:07 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvTd-009XZL-T3; Mon, 11 Oct 2021 13:36:27 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 u20-20020a9d7214000000b0054e170300adso21637209otj.13; 
 Mon, 11 Oct 2021 06:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=1pi40TIcKotkV6rxOevddDOHbAMj+lS14ZHs3z6ayJg=;
 b=BjrgphFL1VyoKP56vJn1w3DPL8RYopkGvROwD72d0bvIctRDYk6hdNJsHcw+w3kRor
 hz6n9h5QBqcrociWDofM0W/teKD5nj678qA7ywBRRYAO9IepzFuilWtFlZLTzKf3o7AY
 iZK5gqshTgcES5xzO0S8RbP24ng13/QUIKlGz8YKn8Hd5ph/gmf0ijSb7qrJrnFsx8vQ
 9Vsc154+RBF3a4qTx2XvWYyT5qqWZH1HCwdDvdwiz94xvaPA4VyOo7UBcocKmzGEflW1
 5WOXugACpCwfpGWUh3ljVhu8jFLjwudYrMUmIvSb081GlIecC2OIygFbP+iM0zkj9GNu
 soxA==
X-Gm-Message-State: AOAM532ppCcwLx14CltJD5oME5FwKQ2GOeBLnk9S7GxKPpv3RlzADp+F
 /YwXx250VqZKUU28ptiLkg==
X-Google-Smtp-Source: ABdhPJwCnGSJxyh6fwYssOa8zYwCnn8BcBhPCI+XeOvGYCYE8QJxZ2s1XOnwdrLFg8s4OhTg7uI/aw==
X-Received: by 2002:a05:6830:3486:: with SMTP id
 c6mr20994134otu.101.1633959384440; 
 Mon, 11 Oct 2021 06:36:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l9sm45795oie.15.2021.10.11.06.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:36:23 -0700 (PDT)
Received: (nullmailer pid 504942 invoked by uid 1000);
 Mon, 11 Oct 2021 13:36:18 -0000
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org,
 Sandeep Tripathy <milun.tripathy@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Liush <liush@allwinnertech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
In-Reply-To: <20211011081820.1135261-8-anup.patel@wdc.com>
References: <20211011081820.1135261-1-anup.patel@wdc.com>
 <20211011081820.1135261-8-anup.patel@wdc.com>
Subject: Re: [PATCH v8 7/8] dt-bindings: Add common bindings for ARM and
 RISC-V idle states
Date: Mon, 11 Oct 2021 08:36:18 -0500
Message-Id: <1633959378.228904.504941.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_063625_992004_E1F834F1 
X-CRM114-Status: GOOD (  14.12  )
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

On Mon, 11 Oct 2021 13:48:19 +0530, Anup Patel wrote:
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
>  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
>  .../devicetree/bindings/arm/psci.yaml         |   2 +-
>  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++++++++++++--
>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>  4 files changed, 219 insertions(+), 19 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpu/idle-states.yaml: patternProperties:^(cpu|cluster)-:properties:compatible:oneOf: [{'const': 'arm,idle-state'}, {'const': 'riscv,idle-state'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpu/idle-states.yaml: ignoring, error in schema: patternProperties: ^(cpu|cluster)-: properties: compatible: oneOf
warning: no schema found in file: ./Documentation/devicetree/bindings/cpu/idle-states.yaml
Documentation/devicetree/bindings/arm/psci.example.dt.yaml:0:0: /example-3/cpus/idle-states/cpu-power-down: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cpu-retention-0-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cluster-retention-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cpu-sleep-0-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cluster-sleep-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cpu-retention-1-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cluster-retention-1: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cpu-sleep-1-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-0/cpus/idle-states/cluster-sleep-1: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-1/cpus/idle-states/cpu-sleep-0-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-1/cpus/idle-states/cluster-sleep-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-1/cpus/idle-states/cpu-sleep-1-0: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-1/cpus/idle-states/cluster-sleep-1: failed to match any schema with compatible: ['arm,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cpu-retentive-0-0: failed to match any schema with compatible: ['riscv,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cpu-nonretentive-0-0: failed to match any schema with compatible: ['riscv,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cluster-retentive-0: failed to match any schema with compatible: ['riscv,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cluster-nonretentive-0: failed to match any schema with compatible: ['riscv,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cpu-retentive-1-0: failed to match any schema with compatible: ['riscv,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cpu-nonretentive-1-0: failed to match any schema with compatible: ['riscv,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cluster-retentive-1: failed to match any schema with compatible: ['riscv,idle-state']
Documentation/devicetree/bindings/cpu/idle-states.example.dt.yaml:0:0: /example-2/cpus/idle-states/cluster-nonretentive-1: failed to match any schema with compatible: ['riscv,idle-state']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539173

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
