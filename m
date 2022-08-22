Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3188BC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 20:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfK8ftu9T1v33rrx9zOBMFTX9Y0+1HhxpCMAI4o5uac=; b=u4Eg061H5uimDs
	TKqN2CLi07L//jFFQyKsPo3r0frmc04MgPWiy8vXN8pDM+0zRoY3u3JZFOoIMjUaveG8NkMaSTyPI
	vuwK5OCQvrYdH8rkfsSk5C3tepPH0qJAe5IyHQhN/X/RoBuFhgQH325nfX4+2h0G6FpD5AGEXE8oC
	T7DViovA9N7sozGW7QLnG6BeJWQGDG4gyiFO3+A/4/d9RTH4tAGUiOZjgqbQ4QGr+71nkGvnrw9jg
	tbc1xIPUZkQTv2QG/TVCUIJg6Z4J06ErCQ/DjyesTShU0lSqTcVU1IRwq3q13Ch8C2/7k8ZHSXaw2
	cM3wsgZ6Ty9UKMHi+jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQDhl-00ENYv-OS; Mon, 22 Aug 2022 20:07:25 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQCzO-00DzQ9-35
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 19:21:36 +0000
Received: by mail-ot1-f42.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso8380399otv.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 12:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=dLuy42xybjawVvlwKq6PcTXdKNjM/zlBr9syVIOuOUc=;
        b=ptDTXa/rcKhL/Ge8vwK1SD64zXlvKzvC6IfO13VJDQzQsFOQjtBpY13zgxtfT9Rwga
         z3qi/lGpDMBn+nmbHIjRm6YZJyIB5rX4wA+hvtlT4DRcVkWJvRqI/R7nwAUzXr8IWZmq
         sspxejEjUFWcW1d4ICIn8tmgFRz7UFcicieFPzm6KoPQV4J0hlx16tKFE9IgDyKICgtH
         1AFOJBGBDgYOyapZKrqAWsw8k8Bp9RGLMMmJJACRMHem+zypLXxYP/KvO2WiO6KDDo/F
         SmJSs9ZQ0J1gYaYvUUzHljjo3TDmoPVOPeJjrEfCDBw0LG0WLJgrszfPeHmGXgKzZNoR
         hi8Q==
X-Gm-Message-State: ACgBeo1Gd0B9x0ueAZLVjLLqrmeCNoZylxuZX5RmZn3AtmFSoZ5K1DWB
	1Afkw5GBaOqSqxl4oBKbEg==
X-Google-Smtp-Source: AA6agR7ddkKQDSebPyTEWK0KoRUwJdvioaZ5/ox3N9C7Dih8cAiNGW2HHL0ILp2VaJE5MUM54nOLkg==
X-Received: by 2002:a9d:6019:0:b0:639:25fb:c8aa with SMTP id h25-20020a9d6019000000b0063925fbc8aamr2951391otj.64.1661196091707;
        Mon, 22 Aug 2022 12:21:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bx14-20020a0568081b0e00b003450abf4404sm2752855oib.21.2022.08.22.12.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 12:21:31 -0700 (PDT)
Received: (nullmailer pid 288097 invoked by uid 1000);
	Mon, 22 Aug 2022 19:21:30 -0000
Date: Mon, 22 Aug 2022 14:21:30 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: PCI: microchip,pcie-host: fix
 missing clocks properties
Message-ID: <20220822192130.GA288034-robh@kernel.org>
References: <20220819231415.3860210-1-mail@conchuod.ie>
 <20220819231415.3860210-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819231415.3860210-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_122134_182407_C4377712 
X-CRM114-Status: GOOD (  10.98  )
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

On Sat, 20 Aug 2022 00:14:11 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Recent versions of dt-schema warn about unevaluatedProperties:
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>         From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> 
> The clocks are required to enable interfaces between the FPGA fabric
> and the core complex, so add them to the binding.
> 
> Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> dt-schema v2022.08 is required to replicate
> ---
>  .../bindings/pci/microchip,pcie-host.yaml     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
