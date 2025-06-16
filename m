Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4A1C71136
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZuMp8FDd8zZzyUzKZzGgDqcnhGF+B58Bz7JpLkhB+c=; b=rvYOSOJufSdFKi
	04ToIWuDfHegZ56jxvYIHGcZgUD3eR9NvBkO7tWRlNeiL0a+xIm4ru4W2ayubjj3PfbHGFlOEi/Mt
	ligJvEOV5hI5TbV2zNw07yvi+c0qwrGV5XUEz4UpNHj4njFGxd/IpRtm4APFi93MV1j5sWb2QqKVE
	ATL1BdcsrJpEaFOWvDjKyMfx3kbRZ9joepjqxbxTS2ph3UYUPICbOn1cPZVIfKmMtD3INBfoX8Z/X
	u5uxqRpE53woCi84C6DafYt7xxVGcbuCUAVfpRVzgKRIQsqigtdCv/0oh3ta8dBHiFMnhlxEbIC+X
	cJRYhoZJA7ZwWjE/krdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4o0-00000003jfg-0Kg8;
	Mon, 16 Jun 2025 08:03:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Vg-00000003gLd-1IsN
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 07:44:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a5096158dcso3615356f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059843; x=1750664643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=DaErOSKspxR2pKqvRdtKks3iD4Y/K9A+5M7FsaCNomgng/Sbgdq9OuGu2qYEL8FQvA
         OLR1C9g/np/D3/5zX4OM6KDhzoJ5ovL3SLWU2xSh3BaKD/IhZwIP/LHuFdHVk3K1qnrh
         WkVLKX88mYjx1epoHpuGZ3O7+7TgoDOgQ1SjIFq8RfHLDCT+RPkJE4C9yYlzHZZ7nCWb
         KCBd0hmfiIK+X+FNML1Y6k5GrxoeJ6AFErXTA7I0wkF/ah2D6TqFXZXdl9OeYdEFmV6f
         c2Bs9wvNNkaOzUdxvmX7mFKz4+geuw49LsYQJ01OSD4hMTUemw4VZFNMlxVdxTs6s7FA
         nOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059843; x=1750664643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=X2pe+NR6YYtyCmLeHKV07pHPFKB532xfeU/w8UqT+T48T8IIOz5AN37QxAYIWG2JHO
         3slAJdwuAnA16HMJt5ycg9DgVq67yNhVP6qOgG201Oi+5hwA9H4I0OOXONhmXhjjNDyY
         nWMqY073QMfBkbJ6fwO97czO02ijK1ozdRRH73d+ZZKHafIenXRU9rglxYFoP+h/w/5n
         gV8OHw+EDf7HkMgikOyguKkfbFQmdxIpEwq9kX/qsd622HYh/lRdXOg/3pA3OUp9q3wj
         BiDlC3jCBkErDMj/q+8ui46lwvCcUPorpQP4GZGLsmvEdIJ7KbQYr7R6VY9qwAxkIOl6
         WuUw==
X-Forwarded-Encrypted: i=1; AJvYcCWuS7YU4epI3Fd27cDdcGgfcJmJY9bo6aa8g1Y2BBpWYSQ/LC8V/s3rm29lXtQdPjoqsGciibPLJF4OWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8cdJRKC5L9YYv2Jn7rRtCUPfhYX0VSiLzINIeVJxvN6arJ+j
	8Jha0W6W0h+FkTSvIeho7S+w/28QkJq9AP7msGzYdNnxdziSmr0pZhpQnd1U9wfju+0=
X-Gm-Gg: ASbGncvRF+iuVjR7OSmj2DC4tK2pTWDt+50UKeBS+i89tdBf40I3anH/LLMafeq7ymN
	uIC78MOReKM4jrcLZOdTSRcJRosQ72DtbW4eodGlK3/kuHPaGxviIQ5t5iZs6TT85L6tsQPBlYU
	+3fW6v1HS6UMrlL9gCIA89E5WgNJ4vnMoCA6UpcS8Wa2vxnCpUE+r4el7jBQRWq4G8yjyvaHt1u
	7nTN3ZV5z33beEyOowTIpF5suSGt/cEAa/rvVCKSg/pLFcQvWINo6GNXbaR5x9+aE+7rynkiO7V
	aV45xvDbgKG9WJsvDkXvweNf3hHezJcThBnA+xzStRmZiBN3TTgN1eJu5gVV1Ow=
X-Google-Smtp-Source: AGHT+IFyiwrOAI2w1hU8cdsv4G6PwQ9rykHzyJGCDN95ThomN6k4mm9h9BfNGYN1cWwJ8JWTOJssQg==
X-Received: by 2002:a05:6000:400b:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a5723af786mr6649593f8f.42.1750059842782;
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm134543945e9.37.2025.06.16.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vivian Wang <uwu@dram.page>,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
Date: Mon, 16 Jun 2025 09:44:00 +0200
Message-ID: <175005983908.15867.5595150226500672210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_004404_359282_43145407 
X-CRM114-Status: UNSURE (   7.40  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 17:25:33 +0800, Vivian Wang wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> 

Applied, thanks!

[1/1] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
      https://git.kernel.org/brgl/linux/c/e6382fcf989074566bb9a54bbd3c514d7bb99397

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
