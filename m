Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571B4C02187
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 02:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwQN5UbF5BM7dOugyg+Vyz8evy0BlvI7dHN3BWw0jjQ=; b=S61503NWYQNLjW
	BCGwLefYlcmVqPnqQnG8JwCFr9wOatlav8kd/dw8At7h+ihiR7i/IKzNmTQRDgvcQKtU0gU9I+lNR
	K+yafLmFi0ZVt4bs2vaiYIGoB9eSdkc829RDPRPc/c+UnJTV5qGZRSr7SF+rCo/WuLp5zyy+Ow+Al
	PPKuDiU4vkzIdIRsNk5uZ5e6crishGaCabMOmYxowxVodSyatuj7JQoXW5h7zbOAJTw/tIEMcJ2j/
	gQdQfAp0zB9zN9L6fnGhTTIpDCacLSIHZdEe5/Dfj6po3mrnMexHMOkbRZqW6uay79XuxLSo2JPlZ
	vQEHQP/q07cdxGiY7kvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhkw-00000004bxY-0EPB;
	Mon, 20 Jan 2025 02:43:14 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhks-00000004bwx-3iOw
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 02:43:12 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b6f7d7e128so493844385a.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 18:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737340989; x=1737945789; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0b8eTjATUzdztbVZiM4oxXleen+QhZpOZdDInckSBU=;
        b=HshhQsqn8rxEhrqUBxTnPP4G25B6P/jOeszC7Khb2y02zTVW1KzlFOaMgXnR1BpWbA
         6IIoLRxBVU8+tkbLVHqMp6Z4mTJnl2+ekjLw9HW+e1NvcTaiazBRrMMmRVEAPGDMulaS
         b4buBEWTiS2bZiKKGOsifqv29hiv1ZUg3u6Bfm2PwM1A3ayPOPBdespaOBU0a7r1ohvk
         5+I02WPQuju0zS7YTAU1x/hLARLdgy5/dwbFI7MAkYfI2Py0xfTVN3M+nPosckgAJFI0
         yMBFN2q8m+asAWqJZ5lBBqFeTIN8hMr4mfHT5XRdqyFJdUGDpToHfxam0XjKN4zTUNEK
         xKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737340989; x=1737945789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0b8eTjATUzdztbVZiM4oxXleen+QhZpOZdDInckSBU=;
        b=qxyKcyR/D3wNdcr5jE/g9hTaq3QYzbEqHt00YNL14Bj6s213CgvL2VisWfrNyisfTE
         3WeoOR9wCoVYRL6wVr3zIjYSaNwLrSizUHOFpylwKWGowWvgtBUjgnjli85C21REh1DZ
         BvM+SgWlsdmxmILbl10a1NEP1A3cAND/KH9asgHQvGMCOZaWr39BsRJesY3gs1L4cg2L
         8JM3rHQF+6JgYwmKuQzKgB3Qn6sHw0YAKLFtLgoljKy+JjEKKLe6Bi8sFCX7o4oCSFpE
         H/aT2jPHVAMjUwOgG7T/eY4G6Fcf3CG5eJZ+uUiBsH8byhqoQdAvZREamSH2RkmYIYED
         yUxg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1LQe3Oxvs+pg8GKYZUWD9i8pLWTDB6Wp0uvDw3baMt/q1qWeVB7q/MjtD59EojjbMGupp+tQlUt9Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5QwjVVQ0QuaLyRdPyq0it9U7QIWO4/zMzHMCg8YxdmQh6gWo
	KwBOESjI0zTCm2kGThAT8VRseU8wZBwLC2AAf8Fbtd+ir8AMjAJr
X-Gm-Gg: ASbGncs1h6XRmSIsJNd8peyRThvInY629cBe9fgFSBdIFs/HtV0D2Fxj0heHMQ1Kk3q
	pFeA4fRuWR1sO0IaMuOnCGT5sjMwkI9eiMmaXUCSPRNpZR61w56yJIZ/Fq5VjZKRsXuIyVLUNAK
	KbUcyuWopxRsCjuqgOJCik1UCT8/skivu2w2PqoA8hR5phPNdS3TQOaTLE6AKprNND167RD1SjF
	paFk9vhF+MgoOq32gJgFH7BqgFCvKy0GkrPTRVqL4ziXA==
X-Google-Smtp-Source: AGHT+IFoHpJfi8044k/PmHjoOC5c88Dfik5Rwle26KExchj3zO4AsshsldeCR57sa8hWMk2gPB8R7Q==
X-Received: by 2002:a05:620a:2891:b0:7b6:eba3:2e08 with SMTP id af79cd13be357-7be523da32emr3003491185a.7.1737340989624;
        Sun, 19 Jan 2025 18:43:09 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7be614d98b2sm395108485a.76.2025.01.19.18.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 18:43:08 -0800 (PST)
Date: Mon, 20 Jan 2025 10:42:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com, samuel.holland@sifive.com, 
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2042 MSI
Message-ID: <gyf6cdqjnvom3adf3cr7l72e7xevewhrsv4koelpnfm5cd22ge@t4ru6avsihzd>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
 <c9dd12c3ad77b13dcdfbf4accd51e92e6ea2a4a9.1736921549.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9dd12c3ad77b13dcdfbf4accd51e92e6ea2a4a9.1736921549.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_184310_923532_C8A1FD38 
X-CRM114-Status: GOOD (  19.26  )
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

On Wed, Jan 15, 2025 at 02:33:23PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding for Sophgo SG2042 MSI controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../sophgo,sg2042-msi.yaml                    | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> new file mode 100644
> index 000000000000..f641df191787
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 MSI Controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  This interrupt controller is in Sophgo SG2042 for transforming interrupts from
> +  PCIe MSI to PLIC interrupts.
> +
> +allOf:
> +  - $ref: /schemas/interrupts.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-msi
> +
> +  reg:
> +    items:
> +      - description: msi doorbell address
> +      - description: clear register
> +
> +  reg-names:
> +    items:

> +      - const: doorbell
> +      - const: clr

please reverse the items order, the clr addr is more suitable
as the MMIO device address when writing device node. doorbeel
address is just a IO address and can not be seen from CPU.

> +
> +  msi-controller: true
> +
> +  msi-ranges:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - msi-controller
> +  - msi-ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    msi-controller@30000000 {
> +      compatible = "sophgo,sg2042-msi";
> +      reg = <0x30000000 0x4>, <0x30000008 0x4>;
> +      reg-names = "doorbell", "clr";
> +      msi-controller;
> +      msi-ranges = <&plic 64 IRQ_TYPE_LEVEL_HIGH 32>;
> +      interrupt-parent = <&plic>;
> +    };
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
