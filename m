Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2804BE7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 15:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3czP1x5K2m5+ZoFcKuo1zbRmIw09mEhOn1MyjzYrhK0=; b=3Wucrar05M6XvK
	grJmnaCeSqrVY+x7dGYAXG4piWfe6LInJwu2Bk+h82QHK0fzQV23qmlP44Vb3wdCl47PBPXN9mQzb
	CT2/NhqEQtK7fSWyD+cbz2U/tWwkzbFJ+t1uj5s5VJZtKShYi65U3bWXGHqPrc4zer4+e/IEiBF2O
	TYS+TeB6IzWO0P2IYOV24hxK8UhPp0UKQ3SbsXhUFcQEQwypK0IESBSpN6o7wVKLbQx7FMixTtvPs
	d96wi2vHLTB6pSt5RoKQLoM32zBNOig0tUfR3LTLxC679sdRBYqC+0Cq7WTcfxVUi8sMhx/zgnyLt
	nv1Vq0HoKgpq7/thNu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRv1x-00000003ZJG-3BZR;
	Sun, 29 Dec 2024 15:16:37 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRv1v-00000003ZIk-10K0
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 15:16:36 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-21636268e43so7047885ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Dec 2024 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735485394; x=1736090194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq78cmiaEPaV4FfrF6EAh1QhQFFCPQzra4GNWV266D0=;
        b=GCgS1GvTiPsNlVPVtt2JEEnZLBfRXb5gaLT+9tcfSttsXyM8+imk05k2+f74irQWX+
         bWXd+8NDyp6E3DKgTmRjC1FKRUkiM9Vk1HJD0llXrJB6PgGphK3JuWIMvh21m9isMX72
         Ea1MNT/1b6KB4ChgcXKcJDy6IH1b6eH78U2BgbcZAzXW3sqi3C787xvy7j7hEyaqFbmg
         D8jEr6c6F8Iix+uNGX+SQ3USgU8031nXje/0xAHWote+YT/7j8vaV5oPGLXR96ZiUQtJ
         DCELYx5NMDp2aAYaRPfXuz8jRlkLR3w+on48jimvoXbKkhrDOoFm+O9Zy5zTYSDg+KZc
         lS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735485394; x=1736090194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hq78cmiaEPaV4FfrF6EAh1QhQFFCPQzra4GNWV266D0=;
        b=vR58Cnc9lck+ZvZYfc3uoTHzxVIyhFhDCK3BFCNj2XI9oOEfHtG36F+KGlzH/5Vt9D
         TqQGSXHh7AlUi4m6ykjGknm3iNxGQOMZN/gE6X+vkor421X5SIai9hbvd+lzlgYwndB9
         uKUGozmsDuckFBknp55yWF5UZJXGhunwLVfzcNHn6VkcAa0dOQHWOwHkpf9eapPhMmi7
         XuTwSJTtJpCWz++GCLIWC0S7mk9XWa+/WLa8N/0YmPe6T5keLaudPsZjhgL5/4e/vldU
         f89oFAnAEU/20YrEq1nVwmo3IDGTfrFQCF4IckRKYsb4DWT93pyAt79BJTnPJ8wZ7Doh
         4Zlw==
X-Forwarded-Encrypted: i=1; AJvYcCVPWvUig+XVNKcEdHmfwiA7erY4Onpb/Aa5vdtZy1/2mOCXcj05n3ZsaV10FOhmBodnlsuu2pqWSUyj/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrjqf6u0eDVFttzXDzZCXJ5nQSluUNIENuh9iAJcAJUFtYxkrP
	Rrys1gr+D2gs+IKOATSXJaDeM/mNOmVXHbHDHNrymL+b9c0gLcPS
X-Gm-Gg: ASbGncsnc5HJYAOQn9Sx1DVsVFVV/RSPtuJ4rhBtvY1C8YoaygmVptxT9rwo/fP3q7Q
	EOgDRTjkLnNUgpgDFvKlwT1xWaqHxSNXBog5ovYu8E3aOy0XQ2ugUCwrZR6R0+koiuLdr7UxHhF
	uKjV/iAMGE+VAW35UyMmJ3QHkyYOh0NO+865v83K4kPUk1XTEHQ6781UH9qv+G232kEN6CrfUSZ
	F4W4B/bLU2yrS05a567S3jCrgviTWAUGQe6ryiM
X-Google-Smtp-Source: AGHT+IFFEwNrJMwRkLT29asUZ9fj0F/Jg8lbFG6p3eIzLyKLwNVq/VPJMBS9ZdTV8E4XHszzqYw5dw==
X-Received: by 2002:a17:903:2c8:b0:215:a412:4f12 with SMTP id d9443c01a7336-219e6ed00ddmr391630595ad.33.1735485393650;
        Sun, 29 Dec 2024 07:16:33 -0800 (PST)
Received: from [127.0.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm163693425ad.110.2024.12.29.07.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 07:16:32 -0800 (PST)
Message-ID: <65709464-8a34-4842-9b06-6365b549ce49@gmail.com>
Date: Sun, 29 Dec 2024 23:16:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Xukai Wang <kingxukai@zohomail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_071635_290346_88C22537 
X-CRM114-Status: GOOD (  12.78  )
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

On 2024/12/29 21:21, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
>  include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ffd4e0b052455bf3dcedd9355d93764119df3d68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  clocks: 
> +    const: 1
`maxItems: 1` instead of `const: 1`
> +

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
