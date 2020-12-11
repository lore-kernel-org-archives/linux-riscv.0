Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB36BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:55:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE8E23D5A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE8E23D5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9johOBACtNN2narqdr+PFT+caFNS77lY6Wlk6q4i8qw=; b=Ty91VZmB0rJGOUd6SxkcTP7Fs
	2VX/SZ3OMWkQV4LhVAVYAfbLjsYYXSmXC9RF+qhnvvScGL2+7/fsAmBZbBWy7AsIwvHFPqQbJ/duc
	kLT8l+dLn1K77ydDXmxakubgFz7JX+hCF0D/th1lZTiknJvMjENMTDbMyLff2B8jG79UaL1unmyYD
	SZbyZaBTrlIPdJb4f1A8tv/cxTZwnkYgXyGxFh0wZItWbPrvs1vw4v3tUWMroDwd5ElCLs59+0S0u
	K/s8IWFoS93TZ7mSzeEgpcA4LUwBO7mpUWyNuPH9zbrEFx2QK2oHnsjUGF82SCr0mSG6AGM8MNg24
	WuKFdmylw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXec-0003cv-IB; Fri, 11 Dec 2020 01:55:30 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXeY-0003aO-Rk
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 01:55:28 +0000
Received: by mail-pl1-x644.google.com with SMTP id y8so3798088plp.8
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 17:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=luVzHjwrVb0RaJq5Uh65n6skCC7p9OMiArCM0mPgdkM=;
 b=ML9QG1vU7L4oiXWmFVohfhtCuoxC2/7X83dJ2wknZhwXoPeS69iqmDBv4wozPFOYMo
 nGwN/y15nRURe06hz/ZLfFDkJh4bxeD/HrGH1c6KRKpqxHznfGK6Mkggeyaeq7C9VQQ3
 bGPvK1OF6YPetx5e9v9siqga7GSR67M2sjK+KxpyMYFEeQc2qUa8rlrspWHPbmGdDXFs
 FAvTncsTkiaBjn004Ge/ubpI1mb8yJ6F8Utl0XKoxrSsMwPwoPSMWkBgZrr7neRYyC/k
 yewFTxXdU5qGGO4JiI+9N/QruUluX4rjeXcUHnmpEL1r9+OLjMevMihPfkHmotZiBFus
 jW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=luVzHjwrVb0RaJq5Uh65n6skCC7p9OMiArCM0mPgdkM=;
 b=UwLZWQHyURb9zV3tvRpBAMyMlj+UQbjimE3qil3NMkcZT58JmDD4vEKymDGOjoQ+vz
 Sf725r6TGJDmqjxHCUOackddrbz7dMTAI8xkRH606v+a3PbMIrLoitD7HpAzKPPf5KEN
 VFMzoXBHYDvPCOpSUFPEFj7R3pW/XufIMfJY+ZRb970yiMkzxlZd44BzhTo0gWHTz3Xw
 nHVOOtIlBryiixS9FpY4YSGpKYQtELwo22WV9J8wpTaQ6RFIYw5IwXqQXgZJBCIkyizM
 9geLvyJFo3fbbLG+bld+skPJA6cribFgDvTmQ5QwrsOT4YTdhjgRxdHz7N0ul1My5TKJ
 6f9w==
X-Gm-Message-State: AOAM530bhTXQNZuqJmszHAwI3ZVBkoK0y7x1ozMt8vYMbE/NeLG8mHmZ
 V0PK4Be1fn2cqDmYJgKY29l6Gg==
X-Google-Smtp-Source: ABdhPJwXnEk0V0IcjX6ye8t6BccBKFZFi9BAljK+NJr03V/zUFLWswriUIqU3kqvyjsSKs3s/YWSPw==
X-Received: by 2002:a17:902:9307:b029:d9:d097:fd6c with SMTP id
 bc7-20020a1709029307b02900d9d097fd6cmr8843219plb.10.1607651724635; 
 Thu, 10 Dec 2020 17:55:24 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a26sm7630727pgd.64.2020.12.10.17.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:55:23 -0800 (PST)
Date: Thu, 10 Dec 2020 17:55:23 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 17:55:22 PST (-0800)
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: Update l2 cache DT
 documentation to add support for SiFive FU740
In-Reply-To: <1607596083-81480-2-git-send-email-yash.shah@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yash.shah@sifive.com
Message-ID: <mhng-c5b27f57-f267-485d-a497-631b31a88c6f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_205526_963843_7A5C0222 
X-CRM114-Status: GOOD (  20.45  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 wsa@kernel.org, sachin.ghadi@sifive.com, yash.shah@sifive.com,
 robh+dt@kernel.org, sagar.kadam@sifive.com, Jonathan.Cameron@huawei.com,
 linux-riscv@lists.infradead.org, bp@suse.de, sam@ravnborg.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 02:28:02 PST (-0800), yash.shah@sifive.com wrote:
> The L2 cache controller in SiFive FU740 has 4 ECC interrupt sources as
> compared to 3 in FU540. Update the DT documentation accordingly with
> "compatible" and "interrupt" property changes.

This generally looks good to me, but I'd prefer to get an ack from the DT folks
as I do frequently miss stuff in the bindings.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 34 +++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index efc0198..6a576dc 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -27,6 +27,7 @@ select:
>        items:
>          - enum:
>              - sifive,fu540-c000-ccache
> +            - sifive,fu740-c000-ccache
>
>    required:
>      - compatible
> @@ -34,7 +35,9 @@ select:
>  properties:
>    compatible:
>      items:
> -      - const: sifive,fu540-c000-ccache
> +      - enum:
> +          - sifive,fu540-c000-ccache
> +          - sifive,fu740-c000-ccache
>        - const: cache
>
>    cache-block-size:
> @@ -52,10 +55,13 @@ properties:
>    cache-unified: true
>
>    interrupts:
> -    description: |
> -      Must contain entries for DirError, DataError and DataFail signals.
>      minItems: 3
> -    maxItems: 3
> +    maxItems: 4
> +    items:
> +      - description: DirError interrupt
> +      - description: DataError interrupt
> +      - description: DataFail interrupt
> +      - description: DirFail interrupt
>
>    reg:
>      maxItems: 1
> @@ -67,6 +73,26 @@ properties:
>        The reference to the reserved-memory for the L2 Loosely Integrated Memory region.
>        The reserved memory node should be defined as per the bindings in reserved-memory.txt.
>
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,fu540-c000-ccache
> +
> +then:
> +  properties:
> +    interrupts:
> +      description: |
> +        Must contain entries for DirError, DataError and DataFail signals.
> +      maxItems: 3
> +
> +else:
> +  properties:
> +    interrupts:
> +      description: |
> +        Must contain entries for DirError, DataError, DataFail, DirFail signals.
> +      minItems: 4
> +
>  additionalProperties: false
>
>  required:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
