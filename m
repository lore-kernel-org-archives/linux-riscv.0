Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5031C25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ylbo0ri1/8WOM4TqbbCUYed6lIJm4ZYRmR/LLe5G/U0=; b=Ra/QUBHeZYey0I
	0Jz7inZRxEVae64dAYRtkH9A5dgMtCDB+GBKOSmnXCdHYlfdt+SXA6z/6aMemFmYgTk5fhAFul/oo
	Gocwg+MYQivpOYpuhGeskZzHuaBlEwLxzy89Gfux/mH20r/4kAUYLMpMfs+tCPfaY1bokFbsu2fLJ
	JQfCaKeNCHbrEA4/L7TdEHcz7oLG3XMFPUxOOFTitL/rSJgju600r5+ITZ3is+nwJtvw4FFpv1hS8
	5R8Uu0T+LYs9BlnZ9TWA5az3P85XhvKjGGno6kQHqGt3LnYOiA0nXZVjOwEdZk4GuqN6BgRMfywRn
	pExWXaQypJiZsS1a0qGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0Qq-00000001WQ0-0OmA;
	Tue, 28 May 2024 17:16:16 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9y9s-00000004llp-1HRw;
	Thu, 23 May 2024 02:26:21 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-61816fc256dso17500917b3.0;
        Wed, 22 May 2024 19:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716431178; x=1717035978; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=14MDcznVSAxWvh6NcnmWmS1Snv6rWvGAAp6hU32730s=;
        b=lYv2V0EChfSn54a6zMRqF7FS7xqhGkFcWjxSIv1u4y0vplRZWAzL0RrP7QCzbUN7tJ
         QygIFj9fS6UYF8uy+GHOAFDILYZMSht1cUlnP0LE9zQjxTIdDM0x7n2fBdAhkdzOmWuG
         qSYsiWpp56uX8DoSUf/lUEmr5rhPHGTEUDEn6xMDQ165/lkBaj0thL0ONV3Uga1j0bt0
         X3elj59PbhRUEkZeT2saCmD2oJorFJyRkTg2WFkwmOuzZKoaODu3KyS5hgQZ+W9CHAp4
         SRPASNGmladHDD1yQqa7LkNT9SYChjHBz2mF3jAWZ8cFcFSHd2pAIr5KL3GpyqLi0+uw
         qVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716431178; x=1717035978;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=14MDcznVSAxWvh6NcnmWmS1Snv6rWvGAAp6hU32730s=;
        b=o6lA1KX/TvJaFzSQsU8hR1YOoH/MhYAyMgah3GTwQWcAA3jBmNNdiEDuRj/ZNFW3WF
         L7ZTEV7jIFQpfi6Qnmxl09/fX8O2zig9NZjfHdUF5UYtIOwXtUQvI4CjDfDugdLiB6Dj
         o5zjiI1QdmYPK0jgalFkg7jQEM4NE14KV6oOSe5IuZV4MP/2OdhNavlZ9cRUyz57+/+a
         fXWER0QlayEFz1gB+GUQJAhcfF6/ZimqBqz7ORf7rH9Lt9Pr0WTWHfoaKEM2sNySlHge
         F4599o4sHb/6aHPu8rmW3PDqCYmSOm/G3iDFphbMUXA57dSaV3o1zeHb3Cvq+5OMIlOZ
         Gtvg==
X-Forwarded-Encrypted: i=1; AJvYcCUbdun+NOes2dzWuZH+b4WaQ62WMQS2Xnxc9wBP/9nZIs/3xazf3fm4k4QVrKQLkKuxrUlUDBKt2ct1pMCYZ7hOvz4Xp1S6KzIsyxwMYEUyzg/zpd3R58CM99yhVoL1AzNVl2fWZ63xvEU31zQtVaHHJWqr1HU=
X-Gm-Message-State: AOJu0YzLyD+daT2i3oSdVBITMZVfsoBIDo7yVqAMBFO3cZe13vn1I57a
	E2zIYt6AoMBrJKqU9pWxOjzBw/IyOcODdFZT8zTmRT0GcenIQ/HVbwKdjOR3CDS0G7xy6MVLdie
	UKU98ooFdrSX6oBhFEthnUbt+FF4=
X-Google-Smtp-Source: AGHT+IEzZ3d/y1htQ50ghcV3RsJuT9Nmb23jVS0kW1Opjrk11BX2iM4RFV1kES07q4M/y7BLnPYzixD6kqgZrYjmEI8=
X-Received: by 2002:a0d:e64c:0:b0:627:dd88:5f1a with SMTP id
 00721157ae682-627e46cf82amr36209267b3.21.1716431178362; Wed, 22 May 2024
 19:26:18 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Thu, 23 May 2024 11:26:07 +0900
Message-ID: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: privatesub2@gmail.com
Cc: aou@eecs.berkeley.edu, bigunclemax@gmail.com, conor+dt@kernel.org, 
	contact@jookia.org, devicetree@vger.kernel.org, fusibrandon13@gmail.com, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, mkl@pengutronix.de, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	samuel@sholland.org, ukleinek@kernel.org, wens@csie.org
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_192620_440497_305E3823 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 28 May 2024 10:16:13 -0700
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

Hello Aleksandr,

I had coincidentally developed a PWM driver for the device.
Based on my experience, I find that dynamically changing the coupled
DIV_M value is quite complex.
The current approach has limitations, especially with resolution
changes, which can be unpredictable for users. For example:

  1. Enabling channel A automatically selects DIV_M.
  2. Enabling coupled channel B with a specific period may result in
poor resolution for channel B, as the DIV_M value depends on the
period of channel A.
  3. If channel B is enabled first, channel A may not be enabled if
its period doesn't fit the DIV_M range selected by channel B.

Additionally, using APB as a clock source for the channels would
further complicate the process.

To simplify this, I suggest (maybe for the future) specifying these
values directly in the Device Tree like this:
```
allwinner,pwm-coupled-channel-clock-sources="hosc", "apb", "hosc";
allwinner,pwm-coupled-channel-clock-prescales=<0>, <3>, <8>;
```
This would delegate the complexity to the DT, making the resolution
predictable for users.
As a bonus, it introduces a way to select clock sources for each
coupled channels.

For the meantime, I think it is enough to use fixed "hosc" and <0> for
regular use.

Looking forward to your thoughts.

Best regards,
kikuchan.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
