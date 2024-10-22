Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916ABD17152
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMISXZl0+5yjJELkqUEVvNBQ1s3w0KmPv4EcbOv0yiA=; b=XVRVETH41J7igr
	2jRopsqUQTPFwOIHJyuvQ0WjC5bSYB6J3a2kh5T8fx9nVIMuG5nxh9mP1GCcWtkALcmY1qMKJRT5c
	zjtpODuShwIFuUX7QaUyGgT99zkdOboTT2RaRGhpQFgFo1bRuR+wYSfcO3udaxpbUX+HbPXk5kjRX
	JXLO10kF+7phLVBMYrK+jNsb9GjfspMhVxLoW7UkBY9gYhoabE1HNjr67ez5Qrs9ev2MIHCWuq0TY
	rhXSJlEMIwdS1XCPmbrE8BFRpogxLJWpf9V9Cur7eIuuAB6MHmJiXl3saQP7Cd+lwLYm2w4V6sKRI
	C11rGHfsWmxHA5bJq+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t33KB-0000000997W-0mFc;
	Tue, 22 Oct 2024 01:04:39 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t32zf-000000096Ow-4ARw
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 00:43:29 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7eb00dc77f1so447062a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 17:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729557806; x=1730162606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjUFXuysliNb6jOc1fF186zy4oPHVFc3jmgowhIzG7U=;
        b=C3ezsIs6TItqXmsq781XXLTcp0PEzbP+Pt7WPObtjYeFs9SLA2S9M69ldbbzedVM/T
         sYwhOluq/oC/bldiNE8e+Dv0/XjoZgVC+fZmcQ7NuquTH+RvzK2/59yR7yLV7hGPGb/7
         +Py5Sj+ZtET2JhGCzi9MXnQt4QC3dH2ij/JTPr24bmKyoUj3Z0x9JovfWvBynTodzhy8
         RXmR7TFQG8Xr/if4uQu5wgiMEwCDi+vkjYshZfseHOXN8Ye63vsMv1lq6vJ2UEdoRflW
         N7kh1VbV4YGoCEcdHY12PgUToA3twu7Q2sNOdjPg6TAm0mkrUX76rDCwyqdLiRu+pbPd
         yLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729557806; x=1730162606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjUFXuysliNb6jOc1fF186zy4oPHVFc3jmgowhIzG7U=;
        b=HRU/dG7sthSdaF1SSs877YpQ/p6oXEJJ4UwbemHETcbwkfKCVEdFjIqFKv0VL4S1ly
         AukdX6h2Ln+9uUvKbkv6PIvnGAaLaOxGjAhL9w16hS6ekR/Oa2P1GsJ2kWxFWhPyhy6s
         dAhpcu1S2ozJq4VAgaWXVvjmxyeYnFnMy03v7hfnrJvl/wWXftp5B2aRIGSQtCujGgik
         ff+R/zt63FzXtTHP0N6Lili52Bxc/nWXd47NHFMvYuPWfsUgFLc1dhfA44qSFKbcjKqr
         IrYCA77P9+msMjg2+yyjTJ832JLk+7CJ3hlc2iBETpaUwttjsKv4c1+lhlgREZe/RMt2
         /i8A==
X-Forwarded-Encrypted: i=1; AJvYcCVKmpkcQfLR212QYT+OLGqce1okY8POkqI63p7GjP3jjaUfWmLqBHTnqL6+4FI9MeP75rRn7kr8QxNrxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8a9gn92addgmkf+Np4/w4AZDKb81kupicLkRrEbO5admFzof+
	ReCBsMHkHQx4B/IZ1ooHbg2wsvb9/H5lGT+iDSCiExAF8CAO+j0n
X-Google-Smtp-Source: AGHT+IEq9b7KSsszMUpYsfGE1VXvTcTwMm/M8YEebR28lh04TKoLDBUZwYW1inEXr+gQf50tCmONog==
X-Received: by 2002:a05:6a21:2b02:b0:1d9:6d08:4b43 with SMTP id adf61e73a8af0-1d96d084bb3mr1244594637.22.1729557806408;
        Mon, 21 Oct 2024 17:43:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad517450sm4582085a91.51.2024.10.21.17.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 17:43:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Conor Dooley <conor@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/2] Add board support for Sipeed LicheeRV Nano
Date: Tue, 22 Oct 2024 08:43:04 +0800
Message-ID: <172955777485.235966.17744261419572259209.b4-ty@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
References: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_174328_056738_F1756A65 
X-CRM114-Status: UNSURE (   8.20  )
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

On Thu, 10 Oct 2024 17:07:05 +0200, Thomas Bonnefille wrote:
> The LicheeRV Nano is a RISC-V SBC based on the Sophgo SG2002 chip. Adds
> minimal device tree files for this board to make it boot to a basic
> shell.
> 
> 

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: Add initial SG2002 SoC device tree
      https://github.com/sophgo/linux/commit/93b61555f5095a44fe00df27399270867fbf278a
[2/2] riscv: dts: sophgo: Add LicheeRV Nano board device tree
      https://github.com/sophgo/linux/commit/d32552307b6c526aa75a9f9a0ea29a4a7f1746b9

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
