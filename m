Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10045C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIRw3AJDUiQd6p1BC5VKspy8R91P47XtbIsGS/kZvAU=; b=sNZeIvpNF2OhgV
	UHr6zPua3x/sHenVvvrPs5ME8iIaG2pZMxoFjUZQYooQUPoEMtIuHnnSkXSq6mSC+PHyk2ieOkRhp
	jSVaDmuvJiIaCo1NmtfSymGiSEjcekmYt9UFKMh88yiz//mwn2yYt3aGa+nab8M55GfBNcYNnycqq
	OtHUr7ePLtOjOt0dtaOZnDH7pxFJP7Rrb1cnimb8OG7MAmh41mU3MEWPEDNo5Qmex59qgDPoGa4bc
	5kQRlOzArkR+ByLC3/D3XcHXjzSAelBcIu9OSwrw+yi/4SmxWRUs6g0RXtWrb6dgNffGJ82T4gZud
	lkavLyn3nUovmq4Z/Jmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Rof-000000014dJ-3ecn;
	Fri, 25 Apr 2025 22:46:41 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Roe-000000014cS-02gT
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 22:46:41 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-476a720e806so26197321cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745621199; x=1746225999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ts2LHLz4I7Y52dAaMUvDVUrX5c5MFwWvzizIevoXa8=;
        b=Mld142fVp9nqLpKyxXCYvt1BikUh4RBqHnrMVKeYoJK9JKreZomCmdxRJRm9wnZcwG
         JCvE0y4dCvEQ4Lnk2OgJYT+N1Of6jX/jz3RDDtfaIApjcqwfDFcV5RSqJxgVWib9crlw
         ZJPD21wF8HjciO0tFl0ewYpXg6p9rA5kQLEeDKtVJrLbSSaigPzRNgu8RPg+HcnRMDDH
         lkFqUi2GsJuT+/Pk5DreMKar9lp1BVY7M5uBMbnSz4MKAAApiP63nJJDEj1ATBH5Suw0
         +QSms8tUoBp7WkKZJkfRvJcwgo5glIkYIKxuYzeoOK0Tx3wtPT6/H3bcSewLR3E6d0cH
         545A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745621199; x=1746225999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ts2LHLz4I7Y52dAaMUvDVUrX5c5MFwWvzizIevoXa8=;
        b=La8JDNPPME1IdMLMHWccVY//kmK44wMH2YWdyIRAGmTTexSBqGFWQiON4viAudGSWA
         Y6PhKvlhE4PpR6PgZ4zTfpxRimP/QB1cLiGadO8Re/iKe0Mc9uTumTmvmMVp+M4zkc0M
         ijwMCxURKz7QnqWXyB0gVcV3aKyO83qSEDKhKN35jDLdpMSAvFS9XTBh57roUAFYLWnn
         SNMZxlo1JkHIDCu/RNglfc+XrPk7Y95WfZAKT8B3HrtbmaQhqYnAWgeA0QLWrYsBTOhh
         6ZcaT9Fx/JS34+JSwPvmwoQyPDYjD8D3FEJhqUTD39aFA7hUfCIn7QhTfhLFWWepmlla
         5X1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP9scOyJXvqHAhUL0J3+qrRDGzeLC8Sdnvaetk8RLWHqyLn+NcGT/HrlS+NJiIq1ZoH/MkcLhITtqeiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrd5gJ3viN6XWHkIxQMl4VEFRVKzZdz8CXB9EEq+3uvBun83BY
	neJAh6UXZCDhFPFvFd1vnmwC9ZVMIx42NrVESBZkPGGtgeeNZXg5
X-Gm-Gg: ASbGncuA3XlgwgLYOvax1+MZX6zc3LfXUyyBesQoyHPNHEcnxiIdE+ghF3VI6P3/AJc
	nz6QbMO5UEGtoe5jzWq/smnLjQgETDl0F4bgu86e9vD1V7AQrMstNwj8QOiJwEk/nCJDzuytgt5
	5U98EoU9USQ59RAmB5rbLZMbxxTHgHrOM6RtGlQGAbshZNsUN7N15oR5JG6hvQkWfku+gU6fdV1
	ztlMRIR3Oe9L7Gsqz95nFmWOn60tyXhk69lEkWw2HhnO+6uHDy3FFX79qDkCTzE6bVav2rLQhPD
	1QaqrI3wemh9ulby
X-Google-Smtp-Source: AGHT+IHFMnb3Dv8ueG3yqBlwgHCe8l9Ust4EP/2O6HiGpIC9Wsr8B1BoBXzzFa/o+yntyw1+DEItgA==
X-Received: by 2002:a05:622a:44:b0:476:653d:5aea with SMTP id d75a77b69052e-48022c311f2mr71095971cf.4.1745621198814;
        Fri, 25 Apr 2025 15:46:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9f7aade9sm31608541cf.40.2025.04.25.15.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 15:46:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	dlan@gentoo.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/3] Add basic SPI support for SOPHGO SG2042 SoC
Date: Sat, 26 Apr 2025 06:46:24 +0800
Message-ID: <174562116075.44155.16153568743582416091.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_154640_046995_90A4D4A9 
X-CRM114-Status: UNSURE (   6.74  )
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

On Fri, 25 Apr 2025 10:28:11 +0800, Zixian Zeng wrote:
> Implemented basic SPI support for SG2042 SoC[1] using
> the upstreamed Synopsys DW-SPI IP.
> 
> The way of testing can be found here [2].
> 
> 

Applied to for-next, thanks!

[3/3] riscv: sophgo: dts: Add spi controller for SG2042
      https://github.com/sophgo/linux/commit/ae246f5c0ce444e5c964aa3a7d2d14a6df9153d6

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
