Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB25C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6HTJZpfTUMs4uQBf3AJg7v8FlrTTA3aUMIHLX0KVZU=; b=roJAlXMYogtH97
	UfGvnN7bVFBiEiqYeYwz0q2DBInWTHgkwMFVxREk2h4RkBqaWOGP40NnO7N6vM/zoKAtcc6Z67Vbd
	RL+IyRDWA25GMFAqSNWgH5L/fbkyEE17H1HVNC/9u75sJgROVg2soMRhHP8r/sLpE0Td4eQkP7cNn
	tBYQ0brlDcboy6c8JWVKIOgpT6IAwo0TfcOaNlEAYrX2aFsE0At7RMvomdw/B2kbU/oWZVQdzM19F
	yZTEWZdq6YOpD5bYuVUa8qjGLVIkkfhXVHRwrV6aQZJ98sgZFSVVEH/D4x9DLsWfBfy2DRsTGF3kp
	DaxaZ7xMBaK+w+7U94iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJDr-006ILY-5P; Wed, 15 Feb 2023 14:57:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJDl-006IIy-W9
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:57:24 +0000
Received: by mail-pj1-x1035.google.com with SMTP id kk7-20020a17090b4a0700b00234463de251so2439237pjb.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXiyNpETkYC9z6V5qLWPf0k+7IPR5cZpgLQTFb6RXec=;
        b=NxZSpyUi5aOKG9wEEN6Nqjpnc+7z0Wt/NwdEqoJ1ebur20lHv/oM7Ija1av6J+Kncl
         nOm6T/oa2vCuvOGkM8tfJi3YDwcNnr1gUq/F+Uc+kNbhRuxvLcbvaApeum8euQN5+QuD
         kIp33+3YRSVtlkZc7HllsgFABTiFlh9E6gVNhKUPQVsDNNtCHHu/+ngs1Iy2Q5lyd5pH
         DRNrtW9+envN/knBC5rHyRxzQtWvE6lYEmg5umG07qFxHLh2dxPYNsqO7qXQPxdkAXkk
         kO735u+cYddx2jgMHJxJIGXkLoXLncSk+fH6EGqhIxvAI9NoJohjP93Wy0WeSuWCjztf
         D8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXiyNpETkYC9z6V5qLWPf0k+7IPR5cZpgLQTFb6RXec=;
        b=o4GsotTsqNOIUVjgu5Ed6tSg1dF/svgils+6bsEHr8mfYhFvsRo3fxH7Jwjhk2vpMd
         8z8Up/gMN0eGCWtFoZuoXQfPU5nGY+S8tanSYq6WOydbdw34S6PkKdFCGRkTfVZH8HVo
         sHNrgoMr5AYH7w28U+hXYRYvm1Eyh2ACrSbdpSB0rdBFUAegQ9rYiqSLC1IGFHhSWuub
         4KJNDfUk108q8CjVpgulhbbiBuX6Pth9fwsJBajhqITV56yy0j+ZjNT63m+dP9HTNyXS
         trWgpucERh8ARHa8SyqvOFY8UAvLECsHR7OcnB2osNQGpWdbcjWvWTSGR0qrvun17t5M
         KN8w==
X-Gm-Message-State: AO0yUKWygxbfJ8tl2/rpShC9S13LWHNU9G5MH8rEvD7xPDVkeP0j4m2o
	j6DmapqnryL5drXzPeNY1kjuXw==
X-Google-Smtp-Source: AK7set/7P/HtTKptrN8fEWEQBq3y3lZIWLRAPkYVv5DtZxdSAAog0SbdOHfHXa5okdJFu7VPTr4zOA==
X-Received: by 2002:a17:902:f54f:b0:199:26b1:17b3 with SMTP id h15-20020a170902f54f00b0019926b117b3mr2804547plf.28.1676473038684;
        Wed, 15 Feb 2023 06:57:18 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id iw6-20020a170903044600b0019ab6beea1esm3585233plb.87.2023.02.15.06.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:57:17 -0800 (PST)
In-Reply-To: <20230104180513.1379453-1-conor@kernel.org>
References: <20230104180513.1379453-1-conor@kernel.org>
Subject: Re: [PATCH v1 0/2] dt-bindings: Add a cpu-capacity property for RISC-V
Message-Id: <167647301916.19800.9191672449999836503.b4-ty@rivosinc.com>
Date: Wed, 15 Feb 2023 06:56:59 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Yanteng Si <siyanteng@loongson.cn>, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
  Ley Foon Tan <leyfoon.tan@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
  Sudeep Holla <sudeep.holla@arm.com>, Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
  linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_065722_051098_596249BE 
X-CRM114-Status: GOOD (  10.29  )
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

On Wed, 4 Jan 2023 18:05:12 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> 
> Ever since RISC-V starting using generic arch topology code, the code
> paths for cpu-capacity have been there but there's no binding defined to
> actually convey the information. Defining the same property as used on
> arm seems to be the only logical thing to do, so do it.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: move cpu-capacity to a shared loation
      https://git.kernel.org/palmer/c/7d2078310cbf
[2/2] dt-bindings: riscv: add a capacity-dmips-mhz cpu property
      https://git.kernel.org/palmer/c/991994509ee9

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
