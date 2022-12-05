Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BC2C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTVaZkB9HULJW7dZYZ/29g+Ku3i/EvoKPRLJowVe32E=; b=X/YxEDQtPZMsIU
	Dz55zDtLH9wen36cZEVcrR93jvgGzFft+16OEY5wxn4YiYSSQ0sRpmQwGmxJbFvD6tEgeCoCXERt0
	2mme9ZvivK4LtafFmRtlbQSwp1ftcsJxNdtmMr9ajAu4hrR88Hp+FQbjo0M4Tax+KatdY+m9U5yXc
	wYAnIlGKmNbBKR6MCCK71gefhUBF9npAG45NAi0JZhPuRFKZ5Shkf6eql4iKQLA1tmE0UB7DWaZME
	yCX0phQbavPGF1A7x49OXq/dEwwQIU9VzR3i5l1Do5hTyTI3YPVIFtimoPHMX21PQ3TQhJU0DwFfB
	fsPVwq7uQYmUhNOnby5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2E9P-006QxI-13; Mon, 05 Dec 2022 16:17:03 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2E9M-006Qwj-4m
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 16:17:01 +0000
Received: by mail-oi1-f174.google.com with SMTP id n205so13591510oib.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 08:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fq8qop3jPkeA6VnrIjkfepKATgLQISCUs8QA0r6gq7E=;
        b=IP63yY2LzIBDp5CR0g6LXkd8LFyQibXvU4TZ+IvXV03UZoNiAsu3j6XNwG4YwQShTS
         bUkY51NBv0QMh0FNr1K48J70sQZM601egubl3SJBOgiOv6hhBiw5qE5+C2tcvyM6H1sV
         Uotvqtz6e2Z8rJIE6LLfKkEWolTyBcAzhPPIaYUjdg6C/yZpNRYDLNz5IAVjjwfUNc52
         eMpwS8cKuun4oxTdVQT01Rj4syj/BiBkf14C1rdqluj4Ub8MwUhDcmb+JPIX8xJSDL95
         0Q6o4noC15KCrNfrwV/dJ/TLK8Q3cAQi6Ra4sAOvt9IZoik8CnJb8URo9Rn0Im0ILAOq
         p6JQ==
X-Gm-Message-State: ANoB5pltyuWJP9luatr6dJQ31t0qYQv/n6vripqJ793ZhKc+WT3C4Eu8
	DFKrXPYYKkY5D29LNIhy+A==
X-Google-Smtp-Source: AA0mqf4uYnMAjuj0jxyIUx3V6HeMwLgXhtP4Zbbv1j1uRbFBkTgANaoMqamQQIiABgzwN2s+FH+o/w==
X-Received: by 2002:a05:6808:114:b0:35b:d0ba:1447 with SMTP id b20-20020a056808011400b0035bd0ba1447mr12049841oie.93.1670257018090;
        Mon, 05 Dec 2022 08:16:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q13-20020a056808200d00b0035b4b6d1bbfsm7309649oiw.28.2022.12.05.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:16:57 -0800 (PST)
Received: (nullmailer pid 1980008 invoked by uid 1000);
	Mon, 05 Dec 2022 16:16:56 -0000
Date: Mon, 5 Dec 2022 10:16:56 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: timer: Add bindings for the RISC-V
 timer device
Message-ID: <167025701595.1979605.16523500992587130634.robh@kernel.org>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
 <20221201123954.1111603-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201123954.1111603-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_081700_199641_DA8BB8F0 
X-CRM114-Status: UNSURE (   9.85  )
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


On Thu, 01 Dec 2022 18:09:53 +0530, Anup Patel wrote:
> We add DT bindings for a separate RISC-V timer DT node which can
> be used to describe implementation specific behaviour (such as
> timer interrupt not triggered during non-retentive suspend).
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
