Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB6EC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7n31vTNNwMxfp4fNoggvmy6+YCwIufXqjlJwTf8ZnQ=; b=KBLFezzYWKU2a5
	P7PpBZ4RozXEEnMGbExZYulZGFqVCEyJJMNeE22edtrWHgNIlpVUwIl+DcaRott0qImC6XBxcjOFs
	GukCT9oqlJ0pDnfwmBFMNgbjGNnYHFTiSsy9hdoxD8KtKr/NxQYTNMNHDcrW3Lh3FjP3vi6SFDABG
	uX4IIdgtxO9gjNmilou8X2HtVjbl/y07GqnP+EJ7y81uiothKISJv4YwGFrMd413Lr8GCzDrtfJzB
	6UjFxku9yGqngzprV0jJ/ujh7lEW8zHHJGm4yCNCgsauaoWUEf5oefWhnE8ijugYF6YvzaWZvJDkz
	QL4nxC+dlB/0B4pDDvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOioY-007JXy-2x; Thu, 18 Aug 2022 16:56:14 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOiVw-007AKE-6K
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 16:37:01 +0000
Received: by mail-io1-f54.google.com with SMTP id r141so1494801iod.4
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 09:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=EsZP3ELRo6TTGsFBmByT42JNw5wBc7RlaMRIBETg5Gc=;
        b=EVB3/Davg0nC8z4qlQTQkxQ7PS6kzCBsjbXN20UfiecGkJi6zsPiplMoSFC/nfuyZu
         Z7tWV4jblV0zMZOlBQR41BwgmIcZKp9KVCehd6viu2V6UAtGyvvJKV3oqm8sPXOwePbG
         dFl/S9RsklwF/UdY7u+6eH3a0tHfCDQxzNaPuroqD5ui27CMuaKvjzVBJQHDsw7Us305
         ekZ/egRVSYbmKAU0uEDIB/Uiek/yKv8rY6OnC4mBFQVBLVebM1pgr+iegkCM+jVKKypz
         7jFbKknzfXQH4ml3yUVnpIeMmKUPjzEKYUoTtJl1H2+/9QK7Vn879QPNt9EB1L61deHy
         f62g==
X-Gm-Message-State: ACgBeo0Z01RUQIReWKZT3mgymrO8XPAsIkRTcCieXZPvpZlfvFJ7Pd0s
	0kTADG1Q059xtIVvbD0cpVCmfty3uA==
X-Google-Smtp-Source: AA6agR7XYb4e6JSFTnrS/q7WlPl4E2gg4SEWAy++LgChjlcloI3dnrD9XsgcrfX8E4rSums27VI5/w==
X-Received: by 2002:a05:6602:330e:b0:67b:9fed:49db with SMTP id b14-20020a056602330e00b0067b9fed49dbmr1740842ioz.54.1660840614873;
        Thu, 18 Aug 2022 09:36:54 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:647:4ff2:3529:f8cd:d6cd:ac54])
        by smtp.gmail.com with ESMTPSA id b40-20020a0295ab000000b003427281824csm756542jai.128.2022.08.18.09.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:36:54 -0700 (PDT)
Received: (nullmailer pid 1996636 invoked by uid 1000);
	Thu, 18 Aug 2022 16:36:48 -0000
Date: Thu, 18 Aug 2022 10:36:48 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 2/4] dt-bindings: interrupt-controller: sifive,plic:
 add legacy riscv compatible
Message-ID: <20220818163648.GD1978870-robh@kernel.org>
References: <20220817201212.990712-1-mail@conchuod.ie>
 <20220817201212.990712-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817201212.990712-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_093700_273462_8F350C87 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, Aug 17, 2022 at 09:12:11PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While "real" hardware might not use the compatible string "riscv,plic0"
> it is present in the driver & QEMU uses it for automatically generated
> virt machine dtbs. To avoid dt-validate problems with QEMU produced
> dtbs, such as the following, add it to the binding.
> 
> riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
>         'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
>         'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
>         'sifive,plic-1.0.0' was expected
>         'thead,c900-plic' was expected
> riscv-virt.dtb: plic@c000000: '#address-cells' is a required property
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
