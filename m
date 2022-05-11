Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CEBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPxZSScH2AfIzdgGF15mL9wCKgpzuYBQmo7FAJF3aWY=; b=UdTjCf1rFU2e0C
	FZEF4u44hDq91OMX7vOrYwl0tL2DOIPIbPj7CFwiAfxHk0O+uAxJl48Ix5nJYdDx5CaqQzRrBSX4A
	zxqa/cW2uK3t/uBnWZkadliR+R6CIKF5Z1w8Z+bF9lpD/fo3UJg3KlzXM6FlGEYOQm4/u3f3DLKJ+
	Xkd+ZWCPIaV0rPCa89L52JmRhAU+Bw34F5Wrn1ZqzOtgydJ4vyJ4QhE/DSw3wVN8HxKxu+K1zt6qs
	HCLJvHd0uUAZ70TZS5u52IsGa7UZojBMNkdNChNEFCHNH22Ec5+AldWs9YYLcc7IWCsLHFjdYkjI5
	eEKClzadHqhxrZ9ghlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nomTC-00702E-M6; Wed, 11 May 2022 13:33:38 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nomTA-00701Q-En
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 13:33:37 +0000
Received: by mail-oi1-f171.google.com with SMTP id w130so2769308oig.0
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 06:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6DW4Zo6I0qtUel+PxEOSPDTjH1lXWwkGs8gdgcVAYgw=;
 b=LVnwFxco2v4k8m1Pqw5PXJ4VnVSEMu5xWHNbFSDeOPX2dHL7eur1t7z7R3htgWITv5
 HBC/AiNbc0dznXF1Q5zxmeh7Vc3J4i59QibN59LdNmdlLml8aJCDaNZnGsz7n8v58ulk
 2Xaq7jSNMERRHatThct7UuFl6pgSRB8z24Y+pYntiSI5eBmR0EWR9dVPpuPBwX8Xi89m
 /akkkhMxTwNAhlc2msaLeT1jq17xboSJklMIkuaYCSzGVhxiI8Jfb9whnHHuVp9LMlXt
 GL3XekRjJk2OUGslYUHp88K1hTcxPEvxGGGgpg1rvjLtb02836ImtaMpnNdqPOnUKy/s
 uBxg==
X-Gm-Message-State: AOAM533aKsMock24ePSdB7vXRF/ArMAaMJzxcmVjd1sTW0fdfkbNFVQ8
 Vl4GhVgjJEBeud0vZ4tmfQ==
X-Google-Smtp-Source: ABdhPJwG1tYUKi5wD7Ar62zqbqLO+MgmnmzlJd9Sjcj58rJ+Oh3zmGJvqGliThZhV2w2e7nZu6yvNw==
X-Received: by 2002:a05:6808:211e:b0:326:828a:6901 with SMTP id
 r30-20020a056808211e00b00326828a6901mr2455777oiw.115.1652276014183; 
 Wed, 11 May 2022 06:33:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q64-20020acad943000000b003264e122a9asm714139oig.54.2022.05.11.06.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:33:33 -0700 (PDT)
Received: (nullmailer pid 177414 invoked by uid 1000);
 Wed, 11 May 2022 13:33:32 -0000
Date: Wed, 11 May 2022 08:33:32 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 heiko@sntech.de, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Cyril Jean <Cyril.Jean@microchip.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 04/10] dt-bindings: riscv: microchip: document icicle
 reference design
Message-ID: <20220511133332.GA177299-robh@kernel.org>
References: <20220509142610.128590-1-conor.dooley@microchip.com>
 <20220509142610.128590-5-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220509142610.128590-5-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_063336_571880_EF022A8C 
X-CRM114-Status: UNSURE (   9.20  )
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

On Mon, 09 May 2022 15:26:05 +0100, Conor Dooley wrote:
> Add a compatible for the icicle kit's reference design. This represents
> the FPGA fabric's contents & is versioned to denote which release of the
> reference design it applies to.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
