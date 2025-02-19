Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DC5C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 02:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tQCsuy6/r0HREb/5az+5uc3jWKOOXke7O2VIHSSXm0=; b=WoTB3OtfoJiM8z
	cG3GpUjuz10VutdQ0vG3p6GaCdk1yA0/kl9X+27KDUhsQuxeKPyr1fJ8JT3JnGrtUW+9cz/j2r7Ie
	jRgdYgzCuju9jfmgmrjZRxnJdWOW56/8jNXuKrUlatgpim44Sm5OtarO72IMi3tHigLJbYt6tDPhS
	nHrFFVkIZik9vBlJjiUDnGc9/nQH38C7dBaGlu7SsZCV0eb0LJp5bM9xwPfQPhBinmqosW3zsM6AF
	s/37p8dWaXkqK1orbngRD2tfvBTHsAMBRKlT1lCNhy2PBb1xl4U8LP139F3VdiYJK7drAY7GSWFO4
	S8nLMKWiWlAlqpDltPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZRs-0000000Abgn-057g;
	Wed, 19 Feb 2025 02:04:28 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZQ5-0000000AbSo-1HFv
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 02:02:38 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c07b65efeeso527540185a.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 18:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739930555; x=1740535355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=980SAjG821KkBNdaRx+A15s8OgNFk4ezjXKzzUAttK8=;
        b=AuBvNFbgcKw7Tk9+2PbChrdySTRl58Pq6LDflsWaBtOWpOggF7kaJsVENBo8j5fgZQ
         tFo/cmj//8S0yoFUu05uOJMsXB0L2epMerJbXWUFI+6C3tEIyQtS6cqQdubqsnQRcwQZ
         SCPeQOXj0Oc3gX/QDzbNAuIHFSDYnF1uXzb8WRAHudTTh+6FOtKsq1t+g9jnB5mwYIfm
         /FmDOCVngIHo+FrA0pE6GpqUZ/pxoXdBpisBxS+1GymYtJaze3sVmxSJGRP6gfN3I3bM
         i96m9mLqDZZhycfTmn6TrsWHAiATtH2kR6elcRxFithySooxmLolPtYju1rHHgsK6YpX
         Im+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739930555; x=1740535355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=980SAjG821KkBNdaRx+A15s8OgNFk4ezjXKzzUAttK8=;
        b=iRNM0uih7LBALEqGyedHOyZ0gn95HlNya+H/LTFzQ3thiuEDjAd0fKyMHeUifOauds
         NmhtNEfhVLKdXhQhLXAfEN7ekR9TOT2dPi1TlNDYj+gRwe6MMtv7poEtHhKwlMfA1H8s
         gMjl8bxbG71Uwr9AzDN9p5a8mcU4ltkTawqb4daQNuS9KXFQWj0wagVTWMka1uXMqzkN
         gntcBhTKhtBykEeicwlJ6no32oxsNli1KLS143PywQIVblwHuSQftgjRQNGXWshmBFhe
         B08a4akFyDeP25UTDK95ssrzY1MpApRDNvCYve9m/QIop3mO2ljEzkNm8LZ8OgX4b7l6
         4Afw==
X-Forwarded-Encrypted: i=1; AJvYcCXNOj/brHGp1sA7CHj3+gxEOJpMndXbrFCqJtAAQZWOcM8DMwY4KXP8U3AYvDQy6lrCwuZSS46DRb0iRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGETM2gTlGYEss3BlIuit+368J1Xzzd7RUQrX5G7QO6pbfIUV+
	b2MQ75pZG4PxVwdcMc5r6A+Im+ZogEEpS+unJc+ixcCfqq6uScyI
X-Gm-Gg: ASbGncvsxUnhhNPU+4syuEvxq5DATgoMMMc1Rx2Y6fQvU7nNGdQTM3YmtGfYsFOnoo5
	5a31Syj5EumPx7MWWVqEjjkPQ6SXiLIobsi9tIxyv7i0tVAmL2uVuLQyYR7yb5ENqhGy/lsMBaV
	PMu1PVWUk+z/6QLHLHfm983Dykh0UT1SypADd+ed2WpxtDeKeTdVJvSg7WChGm3mz3XLX9yaafc
	bwAT8rBqg3kIaPfidnr8X3G1c8xyWWaI8skl534pF2OwWr5kDw8xB5deNB6WVpiP5U=
X-Google-Smtp-Source: AGHT+IFao5uYt/opWCP18gBhrPbDbhzTsVioAhM4PEXmi9PCMUnZww8XRVKOU3gkOFPTX9L4VDhHrw==
X-Received: by 2002:ad4:5f0a:0:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6e66ccc1141mr227209846d6.13.1739930555333;
        Tue, 18 Feb 2025 18:02:35 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e67ac30bafsm32452896d6.111.2025.02.18.18.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 18:02:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	sophgo@lists.linux.dev,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 0/2] Add pwm-fan for Milk-V Pioneer
Date: Wed, 19 Feb 2025 10:02:19 +0800
Message-ID: <173993053303.993263.3269292978255036963.b4-ty@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739351437.git.unicorn_wang@outlook.com>
References: <cover.1739351437.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_180237_341933_5BE87DAA 
X-CRM114-Status: GOOD (  10.75  )
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

On Wed, 12 Feb 2025 17:41:44 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Milk-V Pioneer uses fan as cooling-device, and speed of the fan is
> controlled by the first channel of pwm controller of SG2042.
> 
> This patchset depends on another patchset for the SG2042 pwm controller,
> the driver part is now on pwm/for-next [pwm-for-next] and the dts part is
> now on sophgo/for-next [sophgo-for-next]. If you want to have a test,
> you need to apply the corresponding patchset.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
      https://github.com/sophgo/linux/commit/62cdf0a06dd5a650e4ca95b6f3a13daa48cf517a
[2/2] riscv: sophgo: dts: add cooling maps for Milk-V Pioneer
      https://github.com/sophgo/linux/commit/f047a9285f9f3fd5c0d5ae53af350b8b619e470a

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
