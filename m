Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77670C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UjJXew8ASu5rFr6y1nllEE3D4GpbGfzbsjZOZklBKyY=; b=mlLPQmmnsRIQ8WiWlXfRcOwCmy
	E7kWDJR+xGaEMM8Uu9F0ksjPAfJ+DAJWPPbMeDgnsPqdumny0cGpUFoztWXBsUdFQWT40a0SLYOkM
	jvWvIluQxK/DvgCGQu58v7+ILBwAnm3A6SNpWyT+Oq33/yvOqQbhOgJosGRiEc++LnvJcoRY2xYzN
	WKS8hxU5KeVoj0AvH3+cWqASUEw5uKTCJgVD9nTLDYSVVD6ATibvXB/J5iv3N6NIenvIh7YokLvvi
	2HUrT5WuBDC1bUyHUG/Va1rTOZKqm6ki0kQtwARtcOv9Twag5N9ZXQTh7dR/ssZRLlN9cIvE54iTp
	k+ESmJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWJG-009NBl-3O; Fri, 12 Aug 2022 15:10:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWJD-009N9K-Aa
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 15:10:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso8602357pjq.4
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=zzbpyiki3NleilhfwCj9lkX5sCoprPIj72OmtlYgi0A=;
        b=TgjhKVmtuJxPQV4CZFyvOAo9j/BYqDYL4o/QhhJHMTjJodzTk7EYoUGM6mB9znKkEo
         wrbPNttEkfw9W2/3jA2hjpY+7TnN5xb3Fj4oVTa9tOlEXbf50oINyijo6FZEqIhKbgqH
         jm7mR17BcBMp9Ky9l/1n6ZublpsuZCK7fhRZU6mABa0ImZejkepfk793YS0idYAYektq
         Eq+zyyBJvGiiEWoJghFvrLUqQkdyjE3Z1ti7DhFjzo7F4SQ5c4HiWJRwDD5ShLhiE2sc
         GhEdpYG79CBKJTFxHtzGn1mB3rRUepPUupDN4vcZosG/ElvEzNQGtPmcrLoV93u6BY5W
         eDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=zzbpyiki3NleilhfwCj9lkX5sCoprPIj72OmtlYgi0A=;
        b=xooK6FVSjKkri8v4GmKA/fpsdvtg+NtjVII86sSVx1uqKLju1G1A8BB+c4XQC1ssAc
         kxZzI6rh/1gsi0JT01DVgEAh6wFtSEHDK4BC3DW0wMlNNvUcTo8/41ba3aBrsi1Q0pTM
         eSolB1LqAPJ1MxRH41EN7kOZbn/rxwpOZRke7bfWPwS+BXQ87qCKtdO5w5hbMCgYaCWk
         xJ7Crt4XjhJvqUkv7X8QxMx4JesCo5XOHazdkyCWUCmOcoqtXYNoQ10+WOSK25n/xByC
         r8LuMRpHVQ/Eq1KxAudk/h+khWNHm6F5dqAPGGN23MbsSzN0YktBCgRzIATgKjICtf/t
         /N+A==
X-Gm-Message-State: ACgBeo11CY5vGO5DFOT4FcZLHZzqv/okoCRMBCPE6javXhNbHXTKUv6d
	afZi7Vp70+sVYVxzm78kEG2t5g==
X-Google-Smtp-Source: AA6agR52a8ZV7ZcymiQ5xW9p2OqUonP+NtZlYjd6vNYwb0BqZxt5lsnsAlWG7AoqZ3eO6IKks2b1AQ==
X-Received: by 2002:a17:902:ea03:b0:170:a235:b72b with SMTP id s3-20020a170902ea0300b00170a235b72bmr4486201plg.13.1660317044201;
        Fri, 12 Aug 2022 08:10:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090a134900b001f766b6a879sm5452486pjf.44.2022.08.12.08.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 08:10:43 -0700 (PDT)
Date: Fri, 12 Aug 2022 08:10:43 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 08:10:38 PDT (-0700)
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for Renesas RZ/Five SoC and SMARC EVK
In-Reply-To: <1aa477b2-1d91-066e-5fcd-849ece62388d@linaro.org>
CC: geert@linux-m68k.org, biju.das.jz@bp.renesas.com, prabhakar.csengg@gmail.com,
  prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, anup@brainfault.org, linux-renesas-soc@vger.kernel.org,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@linaro.org
Message-ID: <mhng-16e843f9-aba2-41fe-9027-8362472fc7d7@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_081047_577870_15EE73B5 
X-CRM114-Status: GOOD (  11.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Aug 2022 23:23:10 PDT (-0700), krzysztof.kozlowski@linaro.org wrote:
> On 11/08/2022 18:42, Geert Uytterhoeven wrote:
>> At the DT validation level, I think the proper solution is to
>> merge Documentation/devicetree/bindings/arm/renesas.yaml and
>> Documentation/devicetree/bindings/riscv/renesas.yaml into a single
>> file under Documentation/devicetree/bindings/soc/renesas/.
>>
>> What do other people think?
>
> I am ok with it.

Seems reasonable to me too, but I pretty much always err on the side of 
keeping SOC stuff split out from the RISC-V stuff.  Just looking at 
Documentation/devicetree/bindings/riscv/, it's pretty much all SOC stuff 
-- should we just move everything but cpus.yaml over?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
