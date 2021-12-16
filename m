Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D876CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 21:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koiZmQSJRvfeEq5WKFs8vw5ZX7uW8TpmNPFPKZPKV8A=; b=lq/3pzQrgewXSw
	PZY2Vm4VAW8pxjSplBIoYE0A4xRdmBIS7nqp0h1ckneUyXp2/eeMXHPrWeObRzVNo60lgSpRbPWS9
	1+L0AfbTLpQQFhXkE/xKxgQiejX88y8U3X3Tx8KsI1ec030pBmSVzP6SyDloP4Jm3Y5Q19lhRxwUK
	DMX4FNalmyz2tHDGAB0BEJ/eQdX+heszlB0eKTWKLbvnUPzeXhma22lgbM5NRFOK5F80UQh6le/0K
	kqxhCFpvDsSpQKidDp6aicVF3XjfxDlwV+hGtd9J7WxxW2wg7HjHLNrPeYe70POHjlBU6N6XeWI+8
	9uwN3Rkiku1Xa22FU0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxyKn-007gVm-Oy; Thu, 16 Dec 2021 21:30:41 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxyKk-007gTI-IF
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 21:30:39 +0000
Received: by mail-oi1-f169.google.com with SMTP id bj13so794977oib.4
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 13:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=94tmzfRyz/2ht7p28AZCEvikg92RoVzFn7XAnXNJoM0=;
 b=nlpcSFLMkAKL20jO8VpQRKWwSMT8LShPPzwpsobp6xJCJ+mKU0lspnW1rxXJl6diAK
 h1hEKWUmbOZ1JlUS3GTyWADl46e6NwrhsdmS7+e2dfs6iZuA2jWa2uUx1IThzBZutWQU
 5ldl+oEi1lZa5rDJthF5FaAdAcaIx+1N5bDCLT66j0bww0Srp6FGAhFZYGyB6fO12L7q
 MhiAu2ei3k62RlM+0WV75rB/qcEJ5s4h5IhNl+sBFHTasCGb7D+UP/kLQHhn+09XxT3b
 RVHh/kSZtiSRIJufrI+KIlRL9GWafC4W5W4mJrFnlsroX7aKSFdT9ygtiq70TNMriPZM
 mD5w==
X-Gm-Message-State: AOAM530nQLmHcvLoQW9/ICKpzjuO1zXhPeNCXH7E3rEA7/nR1EMSE3wv
 5vzPO3EN9y7U064ZVezwrg==
X-Google-Smtp-Source: ABdhPJzG03I0AExOUVl+P3tfAIYSyiVcZkGh1MO2sf+PYWkhxXBP7uwSnh3PQuEX4rZ0rzXNkgp8UA==
X-Received: by 2002:a05:6808:1246:: with SMTP id
 o6mr5733670oiv.73.1639690237248; 
 Thu, 16 Dec 2021 13:30:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c3sm1313179oiw.8.2021.12.16.13.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:30:36 -0800 (PST)
Received: (nullmailer pid 799562 invoked by uid 1000);
 Thu, 16 Dec 2021 21:30:36 -0000
Date: Thu, 16 Dec 2021 15:30:36 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: timer: sifive, clint: Group interrupt
 tuples
Message-ID: <Ybuv/Jnyn4Ue5KAx@robh.at.kernel.org>
References: <cover.1639662093.git.geert@linux-m68k.org>
 <2859d2377f778b592c7b52597e698abc628de8dc.1639662093.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2859d2377f778b592c7b52597e698abc628de8dc.1639662093.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_133038_632803_5B952F95 
X-CRM114-Status: GOOD (  11.13  )
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

On Thu, 16 Dec 2021 14:43:48 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "interrupts-extended" properties should be grouped using angle
> brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Split in two patches.
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
