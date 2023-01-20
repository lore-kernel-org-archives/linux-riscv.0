Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F365C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPZt4a2YoEslPzcEWM30sqgeuqJzKkSm0HtKiieOLmo=; b=FBcEnmtBXOgamA
	GVZ4dnrGdcdXzcNzxe61WYUDWH6EsJq6aPhotdLl53mye3529X0mWu+xBGRBxrpEI8d02ZgZm7aTz
	Xl7+e0TdfD81/pw6ruem5KPHyKyxFiZbtYPcQLNvEYaI6RK5lBkVb9nj/fLMGkovCwbR4T4sXl3u+
	odlnShfQrFtY30OYbaEpJd0hVPeE3BDMm3wm570TcylrBRqy3VZcXSUSStErrUpK3547BXTGGao8u
	kaiUAe95TR8zV9voCpfAJAeaXriLY6L56aBLguefmxPSHjmBTwXXKBHCIwAlRIGzhmshrbkYx8ZWz
	8IKwYUbjFjlJpmN7ztYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvC9-00Bagp-JD; Fri, 20 Jan 2023 17:28:53 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvBx-00BaWW-P3
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 17:28:44 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-15bb8ec196aso7005877fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 09:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvYbaNfQm3I2mSz+vFgV+Zpo/6TKrTqqiUlOL3TyJbU=;
        b=E7ReWslYb6OpU7be8OvNQ6okHawk2LMqv7psUHLqQgSo7FoxLLPkFFYnHiAQzIFDMh
         0pDt+hC2bZlzkem5Q2ueANm/PinSITcZmE1DTbNe7dIAODGiYTRl7/DxtAXNKApheJvQ
         2HEnT4nw+iQzrNUD/cnpVCFjsuyY6/9ZB6sgpdp2wDic3J+VmVOI5sktmJ3JhNfL1Hnx
         QWySLorddALJG/6OZsGDF0CHZQTuFpTQiFdzecNgrokTedsw+OFWOQvpXHnKt7ss4iRL
         hNeI1fCS4Vyxtu+Hmv7NRfUyEEa7RHC//kyEKe8091BizxO6pQPi691GKiUDBejBet0H
         CZXg==
X-Gm-Message-State: AFqh2kpeosfkhGqIv3BMy51ma3zKLLnOld+V8Pr1KkyRbiRPlTIPh5uV
	20eRSy1k+dyLDc2/0hrYQA==
X-Google-Smtp-Source: AMrXdXuIj9Mc6vhmcjt+cVUmsx/qJI+DwldGfBtYKiNvQNiIU6JcQTsuH2h+z+SVTygNWPiU0rySOw==
X-Received: by 2002:a05:6870:54c5:b0:15f:853d:d7f with SMTP id g5-20020a05687054c500b0015f853d0d7fmr6250068oan.23.1674235718838;
        Fri, 20 Jan 2023 09:28:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id er14-20020a056870c88e00b0013bc40b09dasm21968671oab.17.2023.01.20.09.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:28:38 -0800 (PST)
Received: (nullmailer pid 1329680 invoked by uid 1000);
	Fri, 20 Jan 2023 17:28:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
Cc: Jules Maselbas <jmaselbas@kalray.eu>, Eric Paris <eparis@redhat.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Julian Vetter <jvetter@kalray.eu>, 
	Oleg Nesterov <oleg@redhat.com>, Ashley Lesdalons <alesdalons@kalray.eu>, 
	Marius Gligor <mgligor@kalray.eu>, Ingo Molnar <mingo@redhat.com>, 
	Julien Villette <jvillette@kalray.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Samuel Jones <sjones@kalray.eu>, 
	Janosch Frank <frankja@linux.ibm.com>, devicetree@vger.kernel.org, 
	John Garry <john.garry@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biederman <ebiederm@xmission.com>, Guillaume Missonnier <gmissonnier@kalray.eu>, 
	Guangbin Huang <huangguangbin2@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Clement Leger <clement@clement-leger.fr>, Rob Herring <robh+dt@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Qi Liu <liuqi115@huawei.com>, 
	Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Jonathan Borne <jborne@kalray.eu>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jean-Christophe Pince <jcpince@gmail.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, bpf@vger.kernel.org, 
	Benjamin Mugnier <mugnier.benjamin@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kees Cook <keescook@chromium.org>, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Nick Piggin <npiggin@gmail.com>, 
	Shaokun Zhang <zhangshaokun@hisilicon.com>, linux-arch@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-audit@redhat.com, 
	Alexey Dobriyan <adobriyan@gmail.com>, Thomas Costis <tcostis@kalray.eu>, Marc Zyngier <maz@kernel.org>, 
	=?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Julien Hascoet <jhascoet@kalray.eu>, 
	Alex Michon <amichon@kalray.eu>, Atish Patra <atishp@atishpatra.org>, 
	Vincent Chardon <vincent.chardon@elsys-design.com>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org, 
	Christian Brauner <brauner@kernel.org>, Guillaume Thouvenin <gthouvenin@kalray.eu>, WANG Xuerui <git@xen0n.name>, 
	Louis Morhet <lmorhet@kalray.eu>, Mark Rutland <mark.rutland@arm.com>, Bibo Mao <maobibo@loongson.cn>, 
	Waiman Long <longman@redhat.com>, Luc Michel <lmichel@kalray.eu>
In-Reply-To: <20230120141002.2442-8-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-8-ysionneau@kalray.eu>
Message-Id: <167423561872.1326049.17437952508849163257.robh@kernel.org>
Subject:  Re: [RFC PATCH v2 07/31] Documentation: Add binding for kalray,kv3-1-pwr-ctrl
Date: Fri, 20 Jan 2023 11:28:32 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_092841_878930_895A4B45 
X-CRM114-Status: GOOD (  15.17  )
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


On Fri, 20 Jan 2023 15:09:38 +0100, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,kv3-1-pwr-ctrl` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray/kalray,kv3-1-pwr-ctrl.yaml         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: $id: 'http://devicetree.org/schemas/kalray/kalray,kv3-1-pwr-ctrl#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
./Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/kalray/kalray,kv3-1-pwr-ctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.example.dtb: power-controller@a40000: reg: [[0, 10747904], [0, 16728]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.example.dtb: power-controller@a40000: '#power-domain-cells' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/power-domain.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230120141002.2442-8-ysionneau@kalray.eu

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
