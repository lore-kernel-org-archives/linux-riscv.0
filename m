Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2421C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daMl7QPVFKdEVVDLiyUf2KlY5NNOy4Ve8p5xBHB/tc0=; b=hAnVoJYNqbeR++
	HGjRp0vUxBHRGlpFsf+jl/FZvmBeUKSYM54nwtbqNGZbK8THbKdEY9YwoN6QMM4fkHrQOkDkgb3Qc
	gQG9Uq6RFFuVbeZxYB6IV2+BA0d3zj7W9KY4RVYGLv95pNltZZANK/zEhVuuWMa/vJKP3qROVyuR7
	VOxBEIGkVrdBn5NoZfYLO0kAvgMVnYRKnGrvo+eZQDMBqX1JXSgMv36Azqis5jE2zwGjl6xeTBxyE
	XZfBLEeWjXYbW2qX99Z7zxc3Aa77MAgTgQd2Mr/KbAddy1IxX0rvzn1AOF7A9oJ5fxwz6XbbZTO2x
	8IDTKsAY+yDxiaBL+OvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWfQ-0000000EWSi-0Gg0;
	Tue, 18 Jun 2024 11:06:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWf1-0000000EWKf-1EnN
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 11:06:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a6ef64b092cso654627566b.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 04:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718708758; x=1719313558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfMMGdvlfsiEq5DK6BWtCQYn7Wz/1sUVrXCtNdCmAZg=;
        b=KNugftJBAuPjcZfQ0V/z9FUaA+DIe+l+ScPNoGN8Z9is6SyqY6D/thCt8HLFz5f0hI
         Gna5ZU6k3+PiZ6eTq/TtQ9aFPBj01jvpU15G6YsFodtA1+XszzolJI+/ECiuiiqPHj4N
         BCDZl6+3FokQ8NoC7M4ebenvv0cg0ecdoeJdC29CcYkhyEg4fV9yvj0XvB/5ucnhMYrQ
         qtRp/nbO/s3FNKpVeFJb8XDQNSZsJRCzS6SqTSf7a1Fr85OwOiXnCEXukBjxs8W22KAP
         8oE5oGGtiNwOpc8djn18h0JU5afpopU844En5BdPKEA8Cn+EKkIMdq7Brp61CT5PDjny
         vMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708758; x=1719313558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfMMGdvlfsiEq5DK6BWtCQYn7Wz/1sUVrXCtNdCmAZg=;
        b=lMvOW3KHn8ggwyEMZnETc9cshrYJiHOkeezCtf0KDeo0tDBfc3p/SGGv2gF5SL4ZAi
         3zUR68gzg7SIuun4BQLm9tlt0qes88RIw/6VYl9OrYgVrDzfJ5pS85b5QrvPlkU2ZHcL
         BFR1jRolgfwGnQ8CNrSSDvt/WmwGmDzS517kM/5eOQLSlspQRYBIze7X/B3svHGIzA2V
         USoxZpq+YP1eRpNav0qbw7LsLvcSWjiqdu/KnxS2svUIy3JDiu86ynzHXmcaBAWHxxcW
         Gjg6E98rW/Wvoy4W0IcVoWvH71CxF1f/4zMf56ki/sqQwu2FU4WT/GQGtM0+GXF+3H/G
         WmTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZPxAr4RMPBY3+ty0yI0dj0qrDT9aBskFSNxkQQtsYfi4sLgR5CXnmi2LVUuJmQ0ybWxNj32n89Xdyp5VBPWSS+xHr45fERTAmScFexOcp
X-Gm-Message-State: AOJu0YyAHX5Opq9lEgyvr1xdzrJkbBIVFhMtU27uWMR47rg1CZwjsUD3
	uJoY4m/eZh7i+10EdI1ZHYFe5+ChqmY+9oS3LWJVC3BIeN8mC3f8
X-Google-Smtp-Source: AGHT+IGkAsPuwFXWJbCeYX8mZPG9jYSFhfnOUVPKQRqrC9lyMrOwm1yZeFYd42ba8PsfHpBCnZhJog==
X-Received: by 2002:a17:906:c091:b0:a6f:5150:b807 with SMTP id a640c23a62f3a-a6f60d3cde2mr815678566b.35.1718708757391;
        Tue, 18 Jun 2024 04:05:57 -0700 (PDT)
Received: from andrea (host-79-51-73-205.retail.telecomitalia.it. [79.51.73.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3ff6sm606347066b.38.2024.06.18.04.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 04:05:56 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:05:49 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Xu Lu <luxu.kernel@bytedance.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
Message-ID: <ZnFqDRXRjoHMaJXW@andrea>
References: <20230725070549.89810-1-luxu.kernel@bytedance.com>
 <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
 <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
 <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com>
 <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_040559_701067_CB5A3CED 
X-CRM114-Status: GOOD (  10.57  )
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

(merging replies)

> > > However, if local_irq_save() is called when irq is disabled. The SR_IE bit of
> > > flag returned is clear. If some code between local_irq_save() and
> > > local_irq_restore() reenables irq, causing the SR_IE bit of CSR_STATUS
> > > back to 1, then local_irq_restore() can not restore irq status back to disabled.

But doesn't that represent some bogus manipulation of the irq flags? cf.

config DEBUG_IRQFLAGS
	bool "Debug IRQ flag manipulation"
	help
	  Enables checks for potentially unsafe enabling or disabling of
	  interrupts, such as calling raw_local_irq_restore() when interrupts
	  are enabled.

in particular, raw_check_bogus_irq_restore() in raw_local_irq_restore().


> This got lost but this is still correct and needed.

You mean because of the mentioned rtl8723e example? are there other such
instances?  IOW, why do you say that the changes in question are needed?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
