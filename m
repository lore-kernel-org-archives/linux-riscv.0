Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37389C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E61F960F24
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E61F960F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9q/X0+4Z0zd7zZ3EUsIH3LSa8xYlTpHYB65HavZEvj4=; b=fByE0DqVphMd/K
	1iZWMiJCWafAhpkmlPBtVg+NpR+z84Wxu6HA3KOEx7YJob+XNQ61PPsQYfYaWIKRaefJtvPpNthfr
	4bWRPgDSEz7DBY3J+A85b1raJdW2ycpcXUp91ukU1MAfCYie6Ha/OPib5gKaMTscQignPiyzy6i4y
	jEZoDCaAIYh++oIjdHuNcBUxwHB5HUQKQCqCYJPjQHHJEF5/jiTvezH9BLHv24CtwUiu6D+jdfa6a
	9csmwOjqXl9GLYswf5lx9HRYGEENa4GwKgOuNHscFJUqGMZ15+Gu6lzuLxLFxOZA/cQ/oUf1ZsoxH
	1BydW7hyjrYdFyRzWoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdBzC-004flJ-Bx; Wed, 20 Oct 2021 13:50:30 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdBz9-004fke-0g; Wed, 20 Oct 2021 13:50:28 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so8251182ote.13; 
 Wed, 20 Oct 2021 06:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=PEZXkD74SyZdIyV+d+cp0filvFd2Rp3gOD7po4nsWqk=;
 b=p+ABOtyPHoiBIJWBNqcTZpjfgWZ5HWrOwqlmFxw7v98Qts2ZG7yhVOBVhZdlfFMZDn
 4MiVB04Zvnhjks9e33j1Rr00Jd47407sZb3T0zPpevQtPaqd5bkqvRUQVxHUlA/2XD3t
 XUrSko73q4NlPmO+Mebm7gpM9pICIV0ZshsmBm3sVDyeXvZ0h9Cg3BmGFyYxFB7ch5lY
 QbfytBN/AEF6XlLVDi5z2Wdi9K0YxZ+xnqC0O6p1e63PHACIQsa4n/IpaPWmohpACYXv
 8G+HYegd/+6SaAge7dyXQXUkUetrTjiFysRym7mmel8jewAyiu6RTqY99WRhiR6lKTIQ
 HVVg==
X-Gm-Message-State: AOAM530fLdOfALLhQgbQRt3OL1vSkVNCaMGmWPYApB5HnZ+sjsFom2xx
 Y9RtDrX+xKBwoBvWrJx2uA==
X-Google-Smtp-Source: ABdhPJzdpE171vomgu71sUM77D67pYolOFhrMZHKHtjQ7wm0L0/GqcC4cBU6sXFt2kOXSyTrvHgcGg==
X-Received: by 2002:a9d:715c:: with SMTP id y28mr11044070otj.362.1634737825626; 
 Wed, 20 Oct 2021 06:50:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x12sm423235oot.6.2021.10.20.06.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:50:24 -0700 (PDT)
Received: (nullmailer pid 2259917 invoked by uid 1000);
 Wed, 20 Oct 2021 13:50:23 -0000
From: Rob Herring <robh@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Guo Ren <guoren@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, opensbi@lists.infradead.org,
 Bin Meng <bmeng.cn@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Xiang W <wxjstz@126.com>,
 linux-riscv@lists.infradead.org
In-Reply-To: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 1/1] dt-bindings: T-HEAD CLINT
Date: Wed, 20 Oct 2021 08:50:23 -0500
Message-Id: <1634737823.662456.2259916.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_065027_094980_C00554CA 
X-CRM114-Status: GOOD (  19.45  )
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

On Wed, 20 Oct 2021 11:36:03 +0200, Heinrich Schuchardt wrote:
> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
> not support 64bit mmio access to the MTIMER device.
> 
> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> restriction and the "sifive,cling0" compatible string. An OpenSBI
> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
> is generally used in the devicetree schema for such a condition.
> 
> As the design is not SiFive based it is preferable to apply a compatible
> string identifying T-HEAD instead.
> 
> Add a new yaml file describing the T-HEAD CLINT.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> @Palmer, @Anup
> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
> this should be changed.
> 
> For the prior discussion see:
> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt@canonical.com/
> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt@canonical.com/
> 
> A release candidate of the ACLINT specification is available at
> https://github.com/riscv/riscv-aclint/releases
> ---
>  .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/thead,clint.yaml: properties:compatible:items: 'oneOf' conditional failed, one must be fixed:
	[{'const': ['allwinner,sun20i-d1-clint']}, {'const': ['thead,clint0']}] is not of type 'object'
	['allwinner,sun20i-d1-clint'] is not of type 'string'
	['thead,clint0'] is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/thead,clint.yaml: ignoring, error in schema: properties: compatible: items
warning: no schema found in file: ./Documentation/devicetree/bindings/timer/thead,clint.yaml
Documentation/devicetree/bindings/timer/thead,clint.example.dt.yaml:0:0: /example-0/timer@2000000: failed to match any schema with compatible: ['allwinner,sun20i-d1-clint', 'thead,clint0']
Documentation/devicetree/bindings/timer/thead,clint.example.dt.yaml:0:0: /example-0/timer@2000000: failed to match any schema with compatible: ['allwinner,sun20i-d1-clint', 'thead,clint0']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1543771

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
