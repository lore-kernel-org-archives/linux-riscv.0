Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DEDC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zJZvTQet89De/FRDMsaYr9GmLEZTMZoFSDqLPUnFyns=; b=Eu9JTfA4nErCO5BHYvUnuri0VZ
	Jl9DKzBwVWk38jSTHH7DxL+xbXUxC7IiHu5/QGIcL/Jy5Lc/Mr9vL7RpgUyojcu2qWn6m090M7Dg5
	WoucIpjMVW8PF+baONPDrJSIkHb7Qa19UyINmiDUHTQ4NScqTV1y4oeSfhxgRhoQdNvT5YSvsM7J5
	mcpGBme3fuItXfRnLn/3sUIZzmVpsCHzx6ZXpuaqSPk3RBm36J0jUlt6nPCIKgQ/zAzsJXv+/vcW6
	W5hdyTNBw5/gq9/Yki0OOKAXSZH94AznfGUSWxI0meQQNe9TUQKukkngtYcSIBDnmpXe1WmvZ1A0V
	ft+W3ztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7x0f-00000007rLT-3w44;
	Fri, 17 May 2024 12:48:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7x0c-00000007rKq-1D1m
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 12:48:28 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A8B153F630
	for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715950099;
	bh=zW5wTM7Wxxl+jny7CjNrz3i10lwRcwO9dJoFnZU/wW8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bA+wAUc3PPzoStlPejsbvERe1ZgHqEGl3ls8aiBAnMxHPU0U+QoXnl58eWDDCzHly
	 xS10zCtCQvu4fC81t4Eoo9BznS5DHF0V2NJuWkPC2oD7jLzFms3yKqjwH546PkGGaq
	 DGJnXBmSW95/XSDbfmwKpd/rH0psmsG1RFH6pMevHGj7CqAo9UHTvmeQ+G1zsGTuZe
	 P2ZH3Fl3EBeN7d7US5CWFFi3vXuNCO6aR6gzyUIB8TBnuFzSpainEV6R/POK+5Tbzo
	 cdyuSqSZ90ITJMT+QqjecZ9XQqX5rAVBL0V9Z231QPRwLPMUyc6eqCFY91ogNcwizk
	 0mTE8bmu0EPjQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43de2f59d09so107230461cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 05:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715950098; x=1716554898;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zW5wTM7Wxxl+jny7CjNrz3i10lwRcwO9dJoFnZU/wW8=;
        b=JYo9dkOoUTb+MS0NlEekZfyIWxZOhAryyagNZN/Z5epvNQLn0wKp7Widt52OCKkczk
         Ll5IEZogASINlYEb91MiovvL07BLuA2F6gSGhS/NaHF74EZeDUf2LzfLNRmBSu5uVPZx
         3o7n/pDUWUgnAFh5QAXT5Yll3AR/TsYGy0Qoxz0ywDigXacaGDFQNWGCfU+64bWhRNCg
         8YxOuguNVv2Wy7uDuMmGzMR/yVs2+0bsiB08x9sgGGA/ivAMrCHv6Vfj5vMDFQSLLs74
         WlxxA15wUbq7nfPjKDh19yJxl25a4iFsZLK+J2sK/qfYhrR39vqEJEm7ZknCwP0OvHqQ
         kbuw==
X-Forwarded-Encrypted: i=1; AJvYcCUsuFO4fGay7TmgLLiBzYlBkA9ob5tUeZPf7tubLjrNhNdASBAAWuBISDrfkrN9+hiX0UemNJE/TII0sVzDwVSqR+419O3R0Wf4XUAJIukF
X-Gm-Message-State: AOJu0YyElZSOGMabM8oIuu7WqtO/Kjn+eIC+EVBA62iXx4EL3RubLTBx
	LOjlN9XkugL775TqD4ksl0UXei3pdbCn79JTPKN0bajxrxOlvRBZ4EuV6146MHhscaOqQQ+6hbP
	9oMB2L1ssTqLnb/NgOGZoj2nnFgu05T0jm39qHUKONpjDxvXgQuDtH08xGW30s2MIvwWaRp9SqL
	cb6eVRH4o8hsn1+pwgKW2/FiZtUUJcgqeIqXAuLg81QM4QRvly5+q5lLyh
X-Received: by 2002:a05:622a:8b:b0:43a:d430:b678 with SMTP id d75a77b69052e-43dfdb170a3mr219093431cf.32.1715950098373;
        Fri, 17 May 2024 05:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtRO5hEORW+Wcqb6zHImpmRtuEa+IJ8HEKNoCDnJQ+6k7eHn4EtAEkRMeLCfvr/vbfy2QNeJB++3V1NE8uVYQ=
X-Received: by 2002:a05:622a:8b:b0:43a:d430:b678 with SMTP id
 d75a77b69052e-43dfdb170a3mr219093261cf.32.1715950098054; Fri, 17 May 2024
 05:48:18 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 May 2024 07:48:17 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240115173657.GA999912-robh@kernel.org>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-2-emil.renner.berthing@canonical.com> <20240115173657.GA999912-robh@kernel.org>
Mime-Version: 1.0
Date: Fri, 17 May 2024 07:48:17 -0500
Message-ID: <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Rob Herring <robh@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_054826_619659_490572CE 
X-CRM114-Status: GOOD (  33.28  )
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

Rob Herring wrote:
> On Wed, Jan 03, 2024 at 02:28:38PM +0100, Emil Renner Berthing wrote:
> > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >  .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++++++++++++
> >  1 file changed, 372 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..d3ad7a7cfdd1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > @@ -0,0 +1,372 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: T-Head TH1520 SoC pin controller
> > +
> > +maintainers:
> > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > +
> > +description: |
> > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > +
> > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > +  Confusingly the memory ranges are named
> > +    PADCTRL_AOSYS  -> PAD Group 1
> > +    PADCTRL1_APSYS -> PAD Group 2
> > +    PADCTRL0_APSYS -> PAD Group 3
> > +
> > +  Each pad can be muxed individually to up to 6 different functions. For most
> > +  pads only a few of those 6 configurations are valid though, and a few pads in
> > +  group 1 does not support muxing at all.
> > +
> > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > +  be configured or has some special functions. The rest have configurable drive
> > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > +  addition to a special strong pull up.
> > +
> > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > +  are then meant to be used by the audio co-processor. Each such pad can then
> > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > +  also configured in different registers. All of this is done from a different
> > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
>
> It is still not clear to me if each instance is a different programming
> model or the same with just different connections. The latter should
> be the same compatible string. That needs to be answered in *this*
> patch, not a reply.

Hi Rob,

Sorry for the late response. I honestly don't know exactly what you mean by
differenty programming models and what the difference is, so I'll need a bit of
help with what you want me to write here.

Any driver for the TH1520 SoC (not just Linux) would need some way to discern
between the 3 pin controllers so they know how many pins to control and what
pinmux settings are valid. Basically they'd need the data in the three
th1520_group{1,2,3}_pins arrays in the driver and a way to know which of them
to use.

https://lore.kernel.org/linux-riscv/20240103132852.298964-3-emil.renner.berthing@canonical.com/

Another solution would be to just have one compatible value, and then let the
driver figure out which of the 3 pin controllers it's probing from the base
physical memory address. That would work fine.

A third solution would be to encode the data in those three arrays into the
device tree, but I thought we didn't want to encode register information in
device trees.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
