Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A4109449D
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFdJbxRuMkyTg9PjW/poZr1c5rXpw/oiAS/4pCXHRIY=; b=YA1I5LLih0Molg
	SpU3XcxBS1hqDXVCUDFYA2XneMmvp2RZLzHNSnoQ01LxfAadySYKQ4rMyN/MCu/d8upt3TMMW6iHT
	paecUKNJ7492CkEh83y7bLOW1ffY1LSqBVjUotaDmh1yIgn81hgW0fVGVAPmkJMwuKlZFgs4XloXS
	v94KSB8ICfL4hIXnw1HmvpOnEsZmlkMwLbAUHejQvUhQ9A7u3N2+GrGBPZ4Anb2SlkRA0jNqCAYpg
	43WYrRzP7wceWJm8MO/6bB5b9nw6PMbKWK00eg+Iv7ssEW6ZWBsEDD+mr9gE/Nv6g4H03br74VHgB
	jPscZ7vZqL5FN3vXSNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w44TB-0000000EpKv-1vZc;
	Sat, 21 Mar 2026 22:06:57 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w44T9-0000000EpKD-1Bw2
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 22:06:56 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-899ed41208fso25008696d6.1
        for <linux-riscv@lists.infradead.org>; Sat, 21 Mar 2026 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774130813; x=1774735613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
        b=XvhlT+3n9yhISZj5Lf19qzPJd2Woy5iMq5FRmP/dg3lB039LRljd1m6LUlQMJxnm85
         na4JlOvgFaEEZpSNCj/Dm3Eoa7jtMvkWdOX4TiqrBwnOIYfHx/dZqvHCqYLpo7Vvv0F0
         j2KXOIhJua/ckuxADeTpJgRJzZdKqZxshYWr0P9uyRmVr7GQU3j+49kiic9oagBMrFGN
         hC5eCjOnFNyDwVN7y+kguxGxifn0zE4t8CBlx3P/MChgum1c8FCT9iMbO/U8zxHJTq5B
         CGoYOtIWk+hF59SS2MXAjUgxcu57X9KiED+kk0RrXQiH00TkFAoGoyLqL5vn4VskueUM
         kxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774130813; x=1774735613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af3eOZ2o5PhXKSRzIFvJwxgZ/wuT95Wxz/uQTXZmuUE=;
        b=UOpngjabxxii9wbu0YY74sAxY+glf+aKUMF2EfRIzytY9KyCLrqfffLBCypd4WUo6y
         C8WRFyVXmv8H5vZEG2RxumBA2G8WqdYxplMb9SM9mfaPxUIFNlatUzgjfNsdY9qt9Ap8
         p/akzCiJ0l0L4rd9WSr5krp0HQ8WWgQGEpv9/nqYMggJE5+GuV5kmloMYCwuXbvtVmae
         mjk8qVpsNjsV+kHzldiqOJX2cKWLIvW/h1bxd9vqbCqIoX3ptioYb6OU2gTjlPO0+3qD
         RnxitA7Elbe/K7kwNE2PDuZbZk44bmqHXETOq7wdX+Gfd+M4cxseuNaZGRI59Ii84kjb
         NoEg==
X-Forwarded-Encrypted: i=1; AJvYcCWsxtR1rijEgxNPNDdkaO2bcEe3P5Gwjgwh9Xlo5o5U5H4mGpAE3Vg9ABmYv6NE+93uENqBFxCc9fe5rg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw/Lw+KCIgBtIuWh4GBpicnHqx8ds7Qpi36PCOYxUCxwuSm6jA
	I/4yxzftC0dP74wi8NvsdUdz+otFgoPqgLBjvsLZOrDEYHxz2/qrGwG6
X-Gm-Gg: ATEYQzz1/N9a1YwGWCunrNfITnGngxkKJD+JRtcoD2ht/gbDb92i0DwtEOjRMR68P1v
	teIs87XuvncMgNIwiTGq9FNH8doYvWQ1GGaCicBwg6Y8u+CjllMeir9quV1XCErd/vMGmtB+whf
	TOd0h9XEjsnKT4PaZzT0OY9j9HCMJ/V4f9frKwU1J1wp8rhb+AM3smTit5bBKj2j0IImM2jnQAk
	+kF1jmDCqrpl3yBmrvoB+eApV6kjQp+8qFrDpbP5zFOevt+M+luQ6dIJRo3LetnPZ2RfMipRMTQ
	5hpORcAF3HUQGx9yGP9P5MQnf3RTCVPmpgfyichgauqkdZ29OintGIuSQF9zZeBJW0cRdqEDRV9
	MuEBqmGe4v7yZSyUmEN9hKHR7re2c/m1crz+kh4254rV06WfvsIe32i7joklvpEhg4cKhYBIwIB
	Zkc0m9RS1QXHJEylUi8RwoZ5w4QunNUyZFAAcwGbfpyiBysFxnsjxW3wTs
X-Received: by 2002:a05:6214:2622:b0:89c:6289:f17d with SMTP id 6a1803df08f44-89c859bee70mr123753836d6.8.1774130813515;
        Sat, 21 Mar 2026 15:06:53 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536e630sm52425446d6.45.2026.03.21.15.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:06:53 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:06:51 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <ab8Wex56TJB46A9Y@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-2-josh.milas@gmail.com>
 <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_150655_377469_B79F2D06 
X-CRM114-Status: UNSURE (   7.41  )
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

Hi Inochi,

I originally added the board to the cv1812h because I was using that dtsi
on the riscv64 side. I removed it from the list in v3 since I added the
sg2000.dtsi but forgot to add it to the changelog. This is resolved in my
current patchset and notes.

Thanks for the feedback,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
