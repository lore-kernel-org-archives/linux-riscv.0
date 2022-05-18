Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF230C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 00:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yDkUR7ksId9mWZ/q50I65M7cssoRLoWWc1pYpysAoc=; b=demhu0G4FaZDQt
	n53TwrOV2KGYQRYXGkpLHC5Wf0BGdB5+oZkqP1g1g5+Qo66QTPRfAGRuITQelVZu5fUKL9lwDgieR
	dIWb3s54F3Abpr0o9khVlrHBJThOtrU+ZAls49Qx5KEeDYA8qNSAWey07QTwa8e0iwwiMCtmoT9Pd
	a4f9zMssWxI6xOeltABRwhbNEfvGSIsuC1s1sX0uU58E1MQv3aaK29aNzAucQZL84X7iqsQx7ri+D
	K/qw707baMmiyriJUM3rpk93OVkYS2A5eelgjqo86GSSa9f2qlEDANQMrVKLFnUvkGO/Ue5BwS0S4
	y1gpDR+YXhZNWSCcYhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr7VQ-00GMoP-Be; Wed, 18 May 2022 00:25:36 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr7VN-00GMnZ-2h
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 00:25:34 +0000
Received: by mail-oi1-f177.google.com with SMTP id l16so865142oil.6
 for <linux-riscv@lists.infradead.org>; Tue, 17 May 2022 17:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2PN69YcQuRroEf0QfFtNKCNOl7n65i1negbEM5qktIY=;
 b=d97GbkwgEN7KlqlCkONWbqjHgz56v9S5U7QxhF90Rv6Dyn8U2cqz5CvAl0PgbRjvr/
 DngSNXjLhnHA26pR+RCgmbbfapH5MZiHh3aAcSEyq/H0Y5C06MMMxp+0AQbE6KMll2G/
 SXRHLfTQ+Z44m9zTnqBUgpQSpxBi505Bmd4fyp44WdM3H9B2H2g9nsXKt6EMolzLfrom
 vfW2rUV8bLB5RMRXRQhdaXSFbYQndTPAsOemCuBrgI3ndtfhV0GVLKmb3bkU3wCYDGGU
 W4u+KbIitEhZTeTCabNgU1+ja0YhbAu/6ETEjiQNwucbs2QV2eg9Lol8tI+AaYVvc0eY
 gcVw==
X-Gm-Message-State: AOAM533uX35BFEQcknlLyhoIDMJcvRZaCniEMNttqEidBV+a9RkXdVQM
 s85L3sUdeU/kkQYd+/7vQw==
X-Google-Smtp-Source: ABdhPJziK8pztuaPLKL5LYFdMFqO/56+2LtDMRgd6gaQ462+ZfsGb5YXE9b65MNQRYlF7QOm36X91Q==
X-Received: by 2002:a05:6808:151f:b0:328:aaa2:10b8 with SMTP id
 u31-20020a056808151f00b00328aaa210b8mr17147368oiw.60.1652833531280; 
 Tue, 17 May 2022 17:25:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v196-20020acaaccd000000b00325cda1ff8fsm318670oie.14.2022.05.17.17.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 17:25:30 -0700 (PDT)
Received: (nullmailer pid 1933964 invoked by uid 1000);
 Wed, 18 May 2022 00:25:29 -0000
Date: Tue, 17 May 2022 19:25:29 -0500
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org,
 mick@ics.forth.gr, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
Message-ID: <20220518002529.GA1928329-robh@kernel.org>
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220511214132.2281431-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511214132.2281431-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_172533_160772_18E7AD06 
X-CRM114-Status: GOOD (  16.95  )
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

On Wed, May 11, 2022 at 11:41:30PM +0200, Heiko Stuebner wrote:
> The Zicbom operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.
> 
> So add the necessary property for the system to know the core's
> block-size.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d632ac76532e..b179bfd155a3 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -63,6 +63,13 @@ properties:
>        - riscv,sv48
>        - riscv,none
>  
> +  riscv,cbom-block-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Any value 0-2^32 is valid? 

> +    description:
> +      Blocksize in bytes for the Zicbom cache operations. The block
> +      size is a property of the core itself and does not necessarily
> +      match other software defined cache sizes.

What about hardware defined cache sizes? I'm scratching my head as to 
what a 'software defined cache size' is.

> +
>    riscv,isa:
>      description:
>        Identifies the specific RISC-V instruction set architecture
> -- 
> 2.35.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
