Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F02EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 18:03:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52B160EFF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 18:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C52B160EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RgJXqqldmnmWJicGIZ/bCa4/mAD8/OMnD8Jc7CJYQM=; b=GeCAcOgBRcVKGx
	1r1DjAWpo+sPCQX0cXdnYcuXWfrfpUc7pYim/wxATA3e5BSzLEqewZKHh8OhGNopJ2WUAK1axph+k
	23kMk1+zYkpqQBtV+b1SMVbcHvTYpOxqiDVlXRw3oGWFLp1YPBUYbDq5kKkifBYGb3rLeXUN1bwCc
	YZJhfXbbw6vBsJ2naQEXgO9dt+MbxsdNeGoUBhPtseyDAalVZVqBfqezGbYABa2fzb0y3Ee/VTeQD
	bl8wBQAKhZHej0wAgZosETfL+7fp7JWsBl0MDvKbpqLuP1PhH5Vt6p2d2E2PrXYKmrLkcf9+Ptdyx
	GuJKMeQyRiIGR+h7X0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfQnb-002hkQ-7t; Tue, 26 Oct 2021 18:03:47 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfQnU-002hgJ-Fo
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 18:03:42 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 w10-20020a4a274a000000b002b6e972caa1so1535oow.11
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 11:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=MYaZzPsql9ylVu0bAh9A9jNKkz/9F195FCssTtA7QOA=;
 b=p0jecnXBpG3o6R49q2O6s/dXrD6lbU84dZ4bd0gkBRkYTfd2buptG+kcLV/9QWjjAo
 9wwnM96BoGpUClA6p4G+I7XAUn5o4WVgav2mJteweAlRjzj0IFLYtJET4L8GK6aw8VvW
 zQqcYZ/jMGkfcw2QTQtfM6z/OSbOGiE0lszqB8COP9LEE3C/Dsu1z/VhfCfa7esN2/iL
 QjFZSU46+nvp+Y92s3Y8tN5ztqXooeU+xQHAruB7QNlQXTH55pNlsNZ/cWxw+y/Atz6P
 JrmXmdf1Q1XCDa79xkaqJI4vrSFSDEv6Hl6ImjTd9wOaAOOXwBHt73zqX/S1vCrb8yIv
 EZXw==
X-Gm-Message-State: AOAM531qL5bIje0iHiOfjj46sZS8P/V3L/smMgRR8wia5Y3RKIngxG3y
 IRDzCZKY81vB2yICvSEg+Q==
X-Google-Smtp-Source: ABdhPJxjWOBTKuVo96eUaTsi5lRNizXIavvqz64LU5NRPwTjcl0iUd+GSv9jSGpt9Yt4n83bnz5g1Q==
X-Received: by 2002:a4a:b109:: with SMTP id a9mr18430444ooo.73.1635271411807; 
 Tue, 26 Oct 2021 11:03:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a13sm4761104oiy.9.2021.10.26.11.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:03:31 -0700 (PDT)
Received: (nullmailer pid 2939410 invoked by uid 1000);
 Tue, 26 Oct 2021 18:03:29 -0000
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Guo Ren <guoren@linux.alibaba.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 linux-doc@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
In-Reply-To: <20211025195350.242914-7-atish.patra@wdc.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-7-atish.patra@wdc.com>
Subject: Re: [v4 06/11] dt-binding: pmu: Add RISC-V PMU DT bindings
Date: Tue, 26 Oct 2021 13:03:29 -0500
Message-Id: <1635271409.185787.2939409.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_110340_564417_1B93DBB0 
X-CRM114-Status: GOOD (  12.09  )
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

On Mon, 25 Oct 2021 12:53:45 -0700, Atish Patra wrote:
> This patch adds the DT bindings for RISC-V PMU driver. It also defines
> the interrupt related properties to allow counter overflow interrupt.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/perf/riscv,pmu.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/perf/riscv,pmu.yaml: 'optional' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/perf/riscv,pmu.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/perf/riscv,pmu.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/perf/riscv,pmu.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/perf/riscv,pmu.yaml
Documentation/devicetree/bindings/perf/riscv,pmu.example.dt.yaml:0:0: /example-0/pmu: failed to match any schema with compatible: ['riscv,pmu']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545970

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
