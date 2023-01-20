Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4A0C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHSTjqsBcmxthtE7r1NWiJ8yN562qF7JsJ8582J6ic0=; b=wGw5zmCadD0tR/
	MBn5JJ0wfiSykU9IMloSsGPfmDPXt2fh753rOOax4TAslN6XSFfLEHdlmtboSRNFFPypZ1Gfrg7DI
	Gblhb4DZBJWnYQg81rx5h4Vw07bA8BOo6cl1SgbFEJf7tVvprD7biZTOEajvQWRLdg/hVLj4Q6wsA
	7qfZZRlmVv9K+gTahNQ2CtfSMWfei06Xm3yHZlS3FPwE5yVIDFo+lOhArc78CQ5cOJ0G/ssylUyfE
	7zNvCa0mW5qWgYx8BhwTbFI+IgXLc0ppk05XFo+lQXjV1NX3d4YmGdJA3zEVbbrgpT1C+RzBfk3WN
	xa+N4740gg34OKtWGj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvCG-00BakF-3n; Fri, 20 Jan 2023 17:29:00 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvC0-00BaYV-E7
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 17:28:47 +0000
Received: by mail-ot1-f42.google.com with SMTP id n24-20020a0568301e9800b006865671a9d5so3470201otr.6
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 09:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9HSgCQCxDRt/ES8CSO81S+bMV2W0e0O/4hQkm1CKfbA=;
        b=IBnCSJzW5T/MFLl468CxEZ8Kp1kfgeZByLi8JW0Vz7voqOIC5zk7L6TSJj/JcbHjqg
         xbzphhw6ZNV6FjPuSUEQFi3PKgdsScRFdKv4/lbRbLKdp/R+1LZCOcq90ppdokSbaiDf
         rmcdgb7U3eG0AxEUkKjBpdHFOa4ZaaP63DAUJfl28y3jVABFf8T7+XagPHfFYieBtTU/
         yy9LbK4YQmpJb1ZooynuiZMLOtOQY5yyNiroPMwQj5ktDaUaruycSS31dFtym7d2+fE5
         c9+JZjrdm+cSWP5AvydDBYMu8HHbHMbJs8uniZZvKmCUfNIsAPi7pKhM7UoPHs2KnPpg
         E0ew==
X-Gm-Message-State: AFqh2kq2FviuK61yvJ4UQFnR5UaA//0duNWoKKMxG155hjRRsWoWBfMq
	bso5LoMbzvNsMv4dc5bjGQ==
X-Google-Smtp-Source: AMrXdXs87XWf1uJ29pt4F76PCQm1VpwDoqJpVdMTPVfzjFv4uCqY7pHkuEjoheseeck2vFnJTqwQuw==
X-Received: by 2002:a05:6830:201a:b0:685:85bd:3fc9 with SMTP id e26-20020a056830201a00b0068585bd3fc9mr7086097otp.36.1674235722043;
        Fri, 20 Jan 2023 09:28:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y13-20020a9d714d000000b00661a16f14a1sm6072663otj.15.2023.01.20.09.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:28:41 -0800 (PST)
Received: (nullmailer pid 1329674 invoked by uid 1000);
	Fri, 20 Jan 2023 17:28:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
Cc: linux-mm@kvack.org, Guillaume Missonnier <gmissonnier@kalray.eu>, 
	Atish Patra <atishp@atishpatra.org>, Arnd Bergmann <arnd@arndb.de>, Marius Gligor <mgligor@kalray.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Waiman Long <longman@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Benjamin Mugnier <mugnier.benjamin@gmail.com>, 
	Ashley Lesdalons <alesdalons@kalray.eu>, =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, 
	Luc Michel <lmichel@kalray.eu>, Nick Piggin <npiggin@gmail.com>, Qi Liu <liuqi115@huawei.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jules Maselbas <jmaselbas@kalray.eu>, 
	linux-riscv@lists.infradead.org, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Samuel Jones <sjones@kalray.eu>, 
	Eric Biederman <ebiederm@xmission.com>, Bibo Mao <maobibo@loongson.cn>, 
	Mark Brown <broonie@kernel.org>, John Garry <john.garry@huawei.com>, linux-doc@vger.kernel.org, 
	Clement Leger <clement@clement-leger.fr>, Jean-Christophe Pince <jcpince@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Louis Morhet <lmorhet@kalray.eu>, Alex Michon <amichon@kalray.eu>, 
	Shaokun Zhang <zhangshaokun@hisilicon.com>, Jonathan Borne <jborne@kalray.eu>, 
	Eric Paris <eparis@redhat.com>, Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Guillaume Thouvenin <gthouvenin@kalray.eu>, Thomas Costis <tcostis@kalray.eu>, 
	", Guangbin Huang" <huangguangbin2@huawei.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Julien Hascoet <jhascoet@kalray.eu>, bpf@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Julien Villette <jvillette@kalray.eu>, 
	Rob Herring <robh+dt@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Chardon <vincent.chardon@elsys-design.com>, Janosch Frank <frankja@linux.ibm.com>, 
	linux-arch@vger.kernel.org, linux-audit@redhat.com, 
	WANG Xuerui <git@xen0n.name>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Bharat Bhushan <bbhushan2@marvell.com>, 
	Kees Cook <keescook@chromium.org>, Marc Zyngier <maz@kernel.org>, 
	Julian Vetter <jvetter@kalray.eu>
In-Reply-To: <20230120141002.2442-5-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-5-ysionneau@kalray.eu>
Message-Id: <167423561602.1325928.9348232988456790495.robh@kernel.org>
Subject: Re: [RFC PATCH v2 04/31] Documentation: Add binding for
 kalray,kv3-1-apic-mailbox
Date: Fri, 20 Jan 2023 11:28:32 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_092844_585914_75C56BE4 
X-CRM114-Status: GOOD (  15.62  )
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


On Fri, 20 Jan 2023 15:09:35 +0100, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,kv3-1-core-intc` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray,kv3-1-apic-mailbox.yaml            | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: $id: 'http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-apic-mailbox#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: properties:interrupt-parent: False schema does not allow True
	from schema $id: http://devicetree.org/meta-schemas/interrupts.yaml#
./Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml#
Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.example.dtb: /example-0/interrupt-controller@a00000: failed to match any schema with compatible: ['kalray,kv3-1-apic-gic']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230120141002.2442-5-ysionneau@kalray.eu

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
