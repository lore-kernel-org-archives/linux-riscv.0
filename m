Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BACC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 17:56:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAAE565101
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 17:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAAE565101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BPg6QDa6DAsNOSJ4sL3x4efXObTrdOyhCqGMo9icYQ=; b=LKEO66T2I0Yfp1CJUomVV0bv4U
	DUf1hP4Z8cH9DC/wWahFb5gphr+1P2C+tJdcjoL8PtTnLZYPjN/JxKtCgLLfwWBF0OaZerJkxGg4Y
	w8rdR+2DCZAIQvt+IGSZA14vV3P2jVoBuL9h4SX5V3aM8crLaDf6CwLWw46g1hx99oY0B+Pockz36
	2vYaIHNMOwR42aECZl++fOGplxFt0zuUxe5++bkONlkhdy+atAtAmGEk6nd5+HFxavHAgUK/j6wH3
	fmZ+8wW2/iab8A7Obtzxlz8xNDee3osgk4zDP9V1m9s9onh151W1v1bpGMwzQfnlhFU+uxpNRt/L9
	H+J8krmA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDvT-001UEe-ML; Tue, 16 Mar 2021 17:56:16 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDti-001TXN-9n; Tue, 16 Mar 2021 17:54:42 +0000
Received: by mail-il1-f174.google.com with SMTP id r7so13545399ilb.0;
 Tue, 16 Mar 2021 10:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=NkQ5GgQFc/YoK/N0gznOcS3i3bnLKgQpSfAaOAQnpB4=;
 b=gyI+a9RSTFpvg/8GUyIsi4QwOByqWhxfEfughABd6SLD0ZWQ6wkyxcYJ3447ux8AKz
 bgKGMraY8mb3jsIvHrWf8zIg2MbfbDjtcGa6kC+90r7QaiHAj7qbnpTtuwSaYuWsYEMP
 t6XS81EdS1fr8IRARsgjUdBzHmXT5C73qJumEuC1gQvlQfAR9vlff7OeQc3z6RmE5PhS
 IG5wriGGrRDJqHpPoC/b0fe6k6EHcjq1aoEEQ2U40xWKvxFYpNCFrXdJk85TIy4R4K/O
 vcaUbUIG/Awz4/YSU9Vg/V2xuLnnoiSItMhkNTBguPtVuRItOVyyk3+bZ6+qgpM1fom9
 FJXw==
X-Gm-Message-State: AOAM5332obdOCGxifVuwsqsNTh49IYmxNNCmapTWF/QwZ9HAaP+RvCPn
 dRqEbKgDL6Fy5qPTRYDX2Q==
X-Google-Smtp-Source: ABdhPJxS4LuvnNP7YIuCN0rhDra5QwrIwy0id/fLjLEHv7cot0FBcyYEg1H97tD9x5837opgVLDrPw==
X-Received: by 2002:a05:6e02:1d98:: with SMTP id
 h24mr5059134ila.88.1615917265039; 
 Tue, 16 Mar 2021 10:54:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k12sm9424772ilo.8.2021.03.16.10.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:54:24 -0700 (PDT)
Received: (nullmailer pid 3326125 invoked by uid 1000);
 Tue, 16 Mar 2021 17:54:09 -0000
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: linux-pm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Liush <liush@allwinnertech.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210316104140.878019-8-anup.patel@wdc.com>
References: <20210316104140.878019-1-anup.patel@wdc.com>
 <20210316104140.878019-8-anup.patel@wdc.com>
Subject: Re: [RFC PATCH v2 7/8] dt-bindings: Add bindings documentation for
 RISC-V idle states
Date: Tue, 16 Mar 2021 11:54:09 -0600
Message-Id: <1615917249.246376.3326124.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_175427_101423_A62A43F2 
X-CRM114-Status: GOOD (  12.79  )
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

On Tue, 16 Mar 2021 16:11:39 +0530, Anup Patel wrote:
> The RISC-V CPU idle states will be described in DT under the
> /cpus/idle-states DT node. This patch adds the bindings documentation
> for riscv-idle-states DT nodes and idle state DT nodes under it.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>  .../bindings/riscv/idle-states.yaml           | 256 ++++++++++++++++++
>  2 files changed, 262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/idle-states.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cpu-retentive-0-0:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cpu-nonretentive-0-0:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cluster-retentive-0:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cluster-nonretentive-0:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cpu-retentive-1-0:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cpu-nonretentive-1-0:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cluster-retentive-1:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.example.dt.yaml: idle-states: cluster-nonretentive-1:compatible:0: 'arm,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cpu-retention-0-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cluster-retention-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cpu-sleep-0-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cluster-sleep-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cpu-retention-1-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cluster-retention-1:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cpu-sleep-1-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cluster-sleep-1:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: 'entry-method' does not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cpu-sleep-0-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cluster-sleep-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cpu-sleep-1-0:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: cluster-sleep-1:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/psci.example.dt.yaml: idle-states: cpu-power-down:compatible:0: 'riscv,idle-state' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/idle-states.yaml

See https://patchwork.ozlabs.org/patch/1453810

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
