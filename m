Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFDEC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 04:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDXxq3xb4BksTO7K2m8tDdfQfcmblaz3WqPWHqCuo6s=; b=th82Aol7mzSW5H
	cnKLBxmZFMTwzeniXGKRgOZizBTVmzYI4HdzAVxWty1HG+U7r26wLBZzUUO1Iwv+m4HpkUr+OUMFH
	aRrnXbQ1lKk8QuzN9wW7rBjfJOGn0rVg+Q7pY4N7bFR8efyDfERa2yeT5+mG4NNuVKelqxW241gnz
	PrNe9ht9VtqSVfxckaVVMKDs24oS01ss3Ej8TJPhQ09XmIdhbWwLfNKjZExgB1NDqBanIoLG3tZUG
	7qg59rVYjkAzkhx6nbKdsWf1l8V6lzCoSWpI/zIZ2biqCIb9DV03SVItrYLIjMnAlPARCEG0hcgUR
	zj1YcvtBg5dWssnPeW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjEi-0000000AgDZ-1ipV;
	Thu, 10 Jul 2025 04:50:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjEf-0000000AgCr-2ftj
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 04:50:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7494999de5cso369015b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 21:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123016; x=1752727816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43W4i1GCTgED74WiEGNoHpiF4mzL+pQO2g8gssUc4vE=;
        b=dB0tnzxYuQsfWL4zlrHVfcp8IRnT7/e+7jQPurKXWi4Ezet73cX+c45+3V88fE2U2q
         2xeMtmYx44nK22ItAekwAr8WFq/g2O8eMfquBl9tw13s6JA2iSPuHd6D4UPTNi0qbyUU
         cubH/ipDG3jnpbcdd4ymxbXODW3bwv6XnXiA3qoQsCZLx/FfFuRjFS79wwojLfyGgmSh
         P7LKRDAvPyFJ1zK4WRVboVlm7sZvUd3xQJohVLJ4LndGU3JgTZWptc7Lv32b9OC+9TPl
         Gx+5ERuZEbUFN/AtVU48RStuMzT4F410FP+yLRP1xyOcJri2MVJyJRv3g8KBHJSnV6Hn
         n2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123016; x=1752727816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43W4i1GCTgED74WiEGNoHpiF4mzL+pQO2g8gssUc4vE=;
        b=I/iYniz1kAw7FKyaesSagIr3r7U91FJk4D3JvQMPzrFMl28W7VeLRBuFOEVEhdqYHM
         15ohbsa+0WX4eAdBN7KkxMIsz1uNlGPLeeiqTfy7sb2lBMeueMeoeyq5V8940HpS1Tml
         h3Krp156Gjpif1s2X9zmi9UifGhlQfYnm+60YBE5V8WPaAzd8Vsof5XhapaTk6ND5+ls
         MCYEkVeJYs5Gy/1HfecvaPGRY2EMiXdQGD0CoMOe+rE/XMRbGCIlet4aDcYW2TpXVi3v
         Vs8jhbTovMOaB7yKTRtD8QlAMUbZUikOLFZ9OYqYQzmqPnTYW0MrZBYUk36i35fLwg0I
         Td2A==
X-Forwarded-Encrypted: i=1; AJvYcCWgPDV6sba0tdZKv/3wCyH5yqhukTovdjAuyeHQWxfd4FIAnPuXjCQpFpKzlyygIgDLXA5pgsGoh5qQsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxdJO4hpSZilUz/bt1HdvsdIZbgbezMGapiqF5jlHVpyGTwHhR
	4cGC5ET9mm8Cqr1p8tIzsd3RFEan445TJ7oXh2U9gRECjyPUr/l5+PoI
X-Gm-Gg: ASbGncuAEKLWCTaiSMt1lcaz+1n7NWM9SF3rEMWrNdqWiQLOfrZBiaxS1Uw2XVMX1ae
	Pj4G6c5gcNMsNdfdiH+6JVm4NOWqp95CZX3H1aXp3cUffeJ+WCjezkJhhHwtj0eCCKDqBoSI3pb
	HOnBeQahuFAazSUhHgPPZBLcqff0HDXPtFAMdfE/oYpPoDkxg5wAYZp47G4sk39DzdSUrFakaeq
	KrpBpJ5DPHzA+ReuQ2b0tBtfBLNR5gfh0BNMWBT59dEFJ29kC+m1WQ1NqBrPNWjhx5j9jSnTg+C
	uKn6rDEh499osqKuWE4ycD9oUX0TiRt3JZt+ZbpjEjKQrjRhej1/YPFHrVwvqQ==
X-Google-Smtp-Source: AGHT+IGZnsUpzh+ZmsBVRBPZSQgS+0QwmCGnqZeIQPjP/On8etzioYUBd10sRVdO4/dKBZSQ/6l1KQ==
X-Received: by 2002:a05:6a00:994:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-74ea6709f51mr8662943b3a.24.1752123016476;
        Wed, 09 Jul 2025 21:50:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9f4bc51sm808024b3a.116.2025.07.09.21.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/3] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Thu, 10 Jul 2025 12:49:44 +0800
Message-ID: <175212292374.416883.3089328739735203878.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703021600.125550-1-inochiama@gmail.com>
References: <20250703021600.125550-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_215017_697180_3CF1C7ED 
X-CRM114-Status: UNSURE (   8.70  )
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

On Thu, 03 Jul 2025 10:15:55 +0800, Inochi Amaoto wrote:
> Add device binding and dts for CV18XX series SoC.
> 
> Change from RFC v4:
> - https://lore.kernel.org/all/20250701011730.136002-1-inochiama@gmail.com
> 1. split the binding patch as a standalone series.
> 
> Change from RFC v3:
> - https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
> 1. patch 3: change internal phy id from 0 to 1
> 
> [...]

Applied to for-next, thanks!

[1/3] riscv: dts: sophgo: Add ethernet device for cv18xx
      https://github.com/sophgo/linux/commit/0100910f6ae2659c1178b3ece064c2f2e7eefbae
[2/3] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
      https://github.com/sophgo/linux/commit/a4fb40b240fecc3cf84e12277e5b66818a80e3ad
[3/3] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
      https://github.com/sophgo/linux/commit/8f8de50d4bddf155b5e5c70072c3048829a90a98

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
