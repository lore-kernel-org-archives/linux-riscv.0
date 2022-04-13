Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5138AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4nR9yASojhWFO2eoMo9ucUs5XngdGVVLWCRIpJRXGE=; b=tQoV9uwTte57mr
	wxgILnyizEgAWdzqnU240MfDTeN8yFGkbOIoxenMHP0qqR66h28S3HwQ5syI6yIY35HG69ogCi8zu
	X3P29sfeNOjFVNcbnOKJqXGfLzif+priG3LHotqCPpvlv34mk0B5eN60hK/I16/0D2gHHjCrUyS/d
	9FKgqj4CcIvixlrnAY9IxCiWFzGFGKG4l6vJS/0WzqV9klB9CNk68lsvH5KqwJZd45F7X4NReUjoB
	duQcagsywlxsu5Y8QF4oGXqSesLALKgPy3GweHAPQgDIiCuNp/+X0JhzVILnCIvtNljvzAIylJLRH
	zdnTPjRJIJwyDxYrW2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWjz-00HFr7-RX; Wed, 13 Apr 2022 06:44:35 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWjx-00HFoA-0E
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 06:44:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id t11so1860831eju.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 23:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6abcq3O1EPjgdyhvzwdMxIPAFt88vyijjAyZY43AuF8=;
 b=Wt62uSnDI6mF9aPfsYg8UJ2HGrg13xt4FC/mICdOpCq+n3WzWL7WjLN7seYgvq57sY
 LVpsm8o669ydMUIUtWhsQ3dIj2Nopm1UpYoC0vJKxjvN42vEWon0906aC+SfmSaWwgLk
 PcjmD70YuXsolSi5ncH5XTV1fL0abGJcszxWlQ8WSsKLJpt2dCPTqZRIlx/4TCUgBrEr
 xozL2+xwDAzTVqn7puWbHaYoq3GlURch1LALTwGRkqdV3inqZgIi2/NwJWdrOw6+IZ2R
 JXgBfgsx/v2aoOj1JYEntsqDN3uTDoTntDZ8Z8GiD7Tzrgo9Cqs0r6b6kzXe0231nYwR
 9Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6abcq3O1EPjgdyhvzwdMxIPAFt88vyijjAyZY43AuF8=;
 b=Go+Lj02z3b3RgKq0PzDyDAe8E96caA/jDLtiFpajy53HX5NOxYiP0krEcwYr6lONZx
 J8HsAsx9grthGLjQW9F3Ub8sL0B4OUjUToK+NuSjTLBslsc83PGQOuxTuyDrWECsyqVC
 nisU5+4btC0SAcB8WmRXZJcad2jogQk7clAljMOBivE+mzHSFNpss426YaISkq/o56iI
 FdQxvWf/H07KqN9sywdmD8n3msAyM/ZKOEYAyylaWCqSN4cD5n2fGmyh+bGkF9y5hkMT
 NdBrycWp/G9YrM9S6y85Al4jajYantDcmCvf9ZEokddEQvSF5WAqu7N3a8y18xDguicN
 6sHA==
X-Gm-Message-State: AOAM530MPiTOE7Z7g5HzXY0El/DevEOxdZoPuPKxz0C9GO8VL+PAAxle
 C4tdikEfBKbOBD11X/8zzf8LQA==
X-Google-Smtp-Source: ABdhPJweDresjgbp+7Botd2PLPWg/Px8U48d3x0QNr+ZrvuJBrlwIfDunDoMxl8QXTsz9V7vhps5vQ==
X-Received: by 2002:a17:906:d108:b0:6e8:7765:a70b with SMTP id
 b8-20020a170906d10800b006e87765a70bmr15802157ejz.436.1649832268884; 
 Tue, 12 Apr 2022 23:44:28 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 qf21-20020a1709077f1500b006e84ee40742sm5918659ejc.218.2022.04.12.23.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 23:44:28 -0700 (PDT)
Message-ID: <e289c59c-96fe-38f0-8be3-7c1ba416817f@linaro.org>
Date: Wed, 13 Apr 2022 08:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Conor.Dooley@microchip.com,
 mturquette@baylibre.com, sboyd@kernel.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, palmer@rivosinc.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: Daire.McNamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
 <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
 <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
 <74695e55-0b59-9236-be19-b02060ad4177@microchip.com>
 <ba518d4d-0f92-0d34-029c-c477c84db81d@linaro.org>
 <f2c0c8ba-bdfd-faeb-cdff-ed3fe5215029@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f2c0c8ba-bdfd-faeb-cdff-ed3fe5215029@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_234433_125180_B9778FAD 
X-CRM114-Status: GOOD (  14.15  )
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

On 12/04/2022 20:29, Conor Dooley wrote:
> The way it's implemented is a bit interconnected and none of the three
> blocks would satisfy a "self contained" constraint. Eg. The rtcref
> divider's control reg sits between two registers responsible for the
> CLK_CPU -> CLK_CFM clocks but it's input clock mux is in the same 
> sub-block as the MSSPLL.
> 
> I guess its better put that each of the three are sub-blocks of a self
> contained clock controller for the mss core complex. There are several
> other clock domains on the chip which would have distinct clock
> controllers & may be added to this header in the future, if letting
> Linux control them makes any sense. For example, clocks in (and used for
> the clocking of) the fpga fabric.
> 
> This controller is a single node in the device tree. Sounds like
> reordering it numerically makes the most sense then - I'll resend
> tomorrow if that's okay.

Yes.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
