Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5739DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 22:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y1AvLXmaSYAil1W7+xefqppi3GSELTHEu0bqWkSYslw=; b=HTqPyhuXSIlR0Muj8fm3JWjaW1
	cXK7NiwwiQnZyXjTnA9vmXxWVlMJvka53wKhANh4xOEnhyfy0m3eJWMqRrEMr/C21i8UYhJhvnljY
	rEziHJ036nx5W3ep6pRiUmaU0sAZTyI5AcgU+6N+bZGsj8vYLmx1YzHipIYElYNhYFKgd4E0x6lNP
	X4pWpUx4V32JFGed2RD1Ulb/T0B8ygX8D0Nx6lS5TAhwixg8wV7Ijr8DPXhd119Clt12zYjWFuNwW
	oFzTKhmftoKlLIhXAIXeaTmkUnkjr/UrlUsftb7d0cmISz6pMGkei09sq/i06jGAxzKWitxvzCT8u
	L3Yl9wuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwMF-00000007666-2cbv;
	Fri, 19 Apr 2024 22:05:23 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwMC-0000000765B-3LqP
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 22:05:22 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EB120413F5
	for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713564318;
	bh=96ww+1eg6Mocde2XsvwCltzM9kg8YXha7d3RQyiV9kI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HFMjNHqJvSMXU9Sdg4DCViY1CBMM+wJNUCes2wNNGKuRf8CLVcAU2yzmKkd31uXt2
	 5kgZQmGJ7ttPgAjETE8BrA3Ckso6F2uC4dXgQsr6oDLoP3IKQ60XYnEXsZkXOKv0Od
	 dquXZU2/uQ3jjB8FXpKBkY5NIxwXZfocK5Klnq6CWDVal23aIYxEy6A+2N6Ylb9X5K
	 B9jwuJNDSckStKCIc/Jwgwm2g7Xh4Mleuk9gvrCbaTEnX57eOi1sHp/UcU5dxZBREw
	 K0woRnIh9aiLWSWcg0tXASWi2HN1R9nMOuM/i5mZ+zSypXX+dvcXS5p6X9SlLsEh4V
	 Ep0wX64s/QylA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4386bcfd788so14116781cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 15:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713564318; x=1714169118;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96ww+1eg6Mocde2XsvwCltzM9kg8YXha7d3RQyiV9kI=;
        b=vbnT3x2TLXWfJ20XlK8xNRsg0U7MJuBFtDT0PpanCOb6ADgRYJo+8GOnp4ZhOX5rZk
         9krVHcnvp0xzV5ly2eoMR5pYb1vkeKqUMmu/5QOgGh1Ubr4dhK0S5iQGaruXtMUhbZRh
         dkS3TgOYsz0hpWkxYNBC0FOeNMudNBDqo2fV3sMns3JWKZL4z9r1uwLw0doy62HhasGo
         IpyRDGFHVZBhjjAkafsTOQvNXBHEH3h2g/8V1VfaJ04BOC4e/K2KpwAEY8Mdu4mhb+V3
         TiRCCZhOML8f0jAo1Sawt1GE4g++VjmAlBb9eHmARkZ/4AncI/8BcvKtMT9jBvcLfdGf
         rDaw==
X-Gm-Message-State: AOJu0Yw8ajXrPLxG+tXLmjc7YLOVrYVOckyu06L8k+ee2zMDhLcTDHnT
	haqqkVv/BX0MdJGOqA4eTh3t4R9tJyFauDGuz9dYOu5Z6PfhckjFWmyDw1cVjosXijlKRHzKFaC
	706DMM0om+vB7ERAReFatvvXoHmQLyrZepW5Cj5bJwv8a02VgY1eaabt0JNDn4lqHJAxUd0tYOM
	NHVAwrqVtNhlP4/02vksgGqf6F7PjLAeCtmTENc4FRg0paxt53jzSkfYN3
X-Received: by 2002:ac8:5f0a:0:b0:436:b948:7e6f with SMTP id x10-20020ac85f0a000000b00436b9487e6fmr3530268qta.17.1713564317706;
        Fri, 19 Apr 2024 15:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzf6EeFMjLFuwkceej16oYU6yBNN8gBYeTtzna5Skfq40Dl3SYzgE3yG5YPh2n/K1Biu2V9RqhlB/kUHxNFH4=
X-Received: by 2002:ac8:5f0a:0:b0:436:b948:7e6f with SMTP id
 x10-20020ac85f0a000000b00436b9487e6fmr3530240qta.17.1713564317355; Fri, 19
 Apr 2024 15:05:17 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Apr 2024 15:05:17 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240131132600.4067-4-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org> <20240131132600.4067-4-jszhang@kernel.org>
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 15:05:17 -0700
Message-ID: <CAJM55Z-nnJkvJ49hyz45+eqMGNSjR+adA8345oVO2uHvgqZsxQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] riscv: dts: starfive: visionfive 2: update sound
 and codec dt node name
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_150520_985915_C027FF78 
X-CRM114-Status: UNSURE (   4.02  )
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

Jisheng Zhang wrote:
> Use "audio-codec" as the codec dt node name, and "sound" as the simple
> audio card dt name.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
