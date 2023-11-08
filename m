Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CBFC04E83
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 17:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hg9j1NqM+2M9UcNp+0k6ugAUTlgpXGzYQMrquUU6QrI=; b=YN+LmbPIdkqIpc
	NDl0foPxBVoxWIx12sj/EVhh2rg+ah1CsfPIsQI+fG5iEnbcQ/e3xfN2iF1X5qpr1VIpxbiyaXtKY
	MCA3tCHC1CvnD4maAx39zW+Y9WZtlSIrSDY4taudpx8NYZu2SKAdsGrEnV+MImPUHGYUaXak52r84
	DGUQHxgoGKl3hQ86tGXor6kgjXID2zIpnAaKyo3IbhXf9ObFjBdmp8uJILpMlhZPwrCwTUAdSgJhA
	jyHXLKlMDKwM98wS9rVToPQ0Map1DSuMKlnMQDEnT2q54JzsOgjUszVmKIxAzYkdBg81oVzMZNf7D
	mwJPIkuXU2IiYGFelrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m65-004NUP-1M;
	Wed, 08 Nov 2023 17:12:09 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m61-004NSR-25
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 17:12:06 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5845213c583so3594910eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 09:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699463525; x=1700068325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoqEuJK3L2jvBHVX0Mpw971ft0z0hhSp7nlVmckWjlI=;
        b=tc5TtpKbCFSYiKI8tA/B05+j4qvxjp3BmdQGEXJWl9LcETMIvd2vFePAaJ03Z353tR
         ZK/HeKNjjnbwsRJKaaHKIbSE+Enk34yjINjipYjKZb7ekn3GxZmyF9Z3XCze/te9DjdR
         1Tl0mj6+jKdVNtxtCl/mZcOSR8v4Yvu6JgO75RbYyl6ISIpHxkfhvsJ18PTz42ReLDUY
         SkJZ8pZVGifLKlz8sQcdYWxne024Za6Hu5umgxCXhSvN+oVQMo8xqY04isb7vPHK4Xfx
         SP8ZXducK5WbC6aNOEF60p3wMHJqcV9KB/L0mBZxZKZ0r0wITu2l/bfQtWXgKcLJfECb
         2csg==
X-Gm-Message-State: AOJu0Yxqa10mio3tIwJ90gIebrOjg7qTBlk645dBCfY9ikYuOnU8SvgW
	hNZhj4pHLFBnbomgpLTvdQ==
X-Google-Smtp-Source: AGHT+IFzRRe3+ULoXVKLekkDLT2E46OQ2R4s9QZ1ENZ+UvEE3WkT/0Ga2EKu7UWArEUdcFOI9ofQAQ==
X-Received: by 2002:a05:6820:1c83:b0:589:db63:bfd1 with SMTP id ct3-20020a0568201c8300b00589db63bfd1mr2676269oob.8.1699463524765;
        Wed, 08 Nov 2023 09:12:04 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x16-20020a4a97d0000000b0057327cecdd8sm2535510ooi.10.2023.11.08.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 09:12:04 -0800 (PST)
Received: (nullmailer pid 2492952 invoked by uid 1000);
	Wed, 08 Nov 2023 17:12:03 -0000
Date: Wed, 8 Nov 2023 11:12:03 -0600
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V compatible
Message-ID: <20231108171203.GA2434548-robh@kernel.org>
References: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_091205_691020_444345E7 
X-CRM114-Status: GOOD (  13.86  )
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

On Mon, Nov 06, 2023 at 12:37:47PM +0100, Michal Simek wrote:
> MicroBlaze V is new AMD/Xilinx soft-core 32bit RISC-V processor IP.
> It is hardware compatible with classic MicroBlaze processor.

How is that possible? It's a different instruction set, right? I suppose 
the IP interfaces (signals) are the same/compatible.

> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Anyways,

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 97e8441eda1c..7b077af62b27 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -32,6 +32,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - amd,mbv32
>                - andestech,ax45mp
>                - canaan,k210
>                - sifive,bullet0
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
