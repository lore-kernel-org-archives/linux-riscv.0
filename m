Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D22EC27C53
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 09:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=z/XiE8FlJBwSZ54H6LeNbElHcmUrm6C4Z4Kux7cZtP8=; b=bsSHn4WXDE6yDR
	52BVUzu4nR+8Z0FL9K0FS2+jKtf2wjmGg5j44szWs9kps0+2XupUEh7zaCp6KzFHBAghXWi+d8Bnp
	2mRwsyuBSUYXsScP1H7Qa/5mL73V7tVl6ApdDnlGBgO/vcCzEpB18zbHhFMNBjeciQNLcNuN+xupE
	UnOYvbo7NXqK4jEfR+Aqje8D7NVmP1EFXJWUytRVku7v4Bc942LkbQPpzJRgqNahJy5+I4XovpNwh
	TyhxzunKHswS8PEWpIYiQfnG5aA2c0wgDO+rGKwvsPwTMApOJ/AvtJLwHkFVmbPWp4uQDMHR0OK6g
	9Fw0hA/8/XeiKB/N+QkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKwp0-0000000BlW5-3SX4;
	Sat, 22 Jun 2024 09:14:10 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKwox-0000000BlV2-3SiG
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 09:14:09 +0000
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so308632e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719047645; x=1719652445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRqQl8uo5OtW4jawNXSK5YjGDnMPsH/r+7OC+raT/cg=;
        b=UKeN9+VgNhaxUgDKv1rx/i53q9vgjviLpJ4zUQ3ZCXWP9Agy9Jm497jccMvztx9xZF
         39/nGsNOw28vxlnSPaZRQp3UOgAtI9gxcNoKkpM9lfqe2PCZsvaKAq8CuV2bhFyngD3b
         jp5c7HlVts37++O+5ICrCzkktH6Vao3BGFlC9+VdVVkUN+qWjFr/THNhHt7nTzT7g0B1
         jQVcidgcKYG72Ok9dgkcU1dzbDMg4ZoR8MfYQid0H+Hnl8XhIstG0HuRgHQAjI9Jwg0u
         MxCij5eGGmWcIF/HrELLzJ3xSyxKg5qIbpXf/edGf47/nifpI0YgZqtz5L+mslH41/Et
         UA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719047645; x=1719652445;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRqQl8uo5OtW4jawNXSK5YjGDnMPsH/r+7OC+raT/cg=;
        b=RS8qwJk+3ApfxbPi1iMLoBBddg+DOraFUTDoQRHipOAZ6dFc22lqvb8qjkMZWtGw+G
         F1zrp/5BlfQHssLkS9UJXpfdYPLmrqwiVSVBr5hTWvLr5hWCcIsj4sXaM93fx8GeX72e
         7q9Pb7O7zoEtvDykpbyu2KV/8v07SyceGNq8asI5yQdwkVB9pVfafjCvTDEQfS8D0Acp
         i9m02i8P10WPLbzcR36dGwYgkkMj+FQ7meBaucBRiIR5kFGvUQPK5HHGAcKX0FGhrrFO
         0WF5xUMql9XtjL/ScIXGsvOc0ehZLDRbWsnC3o888YhdGf5U4BFDU/0MJ/f4I1NG04PQ
         OJIA==
X-Forwarded-Encrypted: i=1; AJvYcCUA4sVgp/yOHjcZUkv//1TTsGz7IHCJRbpy9B8acrtrtBo3kV8jCmUJd/f3jZm/vgKti0GiXb65ZxysMxiulrnJDjWEd8aPAlA1aqsWU1jP
X-Gm-Message-State: AOJu0Yx0qGmfCgG8eF0m6JVtNt1X2bSqGA+RkJJYqNv47nrAOBV0QlAx
	LnZ6Ed8JkZv70VMCG5aYzpA/6+tWe7jIIwyprEYyb0bn8TMp90Lt
X-Google-Smtp-Source: AGHT+IHJGOCTYSjWGWICe1a7Ey23OXHw285FjRTgowpE0FVV64ic6M/3PuuUaM6lyNhVILMGR8S5RQ==
X-Received: by 2002:ac2:46d4:0:b0:52b:8c88:2d6b with SMTP id 2adb3069b0e04-52ce061077fmr39891e87.11.1719047644689;
        Sat, 22 Jun 2024 02:14:04 -0700 (PDT)
Received: from comp ([95.165.92.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd76516f3sm409314e87.151.2024.06.22.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 02:14:04 -0700 (PDT)
Date: Sat, 22 Jun 2024 12:14:03 +0300
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
Message-ID: <20240622121403.7effa777@comp>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
In-Reply-To: <20240328091835.14797-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_021407_926958_A320D013 
X-CRM114-Status: UNSURE (   5.21  )
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

Hello Minda Chen.

I applied your PCIE series patches to v6.10-rc3 and v6.9.0, works like
a charm - thank you!

So Tested-by: Alexey Lukyanchuk to all series.

Hovewere i had to fix some minor issues, you can view the results here:

https://github.com/skif-web/linux-starfive-vs2-mainline/tree/strafive-visionfive2-pcie-2

Hope it helps.

Hopefully to see this series being eventually applied soon.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
