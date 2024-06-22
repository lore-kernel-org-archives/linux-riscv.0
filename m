Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00772C27C78
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s1JfHbkWJ/MN6USG9My+A524idcc4aQqc/ATspiRJA=; b=dGHnLRv6jTjHsU
	c2gN8ZxLeoFWOYMnIUfpw1DLCBZccrmjlYHDssty9UhdwVg5g8iNV2S51ogKpkFBxW2yYKDcwwfZq
	fqLs3keZ0F4Y9TFYZQErebKkKAap0uKo6Dcab69sfaRZqR+DLrb8RSpgLMs0ijV1cJ3E2WQtl/+kk
	gvUBZT8iOsvPL674ZP4o1hDtvBgmGPL7yYuDDhL1mgnrube0OHO76+dd3JlEWPP83OCv1CLN6ctFv
	8eN/YdUcznoCOWf/iJMi2W6b/hi9auZUNJ9CSWAUAvOtC13RHfGG7OOjTShevh1N3SOnxJreH10Q8
	ePl6cMg9KWXJYS/pSr4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKxiY-0000000Bq8n-1lVf;
	Sat, 22 Jun 2024 10:11:34 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKxiV-0000000Bq8L-1kBW
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 10:11:32 +0000
Received: by mail-lj1-x244.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso31753511fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719051089; x=1719655889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5B4zOxXEObeVuA7VINw2ILHjmpFBuMPZOmX3Ds+qSs=;
        b=KL3+2Y3D0k2Nl/BynyVU6ZlJ0aLTy6TxNC3j7BaV14/exJkzoSWwFT+eqOF6glMMnk
         9e/YiMqlUxEOXQIKQiKWLDel0UjRXCTNLKSX/43eKGqcwU7GxDXj9XawO/wHhrUYx6/C
         ScBILmIgID5N+1ZML2VBLbjCmn6OYbJjdo3SlnbZJlVESU0UzF/Y21NE7HEBv8eoSDPQ
         DKeydNPPh4R9sru6g1G7kmCbGXSjj4SW8RQXwBQfrA3m5NjS/K90I5MaK5kOeak8L0SP
         /RYbxelMBUvifMAqZkS59jIOigqKYI1mAyPbTNiOwnMFQubTB39DRb8z+VcxJk6FDASf
         7YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719051089; x=1719655889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5B4zOxXEObeVuA7VINw2ILHjmpFBuMPZOmX3Ds+qSs=;
        b=vnM1x/DpjmSueHHxZDLuZZbSH42CytfvAn6UUPCksrw6PK5NWp3KJyH95mNWWel/Yb
         CV/O3FW1xQWT9DmQjoRZwJ0pc9RtSeUQvDTbWUjEdluRJCMSS35IyOsei8kDOfLUgJ3M
         YVuQM1C9UZeAS+S2AbNYChJtIIygQoRKsHWHisWPxoumJNXSkQvgH5Fp5uv5PYJA1uFA
         laaxeFyVtR3A+wrxw38v2ieYHZrs3eR0PfAEUh2tVT/vtteBvF7Le4UoODuoOnEftDZ5
         bWvS7655flcbNC6gBOysqK3PybT7nsiZV1uPu/FNKjOyr8prKJZZP9aQ1cIO5pfs8dqu
         TtKA==
X-Forwarded-Encrypted: i=1; AJvYcCU5G1Pr54+L5VzQVDONEUPDWWJ2xoujGiRYvDfSDz5rQrAyvMxPjzCWs2+egG81x4QL9GdiSffvlENVr1VypUg2ZuNsfdD06/FqcFVu0mTY
X-Gm-Message-State: AOJu0Yw2c12jyhiWBgx8fbpYdTIbbwd7G5CpPKpeV4nLL9Aecb9NNwn0
	EgeGgFdf0kNhYKwfb1qgm1BvW7EzZtUOMuqJ5wCv92AFb8rIhR6sKZFUbzhSPhWi3g==
X-Google-Smtp-Source: AGHT+IFNzs28ZoOZIPvpiDZrpqmyjo0o+8lqMGI8FW5cgkZ5MV2b6u4cUf/TVXL5AP73TGF6oPyDMw==
X-Received: by 2002:ac2:4823:0:b0:52c:d56f:b2cc with SMTP id 2adb3069b0e04-52cdf82574bmr414339e87.58.1719051088434;
        Sat, 22 Jun 2024 03:11:28 -0700 (PDT)
Received: from comp ([95.165.92.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64390d6sm454917e87.238.2024.06.22.03.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 03:11:28 -0700 (PDT)
Date: Sat, 22 Jun 2024 13:11:27 +0300
From: Alexey Lukyanchuk <skifwebdevelop@gmail.com>
To: minda.chen@starfivetech.com
Cc: aou@eecs.berkeley.edu, bhelgaas@google.com, conor@kernel.org,
 daire.mcnamara@microchip.com, devicetree@vger.kernel.org,
 emil.renner.berthing@canonical.com, kevin.xie@starfivetech.com,
 krzysztof.kozlowski+dt@linaro.org, kw@linux.com,
 leyfoon.tan@starfivetech.com, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 lpieralisi@kernel.org, mason.huo@starfivetech.com, p.zabel@pengutronix.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 tglx@linutronix.de
Subject: Re: [PATCH v16 00/22] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Message-ID: <20240622131127.0f63bc4c@comp>
In-Reply-To: <20240622121403.7effa777@comp>
References: <20240328091835.14797-1-minda.chen@starfivetech.com>
	<20240622121403.7effa777@comp>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_031131_485848_B4EE0503 
X-CRM114-Status: UNSURE (   9.35  )
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

SOZ, I forgot to add email to tag, sorry
Tested-by: Alexey Lukyanchuk <skifwebdevelop@gmail.com>

On Sat, 22 Jun 2024 12:14:03 +0300
Alexey Lukyanchuk <skifwebdevelop@gmail.com> wrote:

> Hello Minda Chen.
> 
> I applied your PCIE series patches to v6.10-rc3 and v6.9.0, works like
> a charm - thank you!
> 
> So Tested-by: Alexey Lukyanchuk to all series.
> 
> Hovewere i had to fix some minor issues, you can view the results
> here:
> 
> https://github.com/skif-web/linux-starfive-vs2-mainline/tree/strafive-visionfive2-pcie-2
> 
> Hope it helps.
> 
> Hopefully to see this series being eventually applied soon.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
