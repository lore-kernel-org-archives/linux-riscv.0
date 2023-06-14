Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4202EB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Cd4zHmmEVD26sxojfomBQ8ddYRhQwFO+ckBU48juORQ=; b=y7RHEktMu+HaFy7sqAPa2sW5t/
	h1UumTbZwHz67eySDk36RIMzg4Wa3znwIhfLIFUaVkGSsPzwZN2c4jeU2phV6BZIeMWgzGlvdTqh7
	QsqwZB6yAodhJskvSFFxv9pX36G8PQYCM/Ahh95xA6vK/mbwu0S9jju2sdHGzm8xJyUrSki8oW8Tg
	wPMV80Yl6lVdsTPGH/+QbeutgQH4QniaW89m9kRWTSNnQuf+v5zIRVxC8hHyH8GJQ9MKnJ4BMP8b/
	w5TfTPCNYkyNVZHcHPwvyIP/LiScvYu0fUwct8E7UUIAPyUodl+5eoPgpNgzgfYXHiDWiczdLxOlW
	i4zCgcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9RlK-00Bwed-0y;
	Wed, 14 Jun 2023 14:46:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9RlH-00Bwde-0h
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 14:46:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-655fce0f354so5273417b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1686753973; x=1689345973;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xLm4Mt5usYBeFNGXXmpqchycUZ5e+7+/NNA+W+5oEQ=;
        b=49iHWlJatBGNeViZG4mboIj2qlTs9VZj7DyRbWCL5LnSGfp0Aj9+hY19D9+3VSdN2A
         4DUUUQw2ZX3Iu/lhnh0TIf+ALlJv32JBuqtHHXpaF4MZHgbMzdWrJ4E/iAXSvrs6DR4x
         WjBZkcNF/zZR8TvhJI/X+/CtLQG2SJcqLeJd0wo39xNGTXPRy75+XrsHyzAITyGzQ4JX
         +f3zge/XiqE7uy4uUhvnfRrNCN88i57Zkxhb4UWaubvTsHakcfOmoREoQnWXJap/vNgA
         sGQStSQcBPdLAWKNuc6KThB24G7LWQIAgO0zLMX+qxQDilaQTzibXRnyokOSJRxrQ5Q5
         QbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686753973; x=1689345973;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xLm4Mt5usYBeFNGXXmpqchycUZ5e+7+/NNA+W+5oEQ=;
        b=B2A8/QXV9Ne3rVXPIlcw4+yUheP8ReZ13oOHo+JxJpscBTUlo62nlmVgPT2H/PeGA2
         oEVhJm/CCwHtFKcivqGKzpLFHb8eAlab8bQWoyBH8zebB4T9RBcvT2JBxfVBepEiVCaz
         jVtWB9fosZ2DdP0PZs2EK9BCPNQoi0pGms7jH6KXl+sbMxoDRDGPvKaOs0jOQFtQpAB0
         YI/l3Ckh3iFux8WVOXHTmJNrzj6ecBMj7chGE3VNYdcNdhid4us6E2R6uH0BsbsPyFjU
         a9TYqm2QEHJE8qk8euIrqL5vQd5WuSbXT5P025pg2OlRU/9O+rypLvyg8q9LdSJEUPfu
         p6JA==
X-Gm-Message-State: AC+VfDxh3uGE7JE7SPiVEJdWhzlfaawT8OKm9aqoQNK70ABgDK51+uoU
	k7kT82JANGVktOykxfwOvQxDog==
X-Google-Smtp-Source: ACHHUZ6LNRJOcGwpGUMflzElhsfo6fxzDZwXU7iTG2/LQOEYbmKryQ15aqEgj1/fDj7dn2k+yD7lDg==
X-Received: by 2002:a05:6a20:7484:b0:100:b715:8ab2 with SMTP id p4-20020a056a20748400b00100b7158ab2mr1854527pzd.46.1686753973511;
        Wed, 14 Jun 2023 07:46:13 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63180a000000b0052c3f0ae381sm1423428pgl.78.2023.06.14.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:46:12 -0700 (PDT)
Date: Wed, 14 Jun 2023 07:46:12 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Jun 2023 07:46:10 PDT (-0700)
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
In-Reply-To: <20230609-discourse-lapped-5217cc4d7ede@wendy>
CC: krzysztof.kozlowski@linaro.org, Conor Dooley <conor@kernel.org>,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-c1f5c918-1b72-4a2b-91c0-eea05dab14b7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_074615_471243_BDC428B2 
X-CRM114-Status: GOOD (  10.37  )
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

On Fri, 09 Jun 2023 07:21:17 PDT (-0700), Conor Dooley wrote:
> On Fri, Jun 09, 2023 at 04:07:06PM +0200, Krzysztof Kozlowski wrote:
>> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
>> checking for this can be enabled in yamllint.
>> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Did you want me to pick this up in the RISC-V tree, or is it aimed 
somewhere else?

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
