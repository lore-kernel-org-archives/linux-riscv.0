Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD32C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 06:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nt2YrqfQoU53BBuRgxBH6Kht19W4MzMrJm2cIg68Ev4=; b=eYbZf9ZUgA1MRk
	8z3Z6XhC8XAqPqiaLX+ddlo7TLL6SFRLjSU9nQLjGb2QRCvSSECunY9wUfpLApW9AEM7gtN03NfGc
	cixFM7zTKl+dO7mof8BnhJBR+KqFWL7oNrAAd/9BBGzFIQOdoU82dhVUngPUH29ypaweyl+5EvCM1
	/qTAEl0xjGEt/JGUwv6Bb9gs/2Dv2dfq2DzrC1QJ9tYQ+ZUWDETZBJF3IPSejBJcrgzm8Lrk1VCBw
	ZBFtiKIXYVO8rd9um01hnwrVHsLoIpyUVyVExx7LVKSB03nfJMu7aRuI0Du4AjxUnFosm6ZIQDD7s
	AijVok653+HU+ucSvRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZm3Y-000000085uw-1qol;
	Tue, 13 Feb 2024 06:14:12 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZm3V-000000085tg-1tLm
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 06:14:10 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3c031a077d5so1960459b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 22:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707804848; x=1708409648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur4VuvuIiaAwMddxcZFRFhOdWSxGyrzbMVOGTTJmylk=;
        b=YkUsNBHZzA3+KU2tbY6URSvT/qN6SdKcrcqgoHAnIhIZlSwj6IHxj42I53XaUemSXe
         toSUqYyub78k/6ngTMfEmDRC+KmPyWGIg9hM0QY/VuGhwBuzmVubyPUuUZda5eHj3IJ+
         Q0FRQYAnfPC/EqSnwPh42TSUa1co20JCvpG3I4yQgtNIef20XSMJgv5imcND5HyMLk/Q
         c54M/glztq0kYSKHlpr1DkEvZyvHYRP3XLmmaIR7CX8ESOej1sxFrrV6T3wxOxt0+3q/
         /AhbTxiXD/XBxHBN4Q2TEdXDjrOYJudDkJ+vgPQJD1Qr6/ghW5OOyJNaoCxVUXrKs2Et
         qVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707804848; x=1708409648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ur4VuvuIiaAwMddxcZFRFhOdWSxGyrzbMVOGTTJmylk=;
        b=wAnf9T4lbsRFzU2hzXAT282TwhQHIHqYZWTS0qW3CitDwKM6Wz+dI7TrdILkpEfisw
         DaJewtlaIcVVGJ4r+VqTb0GXcssvYaAZMvpwBW/QPgqIiEFC56N4ROy2zg+Iq9+EqpIu
         Tbuui2Q11kPYOjGwGllya/pGZdvIqk/3d5nLJ0vlRgSs7zYT1qrpfr+ApUDmqE3c8Z01
         9NvsmrPRWW7yqKoOB/Z0u3zYBtcvDi2YD4vw6Pam9gmA6nvdjjzTshaqRxox4cW5WvZQ
         PKxlrWGWflDMi7Yb0m2qZilj/NTpxxkphgEUPlg5OWwFLT0HAQZiveBeoak8U+Cb+1ES
         O3xw==
X-Gm-Message-State: AOJu0YxJ7rU5E1aMu8LRRlbkAovhJZhQExUB65aOjNOUWF/8o9QbjRPT
	I9splZW2jC6RSaJF1aKcmCTxO8Mhy0t2UjlP3xDdGq0xQ09Rg1QTvvhHyi9A+Oo=
X-Google-Smtp-Source: AGHT+IEGOmUGwnD8hUfKM+YyablrKp+JD65rIInkFFmTHlzSJeYRJ9LrnF0X/VGLS3YQf1mZMIo1eg==
X-Received: by 2002:a05:6808:1642:b0:3bf:f547:dc80 with SMTP id az2-20020a056808164200b003bff547dc80mr8593440oib.21.1707804847757;
        Mon, 12 Feb 2024 22:14:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzzeuHzK+n1FavnH8wYNScOfOgLIWwbXOsVQE7ANP8BrcNTf11Q+pyalY0v/Oty8c6ah34H8wUDPjZfrjBH4eSlhaElW7Sov+6egABvS0m/18JR4xAx7R2638x6XniDFKNR2EtX36qwlS6fRMPXSbRL/ZYm9RnIonaKf8FiwkLK6181n+Uof1teKm7pyhuDtasyWDl+XbVJ4rF55SLQdYmIocszKHZ2HZfFEZjy9ZK9RyQFeZpPHOsQxDhxbe3dgpsiLdOockOnNmPdHeyeBSjg1GwEVdWDdurEeC6UPaeyRLxyWyy6o7P8bFTTo6Vjd7EbUHx+XPu3Ek+OYOtSpePxQZdjO84f4vSfZB8s+AGbJr0BmZLtwk4Sd5XAUgo6EcMz3MFdaB+Rb456LGnCvou4Cbc8WXaRmfA7j1zFViZ+wMn3IUBqY1p80ogkg8=
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id du17-20020a056a002b5100b006ddcf5d5b0bsm6521173pfb.153.2024.02.12.22.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 22:14:07 -0800 (PST)
Date: Tue, 13 Feb 2024 11:44:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v1 -next 2/3] cpufreq: Move CPPC configs to common
 Kconfig and add RISC-V
Message-ID: <20240213061405.ictoxql2oh5jtg5b@vireshk-i7>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <20240208034414.22579-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240208034414.22579-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_221409_525273_1F8AB3DA 
X-CRM114-Status: UNSURE (   9.23  )
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

On 08-02-24, 09:14, Sunil V L wrote:
> CPPC related config options are currently defined only in ARM specific
> file. However, they are required for RISC-V as well. Instead of creating
> a new Kconfig.riscv file and duplicating them, move them to the common
> Kconfig file and enable RISC-V too.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/cpufreq/Kconfig     | 29 +++++++++++++++++++++++++++++
>  drivers/cpufreq/Kconfig.arm | 26 --------------------------
>  2 files changed, 29 insertions(+), 26 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
