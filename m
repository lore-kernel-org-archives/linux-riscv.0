Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CF2C87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 08:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NdWoYIVGw4aSlN5M68P3mx98h9ThDBPYvrXjUIvag4=; b=gcRrleBP2fBRiK
	7cnFwk7i8pWPTyDbgw5PtJrOp8G13ojhixILCPijI9SYfJPt/0ATvVvdH4ntSUcae+ILfLIhaFK01
	WujuNVU5H0WvD0hY+BPq1hrerdwL69C7oq5nOA013XWNrumvPHO05J0W0xnjvmeVKpeccTBXaDGc7
	EkyYWHWIOH+rldBcD50nhpOCTW5zxVDIsz53Z31vI5XQ/vpvg4fKdFbv846g3Si0WN8LBG4iMTIZB
	gSkPvSw+eKdfeRpb0c+kb7MjGilDVY3/vthEWYnPZhtGsBsOwJ2QFbqHTGmUiS7AdVny00wzmmz8Z
	/wikSHDEvOsV551wlLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfkJ-0000000GGFR-45rU;
	Tue, 29 Jul 2025 08:31:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfkG-0000000GGE3-1cXn
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 08:31:38 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-31e41cfa631so5514421a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753777895; x=1754382695; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3tQDpY9kmcpxqJo02gP5nd31GjHYrw3D1aQf8x0gRc=;
        b=chddPymjoPIBGZ3jjY9aS6mDn6ce6xJIorTT/dDk3s9kIDCa09H93kzIgELtO5l+MH
         A/LQ2QFU6UQLVekx6Duzu5BxOlraW8j4vkJZ0WoqF9CtpZxtI2ZWIBLRL9PULs1n/jVj
         +BPnAEsKzBCY6oAERlz0Ivqwpy6p459PERPcXv6MMO/X3XFVBlK0dPOS6tmJiIEK4Quy
         pXhGLc+N7k6/1uYYjKOiPEbsd/skRyEyg33LkukxnDkSjxBUnWTrruIHGuCt0/C0JAF5
         MnBWgPeoqXTeagxP08+0fiIrp+kYvCcK20lGkqReD3baoivZxvSGUD0upYXjXjbSpxpn
         TdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753777895; x=1754382695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3tQDpY9kmcpxqJo02gP5nd31GjHYrw3D1aQf8x0gRc=;
        b=qIMgCg3metj+A4FU7OjaeGgVP9lY0DRNa7qbdFl9AwJZfyUTbyMPJmQ8Rb380iw/6T
         4z6Rlox92yRe444cVMYZLgCDnfQdjHWVGBkvv0RdoMtO/ZTT32nlLkIFsErkjx+hyUTz
         w5mIKmstESBomx6toy3V1Fx/HwHq/laafAKE85bJT+KmxNnXqkUXK0TeiiWIx/FoUGpV
         q02He6uayqzaJMcCFh7JAcRJtBU34KVmAWteBKcU3qYUKHfzmAdL/E1nNYLM4mmTKXNx
         p0bLqtuvpyBo5/erFOQJDMl0I9odE4UAZ2bGSbac724hsYzXOtc8+ochEQysURJ20H20
         2dPA==
X-Forwarded-Encrypted: i=1; AJvYcCVnY67f9G3totMnB55My50wqeYP2D0gZezTDRAtgqPjcE3tVPjxRx2/zdr1rLoIXDk2s3wRKLi7uDR6sA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN/thkj0wVM5+mKA2FpEab21Xk7RURvywWgBPs4qIBnX7+shuI
	YH/8BOgIhrfPUUbdHkzPagMJil8jHqwtuZW6VjMiFhGTehJBbGQ9m0jo
X-Gm-Gg: ASbGncuU4aJlPZKetl0bxEfS7cgIsLjP0aAA3w2wP+vbAu66Jie2735sVPci9waduFx
	D17pX7SLBG7QrHcOjHJ7JaVrivOSRfuO6bcFiOdHCe//lELZUsJMDb2kp6Vbgbm4MvjCzrhAUeq
	KMZ6QIgd5tHaS0re51+Ephkq5mqu1GoW9ZrMnwv8mwjcz2xjtNtzZQB0AmOV4U/JWvAi6/jjEYP
	daxCDd/Y62aOM0P1cbR8QhcHU4N0MrSPDlEpjrqlYTcCwNHYRTPuVBl0l18UYPvbNmxbZMKYAJH
	YOXf00gW9NC8c2Dhik3lNJhR8VSU2zYOl9uKOU+ov2nO5qu0+tt0vAD0vb5aEKVugD6o5XK6AOy
	ryDp4DaVaOLwVLAPgpKD2Vd0vE6cG1uJu
X-Google-Smtp-Source: AGHT+IH3/A1CboxM+y3QmvNziehjws3MkOhzin8JJlZv9QPmsMuudb9IbcMH6qSkoi3W9mg9v6j4HQ==
X-Received: by 2002:a17:90a:da8c:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-31e77a027b8mr18810110a91.23.1753777894979;
        Tue, 29 Jul 2025 01:31:34 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31ec91fbf4csm5462503a91.12.2025.07.29.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 01:31:34 -0700 (PDT)
Date: Tue, 29 Jul 2025 16:31:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
References: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
 <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_013136_428146_E64D3997 
X-CRM114-Status: GOOD (  19.50  )
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

On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> processor typically running RTOS.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo C906L remote processor controller for CV1800B SoC
> +
> +maintainers:
> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> +
> +description:
> +  Document the bindings for the C906L remoteproc component that loads and boots
> +  firmwares on the CV1800B SoC.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-c906l
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  mbox-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  mboxes:
> +    description:
> +      This property is required only if the rpmsg/virtio functionality is used.
> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> +    items:
> +      - description: mailbox channel to send data to C906L
> +      - description: mailbox channel to receive data from C906L
> +
> +  memory-region:
> +    description:
> +      List of phandles to reserved memory regions used by the remote processor.
> +      The first region is required and provides the firmware region for the
> +      remote processor. The following regions (vdev buffer, vrings) are optional
> +      and are only required if rpmsg/virtio functionality is used.
> +    minItems: 1
> +    items:
> +      - description: firmware region
> +      - description: vdev buffer
> +      - description: vring0
> +      - description: vring1
> +    additionalItems: true
> +

Why not allocating these region dynamicly? I do not think firware is
always avaible before staring. Allowing dynamic firmware give us max
flexiblity.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
