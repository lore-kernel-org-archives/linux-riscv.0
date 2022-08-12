Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD0C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCZI63IuSoU+wOBm38J5b3headvq3ugdJBkQNSlNyE0=; b=DxGjhzVmKBjPjG
	8+utQTepDGeZcGfJqbaE5ZM3elVmrBYMDx5Tu0+tA3CsBUSOQUe1r7T4SieA6ZEgVmsOYN3aziFy2
	UHw333thCIZTLaarnPT63f0F0mEK027noDGNL6xkzhkj1OfWmyOr3aHb0J6JeoZGQPmMG7ppZk4Wz
	6zQxcCyoVH9r8hQZfFLQiJndPZ36v3EjCUtuESyVpb/RgA8eSGbTzjd3CzrLlnS4IS2dlxBln5KDu
	ZUL6szVO9Uvkwi/aEbcRzyhcU7WtdELcptKSDprc/maA9eMLDwwgDtSzzgU5QCRsUeGxlYqTdZdmC
	UfARlJ+jCpN7Tpc+SQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPJb-001uHS-32; Fri, 12 Aug 2022 07:42:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPJY-001tEN-7s
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 07:42:41 +0000
Received: by mail-lj1-x22d.google.com with SMTP id s9so165409ljs.6
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=sBayUxRV4uPcA67ScjufKHzSC2Zb9c963r0CFb87BtI=;
        b=ZxmhqxbLyYEKBoaek1kELjS9zWam3584fB7+hC/D/yOL5VIzNTYK2p+l0hnDNec9la
         PwxLpp7lD6asWrVMYpbxrj8CbVyUjv+NVMDvJQ01IIQ3ojDKu3SMAzbB9PvJGAfK3fCK
         lkPqvEEQ8nOZyQOfiBSseOBQ7ZNyvByQ1xgfkWez5dbQam9X0jF7DEuJvdUItPIMj2D2
         8ZDjhhQJFeNyqQOi02JzoFx5Kx2hfyqAuoAih/KeJAK3t/ha771sLC3pi1DeUhwxVRiF
         9/iQ6NkHA47vsEsZ2Tl7BU0G13wAuZtxRxVCb6yhix5INR8JKJEsY1rHWI+KVd/0i0pu
         9dSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=sBayUxRV4uPcA67ScjufKHzSC2Zb9c963r0CFb87BtI=;
        b=ZHfpTX6pIP+xspMpG1wcoNiB3elvxfw+53mnHQPUeBOPDGjM82njjHpyJ3jwXQ5cPK
         eZ/l9UjXsiTW+hb4+Kd3v5TzWSFPX41ePTTVDxB/DqFs4m9t9Jpa+ICeqOKgJp+OTFPK
         AgF7P+2SbjR/LFcggupqvPAeq8xD+Yyyu9s3wBAVGKmEK+O/xnUTAQQBIvprv3grmmI/
         izrPZSHuvTNF4NDvOZKAvFpe0dxztdoUf1c/etRDed1ua19mDDga8UNVUwjtl78L6rV0
         Xe/el6MmUG7sgpocpUDFs7jvCnarQq/RHdNzlZ2Mn1ijTnGLzk3eQSpsEygubHR3p5m1
         qweA==
X-Gm-Message-State: ACgBeo0Slly62tkN58valsukP4bip94c9YcDAwMmYONbL93xemYLW1ya
	BB630iduuuOoOp3lIpUAHduu+Q==
X-Google-Smtp-Source: AA6agR5MQ83Hq/A33QupzFIOLxPxAA89VBM9ILO2jMHCQZcILllbnmG9wAY/i+GQ4ZHqX8XArqLi1Q==
X-Received: by 2002:a2e:9941:0:b0:247:dce8:b0ec with SMTP id r1-20020a2e9941000000b00247dce8b0ecmr871902ljj.404.1660290158243;
        Fri, 12 Aug 2022 00:42:38 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id b19-20020a056512071300b0048b16fb79a0sm118602lfs.214.2022.08.12.00.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:42:37 -0700 (PDT)
Message-ID: <721ccb76-c162-30ee-68cc-3316a2d62554@linaro.org>
Date: Fri, 12 Aug 2022 10:42:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] dt-bindings: PCI: microchip,pcie-host: fix incorrect
 child node name
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-4-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811203306.179744-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_004240_330705_C0586CF2 
X-CRM114-Status: GOOD (  21.09  )
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

On 11/08/2022 23:33, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> v2022.08 of dt-schema improved checking of unevaluatedProperties, and
> exposed a previously unseen warning for the PCIe controller's interrupt
> controller node name:
> 
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>         From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> 
> Make the property in the binding match the node name actually used in
> the dts.
> 
> Fixes: dcd49679fb3a ("dt-bindings: PCI: Fix 'unevaluatedProperties' warnings")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This is another one Rob where I feel like I'm doing the wrong thing.
> The Linux driver gets the child node without using the name, but
> another OS etc could in theory (or reality), right?

Yes and we had such cases when renaming device nodes caused regression.
My interpretation is that node name is not part of ABI, so anyone
depending on it made a mistake and they need to fix their stuff. I think
actually that is really poor coding and poor solution to parse device
node names and expect specific name.

Other folks interpretation is that we never break the users of kernel,
regardless what is documented in the ABI... so it depends. :)

Here however it is not a device node name, but a property name (although
still a node). Bindings require these to be specific, thus such name is
a part of ABI.

For your case, I wonder why it was called "legacy-interrupt-controller"
in the first place? Node names - also for properties - should be
generic, so generic name is just "interrupt-controller".

> ---
>  .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index 2a2166f09e2c..9b123bcd034c 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -71,7 +71,7 @@ properties:
>    msi-parent:
>      description: MSI controller the device is capable of using.
>  
> -  interrupt-controller:
> +  legacy-interrupt-controller:


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
