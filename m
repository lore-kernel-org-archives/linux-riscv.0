Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FDCC04A6B
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Z9ndzcFH4j0RMXTAcx5eRDUgwfTY4HTajMW3qacX3Hw=; b=geiPyLkX+eg1EzqTZSajR/njO2
	Mmk5FmUuwgZRNFlogBWh+A7xXuHFO388q3bgUPAmVmrk0ddEAX4Hf67Z5a3Xzj8Zi6khJGti8HSr1
	4TAw+d8Zggbd+JFoKMJb3Vr4RIzL7ywrGl4GWRApTP5YvwXq2GACH4Fu0GPvqx13+VGpAak1CCpw/
	ZRQYPEk79gJEUwHNEoKN9ouDlDBXlbc5xkVjTqM04HQr2Ksxbq91gv3FlnMCfohUUhJDsDajdfYn7
	O3RNuNEfA2wcm8J6yD8xJornL25CxYy9rDya5lHQu31oiFDXFmRpljGbp0qgbtClLxy1Xnh7vBCo9
	Y190uyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyzo-003U1G-2b;
	Wed, 20 Sep 2023 15:20:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyzl-003TzA-33
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:20:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c5bbb205e3so7723125ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695223200; x=1695828000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kk2Thqajxn+5QPLXXdk7+dj9CSM3S4Ko2jD+ybQ8uWI=;
        b=jMErGc8hWJ2cNzidiiOMrUUuu7c1xQW+jeW/6KBPVgkiduGARMIMCzQeelBCZc86Vc
         IYVd95e1zS3H4dDnMoQbssnSGiazRmu4ALBK9WTC6Zg361NXYnIXQPzKrKSlIDeW2EFP
         QO813Tp191OcpAUT2vssVypXAycvODMRaUQbofmM/oTFW5difIrfh9GriHknu7vP2Gcd
         3gYpTTsvY35DqhN3lZKQ+ENV+pHl/6wEg+UV9TbVzgU8+4MJ7QPy8t7sHnLrVECa1Wg9
         vDE7K15TFvafbk+Yo+EKGW9eOQ8QzhD9uWh57CE4kw1rmX2g3T+MS8LuQbQJVU42szRx
         McvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695223200; x=1695828000;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk2Thqajxn+5QPLXXdk7+dj9CSM3S4Ko2jD+ybQ8uWI=;
        b=Aeex7IWG5nNcZyoecFlq2nqtiFEM7+JKnMAgugpZG4uUQOZBEF/fgG0feXtSISo5Dr
         +kf1lErXliOxIHW+A2OtmSbL1rbnnZGzllB4Ii6/u4BLgwC2pbZZXCZbg9z5Oe63Pg5V
         C4RcD833ZXaYrR+koNTMwXdHv3/eFv1WLM5Qt8e+IH1v8SGWC8a0JFXsI9oTTPy0uJkL
         QABH03KP1zWf3NGAnfoQi8v8GHDMUeHl+rChyIiJ4F6G9YMI+dBjVuc0N/2aH7TYvgrh
         B1vbVekZCuNo4aJnf83KxLxJYsxXVDItam+Z5pH5MK7lK7X/nNfRvqKSQOx3tGVfxT4L
         DKmg==
X-Gm-Message-State: AOJu0YyEy4odQJTYmHeropcphduaGkKsjs/IP8t1IvgpqHcN5rw9Fpt1
	e0dxH4Y9SO6GVgwtVkrahVZhcw==
X-Google-Smtp-Source: AGHT+IEm+GMkfegDAUX6YBOkTavvdtrQAnalwKP6ybmwhgmW5os6nDyvCA5ShwDM+w4l32FvapmW0Q==
X-Received: by 2002:a17:902:f551:b0:1c5:a7b7:291c with SMTP id h17-20020a170902f55100b001c5a7b7291cmr3383681plf.12.1695223200249;
        Wed, 20 Sep 2023 08:20:00 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902b58a00b001bdbe6c86a9sm11970297pls.225.2023.09.20.08.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:19:59 -0700 (PDT)
Date: Wed, 20 Sep 2023 08:19:59 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Sep 2023 08:19:56 PDT (-0700)
Subject: Re: [PATCH v2 09/11] riscv: dts: add initial SOPHGO SG2042 SoC device tree
In-Reply-To: <ffe6a61a8879232aea7b86ff8aee5d681c6bd287.1695189879.git.wangchen20@iscas.ac.cn>
CC: aou@eecs.berkeley.edu, chao.wei@sophgo.com, Conor Dooley <conor@kernel.org>,
  devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, guoren@kernel.org, jszhang@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org, xiaoguang.xing@sophgo.com, wangchen20@iscas.ac.cn,
  inochiama@outlook.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: unicornxw@gmail.com
Message-ID: <mhng-09373969-fd57-4fa2-b0fa-470004f6e17c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_082005_991261_D62ADB24 
X-CRM114-Status: GOOD (  14.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 19 Sep 2023 23:40:32 PDT (-0700), unicornxw@gmail.com wrote:
> Milk-V Pioneer motherboard is powered by SOPHON's SG2042.
>
> SG2042 is server grade chip with high performance, low power
> consumption and high data throughput.
> Key features:
> - 64 RISC-V cpu cores which implements IMAFDC
> - 4 cores per cluster, 16 clusters on chip
> - ......
>
> More info is available at [1].
>
> [1]: https://en.sophgo.com/product/introduce/sg2042.html
>
> Currently only support booting into console with only uart,
> other features will be added soon later.
>
> Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 1744 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi      |  439 +++++
>  2 files changed, 2183 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi

Just an FYI: a handful of replies to this are getting blocked by the 
lists as they end up being too big.  I just went and allowed what was 
there, but future replies will probably require someone to be away as 
well and thus might be slow.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
