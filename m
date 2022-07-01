Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51897C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYkPPimgOrSLHToOlWI72QrSO2P6aFCUpo05xQNg898=; b=kmPwMsTrdf57Kf
	4XAzZ7aNi3+FsPL7daboAe8nSTkfwYck150dmCBDIaqgnGQtczfXAxZMov2Q5J8mZpEUGkuPzEhyq
	i+46syYnSeK/td1S3/lcoociZ7l/zKNR/3C7XSEk2aay+eGHgtPBwmPoFtrct8qdAAt+FAgRPbbv2
	1Kt1uvQhyD8VcmecjuXOxjcnE2ZpUZIE09vICueIY6UvH/bDkZujxmgzijSkCqQXoBV+bF6yv1skJ
	0pPImiZT/a/t7+84jUthWedimLYNkCCJG/1E+5qJMfKrP92EC3hDkarEkiH9oaNTodRu1BQQ8H39x
	GuIP2b2a6I4luckF45fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NMC-006pM5-8I; Fri, 01 Jul 2022 20:35:16 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NM2-006pJp-PN
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 20:35:07 +0000
Received: by mail-io1-f53.google.com with SMTP id u20so3316605iob.8
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 13:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U4bvbxWYfBS14+6nLRZ6HPagQvTsGqmEJtGVd36oP5Q=;
        b=nXpOWAU1CMA5KL0v0ayEkrZ7QLazXp5xlLol2TKbZZggMUyylXT8W5ozM3VNE1Q38T
         WwTOdlKQSI51s5deBPD+jcvMzl71Ldjy0X6Y1gVeuUIxx7TEnS78h2XRBYmoiO0NF+Hj
         fR9mE9ulzKTEW/rrLXf12Pqk7rWyQ2Kmtupn7HWpD+veRw5Jq121NHzOQbsAss6cnetH
         +SLVxc71ioSQISpNHoMMACgVGwXzjQQeP+IVFCuqeied0AvMCZZObZWb/dGsVISZcevj
         I+ai4b34maCDGhkqjxXfaAZFCMmMHwKJ70Se/Ch//Fn4BP6PwbfLPAO5FhGI6k5kib/S
         /HyA==
X-Gm-Message-State: AJIora+tCXZgaGYP8lF1V91aMLOpcPO4GwTwpyhkuhTrwwFnrgSoBYeC
	W2pW86+IIhfx/rTFSc99Zw==
X-Google-Smtp-Source: AGRyM1tayjJLhWLrzDeY8SLnBtrFnaK/S7ilMq60ejMBYlc6NtF1mCK3i4PS6rP7FypEMAp7CS67Bg==
X-Received: by 2002:a05:6638:42cd:b0:339:eda0:7d3f with SMTP id bm13-20020a05663842cd00b00339eda07d3fmr9738315jab.41.1656707705436;
        Fri, 01 Jul 2022 13:35:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d5-20020a026045000000b0033c836fe144sm8120568jaf.85.2022.07.01.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:35:05 -0700 (PDT)
Received: (nullmailer pid 1478827 invoked by uid 1000);
	Fri, 01 Jul 2022 20:35:03 -0000
Date: Fri, 1 Jul 2022 14:35:03 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-riscv@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [net-next PATCH RESEND 1/2] dt-bindings: net: cdns,macb:
 document polarfire soc's macb
Message-ID: <20220701203503.GA1478772-robh@kernel.org>
References: <20220701065831.632785-1-conor.dooley@microchip.com>
 <20220701065831.632785-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220701065831.632785-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_133506_861564_018A7B75 
X-CRM114-Status: UNSURE (   9.05  )
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

On Fri, 01 Jul 2022 07:58:31 +0100, Conor Dooley wrote:
> Until now the PolarFire SoC (MPFS) has been using the generic
> "cdns,macb" compatible but has optional reset support. Add a specific
> compatible which falls back to the currently used generic binding.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
