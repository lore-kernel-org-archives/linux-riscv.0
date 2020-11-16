Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDCFC5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 15:23:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E106E20888
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 15:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X0KPA7f+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E106E20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R6fHlljdXLaiP9hl4Bx0RoB0pKy6e1/d4UcGmeJ07vk=; b=X0KPA7f+J+cTuw21PbuQ5vDF+
	/1N/3DtDooBeA2KKl/9jcnNaKflrDirSmmsDffP6EPTlLKjlgQRkp50Lrw+CLpka1hCoxySXvjc6/
	+enaQ+j7OjOjzz9EqRm7TC6/yLaRlD/kUGYSpLOmsAu0G1jpNJMwdK0wnrgRUf5mn+nofh5acVHIk
	fjwwubbyOT0575+9LJzJRdpnM4wukaDiD5YWh0wEL8BIiJZdMl7tqfrmahgXuIEtRaLHTxumTh3oQ
	l/Ds2JmqGXYZDUJnRsCOxbfHEoFSgNg46lajiGWryWkU/k2Uo2B9fSwB9p7I7drp+bW94wgjeZRds
	As+w2A13g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kegLY-0007Uo-Bk; Mon, 16 Nov 2020 15:23:12 +0000
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keg0b-0004tF-VZ
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 15:01:44 +0000
Received: by mail-oo1-f66.google.com with SMTP id r11so3957062oos.12
 for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2020 07:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R9UEviXeV1rCp92wR+Tm/LJi3BfQJ2Jz6UOv857MPrI=;
 b=qrMm8168meyRiyTX5dUq0HjaJ9O2CoFQhzRICWx4CwC70BVizig/z0d1brJmAUr2Vr
 J4BWZikv7q+pSsWpTmaM/tz6yr0z3yre5JFK2CZ65Es0zrcqlYVy0ZjvBtWRuzlZ3xUc
 GdftgXAyRekOEO6CKchasdGH415RWDtjw+o9NJYESv7LMj3cqRN6QTpyTnIfSPRvrEat
 zLmd/PhLJ75Hc8/gAZ9+M+bBlcu136A5Dzaz++5O20WL12qZXH6/LG2jvc5fiVkqNuqb
 0/a+MJ7AEcFUf6ue3utGDI9MEi9kTQjzdYFg+suCtj1zEG7X1UwMe9VtnOAq7Niy3KNo
 HnWA==
X-Gm-Message-State: AOAM5335gs/5IsDTFveylo78JPATAlCIsvHqTR4HHDNvZ3sdCPZjaSxr
 ir+1wEkN1sgFuYsCQjXEKA==
X-Google-Smtp-Source: ABdhPJz3Q8ZtWwqwoKoqJ8DJgQkQSMvokTPqq7g2GQ7VgqFzk5fu9ft/rdmq7jCSS4a+8S89uwA4wA==
X-Received: by 2002:a4a:d5d3:: with SMTP id a19mr3821973oot.61.1605538890565; 
 Mon, 16 Nov 2020 07:01:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i8sm4703311otl.60.2020.11.16.07.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 07:01:29 -0800 (PST)
Received: (nullmailer pid 1644751 invoked by uid 1000);
 Mon, 16 Nov 2020 15:01:29 -0000
Date: Mon, 16 Nov 2020 09:01:29 -0600
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC PATCH v2 2/4] dt-bindings: riscv: microchip: Add YAML
 documentation for the PolarFire SoC
Message-ID: <20201116150129.GA1643948@bogus>
References: <20201113202550.3693323-1-atish.patra@wdc.com>
 <20201113202550.3693323-3-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113202550.3693323-3-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_100134_649942_F9C7CAF2 
X-CRM114-Status: GOOD (  12.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>, Conor.Dooley@microchip.com,
 linux-kernel@vger.kernel.org, Ivan.Griffin@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 13 Nov 2020 12:25:48 -0800, Atish Patra wrote:
> Add YAML DT binding documentation for the Microchip PolarFire SoC.
> It is documented at:
> 
> https://www.microsemi.com/products/fpga-soc/polarfire-soc-icicle-quick-start-guide
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/riscv/microchip.yaml  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/riscv/microchip.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/riscv/microchip.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive.yaml: duplicate '$id' value 'http://devicetree.org/schemas/riscv/sifive.yaml#'


See https://patchwork.ozlabs.org/patch/1400088

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
