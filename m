Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C7CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaeZKJ15lkD82PX6ijkfpC6I7R+wqyCmkkOuv/dklws=; b=vqncGCFTcVN1am
	6ortb2FVEi+DxdfMv3ZDl/CoZcExzEvdlampFR5233OHsTIyze8xJk+RTU1ImLJf1LZaEQ/Y4jD2m
	iH9W/8Fr6Q4uUYcAGB+sThhv+Q9q4P6S3cn/Cy092UfTpSX3CVjiQDVnjZXEKS/RS4tuWZOv9hh9E
	FKDXZtHHsbBUIQNUTQIBNtV8lRY9l8kT6z3Ed1WyrPSU1wHiEofCfxxpVERSpTR29OV87lCBVomRD
	7sc0dB4bmxvVRI6wOlw0WEcd493tFyu18537lgWFtJq+76c2v7l8YaRzbil3ZUlkQ7i9YUpIPoYYu
	CzjVjXIp/GOfS+9wRj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YkC-0000000DBkM-3VyQ;
	Thu, 02 May 2024 15:53:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YkA-0000000DBjm-0vQQ
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 15:53:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1eab16dcfd8so69901795ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1714665187; x=1715269987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrO+BzTfAqGrVSW6gaAM1uVW/UhYnHc2qIbuASzSIck=;
        b=Lb2/OhT3R3HIXq3DtQt6JnmqgydLEu52Y4J5tiqvQwjh43VVliUqyYKZDgpcqxfdJ+
         hSVRQtYpZsfwvVTCDLdLQGnX4N8Qg2LjYX12kjGlet1LUwoXGEONxnkJqUQt6wTBoVjl
         5cCsvpMr/u+yNKR1gGy686MPY19u1WKl4LeCZJvomUkD8H218YmbzkxiAosFkmYWYpM+
         JVU5WweWkst4ScUrPioc3esIqZfSFUXnUpkR2WUbKMSfWyAL9E3j/2nirTNRZVESs1M6
         IaqEjgQIIezO5Dg4uWnYO+dK28U9cUf6Ecu/szZRfb2G9RDcth8pUXfi321cqgZgn98Z
         vu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714665187; x=1715269987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrO+BzTfAqGrVSW6gaAM1uVW/UhYnHc2qIbuASzSIck=;
        b=kKmwHSvqADS1DlGLZ5Tc300Vmm0BAcVe0/l9KQF4OXykQVZ1jP9YCE1uPN9UUKpYqW
         8CT/n5GwgDaP0mefggzjjRvlufuVnL4oXgDhXjgH176L8PCHQrCuUkJ9vQijhGJXFLiP
         lKd1tCj8HLUEfWzub3HI6SOw1JvGHwS2T8QxlZXuGJDYdZN3Nnn19KXmcdumsHP0fzn0
         llVXQgbl9S7vYZ1v43kUlziU347COB7PZOrxdDEAYFysCzsTl6PPUPqx5V91RHNGWBkG
         erjKEMUH3PZT+91GKxCqS0ihuTMd2oMPrKiO+c7MupOfQiOXPhjgtbNgI/VlTadJ+1Xb
         deBw==
X-Forwarded-Encrypted: i=1; AJvYcCUVbFpdSVKgkqGVGMAzoYERKUT6cnIjL+pBdwuOOMb6XHnhBt4cggaPj99zreI2deN5TJK3fX+Y/7VO9rZ5Y1xUL3RQfPg5RWskjRY/F+Mq
X-Gm-Message-State: AOJu0Yyx/qKcyjhQBXxV2F+/uIhgcj70qVH8jTlo6heWsG212mmij0x9
	FhVafOWEs1Wt6VTKEztlM1o3crtFBV6O/79TCf3Wfu5NEogfIGEhs58vZGkLxLs=
X-Google-Smtp-Source: AGHT+IGrW1OPSdicmml9TYEIm0yY7aapvxFGT0j7ToPXTRa7G6YIhicWH6kAZGYVaA97W1Sg6HV2lw==
X-Received: by 2002:a17:902:bb8b:b0:1e4:5b89:dbfa with SMTP id m11-20020a170902bb8b00b001e45b89dbfamr28506pls.41.1714665187388;
        Thu, 02 May 2024 08:53:07 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:e8cc:54a1:83d7:2ef1])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902c44300b001ec2e620b1fsm1447508plm.273.2024.05.02.08.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 08:53:07 -0700 (PDT)
Date: Thu, 2 May 2024 08:53:05 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH RFC v2 4/4] riscv: dts: thead: Add clock to TH1520 mmc
 controllers
Message-ID: <ZjO24XikkqNAnbti@x1>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
 <20240426-th1520-clk-v2-v2-4-96b829e6fcee@tenstorrent.com>
 <1444dac5-c725-4bf7-8843-469a62c3abf1@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1444dac5-c725-4bf7-8843-469a62c3abf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_085310_293495_89C388A7 
X-CRM114-Status: GOOD (  14.86  )
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

On Thu, May 02, 2024 at 09:47:43AM +0200, Thomas Bonnefille wrote:
> 
> 
> On 4/27/24 2:10 AM, Drew Fustini wrote:
> > Change the clock property in the T-Head TH1520 mmc controller nodes to a
> > real clock provided by the AP_SUBSYS clock driver.
> > 
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> 
> I experienced that, when the I2C clocks were correctly configured, the UART
> stopped working, likely due to their dependence on FOUTPOSTDIV.
> Setting up the UART correctly, for instance:
> 
>                 uartx: serial@xxxxxxxxxx {
> 			...
>                         clocks = <&clk CLK_UART_SCLK>, <&clk
> CLK_UARTX_PCLK>;
>                         clock-names = "baudclk", "apb_pclk";
>                         ...
> 			status = "disabled";
>                 };
> resolved the issue.
> As this would be mandatory in the future, I suggest that you configure all
> the nodes currently set to a fixed clock, not just the MMC controller.

Thank you for testing and discovering this issue.

Could you post your device tree so I can be sure I'm testing the same as
what you have?

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
