Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwOZTmYfY+EpAbrWBGR+w3LEFr9TbqmfuYefMV/3yeI=; b=pG4Lq09Z+s73Nj
	oLWtoCPei95FipyEo1e84LxN0+PP1G1cxY9b1H3uKp64LNVrQzSQ6gm0nTrMK+1rJjVotUaV2WNNH
	jmyO+TVYsyGOMPU+Kp/IaqEfCj3Ym2i/FsxtJ/eHGXoJdwE/HLgEczfdHIi9IdGmnE92OMdcXJJaw
	cec30EFf5hH3D77UPckS2MaV8MRgUr/j+4ddbl/k0zsk829Ifk9Cn8Htl2z9Yedwb0GfMUAuDOLWu
	ljykYX/qalzH3JN6cU4MgNrGQyjINmN62kAaaKc7FhOP9KOMugDvyncQDmx5qPXO3LB8uwKQKDsZ5
	dEMpAelSgun4CecSQCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCF8-001EmC-HP; Mon, 06 Jun 2022 12:54:02 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCF4-001EkG-NR
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 12:54:01 +0000
Received: by mail-io1-f41.google.com with SMTP id 134so5790234iou.12
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 05:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=17BV3B6L8cFXi6P8k2mlHJRfIyCAzA1j0HpV6C5Sgr4=;
        b=GU6iqf17bkV9tbgt+1yjVPj0FcjZScuXcx6lsBa0FQkel8CO9azYHK9iabXcm5ceqW
         ULNQiUjblmuwixPCE1D54Dk8JFIvfa7axnu9G52Vm8yPqdNBvSlC3BfK6uNQFcwn9e7k
         cHdvWyvz2SQoAyFCRzg0F/FBxrW7kHZn3waFQKaRHjZcEOTuNidoEbtk2iB3I0kykEjE
         LmcMv8ePriIEwC78UG0O+8no7hUscRTVBEZgJFrzo4aV8l2ykPU1vqnk+AlGrRS2RfuY
         ThRX928w/i5kwXispjSn0rnsaCAPumnU/2XwvBhqUV8cRX44SIPDpvASbbTiiUrE8Wpr
         uXTg==
X-Gm-Message-State: AOAM531ouMlCLqQo+FLWNO/cw55oq5+20RkUV/QktwEfZtV8RpF6Fep1
	NOQ6kmmugKRVbuOMZqk5cw==
X-Google-Smtp-Source: ABdhPJzYHZC19S1AhARuV7jAx+W2Vt0Gp0lgn2/qiWTc/bIBDcXHU3jjuO1kj7hyLyBz9izNeyariw==
X-Received: by 2002:a5d:9a13:0:b0:668:94ba:46ab with SMTP id s19-20020a5d9a13000000b0066894ba46abmr10727628iol.155.1654520035880;
        Mon, 06 Jun 2022 05:53:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z5-20020a056e02088500b002d1883dc283sm6234342ils.78.2022.06.06.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:53:55 -0700 (PDT)
Received: (nullmailer pid 534470 invoked by uid 1000);
	Mon, 06 Jun 2022 12:53:53 -0000
From: Rob Herring <robh@kernel.org>
To: mail@conchuod.ie
Cc: Steve Twiss <stwiss.opensource@diasemi.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org, Support Opensource <support.opensource@diasemi.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Atul Khare <atulkhare@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20220605133300.376161-3-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie> <20220605133300.376161-3-mail@conchuod.ie>
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
Date: Mon, 06 Jun 2022 07:53:53 -0500
Message-Id: <1654520033.511603.534469.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_055358_804974_1B436AEB 
X-CRM114-Status: GOOD (  11.88  )
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

On Sun, 05 Jun 2022 14:32:57 +0100, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the open cores i2c controller binding from text to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>  .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
>  2 files changed, 132 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/i2c-ocores.example.dtb:0:0: /example-0/i2c@a0000000/dummy@60: failed to match any schema with compatible: ['dummy']
Documentation/devicetree/bindings/i2c/i2c-ocores.example.dtb:0:0: /example-0/i2c@b0000000/dummy@60: failed to match any schema with compatible: ['dummy']

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-ocores.txt
MAINTAINERS: Documentation/devicetree/bindings/i2c/i2c-ocores.txt

See https://patchwork.ozlabs.org/patch/

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
