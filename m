Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFDACF58F0
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UACaK+Pbtf6qrsMEicnX4gxY0j5d0tpefj5W7ax8ZNI=; b=mpZWIBWXfUgkB34CN2mVK/3f4y
	57v38v/JJ7Tj21lP9HSeN+YkPy5FXpgmne2ws1/2x5jzNQAHgwShYyZZKi9dsn4Ssdu9SskOlIBDJ
	DyxT10UyNLbkmqOryW7hAg3F0jQsBYRpUxQ5LoyD+TfWCsbX0P3K0ipU3L0dYKIYHyBSGsVIIIRYX
	bpyA3zdWpSDyWYSzDOVBPoAA4YhUh6dGE3fey9OvIu9ENI88207TA1eMXb1UmcrS1/w3wy86P5BkR
	Z2p+lX7/Nf7OuSPmQixPcuWNbtfVglaLbPPuYpwO/Ztj8yw8K0BTjLANw4O9TzBNMAFj11MDFuQzw
	Le9/93Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZI4-0000000BozH-1fUo;
	Fri, 20 Sep 2024 08:47:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYwU-0000000Bkmy-0tIm
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 08:24:43 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so1123850a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726820681; x=1727425481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18bFlmoHAy/k1n0ja9d6oNofVKOr2ShiamuID3ftTZo=;
        b=PZ+fwGieeGLu3Y2fazTRDlGXN7XNgIvmudOtOOtYivaMgFXQNsH75vcuogVUphbqQQ
         8ScT9RhR7jLt9SZKB/g8R71xE+zcfr2rq6WCFqfsE3Fs+p5WnlZ+UpIZ+Ubro4kuxwdt
         Jo/pNk7BU/pVgugGnij3/IYgd84w49r+hNTtJq3O3/yQRGcWLud5en3b5bw+NOSRtR0n
         JXBqOcaHb3SHmzDxfm7uzTPWa1D9e00u6vppddPHL4DvtpIZupQdyfPxX3e5wMbvkLXG
         i5iKoXyzGku9sibQXiEddXrgHnfVC0HRQIj81dcBThr/S64etkg2eeuoG5jLszyEhYjZ
         mC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726820681; x=1727425481;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18bFlmoHAy/k1n0ja9d6oNofVKOr2ShiamuID3ftTZo=;
        b=Xq/epOvsXQWjGNDDsNxehsF6fjXdg5XyjbpE1vG8aSu1qTJIMdJseed7T41dTDvDI/
         Y0N2m2WNaLd6dchPVD4MVUYZtL36FurxRuudG9kDj18cW0AmMNzfzv21BqW7y/+DJ5A8
         aYKn2uMNRKdzWwzE61ns9C4AobKpKZ8jkQQr9PTvbeqikcAwukl+vHS2bfY0ARGu8Mb1
         KxHEHy0hRzj8AxSDo4xA5z+6468AM0Jwhpgv6Oqqekc0YGu2r8GvJNuxnynJPlHaNX9Y
         jhruIUZPWFTA3qVd9q7zBnDqYwDh45LynJCAcpF9iRSnAgDjVG/Z7l2ahwG6tXtFovFV
         p3tw==
X-Forwarded-Encrypted: i=1; AJvYcCUpqRDODATIPSiPWAl4X0cJVyGhv+OhJ4/K/7zsqVxLmEAhnNDg2zPIoYPdGYI7BQ/NZ1cCv3e7CAFRVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFsNIMpGrsXvjAKP1YvZcGiNrY/odUXR6GayJIOHAHhHuCe8kw
	NQmYRvkDmz4SKwkYkDMLqBFhCjI+tm6SudzCRgzfOUfn9/Mxvb++QGbiNBkmMSE=
X-Google-Smtp-Source: AGHT+IFSZtKOOZ0ZGtfJy8TSl2mYrPI9rQ+0czpD45eDZJ1l4epVAz6I6h9Cl8Y9/3UZm+rxKYdIXw==
X-Received: by 2002:a05:6a20:cd0e:b0:1d2:e4dd:dba1 with SMTP id adf61e73a8af0-1d30ca2006dmr2657696637.25.1726820680549;
        Fri, 20 Sep 2024 01:24:40 -0700 (PDT)
Received: from localhost ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f874fe7sm1252593a91.30.2024.09.20.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:24:40 -0700 (PDT)
Date: Fri, 20 Sep 2024 01:24:40 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Sep 2024 01:24:32 PDT (-0700)
Subject: Re: [PATCH v2 0/2] riscv: dts: sophgo: Add i2c device support for sg2042
In-Reply-To: <IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
CC: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, unicorn_wang@outlook.com, inochiama@outlook.com,
  guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, chao.wei@sophgo.com, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: inochiama@outlook.com
Message-ID: <mhng-3dc6780d-2176-4f40-80af-ecd595f5f361@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_012442_443290_9EA9C6D2 
X-CRM114-Status: GOOD (  11.64  )
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

On Sun, 28 Jul 2024 19:12:51 PDT (-0700), inochiama@outlook.com wrote:
> Add i2c dt node for sg2042
>
> Changed from v1:
> 1. split the "interrupt-parent" change as a separated patch
>
> Inochi Amaoto (2):
>   riscv: dts: sophgo: Use common "interrupt-parent" for all peripherals
>     for sg2042
>   riscv: dts: sophgo: Add i2c device support for sg2042
>
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 54 +++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
