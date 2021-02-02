Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263ECC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 17:55:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBC664F8D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 17:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBC664F8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sqHdGV8J4VTMpcnC0ogjG32gMZQ57xrFHSumEpVEogg=; b=xcKtjTrFb+HoG7mXoez9BmOwF
	rHFQdqXUBd9qqb15QQmGe/SeCTaQwex4TlWPcqAAbxzgdLnLYHfSU71UwzynqI8CihOQpR7ggvqa2
	WrqU0cI0X2/sKtqZxTt/dbA0+kBhm/bwDm8EvtJEaVbCOsYCd81t9ozx2QWWJqgqt9mdEoKJQ4HI4
	UtIQh2xtgtUmsLliq2YVgALLbY1EmaAfPTv5n3S1XADHaKknjOee8fKMCcf/Id/KuWoQIxb3Zuvbv
	GOAGOoy4yAKk10uqKEffyCoBIsDGRCcnbAgMGnaVClF9gqvVELXnMZGWvtNRPZD4luXgoz6k8HOtS
	qOiEoGfxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ztj-0001dg-9B; Tue, 02 Feb 2021 17:55:31 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ztg-0001dE-Sx
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 17:55:30 +0000
Received: by mail-io1-xd35.google.com with SMTP id h11so22242935ioh.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 09:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAwwh+o0gGboolgQvMDHmCpsBwrqp4KIQmH6QKSvEDA=;
 b=HRu4N2bONjad5pcAUw5hnjGJYNGH6MyOSIVsgEi+ZTAZtoBHOwefxCM+Nzr/0zdqbN
 YKDK3CuFadGYjzkbKsXvyOF+yXJS7Inp7qqJuAQ1mE8wrJxCQ+SHlTH4sTHaM/WG/ikm
 d1n7nsRi96wadeFiEqxZROC/Iry5gdXhFnQjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAwwh+o0gGboolgQvMDHmCpsBwrqp4KIQmH6QKSvEDA=;
 b=qSd0NbF+SV5BY6K+wz51hTskU86s/xvjZge7GmcWBLs6RQi3lNwnaDkkgOdhPbatvX
 7e6+S7dy2Ihes89u+Xwx62q1GVqYUYMYfqt/JDg4lEppjTW1rReQgD0hDwZe7eB8xPZI
 VHIzl5ItxZSWy+4wtMkOUrQZ6FW75FQSEUwR5Z992fO+AUqGtz4gHGlqQpVWexx2wrZP
 4qfVHcQ8498WfXq9A61cuLOHa8t74HUo9QJch6oDBORCTnxWpgYLBCG9j5v+Z1plvG9k
 hY+Rypbq6OVKUcT9WOTjunOW8IFlwbHDzqcwUWz8Y+HrdZH2qwHvYilF21r2A5CtuzW0
 k+4w==
X-Gm-Message-State: AOAM532KCC5GwPcbq67nto/VT+KcTVoNXr1tV18gcrnqNM/BcUJWtd8Z
 E6OEnM6sBNTpQf5I0gzaRcPOa38rEXJs2g4x5qFk
X-Google-Smtp-Source: ABdhPJzLA3bGFttKBMX6Qt78WekVW5Pb5XFdYuYwpSZd/7Efhvn7Gwhipfk2lesixDKZc9FRHJFAkIlGHo3ZDNmJDpw=
X-Received: by 2002:a05:6602:2d4d:: with SMTP id
 d13mr9367082iow.0.1612288527189; 
 Tue, 02 Feb 2021 09:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-3-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-3-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 09:55:15 -0800
Message-ID: <CAOnJCUKzEivmEHCdB-8XQ3Vm_tWv_auD_5VciGDagwKz_PJ4ZQ@mail.gmail.com>
Subject: Re: [PATCH v14 02/16] dt-bindings: add Canaan boards compatible
 strings
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_125528_968922_5B3ABF1E 
X-CRM114-Status: GOOD (  16.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Introduce the file riscv/canaan.yaml to document compatible strings
> related to the Canaan Kendryte K210 SoC. The compatible string
> "canaan,kendryte-k210" used to indicate the use of this SoC to the
> early SoC init code is added. This new file also defines the compatible
> strings of all supported boards based on this SoC.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../devicetree/bindings/riscv/canaan.yaml     | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml
>
> diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
> new file mode 100644
> index 000000000000..f8f3f286bd55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/canaan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan SoC-based boards
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description:
> +  Canaan Kendryte K210 SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sipeed,maix-bit
> +          - const: sipeed,maix-bitm
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: sipeed,maix-go
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: sipeed,maix-dock-m1
> +          - const: sipeed,maix-dock-m1w
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: sipeed,maixduino
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: canaan,kendryte-kd233
> +          - const: canaan,kendryte-k210
> +
> +      - items:
> +          - const: canaan,kendryte-k210
> +
> +additionalProperties: true
> +
> +...
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
