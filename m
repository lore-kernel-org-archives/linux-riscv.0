Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2AAC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 12:19:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1177260F58
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 12:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1177260F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrdZMtJF2+g7W3ERPPyvA81I5+XXatoCvVJ9NvoP6Nw=; b=wCf2dSILJUXrpR
	a3pgrtSh5SXw8B9k/XIKx2d2t7tLGFp2/hbxWDB2sZ4fTIBPTUHJ8AMa19+O7fNdJ7JioG95DJOdI
	0WJh7Lu9eZkdiNJjl3waYfMLy9moqBWtsxmhFnGP3pxIX9bY/KK+uo4WRBX/W/6WLn8Yz7iOlPvzt
	kbGNxS2ZFD7lHcppm4yoy2zhPzsGRVZmJSgRy9WqqPXZdyyhmHQTJ7bdZltSQdyadhccqtadsxOxG
	03DM9U3D2SJ6u6FUBbTARSZb7eThS5eWi0WWtubLN0TFinpANLOuJPbtAlhf7iSJPufY+4sDSUcxH
	yBcI382wiWReTwBaO9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPkvE-001ZTP-H2; Mon, 13 Sep 2021 12:18:52 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPkvA-001ZS5-VP
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 12:18:50 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so12993194otf.6
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 05:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=yAANwLMWDLEO6I7ZRYD4RFaA1eZZfYg/uLblDuOz8Iw=;
 b=vuDzSTkJaZcnk+0KBQsLZjFMDhJ1wrmS/qxvgdRoP6Pf102TIYnUJbJGl012mGPrxQ
 2YmliPl2btdh8XOESi8flh1doKhZ+Uf3BaiAlwxz8lziaVDLn6++yBb/t5LIOt6TAvK7
 N8VrEPCjHoEvgPvTR3qqhfgIgqi+zjjUzvedY7KHS9FfKNpqMQdsryGuMHFe10mZk98E
 2IadXJLmAduj20UHYxzN53UDZFaB/4qXSjUfHGLOsy0pT5Zi8gvxLEs4GajtLlPdnP18
 rbsQtPQQVP82imimsS6rwGdujAnnDI9SCUWd/CKZKzDwV7DWitcNNVemzliN4e8N7IFG
 ASsg==
X-Gm-Message-State: AOAM531RhrUQYjq7hXXwq8J9VAuKp82hdV9C/QNaQ8Ycymim8gb7jBOZ
 Mgz+2MJiWz3seNgHwvOohw==
X-Google-Smtp-Source: ABdhPJzYnMEYkbxkurS4PpZO/QSrg41SFbZti1sBP50QH1OMY0W6b4aKzKiENjcLtUjXkbrnVoCMkg==
X-Received: by 2002:a9d:36d:: with SMTP id 100mr9346988otv.237.1631535525388; 
 Mon, 13 Sep 2021 05:18:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h3sm1800959otu.7.2021.09.13.05.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 05:18:44 -0700 (PDT)
Received: (nullmailer pid 444714 invoked by uid 1000);
 Mon, 13 Sep 2021 12:18:43 -0000
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup.patel@wdc.com>,
 linux-doc@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Rob Herring <robh+dt@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, John Garry <john.garry@huawei.com>,
 linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>
In-Reply-To: <20210910192757.2309100-7-atish.patra@wdc.com>
References: <20210910192757.2309100-1-atish.patra@wdc.com>
 <20210910192757.2309100-7-atish.patra@wdc.com>
Subject: Re: [v3 06/10] dt-binding: pmu: Add RISC-V PMU DT bindings
Date: Mon, 13 Sep 2021 07:18:43 -0500
Message-Id: <1631535523.169353.444713.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_051849_063415_3E468A19 
X-CRM114-Status: GOOD (  12.04  )
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

On Fri, 10 Sep 2021 12:27:53 -0700, Atish Patra wrote:
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

See https://patchwork.ozlabs.org/patch/1526606

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
