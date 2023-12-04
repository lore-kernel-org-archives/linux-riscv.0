Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265E5C10DCE
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkddZfx2Hq9C4UBHLDr/39hZuM8JMr0q0cX3Cvzi5Hw=; b=ddXviIaDAzNkMC
	o2BX4hg/ZeUZrdqq8ESyzKAU8pinDFeyJAeeYcoYNWDsD7dWSR2l2V5OSTapVdZP24V/kBmo59dLK
	mOCn/222RFJag/oGTNIqDbEL8nRUW42t1o0ctcLY+SxGX2P7ung/rmQSQnQNMeOEDQS8GFMWR6bGJ
	xMiLXWeym1jG5JI+Xa/jek6CXZmgNf2JExORkqyUXMbbpjTgXyqVhLove4Ikl1Bow1ildptYl49le
	4ZPLhg66E4y7CIkJWjbOFzdBltWZogUbE0wWGpqXVRO7tm19Pob18MR+5t2tTU4BylCyy1Om6wmkj
	EVhayGeFOJ2UFJ14AoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9t0-004lCa-1S;
	Mon, 04 Dec 2023 14:25:26 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9sx-004lC7-0f
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 14:25:24 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-58d08497aa1so3309520eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 06:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699920; x=1702304720;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lhhmi8w8FhrDZiDw2dpqrrV8WQgs4nmlcgmnrIZW9vM=;
        b=YY0uLRT1wCPq9Zz8wa3S9ZLYuFTUXHn6byyVrGT/eRup9HBC04DgSt/woVvgGT50Yc
         zI+odHbOpZQ28GYhayzmlV8aHIlqyy816ckFBsh9ecsOiGg2aiUeqJurRdeGFtDdaiKT
         +VpzN2E56QYl/5ImF3l0lvxkULrJjjgm/z6Wei7OfGAZC+01NJcD9bjE6u9sf0CbAjAf
         pYfNqOHvL3XRONzH5iUlfO88NN1hjZlWxy46MGpJTEocUEdOYuKeEIFhwKoxJmd3TuuB
         bbOMzjkXUFJISz120ZLQrbwcdXDMB7wNTj++bofZiiKT7OdVVJgosa6vvFLGEu3UhPD1
         +wzA==
X-Gm-Message-State: AOJu0YzY4Y6THu5Pw1rybZDS+VO9Z/JcH2dQvBtLmnLejMUH37myCVcs
	4ZzcoRzpjW9iDPhQTlFCZvjUTI+A+w==
X-Google-Smtp-Source: AGHT+IHUIM+kCotvnxNhLlPOfisb9roK9l9+KaY7l/Gbx+B9GlChh+E50rzm8GoEQ40QIBw//sepKg==
X-Received: by 2002:a05:6820:a82:b0:58e:1c48:4953 with SMTP id de2-20020a0568200a8200b0058e1c484953mr2535013oob.13.1701699919830;
        Mon, 04 Dec 2023 06:25:19 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x16-20020a4a6210000000b00587aaf6add7sm1976179ooc.9.2023.12.04.06.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:25:19 -0800 (PST)
Received: (nullmailer pid 1225685 invoked by uid 1000);
	Mon, 04 Dec 2023 14:25:17 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: guoren@kernel.org, robh+dt@kernel.org, samuel.holland@sifive.com, jszhang@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, richardcochran@gmail.com, paul.walmsley@sifive.com, conor@kernel.org, inochiama@outlook.com, linux-clk@vger.kernel.org, Chen Wang <unicorn_wang@outlook.com>, palmer@dabbelt.com, sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, xiaoguang.xing@sophgo.com, devicetree@vger.kernel.org, chao.wei@sophgo.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com
In-Reply-To: <14616bce163d689a4e640ab7b372421ca8306a92.1701691923.git.unicorn_wang@outlook.com>
References: <cover.1701691923.git.unicorn_wang@outlook.com>
 <14616bce163d689a4e640ab7b372421ca8306a92.1701691923.git.unicorn_wang@outlook.com>
Message-Id: <170169991797.1225669.8378193409195638634.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: sophgo: Add Sophgo system
 control module
Date: Mon, 04 Dec 2023 08:25:17 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062523_267788_BF93A14E 
X-CRM114-Status: GOOD (  11.29  )
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


On Mon, 04 Dec 2023 20:54:53 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add documentation to describe Sophgo System Controller for SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.example.dtb: /example-0/system-controller@30010000: failed to match any schema with compatible: ['sophgo,sg2042-sysctl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/14616bce163d689a4e640ab7b372421ca8306a92.1701691923.git.unicorn_wang@outlook.com

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
