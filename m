Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E09C54E49
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 04:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lCKaEicybGdT/DOp6UJzOnlDoY7iwHT8XGxAnKBiAw=; b=raTaRaaqakvjkW
	9/RVaopRVY6v9DzLwz1LV3DJdU8Dk9vDlrhl4sRRUX7MU2KJfwd1KFtuR00D+1tsqc1l9ocQ9sSiU
	4z8Io9HdTJXUDFDlOgmWivZPCaKAnUH3TcZtLf7gHUwQe6Xk6wNuXZqHdq/j0h/X6VA7pnX9/Efz5
	TseB/xBOL7HFDn2zFlzVQguFu/UoXwfl3osLIV/zFZjjw/PjMl5D464ZETWTCNURpXgOBd8I0PCq3
	wNV+PNPuLVpxgucfDBVDusqOl9+R46tEbDUERzr8wsRdabB/HQyttjjz19aqCiWgj+IOdIyeHQm5G
	tyNF2NnVO4A3pqQ3pzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjtqv-00000004HKZ-3kXu;
	Tue, 12 Mar 2024 04:35:01 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjtqt-00000004HJN-1MT2
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 04:35:01 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-788412a4b78so177233785a.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 21:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710218093; x=1710822893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBI/dZHSCZMDcyRVph4NOafsCczjFoHj8zNVJflhhr0=;
        b=gMFplQcUg+nqIdXAOV/zM9BaBETCSYi8fm9eFhAlrUBYiheFsoukIhGcc61VjuG1CE
         pjs/RMmbEkf8WjBnsvCf+dkoLMZEJBZcJd1vp4/RVke91zRS9M0PYaRwFezazB5Pp0L4
         +qKP/K/MlCeg3YdHYUgUwAqPiwbb+XC+47Lw8qVzbhn038W61728kBdaPD7LRhtGDeRI
         +pe+2sBzVraIV0GG9qms4Mu/gK4dNHM4MkqC9QbRZ/iTFUN/X+RpBmYOP7kfr2zG2OX7
         sqUKFo2Vi2Y9QEGyOagFq3ZT0ap5EYbKgybz44rDCjylsBQbXpWOWdYbvdSaKy409tQE
         1enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710218093; x=1710822893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBI/dZHSCZMDcyRVph4NOafsCczjFoHj8zNVJflhhr0=;
        b=czAIq/5hokTgs0GrWx9iR4VJeZ32+utAtstOykVjRSy6h2VGiDYZEshhJdagJWo3+d
         vV5rt2i7mlRIuVjmOz9aOXIs9vlfGf8kbOzNLWBbaX+AK++4CzG501nHQKo8GchOoT+I
         Y3q7pNhHPLeefLT7DIJacMooznLWuO/jyp8spOCoIQfbkEx6hWOiUYazxAbtq1c9yhnK
         coOMiknzDPSizp6/uMpa4NojBCdPRY9eAzT/yN/b329/VWB0+qcqXlC2t6oMCoxUcp+2
         /AhpyX/y5/4c8o+nHfUDYoAzDx+VHgi4yigqb060zA4PLWdPolBllUQhhcDYKD1EmZ/B
         QRiA==
X-Forwarded-Encrypted: i=1; AJvYcCUNBhZoZcKhfgNzDQkZebLCjPuJMvJiklnKNIgvbYjAOCfNfGkbvzP4fAPuCvbODDkNY1kvD/ZWBMmVpsHfZe8L/GyY266eGuk8vlNnPdNi
X-Gm-Message-State: AOJu0YwyoiVR0/iO5+ieKg8IKuiJBw6egkn26oZhYeVYJjGcq21uMQdk
	RPGPZ6Z5p4iXKxQ1DaS692GDNlm2ydNXOwivMwVm5/A6uTF7RxHIJSu5bNBwAKk=
X-Google-Smtp-Source: AGHT+IEvAxfmoGYasfTCC3MevqLlFLMvT6Ykp4r1Djy2Y44F7dYNoJPlKmKQBlkurAImzdTXYRkxeA==
X-Received: by 2002:ae9:ec04:0:b0:788:2f37:e7ff with SMTP id h4-20020ae9ec04000000b007882f37e7ffmr9628392qkg.32.1710218093312;
        Mon, 11 Mar 2024 21:34:53 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id k25-20020a05620a07f900b007884003f9a0sm3342359qkk.122.2024.03.11.21.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 21:34:53 -0700 (PDT)
Message-ID: <a4a55e1c-a7d7-4d56-936d-2cbff0fb2f20@sifive.com>
Date: Mon, 11 Mar 2024 23:34:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] RISC-V: drop SOC_SIFIVE for ARCH_SIFIVE
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org
References: <20240305-praying-clad-c4fbcaa7ed0a@spud>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240305-praying-clad-c4fbcaa7ed0a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_213459_566529_FB8AB6E3 
X-CRM114-Status: UNSURE (   9.62  )
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

On 2024-03-05 12:37 PM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> All the users in the kernel are gone and generated .config files from
> previous LTS kernels will contain ARCH_SIFIVE. Drop SOC_SIFIVE and
> update the defconfig.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/Kconfig.socs      | 3 ---
>  arch/riscv/configs/defconfig | 2 +-
>  2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
