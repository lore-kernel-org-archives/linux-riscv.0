Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E7DC19F28
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Aug 2022 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ydvc50Wy6/fwVkfhRcx60WjQlExY4qQdoZ554rZC460=; b=EhzcnEWHmySRMf
	HW/7wJHFB/JfJq10Qgd2qY2xaDsRjO5c+bSfbysiybnLOprqRDOleTd/41GAeXhabUrN+309ut7qd
	cXAnSpnlfvuqhnh2D9OlB6aIgBf8QQ0qFn8e0aCyjKI/k0wZUVezBO3awhQOjkBG3Tb02vk12cSw+
	ezi4pEobn0mUej/XAha2fLIFU3NuRI6DOJWulnwdK7HC7pBwc8uvlH4TytBYQdE0KJ4p8gCuvNHqT
	dsA50YOnvy8UPop8zri8D9vvNY6zD3JWPEtBNEwbdFLKPjapinGYQryGzV9YSKwbyX30hdYMg+Lmg
	Wib2oH/zBG/oDzQ+29eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJHok-007lK6-IY; Wed, 03 Aug 2022 17:05:58 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJHoh-007lHT-CO
	for linux-riscv@lists.infradead.org; Wed, 03 Aug 2022 17:05:56 +0000
Received: by mail-il1-f177.google.com with SMTP id h16so8760895ilc.10
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 10:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=v4roaZfqx7PcCIU4byNAVqdVVXRQGgV9wju3rqJ7gjI=;
        b=RzofM4l+gNP5FBZ1pAM3RrAlpwEatR56dkmFbcQYyYTiV41k8/geA4kyl52RiWbmsg
         MOuyaFGL7gAvFbBCmwOIQmrloL3+eosgsVYT8SrwQ6hINuaHH/D9cF3HipTpnHfUlJo8
         0zeKJVbzohDJjqcIl7Q3O7PiQPup4yRRNe4y1ZpkvS43mdz7HAQni0AuDfX7Um0Xy7v4
         XFSiv9E0ZPayBsBwaKU0D626oP6vXhKbEM/6g/56/eHsoIuql2ZsEYaPcHrSpOCRZ3A0
         eE3G+sxl7VXDAEQavt+vXQ2KbLt4+jWDN3uf0CEY9elAP8aKqOMZUXP3W7W56nJJcxFL
         2uCg==
X-Gm-Message-State: AJIora98C02WkZPjLsO2ecL2yjCsIrZs13V8g39SggNgJ0v+S6LE7vFO
	VWszE1Pgu7LkeMYhBjk0Jg==
X-Google-Smtp-Source: AGRyM1v4ORHo4C/fzjAcUDL0GgJ4P9hEjXLJyCajqcS7rGT5MYm7xFNpQ8Xa/I6qzuXragIdgkR8mw==
X-Received: by 2002:a92:2809:0:b0:2de:2060:193 with SMTP id l9-20020a922809000000b002de20600193mr10893104ilf.188.1659546353588;
        Wed, 03 Aug 2022 10:05:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q8-20020a02a988000000b0033f22c2e5b3sm7931254jam.98.2022.08.03.10.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 10:05:53 -0700 (PDT)
Received: (nullmailer pid 2293770 invoked by uid 1000);
	Wed, 03 Aug 2022 17:05:52 -0000
Date: Wed, 3 Aug 2022 11:05:52 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: DT schema warnings on Risc-V virt machine
Message-ID: <20220803170552.GA2250266-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_100555_437268_CD730DD1 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
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

Hey folks,

FYI, I ran DT validation on the Risc-V 'virt' machine and these are the 
warnings:

/home/rob/riscv-virt.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml
/home/rob/riscv-virt.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/rob/proj/git/dt-schema/dtschema/schemas/simple-bus.yaml
/home/rob/riscv-virt.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/rob/proj/git/dt-schema/dtschema/schemas/simple-bus.yaml
/home/rob/riscv-virt.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/serial/8250.yaml
/home/rob/riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
        'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
        'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
        'sifive,plic-1.0.0' was expected
        'thead,c900-plic' was expected
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
/home/rob/riscv-virt.dtb: plic@c000000: '#address-cells' is a required property
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
/home/rob/riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
/home/rob/riscv-virt.dtb: clint@2000000: compatible:1: 'sifive,clint0' was expected
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml


Also from the 'spike' machine:

/home/rob/riscv-spike.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml
/home/rob/riscv-spike.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml
/home/rob/riscv-spike.dtb: clint@2000000: compatible:1: 'sifive,clint0' was expected
        From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/timer/sifive,clint.yaml


There could also be other warnings from non-default configurations.

To reproduce, dump the dtb and run:

dt-validate -p Documentation/devicetree/bindings/processed-schema.json riscv-spike.dtb 

(processed-schema.json is from kernel validation run)

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
