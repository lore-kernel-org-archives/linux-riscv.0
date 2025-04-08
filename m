Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5E2C369A6
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmcSlWjFawFmzNRs2OH5ruUyY/E3DFkOpDu9gEtEric=; b=Ev5vsRLn9pHawo
	KvldNoGkR058+9ZPAXGC//7TnCH4hxnaNpTbuc0ImtBc+0IoDcCDPLD8iQstc9KMnbWgszrfgJGpH
	m8pRi67Otd5Y8CAp9V8bITcxuOBGOdf4b0taurS+8HRNTwIJo+o2ObfA/kN806tgzjbZCDiNdYOIT
	yzpyHzb/OObQIdDy74O0PRpS+jKhkIvAd5nhID5ta/IjOH8qv/i2XgtiYePZf59W7hfzUKD+k1yZJ
	AGkln5CtaytjVRVEYtfKis5hRQydH0su9JqNzrmOapuixpKFG0TgXAtn3nBLHAaBKdMfBghG8d3Ug
	R+VP2HXh23Ow7WNwYX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dfp-000000056ma-3EOQ;
	Tue, 08 Apr 2025 18:27:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CH2-00000004tDH-2j7m
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 16:58:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so50665525e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131487; x=1744736287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=Vbd9Wr5jY6yUfYJuqm9CfPiGbWjEoOul4IGO7RiruHtR9jwtVi3rN1azeClFpzgYZ9
         tEgEfT1SCPRwa5DqSBQyObNiSDTTUpl+VAC8hhNlQz+R5yxaPybxN5IEEz4yHKzpPCTZ
         aS//GVzFeOlEqOJvYAtFwux2bXmuPQCt56EsGnVdTjNmXn7BB7gL19nqGpQGEQsXI9Gt
         vZHSwDk4Oti7jS1HdjycEYC3vEWkws0z4ALNxt8LUobRk2DOg6QtFqhBoDpLDXyeTZeP
         d74lx9nsVqnkWjB3OvJezDNjUF6jX4HAk+k5y3lBRIHD1XlDSyP1X/cfU8J7ufdpYEN2
         4Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131487; x=1744736287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=bCu+zGzIqkOQmwyC2I3/VtD443jFQCeuZwVHtOz684eDmdDyYe83WxJRS7Pxq8Ns+a
         EwGYtTmzatHHdNFIjJMRVvb8dAbTkQxONBbZxOS7JnSXFMZSraCxb/a9nV9CGqOxC6zx
         i/R6B+JAcLM4q798uv80yF7NdEzCp9noLlSgDTymHlKg/wumjqddbBCMDRLmIRXp9h4V
         HJLLA8iLZ19eoWj2/l7A1GlQvd8nYLI+3CAjnTdHFpN+CIHo4fsluc+AaplV+7sL83zR
         CKRQKsprU7AezO9O7f8rsIlHuS1OOeZJNTNsurjPEV86ExRUE1EFwZ0TlezCtZk578+x
         hEwg==
X-Forwarded-Encrypted: i=1; AJvYcCWDe8rftXkObZkJWXWreQJ9mlfPjpRdrRHZgWODWCvCu/zLqaDO94HGAhr3in3504lWUizW9uSND+w0Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznkyvGGV5vRS2xBt09cqYR2BnMlgHa3z8YQgZiqU8F3Fxm/SsZ
	td4werOCkq1T7CIGbVXD/YVvdfwjSTy9ODl3mtC/THD6MMUntrC13cRtMtxsKlQ=
X-Gm-Gg: ASbGncv99yWDOPzWROY8dH5ZZA3QHtKstiGc4sdUAKDM3hDYMe8+WO3jxZchDnGv0yL
	F258Swkn084U4Pm4osvzr+TDzuPgq0nrpvUy8xXiTjLbVos2WsKUEoTFJhrMhMweeyD/V5m49cd
	c/XS9ad6A3adcp127YqxYLKYKHBNv5JjE7R8CiFmOHHD2dBg6HW8A7e26oHzqEv6pr9BzF4DQop
	eiPYPcP3ALLzEQg7fnW4mfhiQM1/sYp3EGnmsKgtXPLx6cFelmmFtkX36l7nNcz7iI5WExY33cu
	Db+n7yWSGvZQLHEBqW1CegHireWyNHPo550lsoEB4PFW
X-Google-Smtp-Source: AGHT+IFGsRSNGsLurl8DoyFapSJyV7TtJ4uGe3SGSEX3BrkLYJ/yVCM++z6f1tjo7zrernLeUKYo4Q==
X-Received: by 2002:a5d:5f4e:0:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39d6fd3647fmr10095287f8f.52.1744131486678;
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6a60sm15141709f8f.29.2025.04.08.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
Date: Tue,  8 Apr 2025 18:58:05 +0200
Message-ID: <174413148280.131421.6673320812296091453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_095808_950680_8F92AF56 
X-CRM114-Status: UNSURE (   8.39  )
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


On Tue, 08 Apr 2025 23:11:20 +0800, Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> [...]

Applied, thanks!

[1/1] gpiolib: support parsing gpio three-cell interrupts scheme
      https://git.kernel.org/brgl/linux/c/27986833e8e675b6c17654d13623590a46f9033e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
