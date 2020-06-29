Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2B7C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421AC206C3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYCWPgFA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="P+epqYZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421AC206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JkOMuA598dRAwBm3WKx37Et7wkzKKhNcb00B1V5a11k=; b=DYCWPgFAL7nVym2KxulnxVbp/
	PsVKxI8Y2Q8iSMFKRTiPmEhxis4mBJ/rJr48u/EsLDEOXKMzCRpr5gwnl01OVtlcy/hzhYxLo40Bu
	+yfGJmw1a7WgqmkBiSunjw2V2zcRUaPLAcGsgAxlxIkZPj5wTIBPX0XJ2EvsV9RPhJhaOWg4P2V/5
	LL2ONASkV1Ewf2nZHikc8qNxd0k4BmfKQoJytc5MolF3jMuvg4tn+u5a+MmmwgT/TRp0m4QY3i8n9
	4X4I375xDpfHX3naj9wFw8zZMyAHOp+GtrWo6Z49JwZNeT3+oShifg5fM7E0Tw0vFIT4n/dOw98gy
	NwJUKJfmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpl72-00047b-GB; Mon, 29 Jun 2020 04:09:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpl6z-00047M-1J
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 04:09:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id s10so15036373wrw.12
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 21:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jqfpvi3iYp3AoWQd6MSO7doKcVpn2TJcLUHhv2lCYnI=;
 b=P+epqYZloSbYG+AbCi/vnUslABKw6dTGUxMtmqk70qo8e+GHDnz6Dbj5BXuIthZXlr
 0CUpkny20y3Yi7lcLdxO2389kQqc1CTuKFzUqM8HFZl6leu+QHNMNupx6coQ9Xamlt8J
 UrVTd09fowebynpt5CnTRX6sTrUk3AEUOWSufL5JBNhUQc3w+a8ju9ea9wskW6zcwJIV
 Nk9jFaS8B2u61i4nClqxT+s5PbGTbUnE59r5ZZC+wzzFr3EQ1+J4+KrFqIXMj1UJ8dko
 PHGqVkikH/7/UHJnsmnU0RCBkuyeJOQlXlvXwZG8auj4EAlsUCItoyML8iPmiC3N6of5
 oQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jqfpvi3iYp3AoWQd6MSO7doKcVpn2TJcLUHhv2lCYnI=;
 b=Cq3ZdYmU/m4kbx224KTIVQG04VocO5UtXmdu9Emkb8+J0yzfKC3kn1sHpXMNsREHS+
 Ca6+e7gO+DlhP9B6hB6BXV0GdSnvdLIB1KhhKPfe1SZZa/IxfkbWcFevcdpMsTXLrViW
 AvyAZqmHHPrUqkpfB2xTMbkJ3chChyAykG0S0mGQmCcXq+lhrTBHMrLY1fhvNFY/TuJz
 2Eqy0263cFoLPbS40wXyvKs6jUUA39hwTDMiFu1DUJ2xtzJcoitdFzTXUSHc9v8sh3L6
 2s+AGSCBApcMCLgmeGACYNJGuq/BQ3ESQHO60UBubu3vDB5SBEZ3wyLFA1mtI3fGZa3S
 i/Tg==
X-Gm-Message-State: AOAM5337SlfLo3iE/MIANpqVCaHKsITqIe3ZqKp/dT5YCRQDMErV8BWc
 l4W2N22Y7v8Q1liDi2G30fi4+7XdjKQzy2+s5z95Ug==
X-Google-Smtp-Source: ABdhPJwx1knjHefqrB+oeWQ3YcqzAY6RsgARQklwQOrsgV4BeAw50AB+MKIpRinxVhKDLYaH38jdH075e1ij93+pORY=
X-Received: by 2002:adf:ff87:: with SMTP id j7mr9282883wrr.128.1593403776321; 
 Sun, 28 Jun 2020 21:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <3de3a480517d167a3faae086aa8ab0c0c7141d99.1593397455.git.zong.li@sifive.com>
In-Reply-To: <3de3a480517d167a3faae086aa8ab0c0c7141d99.1593397455.git.zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Jun 2020 09:39:24 +0530
Message-ID: <CAAhSdy3VBUTMg_b2tO12cTYuvHYtH=4dj9-qT-at35Whf3w_7w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: riscv: Add YAML documentation for PMU
To: Zong Li <zong.li@sifive.com>
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
>
> Add device tree bindings for performance monitor unit. And it passes the
> dt_binding_check verification.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  .../devicetree/bindings/riscv/pmu.yaml        | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
>
> diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> new file mode 100644
> index 000000000000..f55ccbc6c685
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Performance Monitor Units
> +
> +maintainers:
> +  - Zong Li <zong.li@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: riscv,pmu
> +
> +  riscv,width-base-cntr:
> +    description: The width of cycle and instret CSRs.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  riscv,width-event-cntr:
> +    description: The width of hpmcounter CSRs.
> +    $ref: /schemas/types.yaml#/definitions/uint32

The terms "base" and "event" is confusing because
we only have counters with no interrupt associated with it.

The RISC-V spec defines 3 counters and rest are all
implementation specific counters.

I suggest using the terms "spec counters" and "impl counters"
instead of "base counters" and "event counters".

Further, "riscv,width" properties are redundant because
RISC-V spec clearly tells that counters are 64bit for both
RV32 and RV64.

> +
> +  riscv,n-event-cntr:
> +    description: The number of hpmcounter CSRs.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  riscv,hw-event-map:
> +    description: The mapping of generic hardware events. Default is no mapping.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  riscv,hw-cache-event-map:
> +    description: The mapping of generic hardware cache events.
> +      Default is no mapping.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +required:
> +  - compatible
> +  - riscv,width-base-cntr
> +  - riscv,width-event-cntr
> +  - riscv,n-event-cntr
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmu {
> +      compatible = "riscv,pmu";
> +      riscv,width-base-cntr = <64>;
> +      riscv,width-event-cntr = <40>;
> +      riscv,n-event-cntr = <2>;
> +      riscv,hw-event-map = <0x0 0x0 0x1 0x1 0x3 0x0202 0x4 0x4000>;
> +      riscv,hw-cache-event-map = <0x010201 0x0102 0x010204 0x0802>;
> +    };
> +
> +...
> --
> 2.27.0
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
