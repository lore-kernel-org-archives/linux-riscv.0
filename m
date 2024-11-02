Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E115E677F5
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5YGH+1xcD474DU5ozzt3oSq/3LLkQJMVD6LlhbHlkY=; b=IqhWN84upim+S5
	u2/YJnVSxFZho0uLwBqbA1WK2OLH9Fp+xvQcR3vZ84tIB1EIIOE5gkncDQ08qf8AobfwaRbTiso8P
	IIouUDWkKeuOA6/eSOi2hKDuKGPKmxNnXLDOKTWCNigKQ+y/ifgMI3REA52P1vWy8BujMPMHpVtuP
	xMPwd/ge4Xaxc8OOzPrsn19Oi1GJ/cai/v0NrdkZAntKJQIaEuU/NljfRwLSx7ea6l7aVVrgaam7v
	5Japk6aBAVt81NiyZVziY7P17w2GKPjo3WhTU9bShk/3S9U+dOyuDSj/C3R66DlWTWiUUy5t5xv1I
	AGRw3oNNiykyyoeowN1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7COg-00000009aCS-3FMZ;
	Sat, 02 Nov 2024 11:34:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7COI-00000009a5C-0MzM
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 11:34:03 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so2333955a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730547241; x=1731152041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zrdCAeiD6RabuL/Tg4yBStUK0YW2zJOy12eTTTW6jE=;
        b=UEIsZaBJ7qP/aidwDOifnwobj4JbnwSvxzZtp0/6c50hgxWa4Gs4CFs8KZVa2TWuiu
         UX3Ar0x3Oyzh9tWkWM2NZYlnespOYNce/9n/sGD5p1mgUZCxpaMgZx0G1si4gK9lmo4/
         nVhBPE1brfMMeRSSYVt1QPUGETdImgCTTLCnwl19MjOacZYJ3caPkG+L3efMzlQPRlwW
         UqkZVhnVarBu+lUkdFtXcxRJYxtpks7wFBeCMx0VvChgUOZZrwthI4GV1+NnW+yutlWv
         CAdHpzbz27v0iuHLK8roEjBBjvQuQo3bHIyWGj2X2o6CBxmk9CjwNW8n+HkVQh0KwR1L
         vv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547241; x=1731152041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zrdCAeiD6RabuL/Tg4yBStUK0YW2zJOy12eTTTW6jE=;
        b=MTUuQES5EZLMGekQ10YMfJKADBEIyQJs3d492LraSINFi6U0hE7GdcYm8xy2XIaoW0
         qlhnzL8y+dEvpWeyumm3IRQfVeV3YkAFFVqxs7/xzcSzKKiVKaakkYt6+ji01PIj5/um
         4HQnJJhgPqAnyfIG3DhwCvbUealVhdk+S5UsIOgqVcTqm4TJrsIidbvj659W9A/5s17V
         8sToxTLbpp+Wr2t98aDjv3sOuCzPqffOJ1QN7YhDvNj+j9Wp2ZP0+/llFcWzhxqvWEMV
         IWe6FSVXCUVdrIo97qqixZ1RhCRBzeYjytJuqoWNs0fE3e7/OcJlRt/vjRb7a6h/hJ2Q
         bfRg==
X-Forwarded-Encrypted: i=1; AJvYcCU5Ba/dAGdM3yXWyfx5erJHwc7x1sqiDXJLrwvfRtl0aR1HtRh7pcsRLbvKQ5366OxMV18hTlV0SV8b4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCsXrqhRFGGjgub9yxQ5n4JY7n9M2avLSzJdxERDVzjXEc66eD
	67MNonf+VZMCoQhK1MONSujH81nEalwXWIxhOg+eAFq3JXKv6/ok
X-Google-Smtp-Source: AGHT+IGC2g1aC2YkRztsD/2FH/X/4f1saVcpsTCvGvZjuc/hnIKVFEFZw6fQnqRepBc6PxglD0mZ8A==
X-Received: by 2002:a17:902:e5cf:b0:20c:705b:4123 with SMTP id d9443c01a7336-2111aef2713mr87504465ad.21.1730547240665;
        Sat, 02 Nov 2024 04:34:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056edc34sm32894405ad.51.2024.11.02.04.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:34:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: sophgo: cv18xx: add emmc and sdio support
Date: Sat,  2 Nov 2024 19:33:25 +0800
Message-ID: <173054635857.778838.7207985849003780014.b4-ty@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025112902.1200716-1-inochiama@gmail.com>
References: <20241025112902.1200716-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_043402_148843_86A5EE56 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

On Fri, 25 Oct 2024 19:28:58 +0800, Inochi Amaoto wrote:
> Since the sdhci driver is already supported, it is possible to
> add emmc and sdio device for cv18xx SoC.
> 
> Inochi Amaoto (2):
>   riscv: dts: sophgo: Add sdio configuration for Huashan Pi
>   riscv: dts: sophgo: Add emmc support for Huashan Pi
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: Add sdio configuration for Huashan Pi
      https://github.com/sophgo/linux/commit/06133f48a87144de40bbd3934fcaad449ecc1b93
[2/2] riscv: dts: sophgo: Add emmc support for Huashan Pi
      https://github.com/sophgo/linux/commit/b5cf65cc0fd00aa30ff218ec8170dd48e3cbe78d

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
