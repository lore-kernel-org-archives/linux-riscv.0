Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6382CAC5B8
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tRLSota75yE8wiGg/BrrmTLvf++pxpvohaiKoARcfg=; b=av4I483914z9dc
	3nwSei94S80qBRLHSsr1T8XGFH2DalW39pJoGpPFqQNDPXKYgxZtjihIGc3LaBS/D/UONUOmAWC0k
	oi1iO2SdCn27fz+RrFnIVQfYv73ex8KdfReJIBU1P6Y/jeljQ2VHZxu/GF5oYaB4S8leyW8+fMR3Q
	WjnZPHd93ylXMoBfAV9CVFeT+LQegaFhvUsKl1MHTh+XP3A+n42bBJtlnnMIjDAc0b+Bqg1NRN446
	4gM3j9YQk99aBRNSkursnrzayrm/IFrQcbRg0S3Acoc6A6QK/YMsvhO17JVILH9R/FQtVOKX6ak9B
	pg60Y6UlrkYhNHr/AiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5w6i-000000015e4-080D;
	Tue, 07 Oct 2025 01:03:12 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5w6f-000000015dl-1DiQ
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 01:03:10 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-63470a6f339so5586721d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 18:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1759798987; x=1760403787; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eBIOQd4QaXOsZ3ZFa/G0uBWNq68iI+2RMm0FI9CBzIs=;
        b=Zq56P2zbr50zrutOqXnXlVn9QQIK2lFHALLmhahs/0mlAAmDj5Km35Am2SyR5cxrl0
         ErbphJ6EDlDExLee+Paun+PGS7LXAh2Kepp/W4A340E3xyycOJFCKbHYG2hphi+ns/zl
         bwvwo3rUNe2JpQrZHxZWBOHfDAHr7RolbUvSaEgJhDCEX4S3hNeKELAnQVJAaYEY79od
         EIofPKSuNarWoyyIBQcpvaX7+PlS75IIawyH0j8Pob+WJC1oADd0Fz1sy57Vi2mHKNmU
         WljmJRMMtUFf1hHOJ0iYD7D99Ty5S8N5xLby+HCzOVLOa1saz2TwesNa6xZjH7kCWi4p
         BLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759798987; x=1760403787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBIOQd4QaXOsZ3ZFa/G0uBWNq68iI+2RMm0FI9CBzIs=;
        b=hKhrl6K4MV9Vu6z4Q+mlpBEWl2MdOsRbiW371Ajp7dKDaS8aMG6D5Zr5I57mCENeNg
         OmhPHq2eNpwZd9BCTnLcwcEmjMVsGksLKIhQ+X2rjztKgMjC6R06BfdJlDiK3xnZL5nc
         pTcjXDMQrSV3551fVjhNLhFPyxuZnlZ6jXQP+sGvaBtjWhz6fUXp2kGZbry+6zsERUjI
         z3gXdhVe8i8KBlcfB6opxfM9EAUfZlUZ3ucDbNgzA/BFIfrvuoQoR00PpDxZRXiJB24a
         phZlbDkQF79NXj/zZn0m+32SPLbbBJOtENaMJ7haV8ySrnVUCcPZT42rxFehhb3/BzeL
         uMug==
X-Forwarded-Encrypted: i=1; AJvYcCULirb3jp+LptLcW6633wHB6AHXRHN14HlN88yDuHlsH8t/reAinxPxJg9xZjZMrplS3nnwasimGKXdfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnkT+KlLmJP8FmDCmOaf3w2EbeayTs5kvl5DrChok6TBDBhFRR
	a+xB5CU6a5SQ9vjjReFJKh/iE4j2O+M6omvZfgDPsv6Jj2ZzpBz61y1oxnu7XiT05guZPn6Dtwm
	uPnfZGKGAhFdE4W8jZJ13b5nCbaqtrHVEU1p7brURWQ==
X-Gm-Gg: ASbGncsTGl/6uzo0bQx58OiRi/sLdN2clg/0NfFE9QPqwBXfMMBVW0OdoMTUvwel04i
	cB4f9RSp7iP/xSLb18qRHOUFG32dk7d/ZaApX6W3o7x4gbNJcMN5Rd11+pqSI3MObNLDcFZ3edm
	/9tIefUOjZH2aVLm3qKpGu/Y0tFV0KXMh/7TIJszKt+5IOsUY9HJgLfUOEJwhKiQ25Brll6egIx
	w9nGmfQCk3sxKlf3mNxzgJF7+AM/6A=
X-Google-Smtp-Source: AGHT+IHPqXX/Ku++G51JKZF3VapXuzBNkhQUq1V5rRTsgDMDDHFMevDekfr/eOl8a0tgu7pm4weDxaifuaPSOIzI9qE=
X-Received: by 2002:a05:690c:6e8e:b0:772:3578:2ec5 with SMTP id
 00721157ae682-77f942c2c16mr273915407b3.0.1759798987633; Mon, 06 Oct 2025
 18:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
In-Reply-To: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
From: Joel Stanley <jms@tenstorrent.com>
Date: Tue, 7 Oct 2025 11:32:51 +1030
X-Gm-Features: AS18NWBn3AFicAlvLl3lNmePYkN8YXI8pNMvhAKDlltC4-SqQFZLgr1SznNw2gc
Message-ID: <CAM3sHeA2HUpcFJ7LOw1XfjJjLA+A5KsnqFoHe03bv1wHJ_zoMA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] RISC-V: Add support for Tenstorrent Blackhole SoC
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>, 
	Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@tenstorrent.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Drew Fustini <dfustini@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_180309_338799_015549FE 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, 7 Oct 2025 at 07:51, Drew Fustini <fustini@kernel.org> wrote:
>
> Enable support for the Tenstorrent Blackhole SoC in the Blackhole P100
> and P150 PCIe cards [1]. The Blackhole SoC contains four RISC-V CPU
> tiles consisting of 4x SiFive X280 cores. Each tile is capable of
> running an instance of Linux.

Nice work Drew!

for the series:

Reviewed-by: Joel Stanley <joel@oss@tenstorrent.com>

Cheers,

Joel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
