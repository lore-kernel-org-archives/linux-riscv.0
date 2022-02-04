Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4AAC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 22:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IowOGCJsRxJ7fZYVXeF2KWYNMORjOhw9mZFH4o439nM=; b=YoVJPGQN4SCn8m
	/049Hx6Srsnfg+GZYEvit7u5D57o0TbxFyZyRpjHzoJM9ii3NzW9MzSsl4hfh9wkpOVDrjw1ATNfv
	RB145VLW6CplqruwfLDiU/Mli4mn8/uMkKZ9ufkooH4ZAg0GLByQaZr8D7irYuCbCV9OQPBJZKIR0
	CL9dS86SWk+maKuBX5kh/iYzof+UOVTeYyUXSd/0SRVUUUDZOsONnjPARtSk5Mjf5wy0ZmrLl4rhm
	AaaYic02wHeI0vkSpnEpQKjnI0E4gT616xHcQD2njGGeN1aECGq4L04d8NAxpgn+l1j6asQ2ikZ/t
	Z0xA8+V1ysB9EjVzygAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG79I-005ac4-D1; Fri, 04 Feb 2022 22:33:48 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG79F-005abD-Da
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 22:33:46 +0000
Received: by mail-oo1-f52.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so6229857ooq.10
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 14:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q4Gn8/JIPxPBAROIKOguet0/WP6sycYjFPMRswgQQ08=;
 b=Xh1Zeeav2pFyz8R1aRy+Ws9n1/cbwjzoJp+T8AU7P3klveeXm6m4iBYh2x5Scjy3tu
 1HMCDSaqptccKjDAZNCIH90nVusZ4HMfN1/QTLKQv1eI+i/y6jxhtxrGBgqhGgn/YdRE
 pdf4q50qojxMdoY+RtAQnPQ4WogBr+UOC/5M+rzOHrf3Vqo1fnMuhKFvxIgpGRudJTtb
 V1QjCEgx7vwNFPv8/FLTOisVi1xjFtUZi1a0yR3O2yOnihlVvzvz3pGFEyCmkcGMUmCX
 fhXKqW7EF2/om33oP/1e3/8NL6OSkImM8KlU5pk3r9fQKhfzDnschlR5taTgZYST/qGz
 zm9Q==
X-Gm-Message-State: AOAM530H1oHGxz4tnCYw2lUKL13lQ5ke2UCxhV+lMK7O89M3B+M/TT11
 SfuXRb7MTXW3ehqbdtNH0A==
X-Google-Smtp-Source: ABdhPJxxGFbL+dwr9YXVucvOXSlOKzQXJ55WMPaQbBqLsMQeJKRuakTQZ//ZngXJ3zGtnHxq3V5LEQ==
X-Received: by 2002:a05:6870:d88c:: with SMTP id
 dv12mr474170oab.113.1644014024814; 
 Fri, 04 Feb 2022 14:33:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 127sm1309058oih.8.2022.02.04.14.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:33:44 -0800 (PST)
Received: (nullmailer pid 3305687 invoked by uid 1000);
 Fri, 04 Feb 2022 22:33:42 -0000
Date: Fri, 4 Feb 2022 16:33:42 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wefu@redhat.com, liush@allwinnertech.com,
 guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org,
 drew@beagleboard.org, hch@lst.de, arnd@arndb.de, wens@csie.org,
 maxime@cerno.tech, dlustig@nvidia.com, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v5 11/14] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Message-ID: <Yf2pxvmG0t6eugOz@robh.at.kernel.org>
References: <20220121163618.351934-1-heiko@sntech.de>
 <20220121163618.351934-12-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121163618.351934-12-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_143345_481188_B23C1883 
X-CRM114-Status: GOOD (  15.82  )
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

On Fri, Jan 21, 2022 at 05:36:15PM +0100, Heiko Stuebner wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> Previous patch has added svpbmt in arch/riscv and add "riscv,svpmbt"
> in the DT mmu node. Update dt-bindings related property here.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index aa5fb64d57eb..3ad2593f1400 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -63,6 +63,16 @@ properties:
>        - riscv,sv48
>        - riscv,none
>  
> +  mmu:

riscv,mmu

> +    description:
> +      Describes the CPU's MMU Standard Extensions support.
> +      These values originate from the RISC-V Privileged
> +      Specification document, available from
> +      https://riscv.org/specifications/
> +    $ref: '/schemas/types.yaml#/definitions/string'
> +    enum:
> +      - riscv,svpbmt

Are there per vendor MMU extensions? If not, drop the 'riscv,' part. 

> +
>    riscv,isa:
>      description:
>        Identifies the specific RISC-V instruction set architecture
> -- 
> 2.30.2
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
