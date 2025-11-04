Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F1CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plz9coVWajSklEgt3iOO2xfGyoMKba3k3CPLOhcNvAU=; b=TASsVQlQBimO1n
	trm6X9pSAqkgxcsYjR993RlV6f6K2xq3tKUkI+JPFpJICFIMQtS3xg3cCA2CWItrjrQbGk2aH9SVh
	QPycwa/h45Fy7A0O1/rYKF3MSpVPR1QI06kCWAqH7pco0MawYUX1guG+k/BsFhbhfwW9r7gOSPCG8
	OhSo+fX6iAOBymXQkTk0pKSShmZggZ040o4hxvph2O+thukXJkBZuteXbRN43iRHOO8Ojk3iAxqyh
	Wrw5BRI6hfTwnvhyNjkm52MeqU4DLmVYigV/H9UNtSOiLhLuvYgJjvPHfhs0pGgJvsQ2pncyvcEFY
	Ra/25Ah0MAjGNC28Gp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCT4-0000000BQmD-0a0h;
	Tue, 04 Nov 2025 08:32:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCT0-0000000BQlU-3uE9
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 08:32:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47721743fd0so28008165e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Nov 2025 00:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762245156; x=1762849956; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/O1TSTyTcVC+LZvOe26uYzr4lGVu8ZW4bCxIjulEb4=;
        b=GAJVR2LFHuZtx+ESpqT8dB6hO3Pr4+mA6R7+GeZKqLXPEfHT+gEOqhTTfSr1bJGSEr
         ZC56LDt0ZcnWBY/uxTap6rlPAaqNc5usgrLBu1ZLdtrwxP4j7sIfZDbiGgocHHw147bv
         ZvO771QmGA22MRV+AapiXLnzYBThqGgleggIrI0AbagZwG1DuS3g63mZg09hk7aknqRo
         +O7cirG889iJ0HI7g5PPnl88hVUAvwPfaIw9KOuwb2QskQB8HuFY/Hsj7b6Y6CFvY+NX
         5W6aWf69qRsl3Gff9WxpT6kdkkbr5/OkJ7SQPpERKeLKV7U7SKX+RwygsSUQWTBuFA+S
         VsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245156; x=1762849956;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/O1TSTyTcVC+LZvOe26uYzr4lGVu8ZW4bCxIjulEb4=;
        b=g2c9jGKBj32zXpYi8q7fulYqvzmTmhWMR5Zm606h49dXbt8vrEYbiJdKuClXwG/1W1
         KN2Fa+xjvsPM8/grPvT/gFmh5RpefeAhJvI3QopjBPzcaV+VBMwNFQviHeOav6/vFkCF
         x55wWbuAEEf1mg4CF61CZu0Ezc+Z0eI6U3XWZm+v6Ne15so9wQidOEkvuPYuZsmsvEFl
         3nuWrtaWqLR3AWZQ6hmPgabFVbj/sIORNM1XZcU+gIO7vCNVnV1vj9pY9IyLsna0Jjmm
         3K3La0EcPRGGBju18cFVGGknA+OoZkXrsjYcKMxvgGHoV+6PcvzJLGycowceKkZ4WKxa
         Dfmw==
X-Forwarded-Encrypted: i=1; AJvYcCVmMoytXJ2Azgp5q/jU9SUEsK+XjSJzErbgXCitl5Ymr0v82OPzijEmVdrPVA6143o2riS+5nolC2fvVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/lE3JF+AbIrAaNrytEj/cyBDaWiYhFCRoI4xQeBxvK4hoHgxs
	QhncKaA8yQLt+ZuYyYnUpoiRo0i4cz43njOK0f9Qf1z2VzhEIm0D+IABGb7/TiCKHu4=
X-Gm-Gg: ASbGncuvDeZjEerS6HIg+KDqbNFOesKKqnuz14us1D3BjWs8xLWehSvslS4+2ZzM+zI
	x/vsgvDvxOQRhS7XtGySKFFTwHsvsUK1vDRbJ0LCCLTnZqMc1HuxMLPf1xC6vDcccMaqjzxNQER
	UUCDhB6Ul6G4X1D8bLLhNkZpqZAwfXGdHSFuDfAaNXupjE+ifFcDqCF/fQkSnpCt2LbEwCrp1Z3
	BK8h2DkRNu0087LmmiloT9bcSrx4NRz96uKw1P0hnAEtMo1AAoFdsXDoEglB/JRR/SSTUqvvwfd
	fMXbP8TBoZbwXp5wIfqYWUx5Cy67h97W42ZWTKUaxyEFQvOt77wq24CK7jOHm91K/HXgd7dCcSo
	c00a1TjJ/h1tiDQK+lx6AYIYFWurtWenB1x8dzb8luERkbWzSXyOPgdwG+1VG+r5fHe4EYjC5Gl
	Bw66gQ+yFG
X-Google-Smtp-Source: AGHT+IEyhEqP/V11SA3HoR4U1HIXN+k13COmzT5HOb54Zc5gCin00HHaDach4NErIK6LqUlRHnvjuA==
X-Received: by 2002:a05:600c:820f:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-477308a07e5mr152274095e9.21.1762245155770;
        Tue, 04 Nov 2025 00:32:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5f8csm3188952f8f.23.2025.11.04.00.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 00:32:34 -0800 (PST)
Message-ID: <4cb0e6bf-4c46-4e41-861e-9fa80e652e86@tuxon.dev>
Date: Tue, 4 Nov 2025 10:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Redo PolarFire SoC's mailbox/clock devicestrees
 and related code
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_003239_150155_A4089B22 
X-CRM114-Status: UNSURE (   3.93  )
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



On 10/29/25 18:11, Conor Dooley wrote:
>   dt-bindings: clk: microchip: mpfs: remove first reg region
>   clk: microchip: mpfs: use regmap for clocks

Applied to clk-microchip, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
