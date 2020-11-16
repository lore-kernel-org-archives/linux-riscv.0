Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C25C5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 16:08:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1B820729
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 16:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2zMRPpBo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="PIME04S2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F1B820729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ghRbTVrl41zj53oBfPUQr4niOwbsGsUtqaohByBSseQ=; b=2zMRPpBoa8pmpNgEJb6EFYrEk
	d9X4y6APiihWGlVwUkuCLv9lYOSGE1/rUvrFPSKMeIPz9JyYOHHiFWiNPcuTLrOSC4VqsfsGZ7+ND
	bawQrG9KiJoKFX8eb8kYpuv7A7K2mcyOidUfaaqFZ0CjRAPp4Fxz9sFR0JgR2geDdC4vzaSTmxsXE
	roZh9j+Jm7cJJY6oi/sEFF5l0f/az1YE769Rvg7aZfK2CBFp2UfwNAu7LvDH9glheg145U9Q+mLAt
	fkRi75uV4Sx2KxERUKbVU1F0IqGYKtoJ9Gk9dBj3icHeGEv+RhnHkWqPZ1yrpWF6ALKh7USqJCFwg
	0M/fRd73Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keh3F-000515-6b; Mon, 16 Nov 2020 16:08:21 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keh3C-0004zs-8P
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 16:08:19 +0000
Received: by mail-il1-x144.google.com with SMTP id z14so925939ilp.11
 for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2020 08:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TYESStGAKtRivaI7ala7/9w4Y1E5hiFC107ZMldjdA0=;
 b=PIME04S2yuh00xcv/ew8BoRWNXcxwwXikY/oKGMYfQDfOhKMKqxbvI5zE0XEojzmIL
 fP1Dq2ACY8i0tSuOowJ0pXcrqHpbNcMx/7cXaq1E4CQiYgHyOU0mW2oJo4D6jw4uEw0r
 0YNdhoVexSnnIcnaiVgn8WuUjZqFa/8MlpLIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYESStGAKtRivaI7ala7/9w4Y1E5hiFC107ZMldjdA0=;
 b=iPgo8GUnX8yr2jiXpJxa+ceY4rHQkz3j5ToSltVwxjd07myMt1C42E1R5cdUfjMHwC
 jGiltUbegHm0rR/NWeAmFNy1b/4jw9JoZ14HyFK/MQl5bTF2JDK4kPR2OdJu2jgo+tt9
 mSd0g7lV66Xsfgu5ZdoohGw9Qpk+ymI27IMVhTYlsxMJYJAabP/LyGQkw8PMPM5VMbd6
 7uBA5RKeOvPH4jSSvAfcEhz603NNSu/BaVtzTFzVVqh2A3aUAljFpiVF/mOYkKcR8/sY
 NMKIajDEbiiJswERikjlNUbVse5c8m3YQLNvH+gXf7ueTNiS58uXXrtntyZxyZJIPOM5
 3/xA==
X-Gm-Message-State: AOAM532RuB3aMujRvBmlic4DS7unC0B1DmwVKsCVdQHLenCZ9y79n6fA
 0kR+PiCF49wbYsAGnpNsbTbDTFMqdhXrVCp4puKV
X-Google-Smtp-Source: ABdhPJzUUHJyuXJ1duZZEAnozYsMbeM2qHFZmyqTe/AtJl9ylg9U5pPO43vAy8+qk+4tC/qsYULKaca4u7Xyar01sAs=
X-Received: by 2002:a92:512:: with SMTP id q18mr8655253ile.147.1605542895690; 
 Mon, 16 Nov 2020 08:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20201113202550.3693323-1-atish.patra@wdc.com>
 <20201113202550.3693323-3-atish.patra@wdc.com>
 <20201116150129.GA1643948@bogus>
In-Reply-To: <20201116150129.GA1643948@bogus>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 16 Nov 2020 08:08:04 -0800
Message-ID: <CAOnJCULj2F1ZMsWwA8KT-6yVi2bK7usw1EUJfrxTiVtrDqYAXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] dt-bindings: riscv: microchip: Add YAML
 documentation for the PolarFire SoC
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_110818_433634_112180C7 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Conor.Dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Ivan.Griffin@microchip.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 7:23 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 13 Nov 2020 12:25:48 -0800, Atish Patra wrote:
> > Add YAML DT binding documentation for the Microchip PolarFire SoC.
> > It is documented at:
> >
> > https://www.microsemi.com/products/fpga-soc/polarfire-soc-icicle-quick-start-guide
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  .../devicetree/bindings/riscv/microchip.yaml  | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/riscv/microchip.yaml: $id: relative path/filename doesn't match actual path or filename
>         expected: http://devicetree.org/schemas/riscv/microchip.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/riscv/sifive.yaml: duplicate '$id' value 'http://devicetree.org/schemas/riscv/sifive.yaml#'
>
>

Thanks for catching this. It was a copy paste error. I will fix it next version.

> See https://patchwork.ozlabs.org/patch/1400088
>
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
