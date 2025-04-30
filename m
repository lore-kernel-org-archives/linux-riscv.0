Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59720C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 03:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPm9sDImIzOlSQZ+Wr30fQC7CJIhdvi4twzeO+z1SWs=; b=4SUfnAOX1kzifM
	2rE+MxCj1DEVPoi+LvKhJmHrNpuAjfKnJC7yUXCZd03HOoLeZmciY+Eq4XSvmc1RmTz7bBsKK5EHJ
	Saq2xbK/w6YBfspdJ5dz8ICRtlrr6SGavcTjkeEjW/4mw24QbCzGak//ZV4cQbLmLd6Q/7xZq1t2g
	2JfeaAdNElX7aDSzNVDQtv576VYOqMMTCdvIXTZt9CsoEnt8+G+VkfyOPabh7D9SxUbtrG/L5+lY+
	vyHACW1T4bIyAr40/SsGmZlHrUBikaSiELLMphm59ET9Nj+ZBAA/htswxqEUtrPgKj8oBJ4ak1S8L
	j5Cucaza/chsC2JNdJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yZV-0000000BdBs-2Z8z;
	Wed, 30 Apr 2025 03:57:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yZT-0000000BdBJ-0cMs
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 03:57:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2264aefc45dso101817645ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 20:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745985438; x=1746590238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyLc3Zik1vXa0yun6h3Hm25QI+ZOjteMPcqNd+zv4kw=;
        b=AT4AVx2oIh9pEGMRSlr28SIA/Q65QrdHbX7Me35jQ6CyW0c5ocft1IbEkI1K8c0jwK
         7BL4JG1utymgZ1QKoJWb61fsZMQA6bEbhOoTw3XrPjlViIK3Mfm1Ei/uIg16/xO84Ruy
         Gs8Wquaf8oIpx5UizbkydJlCvwphifgl13l0mNlA9RwyPj/AzltzdTKSMxTcfIdh24LI
         eKr9yYIrJWTL3/VXo8JMURhalQKqZl/6tghT+JVmZvyOxTQDNOh4TX0VwDPI02s9theP
         25YJPxSZL9MH49RIXC0+ZktG4b7saCwQMGTXnhhjj1ztrauNY3X0mCQMehhVf8/iZMUo
         nTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745985438; x=1746590238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyLc3Zik1vXa0yun6h3Hm25QI+ZOjteMPcqNd+zv4kw=;
        b=DTaCOkGWqgJp7GqoXC9IVzzm2rytsXboxMPH1l51wiL/KSvBRCUaZi/dpD6j2BtThQ
         CMi+ibMURNdy90FK5HJZgq5b1DhiqrVaYVh64npu8rshoPxxbVbNbpGDqSKz2IwYlWwd
         Q6zSuw3VopZPNV577wsbrzJUntXH29EjtdY9m75rxg9WW+yJR//MEStZ8p+t5pcdnOeq
         51wYaHLXpML+V9s1U77BgJiWen5pi8mD70IyV9PasQ7QfJ4Oophpez/y987NBEQr1I6y
         sGb6yfOvgzWvgBgHkWC/Cy7NUm93lMuCu8MKfko57QXOGmOGbBNPrwyKmkegEbaIhtPc
         7rCw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Hla0Ciz4PzZH1He1r24JP+FU4EHBd3LEgxOO/7YnfytmgCjPNkDyOr93JRUUbXjt+wfm4wxMhOW4tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeT66tv9y+lAweP7bPgDRDz7GpCI1BWDwHAb6KfsOCIpuIYIii
	FX6PlAtyB61Vt9z9W29BZODJ3/0d1iejfBlBt25SzhpApsZljRn9
X-Gm-Gg: ASbGncv6lywZEXzEpPiuop/KtvxLQE5QiBSugBo2MrH8HiEi0X1jOCNPaSCRXprb81l
	YGnWExM+/Ao70a17viRryUhkarzE1FJEhdw4Z5FKgLGXNMZgAp1ulxJ/ncF3K2TLUAawuq9lhLr
	BzYXm/6lKcqAVISMd+efbKcPScyi3VKYsmkCvPV3WnoDBSUmva58KE2qg2wcy7xFXlJi8UUq9tc
	forAQ+SgC25HL7J+dvtyOSHpNrxLZgqJaT13G2OjcGPQbg/JaBw3tX+FBiHQVAjjVLVc5eGCIzL
	ngMG04+r03l8PkHGaR+kH22iuSGb1KkSYaXVHEkMj8ADFRRArWH8TA==
X-Google-Smtp-Source: AGHT+IEaMGTDmHzgNvzoHNMd9tZbR/u1Q5bg83MPGafcuW9LIhwRqcxCq0Nvid7OBBWwbxOwjAE/Fw==
X-Received: by 2002:a17:903:364d:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22df3576fbbmr27513405ad.37.1745985437588;
        Tue, 29 Apr 2025 20:57:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100ab2sm111814375ad.183.2025.04.29.20.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:57:17 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:57:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <08bbfb1a-57cf-4133-bd03-147ce107aeb9@roeck-us.net>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-7-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-7-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_205719_188977_6767B573 
X-CRM114-Status: GOOD (  10.39  )
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

On Mon, Apr 14, 2025 at 06:35:00AM +0800, Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
> 
> Add compatible string for monitor device of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
